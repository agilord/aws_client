// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license-manager-2018-08-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutomatedDiscoveryInformation _$AutomatedDiscoveryInformationFromJson(
    Map<String, dynamic> json) {
  return AutomatedDiscoveryInformation(
    lastRunTime: unixFromJson(json['LastRunTime']),
  );
}

ConsumedLicenseSummary _$ConsumedLicenseSummaryFromJson(
    Map<String, dynamic> json) {
  return ConsumedLicenseSummary(
    consumedLicenses: json['ConsumedLicenses'] as int,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
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

const _$ResourceTypeEnumMap = {
  ResourceType.ec2Instance: 'EC2_INSTANCE',
  ResourceType.ec2Host: 'EC2_HOST',
  ResourceType.ec2Ami: 'EC2_AMI',
  ResourceType.rds: 'RDS',
  ResourceType.systemsManagerManagedInstance:
      'SYSTEMS_MANAGER_MANAGED_INSTANCE',
};

CreateLicenseConfigurationResponse _$CreateLicenseConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLicenseConfigurationResponse(
    licenseConfigurationArn: json['LicenseConfigurationArn'] as String,
  );
}

DeleteLicenseConfigurationResponse _$DeleteLicenseConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLicenseConfigurationResponse();
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

GetLicenseConfigurationResponse _$GetLicenseConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return GetLicenseConfigurationResponse(
    automatedDiscoveryInformation: json['AutomatedDiscoveryInformation'] == null
        ? null
        : AutomatedDiscoveryInformation.fromJson(
            json['AutomatedDiscoveryInformation'] as Map<String, dynamic>),
    consumedLicenseSummaryList: (json['ConsumedLicenseSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ConsumedLicenseSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    consumedLicenses: json['ConsumedLicenses'] as int,
    description: json['Description'] as String,
    licenseConfigurationArn: json['LicenseConfigurationArn'] as String,
    licenseConfigurationId: json['LicenseConfigurationId'] as String,
    licenseCount: json['LicenseCount'] as int,
    licenseCountHardLimit: json['LicenseCountHardLimit'] as bool,
    licenseCountingType: _$enumDecodeNullable(
        _$LicenseCountingTypeEnumMap, json['LicenseCountingType']),
    licenseRules:
        (json['LicenseRules'] as List)?.map((e) => e as String)?.toList(),
    managedResourceSummaryList: (json['ManagedResourceSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ManagedResourceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    ownerAccountId: json['OwnerAccountId'] as String,
    productInformationList: (json['ProductInformationList'] as List)
        ?.map((e) => e == null
            ? null
            : ProductInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['Status'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$LicenseCountingTypeEnumMap = {
  LicenseCountingType.vcpu: 'vCPU',
  LicenseCountingType.instance: 'Instance',
  LicenseCountingType.core: 'Core',
  LicenseCountingType.socket: 'Socket',
};

GetServiceSettingsResponse _$GetServiceSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetServiceSettingsResponse(
    enableCrossAccountsDiscovery: json['EnableCrossAccountsDiscovery'] as bool,
    licenseManagerResourceShareArn:
        json['LicenseManagerResourceShareArn'] as String,
    organizationConfiguration: json['OrganizationConfiguration'] == null
        ? null
        : OrganizationConfiguration.fromJson(
            json['OrganizationConfiguration'] as Map<String, dynamic>),
    s3BucketArn: json['S3BucketArn'] as String,
    snsTopicArn: json['SnsTopicArn'] as String,
  );
}

Map<String, dynamic> _$InventoryFilterToJson(InventoryFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Condition', _$InventoryFilterConditionEnumMap[instance.condition]);
  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

const _$InventoryFilterConditionEnumMap = {
  InventoryFilterCondition.equals: 'EQUALS',
  InventoryFilterCondition.notEquals: 'NOT_EQUALS',
  InventoryFilterCondition.beginsWith: 'BEGINS_WITH',
  InventoryFilterCondition.contains: 'CONTAINS',
};

LicenseConfiguration _$LicenseConfigurationFromJson(Map<String, dynamic> json) {
  return LicenseConfiguration(
    automatedDiscoveryInformation: json['AutomatedDiscoveryInformation'] == null
        ? null
        : AutomatedDiscoveryInformation.fromJson(
            json['AutomatedDiscoveryInformation'] as Map<String, dynamic>),
    consumedLicenseSummaryList: (json['ConsumedLicenseSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ConsumedLicenseSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    consumedLicenses: json['ConsumedLicenses'] as int,
    description: json['Description'] as String,
    licenseConfigurationArn: json['LicenseConfigurationArn'] as String,
    licenseConfigurationId: json['LicenseConfigurationId'] as String,
    licenseCount: json['LicenseCount'] as int,
    licenseCountHardLimit: json['LicenseCountHardLimit'] as bool,
    licenseCountingType: _$enumDecodeNullable(
        _$LicenseCountingTypeEnumMap, json['LicenseCountingType']),
    licenseRules:
        (json['LicenseRules'] as List)?.map((e) => e as String)?.toList(),
    managedResourceSummaryList: (json['ManagedResourceSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ManagedResourceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    ownerAccountId: json['OwnerAccountId'] as String,
    productInformationList: (json['ProductInformationList'] as List)
        ?.map((e) => e == null
            ? null
            : ProductInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['Status'] as String,
  );
}

LicenseConfigurationAssociation _$LicenseConfigurationAssociationFromJson(
    Map<String, dynamic> json) {
  return LicenseConfigurationAssociation(
    associationTime: unixFromJson(json['AssociationTime']),
    resourceArn: json['ResourceArn'] as String,
    resourceOwnerId: json['ResourceOwnerId'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
  );
}

LicenseConfigurationUsage _$LicenseConfigurationUsageFromJson(
    Map<String, dynamic> json) {
  return LicenseConfigurationUsage(
    associationTime: unixFromJson(json['AssociationTime']),
    consumedLicenses: json['ConsumedLicenses'] as int,
    resourceArn: json['ResourceArn'] as String,
    resourceOwnerId: json['ResourceOwnerId'] as String,
    resourceStatus: json['ResourceStatus'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
  );
}

LicenseOperationFailure _$LicenseOperationFailureFromJson(
    Map<String, dynamic> json) {
  return LicenseOperationFailure(
    errorMessage: json['ErrorMessage'] as String,
    failureTime: unixFromJson(json['FailureTime']),
    metadataList: (json['MetadataList'] as List)
        ?.map((e) =>
            e == null ? null : Metadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    operationName: json['OperationName'] as String,
    operationRequestedBy: json['OperationRequestedBy'] as String,
    resourceArn: json['ResourceArn'] as String,
    resourceOwnerId: json['ResourceOwnerId'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
  );
}

LicenseSpecification _$LicenseSpecificationFromJson(Map<String, dynamic> json) {
  return LicenseSpecification(
    licenseConfigurationArn: json['LicenseConfigurationArn'] as String,
  );
}

Map<String, dynamic> _$LicenseSpecificationToJson(
    LicenseSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LicenseConfigurationArn', instance.licenseConfigurationArn);
  return val;
}

ListAssociationsForLicenseConfigurationResponse
    _$ListAssociationsForLicenseConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return ListAssociationsForLicenseConfigurationResponse(
    licenseConfigurationAssociations:
        (json['LicenseConfigurationAssociations'] as List)
            ?.map((e) => e == null
                ? null
                : LicenseConfigurationAssociation.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListFailuresForLicenseConfigurationOperationsResponse
    _$ListFailuresForLicenseConfigurationOperationsResponseFromJson(
        Map<String, dynamic> json) {
  return ListFailuresForLicenseConfigurationOperationsResponse(
    licenseOperationFailureList: (json['LicenseOperationFailureList'] as List)
        ?.map((e) => e == null
            ? null
            : LicenseOperationFailure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLicenseConfigurationsResponse _$ListLicenseConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLicenseConfigurationsResponse(
    licenseConfigurations: (json['LicenseConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : LicenseConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLicenseSpecificationsForResourceResponse
    _$ListLicenseSpecificationsForResourceResponseFromJson(
        Map<String, dynamic> json) {
  return ListLicenseSpecificationsForResourceResponse(
    licenseSpecifications: (json['LicenseSpecifications'] as List)
        ?.map((e) => e == null
            ? null
            : LicenseSpecification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListResourceInventoryResponse _$ListResourceInventoryResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourceInventoryResponse(
    nextToken: json['NextToken'] as String,
    resourceInventoryList: (json['ResourceInventoryList'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceInventory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

ListUsageForLicenseConfigurationResponse
    _$ListUsageForLicenseConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return ListUsageForLicenseConfigurationResponse(
    licenseConfigurationUsageList:
        (json['LicenseConfigurationUsageList'] as List)
            ?.map((e) => e == null
                ? null
                : LicenseConfigurationUsage.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ManagedResourceSummary _$ManagedResourceSummaryFromJson(
    Map<String, dynamic> json) {
  return ManagedResourceSummary(
    associationCount: json['AssociationCount'] as int,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
  );
}

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return Metadata(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

OrganizationConfiguration _$OrganizationConfigurationFromJson(
    Map<String, dynamic> json) {
  return OrganizationConfiguration(
    enableIntegration: json['EnableIntegration'] as bool,
  );
}

Map<String, dynamic> _$OrganizationConfigurationToJson(
    OrganizationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnableIntegration', instance.enableIntegration);
  return val;
}

ProductInformation _$ProductInformationFromJson(Map<String, dynamic> json) {
  return ProductInformation(
    productInformationFilterList: (json['ProductInformationFilterList'] as List)
        ?.map((e) => e == null
            ? null
            : ProductInformationFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceType: json['ResourceType'] as String,
  );
}

Map<String, dynamic> _$ProductInformationToJson(ProductInformation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductInformationFilterList',
      instance.productInformationFilterList?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceType', instance.resourceType);
  return val;
}

ProductInformationFilter _$ProductInformationFilterFromJson(
    Map<String, dynamic> json) {
  return ProductInformationFilter(
    productInformationFilterComparator:
        json['ProductInformationFilterComparator'] as String,
    productInformationFilterName:
        json['ProductInformationFilterName'] as String,
    productInformationFilterValue:
        (json['ProductInformationFilterValue'] as List)
            ?.map((e) => e as String)
            ?.toList(),
  );
}

Map<String, dynamic> _$ProductInformationFilterToJson(
    ProductInformationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductInformationFilterComparator',
      instance.productInformationFilterComparator);
  writeNotNull(
      'ProductInformationFilterName', instance.productInformationFilterName);
  writeNotNull(
      'ProductInformationFilterValue', instance.productInformationFilterValue);
  return val;
}

ResourceInventory _$ResourceInventoryFromJson(Map<String, dynamic> json) {
  return ResourceInventory(
    platform: json['Platform'] as String,
    platformVersion: json['PlatformVersion'] as String,
    resourceArn: json['ResourceArn'] as String,
    resourceId: json['ResourceId'] as String,
    resourceOwningAccountId: json['ResourceOwningAccountId'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
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

UpdateLicenseConfigurationResponse _$UpdateLicenseConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateLicenseConfigurationResponse();
}

UpdateLicenseSpecificationsForResourceResponse
    _$UpdateLicenseSpecificationsForResourceResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateLicenseSpecificationsForResourceResponse();
}

UpdateServiceSettingsResponse _$UpdateServiceSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateServiceSettingsResponse();
}
