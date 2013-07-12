-module(netflow_v5_codec_tests).

-include_lib("eunit/include/eunit.hrl").

decode_test() ->
    Data = <<0,5,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,
             255,0,0,0,0,0,0,0,0,255,0,0,0,0,1,0,0,0,1,0,0,0,0,255,255,0,0,
             0,0,255,0,0,0,17,0,0,0,255,0,0,0,0,0>>,
    Res = {ok,{{nfh_v5,5,1,0,0,0,0,0,0,0},
         [{nfrec_v5,0,4294901760,0,0,65280,1,1,0,4294901760,0,65280,
                         0,0,17,0,0,65280,0,0,0}]}},
    ?assertEqual(netflow_v5_codec:decode(Data), Res).

encode_test() ->
    Data = <<0,5,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,
             255,0,0,0,0,0,0,0,0,255,0,0,0,0,1,0,0,0,1,0,0,0,0,255,255,
             0,0,0,0,255,0,0,0,17,0,0,0,255,0,0,0,0,0>>,
    {ok, Packet} = netflow_v5_codec:decode(Data),
    {ok, Result} = netflow_v5_codec:encode(Packet),
    ?assertEqual(Result, Data).
