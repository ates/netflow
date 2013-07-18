-module(netflow_v5_codec).

%% API
-export([decode/1, encode/1]).

-include("netflow_v5.hrl").

%% @doc Decodes the binary NetFlow packet.
-spec decode(binary()) -> {ok, {#nfh_v5{}, #nfrec_v5{}}} | {error, term()}.
decode(Bin) ->
    try
        decode_packet(Bin)
    catch
        _:Reason ->
            {error, Reason}
    end.

%% @doc Encodes the records back to binary.
-spec encode({#nfh_v5{}, #nfrec_v5{}}) -> {ok, binary()} | {error, term()}.
encode(Record) ->
    try
        encode_packet(Record)
    catch
        _:Reason ->
            {error, Reason}
    end.

%% Internal functions

decode_packet(<<?NF_V5_HEADER_FORMAT, Rest/binary>>) ->
    Header = #nfh_v5{
        version = Version,
        count = Count,
        sys_uptime = SysUptime,
        unix_secs = UnixSecs,
        unix_nsecs = UnixNsecs,
        flow_seq = FlowSequence,
        engine_type = EngineType,
        engine_id = EngineID,
        sampling_interval = SamplingInterval
    },
    {ok, {Header, decode_records(Rest, [])}}.

decode_records(<<>>, List) ->
    lists:reverse(List);
decode_records(<<?NF_V5_RECORD_FORMAT, Rest/binary>>, List) ->
    Record = #nfrec_v5{
        src_addr = SrcAddr,
        dst_addr = DstAddr,
        next_hop = NextHop,
        input = Input,
        output = Output,
        d_pkts = Pkts,
        d_octets = Octets,
        first = First,
        last = Last,
        src_port = SrcPort,
        dst_port = DstPort,
        pad1 = Pad1,
        tcp_flags = TcpFlags,
        prot = Prot,
        tos = Tos,
        src_as = SrcAs,
        dst_as = DstAs,
        src_mask = SrcMask,
        dst_mask = DstMask,
        pad2 = Pad2
    },
    decode_records(Rest, [Record | List]).

encode_packet({Header, Records}) ->
    {nfh_v5, Version, Count, SysUptime, 
        UnixSecs, UnixNsecs, FlowSequence, 
        EngineType, EngineID, SamplingInterval} = Header,
    Rec = list_to_binary([encode_record(R) || R <- Records]),
    {ok, <<?NF_V5_HEADER_FORMAT, Rec/binary>>}.

encode_record(Record) ->
    {nfrec_v5, SrcAddr, DstAddr, NextHop, 
        Input, Output, Pkts, Octets, First, 
        Last, SrcPort, DstPort, Pad1, TcpFlags, 
        Prot, Tos, SrcAs, DstAs, SrcMask, DstMask, Pad2} = Record,
    <<?NF_V5_RECORD_FORMAT>>.
