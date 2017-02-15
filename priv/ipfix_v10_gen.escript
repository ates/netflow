#!/usr/bin/env escript

csv_init() ->
    {normal, []}.

csv_scan(Line, {quote, [Token | Acc]}) ->
    csv_scan(Line, Token, {quote, Acc});
csv_scan(Line, State) ->
    csv_scan(Line, [], State).

csv_scan([], [], {normal, Acc}) ->
    {lists:reverse([Acc]), csv_init()};
csv_scan([], Token, {normal, Acc}) ->
    {lists:reverse([lists:reverse(Token)|Acc]), csv_init()};
csv_scan([], [], {State, Acc}) ->
    {continue, {State, Acc}};

csv_scan([], Token, {quote, Acc}) ->
    {continue, {quote, [[$\n | Token]|Acc]}};

csv_scan([$,|Line], Token, {normal, Acc}) ->
    csv_scan(Line, [], {normal, [lists:reverse(Token)|Acc]});
csv_scan([["\\\""]|Line], Token, {State, Acc}) ->
    csv_scan(Line, [$"|Token], {State, Acc});
csv_scan([$"|Line], Token, {normal, Acc}) ->
    csv_scan(Line, Token, {quote, Acc});
csv_scan([$"|Line], Token, {quote, Acc}) ->
    csv_scan(Line, Token, {normal, Acc});
csv_scan([Char|Line], Token, {State, Acc}) ->
    csv_scan(Line, [Char|Token], {State, Acc}).

process_line(Line, {CSV0, Codec0}) ->
    {Data, CSV} = csv_scan(Line, CSV0),
    case Data of
	continue ->
	    {CSV, Codec0};
	[ElementId, Name, DataTypeStr, _DataTypeSemantics, Status,
	 _Description, _Units, _Range, _References, _Requester, _Revision, _Date] ->
	    Id = (catch list_to_integer(ElementId)),
	    DataType = list_to_atom(DataTypeStr),
	    Codec = process_element(Id, Name, DataType, Status, Codec0),
	    {CSV, Codec};
	_Other ->
	    {CSV, Codec0}
    end.

read_line(File, State0) ->
    case io:get_line(File, "") of
        eof  -> file:close(File), State0;
        Line -> State = process_line(string:strip(Line, both, $\n), State0),
		read_line(File, State)
    end.

codec_init() ->
    {[], []}.

process_element(Id, _Name, _DataType, Status, Codec)
  when not is_integer(Id); Id == 0; Id == 97;
       Status =:= "deprecated" ->
    Codec;
process_element(Id, Name, DataType, Status, {TypeCast, Encode})
  when DataType == string; DataType == octetArray ->
    TC = gen_typecast(Id, Name, DataType, Status),
    Enc = gen_encode(Id, Name, DataType, Status),
    {[TC | TypeCast], [Enc | Encode]};

process_element(Id, Name, DataType, Status, {TypeCast, Encode}) ->
    TC = gen_typecast(Id, Name, DataType, Status),
    Enc = gen_encode(Id, Name, DataType, Status),
    {[TC | TypeCast], [Enc | Encode]}.

gen_typecast_uint(Id, Name, Bytes) ->
    io_lib:format("typecast_field(Bin, ~w, Length)~n"
		  "  when Length =< ~w ->~n"
		  "    <<Value:Length/unsigned-integer-unit:8>> = Bin,~n"
		  "    {'~s', Value}",
		  [Id, Bytes, Name]).

gen_typecast_int(Id, Name, Bytes) ->
    io_lib:format("typecast_field(Bin, ~w, Length)~n"
		  "  when Length =< ~w ->~n"
		  "    <<Value:Length/signed-integer-unit:8>> = Bin,~n"
		  "    {'~s', Value}",
		  [Id, Bytes, Name]).

gen_typecast_float(Id, Name, Bytes) ->
    io_lib:format("typecast_field(Bin, ~w, Length)~n"
		  "  when Length =< ~w ->~n"
		  "    <<Value:Length/float-unit:8>> = Bin,~n"
		  "    {'~s', Value}",
		  [Id, Bytes, Name]).

%% gen_typecast_float(Id, Name, Bytes) ->
%%     io_lib:format("typecast_field(<<Value:~w/float>>, ~w, ~w) ->~n    {'~s', Value}",
%% 		  [Bytes * 8, Id, Bytes, Name]).

gen_typecast(Id, Name, boolean, _) ->
    io_lib:format("typecast_field(<<1>>, ~w, 1) ->~n    {'~s', true}",
		  [Id, Name]);
gen_typecast(Id, Name, boolean, _) ->
    io_lib:format("typecast_field(<<2>>, ~w, 1) ->~n    {'~s', false}",
		  [Id, Name]);
gen_typecast(Id, Name, unsigned8, _) ->
    gen_typecast_uint(Id, Name, 1);
gen_typecast(Id, Name, unsigned16, _) ->
    gen_typecast_uint(Id, Name, 2);
gen_typecast(Id, Name, unsigned32, _) ->
    gen_typecast_uint(Id, Name, 4);
gen_typecast(Id, Name, unsigned64, _) ->
    gen_typecast_uint(Id, Name, 8);
gen_typecast(Id, Name, signed8, _) ->
    gen_typecast_int(Id, Name, 1);
gen_typecast(Id, Name, signed16, _) ->
    gen_typecast_int(Id, Name, 2);
gen_typecast(Id, Name, signed32, _) ->
    gen_typecast_int(Id, Name, 4);
gen_typecast(Id, Name, signed64, _) ->
    gen_typecast_int(Id, Name, 8);
gen_typecast(Id, Name, float32, _) ->
    gen_typecast_float(Id, Name, 4);
gen_typecast(Id, Name, float64, _) ->
    gen_typecast_float(Id, Name, 8);
gen_typecast(Id, Name, ipv4Address, _) ->
    io_lib:format("typecast_field(<<A, B, C, D>>, ~w, 4) ->~n    {'~s', {A, B, C, D}}",
		  [Id, Name]);
gen_typecast(Id, Name, ipv6Address, _) ->
    io_lib:format("typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, ~w, 16) ->~n    {'~s', {A, B, C, D, E, F, G, H}}",
		  [Id, Name]);
gen_typecast(Id, Name, macAddress, _) ->
    io_lib:format("typecast_field(Value, ~w, 6)~n  when byte_size(Value) =:= 6 ->~n    {'~s', Value}",
		  [Id, Name]);
gen_typecast(Id, Name, DataType, _)
  when DataType == string; DataType == octetArray ->
    io_lib:format("typecast_field(Value, ~w, Length)~n  when byte_size(Value) == Length ->~n    {'~s', Value}",
		  [Id, Name]);
gen_typecast(Id, Name, dateTimeSeconds, _) ->
    gen_typecast_uint(Id, Name, 4);
gen_typecast(Id, Name, dateTimeMilliseconds, _) ->
    gen_typecast_uint(Id, Name, 8);
gen_typecast(Id, Name, DataType, _)
  when DataType == dateTimeMicroseconds; DataType == dateTimeNanoseconds ->
    io_lib:format("typecast_field(<<Seconds:32, Fraction:32>>, ~w, 8) ->~n    {'~s', {Seconds, Fraction}}",
		  [Id, Name]);

gen_typecast(Id, Name, DataType, Status)
  when DataType == basicList;
       DataType == subTemplateList;
       DataType == subTemplateMultiList ->
    io_lib:format("%% ~p ~p ~p ~p", [Id, Name, DataType, Status]);

gen_typecast(Id, Name, DataType, Status) ->
    io_lib:format("~p ~p ~p ~p", [Id, Name, DataType, Status]).

%% typecast_field(<<Value:64/integer>>, 323, 8) ->
%%     {observationTime, Value};

%% encode_field(observationTime, Value) ->
%%     {<<Value:64/integer>>, 323, 8}.

gen_encode_uint(Id, Name, Bytes) ->
    io_lib:format("encode_field('~s', Value) ->~n    {<<Value:~w/unsigned-integer>>, ~w, ~w}",
		  [Name, Bytes * 8, Id, Bytes]).

gen_encode_int(Id, Name, Bytes) ->
    io_lib:format("encode_field('~s', Value) ->~n    {<<Value:~w/signed-integer>>, ~w, ~w}",
		  [Name, Bytes * 8, Id, Bytes]).

gen_encode_float(Id, Name, Bytes) ->
    io_lib:format("encode_field('~s', Value) ->~n    {<<Value:~w/float>>, ~w, ~w}",
		  [Name, Bytes * 8, Id, Bytes]).

gen_encode(Id, Name, boolean, _) ->
    io_lib:format("encode_field('~s', true) ->~n    {<<1>>, ~w, 1}",
		  [Name, Id]);
gen_encode(Id, Name, boolean, _) ->
    io_lib:format("encode_field('~s', false) ->~n    {<<1>>, ~w, 2}",
		  [Name, Id]);
gen_encode(Id, Name, unsigned8, _) ->
    gen_encode_uint(Id, Name, 1);
gen_encode(Id, Name, unsigned16, _) ->
    gen_encode_uint(Id, Name, 2);
gen_encode(Id, Name, unsigned32, _) ->
    gen_encode_uint(Id, Name, 4);
gen_encode(Id, Name, unsigned64, _) ->
    gen_encode_uint(Id, Name, 8);
gen_encode(Id, Name, signed8, _) ->
    gen_encode_int(Id, Name, 1);
gen_encode(Id, Name, signed16, _) ->
    gen_encode_int(Id, Name, 2);
gen_encode(Id, Name, signed32, _) ->
    gen_encode_int(Id, Name, 4);
gen_encode(Id, Name, signed64, _) ->
    gen_encode_int(Id, Name, 8);
gen_encode(Id, Name, float32, _) ->
    gen_encode_float(Id, Name, 4);
gen_encode(Id, Name, float64, _) ->
    gen_encode_float(Id, Name, 8);
gen_encode(Id, Name, ipv4Address, _) ->
    io_lib:format("encode_field('~s', {A, B, C, D}) ->~n    {<<A, B, C, D>>, ~w, 4}",
		  [Name, Id]);
gen_encode(Id, Name, ipv6Address, _) ->
    io_lib:format("encode_field('~s', {A, B, C, D, E, F, G, H}) ->~n    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, ~w, 16}",
		  [Name, Id]);
gen_encode(Id, Name, macAddress, _) ->
    io_lib:format("encode_field('~s', Value)~n  when is_binary(Value) andalso byte_size(Value) =:= 6 ->~n    {Value, ~w, 6}",
		  [Name, Id]);
gen_encode(Id, Name, DataType, _)
  when DataType == string; DataType == octetArray ->
    io_lib:format("encode_field('~s', Value)~n  when is_binary(Value) ->~n    {encode_variable_field(Value), ~w, 65535}",
		  [Name, Id]);
gen_encode(Id, Name, dateTimeSeconds, _) ->
    gen_encode_uint(Id, Name, 4);
gen_encode(Id, Name, dateTimeMilliseconds, _) ->
    gen_encode_uint(Id, Name, 8);
gen_encode(Id, Name, DataType, _)
  when DataType == dateTimeMicroseconds; DataType == dateTimeNanoseconds ->
    io_lib:format("encode_field('~s', {Seconds, Fraction}) ->~n    {<<Seconds:32, Fraction:32>>, ~w, 8}",
		  [Name, Id]);

gen_encode(Id, Name, DataType, Status)
  when DataType == basicList;
       DataType == subTemplateList;
       DataType == subTemplateMultiList ->
    io_lib:format("%% ~p ~p ~p ~p", [Id, Name, DataType, Status]);

gen_encode(Id, Name, DataType, Status) ->
    io_lib:format("~p ~p ~p ~p", [Id, Name, DataType, Status]).

fmt_fun(Fun) ->
    io_lib:format("~s.~n~n", [lists:join(";\n\n", lists:reverse(Fun))]).

main(_) ->
    {ok, File} = file:open("priv/ipfix-information-elements.csv", [read]),
    {_, Codec} = read_line(File, {csv_init(), codec_init()}),
    {TypeSpec, Encode} = Codec,

    D = ["%%\n%% This file is auto-generated. DO NOT EDIT\n%%",
	 "\n\n%% ============================\n\n",
	 fmt_fun(TypeSpec),
	 "\n\n%% ============================\n\n",
	 fmt_fun(Encode)],
    file:write_file("src/ipfix_v10_codec_gen.hrl", D).
