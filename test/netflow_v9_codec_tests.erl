-module(netflow_v9_codec_tests).

-include_lib("eunit/include/eunit.hrl").

init_test() ->
    ?assertEqual(ok, netflow_v9_codec:init()).

decode_test() ->
    Binary = <<
        0,9,0,3,210,226,83,114,81,223,248,100,0,0,0,1,0,0,0,1,0,0,0,16,1,0,0,
        2,0,8,0,4,0,7,0,2,1,0,0,12,127,0,0,1,39,15,0,0>>,
    Result = {
        {nfh_v9,9,3,3538047858,1373632612,1,1},
        [[{'IPV4_SRC_ADDR',{127,0,0,1}},{'L4_SRC_PORT',9999}]]
    },
    ?assertEqual({ok, Result}, netflow_v9_codec:decode(Binary, {127,0,0,1})).

encode_test() ->
    Binary = <<
        0,9,0,3,210,226,83,114,81,223,248,100,0,0,0,1,0,0,0,1,0,0,0,16,1,0,0,
        2,0,8,0,4,0,7,0,2,1,0,0,12,127,0,0,1,39,15,0,0>>,
    Fields = [
        {'IPV4_SRC_ADDR', {127,0,0,1}},
        {'L4_SRC_PORT', 9999}
    ],
    ?assertEqual(Binary, netflow_v9_codec:encode(1373632615282,1373632612, 1, 1, 256, Fields)).
