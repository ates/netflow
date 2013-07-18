%% NetFlow header Version 5
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

-record(nfh_v5, {
    version           :: 5,
    count             :: 1..30,
    sys_uptime        :: non_neg_integer(),
    unix_secs         :: non_neg_integer(),
    unix_nsecs        :: non_neg_integer(),
    flow_seq          :: non_neg_integer(),
    engine_type       :: 0..255,
    engine_id         :: 0..255,
    sampling_interval :: non_neg_integer()
}).

%% NetFlow record Version 5 (V5)
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

-record(nfrec_v5, {
    src_addr    :: non_neg_integer(),
    dst_addr    :: non_neg_integer(),
    next_hop    :: non_neg_integer(),
    input       :: pos_integer(),
    output      :: pos_integer(),
    d_pkts      :: non_neg_integer(),
    d_octets    :: non_neg_integer(),
    first       :: non_neg_integer(),
    last        :: non_neg_integer(),
    src_port    :: inet:port_number(),
    dst_port    :: inet:port_number(),
    pad1        :: 0,
    tcp_flags   :: pos_integer(),
    prot        :: 0..255,
    tos         :: pos_integer(),
    src_as      :: pos_integer(),
    dst_as      :: pos_integer(),
    src_mask    :: pos_integer(),
    dst_mask    :: pos_integer(),
    pad2        :: 0
}).
