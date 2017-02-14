%% IP Flow Information Export (IPFIX) Protocol Version 10
%% https://www.ietf.org/rfc/rfc7011.txt

-record(ipfh_v10, {
	  version     :: 10,
	  export_time :: pos_integer(),
	  flow_seq    :: non_neg_integer(),
	  domain_id   :: pos_integer()
}).
