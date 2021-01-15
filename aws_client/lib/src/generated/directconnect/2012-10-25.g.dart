// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2012-10-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptDirectConnectGatewayAssociationProposalResult
    _$AcceptDirectConnectGatewayAssociationProposalResultFromJson(
        Map<String, dynamic> json) {
  return AcceptDirectConnectGatewayAssociationProposalResult(
    directConnectGatewayAssociation: json['directConnectGatewayAssociation'] ==
            null
        ? null
        : DirectConnectGatewayAssociation.fromJson(
            json['directConnectGatewayAssociation'] as Map<String, dynamic>),
  );
}

AllocateTransitVirtualInterfaceResult
    _$AllocateTransitVirtualInterfaceResultFromJson(Map<String, dynamic> json) {
  return AllocateTransitVirtualInterfaceResult(
    virtualInterface: json['virtualInterface'] == null
        ? null
        : VirtualInterface.fromJson(
            json['virtualInterface'] as Map<String, dynamic>),
  );
}

AssociatedGateway _$AssociatedGatewayFromJson(Map<String, dynamic> json) {
  return AssociatedGateway(
    id: json['id'] as String,
    ownerAccount: json['ownerAccount'] as String,
    region: json['region'] as String,
    type: _$enumDecodeNullable(_$GatewayTypeEnumMap, json['type']),
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

const _$GatewayTypeEnumMap = {
  GatewayType.virtualPrivateGateway: 'virtualPrivateGateway',
  GatewayType.transitGateway: 'transitGateway',
};

BGPPeer _$BGPPeerFromJson(Map<String, dynamic> json) {
  return BGPPeer(
    addressFamily:
        _$enumDecodeNullable(_$AddressFamilyEnumMap, json['addressFamily']),
    amazonAddress: json['amazonAddress'] as String,
    asn: json['asn'] as int,
    authKey: json['authKey'] as String,
    awsDeviceV2: json['awsDeviceV2'] as String,
    bgpPeerId: json['bgpPeerId'] as String,
    bgpPeerState:
        _$enumDecodeNullable(_$BGPPeerStateEnumMap, json['bgpPeerState']),
    bgpStatus: _$enumDecodeNullable(_$BGPStatusEnumMap, json['bgpStatus']),
    customerAddress: json['customerAddress'] as String,
  );
}

const _$AddressFamilyEnumMap = {
  AddressFamily.ipv4: 'ipv4',
  AddressFamily.ipv6: 'ipv6',
};

const _$BGPPeerStateEnumMap = {
  BGPPeerState.verifying: 'verifying',
  BGPPeerState.pending: 'pending',
  BGPPeerState.available: 'available',
  BGPPeerState.deleting: 'deleting',
  BGPPeerState.deleted: 'deleted',
};

const _$BGPStatusEnumMap = {
  BGPStatus.up: 'up',
  BGPStatus.down: 'down',
  BGPStatus.unknown: 'unknown',
};

ConfirmConnectionResponse _$ConfirmConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return ConfirmConnectionResponse(
    connectionState:
        _$enumDecodeNullable(_$ConnectionStateEnumMap, json['connectionState']),
  );
}

const _$ConnectionStateEnumMap = {
  ConnectionState.ordering: 'ordering',
  ConnectionState.requested: 'requested',
  ConnectionState.pending: 'pending',
  ConnectionState.available: 'available',
  ConnectionState.down: 'down',
  ConnectionState.deleting: 'deleting',
  ConnectionState.deleted: 'deleted',
  ConnectionState.rejected: 'rejected',
  ConnectionState.unknown: 'unknown',
};

ConfirmPrivateVirtualInterfaceResponse
    _$ConfirmPrivateVirtualInterfaceResponseFromJson(
        Map<String, dynamic> json) {
  return ConfirmPrivateVirtualInterfaceResponse(
    virtualInterfaceState: _$enumDecodeNullable(
        _$VirtualInterfaceStateEnumMap, json['virtualInterfaceState']),
  );
}

const _$VirtualInterfaceStateEnumMap = {
  VirtualInterfaceState.confirming: 'confirming',
  VirtualInterfaceState.verifying: 'verifying',
  VirtualInterfaceState.pending: 'pending',
  VirtualInterfaceState.available: 'available',
  VirtualInterfaceState.down: 'down',
  VirtualInterfaceState.deleting: 'deleting',
  VirtualInterfaceState.deleted: 'deleted',
  VirtualInterfaceState.rejected: 'rejected',
  VirtualInterfaceState.unknown: 'unknown',
};

ConfirmPublicVirtualInterfaceResponse
    _$ConfirmPublicVirtualInterfaceResponseFromJson(Map<String, dynamic> json) {
  return ConfirmPublicVirtualInterfaceResponse(
    virtualInterfaceState: _$enumDecodeNullable(
        _$VirtualInterfaceStateEnumMap, json['virtualInterfaceState']),
  );
}

ConfirmTransitVirtualInterfaceResponse
    _$ConfirmTransitVirtualInterfaceResponseFromJson(
        Map<String, dynamic> json) {
  return ConfirmTransitVirtualInterfaceResponse(
    virtualInterfaceState: _$enumDecodeNullable(
        _$VirtualInterfaceStateEnumMap, json['virtualInterfaceState']),
  );
}

Connection _$ConnectionFromJson(Map<String, dynamic> json) {
  return Connection(
    awsDevice: json['awsDevice'] as String,
    awsDeviceV2: json['awsDeviceV2'] as String,
    bandwidth: json['bandwidth'] as String,
    connectionId: json['connectionId'] as String,
    connectionName: json['connectionName'] as String,
    connectionState:
        _$enumDecodeNullable(_$ConnectionStateEnumMap, json['connectionState']),
    hasLogicalRedundancy: _$enumDecodeNullable(
        _$HasLogicalRedundancyEnumMap, json['hasLogicalRedundancy']),
    jumboFrameCapable: json['jumboFrameCapable'] as bool,
    lagId: json['lagId'] as String,
    loaIssueTime: const UnixDateTimeConverter().fromJson(json['loaIssueTime']),
    location: json['location'] as String,
    ownerAccount: json['ownerAccount'] as String,
    partnerName: json['partnerName'] as String,
    providerName: json['providerName'] as String,
    region: json['region'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vlan: json['vlan'] as int,
  );
}

const _$HasLogicalRedundancyEnumMap = {
  HasLogicalRedundancy.unknown: 'unknown',
  HasLogicalRedundancy.yes: 'yes',
  HasLogicalRedundancy.no: 'no',
};

Connections _$ConnectionsFromJson(Map<String, dynamic> json) {
  return Connections(
    connections: (json['connections'] as List)
        ?.map((e) =>
            e == null ? null : Connection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateBGPPeerResponse _$CreateBGPPeerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateBGPPeerResponse(
    virtualInterface: json['virtualInterface'] == null
        ? null
        : VirtualInterface.fromJson(
            json['virtualInterface'] as Map<String, dynamic>),
  );
}

CreateDirectConnectGatewayAssociationProposalResult
    _$CreateDirectConnectGatewayAssociationProposalResultFromJson(
        Map<String, dynamic> json) {
  return CreateDirectConnectGatewayAssociationProposalResult(
    directConnectGatewayAssociationProposal:
        json['directConnectGatewayAssociationProposal'] == null
            ? null
            : DirectConnectGatewayAssociationProposal.fromJson(
                json['directConnectGatewayAssociationProposal']
                    as Map<String, dynamic>),
  );
}

CreateDirectConnectGatewayAssociationResult
    _$CreateDirectConnectGatewayAssociationResultFromJson(
        Map<String, dynamic> json) {
  return CreateDirectConnectGatewayAssociationResult(
    directConnectGatewayAssociation: json['directConnectGatewayAssociation'] ==
            null
        ? null
        : DirectConnectGatewayAssociation.fromJson(
            json['directConnectGatewayAssociation'] as Map<String, dynamic>),
  );
}

CreateDirectConnectGatewayResult _$CreateDirectConnectGatewayResultFromJson(
    Map<String, dynamic> json) {
  return CreateDirectConnectGatewayResult(
    directConnectGateway: json['directConnectGateway'] == null
        ? null
        : DirectConnectGateway.fromJson(
            json['directConnectGateway'] as Map<String, dynamic>),
  );
}

CreateTransitVirtualInterfaceResult
    _$CreateTransitVirtualInterfaceResultFromJson(Map<String, dynamic> json) {
  return CreateTransitVirtualInterfaceResult(
    virtualInterface: json['virtualInterface'] == null
        ? null
        : VirtualInterface.fromJson(
            json['virtualInterface'] as Map<String, dynamic>),
  );
}

DeleteBGPPeerResponse _$DeleteBGPPeerResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteBGPPeerResponse(
    virtualInterface: json['virtualInterface'] == null
        ? null
        : VirtualInterface.fromJson(
            json['virtualInterface'] as Map<String, dynamic>),
  );
}

DeleteDirectConnectGatewayAssociationProposalResult
    _$DeleteDirectConnectGatewayAssociationProposalResultFromJson(
        Map<String, dynamic> json) {
  return DeleteDirectConnectGatewayAssociationProposalResult(
    directConnectGatewayAssociationProposal:
        json['directConnectGatewayAssociationProposal'] == null
            ? null
            : DirectConnectGatewayAssociationProposal.fromJson(
                json['directConnectGatewayAssociationProposal']
                    as Map<String, dynamic>),
  );
}

DeleteDirectConnectGatewayAssociationResult
    _$DeleteDirectConnectGatewayAssociationResultFromJson(
        Map<String, dynamic> json) {
  return DeleteDirectConnectGatewayAssociationResult(
    directConnectGatewayAssociation: json['directConnectGatewayAssociation'] ==
            null
        ? null
        : DirectConnectGatewayAssociation.fromJson(
            json['directConnectGatewayAssociation'] as Map<String, dynamic>),
  );
}

DeleteDirectConnectGatewayResult _$DeleteDirectConnectGatewayResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDirectConnectGatewayResult(
    directConnectGateway: json['directConnectGateway'] == null
        ? null
        : DirectConnectGateway.fromJson(
            json['directConnectGateway'] as Map<String, dynamic>),
  );
}

DeleteInterconnectResponse _$DeleteInterconnectResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteInterconnectResponse(
    interconnectState: _$enumDecodeNullable(
        _$InterconnectStateEnumMap, json['interconnectState']),
  );
}

const _$InterconnectStateEnumMap = {
  InterconnectState.requested: 'requested',
  InterconnectState.pending: 'pending',
  InterconnectState.available: 'available',
  InterconnectState.down: 'down',
  InterconnectState.deleting: 'deleting',
  InterconnectState.deleted: 'deleted',
  InterconnectState.unknown: 'unknown',
};

DeleteVirtualInterfaceResponse _$DeleteVirtualInterfaceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteVirtualInterfaceResponse(
    virtualInterfaceState: _$enumDecodeNullable(
        _$VirtualInterfaceStateEnumMap, json['virtualInterfaceState']),
  );
}

DescribeConnectionLoaResponse _$DescribeConnectionLoaResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeConnectionLoaResponse(
    loa: json['loa'] == null
        ? null
        : Loa.fromJson(json['loa'] as Map<String, dynamic>),
  );
}

DescribeDirectConnectGatewayAssociationProposalsResult
    _$DescribeDirectConnectGatewayAssociationProposalsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeDirectConnectGatewayAssociationProposalsResult(
    directConnectGatewayAssociationProposals:
        (json['directConnectGatewayAssociationProposals'] as List)
            ?.map((e) => e == null
                ? null
                : DirectConnectGatewayAssociationProposal.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeDirectConnectGatewayAssociationsResult
    _$DescribeDirectConnectGatewayAssociationsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeDirectConnectGatewayAssociationsResult(
    directConnectGatewayAssociations:
        (json['directConnectGatewayAssociations'] as List)
            ?.map((e) => e == null
                ? null
                : DirectConnectGatewayAssociation.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeDirectConnectGatewayAttachmentsResult
    _$DescribeDirectConnectGatewayAttachmentsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeDirectConnectGatewayAttachmentsResult(
    directConnectGatewayAttachments:
        (json['directConnectGatewayAttachments'] as List)
            ?.map((e) => e == null
                ? null
                : DirectConnectGatewayAttachment.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeDirectConnectGatewaysResult
    _$DescribeDirectConnectGatewaysResultFromJson(Map<String, dynamic> json) {
  return DescribeDirectConnectGatewaysResult(
    directConnectGateways: (json['directConnectGateways'] as List)
        ?.map((e) => e == null
            ? null
            : DirectConnectGateway.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeInterconnectLoaResponse _$DescribeInterconnectLoaResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeInterconnectLoaResponse(
    loa: json['loa'] == null
        ? null
        : Loa.fromJson(json['loa'] as Map<String, dynamic>),
  );
}

DescribeTagsResponse _$DescribeTagsResponseFromJson(Map<String, dynamic> json) {
  return DescribeTagsResponse(
    resourceTags: (json['resourceTags'] as List)
        ?.map((e) =>
            e == null ? null : ResourceTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DirectConnectGateway _$DirectConnectGatewayFromJson(Map<String, dynamic> json) {
  return DirectConnectGateway(
    amazonSideAsn: json['amazonSideAsn'] as int,
    directConnectGatewayId: json['directConnectGatewayId'] as String,
    directConnectGatewayName: json['directConnectGatewayName'] as String,
    directConnectGatewayState: _$enumDecodeNullable(
        _$DirectConnectGatewayStateEnumMap, json['directConnectGatewayState']),
    ownerAccount: json['ownerAccount'] as String,
    stateChangeError: json['stateChangeError'] as String,
  );
}

const _$DirectConnectGatewayStateEnumMap = {
  DirectConnectGatewayState.pending: 'pending',
  DirectConnectGatewayState.available: 'available',
  DirectConnectGatewayState.deleting: 'deleting',
  DirectConnectGatewayState.deleted: 'deleted',
};

DirectConnectGatewayAssociation _$DirectConnectGatewayAssociationFromJson(
    Map<String, dynamic> json) {
  return DirectConnectGatewayAssociation(
    allowedPrefixesToDirectConnectGateway:
        (json['allowedPrefixesToDirectConnectGateway'] as List)
            ?.map((e) => e == null
                ? null
                : RouteFilterPrefix.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    associatedGateway: json['associatedGateway'] == null
        ? null
        : AssociatedGateway.fromJson(
            json['associatedGateway'] as Map<String, dynamic>),
    associationId: json['associationId'] as String,
    associationState: _$enumDecodeNullable(
        _$DirectConnectGatewayAssociationStateEnumMap,
        json['associationState']),
    directConnectGatewayId: json['directConnectGatewayId'] as String,
    directConnectGatewayOwnerAccount:
        json['directConnectGatewayOwnerAccount'] as String,
    stateChangeError: json['stateChangeError'] as String,
    virtualGatewayId: json['virtualGatewayId'] as String,
    virtualGatewayOwnerAccount: json['virtualGatewayOwnerAccount'] as String,
    virtualGatewayRegion: json['virtualGatewayRegion'] as String,
  );
}

const _$DirectConnectGatewayAssociationStateEnumMap = {
  DirectConnectGatewayAssociationState.associating: 'associating',
  DirectConnectGatewayAssociationState.associated: 'associated',
  DirectConnectGatewayAssociationState.disassociating: 'disassociating',
  DirectConnectGatewayAssociationState.disassociated: 'disassociated',
  DirectConnectGatewayAssociationState.updating: 'updating',
};

DirectConnectGatewayAssociationProposal
    _$DirectConnectGatewayAssociationProposalFromJson(
        Map<String, dynamic> json) {
  return DirectConnectGatewayAssociationProposal(
    associatedGateway: json['associatedGateway'] == null
        ? null
        : AssociatedGateway.fromJson(
            json['associatedGateway'] as Map<String, dynamic>),
    directConnectGatewayId: json['directConnectGatewayId'] as String,
    directConnectGatewayOwnerAccount:
        json['directConnectGatewayOwnerAccount'] as String,
    existingAllowedPrefixesToDirectConnectGateway:
        (json['existingAllowedPrefixesToDirectConnectGateway'] as List)
            ?.map((e) => e == null
                ? null
                : RouteFilterPrefix.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    proposalId: json['proposalId'] as String,
    proposalState: _$enumDecodeNullable(
        _$DirectConnectGatewayAssociationProposalStateEnumMap,
        json['proposalState']),
    requestedAllowedPrefixesToDirectConnectGateway:
        (json['requestedAllowedPrefixesToDirectConnectGateway'] as List)
            ?.map((e) => e == null
                ? null
                : RouteFilterPrefix.fromJson(e as Map<String, dynamic>))
            ?.toList(),
  );
}

const _$DirectConnectGatewayAssociationProposalStateEnumMap = {
  DirectConnectGatewayAssociationProposalState.requested: 'requested',
  DirectConnectGatewayAssociationProposalState.accepted: 'accepted',
  DirectConnectGatewayAssociationProposalState.deleted: 'deleted',
};

DirectConnectGatewayAttachment _$DirectConnectGatewayAttachmentFromJson(
    Map<String, dynamic> json) {
  return DirectConnectGatewayAttachment(
    attachmentState: _$enumDecodeNullable(
        _$DirectConnectGatewayAttachmentStateEnumMap, json['attachmentState']),
    attachmentType: _$enumDecodeNullable(
        _$DirectConnectGatewayAttachmentTypeEnumMap, json['attachmentType']),
    directConnectGatewayId: json['directConnectGatewayId'] as String,
    stateChangeError: json['stateChangeError'] as String,
    virtualInterfaceId: json['virtualInterfaceId'] as String,
    virtualInterfaceOwnerAccount:
        json['virtualInterfaceOwnerAccount'] as String,
    virtualInterfaceRegion: json['virtualInterfaceRegion'] as String,
  );
}

const _$DirectConnectGatewayAttachmentStateEnumMap = {
  DirectConnectGatewayAttachmentState.attaching: 'attaching',
  DirectConnectGatewayAttachmentState.attached: 'attached',
  DirectConnectGatewayAttachmentState.detaching: 'detaching',
  DirectConnectGatewayAttachmentState.detached: 'detached',
};

const _$DirectConnectGatewayAttachmentTypeEnumMap = {
  DirectConnectGatewayAttachmentType.transitVirtualInterface:
      'TransitVirtualInterface',
  DirectConnectGatewayAttachmentType.privateVirtualInterface:
      'PrivateVirtualInterface',
};

Interconnect _$InterconnectFromJson(Map<String, dynamic> json) {
  return Interconnect(
    awsDevice: json['awsDevice'] as String,
    awsDeviceV2: json['awsDeviceV2'] as String,
    bandwidth: json['bandwidth'] as String,
    hasLogicalRedundancy: _$enumDecodeNullable(
        _$HasLogicalRedundancyEnumMap, json['hasLogicalRedundancy']),
    interconnectId: json['interconnectId'] as String,
    interconnectName: json['interconnectName'] as String,
    interconnectState: _$enumDecodeNullable(
        _$InterconnectStateEnumMap, json['interconnectState']),
    jumboFrameCapable: json['jumboFrameCapable'] as bool,
    lagId: json['lagId'] as String,
    loaIssueTime: const UnixDateTimeConverter().fromJson(json['loaIssueTime']),
    location: json['location'] as String,
    providerName: json['providerName'] as String,
    region: json['region'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Interconnects _$InterconnectsFromJson(Map<String, dynamic> json) {
  return Interconnects(
    interconnects: (json['interconnects'] as List)
        ?.map((e) =>
            e == null ? null : Interconnect.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Lag _$LagFromJson(Map<String, dynamic> json) {
  return Lag(
    allowsHostedConnections: json['allowsHostedConnections'] as bool,
    awsDevice: json['awsDevice'] as String,
    awsDeviceV2: json['awsDeviceV2'] as String,
    connections: (json['connections'] as List)
        ?.map((e) =>
            e == null ? null : Connection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    connectionsBandwidth: json['connectionsBandwidth'] as String,
    hasLogicalRedundancy: _$enumDecodeNullable(
        _$HasLogicalRedundancyEnumMap, json['hasLogicalRedundancy']),
    jumboFrameCapable: json['jumboFrameCapable'] as bool,
    lagId: json['lagId'] as String,
    lagName: json['lagName'] as String,
    lagState: _$enumDecodeNullable(_$LagStateEnumMap, json['lagState']),
    location: json['location'] as String,
    minimumLinks: json['minimumLinks'] as int,
    numberOfConnections: json['numberOfConnections'] as int,
    ownerAccount: json['ownerAccount'] as String,
    providerName: json['providerName'] as String,
    region: json['region'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$LagStateEnumMap = {
  LagState.requested: 'requested',
  LagState.pending: 'pending',
  LagState.available: 'available',
  LagState.down: 'down',
  LagState.deleting: 'deleting',
  LagState.deleted: 'deleted',
  LagState.unknown: 'unknown',
};

Lags _$LagsFromJson(Map<String, dynamic> json) {
  return Lags(
    lags: (json['lags'] as List)
        ?.map((e) => e == null ? null : Lag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListVirtualInterfaceTestHistoryResponse
    _$ListVirtualInterfaceTestHistoryResponseFromJson(
        Map<String, dynamic> json) {
  return ListVirtualInterfaceTestHistoryResponse(
    nextToken: json['nextToken'] as String,
    virtualInterfaceTestHistory: (json['virtualInterfaceTestHistory'] as List)
        ?.map((e) => e == null
            ? null
            : VirtualInterfaceTestHistory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Loa _$LoaFromJson(Map<String, dynamic> json) {
  return Loa(
    loaContent:
        const Uint8ListConverter().fromJson(json['loaContent'] as String),
    loaContentType:
        _$enumDecodeNullable(_$LoaContentTypeEnumMap, json['loaContentType']),
  );
}

const _$LoaContentTypeEnumMap = {
  LoaContentType.applicationPdf: 'application/pdf',
};

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    availablePortSpeeds: (json['availablePortSpeeds'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    availableProviders:
        (json['availableProviders'] as List)?.map((e) => e as String)?.toList(),
    locationCode: json['locationCode'] as String,
    locationName: json['locationName'] as String,
    region: json['region'] as String,
  );
}

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
    locations: (json['locations'] as List)
        ?.map((e) =>
            e == null ? null : Location.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewBGPPeerToJson(NewBGPPeer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('addressFamily', _$AddressFamilyEnumMap[instance.addressFamily]);
  writeNotNull('amazonAddress', instance.amazonAddress);
  writeNotNull('asn', instance.asn);
  writeNotNull('authKey', instance.authKey);
  writeNotNull('customerAddress', instance.customerAddress);
  return val;
}

Map<String, dynamic> _$NewPrivateVirtualInterfaceToJson(
    NewPrivateVirtualInterface instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('asn', instance.asn);
  writeNotNull('virtualInterfaceName', instance.virtualInterfaceName);
  writeNotNull('vlan', instance.vlan);
  writeNotNull('addressFamily', _$AddressFamilyEnumMap[instance.addressFamily]);
  writeNotNull('amazonAddress', instance.amazonAddress);
  writeNotNull('authKey', instance.authKey);
  writeNotNull('customerAddress', instance.customerAddress);
  writeNotNull('directConnectGatewayId', instance.directConnectGatewayId);
  writeNotNull('mtu', instance.mtu);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('virtualGatewayId', instance.virtualGatewayId);
  return val;
}

Map<String, dynamic> _$NewPrivateVirtualInterfaceAllocationToJson(
    NewPrivateVirtualInterfaceAllocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('asn', instance.asn);
  writeNotNull('virtualInterfaceName', instance.virtualInterfaceName);
  writeNotNull('vlan', instance.vlan);
  writeNotNull('addressFamily', _$AddressFamilyEnumMap[instance.addressFamily]);
  writeNotNull('amazonAddress', instance.amazonAddress);
  writeNotNull('authKey', instance.authKey);
  writeNotNull('customerAddress', instance.customerAddress);
  writeNotNull('mtu', instance.mtu);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$NewPublicVirtualInterfaceToJson(
    NewPublicVirtualInterface instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('asn', instance.asn);
  writeNotNull('virtualInterfaceName', instance.virtualInterfaceName);
  writeNotNull('vlan', instance.vlan);
  writeNotNull('addressFamily', _$AddressFamilyEnumMap[instance.addressFamily]);
  writeNotNull('amazonAddress', instance.amazonAddress);
  writeNotNull('authKey', instance.authKey);
  writeNotNull('customerAddress', instance.customerAddress);
  writeNotNull('routeFilterPrefixes',
      instance.routeFilterPrefixes?.map((e) => e?.toJson())?.toList());
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$NewPublicVirtualInterfaceAllocationToJson(
    NewPublicVirtualInterfaceAllocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('asn', instance.asn);
  writeNotNull('virtualInterfaceName', instance.virtualInterfaceName);
  writeNotNull('vlan', instance.vlan);
  writeNotNull('addressFamily', _$AddressFamilyEnumMap[instance.addressFamily]);
  writeNotNull('amazonAddress', instance.amazonAddress);
  writeNotNull('authKey', instance.authKey);
  writeNotNull('customerAddress', instance.customerAddress);
  writeNotNull('routeFilterPrefixes',
      instance.routeFilterPrefixes?.map((e) => e?.toJson())?.toList());
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$NewTransitVirtualInterfaceToJson(
    NewTransitVirtualInterface instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('addressFamily', _$AddressFamilyEnumMap[instance.addressFamily]);
  writeNotNull('amazonAddress', instance.amazonAddress);
  writeNotNull('asn', instance.asn);
  writeNotNull('authKey', instance.authKey);
  writeNotNull('customerAddress', instance.customerAddress);
  writeNotNull('directConnectGatewayId', instance.directConnectGatewayId);
  writeNotNull('mtu', instance.mtu);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('virtualInterfaceName', instance.virtualInterfaceName);
  writeNotNull('vlan', instance.vlan);
  return val;
}

Map<String, dynamic> _$NewTransitVirtualInterfaceAllocationToJson(
    NewTransitVirtualInterfaceAllocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('addressFamily', _$AddressFamilyEnumMap[instance.addressFamily]);
  writeNotNull('amazonAddress', instance.amazonAddress);
  writeNotNull('asn', instance.asn);
  writeNotNull('authKey', instance.authKey);
  writeNotNull('customerAddress', instance.customerAddress);
  writeNotNull('mtu', instance.mtu);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('virtualInterfaceName', instance.virtualInterfaceName);
  writeNotNull('vlan', instance.vlan);
  return val;
}

ResourceTag _$ResourceTagFromJson(Map<String, dynamic> json) {
  return ResourceTag(
    resourceArn: json['resourceArn'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RouteFilterPrefix _$RouteFilterPrefixFromJson(Map<String, dynamic> json) {
  return RouteFilterPrefix(
    cidr: json['cidr'] as String,
  );
}

Map<String, dynamic> _$RouteFilterPrefixToJson(RouteFilterPrefix instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cidr', instance.cidr);
  return val;
}

StartBgpFailoverTestResponse _$StartBgpFailoverTestResponseFromJson(
    Map<String, dynamic> json) {
  return StartBgpFailoverTestResponse(
    virtualInterfaceTest: json['virtualInterfaceTest'] == null
        ? null
        : VirtualInterfaceTestHistory.fromJson(
            json['virtualInterfaceTest'] as Map<String, dynamic>),
  );
}

StopBgpFailoverTestResponse _$StopBgpFailoverTestResponseFromJson(
    Map<String, dynamic> json) {
  return StopBgpFailoverTestResponse(
    virtualInterfaceTest: json['virtualInterfaceTest'] == null
        ? null
        : VirtualInterfaceTestHistory.fromJson(
            json['virtualInterfaceTest'] as Map<String, dynamic>),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateDirectConnectGatewayAssociationResult
    _$UpdateDirectConnectGatewayAssociationResultFromJson(
        Map<String, dynamic> json) {
  return UpdateDirectConnectGatewayAssociationResult(
    directConnectGatewayAssociation: json['directConnectGatewayAssociation'] ==
            null
        ? null
        : DirectConnectGatewayAssociation.fromJson(
            json['directConnectGatewayAssociation'] as Map<String, dynamic>),
  );
}

VirtualGateway _$VirtualGatewayFromJson(Map<String, dynamic> json) {
  return VirtualGateway(
    virtualGatewayId: json['virtualGatewayId'] as String,
    virtualGatewayState: json['virtualGatewayState'] as String,
  );
}

VirtualGateways _$VirtualGatewaysFromJson(Map<String, dynamic> json) {
  return VirtualGateways(
    virtualGateways: (json['virtualGateways'] as List)
        ?.map((e) => e == null
            ? null
            : VirtualGateway.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

VirtualInterface _$VirtualInterfaceFromJson(Map<String, dynamic> json) {
  return VirtualInterface(
    addressFamily:
        _$enumDecodeNullable(_$AddressFamilyEnumMap, json['addressFamily']),
    amazonAddress: json['amazonAddress'] as String,
    amazonSideAsn: json['amazonSideAsn'] as int,
    asn: json['asn'] as int,
    authKey: json['authKey'] as String,
    awsDeviceV2: json['awsDeviceV2'] as String,
    bgpPeers: (json['bgpPeers'] as List)
        ?.map((e) =>
            e == null ? null : BGPPeer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    connectionId: json['connectionId'] as String,
    customerAddress: json['customerAddress'] as String,
    customerRouterConfig: json['customerRouterConfig'] as String,
    directConnectGatewayId: json['directConnectGatewayId'] as String,
    jumboFrameCapable: json['jumboFrameCapable'] as bool,
    location: json['location'] as String,
    mtu: json['mtu'] as int,
    ownerAccount: json['ownerAccount'] as String,
    region: json['region'] as String,
    routeFilterPrefixes: (json['routeFilterPrefixes'] as List)
        ?.map((e) => e == null
            ? null
            : RouteFilterPrefix.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    virtualGatewayId: json['virtualGatewayId'] as String,
    virtualInterfaceId: json['virtualInterfaceId'] as String,
    virtualInterfaceName: json['virtualInterfaceName'] as String,
    virtualInterfaceState: _$enumDecodeNullable(
        _$VirtualInterfaceStateEnumMap, json['virtualInterfaceState']),
    virtualInterfaceType: json['virtualInterfaceType'] as String,
    vlan: json['vlan'] as int,
  );
}

VirtualInterfaceTestHistory _$VirtualInterfaceTestHistoryFromJson(
    Map<String, dynamic> json) {
  return VirtualInterfaceTestHistory(
    bgpPeers: (json['bgpPeers'] as List)?.map((e) => e as String)?.toList(),
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    ownerAccount: json['ownerAccount'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    status: json['status'] as String,
    testDurationInMinutes: json['testDurationInMinutes'] as int,
    testId: json['testId'] as String,
    virtualInterfaceId: json['virtualInterfaceId'] as String,
  );
}

VirtualInterfaces _$VirtualInterfacesFromJson(Map<String, dynamic> json) {
  return VirtualInterfaces(
    virtualInterfaces: (json['virtualInterfaces'] as List)
        ?.map((e) => e == null
            ? null
            : VirtualInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
