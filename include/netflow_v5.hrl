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
