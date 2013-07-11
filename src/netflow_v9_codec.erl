-module(netflow_v9_codec).

%% API
-export([decode/2]).

-include("netflow_v9.hrl").

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

%% Internal functions
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
    decode_templates(Rest, Domain, Length - 4, Acc0).
