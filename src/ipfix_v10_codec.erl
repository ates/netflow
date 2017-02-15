-module(ipfix_v10_codec).

%% API
-export([init/0]).
-export([decode/2]).
-export([encode/5]).

-include("ipfix_v10.hrl").

-define(TEMPLATES_TABLE, ipfix_v10_templates).
-define(TEMPLATES_TABLE_OPTS, [named_table, public, {read_concurrency, true}]).

%% @doc Creates the ETS table for storing templates.
-spec init() -> ok.
init() ->
    case ets:info(?TEMPLATES_TABLE) of
        undefined ->
            ?TEMPLATES_TABLE = ets:new(?TEMPLATES_TABLE, ?TEMPLATES_TABLE_OPTS),
            ok;
        _ -> ok
    end.

%% @doc Decodes the binary NetFlow packet.
-spec decode(binary(), inet:ip_address()) ->
    {ok, {#ipfh_v10{}, [proplists:property()]}} | {error, term()}.
decode(Binary, IP) ->
    %% try
    %%     decode_packet(Binary, IP)
    %% catch
    %%     _:Reason ->
    %%         {error, Reason}
    %% end.
    decode_packet(Binary, IP).

encode(ExportTime, FlowSeq, DomainId, TemplateId, Records) ->
    TemplateFields = encode_template_fields(Records, []),
    Count = length(Records),
    Template = <<
        2:16,                               % FlowSet ID, 0 for template
        (byte_size(TemplateFields) + 8):16, % Length
        TemplateId:16,                      % Template ID, should be > 255
        Count:16,                           % Count
        TemplateFields/binary               % Fields
    >>,
    Fields0 = encode_fields(Records),
    Fields = pad_to(4, Fields0),
    DataFlowset = <<TemplateId:16, (byte_size(Fields) + 4):16, Fields/binary>>,
    Length = byte_size(Template) + byte_size(DataFlowset),
    Header = <<10:16, (Length + 16):16, ExportTime:32, FlowSeq:32, DomainId:32>>,
    list_to_binary([Header, Template, DataFlowset]).

%% Internal functions
encode_fields(Fields) ->
    Encoded = [Data || {Data, _, _} <- [encode_field(F, V) || {F, V} <- Fields]],
    list_to_binary(Encoded).

encode_template_fields([], Acc) ->
    list_to_binary(lists:reverse(Acc));
encode_template_fields([{Field, Value} | Rest], Acc) ->
    {_Data, Type, Length} = encode_field(Field, Value),
    encode_template_fields(Rest, [<<Type:16, Length:16>> | Acc]).

decode_packet(<<Version:16, Length:16, ExportTime:32, SequenceNum:32, DomainId:32, Data/binary>>, IP) ->
    BinLen = Length - 16,
    <<Rest:BinLen/bytes, _Next/binary>> = Data,
    Header = #ipfh_v10{
		version = Version,
		export_time = ExportTime,
		flow_seq = SequenceNum,
		domain_id = DomainId
	       },
    case decode_flowsets(Rest, {DomainId, IP}, []) of
        {ok, Records} ->
            {ok, {Header, Records}};
        {error, Reason} ->
            {error, Reason}
    end.

decode_flowsets(<<>>, _, Acc0) ->
    {ok, lists:reverse(Acc0)};
%% Template flowset
decode_flowsets(<<SetId:16, Length:16, Rest/binary>>, Domain, Acc0) ->
    BinLen = Length - 4,
    <<Data:BinLen/bytes, Next/binary>> = Rest,
    Acc = decode_flowset(SetId, Domain, Data, Acc0),
    decode_flowsets(Next, Domain, Acc).


%% Template flowset
decode_flowset(2, Domain, Data, Acc) ->
    decode_templates(Data, Domain),
    Acc;
%% Options template flowset
decode_flowset(3, Domain, Data, Acc) ->
    decode_options_templates(Data, Domain),
    Acc;
%% Data flowset
decode_flowset(Id, Domain, Data, Acc) when Id > 255 ->
    case lookup_template(Domain, Id) of
        false ->
            {error, missing_template};
        Template ->
	    decode_set_data_fields(Data, Template, Acc)
    end.

decode_templates(<<Id:16, Count:16, Rest/binary>>, Domain) ->
    Template = decode_template_fields(Rest, Count, []),
    store_template(Domain, Id, Template).

decode_set_data_fields(Bin, {Size, _Map}, Acc)
  when byte_size(Bin) < Size ->
    lists:reverse(Acc);
decode_set_data_fields(Data, {_Size, Map} = Template, Acc) ->
    {Set, Rest} = decode_data_fields(Data, Map, []),
    decode_set_data_fields(Rest, Template, [Set | Acc]).

%% Decode template flowset fields
decode_template_fields(Bin, Count, Acc)
  when Bin =:= <<>>; Count =:= 0 ->
    lists:reverse(Acc);
decode_template_fields(Data, Count, Acc) ->
    {IE, Rest} = decode_ie(Data),
    decode_template_fields(Rest, Count - 1, [IE | Acc]).

%% Decode data flowset fields
decode_data_fields(Bin, Map, Acc)
  when Bin =:= <<>>; Map =:= [] ->
    {lists:reverse(Acc), Bin};
decode_data_fields(Bin, [{scope, {Type, Len}} | T], Acc) ->
    {Scope, Rest} = decode_data_field(Bin, Len, scope, Type),
    decode_data_fields(Rest, T, [Scope | Acc]);
decode_data_fields(Bin, [{Type, Len} | T], Acc)
  when Len == 65535 orelse byte_size(Bin) >= Len ->
    {Field, Rest} = decode_data_field(Bin, Len, field, Type),
    decode_data_fields(Rest, T, [Field | Acc]).

decode_data_field(<<255, Len:16, Value:Len/binary, Rest/binary>>, 65535, Scope, Type) ->
    {typecast(Value, Scope, Type, Len), Rest};
decode_data_field(<<Len:8, Value:Len/binary, Rest/binary>>, 65535, Scope, Type) ->
    {typecast(Value, Scope, Type, Len), Rest};
decode_data_field(Bin, Len, Scope, Type) ->
    <<Value:Len/binary, Rest/binary>> = Bin,
    {typecast(Value, Scope, Type, Len), Rest}.

decode_options_templates(<<Id:16, Count:16, ScopeCount:16, Rest/binary>>, Domain) ->
    Template = decode_options_template_fields(Rest, Count, ScopeCount, []),
    store_template(Domain, Id, Template).

decode_options_template_fields(Bin, Count, _ScopeCount, Acc)
  when Bin =:= <<>>; Count =:= 0 ->
    lists:reverse(Acc);

decode_options_template_fields(Data, Count, ScopeCount, Acc) ->
    {IE, Rest} = decode_ie(Data),
    Entry = if ScopeCount > 0 -> {scope, IE};
	       true           -> IE
	    end,
    decode_options_template_fields(Rest, Count - 1, ScopeCount - 1, [Entry | Acc]).

decode_ie(<<0:1, Type:15, Len:16, Rest/binary>>) ->
    {{Type, Len}, Rest};
decode_ie(<<1:1, Type:15, Len:16, Vendor:32, Rest/binary>>) ->
    {{{Vendor, Type}, Len}, Rest}.

lookup_template(Domain, ID) ->
    case ets:lookup(?TEMPLATES_TABLE, {Domain, ID}) of
        [] ->
            false;
        [{_, Map}] ->
            Map
    end.

store_template(Domain, ID, Map) ->
    Size = lists:foldl(fun record_size/2, 0, Map),
    ets:insert(?TEMPLATES_TABLE, {{Domain, ID}, {Size, Map}}).

record_size({scope, {_, 65535}}, Total) ->
    Total + 1;
record_size({scope, {_, Size}}, Total) ->
    Size + Total;
record_size({_, 65535}, Total) ->
    Total + 1;
record_size({_, Size}, Total) ->
    Size + Total.

typecast(Bin, field, Type, Length) ->
    typecast_field(Bin, Type, Length);

typecast(Bin, scope, Type, Length) ->
    {scope, typecast_field(Bin, Type, Length)}.

encode_variable_field(Value)
  when byte_size(Value) < 255 ->
    <<(byte_size(Value)):8, Value/binary>>;
encode_variable_field(Value) ->
    <<255, (byte_size(Value)):16, Value/binary>>.

-include("ipfix_v10_codec_gen.hrl").

%%%===================================================================
%%% Internal functions
%%%===================================================================

pad_length(Width, Length) ->
    (Width - Length rem Width) rem Width.

%%
%% pad binary to specific length
%%   -> http://www.erlang.org/pipermail/erlang-questions/2008-December/040709.html
%%
pad_to(Width, Binary) ->
    case pad_length(Width, size(Binary)) of
        0 -> Binary;
        N -> <<Binary/binary, 0:(N*8)>>
    end.
