-module(netflow_v9_codec).

%% API
-export([init/0]).
-export([decode/2]).
-export([encode/6]).

-include("netflow_v9.hrl").

-define(TEMPLATES_TABLE, netflow_v9_templates).
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
    {ok, {#nfh_v9{}, [proplists:property()]}} | {error, term()}.
decode(Binary, IP) ->
    try
        decode_packet(Binary, IP)
    catch
        _:Reason ->
            {error, Reason}
    end.

encode(SysUptime, UnixSecs, FlowSeq, SourceId, TemplateId, Records) ->
    Count = length(Records),
    Header = <<
        9:16,
        (Count + 1):16,
        SysUptime:32,
        UnixSecs:32,
        FlowSeq:32,
        SourceId:32
    >>,
    TemplateFields = encode_template_fields(Records, []),
    Template = <<
        0:16,                               % FlowSet ID, 0 for template
        (byte_size(TemplateFields) + 8):16, % Length
        TemplateId:16,                      % Template ID, should be > 255
        Count:16,                           % Count
        TemplateFields/binary               % Fields
    >>,
    Fields = encode_fields(Records),
    FieldsSize = byte_size(Fields),
    DataFlowset = case (FieldsSize + 4) rem 4 of
        0 ->
            <<TemplateId:16, (FieldsSize + 4):16, Fields/binary>>;
        N ->
            Padding = <<0:(N * 8)>>,
            <<TemplateId:16, (FieldsSize + 4 + N):16, Fields/binary, Padding/binary>>
    end,
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

decode_packet(<<?NF_V9_HEADER_FORMAT, Rest/binary>>, IP) ->
    Header = #nfh_v9{
        version = Version,
        count = Count,
        sys_uptime = SysUptime,
        unix_secs = UnixSecs,
        flow_seq = SequenceNum,
        source_id = SourceID
    },
    case decode_flowsets(Rest, {SourceID, IP}, []) of
        {ok, Records} ->
            {ok, {Header, Records}};
        {error, Reason} ->
            {error, Reason}
    end.

decode_flowsets(<<>>, _, Acc0) ->
    {ok, lists:reverse(Acc0)};

%% Template flowset
decode_flowsets(<<0:16, Length:16, Rest/binary>>, Domain, Acc0) ->
    decode_templates(Rest, Domain, Length - 4, Acc0);
%% Options template flowset
decode_flowsets(<<1:16, Length:16, Rest/binary>>, Domain, Acc0) ->
    decode_options_templates(Rest, Domain, Length - 4, Acc0);
%% Data flowset
decode_flowsets(<<ID:16, Length:16, Rest/binary>>, Domain, Acc0) when ID > 255 ->
    case lookup_template(Domain, ID) of
        false ->
            {error, missing_template};
        {_Size, Map} = Template ->
            decode_data_fields(Rest, Domain, Length - 4, Template, Map, Acc0, [])
    end.

decode_templates(Bin, Domain, 0, Acc0) ->
    decode_flowsets(Bin, Domain, Acc0);
decode_templates(<<ID:16, Count:16, Rest/binary>>, Domain, Length, Acc0) ->
    decode_template_fields(Rest, Domain, ID, Length - 4, Count, Acc0, []).

%% Decode template flowset fields
decode_template_fields(Bin, Domain, ID, 0, 0, Acc0, Acc1) ->
    store_template(Domain, ID, lists:reverse(Acc1)),
    decode_templates(Bin, Domain, 0, Acc0);
decode_template_fields(Bin, Domain, ID, Length, 0, Acc0, Acc1) ->
    store_template(Domain, ID, lists:reverse(Acc1)),
    decode_templates(Bin, Domain, Length, Acc0);
decode_template_fields(<<Type:16, Len:16, Rest/binary>>, Domain, ID, Length, Count, Acc0, Acc1) ->
    decode_template_fields(Rest, Domain, ID, Length - 4, Count - 1, Acc0, [{Type, Len} | Acc1]).

%% Decode data flowset fields
decode_data_fields(Bin, Domain, 0, _, _, Acc0, []) ->
    decode_flowsets(Bin, Domain, Acc0);
decode_data_fields(Bin, Domain, Length, {S, Map}, [], Acc0, Acc1) ->
    Record = lists:reverse(Acc1),
    decode_data_fields(Bin, Domain, Length - S, {S, Map}, Map, [Record | Acc0], []);
decode_data_fields(Bin, Domain, Length, {S, Map}, [{scope, {Type, Len}} | T], Acc0, Acc1) when Length >= S ->
    <<Value:Len/binary, Rest/binary>> = Bin,
    Scope = typecast_field(Value, {scope, {Type, Len}}),
    decode_data_fields(Rest, Domain, Length, {S, Map}, T, Acc0, [Scope | Acc1]);
decode_data_fields(Bin, Domain, Length, {S, Map}, [{Type, Len} | T], Acc0, Acc1) when Length >= S ->
    <<Value:Len/binary, Rest/binary>> = Bin,
    Field = typecast_field(Value, Type, Len),
    decode_data_fields(Rest, Domain, Length, {S, Map}, T, Acc0, [Field | Acc1]);
decode_data_fields(Bin, Domain, Length, _, _, Acc0, []) ->
    <<_:Length/binary-unit:8, Rest/binary>> = Bin,
    decode_flowsets(Rest, Domain, Acc0).

decode_options_templates(Bin, Domain, 0, Acc0) ->
    decode_flowsets(Bin, Domain, Acc0);
decode_options_templates(<<ID:16, ScopeLen:16, OptionLen:16, Rest/binary>>, Domain, Length, Acc0) ->
    decode_options_template_fields(Rest, Domain, ID, Length - 6, ScopeLen, OptionLen, Acc0, []).

decode_options_template_fields(Bin, Domain, ID, 0, 0, 0, Acc0, Acc1) ->
    store_template(Domain, ID, lists:reverse(Acc1)),
    decode_flowsets(Bin, Domain, Acc0);
decode_options_template_fields(Bin, Domain, ID, Length, 0, 0, Acc0, Acc1) ->
    store_template(Domain, ID, lists:reverse(Acc1)),
    <<_:Length/binary-unit:8, Rest/binary>> = Bin,
    decode_flowsets(Rest, Domain, Acc0);
decode_options_template_fields(<<Type:16, Len:16, Rest/binary>>, Domain, ID, Length, 0, OptionLen, Acc0, Acc1) ->
    decode_options_template_fields(Rest, Domain, ID, Length - 4, 0, OptionLen - 4, Acc0, [{Type, Len} | Acc1]);
decode_options_template_fields(<<Type:16, Len:16, Rest/binary>>, Domain, ID, Length, ScopeLen, OptionLen, Acc0, Acc1) ->
    decode_options_template_fields(Rest, Domain, ID, Length - 4, ScopeLen - 4, OptionLen, Acc0, [{scope, {Type, Len}} | Acc1]).

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

record_size({scope, {_, Size}}, Total) ->
    Size + Total;
record_size({_, Size}, Total) ->
    Size + Total.

typecast_field(_Bin, {scope, {1, 0}}) ->
    {scope, 'SYSTEM'};
typecast_field(_Bin, {scope, {Type, 0}}) ->
    {scope, Type};
typecast_field(Bin, {scope, {2, Length}}) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {scope, {'IFACE', Value}};
typecast_field(Bin, {scope, {3, Length}}) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {scope, {'LINE_CARD', Value}};
typecast_field(Bin, {scope, {4, Length}}) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {scope, {'CACHE', Value}};
typecast_field(Bin, {scope, {5, Length}}) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {scope, {'TEMPLATE', Value}};
typecast_field(Bin, {scope, {Type, _}}) ->
    {scope, {Type, Bin}}.
typecast_field(Bin, 1, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'IN_BYTES', Value};
typecast_field(Bin, 2, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'IN_PKTS', Value};
typecast_field(Bin, 3, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'FLOWS', Value};
typecast_field(Bin, 10, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'INPUT_SNMP', Value};
typecast_field(Bin, 14, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'OUTPUT_SNMP', Value};
typecast_field(Bin, 16, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'SRC_AS', Value};
typecast_field(Bin, 17, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'DST_AS', Value};
typecast_field(Bin, 23, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'OUT_BYTES', Value};
typecast_field(Bin, 24, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'OUT_PKTS', Value};
typecast_field(Bin, 27, 16) ->
    {'IPV6_SRC_ADDR', Bin};
typecast_field(Bin, 28, 16) ->
    {'IPV6_DST_ADDR', Bin};
typecast_field(Bin, 40, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'TOTAL_BYTES_EXP', Value};
typecast_field(Bin, 41, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'TOTAL_PKTS_EXP', Value};
typecast_field(Bin, 42, Length) ->
    <<Value:Length/integer-unit:8>> = Bin,
    {'TOTAL_FLOWS_EXP', Value};
typecast_field(<<Value>>, 4, 1) ->
    {'PROTOCOL', Value};
typecast_field(<<Value>>, 5, 1) ->
    {'SRC_TOS', Value};
typecast_field(<<Value>>, 6, 1) ->
    {'TCP_FLAGS', Value};
typecast_field(<<Value:16>>, 7, 2) ->
    {'L4_SRC_PORT', Value};
typecast_field(<<A, B, C, D>>, 8, 4) ->
    {'IPV4_SRC_ADDR', {A, B, C, D}};
typecast_field(<<Value>>, 9, 1) ->
    {'SRC_MASK', Value};
typecast_field(<<Value:16>>, 11, 2) ->
    {'L4_DST_PORT', Value};
typecast_field(<<A, B, C, D>>, 12, 4) ->
    {'IPV4_DST_ADDR', {A, B, C, D}};
typecast_field(<<Value>>, 13, 1) ->
    {'DST_MASK', Value};
typecast_field(<<A, B, C, D>>, 15, 4) ->
    {'IPV4_NEXT_HOP', {A, B, C, D}};
typecast_field(<<Value:32>>, 21, 4) ->
    {'LAST_SWITCHED', Value};
typecast_field(<<Value:32>>, 22, 4) ->
    {'FIRST_SWITCHED', Value};
typecast_field(<<Value>>, 29, 1) ->
    {'IPV6_SRC_MASK', Value};
typecast_field(<<Value>>, 30, 1) ->
    {'IPV6_DST_MASK', Value};
typecast_field(<<Value>>, 32, 2) ->
    {'ICMP_TYPE', Value};
typecast_field(<<Value>>, 48, 1) ->
    {'FLOW_SAMPLER_ID', Value};
typecast_field(<<Value>>, 49, 1) ->
    {'FLOW_SAMPLER_MODE', Value};
typecast_field(<<Value:32>>, 50, 4) ->
    {'FLOW_SAMPLER_RANDOM_INTERVAL', Value};
typecast_field(<<Value>>, 52, 1) ->
    {'MIN_TTL', Value};
typecast_field(<<Value>>, 53, 1) ->
    {'MAX_TTL', Value};
typecast_field(<<Value:16>>, 54, 2) ->
    {'IPV4_IDENT', Value};
typecast_field(Bin, 56, 6) ->
    {'IN_SRC_MAC', Bin};
typecast_field(Bin, 57, 6) ->
    {'OUT_DST_MAC', Bin};
typecast_field(<<Value>>, 60, 1) ->
    {'IP_PROTOCOL_VERSION', Value};
typecast_field(<<Value>>, 61, 1) ->
    {'DIRECTION', Value};
typecast_field(Bin, 62, 16) ->
    {'IPV6_NEXT_HOP', Bin};
typecast_field(Value, 63, 16) ->
    {'BPG_IPV6_NEXT_HOP', Value};
%% http://tools.ietf.org/html/draft-ietf-behave-ipfix-nat-logging-00
typecast_field(<<A, B, C, D>>, 225, 4) ->
    {natInsideGlobalAddress, {A, B, C, D}};
typecast_field(<<A, B, C, D>>, 226, 4) ->
    {natOutsideGlobalAddress, {A, B, C, D}};
typecast_field(<<Value:16>>, 227, 2) ->
    {postNAPTSourceTransportPort, Value};
typecast_field(<<Value:16>>, 228, 2) ->
    {postNAPTDestinationTransportPort, Value};
typecast_field(<<Value:32>>, 234, 4) ->
    {ingressVRFID, Value};
typecast_field(<<Value:8>>, 230, 1) ->
    {natEvent, Value};
typecast_field(<<Value:64/integer>>, 323, 8) ->
    {observationTime, Value};
typecast_field(Bin, Type, _) ->
    {Type, Bin}.

encode_field('IPV4_SRC_ADDR', {A, B, C, D}) ->
    {<<A, B, C, D>>, 8, 4};
encode_field('L4_SRC_PORT', Value) ->
    {<<Value:16>>, 7, 2};
encode_field('IPV4_DST_ADDR', {A, B, C, D}) ->
    {<<A, B, C, D>>, 12, 4};
encode_field('L4_DST_PORT', Value) ->
    {<<Value:16>>, 11, 2};
encode_field('PROTOCOL', Value) ->
    {<<Value:8>>, 4, 1};
encode_field(natInsideGlobalAddress, {A, B, C, D}) ->
    {<<A, B, C, D>>, 225, 4};
encode_field(natOutsideGlobalAddress, {A, B, C, D}) ->
    {<<A, B, C, D>>, 226, 4};
encode_field(postNAPTSourceTransportPort, Value) ->
    {<<Value:16>>, 227, 2};
encode_field(postNAPTDestinationTransportPort, Value) ->
    {<<Value:16>>, 228, 2};
encode_field(ingressVRFID, Value) ->
    {<<Value:32>>, 234, 4};
encode_field(natEvent, Value) ->
    {<<Value:8>>, 230, 1};
encode_field(observationTime, Value) ->
    {<<Value:64/integer>>, 323, 8}.
