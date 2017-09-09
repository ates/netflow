-module(ipfix_v10_codec_SUITE).

%% ct callbacks
-export([all/0]).
-export([init_per_testcase/2]).

%% test cases
-export([decode_test/1]).
-export([encode_test/1]).
-export([redecode_test/1]).
-export([reencode_test/1]).

-include("ipfix_v10.hrl").
-include_lib("common_test/include/ct.hrl").

-define(equal(Expected, Actual),
    (fun (Expected@@@, Expected@@@) -> true;
         (Expected@@@, Actual@@@) ->
             ct:fail("MISMATCH(~s:~b, ~s)~nExpected: ~p~nActual:   ~p~n",
                     [?FILE, ?LINE, ??Actual, Expected@@@, Actual@@@])
     end)(Expected, Actual)).

-define(match(Guard, Expr),
        ((fun () ->
                  case (Expr) of
                      Guard -> ok;
                      V -> ct:fail("MISMATCH(~s:~b, ~s)~nExpected: ~p~nActual:   ~p~n",
                                   [?FILE, ?LINE, ??Expr, ??Guard, V])
                  end
          end)())).

%% ---------------------------------------------------------------------
%% -- test cases

decode_test(_Config) ->
    Binary = hexstr2bin("000a0200589d9de50000000000000000000200440400000f0099000800980008"
			"0001000800020008003c0001000a0004000e0004003d000100080004000c0004"
			"00070002000b0002000600010004000101c7000f000200440401000f00990008"
			"009800080001000800020008003c0001000a0004000e0004003d000100080004"
			"000c000400070002000b0002000600010004000101c7000f040001680000015a"
			"27af18b50000015a27af18990000000000000052000000000000000104000000"
			"000000000000080808085c2b33910035ed6d0011323330303035353530303031"
			"3233340000015a27af18b50000015a27af189900000000000000420000000000"
			"000001040000000000000000005c2b339108080808ed6d003500113233303030"
			"353535303030313233340000015a27af190f0000015a27af190f000000000000"
			"004c0000000000000001040000000000000000005c2b339141278087eda4007b"
			"00113233303030353535303030313233340000015a27af28de0000015a27af28"
			"bc00000000000000ba000000000000000104000000000000000000080808085c"
			"2b33900035247000113233303030353535303030313233340000015a27af28de"
			"0000015a27af28bc000000000000004700000000000000010400000000000000"
			"00005c2b33900808080824700035001132333030303535353030303132333400"),
    {ok, {Header, Fields}} = ipfix_v10_codec:decode(Binary, {127,0,0,1}),
    ?match({#ipfh_v10{version = 10, export_time = 1486724581, flow_seq = 0, domain_id = 0}, [_|_]},
	   {Header, Fields}).

encode_test(_Config) ->
    Binary = <<0,10,0,44,210,226,83,114,0,0,0,1,0,0,0,1,0,2,0,16,1,0,0,2,0,8,0,4,
	       0,7,0,2,1,0,0,12,127,0,0,1,39,15,0,0>>,
    Fields = [
	      {'sourceIPv4Address', {127,0,0,1}},
	      {'sourceTransportPort', 9999}
    ],
    ?equal(Binary, ipfix_v10_codec:encode(1373632615282, 1, 1, 256, Fields)).

redecode_test(_Config) ->
    InFields = [
		{'flowEndMilliseconds',      1486724475102},
		{'flowStartMilliseconds',    1486724475068},
		{'octetDeltaCount',          71},
		{'packetDeltaCount',         1},
		{'ipVersion',                4},
		{'ingressInterface',         0},
		{'egressInterface',          0},
		{'flowDirection',            0},
		{'sourceIPv4Address',        {92,43,51,144}},
		{'destinationIPv4Address',   {8,8,8,8}},
		{'sourceTransportPort',      9328},
		{'destinationTransportPort', 53},
		{'tcpControlBits',           0},
		{'protocolIdentifier',       17},
		{'mobileIMSI',               <<"230005550001234">>}
	       ],
    Binary = ipfix_v10_codec:encode(1486724581, 0, 0, 256, InFields),
    {ok, {_, OutFields}} = ipfix_v10_codec:decode(Binary, {127,0,0,1}),
    ?equal([InFields], OutFields).

reencode_test(_Config) ->

    Binary = hexstr2bin("000a00a4589d9de50000000000000000000200440100000f00990008009800"
			"080001000800020008003c0001000a0004000e0004003d000100080004000c"
			"000400070002000b0002000600020004000101c7ffff010000500000015a27"
			"af28de0000015a27af28bc0000000000000047000000000000000104000000"
			"0000000000005c2b339008080808247000350000110f323330303035353530"
			"303031323334000000"),

    {ok, {Header, [Fields | _]}} = ipfix_v10_codec:decode(Binary, {127,0,0,1}),
    #ipfh_v10{
       export_time = ExportTime,
       flow_seq    = FlowSeq,
       domain_id   = DomainId} = Header,
    ?equal(Binary, ipfix_v10_codec:encode(ExportTime, FlowSeq, DomainId, 256, Fields)).

%% ---------------------------------------------------------------------
%% -- common_test callbacks

all() ->
    [decode_test, encode_test, redecode_test, reencode_test].

init_per_testcase(_, Config) ->
    ok = ipfix_v10_codec:init(),
    Config.

%%%===================================================================
%%% Internal functions
%%%===================================================================

% hexstr2bin
hexstr2bin(S) ->
    list_to_binary(hexstr2list(S)).

hexstr2list([X,Y|T]) ->
    [mkint(X)*16 + mkint(Y) | hexstr2list(T)];
hexstr2list([]) ->
    [].

mkint(C) when $0 =< C, C =< $9 ->
    C - $0;
mkint(C) when $A =< C, C =< $F ->
    C - $A + 10;
mkint(C) when $a =< C, C =< $f ->
    C - $a + 10.
