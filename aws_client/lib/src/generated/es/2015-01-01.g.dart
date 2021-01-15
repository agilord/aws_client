// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-01-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptInboundCrossClusterSearchConnectionResponse
    _$AcceptInboundCrossClusterSearchConnectionResponseFromJson(
        Map<String, dynamic> json) {
  return AcceptInboundCrossClusterSearchConnectionResponse(
    crossClusterSearchConnection: json['CrossClusterSearchConnection'] == null
        ? null
        : InboundCrossClusterSearchConnection.fromJson(
            json['CrossClusterSearchConnection'] as Map<String, dynamic>),
  );
}

AccessPoliciesStatus _$AccessPoliciesStatusFromJson(Map<String, dynamic> json) {
  return AccessPoliciesStatus(
    options: json['Options'] as String,
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

AdditionalLimit _$AdditionalLimitFromJson(Map<String, dynamic> json) {
  return AdditionalLimit(
    limitName: json['LimitName'] as String,
    limitValues:
        (json['LimitValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

AdvancedOptionsStatus _$AdvancedOptionsStatusFromJson(
    Map<String, dynamic> json) {
  return AdvancedOptionsStatus(
    options: (json['Options'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

AdvancedSecurityOptions _$AdvancedSecurityOptionsFromJson(
    Map<String, dynamic> json) {
  return AdvancedSecurityOptions(
    enabled: json['Enabled'] as bool,
    internalUserDatabaseEnabled: json['InternalUserDatabaseEnabled'] as bool,
    sAMLOptions: json['SAMLOptions'] == null
        ? null
        : SAMLOptionsOutput.fromJson(
            json['SAMLOptions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AdvancedSecurityOptionsInputToJson(
    AdvancedSecurityOptionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull(
      'InternalUserDatabaseEnabled', instance.internalUserDatabaseEnabled);
  writeNotNull('MasterUserOptions', instance.masterUserOptions?.toJson());
  writeNotNull('SAMLOptions', instance.sAMLOptions?.toJson());
  return val;
}

AdvancedSecurityOptionsStatus _$AdvancedSecurityOptionsStatusFromJson(
    Map<String, dynamic> json) {
  return AdvancedSecurityOptionsStatus(
    options: json['Options'] == null
        ? null
        : AdvancedSecurityOptions.fromJson(
            json['Options'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

AssociatePackageResponse _$AssociatePackageResponseFromJson(
    Map<String, dynamic> json) {
  return AssociatePackageResponse(
    domainPackageDetails: json['DomainPackageDetails'] == null
        ? null
        : DomainPackageDetails.fromJson(
            json['DomainPackageDetails'] as Map<String, dynamic>),
  );
}

CancelElasticsearchServiceSoftwareUpdateResponse
    _$CancelElasticsearchServiceSoftwareUpdateResponseFromJson(
        Map<String, dynamic> json) {
  return CancelElasticsearchServiceSoftwareUpdateResponse(
    serviceSoftwareOptions: json['ServiceSoftwareOptions'] == null
        ? null
        : ServiceSoftwareOptions.fromJson(
            json['ServiceSoftwareOptions'] as Map<String, dynamic>),
  );
}

CognitoOptions _$CognitoOptionsFromJson(Map<String, dynamic> json) {
  return CognitoOptions(
    enabled: json['Enabled'] as bool,
    identityPoolId: json['IdentityPoolId'] as String,
    roleArn: json['RoleArn'] as String,
    userPoolId: json['UserPoolId'] as String,
  );
}

Map<String, dynamic> _$CognitoOptionsToJson(CognitoOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('IdentityPoolId', instance.identityPoolId);
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('UserPoolId', instance.userPoolId);
  return val;
}

CognitoOptionsStatus _$CognitoOptionsStatusFromJson(Map<String, dynamic> json) {
  return CognitoOptionsStatus(
    options: json['Options'] == null
        ? null
        : CognitoOptions.fromJson(json['Options'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

CompatibleVersionsMap _$CompatibleVersionsMapFromJson(
    Map<String, dynamic> json) {
  return CompatibleVersionsMap(
    sourceVersion: json['SourceVersion'] as String,
    targetVersions:
        (json['TargetVersions'] as List)?.map((e) => e as String)?.toList(),
  );
}

CreateElasticsearchDomainResponse _$CreateElasticsearchDomainResponseFromJson(
    Map<String, dynamic> json) {
  return CreateElasticsearchDomainResponse(
    domainStatus: json['DomainStatus'] == null
        ? null
        : ElasticsearchDomainStatus.fromJson(
            json['DomainStatus'] as Map<String, dynamic>),
  );
}

CreateOutboundCrossClusterSearchConnectionResponse
    _$CreateOutboundCrossClusterSearchConnectionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateOutboundCrossClusterSearchConnectionResponse(
    connectionAlias: json['ConnectionAlias'] as String,
    connectionStatus: json['ConnectionStatus'] == null
        ? null
        : OutboundCrossClusterSearchConnectionStatus.fromJson(
            json['ConnectionStatus'] as Map<String, dynamic>),
    crossClusterSearchConnectionId:
        json['CrossClusterSearchConnectionId'] as String,
    destinationDomainInfo: json['DestinationDomainInfo'] == null
        ? null
        : DomainInformation.fromJson(
            json['DestinationDomainInfo'] as Map<String, dynamic>),
    sourceDomainInfo: json['SourceDomainInfo'] == null
        ? null
        : DomainInformation.fromJson(
            json['SourceDomainInfo'] as Map<String, dynamic>),
  );
}

CreatePackageResponse _$CreatePackageResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePackageResponse(
    packageDetails: json['PackageDetails'] == null
        ? null
        : PackageDetails.fromJson(
            json['PackageDetails'] as Map<String, dynamic>),
  );
}

DeleteElasticsearchDomainResponse _$DeleteElasticsearchDomainResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteElasticsearchDomainResponse(
    domainStatus: json['DomainStatus'] == null
        ? null
        : ElasticsearchDomainStatus.fromJson(
            json['DomainStatus'] as Map<String, dynamic>),
  );
}

DeleteInboundCrossClusterSearchConnectionResponse
    _$DeleteInboundCrossClusterSearchConnectionResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteInboundCrossClusterSearchConnectionResponse(
    crossClusterSearchConnection: json['CrossClusterSearchConnection'] == null
        ? null
        : InboundCrossClusterSearchConnection.fromJson(
            json['CrossClusterSearchConnection'] as Map<String, dynamic>),
  );
}

DeleteOutboundCrossClusterSearchConnectionResponse
    _$DeleteOutboundCrossClusterSearchConnectionResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteOutboundCrossClusterSearchConnectionResponse(
    crossClusterSearchConnection: json['CrossClusterSearchConnection'] == null
        ? null
        : OutboundCrossClusterSearchConnection.fromJson(
            json['CrossClusterSearchConnection'] as Map<String, dynamic>),
  );
}

DeletePackageResponse _$DeletePackageResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePackageResponse(
    packageDetails: json['PackageDetails'] == null
        ? null
        : PackageDetails.fromJson(
            json['PackageDetails'] as Map<String, dynamic>),
  );
}

DescribeElasticsearchDomainConfigResponse
    _$DescribeElasticsearchDomainConfigResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeElasticsearchDomainConfigResponse(
    domainConfig: json['DomainConfig'] == null
        ? null
        : ElasticsearchDomainConfig.fromJson(
            json['DomainConfig'] as Map<String, dynamic>),
  );
}

DescribeElasticsearchDomainResponse
    _$DescribeElasticsearchDomainResponseFromJson(Map<String, dynamic> json) {
  return DescribeElasticsearchDomainResponse(
    domainStatus: json['DomainStatus'] == null
        ? null
        : ElasticsearchDomainStatus.fromJson(
            json['DomainStatus'] as Map<String, dynamic>),
  );
}

DescribeElasticsearchDomainsResponse
    _$DescribeElasticsearchDomainsResponseFromJson(Map<String, dynamic> json) {
  return DescribeElasticsearchDomainsResponse(
    domainStatusList: (json['DomainStatusList'] as List)
        ?.map((e) => e == null
            ? null
            : ElasticsearchDomainStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeElasticsearchInstanceTypeLimitsResponse
    _$DescribeElasticsearchInstanceTypeLimitsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeElasticsearchInstanceTypeLimitsResponse(
    limitsByRole: (json['LimitsByRole'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Limits.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

DescribeInboundCrossClusterSearchConnectionsResponse
    _$DescribeInboundCrossClusterSearchConnectionsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeInboundCrossClusterSearchConnectionsResponse(
    crossClusterSearchConnections:
        (json['CrossClusterSearchConnections'] as List)
            ?.map((e) => e == null
                ? null
                : InboundCrossClusterSearchConnection.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeOutboundCrossClusterSearchConnectionsResponse
    _$DescribeOutboundCrossClusterSearchConnectionsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeOutboundCrossClusterSearchConnectionsResponse(
    crossClusterSearchConnections:
        (json['CrossClusterSearchConnections'] as List)
            ?.map((e) => e == null
                ? null
                : OutboundCrossClusterSearchConnection.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribePackagesFilterToJson(
    DescribePackagesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$DescribePackagesFilterNameEnumMap[instance.name]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$DescribePackagesFilterNameEnumMap = {
  DescribePackagesFilterName.packageID: 'PackageID',
  DescribePackagesFilterName.packageName: 'PackageName',
  DescribePackagesFilterName.packageStatus: 'PackageStatus',
};

DescribePackagesResponse _$DescribePackagesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePackagesResponse(
    nextToken: json['NextToken'] as String,
    packageDetailsList: (json['PackageDetailsList'] as List)
        ?.map((e) => e == null
            ? null
            : PackageDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeReservedElasticsearchInstanceOfferingsResponse
    _$DescribeReservedElasticsearchInstanceOfferingsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeReservedElasticsearchInstanceOfferingsResponse(
    nextToken: json['NextToken'] as String,
    reservedElasticsearchInstanceOfferings:
        (json['ReservedElasticsearchInstanceOfferings'] as List)
            ?.map((e) => e == null
                ? null
                : ReservedElasticsearchInstanceOffering.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

DescribeReservedElasticsearchInstancesResponse
    _$DescribeReservedElasticsearchInstancesResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeReservedElasticsearchInstancesResponse(
    nextToken: json['NextToken'] as String,
    reservedElasticsearchInstances: (json['ReservedElasticsearchInstances']
            as List)
        ?.map((e) => e == null
            ? null
            : ReservedElasticsearchInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DissociatePackageResponse _$DissociatePackageResponseFromJson(
    Map<String, dynamic> json) {
  return DissociatePackageResponse(
    domainPackageDetails: json['DomainPackageDetails'] == null
        ? null
        : DomainPackageDetails.fromJson(
            json['DomainPackageDetails'] as Map<String, dynamic>),
  );
}

DomainEndpointOptions _$DomainEndpointOptionsFromJson(
    Map<String, dynamic> json) {
  return DomainEndpointOptions(
    customEndpoint: json['CustomEndpoint'] as String,
    customEndpointCertificateArn:
        json['CustomEndpointCertificateArn'] as String,
    customEndpointEnabled: json['CustomEndpointEnabled'] as bool,
    enforceHTTPS: json['EnforceHTTPS'] as bool,
    tLSSecurityPolicy: _$enumDecodeNullable(
        _$TLSSecurityPolicyEnumMap, json['TLSSecurityPolicy']),
  );
}

Map<String, dynamic> _$DomainEndpointOptionsToJson(
    DomainEndpointOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomEndpoint', instance.customEndpoint);
  writeNotNull(
      'CustomEndpointCertificateArn', instance.customEndpointCertificateArn);
  writeNotNull('CustomEndpointEnabled', instance.customEndpointEnabled);
  writeNotNull('EnforceHTTPS', instance.enforceHTTPS);
  writeNotNull('TLSSecurityPolicy',
      _$TLSSecurityPolicyEnumMap[instance.tLSSecurityPolicy]);
  return val;
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

const _$TLSSecurityPolicyEnumMap = {
  TLSSecurityPolicy.policyMinTls_1_0_2019_07: 'Policy-Min-TLS-1-0-2019-07',
  TLSSecurityPolicy.policyMinTls_1_2_2019_07: 'Policy-Min-TLS-1-2-2019-07',
};

DomainEndpointOptionsStatus _$DomainEndpointOptionsStatusFromJson(
    Map<String, dynamic> json) {
  return DomainEndpointOptionsStatus(
    options: json['Options'] == null
        ? null
        : DomainEndpointOptions.fromJson(
            json['Options'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

DomainInfo _$DomainInfoFromJson(Map<String, dynamic> json) {
  return DomainInfo(
    domainName: json['DomainName'] as String,
  );
}

DomainInformation _$DomainInformationFromJson(Map<String, dynamic> json) {
  return DomainInformation(
    domainName: json['DomainName'] as String,
    ownerId: json['OwnerId'] as String,
    region: json['Region'] as String,
  );
}

Map<String, dynamic> _$DomainInformationToJson(DomainInformation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('OwnerId', instance.ownerId);
  writeNotNull('Region', instance.region);
  return val;
}

DomainPackageDetails _$DomainPackageDetailsFromJson(Map<String, dynamic> json) {
  return DomainPackageDetails(
    domainName: json['DomainName'] as String,
    domainPackageStatus: _$enumDecodeNullable(
        _$DomainPackageStatusEnumMap, json['DomainPackageStatus']),
    errorDetails: json['ErrorDetails'] == null
        ? null
        : ErrorDetails.fromJson(json['ErrorDetails'] as Map<String, dynamic>),
    lastUpdated: const UnixDateTimeConverter().fromJson(json['LastUpdated']),
    packageID: json['PackageID'] as String,
    packageName: json['PackageName'] as String,
    packageType:
        _$enumDecodeNullable(_$PackageTypeEnumMap, json['PackageType']),
    packageVersion: json['PackageVersion'] as String,
    referencePath: json['ReferencePath'] as String,
  );
}

const _$DomainPackageStatusEnumMap = {
  DomainPackageStatus.associating: 'ASSOCIATING',
  DomainPackageStatus.associationFailed: 'ASSOCIATION_FAILED',
  DomainPackageStatus.active: 'ACTIVE',
  DomainPackageStatus.dissociating: 'DISSOCIATING',
  DomainPackageStatus.dissociationFailed: 'DISSOCIATION_FAILED',
};

const _$PackageTypeEnumMap = {
  PackageType.txtDictionary: 'TXT-DICTIONARY',
};

EBSOptions _$EBSOptionsFromJson(Map<String, dynamic> json) {
  return EBSOptions(
    eBSEnabled: json['EBSEnabled'] as bool,
    iops: json['Iops'] as int,
    volumeSize: json['VolumeSize'] as int,
    volumeType: _$enumDecodeNullable(_$VolumeTypeEnumMap, json['VolumeType']),
  );
}

Map<String, dynamic> _$EBSOptionsToJson(EBSOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EBSEnabled', instance.eBSEnabled);
  writeNotNull('Iops', instance.iops);
  writeNotNull('VolumeSize', instance.volumeSize);
  writeNotNull('VolumeType', _$VolumeTypeEnumMap[instance.volumeType]);
  return val;
}

const _$VolumeTypeEnumMap = {
  VolumeType.standard: 'standard',
  VolumeType.gp2: 'gp2',
  VolumeType.io1: 'io1',
};

EBSOptionsStatus _$EBSOptionsStatusFromJson(Map<String, dynamic> json) {
  return EBSOptionsStatus(
    options: json['Options'] == null
        ? null
        : EBSOptions.fromJson(json['Options'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

ElasticsearchClusterConfig _$ElasticsearchClusterConfigFromJson(
    Map<String, dynamic> json) {
  return ElasticsearchClusterConfig(
    dedicatedMasterCount: json['DedicatedMasterCount'] as int,
    dedicatedMasterEnabled: json['DedicatedMasterEnabled'] as bool,
    dedicatedMasterType: _$enumDecodeNullable(
        _$ESPartitionInstanceTypeEnumMap, json['DedicatedMasterType']),
    instanceCount: json['InstanceCount'] as int,
    instanceType: _$enumDecodeNullable(
        _$ESPartitionInstanceTypeEnumMap, json['InstanceType']),
    warmCount: json['WarmCount'] as int,
    warmEnabled: json['WarmEnabled'] as bool,
    warmType: _$enumDecodeNullable(
        _$ESWarmPartitionInstanceTypeEnumMap, json['WarmType']),
    zoneAwarenessConfig: json['ZoneAwarenessConfig'] == null
        ? null
        : ZoneAwarenessConfig.fromJson(
            json['ZoneAwarenessConfig'] as Map<String, dynamic>),
    zoneAwarenessEnabled: json['ZoneAwarenessEnabled'] as bool,
  );
}

Map<String, dynamic> _$ElasticsearchClusterConfigToJson(
    ElasticsearchClusterConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DedicatedMasterCount', instance.dedicatedMasterCount);
  writeNotNull('DedicatedMasterEnabled', instance.dedicatedMasterEnabled);
  writeNotNull('DedicatedMasterType',
      _$ESPartitionInstanceTypeEnumMap[instance.dedicatedMasterType]);
  writeNotNull('InstanceCount', instance.instanceCount);
  writeNotNull(
      'InstanceType', _$ESPartitionInstanceTypeEnumMap[instance.instanceType]);
  writeNotNull('WarmCount', instance.warmCount);
  writeNotNull('WarmEnabled', instance.warmEnabled);
  writeNotNull(
      'WarmType', _$ESWarmPartitionInstanceTypeEnumMap[instance.warmType]);
  writeNotNull('ZoneAwarenessConfig', instance.zoneAwarenessConfig?.toJson());
  writeNotNull('ZoneAwarenessEnabled', instance.zoneAwarenessEnabled);
  return val;
}

const _$ESPartitionInstanceTypeEnumMap = {
  ESPartitionInstanceType.m3MediumElasticsearch: 'm3.medium.elasticsearch',
  ESPartitionInstanceType.m3LargeElasticsearch: 'm3.large.elasticsearch',
  ESPartitionInstanceType.m3XlargeElasticsearch: 'm3.xlarge.elasticsearch',
  ESPartitionInstanceType.m3_2xlargeElasticsearch: 'm3.2xlarge.elasticsearch',
  ESPartitionInstanceType.m4LargeElasticsearch: 'm4.large.elasticsearch',
  ESPartitionInstanceType.m4XlargeElasticsearch: 'm4.xlarge.elasticsearch',
  ESPartitionInstanceType.m4_2xlargeElasticsearch: 'm4.2xlarge.elasticsearch',
  ESPartitionInstanceType.m4_4xlargeElasticsearch: 'm4.4xlarge.elasticsearch',
  ESPartitionInstanceType.m4_10xlargeElasticsearch: 'm4.10xlarge.elasticsearch',
  ESPartitionInstanceType.m5LargeElasticsearch: 'm5.large.elasticsearch',
  ESPartitionInstanceType.m5XlargeElasticsearch: 'm5.xlarge.elasticsearch',
  ESPartitionInstanceType.m5_2xlargeElasticsearch: 'm5.2xlarge.elasticsearch',
  ESPartitionInstanceType.m5_4xlargeElasticsearch: 'm5.4xlarge.elasticsearch',
  ESPartitionInstanceType.m5_12xlargeElasticsearch: 'm5.12xlarge.elasticsearch',
  ESPartitionInstanceType.r5LargeElasticsearch: 'r5.large.elasticsearch',
  ESPartitionInstanceType.r5XlargeElasticsearch: 'r5.xlarge.elasticsearch',
  ESPartitionInstanceType.r5_2xlargeElasticsearch: 'r5.2xlarge.elasticsearch',
  ESPartitionInstanceType.r5_4xlargeElasticsearch: 'r5.4xlarge.elasticsearch',
  ESPartitionInstanceType.r5_12xlargeElasticsearch: 'r5.12xlarge.elasticsearch',
  ESPartitionInstanceType.c5LargeElasticsearch: 'c5.large.elasticsearch',
  ESPartitionInstanceType.c5XlargeElasticsearch: 'c5.xlarge.elasticsearch',
  ESPartitionInstanceType.c5_2xlargeElasticsearch: 'c5.2xlarge.elasticsearch',
  ESPartitionInstanceType.c5_4xlargeElasticsearch: 'c5.4xlarge.elasticsearch',
  ESPartitionInstanceType.c5_9xlargeElasticsearch: 'c5.9xlarge.elasticsearch',
  ESPartitionInstanceType.c5_18xlargeElasticsearch: 'c5.18xlarge.elasticsearch',
  ESPartitionInstanceType.ultrawarm1MediumElasticsearch:
      'ultrawarm1.medium.elasticsearch',
  ESPartitionInstanceType.ultrawarm1LargeElasticsearch:
      'ultrawarm1.large.elasticsearch',
  ESPartitionInstanceType.t2MicroElasticsearch: 't2.micro.elasticsearch',
  ESPartitionInstanceType.t2SmallElasticsearch: 't2.small.elasticsearch',
  ESPartitionInstanceType.t2MediumElasticsearch: 't2.medium.elasticsearch',
  ESPartitionInstanceType.r3LargeElasticsearch: 'r3.large.elasticsearch',
  ESPartitionInstanceType.r3XlargeElasticsearch: 'r3.xlarge.elasticsearch',
  ESPartitionInstanceType.r3_2xlargeElasticsearch: 'r3.2xlarge.elasticsearch',
  ESPartitionInstanceType.r3_4xlargeElasticsearch: 'r3.4xlarge.elasticsearch',
  ESPartitionInstanceType.r3_8xlargeElasticsearch: 'r3.8xlarge.elasticsearch',
  ESPartitionInstanceType.i2XlargeElasticsearch: 'i2.xlarge.elasticsearch',
  ESPartitionInstanceType.i2_2xlargeElasticsearch: 'i2.2xlarge.elasticsearch',
  ESPartitionInstanceType.d2XlargeElasticsearch: 'd2.xlarge.elasticsearch',
  ESPartitionInstanceType.d2_2xlargeElasticsearch: 'd2.2xlarge.elasticsearch',
  ESPartitionInstanceType.d2_4xlargeElasticsearch: 'd2.4xlarge.elasticsearch',
  ESPartitionInstanceType.d2_8xlargeElasticsearch: 'd2.8xlarge.elasticsearch',
  ESPartitionInstanceType.c4LargeElasticsearch: 'c4.large.elasticsearch',
  ESPartitionInstanceType.c4XlargeElasticsearch: 'c4.xlarge.elasticsearch',
  ESPartitionInstanceType.c4_2xlargeElasticsearch: 'c4.2xlarge.elasticsearch',
  ESPartitionInstanceType.c4_4xlargeElasticsearch: 'c4.4xlarge.elasticsearch',
  ESPartitionInstanceType.c4_8xlargeElasticsearch: 'c4.8xlarge.elasticsearch',
  ESPartitionInstanceType.r4LargeElasticsearch: 'r4.large.elasticsearch',
  ESPartitionInstanceType.r4XlargeElasticsearch: 'r4.xlarge.elasticsearch',
  ESPartitionInstanceType.r4_2xlargeElasticsearch: 'r4.2xlarge.elasticsearch',
  ESPartitionInstanceType.r4_4xlargeElasticsearch: 'r4.4xlarge.elasticsearch',
  ESPartitionInstanceType.r4_8xlargeElasticsearch: 'r4.8xlarge.elasticsearch',
  ESPartitionInstanceType.r4_16xlargeElasticsearch: 'r4.16xlarge.elasticsearch',
  ESPartitionInstanceType.i3LargeElasticsearch: 'i3.large.elasticsearch',
  ESPartitionInstanceType.i3XlargeElasticsearch: 'i3.xlarge.elasticsearch',
  ESPartitionInstanceType.i3_2xlargeElasticsearch: 'i3.2xlarge.elasticsearch',
  ESPartitionInstanceType.i3_4xlargeElasticsearch: 'i3.4xlarge.elasticsearch',
  ESPartitionInstanceType.i3_8xlargeElasticsearch: 'i3.8xlarge.elasticsearch',
  ESPartitionInstanceType.i3_16xlargeElasticsearch: 'i3.16xlarge.elasticsearch',
};

const _$ESWarmPartitionInstanceTypeEnumMap = {
  ESWarmPartitionInstanceType.ultrawarm1MediumElasticsearch:
      'ultrawarm1.medium.elasticsearch',
  ESWarmPartitionInstanceType.ultrawarm1LargeElasticsearch:
      'ultrawarm1.large.elasticsearch',
};

ElasticsearchClusterConfigStatus _$ElasticsearchClusterConfigStatusFromJson(
    Map<String, dynamic> json) {
  return ElasticsearchClusterConfigStatus(
    options: json['Options'] == null
        ? null
        : ElasticsearchClusterConfig.fromJson(
            json['Options'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

ElasticsearchDomainConfig _$ElasticsearchDomainConfigFromJson(
    Map<String, dynamic> json) {
  return ElasticsearchDomainConfig(
    accessPolicies: json['AccessPolicies'] == null
        ? null
        : AccessPoliciesStatus.fromJson(
            json['AccessPolicies'] as Map<String, dynamic>),
    advancedOptions: json['AdvancedOptions'] == null
        ? null
        : AdvancedOptionsStatus.fromJson(
            json['AdvancedOptions'] as Map<String, dynamic>),
    advancedSecurityOptions: json['AdvancedSecurityOptions'] == null
        ? null
        : AdvancedSecurityOptionsStatus.fromJson(
            json['AdvancedSecurityOptions'] as Map<String, dynamic>),
    cognitoOptions: json['CognitoOptions'] == null
        ? null
        : CognitoOptionsStatus.fromJson(
            json['CognitoOptions'] as Map<String, dynamic>),
    domainEndpointOptions: json['DomainEndpointOptions'] == null
        ? null
        : DomainEndpointOptionsStatus.fromJson(
            json['DomainEndpointOptions'] as Map<String, dynamic>),
    eBSOptions: json['EBSOptions'] == null
        ? null
        : EBSOptionsStatus.fromJson(json['EBSOptions'] as Map<String, dynamic>),
    elasticsearchClusterConfig: json['ElasticsearchClusterConfig'] == null
        ? null
        : ElasticsearchClusterConfigStatus.fromJson(
            json['ElasticsearchClusterConfig'] as Map<String, dynamic>),
    elasticsearchVersion: json['ElasticsearchVersion'] == null
        ? null
        : ElasticsearchVersionStatus.fromJson(
            json['ElasticsearchVersion'] as Map<String, dynamic>),
    encryptionAtRestOptions: json['EncryptionAtRestOptions'] == null
        ? null
        : EncryptionAtRestOptionsStatus.fromJson(
            json['EncryptionAtRestOptions'] as Map<String, dynamic>),
    logPublishingOptions: json['LogPublishingOptions'] == null
        ? null
        : LogPublishingOptionsStatus.fromJson(
            json['LogPublishingOptions'] as Map<String, dynamic>),
    nodeToNodeEncryptionOptions: json['NodeToNodeEncryptionOptions'] == null
        ? null
        : NodeToNodeEncryptionOptionsStatus.fromJson(
            json['NodeToNodeEncryptionOptions'] as Map<String, dynamic>),
    snapshotOptions: json['SnapshotOptions'] == null
        ? null
        : SnapshotOptionsStatus.fromJson(
            json['SnapshotOptions'] as Map<String, dynamic>),
    vPCOptions: json['VPCOptions'] == null
        ? null
        : VPCDerivedInfoStatus.fromJson(
            json['VPCOptions'] as Map<String, dynamic>),
  );
}

ElasticsearchDomainStatus _$ElasticsearchDomainStatusFromJson(
    Map<String, dynamic> json) {
  return ElasticsearchDomainStatus(
    arn: json['ARN'] as String,
    domainId: json['DomainId'] as String,
    domainName: json['DomainName'] as String,
    elasticsearchClusterConfig: json['ElasticsearchClusterConfig'] == null
        ? null
        : ElasticsearchClusterConfig.fromJson(
            json['ElasticsearchClusterConfig'] as Map<String, dynamic>),
    accessPolicies: json['AccessPolicies'] as String,
    advancedOptions: (json['AdvancedOptions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    advancedSecurityOptions: json['AdvancedSecurityOptions'] == null
        ? null
        : AdvancedSecurityOptions.fromJson(
            json['AdvancedSecurityOptions'] as Map<String, dynamic>),
    cognitoOptions: json['CognitoOptions'] == null
        ? null
        : CognitoOptions.fromJson(
            json['CognitoOptions'] as Map<String, dynamic>),
    created: json['Created'] as bool,
    deleted: json['Deleted'] as bool,
    domainEndpointOptions: json['DomainEndpointOptions'] == null
        ? null
        : DomainEndpointOptions.fromJson(
            json['DomainEndpointOptions'] as Map<String, dynamic>),
    eBSOptions: json['EBSOptions'] == null
        ? null
        : EBSOptions.fromJson(json['EBSOptions'] as Map<String, dynamic>),
    elasticsearchVersion: json['ElasticsearchVersion'] as String,
    encryptionAtRestOptions: json['EncryptionAtRestOptions'] == null
        ? null
        : EncryptionAtRestOptions.fromJson(
            json['EncryptionAtRestOptions'] as Map<String, dynamic>),
    endpoint: json['Endpoint'] as String,
    endpoints: (json['Endpoints'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    logPublishingOptions:
        (json['LogPublishingOptions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$LogTypeEnumMap, k),
          e == null
              ? null
              : LogPublishingOption.fromJson(e as Map<String, dynamic>)),
    ),
    nodeToNodeEncryptionOptions: json['NodeToNodeEncryptionOptions'] == null
        ? null
        : NodeToNodeEncryptionOptions.fromJson(
            json['NodeToNodeEncryptionOptions'] as Map<String, dynamic>),
    processing: json['Processing'] as bool,
    serviceSoftwareOptions: json['ServiceSoftwareOptions'] == null
        ? null
        : ServiceSoftwareOptions.fromJson(
            json['ServiceSoftwareOptions'] as Map<String, dynamic>),
    snapshotOptions: json['SnapshotOptions'] == null
        ? null
        : SnapshotOptions.fromJson(
            json['SnapshotOptions'] as Map<String, dynamic>),
    upgradeProcessing: json['UpgradeProcessing'] as bool,
    vPCOptions: json['VPCOptions'] == null
        ? null
        : VPCDerivedInfo.fromJson(json['VPCOptions'] as Map<String, dynamic>),
  );
}

const _$LogTypeEnumMap = {
  LogType.indexSlowLogs: 'INDEX_SLOW_LOGS',
  LogType.searchSlowLogs: 'SEARCH_SLOW_LOGS',
  LogType.esApplicationLogs: 'ES_APPLICATION_LOGS',
  LogType.auditLogs: 'AUDIT_LOGS',
};

ElasticsearchVersionStatus _$ElasticsearchVersionStatusFromJson(
    Map<String, dynamic> json) {
  return ElasticsearchVersionStatus(
    options: json['Options'] as String,
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

EncryptionAtRestOptions _$EncryptionAtRestOptionsFromJson(
    Map<String, dynamic> json) {
  return EncryptionAtRestOptions(
    enabled: json['Enabled'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$EncryptionAtRestOptionsToJson(
    EncryptionAtRestOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

EncryptionAtRestOptionsStatus _$EncryptionAtRestOptionsStatusFromJson(
    Map<String, dynamic> json) {
  return EncryptionAtRestOptionsStatus(
    options: json['Options'] == null
        ? null
        : EncryptionAtRestOptions.fromJson(
            json['Options'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) {
  return ErrorDetails(
    errorMessage: json['ErrorMessage'] as String,
    errorType: json['ErrorType'] as String,
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Values', instance.values);
  return val;
}

GetCompatibleElasticsearchVersionsResponse
    _$GetCompatibleElasticsearchVersionsResponseFromJson(
        Map<String, dynamic> json) {
  return GetCompatibleElasticsearchVersionsResponse(
    compatibleElasticsearchVersions:
        (json['CompatibleElasticsearchVersions'] as List)
            ?.map((e) => e == null
                ? null
                : CompatibleVersionsMap.fromJson(e as Map<String, dynamic>))
            ?.toList(),
  );
}

GetPackageVersionHistoryResponse _$GetPackageVersionHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return GetPackageVersionHistoryResponse(
    nextToken: json['NextToken'] as String,
    packageID: json['PackageID'] as String,
    packageVersionHistoryList: (json['PackageVersionHistoryList'] as List)
        ?.map((e) => e == null
            ? null
            : PackageVersionHistory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetUpgradeHistoryResponse _$GetUpgradeHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return GetUpgradeHistoryResponse(
    nextToken: json['NextToken'] as String,
    upgradeHistories: (json['UpgradeHistories'] as List)
        ?.map((e) => e == null
            ? null
            : UpgradeHistory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetUpgradeStatusResponse _$GetUpgradeStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetUpgradeStatusResponse(
    stepStatus:
        _$enumDecodeNullable(_$UpgradeStatusEnumMap, json['StepStatus']),
    upgradeName: json['UpgradeName'] as String,
    upgradeStep:
        _$enumDecodeNullable(_$UpgradeStepEnumMap, json['UpgradeStep']),
  );
}

const _$UpgradeStatusEnumMap = {
  UpgradeStatus.inProgress: 'IN_PROGRESS',
  UpgradeStatus.succeeded: 'SUCCEEDED',
  UpgradeStatus.succeededWithIssues: 'SUCCEEDED_WITH_ISSUES',
  UpgradeStatus.failed: 'FAILED',
};

const _$UpgradeStepEnumMap = {
  UpgradeStep.preUpgradeCheck: 'PRE_UPGRADE_CHECK',
  UpgradeStep.snapshot: 'SNAPSHOT',
  UpgradeStep.upgrade: 'UPGRADE',
};

InboundCrossClusterSearchConnection
    _$InboundCrossClusterSearchConnectionFromJson(Map<String, dynamic> json) {
  return InboundCrossClusterSearchConnection(
    connectionStatus: json['ConnectionStatus'] == null
        ? null
        : InboundCrossClusterSearchConnectionStatus.fromJson(
            json['ConnectionStatus'] as Map<String, dynamic>),
    crossClusterSearchConnectionId:
        json['CrossClusterSearchConnectionId'] as String,
    destinationDomainInfo: json['DestinationDomainInfo'] == null
        ? null
        : DomainInformation.fromJson(
            json['DestinationDomainInfo'] as Map<String, dynamic>),
    sourceDomainInfo: json['SourceDomainInfo'] == null
        ? null
        : DomainInformation.fromJson(
            json['SourceDomainInfo'] as Map<String, dynamic>),
  );
}

InboundCrossClusterSearchConnectionStatus
    _$InboundCrossClusterSearchConnectionStatusFromJson(
        Map<String, dynamic> json) {
  return InboundCrossClusterSearchConnectionStatus(
    message: json['Message'] as String,
    statusCode: _$enumDecodeNullable(
        _$InboundCrossClusterSearchConnectionStatusCodeEnumMap,
        json['StatusCode']),
  );
}

const _$InboundCrossClusterSearchConnectionStatusCodeEnumMap = {
  InboundCrossClusterSearchConnectionStatusCode.pendingAcceptance:
      'PENDING_ACCEPTANCE',
  InboundCrossClusterSearchConnectionStatusCode.approved: 'APPROVED',
  InboundCrossClusterSearchConnectionStatusCode.rejecting: 'REJECTING',
  InboundCrossClusterSearchConnectionStatusCode.rejected: 'REJECTED',
  InboundCrossClusterSearchConnectionStatusCode.deleting: 'DELETING',
  InboundCrossClusterSearchConnectionStatusCode.deleted: 'DELETED',
};

InstanceCountLimits _$InstanceCountLimitsFromJson(Map<String, dynamic> json) {
  return InstanceCountLimits(
    maximumInstanceCount: json['MaximumInstanceCount'] as int,
    minimumInstanceCount: json['MinimumInstanceCount'] as int,
  );
}

InstanceLimits _$InstanceLimitsFromJson(Map<String, dynamic> json) {
  return InstanceLimits(
    instanceCountLimits: json['InstanceCountLimits'] == null
        ? null
        : InstanceCountLimits.fromJson(
            json['InstanceCountLimits'] as Map<String, dynamic>),
  );
}

Limits _$LimitsFromJson(Map<String, dynamic> json) {
  return Limits(
    additionalLimits: (json['AdditionalLimits'] as List)
        ?.map((e) => e == null
            ? null
            : AdditionalLimit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    instanceLimits: json['InstanceLimits'] == null
        ? null
        : InstanceLimits.fromJson(
            json['InstanceLimits'] as Map<String, dynamic>),
    storageTypes: (json['StorageTypes'] as List)
        ?.map((e) =>
            e == null ? null : StorageType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListDomainNamesResponse _$ListDomainNamesResponseFromJson(
    Map<String, dynamic> json) {
  return ListDomainNamesResponse(
    domainNames: (json['DomainNames'] as List)
        ?.map((e) =>
            e == null ? null : DomainInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListDomainsForPackageResponse _$ListDomainsForPackageResponseFromJson(
    Map<String, dynamic> json) {
  return ListDomainsForPackageResponse(
    domainPackageDetailsList: (json['DomainPackageDetailsList'] as List)
        ?.map((e) => e == null
            ? null
            : DomainPackageDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListElasticsearchInstanceTypesResponse
    _$ListElasticsearchInstanceTypesResponseFromJson(
        Map<String, dynamic> json) {
  return ListElasticsearchInstanceTypesResponse(
    elasticsearchInstanceTypes: (json['ElasticsearchInstanceTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ESPartitionInstanceTypeEnumMap, e))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListElasticsearchVersionsResponse _$ListElasticsearchVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListElasticsearchVersionsResponse(
    elasticsearchVersions: (json['ElasticsearchVersions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPackagesForDomainResponse _$ListPackagesForDomainResponseFromJson(
    Map<String, dynamic> json) {
  return ListPackagesForDomainResponse(
    domainPackageDetailsList: (json['DomainPackageDetailsList'] as List)
        ?.map((e) => e == null
            ? null
            : DomainPackageDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsResponse _$ListTagsResponseFromJson(Map<String, dynamic> json) {
  return ListTagsResponse(
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LogPublishingOption _$LogPublishingOptionFromJson(Map<String, dynamic> json) {
  return LogPublishingOption(
    cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String,
    enabled: json['Enabled'] as bool,
  );
}

Map<String, dynamic> _$LogPublishingOptionToJson(LogPublishingOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudWatchLogsLogGroupArn', instance.cloudWatchLogsLogGroupArn);
  writeNotNull('Enabled', instance.enabled);
  return val;
}

LogPublishingOptionsStatus _$LogPublishingOptionsStatusFromJson(
    Map<String, dynamic> json) {
  return LogPublishingOptionsStatus(
    options: (json['Options'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$LogTypeEnumMap, k),
          e == null
              ? null
              : LogPublishingOption.fromJson(e as Map<String, dynamic>)),
    ),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MasterUserOptionsToJson(MasterUserOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MasterUserARN', instance.masterUserARN);
  writeNotNull('MasterUserName', instance.masterUserName);
  writeNotNull('MasterUserPassword', instance.masterUserPassword);
  return val;
}

NodeToNodeEncryptionOptions _$NodeToNodeEncryptionOptionsFromJson(
    Map<String, dynamic> json) {
  return NodeToNodeEncryptionOptions(
    enabled: json['Enabled'] as bool,
  );
}

Map<String, dynamic> _$NodeToNodeEncryptionOptionsToJson(
    NodeToNodeEncryptionOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

NodeToNodeEncryptionOptionsStatus _$NodeToNodeEncryptionOptionsStatusFromJson(
    Map<String, dynamic> json) {
  return NodeToNodeEncryptionOptionsStatus(
    options: json['Options'] == null
        ? null
        : NodeToNodeEncryptionOptions.fromJson(
            json['Options'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

OptionStatus _$OptionStatusFromJson(Map<String, dynamic> json) {
  return OptionStatus(
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    state: _$enumDecodeNullable(_$OptionStateEnumMap, json['State']),
    updateDate: const UnixDateTimeConverter().fromJson(json['UpdateDate']),
    pendingDeletion: json['PendingDeletion'] as bool,
    updateVersion: json['UpdateVersion'] as int,
  );
}

const _$OptionStateEnumMap = {
  OptionState.requiresIndexDocuments: 'RequiresIndexDocuments',
  OptionState.processing: 'Processing',
  OptionState.active: 'Active',
};

OutboundCrossClusterSearchConnection
    _$OutboundCrossClusterSearchConnectionFromJson(Map<String, dynamic> json) {
  return OutboundCrossClusterSearchConnection(
    connectionAlias: json['ConnectionAlias'] as String,
    connectionStatus: json['ConnectionStatus'] == null
        ? null
        : OutboundCrossClusterSearchConnectionStatus.fromJson(
            json['ConnectionStatus'] as Map<String, dynamic>),
    crossClusterSearchConnectionId:
        json['CrossClusterSearchConnectionId'] as String,
    destinationDomainInfo: json['DestinationDomainInfo'] == null
        ? null
        : DomainInformation.fromJson(
            json['DestinationDomainInfo'] as Map<String, dynamic>),
    sourceDomainInfo: json['SourceDomainInfo'] == null
        ? null
        : DomainInformation.fromJson(
            json['SourceDomainInfo'] as Map<String, dynamic>),
  );
}

OutboundCrossClusterSearchConnectionStatus
    _$OutboundCrossClusterSearchConnectionStatusFromJson(
        Map<String, dynamic> json) {
  return OutboundCrossClusterSearchConnectionStatus(
    message: json['Message'] as String,
    statusCode: _$enumDecodeNullable(
        _$OutboundCrossClusterSearchConnectionStatusCodeEnumMap,
        json['StatusCode']),
  );
}

const _$OutboundCrossClusterSearchConnectionStatusCodeEnumMap = {
  OutboundCrossClusterSearchConnectionStatusCode.pendingAcceptance:
      'PENDING_ACCEPTANCE',
  OutboundCrossClusterSearchConnectionStatusCode.validating: 'VALIDATING',
  OutboundCrossClusterSearchConnectionStatusCode.validationFailed:
      'VALIDATION_FAILED',
  OutboundCrossClusterSearchConnectionStatusCode.provisioning: 'PROVISIONING',
  OutboundCrossClusterSearchConnectionStatusCode.active: 'ACTIVE',
  OutboundCrossClusterSearchConnectionStatusCode.rejected: 'REJECTED',
  OutboundCrossClusterSearchConnectionStatusCode.deleting: 'DELETING',
  OutboundCrossClusterSearchConnectionStatusCode.deleted: 'DELETED',
};

PackageDetails _$PackageDetailsFromJson(Map<String, dynamic> json) {
  return PackageDetails(
    availablePackageVersion: json['AvailablePackageVersion'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    errorDetails: json['ErrorDetails'] == null
        ? null
        : ErrorDetails.fromJson(json['ErrorDetails'] as Map<String, dynamic>),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    packageDescription: json['PackageDescription'] as String,
    packageID: json['PackageID'] as String,
    packageName: json['PackageName'] as String,
    packageStatus:
        _$enumDecodeNullable(_$PackageStatusEnumMap, json['PackageStatus']),
    packageType:
        _$enumDecodeNullable(_$PackageTypeEnumMap, json['PackageType']),
  );
}

const _$PackageStatusEnumMap = {
  PackageStatus.copying: 'COPYING',
  PackageStatus.copyFailed: 'COPY_FAILED',
  PackageStatus.validating: 'VALIDATING',
  PackageStatus.validationFailed: 'VALIDATION_FAILED',
  PackageStatus.available: 'AVAILABLE',
  PackageStatus.deleting: 'DELETING',
  PackageStatus.deleted: 'DELETED',
  PackageStatus.deleteFailed: 'DELETE_FAILED',
};

Map<String, dynamic> _$PackageSourceToJson(PackageSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3BucketName', instance.s3BucketName);
  writeNotNull('S3Key', instance.s3Key);
  return val;
}

PackageVersionHistory _$PackageVersionHistoryFromJson(
    Map<String, dynamic> json) {
  return PackageVersionHistory(
    commitMessage: json['CommitMessage'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    packageVersion: json['PackageVersion'] as String,
  );
}

PurchaseReservedElasticsearchInstanceOfferingResponse
    _$PurchaseReservedElasticsearchInstanceOfferingResponseFromJson(
        Map<String, dynamic> json) {
  return PurchaseReservedElasticsearchInstanceOfferingResponse(
    reservationName: json['ReservationName'] as String,
    reservedElasticsearchInstanceId:
        json['ReservedElasticsearchInstanceId'] as String,
  );
}

RecurringCharge _$RecurringChargeFromJson(Map<String, dynamic> json) {
  return RecurringCharge(
    recurringChargeAmount: (json['RecurringChargeAmount'] as num)?.toDouble(),
    recurringChargeFrequency: json['RecurringChargeFrequency'] as String,
  );
}

RejectInboundCrossClusterSearchConnectionResponse
    _$RejectInboundCrossClusterSearchConnectionResponseFromJson(
        Map<String, dynamic> json) {
  return RejectInboundCrossClusterSearchConnectionResponse(
    crossClusterSearchConnection: json['CrossClusterSearchConnection'] == null
        ? null
        : InboundCrossClusterSearchConnection.fromJson(
            json['CrossClusterSearchConnection'] as Map<String, dynamic>),
  );
}

ReservedElasticsearchInstance _$ReservedElasticsearchInstanceFromJson(
    Map<String, dynamic> json) {
  return ReservedElasticsearchInstance(
    currencyCode: json['CurrencyCode'] as String,
    duration: json['Duration'] as int,
    elasticsearchInstanceCount: json['ElasticsearchInstanceCount'] as int,
    elasticsearchInstanceType: _$enumDecodeNullable(
        _$ESPartitionInstanceTypeEnumMap, json['ElasticsearchInstanceType']),
    fixedPrice: (json['FixedPrice'] as num)?.toDouble(),
    paymentOption: _$enumDecodeNullable(
        _$ReservedElasticsearchInstancePaymentOptionEnumMap,
        json['PaymentOption']),
    recurringCharges: (json['RecurringCharges'] as List)
        ?.map((e) => e == null
            ? null
            : RecurringCharge.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reservationName: json['ReservationName'] as String,
    reservedElasticsearchInstanceId:
        json['ReservedElasticsearchInstanceId'] as String,
    reservedElasticsearchInstanceOfferingId:
        json['ReservedElasticsearchInstanceOfferingId'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    state: json['State'] as String,
    usagePrice: (json['UsagePrice'] as num)?.toDouble(),
  );
}

const _$ReservedElasticsearchInstancePaymentOptionEnumMap = {
  ReservedElasticsearchInstancePaymentOption.allUpfront: 'ALL_UPFRONT',
  ReservedElasticsearchInstancePaymentOption.partialUpfront: 'PARTIAL_UPFRONT',
  ReservedElasticsearchInstancePaymentOption.noUpfront: 'NO_UPFRONT',
};

ReservedElasticsearchInstanceOffering
    _$ReservedElasticsearchInstanceOfferingFromJson(Map<String, dynamic> json) {
  return ReservedElasticsearchInstanceOffering(
    currencyCode: json['CurrencyCode'] as String,
    duration: json['Duration'] as int,
    elasticsearchInstanceType: _$enumDecodeNullable(
        _$ESPartitionInstanceTypeEnumMap, json['ElasticsearchInstanceType']),
    fixedPrice: (json['FixedPrice'] as num)?.toDouble(),
    paymentOption: _$enumDecodeNullable(
        _$ReservedElasticsearchInstancePaymentOptionEnumMap,
        json['PaymentOption']),
    recurringCharges: (json['RecurringCharges'] as List)
        ?.map((e) => e == null
            ? null
            : RecurringCharge.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reservedElasticsearchInstanceOfferingId:
        json['ReservedElasticsearchInstanceOfferingId'] as String,
    usagePrice: (json['UsagePrice'] as num)?.toDouble(),
  );
}

SAMLIdp _$SAMLIdpFromJson(Map<String, dynamic> json) {
  return SAMLIdp(
    entityId: json['EntityId'] as String,
    metadataContent: json['MetadataContent'] as String,
  );
}

Map<String, dynamic> _$SAMLIdpToJson(SAMLIdp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EntityId', instance.entityId);
  writeNotNull('MetadataContent', instance.metadataContent);
  return val;
}

Map<String, dynamic> _$SAMLOptionsInputToJson(SAMLOptionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('Idp', instance.idp?.toJson());
  writeNotNull('MasterBackendRole', instance.masterBackendRole);
  writeNotNull('MasterUserName', instance.masterUserName);
  writeNotNull('RolesKey', instance.rolesKey);
  writeNotNull('SessionTimeoutMinutes', instance.sessionTimeoutMinutes);
  writeNotNull('SubjectKey', instance.subjectKey);
  return val;
}

SAMLOptionsOutput _$SAMLOptionsOutputFromJson(Map<String, dynamic> json) {
  return SAMLOptionsOutput(
    enabled: json['Enabled'] as bool,
    idp: json['Idp'] == null
        ? null
        : SAMLIdp.fromJson(json['Idp'] as Map<String, dynamic>),
    rolesKey: json['RolesKey'] as String,
    sessionTimeoutMinutes: json['SessionTimeoutMinutes'] as int,
    subjectKey: json['SubjectKey'] as String,
  );
}

ServiceSoftwareOptions _$ServiceSoftwareOptionsFromJson(
    Map<String, dynamic> json) {
  return ServiceSoftwareOptions(
    automatedUpdateDate:
        const UnixDateTimeConverter().fromJson(json['AutomatedUpdateDate']),
    cancellable: json['Cancellable'] as bool,
    currentVersion: json['CurrentVersion'] as String,
    description: json['Description'] as String,
    newVersion: json['NewVersion'] as String,
    optionalDeployment: json['OptionalDeployment'] as bool,
    updateAvailable: json['UpdateAvailable'] as bool,
    updateStatus:
        _$enumDecodeNullable(_$DeploymentStatusEnumMap, json['UpdateStatus']),
  );
}

const _$DeploymentStatusEnumMap = {
  DeploymentStatus.pendingUpdate: 'PENDING_UPDATE',
  DeploymentStatus.inProgress: 'IN_PROGRESS',
  DeploymentStatus.completed: 'COMPLETED',
  DeploymentStatus.notEligible: 'NOT_ELIGIBLE',
  DeploymentStatus.eligible: 'ELIGIBLE',
};

SnapshotOptions _$SnapshotOptionsFromJson(Map<String, dynamic> json) {
  return SnapshotOptions(
    automatedSnapshotStartHour: json['AutomatedSnapshotStartHour'] as int,
  );
}

Map<String, dynamic> _$SnapshotOptionsToJson(SnapshotOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AutomatedSnapshotStartHour', instance.automatedSnapshotStartHour);
  return val;
}

SnapshotOptionsStatus _$SnapshotOptionsStatusFromJson(
    Map<String, dynamic> json) {
  return SnapshotOptionsStatus(
    options: json['Options'] == null
        ? null
        : SnapshotOptions.fromJson(json['Options'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

StartElasticsearchServiceSoftwareUpdateResponse
    _$StartElasticsearchServiceSoftwareUpdateResponseFromJson(
        Map<String, dynamic> json) {
  return StartElasticsearchServiceSoftwareUpdateResponse(
    serviceSoftwareOptions: json['ServiceSoftwareOptions'] == null
        ? null
        : ServiceSoftwareOptions.fromJson(
            json['ServiceSoftwareOptions'] as Map<String, dynamic>),
  );
}

StorageType _$StorageTypeFromJson(Map<String, dynamic> json) {
  return StorageType(
    storageSubTypeName: json['StorageSubTypeName'] as String,
    storageTypeLimits: (json['StorageTypeLimits'] as List)
        ?.map((e) => e == null
            ? null
            : StorageTypeLimit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    storageTypeName: json['StorageTypeName'] as String,
  );
}

StorageTypeLimit _$StorageTypeLimitFromJson(Map<String, dynamic> json) {
  return StorageTypeLimit(
    limitName: json['LimitName'] as String,
    limitValues:
        (json['LimitValues'] as List)?.map((e) => e as String)?.toList(),
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

UpdateElasticsearchDomainConfigResponse
    _$UpdateElasticsearchDomainConfigResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateElasticsearchDomainConfigResponse(
    domainConfig: json['DomainConfig'] == null
        ? null
        : ElasticsearchDomainConfig.fromJson(
            json['DomainConfig'] as Map<String, dynamic>),
  );
}

UpdatePackageResponse _$UpdatePackageResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePackageResponse(
    packageDetails: json['PackageDetails'] == null
        ? null
        : PackageDetails.fromJson(
            json['PackageDetails'] as Map<String, dynamic>),
  );
}

UpgradeElasticsearchDomainResponse _$UpgradeElasticsearchDomainResponseFromJson(
    Map<String, dynamic> json) {
  return UpgradeElasticsearchDomainResponse(
    domainName: json['DomainName'] as String,
    performCheckOnly: json['PerformCheckOnly'] as bool,
    targetVersion: json['TargetVersion'] as String,
  );
}

UpgradeHistory _$UpgradeHistoryFromJson(Map<String, dynamic> json) {
  return UpgradeHistory(
    startTimestamp:
        const UnixDateTimeConverter().fromJson(json['StartTimestamp']),
    stepsList: (json['StepsList'] as List)
        ?.map((e) => e == null
            ? null
            : UpgradeStepItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    upgradeName: json['UpgradeName'] as String,
    upgradeStatus:
        _$enumDecodeNullable(_$UpgradeStatusEnumMap, json['UpgradeStatus']),
  );
}

UpgradeStepItem _$UpgradeStepItemFromJson(Map<String, dynamic> json) {
  return UpgradeStepItem(
    issues: (json['Issues'] as List)?.map((e) => e as String)?.toList(),
    progressPercent: (json['ProgressPercent'] as num)?.toDouble(),
    upgradeStep:
        _$enumDecodeNullable(_$UpgradeStepEnumMap, json['UpgradeStep']),
    upgradeStepStatus:
        _$enumDecodeNullable(_$UpgradeStatusEnumMap, json['UpgradeStepStatus']),
  );
}

VPCDerivedInfo _$VPCDerivedInfoFromJson(Map<String, dynamic> json) {
  return VPCDerivedInfo(
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vPCId: json['VPCId'] as String,
  );
}

VPCDerivedInfoStatus _$VPCDerivedInfoStatusFromJson(Map<String, dynamic> json) {
  return VPCDerivedInfoStatus(
    options: json['Options'] == null
        ? null
        : VPCDerivedInfo.fromJson(json['Options'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : OptionStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VPCOptionsToJson(VPCOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  return val;
}

ZoneAwarenessConfig _$ZoneAwarenessConfigFromJson(Map<String, dynamic> json) {
  return ZoneAwarenessConfig(
    availabilityZoneCount: json['AvailabilityZoneCount'] as int,
  );
}

Map<String, dynamic> _$ZoneAwarenessConfigToJson(ZoneAwarenessConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityZoneCount', instance.availabilityZoneCount);
  return val;
}
