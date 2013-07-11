-module(netflow_v9_codec_tests).

-include_lib("eunit/include/eunit.hrl").

init_test() ->
    ok = netflow_v9_codec:init().
