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

Map<String, dynamic> _$AdvertiseByoipCidrRequestToJson(
    AdvertiseByoipCidrRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cidr', instance.cidr);
  return val;
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

Map<String, dynamic> _$CreateAcceleratorRequestToJson(
    CreateAcceleratorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('Name', instance.name);
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('IpAddressType', _$IpAddressTypeEnumMap[instance.ipAddressType]);
  writeNotNull('IpAddresses', instance.ipAddresses);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
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

Map<String, dynamic> _$CreateEndpointGroupRequestToJson(
    CreateEndpointGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndpointGroupRegion', instance.endpointGroupRegion);
  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('ListenerArn', instance.listenerArn);
  writeNotNull('EndpointConfigurations',
      instance.endpointConfigurations?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'HealthCheckIntervalSeconds', instance.healthCheckIntervalSeconds);
  writeNotNull('HealthCheckPath', instance.healthCheckPath);
  writeNotNull('HealthCheckPort', instance.healthCheckPort);
  writeNotNull('HealthCheckProtocol',
      _$HealthCheckProtocolEnumMap[instance.healthCheckProtocol]);
  writeNotNull('ThresholdCount', instance.thresholdCount);
  writeNotNull('TrafficDialPercentage', instance.trafficDialPercentage);
  return val;
}

const _$HealthCheckProtocolEnumMap = {
  HealthCheckProtocol.tcp: 'TCP',
  HealthCheckProtocol.http: 'HTTP',
  HealthCheckProtocol.https: 'HTTPS',
};

CreateEndpointGroupResponse _$CreateEndpointGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEndpointGroupResponse(
    endpointGroup: json['EndpointGroup'] == null
        ? null
        : EndpointGroup.fromJson(json['EndpointGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateListenerRequestToJson(
    CreateListenerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceleratorArn', instance.acceleratorArn);
  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull(
      'PortRanges', instance.portRanges?.map((e) => e?.toJson())?.toList());
  writeNotNull('Protocol', _$ProtocolEnumMap[instance.protocol]);
  writeNotNull(
      'ClientAffinity', _$ClientAffinityEnumMap[instance.clientAffinity]);
  return val;
}

const _$ProtocolEnumMap = {
  Protocol.tcp: 'TCP',
  Protocol.udp: 'UDP',
};

const _$ClientAffinityEnumMap = {
  ClientAffinity.none: 'NONE',
  ClientAffinity.sourceIp: 'SOURCE_IP',
};

CreateListenerResponse _$CreateListenerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateListenerResponse(
    listener: json['Listener'] == null
        ? null
        : Listener.fromJson(json['Listener'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteAcceleratorRequestToJson(
    DeleteAcceleratorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceleratorArn', instance.acceleratorArn);
  return val;
}

Map<String, dynamic> _$DeleteEndpointGroupRequestToJson(
    DeleteEndpointGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndpointGroupArn', instance.endpointGroupArn);
  return val;
}

Map<String, dynamic> _$DeleteListenerRequestToJson(
    DeleteListenerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ListenerArn', instance.listenerArn);
  return val;
}

Map<String, dynamic> _$DeprovisionByoipCidrRequestToJson(
    DeprovisionByoipCidrRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cidr', instance.cidr);
  return val;
}

DeprovisionByoipCidrResponse _$DeprovisionByoipCidrResponseFromJson(
    Map<String, dynamic> json) {
  return DeprovisionByoipCidrResponse(
    byoipCidr: json['ByoipCidr'] == null
        ? null
        : ByoipCidr.fromJson(json['ByoipCidr'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeAcceleratorAttributesRequestToJson(
    DescribeAcceleratorAttributesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceleratorArn', instance.acceleratorArn);
  return val;
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

Map<String, dynamic> _$DescribeAcceleratorRequestToJson(
    DescribeAcceleratorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceleratorArn', instance.acceleratorArn);
  return val;
}

DescribeAcceleratorResponse _$DescribeAcceleratorResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAcceleratorResponse(
    accelerator: json['Accelerator'] == null
        ? null
        : Accelerator.fromJson(json['Accelerator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeEndpointGroupRequestToJson(
    DescribeEndpointGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndpointGroupArn', instance.endpointGroupArn);
  return val;
}

DescribeEndpointGroupResponse _$DescribeEndpointGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointGroupResponse(
    endpointGroup: json['EndpointGroup'] == null
        ? null
        : EndpointGroup.fromJson(json['EndpointGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeListenerRequestToJson(
    DescribeListenerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ListenerArn', instance.listenerArn);
  return val;
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

IpSet _$IpSetFromJson(Map<String, dynamic> json) {
  return IpSet(
    ipAddresses:
        (json['IpAddresses'] as List)?.map((e) => e as String)?.toList(),
    ipFamily: json['IpFamily'] as String,
  );
}

Map<String, dynamic> _$ListAcceleratorsRequestToJson(
    ListAcceleratorsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListByoipCidrsRequestToJson(
    ListByoipCidrsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListEndpointGroupsRequestToJson(
    ListEndpointGroupsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ListenerArn', instance.listenerArn);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListListenersRequestToJson(
    ListListenersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceleratorArn', instance.acceleratorArn);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListTagsForResourceRequestToJson(
    ListTagsForResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
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

Map<String, dynamic> _$ProvisionByoipCidrRequestToJson(
    ProvisionByoipCidrRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cidr', instance.cidr);
  writeNotNull(
      'CidrAuthorizationContext', instance.cidrAuthorizationContext?.toJson());
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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UpdateAcceleratorAttributesRequestToJson(
    UpdateAcceleratorAttributesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceleratorArn', instance.acceleratorArn);
  writeNotNull('FlowLogsEnabled', instance.flowLogsEnabled);
  writeNotNull('FlowLogsS3Bucket', instance.flowLogsS3Bucket);
  writeNotNull('FlowLogsS3Prefix', instance.flowLogsS3Prefix);
  return val;
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

Map<String, dynamic> _$UpdateAcceleratorRequestToJson(
    UpdateAcceleratorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceleratorArn', instance.acceleratorArn);
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('IpAddressType', _$IpAddressTypeEnumMap[instance.ipAddressType]);
  writeNotNull('Name', instance.name);
  return val;
}

UpdateAcceleratorResponse _$UpdateAcceleratorResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAcceleratorResponse(
    accelerator: json['Accelerator'] == null
        ? null
        : Accelerator.fromJson(json['Accelerator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateEndpointGroupRequestToJson(
    UpdateEndpointGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndpointGroupArn', instance.endpointGroupArn);
  writeNotNull('EndpointConfigurations',
      instance.endpointConfigurations?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'HealthCheckIntervalSeconds', instance.healthCheckIntervalSeconds);
  writeNotNull('HealthCheckPath', instance.healthCheckPath);
  writeNotNull('HealthCheckPort', instance.healthCheckPort);
  writeNotNull('HealthCheckProtocol',
      _$HealthCheckProtocolEnumMap[instance.healthCheckProtocol]);
  writeNotNull('ThresholdCount', instance.thresholdCount);
  writeNotNull('TrafficDialPercentage', instance.trafficDialPercentage);
  return val;
}

UpdateEndpointGroupResponse _$UpdateEndpointGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEndpointGroupResponse(
    endpointGroup: json['EndpointGroup'] == null
        ? null
        : EndpointGroup.fromJson(json['EndpointGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateListenerRequestToJson(
    UpdateListenerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ListenerArn', instance.listenerArn);
  writeNotNull(
      'ClientAffinity', _$ClientAffinityEnumMap[instance.clientAffinity]);
  writeNotNull(
      'PortRanges', instance.portRanges?.map((e) => e?.toJson())?.toList());
  writeNotNull('Protocol', _$ProtocolEnumMap[instance.protocol]);
  return val;
}

UpdateListenerResponse _$UpdateListenerResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateListenerResponse(
    listener: json['Listener'] == null
        ? null
        : Listener.fromJson(json['Listener'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WithdrawByoipCidrRequestToJson(
    WithdrawByoipCidrRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cidr', instance.cidr);
  return val;
}

WithdrawByoipCidrResponse _$WithdrawByoipCidrResponseFromJson(
    Map<String, dynamic> json) {
  return WithdrawByoipCidrResponse(
    byoipCidr: json['ByoipCidr'] == null
        ? null
        : ByoipCidr.fromJson(json['ByoipCidr'] as Map<String, dynamic>),
  );
}
