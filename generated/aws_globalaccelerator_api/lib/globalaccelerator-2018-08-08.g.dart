// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'globalaccelerator-2018-08-08.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accelerator _$AcceleratorFromJson(Map<String, dynamic> json) {
  return Accelerator(
    acceleratorArn: json['AcceleratorArn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    dnsName: json['DnsName'] as String,
    enabled: json['Enabled'] as bool,
    ipAddressType:
        _$enumDecodeNullable(_$IpAddressTypeEnumMap, json['IpAddressType']),
    ipSets: (json['IpSets'] as List)
        ?.map(
            (e) => e == null ? null : IpSet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastModifiedTime: unixTimestampFromJson(json['LastModifiedTime']),
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$AcceleratorStatusEnumMap, json['Status']),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$IpAddressTypeEnumMap = {
  IpAddressType.ipv4: 'IPV4',
};

const _$AcceleratorStatusEnumMap = {
  AcceleratorStatus.deployed: 'DEPLOYED',
  AcceleratorStatus.inProgress: 'IN_PROGRESS',
};

AcceleratorAttributes _$AcceleratorAttributesFromJson(
    Map<String, dynamic> json) {
  return AcceleratorAttributes(
    flowLogsEnabled: json['FlowLogsEnabled'] as bool,
    flowLogsS3Bucket: json['FlowLogsS3Bucket'] as String,
    flowLogsS3Prefix: json['FlowLogsS3Prefix'] as String,
  );
}

AdvertiseByoipCidrResponse _$AdvertiseByoipCidrResponseFromJson(
    Map<String, dynamic> json) {
  return AdvertiseByoipCidrResponse(
    byoipCidr: json['ByoipCidr'] == null
        ? null
        : ByoipCidr.fromJson(json['ByoipCidr'] as Map<String, dynamic>),
  );
}

ByoipCidr _$ByoipCidrFromJson(Map<String, dynamic> json) {
  return ByoipCidr(
    cidr: json['Cidr'] as String,
    events: (json['Events'] as List)
        ?.map((e) => e == null
            ? null
            : ByoipCidrEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    state: _$enumDecodeNullable(_$ByoipCidrStateEnumMap, json['State']),
  );
}

const _$ByoipCidrStateEnumMap = {
  ByoipCidrState.pendingProvisioning: 'PENDING_PROVISIONING',
  ByoipCidrState.ready: 'READY',
  ByoipCidrState.pendingAdvertising: 'PENDING_ADVERTISING',
  ByoipCidrState.advertising: 'ADVERTISING',
  ByoipCidrState.pendingWithdrawing: 'PENDING_WITHDRAWING',
  ByoipCidrState.pendingDeprovisioning: 'PENDING_DEPROVISIONING',
  ByoipCidrState.deprovisioned: 'DEPROVISIONED',
  ByoipCidrState.failedProvision: 'FAILED_PROVISION',
  ByoipCidrState.failedAdvertising: 'FAILED_ADVERTISING',
  ByoipCidrState.failedWithdraw: 'FAILED_WITHDRAW',
  ByoipCidrState.failedDeprovision: 'FAILED_DEPROVISION',
};

ByoipCidrEvent _$ByoipCidrEventFromJson(Map<String, dynamic> json) {
  return ByoipCidrEvent(
    message: json['Message'] as String,
    timestamp: unixTimestampFromJson(json['Timestamp']),
  );
}

Map<String, dynamic> _$CidrAuthorizationContextToJson(
    CidrAuthorizationContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Message', instance.message);
  writeNotNull('Signature', instance.signature);
  return val;
}

CreateAcceleratorResponse _$CreateAcceleratorResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAcceleratorResponse(
    accelerator: json['Accelerator'] == null
        ? null
        : Accelerator.fromJson(json['Accelerator'] as Map<String, dynamic>),
  );
}

CreateEndpointGroupResponse _$CreateEndpointGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEndpointGroupResponse(
    endpointGroup: json['EndpointGroup'] == null
        ? null
        : EndpointGroup.fromJson(json['EndpointGroup'] as Map<String, dynamic>),
  );
}

CreateListenerResponse _$CreateListenerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateListenerResponse(
    listener: json['Listener'] == null
        ? null
        : Listener.fromJson(json['Listener'] as Map<String, dynamic>),
  );
}

DeprovisionByoipCidrResponse _$DeprovisionByoipCidrResponseFromJson(
    Map<String, dynamic> json) {
  return DeprovisionByoipCidrResponse(
    byoipCidr: json['ByoipCidr'] == null
        ? null
        : ByoipCidr.fromJson(json['ByoipCidr'] as Map<String, dynamic>),
  );
}

DescribeAcceleratorAttributesResponse
    _$DescribeAcceleratorAttributesResponseFromJson(Map<String, dynamic> json) {
  return DescribeAcceleratorAttributesResponse(
    acceleratorAttributes: json['AcceleratorAttributes'] == null
        ? null
        : AcceleratorAttributes.fromJson(
            json['AcceleratorAttributes'] as Map<String, dynamic>),
  );
}

DescribeAcceleratorResponse _$DescribeAcceleratorResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAcceleratorResponse(
    accelerator: json['Accelerator'] == null
        ? null
        : Accelerator.fromJson(json['Accelerator'] as Map<String, dynamic>),
  );
}

DescribeEndpointGroupResponse _$DescribeEndpointGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointGroupResponse(
    endpointGroup: json['EndpointGroup'] == null
        ? null
        : EndpointGroup.fromJson(json['EndpointGroup'] as Map<String, dynamic>),
  );
}

DescribeListenerResponse _$DescribeListenerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeListenerResponse(
    listener: json['Listener'] == null
        ? null
        : Listener.fromJson(json['Listener'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EndpointConfigurationToJson(
    EndpointConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ClientIPPreservationEnabled', instance.clientIPPreservationEnabled);
  writeNotNull('EndpointId', instance.endpointId);
  writeNotNull('Weight', instance.weight);
  return val;
}

EndpointDescription _$EndpointDescriptionFromJson(Map<String, dynamic> json) {
  return EndpointDescription(
    clientIPPreservationEnabled: json['ClientIPPreservationEnabled'] as bool,
    endpointId: json['EndpointId'] as String,
    healthReason: json['HealthReason'] as String,
    healthState:
        _$enumDecodeNullable(_$HealthStateEnumMap, json['HealthState']),
    weight: json['Weight'] as int,
  );
}

const _$HealthStateEnumMap = {
  HealthState.initial: 'INITIAL',
  HealthState.healthy: 'HEALTHY',
  HealthState.unhealthy: 'UNHEALTHY',
};

EndpointGroup _$EndpointGroupFromJson(Map<String, dynamic> json) {
  return EndpointGroup(
    endpointDescriptions: (json['EndpointDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : EndpointDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    endpointGroupArn: json['EndpointGroupArn'] as String,
    endpointGroupRegion: json['EndpointGroupRegion'] as String,
    healthCheckIntervalSeconds: json['HealthCheckIntervalSeconds'] as int,
    healthCheckPath: json['HealthCheckPath'] as String,
    healthCheckPort: json['HealthCheckPort'] as int,
    healthCheckProtocol: _$enumDecodeNullable(
        _$HealthCheckProtocolEnumMap, json['HealthCheckProtocol']),
    thresholdCount: json['ThresholdCount'] as int,
    trafficDialPercentage: (json['TrafficDialPercentage'] as num)?.toDouble(),
  );
}

const _$HealthCheckProtocolEnumMap = {
  HealthCheckProtocol.tcp: 'TCP',
  HealthCheckProtocol.http: 'HTTP',
  HealthCheckProtocol.https: 'HTTPS',
};

IpSet _$IpSetFromJson(Map<String, dynamic> json) {
  return IpSet(
    ipAddresses:
        (json['IpAddresses'] as List)?.map((e) => e as String)?.toList(),
    ipFamily: json['IpFamily'] as String,
  );
}

ListAcceleratorsResponse _$ListAcceleratorsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAcceleratorsResponse(
    accelerators: (json['Accelerators'] as List)
        ?.map((e) =>
            e == null ? null : Accelerator.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListByoipCidrsResponse _$ListByoipCidrsResponseFromJson(
    Map<String, dynamic> json) {
  return ListByoipCidrsResponse(
    byoipCidrs: (json['ByoipCidrs'] as List)
        ?.map((e) =>
            e == null ? null : ByoipCidr.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEndpointGroupsResponse _$ListEndpointGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEndpointGroupsResponse(
    endpointGroups: (json['EndpointGroups'] as List)
        ?.map((e) => e == null
            ? null
            : EndpointGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListListenersResponse _$ListListenersResponseFromJson(
    Map<String, dynamic> json) {
  return ListListenersResponse(
    listeners: (json['Listeners'] as List)
        ?.map((e) =>
            e == null ? null : Listener.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Listener _$ListenerFromJson(Map<String, dynamic> json) {
  return Listener(
    clientAffinity:
        _$enumDecodeNullable(_$ClientAffinityEnumMap, json['ClientAffinity']),
    listenerArn: json['ListenerArn'] as String,
    portRanges: (json['PortRanges'] as List)
        ?.map((e) =>
            e == null ? null : PortRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    protocol: _$enumDecodeNullable(_$ProtocolEnumMap, json['Protocol']),
  );
}

const _$ClientAffinityEnumMap = {
  ClientAffinity.none: 'NONE',
  ClientAffinity.sourceIp: 'SOURCE_IP',
};

const _$ProtocolEnumMap = {
  Protocol.tcp: 'TCP',
  Protocol.udp: 'UDP',
};

PortRange _$PortRangeFromJson(Map<String, dynamic> json) {
  return PortRange(
    fromPort: json['FromPort'] as int,
    toPort: json['ToPort'] as int,
  );
}

Map<String, dynamic> _$PortRangeToJson(PortRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FromPort', instance.fromPort);
  writeNotNull('ToPort', instance.toPort);
  return val;
}

ProvisionByoipCidrResponse _$ProvisionByoipCidrResponseFromJson(
    Map<String, dynamic> json) {
  return ProvisionByoipCidrResponse(
    byoipCidr: json['ByoipCidr'] == null
        ? null
        : ByoipCidr.fromJson(json['ByoipCidr'] as Map<String, dynamic>),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateAcceleratorAttributesResponse
    _$UpdateAcceleratorAttributesResponseFromJson(Map<String, dynamic> json) {
  return UpdateAcceleratorAttributesResponse(
    acceleratorAttributes: json['AcceleratorAttributes'] == null
        ? null
        : AcceleratorAttributes.fromJson(
            json['AcceleratorAttributes'] as Map<String, dynamic>),
  );
}

UpdateAcceleratorResponse _$UpdateAcceleratorResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAcceleratorResponse(
    accelerator: json['Accelerator'] == null
        ? null
        : Accelerator.fromJson(json['Accelerator'] as Map<String, dynamic>),
  );
}

UpdateEndpointGroupResponse _$UpdateEndpointGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEndpointGroupResponse(
    endpointGroup: json['EndpointGroup'] == null
        ? null
        : EndpointGroup.fromJson(json['EndpointGroup'] as Map<String, dynamic>),
  );
}

UpdateListenerResponse _$UpdateListenerResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateListenerResponse(
    listener: json['Listener'] == null
        ? null
        : Listener.fromJson(json['Listener'] as Map<String, dynamic>),
  );
}

WithdrawByoipCidrResponse _$WithdrawByoipCidrResponseFromJson(
    Map<String, dynamic> json) {
  return WithdrawByoipCidrResponse(
    byoipCidr: json['ByoipCidr'] == null
        ? null
        : ByoipCidr.fromJson(json['ByoipCidr'] as Map<String, dynamic>),
  );
}
