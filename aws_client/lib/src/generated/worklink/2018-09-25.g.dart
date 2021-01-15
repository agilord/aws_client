// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-09-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociateDomainResponse _$AssociateDomainResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateDomainResponse();
}

AssociateWebsiteAuthorizationProviderResponse
    _$AssociateWebsiteAuthorizationProviderResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateWebsiteAuthorizationProviderResponse(
    authorizationProviderId: json['AuthorizationProviderId'] as String,
  );
}

AssociateWebsiteCertificateAuthorityResponse
    _$AssociateWebsiteCertificateAuthorityResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateWebsiteCertificateAuthorityResponse(
    websiteCaId: json['WebsiteCaId'] as String,
  );
}

CreateFleetResponse _$CreateFleetResponseFromJson(Map<String, dynamic> json) {
  return CreateFleetResponse(
    fleetArn: json['FleetArn'] as String,
  );
}

DeleteFleetResponse _$DeleteFleetResponseFromJson(Map<String, dynamic> json) {
  return DeleteFleetResponse();
}

DescribeAuditStreamConfigurationResponse
    _$DescribeAuditStreamConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeAuditStreamConfigurationResponse(
    auditStreamArn: json['AuditStreamArn'] as String,
  );
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

DescribeDevicePolicyConfigurationResponse
    _$DescribeDevicePolicyConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeDevicePolicyConfigurationResponse(
    deviceCaCertificate: json['DeviceCaCertificate'] as String,
  );
}

DescribeDeviceResponse _$DescribeDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDeviceResponse(
    firstAccessedTime:
        const UnixDateTimeConverter().fromJson(json['FirstAccessedTime']),
    lastAccessedTime:
        const UnixDateTimeConverter().fromJson(json['LastAccessedTime']),
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

DescribeDomainResponse _$DescribeDomainResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDomainResponse(
    acmCertificateArn: json['AcmCertificateArn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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

DescribeFleetMetadataResponse _$DescribeFleetMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFleetMetadataResponse(
    companyCode: json['CompanyCode'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    displayName: json['DisplayName'] as String,
    fleetName: json['FleetName'] as String,
    fleetStatus:
        _$enumDecodeNullable(_$FleetStatusEnumMap, json['FleetStatus']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    optimizeForEndUserLocation: json['OptimizeForEndUserLocation'] as bool,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
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

DescribeWebsiteCertificateAuthorityResponse
    _$DescribeWebsiteCertificateAuthorityResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeWebsiteCertificateAuthorityResponse(
    certificate: json['Certificate'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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

DisassociateDomainResponse _$DisassociateDomainResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateDomainResponse();
}

DisassociateWebsiteAuthorizationProviderResponse
    _$DisassociateWebsiteAuthorizationProviderResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateWebsiteAuthorizationProviderResponse();
}

DisassociateWebsiteCertificateAuthorityResponse
    _$DisassociateWebsiteCertificateAuthorityResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateWebsiteCertificateAuthorityResponse();
}

DomainSummary _$DomainSummaryFromJson(Map<String, dynamic> json) {
  return DomainSummary(
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    domainName: json['DomainName'] as String,
    domainStatus:
        _$enumDecodeNullable(_$DomainStatusEnumMap, json['DomainStatus']),
    displayName: json['DisplayName'] as String,
  );
}

FleetSummary _$FleetSummaryFromJson(Map<String, dynamic> json) {
  return FleetSummary(
    companyCode: json['CompanyCode'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    displayName: json['DisplayName'] as String,
    fleetArn: json['FleetArn'] as String,
    fleetName: json['FleetName'] as String,
    fleetStatus:
        _$enumDecodeNullable(_$FleetStatusEnumMap, json['FleetStatus']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
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

ListFleetsResponse _$ListFleetsResponseFromJson(Map<String, dynamic> json) {
  return ListFleetsResponse(
    fleetSummaryList: (json['FleetSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : FleetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
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

RestoreDomainAccessResponse _$RestoreDomainAccessResponseFromJson(
    Map<String, dynamic> json) {
  return RestoreDomainAccessResponse();
}

RevokeDomainAccessResponse _$RevokeDomainAccessResponseFromJson(
    Map<String, dynamic> json) {
  return RevokeDomainAccessResponse();
}

SignOutUserResponse _$SignOutUserResponseFromJson(Map<String, dynamic> json) {
  return SignOutUserResponse();
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateAuditStreamConfigurationResponse
    _$UpdateAuditStreamConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateAuditStreamConfigurationResponse();
}

UpdateCompanyNetworkConfigurationResponse
    _$UpdateCompanyNetworkConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateCompanyNetworkConfigurationResponse();
}

UpdateDevicePolicyConfigurationResponse
    _$UpdateDevicePolicyConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateDevicePolicyConfigurationResponse();
}

UpdateDomainMetadataResponse _$UpdateDomainMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDomainMetadataResponse();
}

UpdateFleetMetadataResponse _$UpdateFleetMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFleetMetadataResponse();
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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    domainName: json['DomainName'] as String,
  );
}

const _$AuthorizationProviderTypeEnumMap = {
  AuthorizationProviderType.saml: 'SAML',
};

WebsiteCaSummary _$WebsiteCaSummaryFromJson(Map<String, dynamic> json) {
  return WebsiteCaSummary(
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    displayName: json['DisplayName'] as String,
    websiteCaId: json['WebsiteCaId'] as String,
  );
}
