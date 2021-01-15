// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-07-05.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AWSLocation _$AWSLocationFromJson(Map<String, dynamic> json) {
  return AWSLocation(
    subnetArn: json['SubnetArn'] as String,
    zone: json['Zone'] as String,
  );
}

Map<String, dynamic> _$AWSLocationToJson(AWSLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubnetArn', instance.subnetArn);
  writeNotNull('Zone', instance.zone);
  return val;
}

AssociateCustomerGatewayResponse _$AssociateCustomerGatewayResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateCustomerGatewayResponse(
    customerGatewayAssociation: json['CustomerGatewayAssociation'] == null
        ? null
        : CustomerGatewayAssociation.fromJson(
            json['CustomerGatewayAssociation'] as Map<String, dynamic>),
  );
}

AssociateLinkResponse _$AssociateLinkResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateLinkResponse(
    linkAssociation: json['LinkAssociation'] == null
        ? null
        : LinkAssociation.fromJson(
            json['LinkAssociation'] as Map<String, dynamic>),
  );
}

AssociateTransitGatewayConnectPeerResponse
    _$AssociateTransitGatewayConnectPeerResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateTransitGatewayConnectPeerResponse(
    transitGatewayConnectPeerAssociation:
        json['TransitGatewayConnectPeerAssociation'] == null
            ? null
            : TransitGatewayConnectPeerAssociation.fromJson(
                json['TransitGatewayConnectPeerAssociation']
                    as Map<String, dynamic>),
  );
}

Bandwidth _$BandwidthFromJson(Map<String, dynamic> json) {
  return Bandwidth(
    downloadSpeed: json['DownloadSpeed'] as int,
    uploadSpeed: json['UploadSpeed'] as int,
  );
}

Map<String, dynamic> _$BandwidthToJson(Bandwidth instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DownloadSpeed', instance.downloadSpeed);
  writeNotNull('UploadSpeed', instance.uploadSpeed);
  return val;
}

Connection _$ConnectionFromJson(Map<String, dynamic> json) {
  return Connection(
    connectedDeviceId: json['ConnectedDeviceId'] as String,
    connectedLinkId: json['ConnectedLinkId'] as String,
    connectionArn: json['ConnectionArn'] as String,
    connectionId: json['ConnectionId'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    deviceId: json['DeviceId'] as String,
    globalNetworkId: json['GlobalNetworkId'] as String,
    linkId: json['LinkId'] as String,
    state: _$enumDecodeNullable(_$ConnectionStateEnumMap, json['State']),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

const _$ConnectionStateEnumMap = {
  ConnectionState.pending: 'PENDING',
  ConnectionState.available: 'AVAILABLE',
  ConnectionState.deleting: 'DELETING',
  ConnectionState.updating: 'UPDATING',
};

CreateConnectionResponse _$CreateConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConnectionResponse(
    connection: json['Connection'] == null
        ? null
        : Connection.fromJson(json['Connection'] as Map<String, dynamic>),
  );
}

CreateDeviceResponse _$CreateDeviceResponseFromJson(Map<String, dynamic> json) {
  return CreateDeviceResponse(
    device: json['Device'] == null
        ? null
        : Device.fromJson(json['Device'] as Map<String, dynamic>),
  );
}

CreateGlobalNetworkResponse _$CreateGlobalNetworkResponseFromJson(
    Map<String, dynamic> json) {
  return CreateGlobalNetworkResponse(
    globalNetwork: json['GlobalNetwork'] == null
        ? null
        : GlobalNetwork.fromJson(json['GlobalNetwork'] as Map<String, dynamic>),
  );
}

CreateLinkResponse _$CreateLinkResponseFromJson(Map<String, dynamic> json) {
  return CreateLinkResponse(
    link: json['Link'] == null
        ? null
        : Link.fromJson(json['Link'] as Map<String, dynamic>),
  );
}

CreateSiteResponse _$CreateSiteResponseFromJson(Map<String, dynamic> json) {
  return CreateSiteResponse(
    site: json['Site'] == null
        ? null
        : Site.fromJson(json['Site'] as Map<String, dynamic>),
  );
}

CustomerGatewayAssociation _$CustomerGatewayAssociationFromJson(
    Map<String, dynamic> json) {
  return CustomerGatewayAssociation(
    customerGatewayArn: json['CustomerGatewayArn'] as String,
    deviceId: json['DeviceId'] as String,
    globalNetworkId: json['GlobalNetworkId'] as String,
    linkId: json['LinkId'] as String,
    state: _$enumDecodeNullable(
        _$CustomerGatewayAssociationStateEnumMap, json['State']),
  );
}

const _$CustomerGatewayAssociationStateEnumMap = {
  CustomerGatewayAssociationState.pending: 'PENDING',
  CustomerGatewayAssociationState.available: 'AVAILABLE',
  CustomerGatewayAssociationState.deleting: 'DELETING',
  CustomerGatewayAssociationState.deleted: 'DELETED',
};

DeleteConnectionResponse _$DeleteConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteConnectionResponse(
    connection: json['Connection'] == null
        ? null
        : Connection.fromJson(json['Connection'] as Map<String, dynamic>),
  );
}

DeleteDeviceResponse _$DeleteDeviceResponseFromJson(Map<String, dynamic> json) {
  return DeleteDeviceResponse(
    device: json['Device'] == null
        ? null
        : Device.fromJson(json['Device'] as Map<String, dynamic>),
  );
}

DeleteGlobalNetworkResponse _$DeleteGlobalNetworkResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteGlobalNetworkResponse(
    globalNetwork: json['GlobalNetwork'] == null
        ? null
        : GlobalNetwork.fromJson(json['GlobalNetwork'] as Map<String, dynamic>),
  );
}

DeleteLinkResponse _$DeleteLinkResponseFromJson(Map<String, dynamic> json) {
  return DeleteLinkResponse(
    link: json['Link'] == null
        ? null
        : Link.fromJson(json['Link'] as Map<String, dynamic>),
  );
}

DeleteSiteResponse _$DeleteSiteResponseFromJson(Map<String, dynamic> json) {
  return DeleteSiteResponse(
    site: json['Site'] == null
        ? null
        : Site.fromJson(json['Site'] as Map<String, dynamic>),
  );
}

DeregisterTransitGatewayResponse _$DeregisterTransitGatewayResponseFromJson(
    Map<String, dynamic> json) {
  return DeregisterTransitGatewayResponse(
    transitGatewayRegistration: json['TransitGatewayRegistration'] == null
        ? null
        : TransitGatewayRegistration.fromJson(
            json['TransitGatewayRegistration'] as Map<String, dynamic>),
  );
}

DescribeGlobalNetworksResponse _$DescribeGlobalNetworksResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeGlobalNetworksResponse(
    globalNetworks: (json['GlobalNetworks'] as List)
        ?.map((e) => e == null
            ? null
            : GlobalNetwork.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    awsLocation: json['AWSLocation'] == null
        ? null
        : AWSLocation.fromJson(json['AWSLocation'] as Map<String, dynamic>),
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    deviceArn: json['DeviceArn'] as String,
    deviceId: json['DeviceId'] as String,
    globalNetworkId: json['GlobalNetworkId'] as String,
    location: json['Location'] == null
        ? null
        : Location.fromJson(json['Location'] as Map<String, dynamic>),
    model: json['Model'] as String,
    serialNumber: json['SerialNumber'] as String,
    siteId: json['SiteId'] as String,
    state: _$enumDecodeNullable(_$DeviceStateEnumMap, json['State']),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: json['Type'] as String,
    vendor: json['Vendor'] as String,
  );
}

const _$DeviceStateEnumMap = {
  DeviceState.pending: 'PENDING',
  DeviceState.available: 'AVAILABLE',
  DeviceState.deleting: 'DELETING',
  DeviceState.updating: 'UPDATING',
};

DisassociateCustomerGatewayResponse
    _$DisassociateCustomerGatewayResponseFromJson(Map<String, dynamic> json) {
  return DisassociateCustomerGatewayResponse(
    customerGatewayAssociation: json['CustomerGatewayAssociation'] == null
        ? null
        : CustomerGatewayAssociation.fromJson(
            json['CustomerGatewayAssociation'] as Map<String, dynamic>),
  );
}

DisassociateLinkResponse _$DisassociateLinkResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateLinkResponse(
    linkAssociation: json['LinkAssociation'] == null
        ? null
        : LinkAssociation.fromJson(
            json['LinkAssociation'] as Map<String, dynamic>),
  );
}

DisassociateTransitGatewayConnectPeerResponse
    _$DisassociateTransitGatewayConnectPeerResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateTransitGatewayConnectPeerResponse(
    transitGatewayConnectPeerAssociation:
        json['TransitGatewayConnectPeerAssociation'] == null
            ? null
            : TransitGatewayConnectPeerAssociation.fromJson(
                json['TransitGatewayConnectPeerAssociation']
                    as Map<String, dynamic>),
  );
}

GetConnectionsResponse _$GetConnectionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetConnectionsResponse(
    connections: (json['Connections'] as List)
        ?.map((e) =>
            e == null ? null : Connection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetCustomerGatewayAssociationsResponse
    _$GetCustomerGatewayAssociationsResponseFromJson(
        Map<String, dynamic> json) {
  return GetCustomerGatewayAssociationsResponse(
    customerGatewayAssociations: (json['CustomerGatewayAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : CustomerGatewayAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetDevicesResponse _$GetDevicesResponseFromJson(Map<String, dynamic> json) {
  return GetDevicesResponse(
    devices: (json['Devices'] as List)
        ?.map((e) =>
            e == null ? null : Device.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetLinkAssociationsResponse _$GetLinkAssociationsResponseFromJson(
    Map<String, dynamic> json) {
  return GetLinkAssociationsResponse(
    linkAssociations: (json['LinkAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : LinkAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetLinksResponse _$GetLinksResponseFromJson(Map<String, dynamic> json) {
  return GetLinksResponse(
    links: (json['Links'] as List)
        ?.map(
            (e) => e == null ? null : Link.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetSitesResponse _$GetSitesResponseFromJson(Map<String, dynamic> json) {
  return GetSitesResponse(
    nextToken: json['NextToken'] as String,
    sites: (json['Sites'] as List)
        ?.map(
            (e) => e == null ? null : Site.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetTransitGatewayConnectPeerAssociationsResponse
    _$GetTransitGatewayConnectPeerAssociationsResponseFromJson(
        Map<String, dynamic> json) {
  return GetTransitGatewayConnectPeerAssociationsResponse(
    nextToken: json['NextToken'] as String,
    transitGatewayConnectPeerAssociations:
        (json['TransitGatewayConnectPeerAssociations'] as List)
            ?.map((e) => e == null
                ? null
                : TransitGatewayConnectPeerAssociation.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

GetTransitGatewayRegistrationsResponse
    _$GetTransitGatewayRegistrationsResponseFromJson(
        Map<String, dynamic> json) {
  return GetTransitGatewayRegistrationsResponse(
    nextToken: json['NextToken'] as String,
    transitGatewayRegistrations: (json['TransitGatewayRegistrations'] as List)
        ?.map((e) => e == null
            ? null
            : TransitGatewayRegistration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GlobalNetwork _$GlobalNetworkFromJson(Map<String, dynamic> json) {
  return GlobalNetwork(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    globalNetworkArn: json['GlobalNetworkArn'] as String,
    globalNetworkId: json['GlobalNetworkId'] as String,
    state: _$enumDecodeNullable(_$GlobalNetworkStateEnumMap, json['State']),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$GlobalNetworkStateEnumMap = {
  GlobalNetworkState.pending: 'PENDING',
  GlobalNetworkState.available: 'AVAILABLE',
  GlobalNetworkState.deleting: 'DELETING',
  GlobalNetworkState.updating: 'UPDATING',
};

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
    bandwidth: json['Bandwidth'] == null
        ? null
        : Bandwidth.fromJson(json['Bandwidth'] as Map<String, dynamic>),
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    globalNetworkId: json['GlobalNetworkId'] as String,
    linkArn: json['LinkArn'] as String,
    linkId: json['LinkId'] as String,
    provider: json['Provider'] as String,
    siteId: json['SiteId'] as String,
    state: _$enumDecodeNullable(_$LinkStateEnumMap, json['State']),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: json['Type'] as String,
  );
}

const _$LinkStateEnumMap = {
  LinkState.pending: 'PENDING',
  LinkState.available: 'AVAILABLE',
  LinkState.deleting: 'DELETING',
  LinkState.updating: 'UPDATING',
};

LinkAssociation _$LinkAssociationFromJson(Map<String, dynamic> json) {
  return LinkAssociation(
    deviceId: json['DeviceId'] as String,
    globalNetworkId: json['GlobalNetworkId'] as String,
    linkAssociationState: _$enumDecodeNullable(
        _$LinkAssociationStateEnumMap, json['LinkAssociationState']),
    linkId: json['LinkId'] as String,
  );
}

const _$LinkAssociationStateEnumMap = {
  LinkAssociationState.pending: 'PENDING',
  LinkAssociationState.available: 'AVAILABLE',
  LinkAssociationState.deleting: 'DELETING',
  LinkAssociationState.deleted: 'DELETED',
};

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    address: json['Address'] as String,
    latitude: json['Latitude'] as String,
    longitude: json['Longitude'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  writeNotNull('Latitude', instance.latitude);
  writeNotNull('Longitude', instance.longitude);
  return val;
}

RegisterTransitGatewayResponse _$RegisterTransitGatewayResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterTransitGatewayResponse(
    transitGatewayRegistration: json['TransitGatewayRegistration'] == null
        ? null
        : TransitGatewayRegistration.fromJson(
            json['TransitGatewayRegistration'] as Map<String, dynamic>),
  );
}

Site _$SiteFromJson(Map<String, dynamic> json) {
  return Site(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    description: json['Description'] as String,
    globalNetworkId: json['GlobalNetworkId'] as String,
    location: json['Location'] == null
        ? null
        : Location.fromJson(json['Location'] as Map<String, dynamic>),
    siteArn: json['SiteArn'] as String,
    siteId: json['SiteId'] as String,
    state: _$enumDecodeNullable(_$SiteStateEnumMap, json['State']),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$SiteStateEnumMap = {
  SiteState.pending: 'PENDING',
  SiteState.available: 'AVAILABLE',
  SiteState.deleting: 'DELETING',
  SiteState.updating: 'UPDATING',
};

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

TransitGatewayConnectPeerAssociation
    _$TransitGatewayConnectPeerAssociationFromJson(Map<String, dynamic> json) {
  return TransitGatewayConnectPeerAssociation(
    deviceId: json['DeviceId'] as String,
    globalNetworkId: json['GlobalNetworkId'] as String,
    linkId: json['LinkId'] as String,
    state: _$enumDecodeNullable(
        _$TransitGatewayConnectPeerAssociationStateEnumMap, json['State']),
    transitGatewayConnectPeerArn:
        json['TransitGatewayConnectPeerArn'] as String,
  );
}

const _$TransitGatewayConnectPeerAssociationStateEnumMap = {
  TransitGatewayConnectPeerAssociationState.pending: 'PENDING',
  TransitGatewayConnectPeerAssociationState.available: 'AVAILABLE',
  TransitGatewayConnectPeerAssociationState.deleting: 'DELETING',
  TransitGatewayConnectPeerAssociationState.deleted: 'DELETED',
};

TransitGatewayRegistration _$TransitGatewayRegistrationFromJson(
    Map<String, dynamic> json) {
  return TransitGatewayRegistration(
    globalNetworkId: json['GlobalNetworkId'] as String,
    state: json['State'] == null
        ? null
        : TransitGatewayRegistrationStateReason.fromJson(
            json['State'] as Map<String, dynamic>),
    transitGatewayArn: json['TransitGatewayArn'] as String,
  );
}

TransitGatewayRegistrationStateReason
    _$TransitGatewayRegistrationStateReasonFromJson(Map<String, dynamic> json) {
  return TransitGatewayRegistrationStateReason(
    code: _$enumDecodeNullable(
        _$TransitGatewayRegistrationStateEnumMap, json['Code']),
    message: json['Message'] as String,
  );
}

const _$TransitGatewayRegistrationStateEnumMap = {
  TransitGatewayRegistrationState.pending: 'PENDING',
  TransitGatewayRegistrationState.available: 'AVAILABLE',
  TransitGatewayRegistrationState.deleting: 'DELETING',
  TransitGatewayRegistrationState.deleted: 'DELETED',
  TransitGatewayRegistrationState.failed: 'FAILED',
};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateConnectionResponse _$UpdateConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateConnectionResponse(
    connection: json['Connection'] == null
        ? null
        : Connection.fromJson(json['Connection'] as Map<String, dynamic>),
  );
}

UpdateDeviceResponse _$UpdateDeviceResponseFromJson(Map<String, dynamic> json) {
  return UpdateDeviceResponse(
    device: json['Device'] == null
        ? null
        : Device.fromJson(json['Device'] as Map<String, dynamic>),
  );
}

UpdateGlobalNetworkResponse _$UpdateGlobalNetworkResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateGlobalNetworkResponse(
    globalNetwork: json['GlobalNetwork'] == null
        ? null
        : GlobalNetwork.fromJson(json['GlobalNetwork'] as Map<String, dynamic>),
  );
}

UpdateLinkResponse _$UpdateLinkResponseFromJson(Map<String, dynamic> json) {
  return UpdateLinkResponse(
    link: json['Link'] == null
        ? null
        : Link.fromJson(json['Link'] as Map<String, dynamic>),
  );
}

UpdateSiteResponse _$UpdateSiteResponseFromJson(Map<String, dynamic> json) {
  return UpdateSiteResponse(
    site: json['Site'] == null
        ? null
        : Site.fromJson(json['Site'] as Map<String, dynamic>),
  );
}
