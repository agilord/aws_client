// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-11-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFlowOutputsResponse _$AddFlowOutputsResponseFromJson(
    Map<String, dynamic> json) {
  return AddFlowOutputsResponse(
    flowArn: json['flowArn'] as String,
    outputs: (json['outputs'] as List)
        ?.map((e) =>
            e == null ? null : Output.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AddFlowSourcesResponse _$AddFlowSourcesResponseFromJson(
    Map<String, dynamic> json) {
  return AddFlowSourcesResponse(
    flowArn: json['flowArn'] as String,
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AddFlowVpcInterfacesResponse _$AddFlowVpcInterfacesResponseFromJson(
    Map<String, dynamic> json) {
  return AddFlowVpcInterfacesResponse(
    flowArn: json['flowArn'] as String,
    vpcInterfaces: (json['vpcInterfaces'] as List)
        ?.map((e) =>
            e == null ? null : VpcInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AddOutputRequestToJson(AddOutputRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('protocol', _$ProtocolEnumMap[instance.protocol]);
  writeNotNull('cidrAllowList', instance.cidrAllowList);
  writeNotNull('description', instance.description);
  writeNotNull('destination', instance.destination);
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('maxLatency', instance.maxLatency);
  writeNotNull('name', instance.name);
  writeNotNull('port', instance.port);
  writeNotNull('remoteId', instance.remoteId);
  writeNotNull('smoothingLatency', instance.smoothingLatency);
  writeNotNull('streamId', instance.streamId);
  writeNotNull(
      'vpcInterfaceAttachment', instance.vpcInterfaceAttachment?.toJson());
  return val;
}

const _$ProtocolEnumMap = {
  Protocol.zixiPush: 'zixi-push',
  Protocol.rtpFec: 'rtp-fec',
  Protocol.rtp: 'rtp',
  Protocol.zixiPull: 'zixi-pull',
  Protocol.rist: 'rist',
};

CreateFlowResponse _$CreateFlowResponseFromJson(Map<String, dynamic> json) {
  return CreateFlowResponse(
    flow: json['flow'] == null
        ? null
        : Flow.fromJson(json['flow'] as Map<String, dynamic>),
  );
}

DeleteFlowResponse _$DeleteFlowResponseFromJson(Map<String, dynamic> json) {
  return DeleteFlowResponse(
    flowArn: json['flowArn'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
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

const _$StatusEnumMap = {
  Status.standby: 'STANDBY',
  Status.active: 'ACTIVE',
  Status.updating: 'UPDATING',
  Status.deleting: 'DELETING',
  Status.starting: 'STARTING',
  Status.stopping: 'STOPPING',
  Status.error: 'ERROR',
};

DescribeFlowResponse _$DescribeFlowResponseFromJson(Map<String, dynamic> json) {
  return DescribeFlowResponse(
    flow: json['flow'] == null
        ? null
        : Flow.fromJson(json['flow'] as Map<String, dynamic>),
    messages: json['messages'] == null
        ? null
        : Messages.fromJson(json['messages'] as Map<String, dynamic>),
  );
}

DescribeOfferingResponse _$DescribeOfferingResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeOfferingResponse(
    offering: json['offering'] == null
        ? null
        : Offering.fromJson(json['offering'] as Map<String, dynamic>),
  );
}

DescribeReservationResponse _$DescribeReservationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeReservationResponse(
    reservation: json['reservation'] == null
        ? null
        : Reservation.fromJson(json['reservation'] as Map<String, dynamic>),
  );
}

Encryption _$EncryptionFromJson(Map<String, dynamic> json) {
  return Encryption(
    algorithm: _$enumDecodeNullable(_$AlgorithmEnumMap, json['algorithm']),
    roleArn: json['roleArn'] as String,
    constantInitializationVector:
        json['constantInitializationVector'] as String,
    deviceId: json['deviceId'] as String,
    keyType: _$enumDecodeNullable(_$KeyTypeEnumMap, json['keyType']),
    region: json['region'] as String,
    resourceId: json['resourceId'] as String,
    secretArn: json['secretArn'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$EncryptionToJson(Encryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('algorithm', _$AlgorithmEnumMap[instance.algorithm]);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull(
      'constantInitializationVector', instance.constantInitializationVector);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('keyType', _$KeyTypeEnumMap[instance.keyType]);
  writeNotNull('region', instance.region);
  writeNotNull('resourceId', instance.resourceId);
  writeNotNull('secretArn', instance.secretArn);
  writeNotNull('url', instance.url);
  return val;
}

const _$AlgorithmEnumMap = {
  Algorithm.aes128: 'aes128',
  Algorithm.aes192: 'aes192',
  Algorithm.aes256: 'aes256',
};

const _$KeyTypeEnumMap = {
  KeyType.speke: 'speke',
  KeyType.staticKey: 'static-key',
};

Entitlement _$EntitlementFromJson(Map<String, dynamic> json) {
  return Entitlement(
    entitlementArn: json['entitlementArn'] as String,
    name: json['name'] as String,
    subscribers:
        (json['subscribers'] as List)?.map((e) => e as String)?.toList(),
    dataTransferSubscriberFeePercent:
        json['dataTransferSubscriberFeePercent'] as int,
    description: json['description'] as String,
    encryption: json['encryption'] == null
        ? null
        : Encryption.fromJson(json['encryption'] as Map<String, dynamic>),
    entitlementStatus: _$enumDecodeNullable(
        _$EntitlementStatusEnumMap, json['entitlementStatus']),
  );
}

const _$EntitlementStatusEnumMap = {
  EntitlementStatus.enabled: 'ENABLED',
  EntitlementStatus.disabled: 'DISABLED',
};

FailoverConfig _$FailoverConfigFromJson(Map<String, dynamic> json) {
  return FailoverConfig(
    recoveryWindow: json['recoveryWindow'] as int,
    state: _$enumDecodeNullable(_$StateEnumMap, json['state']),
  );
}

Map<String, dynamic> _$FailoverConfigToJson(FailoverConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('recoveryWindow', instance.recoveryWindow);
  writeNotNull('state', _$StateEnumMap[instance.state]);
  return val;
}

const _$StateEnumMap = {
  State.enabled: 'ENABLED',
  State.disabled: 'DISABLED',
};

Flow _$FlowFromJson(Map<String, dynamic> json) {
  return Flow(
    availabilityZone: json['availabilityZone'] as String,
    entitlements: (json['entitlements'] as List)
        ?.map((e) =>
            e == null ? null : Entitlement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    flowArn: json['flowArn'] as String,
    name: json['name'] as String,
    outputs: (json['outputs'] as List)
        ?.map((e) =>
            e == null ? null : Output.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    description: json['description'] as String,
    egressIp: json['egressIp'] as String,
    sourceFailoverConfig: json['sourceFailoverConfig'] == null
        ? null
        : FailoverConfig.fromJson(
            json['sourceFailoverConfig'] as Map<String, dynamic>),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vpcInterfaces: (json['vpcInterfaces'] as List)
        ?.map((e) =>
            e == null ? null : VpcInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GrantEntitlementRequestToJson(
    GrantEntitlementRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subscribers', instance.subscribers);
  writeNotNull('dataTransferSubscriberFeePercent',
      instance.dataTransferSubscriberFeePercent);
  writeNotNull('description', instance.description);
  writeNotNull('encryption', instance.encryption?.toJson());
  writeNotNull('entitlementStatus',
      _$EntitlementStatusEnumMap[instance.entitlementStatus]);
  writeNotNull('name', instance.name);
  return val;
}

GrantFlowEntitlementsResponse _$GrantFlowEntitlementsResponseFromJson(
    Map<String, dynamic> json) {
  return GrantFlowEntitlementsResponse(
    entitlements: (json['entitlements'] as List)
        ?.map((e) =>
            e == null ? null : Entitlement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    flowArn: json['flowArn'] as String,
  );
}

ListEntitlementsResponse _$ListEntitlementsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEntitlementsResponse(
    entitlements: (json['entitlements'] as List)
        ?.map((e) => e == null
            ? null
            : ListedEntitlement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListFlowsResponse _$ListFlowsResponseFromJson(Map<String, dynamic> json) {
  return ListFlowsResponse(
    flows: (json['flows'] as List)
        ?.map((e) =>
            e == null ? null : ListedFlow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListOfferingsResponse _$ListOfferingsResponseFromJson(
    Map<String, dynamic> json) {
  return ListOfferingsResponse(
    nextToken: json['nextToken'] as String,
    offerings: (json['offerings'] as List)
        ?.map((e) =>
            e == null ? null : Offering.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListReservationsResponse _$ListReservationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListReservationsResponse(
    nextToken: json['nextToken'] as String,
    reservations: (json['reservations'] as List)
        ?.map((e) =>
            e == null ? null : Reservation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListedEntitlement _$ListedEntitlementFromJson(Map<String, dynamic> json) {
  return ListedEntitlement(
    entitlementArn: json['entitlementArn'] as String,
    entitlementName: json['entitlementName'] as String,
    dataTransferSubscriberFeePercent:
        json['dataTransferSubscriberFeePercent'] as int,
  );
}

ListedFlow _$ListedFlowFromJson(Map<String, dynamic> json) {
  return ListedFlow(
    availabilityZone: json['availabilityZone'] as String,
    description: json['description'] as String,
    flowArn: json['flowArn'] as String,
    name: json['name'] as String,
    sourceType: _$enumDecodeNullable(_$SourceTypeEnumMap, json['sourceType']),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
  );
}

const _$SourceTypeEnumMap = {
  SourceType.owned: 'OWNED',
  SourceType.entitled: 'ENTITLED',
};

Messages _$MessagesFromJson(Map<String, dynamic> json) {
  return Messages(
    errors: (json['errors'] as List)?.map((e) => e as String)?.toList(),
  );
}

Offering _$OfferingFromJson(Map<String, dynamic> json) {
  return Offering(
    currencyCode: json['currencyCode'] as String,
    duration: json['duration'] as int,
    durationUnits:
        _$enumDecodeNullable(_$DurationUnitsEnumMap, json['durationUnits']),
    offeringArn: json['offeringArn'] as String,
    offeringDescription: json['offeringDescription'] as String,
    pricePerUnit: json['pricePerUnit'] as String,
    priceUnits: _$enumDecodeNullable(_$PriceUnitsEnumMap, json['priceUnits']),
    resourceSpecification: json['resourceSpecification'] == null
        ? null
        : ResourceSpecification.fromJson(
            json['resourceSpecification'] as Map<String, dynamic>),
  );
}

const _$DurationUnitsEnumMap = {
  DurationUnits.months: 'MONTHS',
};

const _$PriceUnitsEnumMap = {
  PriceUnits.hourly: 'HOURLY',
};

Output _$OutputFromJson(Map<String, dynamic> json) {
  return Output(
    name: json['name'] as String,
    outputArn: json['outputArn'] as String,
    dataTransferSubscriberFeePercent:
        json['dataTransferSubscriberFeePercent'] as int,
    description: json['description'] as String,
    destination: json['destination'] as String,
    encryption: json['encryption'] == null
        ? null
        : Encryption.fromJson(json['encryption'] as Map<String, dynamic>),
    entitlementArn: json['entitlementArn'] as String,
    mediaLiveInputArn: json['mediaLiveInputArn'] as String,
    port: json['port'] as int,
    transport: json['transport'] == null
        ? null
        : Transport.fromJson(json['transport'] as Map<String, dynamic>),
    vpcInterfaceAttachment: json['vpcInterfaceAttachment'] == null
        ? null
        : VpcInterfaceAttachment.fromJson(
            json['vpcInterfaceAttachment'] as Map<String, dynamic>),
  );
}

PurchaseOfferingResponse _$PurchaseOfferingResponseFromJson(
    Map<String, dynamic> json) {
  return PurchaseOfferingResponse(
    reservation: json['reservation'] == null
        ? null
        : Reservation.fromJson(json['reservation'] as Map<String, dynamic>),
  );
}

RemoveFlowOutputResponse _$RemoveFlowOutputResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveFlowOutputResponse(
    flowArn: json['flowArn'] as String,
    outputArn: json['outputArn'] as String,
  );
}

RemoveFlowSourceResponse _$RemoveFlowSourceResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveFlowSourceResponse(
    flowArn: json['flowArn'] as String,
    sourceArn: json['sourceArn'] as String,
  );
}

RemoveFlowVpcInterfaceResponse _$RemoveFlowVpcInterfaceResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveFlowVpcInterfaceResponse(
    flowArn: json['flowArn'] as String,
    nonDeletedNetworkInterfaceIds:
        (json['nonDeletedNetworkInterfaceIds'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    vpcInterfaceName: json['vpcInterfaceName'] as String,
  );
}

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return Reservation(
    currencyCode: json['currencyCode'] as String,
    duration: json['duration'] as int,
    durationUnits:
        _$enumDecodeNullable(_$DurationUnitsEnumMap, json['durationUnits']),
    end: json['end'] as String,
    offeringArn: json['offeringArn'] as String,
    offeringDescription: json['offeringDescription'] as String,
    pricePerUnit: json['pricePerUnit'] as String,
    priceUnits: _$enumDecodeNullable(_$PriceUnitsEnumMap, json['priceUnits']),
    reservationArn: json['reservationArn'] as String,
    reservationName: json['reservationName'] as String,
    reservationState: _$enumDecodeNullable(
        _$ReservationStateEnumMap, json['reservationState']),
    resourceSpecification: json['resourceSpecification'] == null
        ? null
        : ResourceSpecification.fromJson(
            json['resourceSpecification'] as Map<String, dynamic>),
    start: json['start'] as String,
  );
}

const _$ReservationStateEnumMap = {
  ReservationState.active: 'ACTIVE',
  ReservationState.expired: 'EXPIRED',
  ReservationState.processing: 'PROCESSING',
  ReservationState.canceled: 'CANCELED',
};

ResourceSpecification _$ResourceSpecificationFromJson(
    Map<String, dynamic> json) {
  return ResourceSpecification(
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    reservedBitrate: json['reservedBitrate'] as int,
  );
}

const _$ResourceTypeEnumMap = {
  ResourceType.mbpsOutboundBandwidth: 'Mbps_Outbound_Bandwidth',
};

RevokeFlowEntitlementResponse _$RevokeFlowEntitlementResponseFromJson(
    Map<String, dynamic> json) {
  return RevokeFlowEntitlementResponse(
    entitlementArn: json['entitlementArn'] as String,
    flowArn: json['flowArn'] as String,
  );
}

Map<String, dynamic> _$SetSourceRequestToJson(SetSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('decryption', instance.decryption?.toJson());
  writeNotNull('description', instance.description);
  writeNotNull('entitlementArn', instance.entitlementArn);
  writeNotNull('ingestPort', instance.ingestPort);
  writeNotNull('maxBitrate', instance.maxBitrate);
  writeNotNull('maxLatency', instance.maxLatency);
  writeNotNull('name', instance.name);
  writeNotNull('protocol', _$ProtocolEnumMap[instance.protocol]);
  writeNotNull('streamId', instance.streamId);
  writeNotNull('vpcInterfaceName', instance.vpcInterfaceName);
  writeNotNull('whitelistCidr', instance.whitelistCidr);
  return val;
}

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    name: json['name'] as String,
    sourceArn: json['sourceArn'] as String,
    dataTransferSubscriberFeePercent:
        json['dataTransferSubscriberFeePercent'] as int,
    decryption: json['decryption'] == null
        ? null
        : Encryption.fromJson(json['decryption'] as Map<String, dynamic>),
    description: json['description'] as String,
    entitlementArn: json['entitlementArn'] as String,
    ingestIp: json['ingestIp'] as String,
    ingestPort: json['ingestPort'] as int,
    transport: json['transport'] == null
        ? null
        : Transport.fromJson(json['transport'] as Map<String, dynamic>),
    vpcInterfaceName: json['vpcInterfaceName'] as String,
    whitelistCidr: json['whitelistCidr'] as String,
  );
}

StartFlowResponse _$StartFlowResponseFromJson(Map<String, dynamic> json) {
  return StartFlowResponse(
    flowArn: json['flowArn'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
  );
}

StopFlowResponse _$StopFlowResponseFromJson(Map<String, dynamic> json) {
  return StopFlowResponse(
    flowArn: json['flowArn'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
  );
}

Transport _$TransportFromJson(Map<String, dynamic> json) {
  return Transport(
    protocol: _$enumDecodeNullable(_$ProtocolEnumMap, json['protocol']),
    cidrAllowList:
        (json['cidrAllowList'] as List)?.map((e) => e as String)?.toList(),
    maxBitrate: json['maxBitrate'] as int,
    maxLatency: json['maxLatency'] as int,
    remoteId: json['remoteId'] as String,
    smoothingLatency: json['smoothingLatency'] as int,
    streamId: json['streamId'] as String,
  );
}

Map<String, dynamic> _$UpdateEncryptionToJson(UpdateEncryption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('algorithm', _$AlgorithmEnumMap[instance.algorithm]);
  writeNotNull(
      'constantInitializationVector', instance.constantInitializationVector);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('keyType', _$KeyTypeEnumMap[instance.keyType]);
  writeNotNull('region', instance.region);
  writeNotNull('resourceId', instance.resourceId);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('secretArn', instance.secretArn);
  writeNotNull('url', instance.url);
  return val;
}

Map<String, dynamic> _$UpdateFailoverConfigToJson(
    UpdateFailoverConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('recoveryWindow', instance.recoveryWindow);
  writeNotNull('state', _$StateEnumMap[instance.state]);
  return val;
}

UpdateFlowEntitlementResponse _$UpdateFlowEntitlementResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFlowEntitlementResponse(
    entitlement: json['entitlement'] == null
        ? null
        : Entitlement.fromJson(json['entitlement'] as Map<String, dynamic>),
    flowArn: json['flowArn'] as String,
  );
}

UpdateFlowOutputResponse _$UpdateFlowOutputResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFlowOutputResponse(
    flowArn: json['flowArn'] as String,
    output: json['output'] == null
        ? null
        : Output.fromJson(json['output'] as Map<String, dynamic>),
  );
}

UpdateFlowResponse _$UpdateFlowResponseFromJson(Map<String, dynamic> json) {
  return UpdateFlowResponse(
    flow: json['flow'] == null
        ? null
        : Flow.fromJson(json['flow'] as Map<String, dynamic>),
  );
}

UpdateFlowSourceResponse _$UpdateFlowSourceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFlowSourceResponse(
    flowArn: json['flowArn'] as String,
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
  );
}

VpcInterface _$VpcInterfaceFromJson(Map<String, dynamic> json) {
  return VpcInterface(
    name: json['name'] as String,
    networkInterfaceIds: (json['networkInterfaceIds'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    roleArn: json['roleArn'] as String,
    securityGroupIds:
        (json['securityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetId: json['subnetId'] as String,
  );
}

VpcInterfaceAttachment _$VpcInterfaceAttachmentFromJson(
    Map<String, dynamic> json) {
  return VpcInterfaceAttachment(
    vpcInterfaceName: json['vpcInterfaceName'] as String,
  );
}

Map<String, dynamic> _$VpcInterfaceAttachmentToJson(
    VpcInterfaceAttachment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vpcInterfaceName', instance.vpcInterfaceName);
  return val;
}

Map<String, dynamic> _$VpcInterfaceRequestToJson(VpcInterfaceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('securityGroupIds', instance.securityGroupIds);
  writeNotNull('subnetId', instance.subnetId);
  return val;
}
