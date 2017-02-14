%%
%% This file is auto-generated. DO NOT EDIT
%%

%% ============================

typecast_field(Bin, 1, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'octetDeltaCount', Value};

typecast_field(Bin, 2, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'packetDeltaCount', Value};

typecast_field(Bin, 3, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'deltaFlowCount', Value};

typecast_field(Bin, 4, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'protocolIdentifier', Value};

typecast_field(Bin, 5, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipClassOfService', Value};

typecast_field(Bin, 6, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpControlBits', Value};

typecast_field(Bin, 7, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'sourceTransportPort', Value};

typecast_field(<<A, B, C, D>>, 8, 4) ->
    {'sourceIPv4Address', {A, B, C, D}};

typecast_field(Bin, 9, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'sourceIPv4PrefixLength', Value};

typecast_field(Bin, 10, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ingressInterface', Value};

typecast_field(Bin, 11, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'destinationTransportPort', Value};

typecast_field(<<A, B, C, D>>, 12, 4) ->
    {'destinationIPv4Address', {A, B, C, D}};

typecast_field(Bin, 13, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'destinationIPv4PrefixLength', Value};

typecast_field(Bin, 14, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'egressInterface', Value};

typecast_field(<<A, B, C, D>>, 15, 4) ->
    {'ipNextHopIPv4Address', {A, B, C, D}};

typecast_field(Bin, 16, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'bgpSourceAsNumber', Value};

typecast_field(Bin, 17, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'bgpDestinationAsNumber', Value};

typecast_field(<<A, B, C, D>>, 18, 4) ->
    {'bgpNextHopIPv4Address', {A, B, C, D}};

typecast_field(Bin, 19, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postMCastPacketDeltaCount', Value};

typecast_field(Bin, 20, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postMCastOctetDeltaCount', Value};

typecast_field(Bin, 21, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowEndSysUpTime', Value};

typecast_field(Bin, 22, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowStartSysUpTime', Value};

typecast_field(Bin, 23, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postOctetDeltaCount', Value};

typecast_field(Bin, 24, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postPacketDeltaCount', Value};

typecast_field(Bin, 25, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'minimumIpTotalLength', Value};

typecast_field(Bin, 26, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'maximumIpTotalLength', Value};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 27, 16) ->
    {'sourceIPv6Address', {A, B, C, D, E, F, G, H}};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 28, 16) ->
    {'destinationIPv6Address', {A, B, C, D, E, F, G, H}};

typecast_field(Bin, 29, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'sourceIPv6PrefixLength', Value};

typecast_field(Bin, 30, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'destinationIPv6PrefixLength', Value};

typecast_field(Bin, 31, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowLabelIPv6', Value};

typecast_field(Bin, 32, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'icmpTypeCodeIPv4', Value};

typecast_field(Bin, 33, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'igmpType', Value};

typecast_field(Bin, 36, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowActiveTimeout', Value};

typecast_field(Bin, 37, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowIdleTimeout', Value};

typecast_field(Bin, 40, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'exportedOctetTotalCount', Value};

typecast_field(Bin, 41, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'exportedMessageTotalCount', Value};

typecast_field(Bin, 42, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'exportedFlowRecordTotalCount', Value};

typecast_field(<<A, B, C, D>>, 44, 4) ->
    {'sourceIPv4Prefix', {A, B, C, D}};

typecast_field(<<A, B, C, D>>, 45, 4) ->
    {'destinationIPv4Prefix', {A, B, C, D}};

typecast_field(Bin, 46, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mplsTopLabelType', Value};

typecast_field(<<A, B, C, D>>, 47, 4) ->
    {'mplsTopLabelIPv4Address', {A, B, C, D}};

typecast_field(Bin, 52, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'minimumTTL', Value};

typecast_field(Bin, 53, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'maximumTTL', Value};

typecast_field(Bin, 54, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'fragmentIdentification', Value};

typecast_field(Bin, 55, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postIpClassOfService', Value};

typecast_field(Value, 56, 6)
  when byte_size(Value) =:= 6 ->
    {'sourceMacAddress', Value};

typecast_field(Value, 57, 6)
  when byte_size(Value) =:= 6 ->
    {'postDestinationMacAddress', Value};

typecast_field(Bin, 58, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'vlanId', Value};

typecast_field(Bin, 59, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postVlanId', Value};

typecast_field(Bin, 60, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipVersion', Value};

typecast_field(Bin, 61, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowDirection', Value};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 62, 16) ->
    {'ipNextHopIPv6Address', {A, B, C, D, E, F, G, H}};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 63, 16) ->
    {'bgpNextHopIPv6Address', {A, B, C, D, E, F, G, H}};

typecast_field(Bin, 64, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipv6ExtensionHeaders', Value};

typecast_field(Value, 70, Length)
  when byte_size(Value) == Length ->
    {'mplsTopLabelStackSection', Value};

typecast_field(Value, 71, Length)
  when byte_size(Value) == Length ->
    {'mplsLabelStackSection2', Value};

typecast_field(Value, 72, Length)
  when byte_size(Value) == Length ->
    {'mplsLabelStackSection3', Value};

typecast_field(Value, 73, Length)
  when byte_size(Value) == Length ->
    {'mplsLabelStackSection4', Value};

typecast_field(Value, 74, Length)
  when byte_size(Value) == Length ->
    {'mplsLabelStackSection5', Value};

typecast_field(Value, 75, Length)
  when byte_size(Value) == Length ->
    {'mplsLabelStackSection6', Value};

typecast_field(Value, 76, Length)
  when byte_size(Value) == Length ->
    {'mplsLabelStackSection7', Value};

typecast_field(Value, 77, Length)
  when byte_size(Value) == Length ->
    {'mplsLabelStackSection8', Value};

typecast_field(Value, 78, Length)
  when byte_size(Value) == Length ->
    {'mplsLabelStackSection9', Value};

typecast_field(Value, 79, Length)
  when byte_size(Value) == Length ->
    {'mplsLabelStackSection10', Value};

typecast_field(Value, 80, 6)
  when byte_size(Value) =:= 6 ->
    {'destinationMacAddress', Value};

typecast_field(Value, 81, 6)
  when byte_size(Value) =:= 6 ->
    {'postSourceMacAddress', Value};

typecast_field(Value, 82, Length)
  when byte_size(Value) == Length ->
    {'interfaceName', Value};

typecast_field(Value, 83, Length)
  when byte_size(Value) == Length ->
    {'interfaceDescription', Value};

typecast_field(Bin, 85, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'octetTotalCount', Value};

typecast_field(Bin, 86, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'packetTotalCount', Value};

typecast_field(Bin, 88, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'fragmentOffset', Value};

typecast_field(Bin, 89, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'forwardingStatus', Value};

typecast_field(Value, 90, Length)
  when byte_size(Value) == Length ->
    {'mplsVpnRouteDistinguisher', Value};

typecast_field(Bin, 91, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mplsTopLabelPrefixLength', Value};

typecast_field(Bin, 92, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'srcTrafficIndex', Value};

typecast_field(Bin, 93, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'dstTrafficIndex', Value};

typecast_field(Value, 94, Length)
  when byte_size(Value) == Length ->
    {'applicationDescription', Value};

typecast_field(Value, 95, Length)
  when byte_size(Value) == Length ->
    {'applicationId', Value};

typecast_field(Value, 96, Length)
  when byte_size(Value) == Length ->
    {'applicationName', Value};

typecast_field(Bin, 98, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postIpDiffServCodePoint', Value};

typecast_field(Bin, 99, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'multicastReplicationFactor', Value};

typecast_field(Bin, 101, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'classificationEngineId', Value};

typecast_field(Bin, 128, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'bgpNextAdjacentAsNumber', Value};

typecast_field(Bin, 129, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'bgpPrevAdjacentAsNumber', Value};

typecast_field(<<A, B, C, D>>, 130, 4) ->
    {'exporterIPv4Address', {A, B, C, D}};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 131, 16) ->
    {'exporterIPv6Address', {A, B, C, D, E, F, G, H}};

typecast_field(Bin, 132, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'droppedOctetDeltaCount', Value};

typecast_field(Bin, 133, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'droppedPacketDeltaCount', Value};

typecast_field(Bin, 134, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'droppedOctetTotalCount', Value};

typecast_field(Bin, 135, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'droppedPacketTotalCount', Value};

typecast_field(Bin, 136, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowEndReason', Value};

typecast_field(Bin, 137, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'commonPropertiesId', Value};

typecast_field(Bin, 138, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'observationPointId', Value};

typecast_field(Bin, 139, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'icmpTypeCodeIPv6', Value};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 140, 16) ->
    {'mplsTopLabelIPv6Address', {A, B, C, D, E, F, G, H}};

typecast_field(Bin, 141, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'lineCardId', Value};

typecast_field(Bin, 142, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'portId', Value};

typecast_field(Bin, 143, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'meteringProcessId', Value};

typecast_field(Bin, 144, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'exportingProcessId', Value};

typecast_field(Bin, 145, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'templateId', Value};

typecast_field(Bin, 146, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'wlanChannelId', Value};

typecast_field(Value, 147, Length)
  when byte_size(Value) == Length ->
    {'wlanSSID', Value};

typecast_field(Bin, 148, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowId', Value};

typecast_field(Bin, 149, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'observationDomainId', Value};

typecast_field(Bin, 150, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowStartSeconds', Value};

typecast_field(Bin, 151, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowEndSeconds', Value};

typecast_field(Bin, 152, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowStartMilliseconds', Value};

typecast_field(Bin, 153, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowEndMilliseconds', Value};

typecast_field(<<Seconds:32, Fraction:32>>, 154, 8) ->
    {'flowStartMicroseconds', {Seconds, Fraction}};

typecast_field(<<Seconds:32, Fraction:32>>, 155, 8) ->
    {'flowEndMicroseconds', {Seconds, Fraction}};

typecast_field(<<Seconds:32, Fraction:32>>, 156, 8) ->
    {'flowStartNanoseconds', {Seconds, Fraction}};

typecast_field(<<Seconds:32, Fraction:32>>, 157, 8) ->
    {'flowEndNanoseconds', {Seconds, Fraction}};

typecast_field(Bin, 158, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowStartDeltaMicroseconds', Value};

typecast_field(Bin, 159, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowEndDeltaMicroseconds', Value};

typecast_field(Bin, 160, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'systemInitTimeMilliseconds', Value};

typecast_field(Bin, 161, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowDurationMilliseconds', Value};

typecast_field(Bin, 162, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowDurationMicroseconds', Value};

typecast_field(Bin, 163, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'observedFlowTotalCount', Value};

typecast_field(Bin, 164, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ignoredPacketTotalCount', Value};

typecast_field(Bin, 165, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ignoredOctetTotalCount', Value};

typecast_field(Bin, 166, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'notSentFlowTotalCount', Value};

typecast_field(Bin, 167, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'notSentPacketTotalCount', Value};

typecast_field(Bin, 168, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'notSentOctetTotalCount', Value};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 169, 16) ->
    {'destinationIPv6Prefix', {A, B, C, D, E, F, G, H}};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 170, 16) ->
    {'sourceIPv6Prefix', {A, B, C, D, E, F, G, H}};

typecast_field(Bin, 171, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postOctetTotalCount', Value};

typecast_field(Bin, 172, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postPacketTotalCount', Value};

typecast_field(Bin, 173, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowKeyIndicator', Value};

typecast_field(Bin, 174, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postMCastPacketTotalCount', Value};

typecast_field(Bin, 175, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postMCastOctetTotalCount', Value};

typecast_field(Bin, 176, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'icmpTypeIPv4', Value};

typecast_field(Bin, 177, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'icmpCodeIPv4', Value};

typecast_field(Bin, 178, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'icmpTypeIPv6', Value};

typecast_field(Bin, 179, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'icmpCodeIPv6', Value};

typecast_field(Bin, 180, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'udpSourcePort', Value};

typecast_field(Bin, 181, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'udpDestinationPort', Value};

typecast_field(Bin, 182, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpSourcePort', Value};

typecast_field(Bin, 183, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpDestinationPort', Value};

typecast_field(Bin, 184, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpSequenceNumber', Value};

typecast_field(Bin, 185, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpAcknowledgementNumber', Value};

typecast_field(Bin, 186, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpWindowSize', Value};

typecast_field(Bin, 187, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpUrgentPointer', Value};

typecast_field(Bin, 188, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpHeaderLength', Value};

typecast_field(Bin, 189, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipHeaderLength', Value};

typecast_field(Bin, 190, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'totalLengthIPv4', Value};

typecast_field(Bin, 191, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'payloadLengthIPv6', Value};

typecast_field(Bin, 192, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipTTL', Value};

typecast_field(Bin, 193, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'nextHeaderIPv6', Value};

typecast_field(Bin, 194, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mplsPayloadLength', Value};

typecast_field(Bin, 195, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipDiffServCodePoint', Value};

typecast_field(Bin, 196, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipPrecedence', Value};

typecast_field(Bin, 197, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'fragmentFlags', Value};

typecast_field(Bin, 198, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'octetDeltaSumOfSquares', Value};

typecast_field(Bin, 199, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'octetTotalSumOfSquares', Value};

typecast_field(Bin, 200, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mplsTopLabelTTL', Value};

typecast_field(Bin, 201, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mplsLabelStackLength', Value};

typecast_field(Bin, 202, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mplsLabelStackDepth', Value};

typecast_field(Bin, 203, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mplsTopLabelExp', Value};

typecast_field(Bin, 204, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipPayloadLength', Value};

typecast_field(Bin, 205, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'udpMessageLength', Value};

typecast_field(Bin, 206, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'isMulticast', Value};

typecast_field(Bin, 207, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipv4IHL', Value};

typecast_field(Bin, 208, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipv4Options', Value};

typecast_field(Bin, 209, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpOptions', Value};

typecast_field(Value, 210, Length)
  when byte_size(Value) == Length ->
    {'paddingOctets', Value};

typecast_field(<<A, B, C, D>>, 211, 4) ->
    {'collectorIPv4Address', {A, B, C, D}};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 212, 16) ->
    {'collectorIPv6Address', {A, B, C, D, E, F, G, H}};

typecast_field(Bin, 213, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'exportInterface', Value};

typecast_field(Bin, 214, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'exportProtocolVersion', Value};

typecast_field(Bin, 215, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'exportTransportProtocol', Value};

typecast_field(Bin, 216, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'collectorTransportPort', Value};

typecast_field(Bin, 217, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'exporterTransportPort', Value};

typecast_field(Bin, 218, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpSynTotalCount', Value};

typecast_field(Bin, 219, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpFinTotalCount', Value};

typecast_field(Bin, 220, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpRstTotalCount', Value};

typecast_field(Bin, 221, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpPshTotalCount', Value};

typecast_field(Bin, 222, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpAckTotalCount', Value};

typecast_field(Bin, 223, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpUrgTotalCount', Value};

typecast_field(Bin, 224, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ipTotalLength', Value};

typecast_field(<<A, B, C, D>>, 225, 4) ->
    {'postNATSourceIPv4Address', {A, B, C, D}};

typecast_field(<<A, B, C, D>>, 226, 4) ->
    {'postNATDestinationIPv4Address', {A, B, C, D}};

typecast_field(Bin, 227, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postNAPTSourceTransportPort', Value};

typecast_field(Bin, 228, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postNAPTDestinationTransportPort', Value};

typecast_field(Bin, 229, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'natOriginatingAddressRealm', Value};

typecast_field(Bin, 230, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'natEvent', Value};

typecast_field(Bin, 231, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'initiatorOctets', Value};

typecast_field(Bin, 232, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'responderOctets', Value};

typecast_field(Bin, 233, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'firewallEvent', Value};

typecast_field(Bin, 234, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ingressVRFID', Value};

typecast_field(Bin, 235, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'egressVRFID', Value};

typecast_field(Value, 236, Length)
  when byte_size(Value) == Length ->
    {'VRFname', Value};

typecast_field(Bin, 237, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postMplsTopLabelExp', Value};

typecast_field(Bin, 238, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'tcpWindowScale', Value};

typecast_field(Bin, 239, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'biflowDirection', Value};

typecast_field(Bin, 240, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ethernetHeaderLength', Value};

typecast_field(Bin, 241, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ethernetPayloadLength', Value};

typecast_field(Bin, 242, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ethernetTotalLength', Value};

typecast_field(Bin, 243, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'dot1qVlanId', Value};

typecast_field(Bin, 244, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'dot1qPriority', Value};

typecast_field(Bin, 245, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'dot1qCustomerVlanId', Value};

typecast_field(Bin, 246, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'dot1qCustomerPriority', Value};

typecast_field(Value, 247, Length)
  when byte_size(Value) == Length ->
    {'metroEvcId', Value};

typecast_field(Bin, 248, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'metroEvcType', Value};

typecast_field(Bin, 249, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'pseudoWireId', Value};

typecast_field(Bin, 250, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'pseudoWireType', Value};

typecast_field(Bin, 251, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'pseudoWireControlWord', Value};

typecast_field(Bin, 252, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ingressPhysicalInterface', Value};

typecast_field(Bin, 253, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'egressPhysicalInterface', Value};

typecast_field(Bin, 254, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postDot1qVlanId', Value};

typecast_field(Bin, 255, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postDot1qCustomerVlanId', Value};

typecast_field(Bin, 256, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ethernetType', Value};

typecast_field(Bin, 257, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postIpPrecedence', Value};

typecast_field(Bin, 258, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'collectionTimeMilliseconds', Value};

typecast_field(Bin, 259, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'exportSctpStreamId', Value};

typecast_field(Bin, 260, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'maxExportSeconds', Value};

typecast_field(Bin, 261, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'maxFlowEndSeconds', Value};

typecast_field(Value, 262, Length)
  when byte_size(Value) == Length ->
    {'messageMD5Checksum', Value};

typecast_field(Bin, 263, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'messageScope', Value};

typecast_field(Bin, 264, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'minExportSeconds', Value};

typecast_field(Bin, 265, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'minFlowStartSeconds', Value};

typecast_field(Value, 266, Length)
  when byte_size(Value) == Length ->
    {'opaqueOctets', Value};

typecast_field(Bin, 267, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'sessionScope', Value};

typecast_field(<<Seconds:32, Fraction:32>>, 268, 8) ->
    {'maxFlowEndMicroseconds', {Seconds, Fraction}};

typecast_field(Bin, 269, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'maxFlowEndMilliseconds', Value};

typecast_field(<<Seconds:32, Fraction:32>>, 270, 8) ->
    {'maxFlowEndNanoseconds', {Seconds, Fraction}};

typecast_field(<<Seconds:32, Fraction:32>>, 271, 8) ->
    {'minFlowStartMicroseconds', {Seconds, Fraction}};

typecast_field(Bin, 272, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'minFlowStartMilliseconds', Value};

typecast_field(<<Seconds:32, Fraction:32>>, 273, 8) ->
    {'minFlowStartNanoseconds', {Seconds, Fraction}};

typecast_field(Value, 274, Length)
  when byte_size(Value) == Length ->
    {'collectorCertificate', Value};

typecast_field(Value, 275, Length)
  when byte_size(Value) == Length ->
    {'exporterCertificate', Value};

typecast_field(<<1>>, 276, 1) ->
    {'dataRecordsReliability', true};

typecast_field(Bin, 277, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'observationPointType', Value};

typecast_field(Bin, 278, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'newConnectionDeltaCount', Value};

typecast_field(Bin, 279, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'connectionSumDurationSeconds', Value};

typecast_field(Bin, 280, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'connectionTransactionId', Value};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 281, 16) ->
    {'postNATSourceIPv6Address', {A, B, C, D, E, F, G, H}};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 282, 16) ->
    {'postNATDestinationIPv6Address', {A, B, C, D, E, F, G, H}};

typecast_field(Bin, 283, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'natPoolId', Value};

typecast_field(Value, 284, Length)
  when byte_size(Value) == Length ->
    {'natPoolName', Value};

typecast_field(Bin, 285, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'anonymizationFlags', Value};

typecast_field(Bin, 286, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'anonymizationTechnique', Value};

typecast_field(Bin, 287, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'informationElementIndex', Value};

typecast_field(Value, 288, Length)
  when byte_size(Value) == Length ->
    {'p2pTechnology', Value};

typecast_field(Value, 289, Length)
  when byte_size(Value) == Length ->
    {'tunnelTechnology', Value};

typecast_field(Value, 290, Length)
  when byte_size(Value) == Length ->
    {'encryptedTechnology', Value};

%% 291 "basicList" basicList "current";

%% 292 "subTemplateList" subTemplateList "current";

%% 293 "subTemplateMultiList" subTemplateMultiList "current";

typecast_field(Bin, 294, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'bgpValidityState', Value};

typecast_field(Bin, 295, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'IPSecSPI', Value};

typecast_field(Bin, 296, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'greKey', Value};

typecast_field(Bin, 297, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'natType', Value};

typecast_field(Bin, 298, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'initiatorPackets', Value};

typecast_field(Bin, 299, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'responderPackets', Value};

typecast_field(Value, 300, Length)
  when byte_size(Value) == Length ->
    {'observationDomainName', Value};

typecast_field(Bin, 301, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'selectionSequenceId', Value};

typecast_field(Bin, 302, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'selectorId', Value};

typecast_field(Bin, 303, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'informationElementId', Value};

typecast_field(Bin, 304, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'selectorAlgorithm', Value};

typecast_field(Bin, 305, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'samplingPacketInterval', Value};

typecast_field(Bin, 306, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'samplingPacketSpace', Value};

typecast_field(Bin, 307, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'samplingTimeInterval', Value};

typecast_field(Bin, 308, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'samplingTimeSpace', Value};

typecast_field(Bin, 309, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'samplingSize', Value};

typecast_field(Bin, 310, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'samplingPopulation', Value};

typecast_field(Bin, 311, Length)
  when Length =< 8 ->
    <<Value:Length/float-unit:8>> = Bin,
    {'samplingProbability', Value};

typecast_field(Bin, 312, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'dataLinkFrameSize', Value};

typecast_field(Value, 313, Length)
  when byte_size(Value) == Length ->
    {'ipHeaderPacketSection', Value};

typecast_field(Value, 314, Length)
  when byte_size(Value) == Length ->
    {'ipPayloadPacketSection', Value};

typecast_field(Value, 315, Length)
  when byte_size(Value) == Length ->
    {'dataLinkFrameSection', Value};

typecast_field(Value, 316, Length)
  when byte_size(Value) == Length ->
    {'mplsLabelStackSection', Value};

typecast_field(Value, 317, Length)
  when byte_size(Value) == Length ->
    {'mplsPayloadPacketSection', Value};

typecast_field(Bin, 318, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'selectorIdTotalPktsObserved', Value};

typecast_field(Bin, 319, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'selectorIdTotalPktsSelected', Value};

typecast_field(Bin, 320, Length)
  when Length =< 8 ->
    <<Value:Length/float-unit:8>> = Bin,
    {'absoluteError', Value};

typecast_field(Bin, 321, Length)
  when Length =< 8 ->
    <<Value:Length/float-unit:8>> = Bin,
    {'relativeError', Value};

typecast_field(Bin, 322, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'observationTimeSeconds', Value};

typecast_field(Bin, 323, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'observationTimeMilliseconds', Value};

typecast_field(<<Seconds:32, Fraction:32>>, 324, 8) ->
    {'observationTimeMicroseconds', {Seconds, Fraction}};

typecast_field(<<Seconds:32, Fraction:32>>, 325, 8) ->
    {'observationTimeNanoseconds', {Seconds, Fraction}};

typecast_field(Bin, 326, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'digestHashValue', Value};

typecast_field(Bin, 327, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'hashIPPayloadOffset', Value};

typecast_field(Bin, 328, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'hashIPPayloadSize', Value};

typecast_field(Bin, 329, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'hashOutputRangeMin', Value};

typecast_field(Bin, 330, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'hashOutputRangeMax', Value};

typecast_field(Bin, 331, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'hashSelectedRangeMin', Value};

typecast_field(Bin, 332, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'hashSelectedRangeMax', Value};

typecast_field(<<1>>, 333, 1) ->
    {'hashDigestOutput', true};

typecast_field(Bin, 334, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'hashInitialiserValue', Value};

typecast_field(Value, 335, Length)
  when byte_size(Value) == Length ->
    {'selectorName', Value};

typecast_field(Bin, 336, Length)
  when Length =< 8 ->
    <<Value:Length/float-unit:8>> = Bin,
    {'upperCILimit', Value};

typecast_field(Bin, 337, Length)
  when Length =< 8 ->
    <<Value:Length/float-unit:8>> = Bin,
    {'lowerCILimit', Value};

typecast_field(Bin, 338, Length)
  when Length =< 8 ->
    <<Value:Length/float-unit:8>> = Bin,
    {'confidenceLevel', Value};

typecast_field(Bin, 339, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'informationElementDataType', Value};

typecast_field(Value, 340, Length)
  when byte_size(Value) == Length ->
    {'informationElementDescription', Value};

typecast_field(Value, 341, Length)
  when byte_size(Value) == Length ->
    {'informationElementName', Value};

typecast_field(Bin, 342, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'informationElementRangeBegin', Value};

typecast_field(Bin, 343, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'informationElementRangeEnd', Value};

typecast_field(Bin, 344, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'informationElementSemantics', Value};

typecast_field(Bin, 345, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'informationElementUnits', Value};

typecast_field(Bin, 346, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'privateEnterpriseNumber', Value};

typecast_field(Value, 347, Length)
  when byte_size(Value) == Length ->
    {'virtualStationInterfaceId', Value};

typecast_field(Value, 348, Length)
  when byte_size(Value) == Length ->
    {'virtualStationInterfaceName', Value};

typecast_field(Value, 349, Length)
  when byte_size(Value) == Length ->
    {'virtualStationUUID', Value};

typecast_field(Value, 350, Length)
  when byte_size(Value) == Length ->
    {'virtualStationName', Value};

typecast_field(Bin, 351, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'layer2SegmentId', Value};

typecast_field(Bin, 352, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'layer2OctetDeltaCount', Value};

typecast_field(Bin, 353, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'layer2OctetTotalCount', Value};

typecast_field(Bin, 354, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ingressUnicastPacketTotalCount', Value};

typecast_field(Bin, 355, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ingressMulticastPacketTotalCount', Value};

typecast_field(Bin, 356, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ingressBroadcastPacketTotalCount', Value};

typecast_field(Bin, 357, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'egressUnicastPacketTotalCount', Value};

typecast_field(Bin, 358, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'egressBroadcastPacketTotalCount', Value};

typecast_field(Bin, 359, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'monitoringIntervalStartMilliSeconds', Value};

typecast_field(Bin, 360, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'monitoringIntervalEndMilliSeconds', Value};

typecast_field(Bin, 361, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'portRangeStart', Value};

typecast_field(Bin, 362, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'portRangeEnd', Value};

typecast_field(Bin, 363, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'portRangeStepSize', Value};

typecast_field(Bin, 364, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'portRangeNumPorts', Value};

typecast_field(Value, 365, 6)
  when byte_size(Value) =:= 6 ->
    {'staMacAddress', Value};

typecast_field(<<A, B, C, D>>, 366, 4) ->
    {'staIPv4Address', {A, B, C, D}};

typecast_field(Value, 367, 6)
  when byte_size(Value) =:= 6 ->
    {'wtpMacAddress', Value};

typecast_field(Bin, 368, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ingressInterfaceType', Value};

typecast_field(Bin, 369, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'egressInterfaceType', Value};

typecast_field(Bin, 370, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'rtpSequenceNumber', Value};

typecast_field(Value, 371, Length)
  when byte_size(Value) == Length ->
    {'userName', Value};

typecast_field(Value, 372, Length)
  when byte_size(Value) == Length ->
    {'applicationCategoryName', Value};

typecast_field(Value, 373, Length)
  when byte_size(Value) == Length ->
    {'applicationSubCategoryName', Value};

typecast_field(Value, 374, Length)
  when byte_size(Value) == Length ->
    {'applicationGroupName', Value};

typecast_field(Bin, 375, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'originalFlowsPresent', Value};

typecast_field(Bin, 376, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'originalFlowsInitiated', Value};

typecast_field(Bin, 377, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'originalFlowsCompleted', Value};

typecast_field(Bin, 378, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'distinctCountOfSourceIPAddress', Value};

typecast_field(Bin, 379, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'distinctCountOfDestinationIPAddress', Value};

typecast_field(Bin, 380, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'distinctCountOfSourceIPv4Address', Value};

typecast_field(Bin, 381, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'distinctCountOfDestinationIPv4Address', Value};

typecast_field(Bin, 382, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'distinctCountOfSourceIPv6Address', Value};

typecast_field(Bin, 383, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'distinctCountOfDestinationIPv6Address', Value};

typecast_field(Bin, 384, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'valueDistributionMethod', Value};

typecast_field(Bin, 385, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'rfc3550JitterMilliseconds', Value};

typecast_field(Bin, 386, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'rfc3550JitterMicroseconds', Value};

typecast_field(Bin, 387, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'rfc3550JitterNanoseconds', Value};

typecast_field(<<1>>, 388, 1) ->
    {'dot1qDEI', true};

typecast_field(<<1>>, 389, 1) ->
    {'dot1qCustomerDEI', true};

typecast_field(Bin, 390, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowSelectorAlgorithm', Value};

typecast_field(Bin, 391, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowSelectedOctetDeltaCount', Value};

typecast_field(Bin, 392, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowSelectedPacketDeltaCount', Value};

typecast_field(Bin, 393, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowSelectedFlowDeltaCount', Value};

typecast_field(Bin, 394, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'selectorIDTotalFlowsObserved', Value};

typecast_field(Bin, 395, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'selectorIDTotalFlowsSelected', Value};

typecast_field(Bin, 396, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'samplingFlowInterval', Value};

typecast_field(Bin, 397, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'samplingFlowSpacing', Value};

typecast_field(Bin, 398, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowSamplingTimeInterval', Value};

typecast_field(Bin, 399, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'flowSamplingTimeSpacing', Value};

typecast_field(Bin, 400, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'hashFlowDomain', Value};

typecast_field(Bin, 401, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'transportOctetDeltaCount', Value};

typecast_field(Bin, 402, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'transportPacketDeltaCount', Value};

typecast_field(<<A, B, C, D>>, 403, 4) ->
    {'originalExporterIPv4Address', {A, B, C, D}};

typecast_field(<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 404, 16) ->
    {'originalExporterIPv6Address', {A, B, C, D, E, F, G, H}};

typecast_field(Bin, 405, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'originalObservationDomainId', Value};

typecast_field(Bin, 406, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'intermediateProcessId', Value};

typecast_field(Bin, 407, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ignoredDataRecordTotalCount', Value};

typecast_field(Bin, 408, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'dataLinkFrameType', Value};

typecast_field(Bin, 409, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'sectionOffset', Value};

typecast_field(Bin, 410, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'sectionExportedOctets', Value};

typecast_field(Value, 411, Length)
  when byte_size(Value) == Length ->
    {'dot1qServiceInstanceTag', Value};

typecast_field(Bin, 412, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'dot1qServiceInstanceId', Value};

typecast_field(Bin, 413, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'dot1qServiceInstancePriority', Value};

typecast_field(Value, 414, 6)
  when byte_size(Value) =:= 6 ->
    {'dot1qCustomerSourceMacAddress', Value};

typecast_field(Value, 415, 6)
  when byte_size(Value) =:= 6 ->
    {'dot1qCustomerDestinationMacAddress', Value};

typecast_field(Bin, 417, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postLayer2OctetDeltaCount', Value};

typecast_field(Bin, 418, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postMCastLayer2OctetDeltaCount', Value};

typecast_field(Bin, 420, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postLayer2OctetTotalCount', Value};

typecast_field(Bin, 421, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'postMCastLayer2OctetTotalCount', Value};

typecast_field(Bin, 422, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'minimumLayer2TotalLength', Value};

typecast_field(Bin, 423, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'maximumLayer2TotalLength', Value};

typecast_field(Bin, 424, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'droppedLayer2OctetDeltaCount', Value};

typecast_field(Bin, 425, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'droppedLayer2OctetTotalCount', Value};

typecast_field(Bin, 426, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ignoredLayer2OctetTotalCount', Value};

typecast_field(Bin, 427, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'notSentLayer2OctetTotalCount', Value};

typecast_field(Bin, 428, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'layer2OctetDeltaSumOfSquares', Value};

typecast_field(Bin, 429, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'layer2OctetTotalSumOfSquares', Value};

typecast_field(Bin, 430, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'layer2FrameDeltaCount', Value};

typecast_field(Bin, 431, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'layer2FrameTotalCount', Value};

typecast_field(<<A, B, C, D>>, 432, 4) ->
    {'pseudoWireDestinationIPv4Address', {A, B, C, D}};

typecast_field(Bin, 433, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'ignoredLayer2FrameTotalCount', Value};

typecast_field(Bin, 434, Length)
  when Length =< 8 ->
    <<Value:Length/signed-integer-unit:8>> = Bin,
    {'mibObjectValueInteger', Value};

typecast_field(Value, 435, Length)
  when byte_size(Value) == Length ->
    {'mibObjectValueOctetString', Value};

typecast_field(Value, 436, Length)
  when byte_size(Value) == Length ->
    {'mibObjectValueOID', Value};

typecast_field(Value, 437, Length)
  when byte_size(Value) == Length ->
    {'mibObjectValueBits', Value};

typecast_field(<<A, B, C, D>>, 438, 4) ->
    {'mibObjectValueIPAddress', {A, B, C, D}};

typecast_field(Bin, 439, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mibObjectValueCounter', Value};

typecast_field(Bin, 440, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mibObjectValueGauge', Value};

typecast_field(Bin, 441, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mibObjectValueTimeTicks', Value};

typecast_field(Bin, 442, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mibObjectValueUnsigned', Value};

%% 443 "mibObjectValueTable" subTemplateList "current";

%% 444 "mibObjectValueRow" subTemplateList "current";

typecast_field(Value, 445, Length)
  when byte_size(Value) == Length ->
    {'mibObjectIdentifier', Value};

typecast_field(Bin, 446, Length)
  when Length =< 4 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mibSubIdentifier', Value};

typecast_field(Bin, 447, Length)
  when Length =< 8 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mibIndexIndicator', Value};

typecast_field(Bin, 448, Length)
  when Length =< 1 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'mibCaptureTimeSemantics', Value};

typecast_field(Value, 449, Length)
  when byte_size(Value) == Length ->
    {'mibContextEngineID', Value};

typecast_field(Value, 450, Length)
  when byte_size(Value) == Length ->
    {'mibContextName', Value};

typecast_field(Value, 451, Length)
  when byte_size(Value) == Length ->
    {'mibObjectName', Value};

typecast_field(Value, 452, Length)
  when byte_size(Value) == Length ->
    {'mibObjectDescription', Value};

typecast_field(Value, 453, Length)
  when byte_size(Value) == Length ->
    {'mibObjectSyntax', Value};

typecast_field(Value, 454, Length)
  when byte_size(Value) == Length ->
    {'mibModuleName', Value};

typecast_field(Value, 455, Length)
  when byte_size(Value) == Length ->
    {'mobileIMSI', Value};

typecast_field(Value, 456, Length)
  when byte_size(Value) == Length ->
    {'mobileMSISDN', Value};

typecast_field(Bin, 457, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'httpStatusCode', Value};

typecast_field(Bin, 458, Length)
  when Length =< 2 ->
    <<Value:Length/unsigned-integer-unit:8>> = Bin,
    {'sourceTransportPortsLimit', Value};

typecast_field(Value, 459, Length)
  when byte_size(Value) == Length ->
    {'httpRequestMethod', Value};

typecast_field(Value, 460, Length)
  when byte_size(Value) == Length ->
    {'httpRequestHost', Value};

typecast_field(Value, 461, Length)
  when byte_size(Value) == Length ->
    {'httpRequestTarget', Value};

typecast_field(Value, 462, Length)
  when byte_size(Value) == Length ->
    {'httpMessageVersion', Value}.



%% ============================

encode_field('octetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 1, 8};

encode_field('packetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 2, 8};

encode_field('deltaFlowCount', Value) ->
    {<<Value:64/unsigned-integer>>, 3, 8};

encode_field('protocolIdentifier', Value) ->
    {<<Value:8/unsigned-integer>>, 4, 1};

encode_field('ipClassOfService', Value) ->
    {<<Value:8/unsigned-integer>>, 5, 1};

encode_field('tcpControlBits', Value) ->
    {<<Value:16/unsigned-integer>>, 6, 2};

encode_field('sourceTransportPort', Value) ->
    {<<Value:16/unsigned-integer>>, 7, 2};

encode_field('sourceIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 8, 4};

encode_field('sourceIPv4PrefixLength', Value) ->
    {<<Value:8/unsigned-integer>>, 9, 1};

encode_field('ingressInterface', Value) ->
    {<<Value:32/unsigned-integer>>, 10, 4};

encode_field('destinationTransportPort', Value) ->
    {<<Value:16/unsigned-integer>>, 11, 2};

encode_field('destinationIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 12, 4};

encode_field('destinationIPv4PrefixLength', Value) ->
    {<<Value:8/unsigned-integer>>, 13, 1};

encode_field('egressInterface', Value) ->
    {<<Value:32/unsigned-integer>>, 14, 4};

encode_field('ipNextHopIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 15, 4};

encode_field('bgpSourceAsNumber', Value) ->
    {<<Value:32/unsigned-integer>>, 16, 4};

encode_field('bgpDestinationAsNumber', Value) ->
    {<<Value:32/unsigned-integer>>, 17, 4};

encode_field('bgpNextHopIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 18, 4};

encode_field('postMCastPacketDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 19, 8};

encode_field('postMCastOctetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 20, 8};

encode_field('flowEndSysUpTime', Value) ->
    {<<Value:32/unsigned-integer>>, 21, 4};

encode_field('flowStartSysUpTime', Value) ->
    {<<Value:32/unsigned-integer>>, 22, 4};

encode_field('postOctetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 23, 8};

encode_field('postPacketDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 24, 8};

encode_field('minimumIpTotalLength', Value) ->
    {<<Value:64/unsigned-integer>>, 25, 8};

encode_field('maximumIpTotalLength', Value) ->
    {<<Value:64/unsigned-integer>>, 26, 8};

encode_field('sourceIPv6Address', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 27, 16};

encode_field('destinationIPv6Address', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 28, 16};

encode_field('sourceIPv6PrefixLength', Value) ->
    {<<Value:8/unsigned-integer>>, 29, 1};

encode_field('destinationIPv6PrefixLength', Value) ->
    {<<Value:8/unsigned-integer>>, 30, 1};

encode_field('flowLabelIPv6', Value) ->
    {<<Value:32/unsigned-integer>>, 31, 4};

encode_field('icmpTypeCodeIPv4', Value) ->
    {<<Value:16/unsigned-integer>>, 32, 2};

encode_field('igmpType', Value) ->
    {<<Value:8/unsigned-integer>>, 33, 1};

encode_field('flowActiveTimeout', Value) ->
    {<<Value:16/unsigned-integer>>, 36, 2};

encode_field('flowIdleTimeout', Value) ->
    {<<Value:16/unsigned-integer>>, 37, 2};

encode_field('exportedOctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 40, 8};

encode_field('exportedMessageTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 41, 8};

encode_field('exportedFlowRecordTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 42, 8};

encode_field('sourceIPv4Prefix', {A, B, C, D}) ->
    {<<A, B, C, D>>, 44, 4};

encode_field('destinationIPv4Prefix', {A, B, C, D}) ->
    {<<A, B, C, D>>, 45, 4};

encode_field('mplsTopLabelType', Value) ->
    {<<Value:8/unsigned-integer>>, 46, 1};

encode_field('mplsTopLabelIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 47, 4};

encode_field('minimumTTL', Value) ->
    {<<Value:8/unsigned-integer>>, 52, 1};

encode_field('maximumTTL', Value) ->
    {<<Value:8/unsigned-integer>>, 53, 1};

encode_field('fragmentIdentification', Value) ->
    {<<Value:32/unsigned-integer>>, 54, 4};

encode_field('postIpClassOfService', Value) ->
    {<<Value:8/unsigned-integer>>, 55, 1};

encode_field('sourceMacAddress', Value)
  when is_binary(Value) andalso byte_size(Value) =:= 6 ->
    {Value, 56, 6};

encode_field('postDestinationMacAddress', Value)
  when is_binary(Value) andalso byte_size(Value) =:= 6 ->
    {Value, 57, 6};

encode_field('vlanId', Value) ->
    {<<Value:16/unsigned-integer>>, 58, 2};

encode_field('postVlanId', Value) ->
    {<<Value:16/unsigned-integer>>, 59, 2};

encode_field('ipVersion', Value) ->
    {<<Value:8/unsigned-integer>>, 60, 1};

encode_field('flowDirection', Value) ->
    {<<Value:8/unsigned-integer>>, 61, 1};

encode_field('ipNextHopIPv6Address', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 62, 16};

encode_field('bgpNextHopIPv6Address', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 63, 16};

encode_field('ipv6ExtensionHeaders', Value) ->
    {<<Value:32/unsigned-integer>>, 64, 4};

encode_field('mplsTopLabelStackSection', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 70, 65535};

encode_field('mplsLabelStackSection2', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 71, 65535};

encode_field('mplsLabelStackSection3', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 72, 65535};

encode_field('mplsLabelStackSection4', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 73, 65535};

encode_field('mplsLabelStackSection5', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 74, 65535};

encode_field('mplsLabelStackSection6', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 75, 65535};

encode_field('mplsLabelStackSection7', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 76, 65535};

encode_field('mplsLabelStackSection8', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 77, 65535};

encode_field('mplsLabelStackSection9', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 78, 65535};

encode_field('mplsLabelStackSection10', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 79, 65535};

encode_field('destinationMacAddress', Value)
  when is_binary(Value) andalso byte_size(Value) =:= 6 ->
    {Value, 80, 6};

encode_field('postSourceMacAddress', Value)
  when is_binary(Value) andalso byte_size(Value) =:= 6 ->
    {Value, 81, 6};

encode_field('interfaceName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 82, 65535};

encode_field('interfaceDescription', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 83, 65535};

encode_field('octetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 85, 8};

encode_field('packetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 86, 8};

encode_field('fragmentOffset', Value) ->
    {<<Value:16/unsigned-integer>>, 88, 2};

encode_field('forwardingStatus', Value) ->
    {<<Value:32/unsigned-integer>>, 89, 4};

encode_field('mplsVpnRouteDistinguisher', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 90, 65535};

encode_field('mplsTopLabelPrefixLength', Value) ->
    {<<Value:8/unsigned-integer>>, 91, 1};

encode_field('srcTrafficIndex', Value) ->
    {<<Value:32/unsigned-integer>>, 92, 4};

encode_field('dstTrafficIndex', Value) ->
    {<<Value:32/unsigned-integer>>, 93, 4};

encode_field('applicationDescription', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 94, 65535};

encode_field('applicationId', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 95, 65535};

encode_field('applicationName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 96, 65535};

encode_field('postIpDiffServCodePoint', Value) ->
    {<<Value:8/unsigned-integer>>, 98, 1};

encode_field('multicastReplicationFactor', Value) ->
    {<<Value:32/unsigned-integer>>, 99, 4};

encode_field('classificationEngineId', Value) ->
    {<<Value:8/unsigned-integer>>, 101, 1};

encode_field('bgpNextAdjacentAsNumber', Value) ->
    {<<Value:32/unsigned-integer>>, 128, 4};

encode_field('bgpPrevAdjacentAsNumber', Value) ->
    {<<Value:32/unsigned-integer>>, 129, 4};

encode_field('exporterIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 130, 4};

encode_field('exporterIPv6Address', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 131, 16};

encode_field('droppedOctetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 132, 8};

encode_field('droppedPacketDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 133, 8};

encode_field('droppedOctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 134, 8};

encode_field('droppedPacketTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 135, 8};

encode_field('flowEndReason', Value) ->
    {<<Value:8/unsigned-integer>>, 136, 1};

encode_field('commonPropertiesId', Value) ->
    {<<Value:64/unsigned-integer>>, 137, 8};

encode_field('observationPointId', Value) ->
    {<<Value:64/unsigned-integer>>, 138, 8};

encode_field('icmpTypeCodeIPv6', Value) ->
    {<<Value:16/unsigned-integer>>, 139, 2};

encode_field('mplsTopLabelIPv6Address', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 140, 16};

encode_field('lineCardId', Value) ->
    {<<Value:32/unsigned-integer>>, 141, 4};

encode_field('portId', Value) ->
    {<<Value:32/unsigned-integer>>, 142, 4};

encode_field('meteringProcessId', Value) ->
    {<<Value:32/unsigned-integer>>, 143, 4};

encode_field('exportingProcessId', Value) ->
    {<<Value:32/unsigned-integer>>, 144, 4};

encode_field('templateId', Value) ->
    {<<Value:16/unsigned-integer>>, 145, 2};

encode_field('wlanChannelId', Value) ->
    {<<Value:8/unsigned-integer>>, 146, 1};

encode_field('wlanSSID', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 147, 65535};

encode_field('flowId', Value) ->
    {<<Value:64/unsigned-integer>>, 148, 8};

encode_field('observationDomainId', Value) ->
    {<<Value:32/unsigned-integer>>, 149, 4};

encode_field('flowStartSeconds', Value) ->
    {<<Value:32/unsigned-integer>>, 150, 4};

encode_field('flowEndSeconds', Value) ->
    {<<Value:32/unsigned-integer>>, 151, 4};

encode_field('flowStartMilliseconds', Value) ->
    {<<Value:64/unsigned-integer>>, 152, 8};

encode_field('flowEndMilliseconds', Value) ->
    {<<Value:64/unsigned-integer>>, 153, 8};

encode_field('flowStartMicroseconds', {Seconds, Fraction}) ->
    {<<Seconds:32, Fraction:32>>, 154, 8};

encode_field('flowEndMicroseconds', {Seconds, Fraction}) ->
    {<<Seconds:32, Fraction:32>>, 155, 8};

encode_field('flowStartNanoseconds', {Seconds, Fraction}) ->
    {<<Seconds:32, Fraction:32>>, 156, 8};

encode_field('flowEndNanoseconds', {Seconds, Fraction}) ->
    {<<Seconds:32, Fraction:32>>, 157, 8};

encode_field('flowStartDeltaMicroseconds', Value) ->
    {<<Value:32/unsigned-integer>>, 158, 4};

encode_field('flowEndDeltaMicroseconds', Value) ->
    {<<Value:32/unsigned-integer>>, 159, 4};

encode_field('systemInitTimeMilliseconds', Value) ->
    {<<Value:64/unsigned-integer>>, 160, 8};

encode_field('flowDurationMilliseconds', Value) ->
    {<<Value:32/unsigned-integer>>, 161, 4};

encode_field('flowDurationMicroseconds', Value) ->
    {<<Value:32/unsigned-integer>>, 162, 4};

encode_field('observedFlowTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 163, 8};

encode_field('ignoredPacketTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 164, 8};

encode_field('ignoredOctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 165, 8};

encode_field('notSentFlowTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 166, 8};

encode_field('notSentPacketTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 167, 8};

encode_field('notSentOctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 168, 8};

encode_field('destinationIPv6Prefix', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 169, 16};

encode_field('sourceIPv6Prefix', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 170, 16};

encode_field('postOctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 171, 8};

encode_field('postPacketTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 172, 8};

encode_field('flowKeyIndicator', Value) ->
    {<<Value:64/unsigned-integer>>, 173, 8};

encode_field('postMCastPacketTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 174, 8};

encode_field('postMCastOctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 175, 8};

encode_field('icmpTypeIPv4', Value) ->
    {<<Value:8/unsigned-integer>>, 176, 1};

encode_field('icmpCodeIPv4', Value) ->
    {<<Value:8/unsigned-integer>>, 177, 1};

encode_field('icmpTypeIPv6', Value) ->
    {<<Value:8/unsigned-integer>>, 178, 1};

encode_field('icmpCodeIPv6', Value) ->
    {<<Value:8/unsigned-integer>>, 179, 1};

encode_field('udpSourcePort', Value) ->
    {<<Value:16/unsigned-integer>>, 180, 2};

encode_field('udpDestinationPort', Value) ->
    {<<Value:16/unsigned-integer>>, 181, 2};

encode_field('tcpSourcePort', Value) ->
    {<<Value:16/unsigned-integer>>, 182, 2};

encode_field('tcpDestinationPort', Value) ->
    {<<Value:16/unsigned-integer>>, 183, 2};

encode_field('tcpSequenceNumber', Value) ->
    {<<Value:32/unsigned-integer>>, 184, 4};

encode_field('tcpAcknowledgementNumber', Value) ->
    {<<Value:32/unsigned-integer>>, 185, 4};

encode_field('tcpWindowSize', Value) ->
    {<<Value:16/unsigned-integer>>, 186, 2};

encode_field('tcpUrgentPointer', Value) ->
    {<<Value:16/unsigned-integer>>, 187, 2};

encode_field('tcpHeaderLength', Value) ->
    {<<Value:8/unsigned-integer>>, 188, 1};

encode_field('ipHeaderLength', Value) ->
    {<<Value:8/unsigned-integer>>, 189, 1};

encode_field('totalLengthIPv4', Value) ->
    {<<Value:16/unsigned-integer>>, 190, 2};

encode_field('payloadLengthIPv6', Value) ->
    {<<Value:16/unsigned-integer>>, 191, 2};

encode_field('ipTTL', Value) ->
    {<<Value:8/unsigned-integer>>, 192, 1};

encode_field('nextHeaderIPv6', Value) ->
    {<<Value:8/unsigned-integer>>, 193, 1};

encode_field('mplsPayloadLength', Value) ->
    {<<Value:32/unsigned-integer>>, 194, 4};

encode_field('ipDiffServCodePoint', Value) ->
    {<<Value:8/unsigned-integer>>, 195, 1};

encode_field('ipPrecedence', Value) ->
    {<<Value:8/unsigned-integer>>, 196, 1};

encode_field('fragmentFlags', Value) ->
    {<<Value:8/unsigned-integer>>, 197, 1};

encode_field('octetDeltaSumOfSquares', Value) ->
    {<<Value:64/unsigned-integer>>, 198, 8};

encode_field('octetTotalSumOfSquares', Value) ->
    {<<Value:64/unsigned-integer>>, 199, 8};

encode_field('mplsTopLabelTTL', Value) ->
    {<<Value:8/unsigned-integer>>, 200, 1};

encode_field('mplsLabelStackLength', Value) ->
    {<<Value:32/unsigned-integer>>, 201, 4};

encode_field('mplsLabelStackDepth', Value) ->
    {<<Value:32/unsigned-integer>>, 202, 4};

encode_field('mplsTopLabelExp', Value) ->
    {<<Value:8/unsigned-integer>>, 203, 1};

encode_field('ipPayloadLength', Value) ->
    {<<Value:32/unsigned-integer>>, 204, 4};

encode_field('udpMessageLength', Value) ->
    {<<Value:16/unsigned-integer>>, 205, 2};

encode_field('isMulticast', Value) ->
    {<<Value:8/unsigned-integer>>, 206, 1};

encode_field('ipv4IHL', Value) ->
    {<<Value:8/unsigned-integer>>, 207, 1};

encode_field('ipv4Options', Value) ->
    {<<Value:32/unsigned-integer>>, 208, 4};

encode_field('tcpOptions', Value) ->
    {<<Value:64/unsigned-integer>>, 209, 8};

encode_field('paddingOctets', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 210, 65535};

encode_field('collectorIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 211, 4};

encode_field('collectorIPv6Address', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 212, 16};

encode_field('exportInterface', Value) ->
    {<<Value:32/unsigned-integer>>, 213, 4};

encode_field('exportProtocolVersion', Value) ->
    {<<Value:8/unsigned-integer>>, 214, 1};

encode_field('exportTransportProtocol', Value) ->
    {<<Value:8/unsigned-integer>>, 215, 1};

encode_field('collectorTransportPort', Value) ->
    {<<Value:16/unsigned-integer>>, 216, 2};

encode_field('exporterTransportPort', Value) ->
    {<<Value:16/unsigned-integer>>, 217, 2};

encode_field('tcpSynTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 218, 8};

encode_field('tcpFinTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 219, 8};

encode_field('tcpRstTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 220, 8};

encode_field('tcpPshTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 221, 8};

encode_field('tcpAckTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 222, 8};

encode_field('tcpUrgTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 223, 8};

encode_field('ipTotalLength', Value) ->
    {<<Value:64/unsigned-integer>>, 224, 8};

encode_field('postNATSourceIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 225, 4};

encode_field('postNATDestinationIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 226, 4};

encode_field('postNAPTSourceTransportPort', Value) ->
    {<<Value:16/unsigned-integer>>, 227, 2};

encode_field('postNAPTDestinationTransportPort', Value) ->
    {<<Value:16/unsigned-integer>>, 228, 2};

encode_field('natOriginatingAddressRealm', Value) ->
    {<<Value:8/unsigned-integer>>, 229, 1};

encode_field('natEvent', Value) ->
    {<<Value:8/unsigned-integer>>, 230, 1};

encode_field('initiatorOctets', Value) ->
    {<<Value:64/unsigned-integer>>, 231, 8};

encode_field('responderOctets', Value) ->
    {<<Value:64/unsigned-integer>>, 232, 8};

encode_field('firewallEvent', Value) ->
    {<<Value:8/unsigned-integer>>, 233, 1};

encode_field('ingressVRFID', Value) ->
    {<<Value:32/unsigned-integer>>, 234, 4};

encode_field('egressVRFID', Value) ->
    {<<Value:32/unsigned-integer>>, 235, 4};

encode_field('VRFname', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 236, 65535};

encode_field('postMplsTopLabelExp', Value) ->
    {<<Value:8/unsigned-integer>>, 237, 1};

encode_field('tcpWindowScale', Value) ->
    {<<Value:16/unsigned-integer>>, 238, 2};

encode_field('biflowDirection', Value) ->
    {<<Value:8/unsigned-integer>>, 239, 1};

encode_field('ethernetHeaderLength', Value) ->
    {<<Value:8/unsigned-integer>>, 240, 1};

encode_field('ethernetPayloadLength', Value) ->
    {<<Value:16/unsigned-integer>>, 241, 2};

encode_field('ethernetTotalLength', Value) ->
    {<<Value:16/unsigned-integer>>, 242, 2};

encode_field('dot1qVlanId', Value) ->
    {<<Value:16/unsigned-integer>>, 243, 2};

encode_field('dot1qPriority', Value) ->
    {<<Value:8/unsigned-integer>>, 244, 1};

encode_field('dot1qCustomerVlanId', Value) ->
    {<<Value:16/unsigned-integer>>, 245, 2};

encode_field('dot1qCustomerPriority', Value) ->
    {<<Value:8/unsigned-integer>>, 246, 1};

encode_field('metroEvcId', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 247, 65535};

encode_field('metroEvcType', Value) ->
    {<<Value:8/unsigned-integer>>, 248, 1};

encode_field('pseudoWireId', Value) ->
    {<<Value:32/unsigned-integer>>, 249, 4};

encode_field('pseudoWireType', Value) ->
    {<<Value:16/unsigned-integer>>, 250, 2};

encode_field('pseudoWireControlWord', Value) ->
    {<<Value:32/unsigned-integer>>, 251, 4};

encode_field('ingressPhysicalInterface', Value) ->
    {<<Value:32/unsigned-integer>>, 252, 4};

encode_field('egressPhysicalInterface', Value) ->
    {<<Value:32/unsigned-integer>>, 253, 4};

encode_field('postDot1qVlanId', Value) ->
    {<<Value:16/unsigned-integer>>, 254, 2};

encode_field('postDot1qCustomerVlanId', Value) ->
    {<<Value:16/unsigned-integer>>, 255, 2};

encode_field('ethernetType', Value) ->
    {<<Value:16/unsigned-integer>>, 256, 2};

encode_field('postIpPrecedence', Value) ->
    {<<Value:8/unsigned-integer>>, 257, 1};

encode_field('collectionTimeMilliseconds', Value) ->
    {<<Value:64/unsigned-integer>>, 258, 8};

encode_field('exportSctpStreamId', Value) ->
    {<<Value:16/unsigned-integer>>, 259, 2};

encode_field('maxExportSeconds', Value) ->
    {<<Value:32/unsigned-integer>>, 260, 4};

encode_field('maxFlowEndSeconds', Value) ->
    {<<Value:32/unsigned-integer>>, 261, 4};

encode_field('messageMD5Checksum', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 262, 65535};

encode_field('messageScope', Value) ->
    {<<Value:8/unsigned-integer>>, 263, 1};

encode_field('minExportSeconds', Value) ->
    {<<Value:32/unsigned-integer>>, 264, 4};

encode_field('minFlowStartSeconds', Value) ->
    {<<Value:32/unsigned-integer>>, 265, 4};

encode_field('opaqueOctets', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 266, 65535};

encode_field('sessionScope', Value) ->
    {<<Value:8/unsigned-integer>>, 267, 1};

encode_field('maxFlowEndMicroseconds', {Seconds, Fraction}) ->
    {<<Seconds:32, Fraction:32>>, 268, 8};

encode_field('maxFlowEndMilliseconds', Value) ->
    {<<Value:64/unsigned-integer>>, 269, 8};

encode_field('maxFlowEndNanoseconds', {Seconds, Fraction}) ->
    {<<Seconds:32, Fraction:32>>, 270, 8};

encode_field('minFlowStartMicroseconds', {Seconds, Fraction}) ->
    {<<Seconds:32, Fraction:32>>, 271, 8};

encode_field('minFlowStartMilliseconds', Value) ->
    {<<Value:64/unsigned-integer>>, 272, 8};

encode_field('minFlowStartNanoseconds', {Seconds, Fraction}) ->
    {<<Seconds:32, Fraction:32>>, 273, 8};

encode_field('collectorCertificate', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 274, 65535};

encode_field('exporterCertificate', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 275, 65535};

encode_field('dataRecordsReliability', true) ->
    {<<1>>, 276, 1};

encode_field('observationPointType', Value) ->
    {<<Value:8/unsigned-integer>>, 277, 1};

encode_field('newConnectionDeltaCount', Value) ->
    {<<Value:32/unsigned-integer>>, 278, 4};

encode_field('connectionSumDurationSeconds', Value) ->
    {<<Value:64/unsigned-integer>>, 279, 8};

encode_field('connectionTransactionId', Value) ->
    {<<Value:64/unsigned-integer>>, 280, 8};

encode_field('postNATSourceIPv6Address', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 281, 16};

encode_field('postNATDestinationIPv6Address', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 282, 16};

encode_field('natPoolId', Value) ->
    {<<Value:32/unsigned-integer>>, 283, 4};

encode_field('natPoolName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 284, 65535};

encode_field('anonymizationFlags', Value) ->
    {<<Value:16/unsigned-integer>>, 285, 2};

encode_field('anonymizationTechnique', Value) ->
    {<<Value:16/unsigned-integer>>, 286, 2};

encode_field('informationElementIndex', Value) ->
    {<<Value:16/unsigned-integer>>, 287, 2};

encode_field('p2pTechnology', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 288, 65535};

encode_field('tunnelTechnology', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 289, 65535};

encode_field('encryptedTechnology', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 290, 65535};

%% 291 "basicList" basicList "current";

%% 292 "subTemplateList" subTemplateList "current";

%% 293 "subTemplateMultiList" subTemplateMultiList "current";

encode_field('bgpValidityState', Value) ->
    {<<Value:8/unsigned-integer>>, 294, 1};

encode_field('IPSecSPI', Value) ->
    {<<Value:32/unsigned-integer>>, 295, 4};

encode_field('greKey', Value) ->
    {<<Value:32/unsigned-integer>>, 296, 4};

encode_field('natType', Value) ->
    {<<Value:8/unsigned-integer>>, 297, 1};

encode_field('initiatorPackets', Value) ->
    {<<Value:64/unsigned-integer>>, 298, 8};

encode_field('responderPackets', Value) ->
    {<<Value:64/unsigned-integer>>, 299, 8};

encode_field('observationDomainName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 300, 65535};

encode_field('selectionSequenceId', Value) ->
    {<<Value:64/unsigned-integer>>, 301, 8};

encode_field('selectorId', Value) ->
    {<<Value:64/unsigned-integer>>, 302, 8};

encode_field('informationElementId', Value) ->
    {<<Value:16/unsigned-integer>>, 303, 2};

encode_field('selectorAlgorithm', Value) ->
    {<<Value:16/unsigned-integer>>, 304, 2};

encode_field('samplingPacketInterval', Value) ->
    {<<Value:32/unsigned-integer>>, 305, 4};

encode_field('samplingPacketSpace', Value) ->
    {<<Value:32/unsigned-integer>>, 306, 4};

encode_field('samplingTimeInterval', Value) ->
    {<<Value:32/unsigned-integer>>, 307, 4};

encode_field('samplingTimeSpace', Value) ->
    {<<Value:32/unsigned-integer>>, 308, 4};

encode_field('samplingSize', Value) ->
    {<<Value:32/unsigned-integer>>, 309, 4};

encode_field('samplingPopulation', Value) ->
    {<<Value:32/unsigned-integer>>, 310, 4};

encode_field('samplingProbability', Value) ->
    {<<Value:64/float>>, 311, 8};

encode_field('dataLinkFrameSize', Value) ->
    {<<Value:16/unsigned-integer>>, 312, 2};

encode_field('ipHeaderPacketSection', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 313, 65535};

encode_field('ipPayloadPacketSection', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 314, 65535};

encode_field('dataLinkFrameSection', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 315, 65535};

encode_field('mplsLabelStackSection', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 316, 65535};

encode_field('mplsPayloadPacketSection', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 317, 65535};

encode_field('selectorIdTotalPktsObserved', Value) ->
    {<<Value:64/unsigned-integer>>, 318, 8};

encode_field('selectorIdTotalPktsSelected', Value) ->
    {<<Value:64/unsigned-integer>>, 319, 8};

encode_field('absoluteError', Value) ->
    {<<Value:64/float>>, 320, 8};

encode_field('relativeError', Value) ->
    {<<Value:64/float>>, 321, 8};

encode_field('observationTimeSeconds', Value) ->
    {<<Value:32/unsigned-integer>>, 322, 4};

encode_field('observationTimeMilliseconds', Value) ->
    {<<Value:64/unsigned-integer>>, 323, 8};

encode_field('observationTimeMicroseconds', {Seconds, Fraction}) ->
    {<<Seconds:32, Fraction:32>>, 324, 8};

encode_field('observationTimeNanoseconds', {Seconds, Fraction}) ->
    {<<Seconds:32, Fraction:32>>, 325, 8};

encode_field('digestHashValue', Value) ->
    {<<Value:64/unsigned-integer>>, 326, 8};

encode_field('hashIPPayloadOffset', Value) ->
    {<<Value:64/unsigned-integer>>, 327, 8};

encode_field('hashIPPayloadSize', Value) ->
    {<<Value:64/unsigned-integer>>, 328, 8};

encode_field('hashOutputRangeMin', Value) ->
    {<<Value:64/unsigned-integer>>, 329, 8};

encode_field('hashOutputRangeMax', Value) ->
    {<<Value:64/unsigned-integer>>, 330, 8};

encode_field('hashSelectedRangeMin', Value) ->
    {<<Value:64/unsigned-integer>>, 331, 8};

encode_field('hashSelectedRangeMax', Value) ->
    {<<Value:64/unsigned-integer>>, 332, 8};

encode_field('hashDigestOutput', true) ->
    {<<1>>, 333, 1};

encode_field('hashInitialiserValue', Value) ->
    {<<Value:64/unsigned-integer>>, 334, 8};

encode_field('selectorName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 335, 65535};

encode_field('upperCILimit', Value) ->
    {<<Value:64/float>>, 336, 8};

encode_field('lowerCILimit', Value) ->
    {<<Value:64/float>>, 337, 8};

encode_field('confidenceLevel', Value) ->
    {<<Value:64/float>>, 338, 8};

encode_field('informationElementDataType', Value) ->
    {<<Value:8/unsigned-integer>>, 339, 1};

encode_field('informationElementDescription', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 340, 65535};

encode_field('informationElementName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 341, 65535};

encode_field('informationElementRangeBegin', Value) ->
    {<<Value:64/unsigned-integer>>, 342, 8};

encode_field('informationElementRangeEnd', Value) ->
    {<<Value:64/unsigned-integer>>, 343, 8};

encode_field('informationElementSemantics', Value) ->
    {<<Value:8/unsigned-integer>>, 344, 1};

encode_field('informationElementUnits', Value) ->
    {<<Value:16/unsigned-integer>>, 345, 2};

encode_field('privateEnterpriseNumber', Value) ->
    {<<Value:32/unsigned-integer>>, 346, 4};

encode_field('virtualStationInterfaceId', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 347, 65535};

encode_field('virtualStationInterfaceName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 348, 65535};

encode_field('virtualStationUUID', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 349, 65535};

encode_field('virtualStationName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 350, 65535};

encode_field('layer2SegmentId', Value) ->
    {<<Value:64/unsigned-integer>>, 351, 8};

encode_field('layer2OctetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 352, 8};

encode_field('layer2OctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 353, 8};

encode_field('ingressUnicastPacketTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 354, 8};

encode_field('ingressMulticastPacketTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 355, 8};

encode_field('ingressBroadcastPacketTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 356, 8};

encode_field('egressUnicastPacketTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 357, 8};

encode_field('egressBroadcastPacketTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 358, 8};

encode_field('monitoringIntervalStartMilliSeconds', Value) ->
    {<<Value:64/unsigned-integer>>, 359, 8};

encode_field('monitoringIntervalEndMilliSeconds', Value) ->
    {<<Value:64/unsigned-integer>>, 360, 8};

encode_field('portRangeStart', Value) ->
    {<<Value:16/unsigned-integer>>, 361, 2};

encode_field('portRangeEnd', Value) ->
    {<<Value:16/unsigned-integer>>, 362, 2};

encode_field('portRangeStepSize', Value) ->
    {<<Value:16/unsigned-integer>>, 363, 2};

encode_field('portRangeNumPorts', Value) ->
    {<<Value:16/unsigned-integer>>, 364, 2};

encode_field('staMacAddress', Value)
  when is_binary(Value) andalso byte_size(Value) =:= 6 ->
    {Value, 365, 6};

encode_field('staIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 366, 4};

encode_field('wtpMacAddress', Value)
  when is_binary(Value) andalso byte_size(Value) =:= 6 ->
    {Value, 367, 6};

encode_field('ingressInterfaceType', Value) ->
    {<<Value:32/unsigned-integer>>, 368, 4};

encode_field('egressInterfaceType', Value) ->
    {<<Value:32/unsigned-integer>>, 369, 4};

encode_field('rtpSequenceNumber', Value) ->
    {<<Value:16/unsigned-integer>>, 370, 2};

encode_field('userName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 371, 65535};

encode_field('applicationCategoryName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 372, 65535};

encode_field('applicationSubCategoryName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 373, 65535};

encode_field('applicationGroupName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 374, 65535};

encode_field('originalFlowsPresent', Value) ->
    {<<Value:64/unsigned-integer>>, 375, 8};

encode_field('originalFlowsInitiated', Value) ->
    {<<Value:64/unsigned-integer>>, 376, 8};

encode_field('originalFlowsCompleted', Value) ->
    {<<Value:64/unsigned-integer>>, 377, 8};

encode_field('distinctCountOfSourceIPAddress', Value) ->
    {<<Value:64/unsigned-integer>>, 378, 8};

encode_field('distinctCountOfDestinationIPAddress', Value) ->
    {<<Value:64/unsigned-integer>>, 379, 8};

encode_field('distinctCountOfSourceIPv4Address', Value) ->
    {<<Value:32/unsigned-integer>>, 380, 4};

encode_field('distinctCountOfDestinationIPv4Address', Value) ->
    {<<Value:32/unsigned-integer>>, 381, 4};

encode_field('distinctCountOfSourceIPv6Address', Value) ->
    {<<Value:64/unsigned-integer>>, 382, 8};

encode_field('distinctCountOfDestinationIPv6Address', Value) ->
    {<<Value:64/unsigned-integer>>, 383, 8};

encode_field('valueDistributionMethod', Value) ->
    {<<Value:8/unsigned-integer>>, 384, 1};

encode_field('rfc3550JitterMilliseconds', Value) ->
    {<<Value:32/unsigned-integer>>, 385, 4};

encode_field('rfc3550JitterMicroseconds', Value) ->
    {<<Value:32/unsigned-integer>>, 386, 4};

encode_field('rfc3550JitterNanoseconds', Value) ->
    {<<Value:32/unsigned-integer>>, 387, 4};

encode_field('dot1qDEI', true) ->
    {<<1>>, 388, 1};

encode_field('dot1qCustomerDEI', true) ->
    {<<1>>, 389, 1};

encode_field('flowSelectorAlgorithm', Value) ->
    {<<Value:16/unsigned-integer>>, 390, 2};

encode_field('flowSelectedOctetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 391, 8};

encode_field('flowSelectedPacketDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 392, 8};

encode_field('flowSelectedFlowDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 393, 8};

encode_field('selectorIDTotalFlowsObserved', Value) ->
    {<<Value:64/unsigned-integer>>, 394, 8};

encode_field('selectorIDTotalFlowsSelected', Value) ->
    {<<Value:64/unsigned-integer>>, 395, 8};

encode_field('samplingFlowInterval', Value) ->
    {<<Value:64/unsigned-integer>>, 396, 8};

encode_field('samplingFlowSpacing', Value) ->
    {<<Value:64/unsigned-integer>>, 397, 8};

encode_field('flowSamplingTimeInterval', Value) ->
    {<<Value:64/unsigned-integer>>, 398, 8};

encode_field('flowSamplingTimeSpacing', Value) ->
    {<<Value:64/unsigned-integer>>, 399, 8};

encode_field('hashFlowDomain', Value) ->
    {<<Value:16/unsigned-integer>>, 400, 2};

encode_field('transportOctetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 401, 8};

encode_field('transportPacketDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 402, 8};

encode_field('originalExporterIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 403, 4};

encode_field('originalExporterIPv6Address', {A, B, C, D, E, F, G, H}) ->
    {<<A:16, B:16, C:16, D:16, E:16, F:16, G:16, H:16>>, 404, 16};

encode_field('originalObservationDomainId', Value) ->
    {<<Value:32/unsigned-integer>>, 405, 4};

encode_field('intermediateProcessId', Value) ->
    {<<Value:32/unsigned-integer>>, 406, 4};

encode_field('ignoredDataRecordTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 407, 8};

encode_field('dataLinkFrameType', Value) ->
    {<<Value:16/unsigned-integer>>, 408, 2};

encode_field('sectionOffset', Value) ->
    {<<Value:16/unsigned-integer>>, 409, 2};

encode_field('sectionExportedOctets', Value) ->
    {<<Value:16/unsigned-integer>>, 410, 2};

encode_field('dot1qServiceInstanceTag', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 411, 65535};

encode_field('dot1qServiceInstanceId', Value) ->
    {<<Value:32/unsigned-integer>>, 412, 4};

encode_field('dot1qServiceInstancePriority', Value) ->
    {<<Value:8/unsigned-integer>>, 413, 1};

encode_field('dot1qCustomerSourceMacAddress', Value)
  when is_binary(Value) andalso byte_size(Value) =:= 6 ->
    {Value, 414, 6};

encode_field('dot1qCustomerDestinationMacAddress', Value)
  when is_binary(Value) andalso byte_size(Value) =:= 6 ->
    {Value, 415, 6};

encode_field('postLayer2OctetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 417, 8};

encode_field('postMCastLayer2OctetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 418, 8};

encode_field('postLayer2OctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 420, 8};

encode_field('postMCastLayer2OctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 421, 8};

encode_field('minimumLayer2TotalLength', Value) ->
    {<<Value:64/unsigned-integer>>, 422, 8};

encode_field('maximumLayer2TotalLength', Value) ->
    {<<Value:64/unsigned-integer>>, 423, 8};

encode_field('droppedLayer2OctetDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 424, 8};

encode_field('droppedLayer2OctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 425, 8};

encode_field('ignoredLayer2OctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 426, 8};

encode_field('notSentLayer2OctetTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 427, 8};

encode_field('layer2OctetDeltaSumOfSquares', Value) ->
    {<<Value:64/unsigned-integer>>, 428, 8};

encode_field('layer2OctetTotalSumOfSquares', Value) ->
    {<<Value:64/unsigned-integer>>, 429, 8};

encode_field('layer2FrameDeltaCount', Value) ->
    {<<Value:64/unsigned-integer>>, 430, 8};

encode_field('layer2FrameTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 431, 8};

encode_field('pseudoWireDestinationIPv4Address', {A, B, C, D}) ->
    {<<A, B, C, D>>, 432, 4};

encode_field('ignoredLayer2FrameTotalCount', Value) ->
    {<<Value:64/unsigned-integer>>, 433, 8};

encode_field('mibObjectValueInteger', Value) ->
    {<<Value:64/signed-integer>>, 434, 8};

encode_field('mibObjectValueOctetString', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 435, 65535};

encode_field('mibObjectValueOID', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 436, 65535};

encode_field('mibObjectValueBits', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 437, 65535};

encode_field('mibObjectValueIPAddress', {A, B, C, D}) ->
    {<<A, B, C, D>>, 438, 4};

encode_field('mibObjectValueCounter', Value) ->
    {<<Value:64/unsigned-integer>>, 439, 8};

encode_field('mibObjectValueGauge', Value) ->
    {<<Value:32/unsigned-integer>>, 440, 4};

encode_field('mibObjectValueTimeTicks', Value) ->
    {<<Value:32/unsigned-integer>>, 441, 4};

encode_field('mibObjectValueUnsigned', Value) ->
    {<<Value:64/unsigned-integer>>, 442, 8};

%% 443 "mibObjectValueTable" subTemplateList "current";

%% 444 "mibObjectValueRow" subTemplateList "current";

encode_field('mibObjectIdentifier', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 445, 65535};

encode_field('mibSubIdentifier', Value) ->
    {<<Value:32/unsigned-integer>>, 446, 4};

encode_field('mibIndexIndicator', Value) ->
    {<<Value:64/unsigned-integer>>, 447, 8};

encode_field('mibCaptureTimeSemantics', Value) ->
    {<<Value:8/unsigned-integer>>, 448, 1};

encode_field('mibContextEngineID', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 449, 65535};

encode_field('mibContextName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 450, 65535};

encode_field('mibObjectName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 451, 65535};

encode_field('mibObjectDescription', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 452, 65535};

encode_field('mibObjectSyntax', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 453, 65535};

encode_field('mibModuleName', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 454, 65535};

encode_field('mobileIMSI', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 455, 65535};

encode_field('mobileMSISDN', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 456, 65535};

encode_field('httpStatusCode', Value) ->
    {<<Value:16/unsigned-integer>>, 457, 2};

encode_field('sourceTransportPortsLimit', Value) ->
    {<<Value:16/unsigned-integer>>, 458, 2};

encode_field('httpRequestMethod', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 459, 65535};

encode_field('httpRequestHost', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 460, 65535};

encode_field('httpRequestTarget', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 461, 65535};

encode_field('httpMessageVersion', Value)
  when is_binary(Value) ->
    {encode_variable_field(Value), 462, 65535}.

