-module(netflow_v5_codec).

%% API
-export([decode/1]).
-export([encode/1]).

-include("netflow_v5.hrl").

-define(NF_V5_HEADER_FORMAT,
    Version:16,
    Count:16,
    SysUptime:32,
    UnixSecs:32,
    UnixNsecs:32,
    FlowSequence:32,
    EngineType:8,
    EngineID:8,
    SamplingInterval:16
).

-define(NF_V5_RECORD_FORMAT,
    SrcAddr:32,
    DstAddr:32,
    NextHop:32,
    Input:16,
    Output:16,
    Pkts:32,
    Octets:32,
    First:32,
    Last:32,
    SrcPort:16,
    DstPort:16,
    Pad1:8,
    TcpFlags:8,
    Prot:8,
    Tos:8,
    SrcAs:16,
    DstAs:16,
    SrcMask:8,
    DstMask:8,
    Pad2:16
).

%% @doc Decodes the binary NetFlow packet.
-spec decode(Data :: binary()) -> {ok, {#nfh_v5{}, [#nfrec_v5{}]}}.
decode(<<?NF_V5_HEADER_FORMAT, Rest/binary>>) ->
    Header = #nfh_v5{
        version           = Version,
        count             = Count,
        sys_uptime        = SysUptime,
        unix_secs         = UnixSecs,
        unix_nsecs        = UnixNsecs,
        flow_seq          = FlowSequence,
        engine_type       = EngineType,
        engine_id         = EngineID,
        sampling_interval = SamplingInterval
    },
    {ok, {Header, decode_records(Rest, [])}}.

%% @doc Encodes the records back to binary.
-spec encode({#nfh_v5{}, [#nfrec_v5{}]}) -> {ok, binary()}.
encode({Header, Records}) ->
    #nfh_v5{
        version           = Version,
        count             = Count,
        sys_uptime        = SysUptime,
        unix_secs         = UnixSecs,
        unix_nsecs        = UnixNsecs,
        flow_seq          = FlowSequence,
        engine_type       = EngineType,
        engine_id         = EngineID,
        sampling_interval = SamplingInterval
    } = Header,
    Rec = << <<(encode_record(R))/binary>> || R <- Records>>,
    {ok, <<?NF_V5_HEADER_FORMAT, Rec/binary>>}.

%% Internal functions
decode_records(<<?NF_V5_RECORD_FORMAT, Rest/binary>>, List) ->
    Record = #nfrec_v5{
        src_addr  = SrcAddr,
        dst_addr  = DstAddr,
        next_hop  = NextHop,
        input     = Input,
        output    = Output,
        d_pkts    = Pkts,
        d_octets  = Octets,
        first     = First,
        last      = Last,
        src_port  = SrcPort,
        dst_port  = DstPort,
        pad1      = Pad1,
        tcp_flags = TcpFlags,
        prot      = Prot,
        tos       = Tos,
        src_as    = SrcAs,
        dst_as    = DstAs,
        src_mask  = SrcMask,
        dst_mask  = DstMask,
        pad2      = Pad2
    },
    decode_records(Rest, [Record | List]);
decode_records(<<>>, List) ->
	lists:reverse(List).

encode_record(Record) ->
    #nfrec_v5{
        src_addr  = SrcAddr,
        dst_addr  = DstAddr,
        next_hop  = NextHop,
        input     = Input,
        output    = Output,
        d_pkts    = Pkts,
        d_octets  = Octets,
        first 	  = First,
        last 	  = Last,
        src_port  = SrcPort,
        dst_port  = DstPort,
        pad1	  = Pad1,
        tcp_flags = TcpFlags,
        prot      = Prot,
        tos       = Tos,
        src_as    = SrcAs,
        dst_as    = DstAs,
        src_mask  = SrcMask,
        dst_mask  = DstMask,
        pad2      = Pad2
	} = Record,
    <<?NF_V5_RECORD_FORMAT>>.
