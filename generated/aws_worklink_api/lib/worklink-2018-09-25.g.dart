// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worklink-2018-09-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AssociateDomainRequestToJson(
    AssociateDomainRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcmCertificateArn', instance.acmCertificateArn);
  writeNotNull('DomainName', instance.domainName);
  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('DisplayName', instance.displayName);
  return val;
}

AssociateDomainResponse _$AssociateDomainResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateDomainResponse();
}

Map<String, dynamic> _$AssociateWebsiteAuthorizationProviderRequestToJson(
    AssociateWebsiteAuthorizationProviderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthorizationProviderType',
      _$AuthorizationProviderTypeEnumMap[instance.authorizationProviderType]);
  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('DomainName', instance.domainName);
  return val;
}

const _$AuthorizationProviderTypeEnumMap = {
  AuthorizationProviderType.saml: 'SAML',
};

AssociateWebsiteAuthorizationProviderResponse
    _$AssociateWebsiteAuthorizationProviderResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateWebsiteAuthorizationProviderResponse(
    authorizationProviderId: json['AuthorizationProviderId'] as String,
  );
}

Map<String, dynamic> _$AssociateWebsiteCertificateAuthorityRequestToJson(
    AssociateWebsiteCertificateAuthorityRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Certificate', instance.certificate);
  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('DisplayName', instance.displayName);
  return val;
}

AssociateWebsiteCertificateAuthorityResponse
    _$AssociateWebsiteCertificateAuthorityResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateWebsiteCertificateAuthorityResponse(
    websiteCaId: json['WebsiteCaId'] as String,
  );
}

Map<String, dynamic> _$CreateFleetRequestToJson(CreateFleetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetName', instance.fleetName);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull(
      'OptimizeForEndUserLocation', instance.optimizeForEndUserLocation);
  return val;
}

CreateFleetResponse _$CreateFleetResponseFromJson(Map<String, dynamic> json) {
  return CreateFleetResponse(
    fleetArn: json['FleetArn'] as String,
  );
}

Map<String, dynamic> _$DeleteFleetRequestToJson(DeleteFleetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

DeleteFleetResponse _$DeleteFleetResponseFromJson(Map<String, dynamic> json) {
  return DeleteFleetResponse();
}

Map<String, dynamic> _$DescribeAuditStreamConfigurationRequestToJson(
    DescribeAuditStreamConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

DescribeAuditStreamConfigurationResponse
    _$DescribeAuditStreamConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeAuditStreamConfigurationResponse(
    auditStreamArn: json['AuditStreamArn'] as String,
  );
}

Map<String, dynamic> _$DescribeCompanyNetworkConfigurationRequestToJson(
    DescribeCompanyNetworkConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

DescribeCompanyNetworkConfigurationResponse
    _$DescribeCompanyNetworkConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeCompanyNetworkConfigurationResponse(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$DescribeDevicePolicyConfigurationRequestToJson(
    DescribeDevicePolicyConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

DescribeDevicePolicyConfigurationResponse
    _$DescribeDevicePolicyConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeDevicePolicyConfigurationResponse(
    deviceCaCertificate: json['DeviceCaCertificate'] as String,
  );
}

Map<String, dynamic> _$DescribeDeviceRequestToJson(
    DescribeDeviceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeviceId', instance.deviceId);
  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

DescribeDeviceResponse _$DescribeDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDeviceResponse(
    firstAccessedTime: unixTimestampFromJson(json['FirstAccessedTime']),
    lastAccessedTime: unixTimestampFromJson(json['LastAccessedTime']),
    manufacturer: json['Manufacturer'] as String,
    model: json['Model'] as String,
    operatingSystem: json['OperatingSystem'] as String,
    operatingSystemVersion: json['OperatingSystemVersion'] as String,
    patchLevel: json['PatchLevel'] as String,
    status: _$enumDecodeNullable(_$DeviceStatusEnumMap, json['Status']),
    username: json['Username'] as String,
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

const _$DeviceStatusEnumMap = {
  DeviceStatus.active: 'ACTIVE',
  DeviceStatus.signedOut: 'SIGNED_OUT',
};

Map<String, dynamic> _$DescribeDomainRequestToJson(
    DescribeDomainRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

DescribeDomainResponse _$DescribeDomainResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDomainResponse(
    acmCertificateArn: json['AcmCertificateArn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    displayName: json['DisplayName'] as String,
    domainName: json['DomainName'] as String,
    domainStatus:
        _$enumDecodeNullable(_$DomainStatusEnumMap, json['DomainStatus']),
  );
}

const _$DomainStatusEnumMap = {
  DomainStatus.pendingValidation: 'PENDING_VALIDATION',
  DomainStatus.associating: 'ASSOCIATING',
  DomainStatus.active: 'ACTIVE',
  DomainStatus.inactive: 'INACTIVE',
  DomainStatus.disassociating: 'DISASSOCIATING',
  DomainStatus.disassociated: 'DISASSOCIATED',
  DomainStatus.failedToAssociate: 'FAILED_TO_ASSOCIATE',
  DomainStatus.failedToDisassociate: 'FAILED_TO_DISASSOCIATE',
};

Map<String, dynamic> _$DescribeFleetMetadataRequestToJson(
    DescribeFleetMetadataRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

DescribeFleetMetadataResponse _$DescribeFleetMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFleetMetadataResponse(
    companyCode: json['CompanyCode'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    displayName: json['DisplayName'] as String,
    fleetName: json['FleetName'] as String,
    fleetStatus:
        _$enumDecodeNullable(_$FleetStatusEnumMap, json['FleetStatus']),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
    optimizeForEndUserLocation: json['OptimizeForEndUserLocation'] as bool,
  );
}

const _$FleetStatusEnumMap = {
  FleetStatus.creating: 'CREATING',
  FleetStatus.active: 'ACTIVE',
  FleetStatus.deleting: 'DELETING',
  FleetStatus.deleted: 'DELETED',
  FleetStatus.failedToCreate: 'FAILED_TO_CREATE',
  FleetStatus.failedToDelete: 'FAILED_TO_DELETE',
};

Map<String, dynamic> _$DescribeIdentityProviderConfigurationRequestToJson(
    DescribeIdentityProviderConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

DescribeIdentityProviderConfigurationResponse
    _$DescribeIdentityProviderConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeIdentityProviderConfigurationResponse(
    identityProviderSamlMetadata:
        json['IdentityProviderSamlMetadata'] as String,
    identityProviderType: _$enumDecodeNullable(
        _$IdentityProviderTypeEnumMap, json['IdentityProviderType']),
    serviceProviderSamlMetadata: json['ServiceProviderSamlMetadata'] as String,
  );
}

const _$IdentityProviderTypeEnumMap = {
  IdentityProviderType.saml: 'SAML',
};

Map<String, dynamic> _$DescribeWebsiteCertificateAuthorityRequestToJson(
    DescribeWebsiteCertificateAuthorityRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('WebsiteCaId', instance.websiteCaId);
  return val;
}

DescribeWebsiteCertificateAuthorityResponse
    _$DescribeWebsiteCertificateAuthorityResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeWebsiteCertificateAuthorityResponse(
    certificate: json['Certificate'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    displayName: json['DisplayName'] as String,
  );
}

DeviceSummary _$DeviceSummaryFromJson(Map<String, dynamic> json) {
  return DeviceSummary(
    deviceId: json['DeviceId'] as String,
    deviceStatus:
        _$enumDecodeNullable(_$DeviceStatusEnumMap, json['DeviceStatus']),
  );
}

Map<String, dynamic> _$DisassociateDomainRequestToJson(
    DisassociateDomainRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

DisassociateDomainResponse _$DisassociateDomainResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateDomainResponse();
}

Map<String, dynamic> _$DisassociateWebsiteAuthorizationProviderRequestToJson(
    DisassociateWebsiteAuthorizationProviderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthorizationProviderId', instance.authorizationProviderId);
  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

DisassociateWebsiteAuthorizationProviderResponse
    _$DisassociateWebsiteAuthorizationProviderResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateWebsiteAuthorizationProviderResponse();
}

Map<String, dynamic> _$DisassociateWebsiteCertificateAuthorityRequestToJson(
    DisassociateWebsiteCertificateAuthorityRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('WebsiteCaId', instance.websiteCaId);
  return val;
}

DisassociateWebsiteCertificateAuthorityResponse
    _$DisassociateWebsiteCertificateAuthorityResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateWebsiteCertificateAuthorityResponse();
}

DomainSummary _$DomainSummaryFromJson(Map<String, dynamic> json) {
  return DomainSummary(
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    domainName: json['DomainName'] as String,
    domainStatus:
        _$enumDecodeNullable(_$DomainStatusEnumMap, json['DomainStatus']),
    displayName: json['DisplayName'] as String,
  );
}

FleetSummary _$FleetSummaryFromJson(Map<String, dynamic> json) {
  return FleetSummary(
    companyCode: json['CompanyCode'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    displayName: json['DisplayName'] as String,
    fleetArn: json['FleetArn'] as String,
    fleetName: json['FleetName'] as String,
    fleetStatus:
        _$enumDecodeNullable(_$FleetStatusEnumMap, json['FleetStatus']),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
  );
}

Map<String, dynamic> _$ListDevicesRequestToJson(ListDevicesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListDevicesResponse _$ListDevicesResponseFromJson(Map<String, dynamic> json) {
  return ListDevicesResponse(
    devices: (json['Devices'] as List)
        ?.map((e) => e == null
            ? null
            : DeviceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListDomainsRequestToJson(ListDomainsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListDomainsResponse _$ListDomainsResponseFromJson(Map<String, dynamic> json) {
  return ListDomainsResponse(
    domains: (json['Domains'] as List)
        ?.map((e) => e == null
            ? null
            : DomainSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListFleetsRequestToJson(ListFleetsRequest instance) {
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

ListFleetsResponse _$ListFleetsResponseFromJson(Map<String, dynamic> json) {
  return ListFleetsResponse(
    fleetSummaryList: (json['FleetSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : FleetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListWebsiteAuthorizationProvidersRequestToJson(
    ListWebsiteAuthorizationProvidersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListWebsiteAuthorizationProvidersResponse
    _$ListWebsiteAuthorizationProvidersResponseFromJson(
        Map<String, dynamic> json) {
  return ListWebsiteAuthorizationProvidersResponse(
    nextToken: json['NextToken'] as String,
    websiteAuthorizationProviders:
        (json['WebsiteAuthorizationProviders'] as List)
            ?.map((e) => e == null
                ? null
                : WebsiteAuthorizationProviderSummary.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

Map<String, dynamic> _$ListWebsiteCertificateAuthoritiesRequestToJson(
    ListWebsiteCertificateAuthoritiesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListWebsiteCertificateAuthoritiesResponse
    _$ListWebsiteCertificateAuthoritiesResponseFromJson(
        Map<String, dynamic> json) {
  return ListWebsiteCertificateAuthoritiesResponse(
    nextToken: json['NextToken'] as String,
    websiteCertificateAuthorities:
        (json['WebsiteCertificateAuthorities'] as List)
            ?.map((e) => e == null
                ? null
                : WebsiteCaSummary.fromJson(e as Map<String, dynamic>))
            ?.toList(),
  );
}

Map<String, dynamic> _$RestoreDomainAccessRequestToJson(
    RestoreDomainAccessRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

RestoreDomainAccessResponse _$RestoreDomainAccessResponseFromJson(
    Map<String, dynamic> json) {
  return RestoreDomainAccessResponse();
}

Map<String, dynamic> _$RevokeDomainAccessRequestToJson(
    RevokeDomainAccessRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('FleetArn', instance.fleetArn);
  return val;
}

RevokeDomainAccessResponse _$RevokeDomainAccessResponseFromJson(
    Map<String, dynamic> json) {
  return RevokeDomainAccessResponse();
}

Map<String, dynamic> _$SignOutUserRequestToJson(SignOutUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('Username', instance.username);
  return val;
}

SignOutUserResponse _$SignOutUserResponseFromJson(Map<String, dynamic> json) {
  return SignOutUserResponse();
}

Map<String, dynamic> _$UpdateAuditStreamConfigurationRequestToJson(
    UpdateAuditStreamConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('AuditStreamArn', instance.auditStreamArn);
  return val;
}

UpdateAuditStreamConfigurationResponse
    _$UpdateAuditStreamConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateAuditStreamConfigurationResponse();
}

Map<String, dynamic> _$UpdateCompanyNetworkConfigurationRequestToJson(
    UpdateCompanyNetworkConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

UpdateCompanyNetworkConfigurationResponse
    _$UpdateCompanyNetworkConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateCompanyNetworkConfigurationResponse();
}

Map<String, dynamic> _$UpdateDevicePolicyConfigurationRequestToJson(
    UpdateDevicePolicyConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('DeviceCaCertificate', instance.deviceCaCertificate);
  return val;
}

UpdateDevicePolicyConfigurationResponse
    _$UpdateDevicePolicyConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateDevicePolicyConfigurationResponse();
}

Map<String, dynamic> _$UpdateDomainMetadataRequestToJson(
    UpdateDomainMetadataRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('DisplayName', instance.displayName);
  return val;
}

UpdateDomainMetadataResponse _$UpdateDomainMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDomainMetadataResponse();
}

Map<String, dynamic> _$UpdateFleetMetadataRequestToJson(
    UpdateFleetMetadataRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull(
      'OptimizeForEndUserLocation', instance.optimizeForEndUserLocation);
  return val;
}

UpdateFleetMetadataResponse _$UpdateFleetMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFleetMetadataResponse();
}

Map<String, dynamic> _$UpdateIdentityProviderConfigurationRequestToJson(
    UpdateIdentityProviderConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetArn', instance.fleetArn);
  writeNotNull('IdentityProviderType',
      _$IdentityProviderTypeEnumMap[instance.identityProviderType]);
  writeNotNull(
      'IdentityProviderSamlMetadata', instance.identityProviderSamlMetadata);
  return val;
}

UpdateIdentityProviderConfigurationResponse
    _$UpdateIdentityProviderConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateIdentityProviderConfigurationResponse();
}

WebsiteAuthorizationProviderSummary
    _$WebsiteAuthorizationProviderSummaryFromJson(Map<String, dynamic> json) {
  return WebsiteAuthorizationProviderSummary(
    authorizationProviderType: _$enumDecodeNullable(
        _$AuthorizationProviderTypeEnumMap, json['AuthorizationProviderType']),
    authorizationProviderId: json['AuthorizationProviderId'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    domainName: json['DomainName'] as String,
  );
}

WebsiteCaSummary _$WebsiteCaSummaryFromJson(Map<String, dynamic> json) {
  return WebsiteCaSummary(
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    displayName: json['DisplayName'] as String,
    websiteCaId: json['WebsiteCaId'] as String,
  );
}
