%% Cisco Systems NetFlow Services Export Version 9
%% https://www.ietf.org/rfc/rfc3954.txt

-define(NF_V9_HEADER_FORMAT,
    Version:16,
    Count:16,
    SysUptime:32,
    UnixSecs:32,
    SequenceNum:32,
    SourceID:32
).

-record(nfh_v9, {
    version     :: 9,
    count       :: pos_integer(),
    sys_uptime  :: pos_integer(),
    unix_secs   :: pos_integer(),
    flow_seq    :: non_neg_integer(),
    source_id   :: pos_integer()
}).
