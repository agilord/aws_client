// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-08-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptGrantResponse _$AcceptGrantResponseFromJson(Map<String, dynamic> json) {
  return AcceptGrantResponse(
    grantArn: json['GrantArn'] as String,
    status: _$enumDecodeNullable(_$GrantStatusEnumMap, json['Status']),
    version: json['Version'] as String,
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

const _$GrantStatusEnumMap = {
  GrantStatus.pendingWorkflow: 'PENDING_WORKFLOW',
  GrantStatus.pendingAccept: 'PENDING_ACCEPT',
  GrantStatus.rejected: 'REJECTED',
  GrantStatus.active: 'ACTIVE',
  GrantStatus.failedWorkflow: 'FAILED_WORKFLOW',
  GrantStatus.deleted: 'DELETED',
  GrantStatus.pendingDelete: 'PENDING_DELETE',
  GrantStatus.disabled: 'DISABLED',
};

AutomatedDiscoveryInformation _$AutomatedDiscoveryInformationFromJson(
    Map<String, dynamic> json) {
  return AutomatedDiscoveryInformation(
    lastRunTime: const UnixDateTimeConverter().fromJson(json['LastRunTime']),
  );
}

BorrowConfiguration _$BorrowConfigurationFromJson(Map<String, dynamic> json) {
  return BorrowConfiguration(
    allowEarlyCheckIn: json['AllowEarlyCheckIn'] as bool,
    maxTimeToLiveInMinutes: json['MaxTimeToLiveInMinutes'] as int,
  );
}

Map<String, dynamic> _$BorrowConfigurationToJson(BorrowConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowEarlyCheckIn', instance.allowEarlyCheckIn);
  writeNotNull('MaxTimeToLiveInMinutes', instance.maxTimeToLiveInMinutes);
  return val;
}

CheckInLicenseResponse _$CheckInLicenseResponseFromJson(
    Map<String, dynamic> json) {
  return CheckInLicenseResponse();
}

CheckoutBorrowLicenseResponse _$CheckoutBorrowLicenseResponseFromJson(
    Map<String, dynamic> json) {
  return CheckoutBorrowLicenseResponse(
    checkoutMetadata: (json['CheckoutMetadata'] as List)
        ?.map((e) =>
            e == null ? null : Metadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    entitlementsAllowed: (json['EntitlementsAllowed'] as List)
        ?.map((e) => e == null
            ? null
            : EntitlementData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    expiration: json['Expiration'] as String,
    issuedAt: json['IssuedAt'] as String,
    licenseArn: json['LicenseArn'] as String,
    licenseConsumptionToken: json['LicenseConsumptionToken'] as String,
    nodeId: json['NodeId'] as String,
    signedToken: json['SignedToken'] as String,
  );
}

CheckoutLicenseResponse _$CheckoutLicenseResponseFromJson(
    Map<String, dynamic> json) {
  return CheckoutLicenseResponse(
    checkoutType:
        _$enumDecodeNullable(_$CheckoutTypeEnumMap, json['CheckoutType']),
    entitlementsAllowed: (json['EntitlementsAllowed'] as List)
        ?.map((e) => e == null
            ? null
            : EntitlementData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    expiration: json['Expiration'] as String,
    issuedAt: json['IssuedAt'] as String,
    licenseConsumptionToken: json['LicenseConsumptionToken'] as String,
    nodeId: json['NodeId'] as String,
    signedToken: json['SignedToken'] as String,
  );
}

const _$CheckoutTypeEnumMap = {
  CheckoutType.provisional: 'PROVISIONAL',
};

ConsumedLicenseSummary _$ConsumedLicenseSummaryFromJson(
    Map<String, dynamic> json) {
  return ConsumedLicenseSummary(
    consumedLicenses: json['ConsumedLicenses'] as int,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
  );
}

const _$ResourceTypeEnumMap = {
  ResourceType.ec2Instance: 'EC2_INSTANCE',
  ResourceType.ec2Host: 'EC2_HOST',
  ResourceType.ec2Ami: 'EC2_AMI',
  ResourceType.rds: 'RDS',
  ResourceType.systemsManagerManagedInstance:
      'SYSTEMS_MANAGER_MANAGED_INSTANCE',
};

ConsumptionConfiguration _$ConsumptionConfigurationFromJson(
    Map<String, dynamic> json) {
  return ConsumptionConfiguration(
    borrowConfiguration: json['BorrowConfiguration'] == null
        ? null
        : BorrowConfiguration.fromJson(
            json['BorrowConfiguration'] as Map<String, dynamic>),
    provisionalConfiguration: json['ProvisionalConfiguration'] == null
        ? null
        : ProvisionalConfiguration.fromJson(
            json['ProvisionalConfiguration'] as Map<String, dynamic>),
    renewType: _$enumDecodeNullable(_$RenewTypeEnumMap, json['RenewType']),
  );
}

Map<String, dynamic> _$ConsumptionConfigurationToJson(
    ConsumptionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BorrowConfiguration', instance.borrowConfiguration?.toJson());
  writeNotNull(
      'ProvisionalConfiguration', instance.provisionalConfiguration?.toJson());
  writeNotNull('RenewType', _$RenewTypeEnumMap[instance.renewType]);
  return val;
}

const _$RenewTypeEnumMap = {
  RenewType.none: 'None',
  RenewType.weekly: 'Weekly',
  RenewType.monthly: 'Monthly',
};

CreateGrantResponse _$CreateGrantResponseFromJson(Map<String, dynamic> json) {
  return CreateGrantResponse(
    grantArn: json['GrantArn'] as String,
    status: _$enumDecodeNullable(_$GrantStatusEnumMap, json['Status']),
    version: json['Version'] as String,
  );
}

CreateGrantVersionResponse _$CreateGrantVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateGrantVersionResponse(
    grantArn: json['GrantArn'] as String,
    status: _$enumDecodeNullable(_$GrantStatusEnumMap, json['Status']),
    version: json['Version'] as String,
  );
}

CreateLicenseConfigurationResponse _$CreateLicenseConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLicenseConfigurationResponse(
    licenseConfigurationArn: json['LicenseConfigurationArn'] as String,
  );
}

CreateLicenseResponse _$CreateLicenseResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLicenseResponse(
    licenseArn: json['LicenseArn'] as String,
    status: _$enumDecodeNullable(_$LicenseStatusEnumMap, json['Status']),
    version: json['Version'] as String,
  );
}

const _$LicenseStatusEnumMap = {
  LicenseStatus.available: 'AVAILABLE',
  LicenseStatus.pendingAvailable: 'PENDING_AVAILABLE',
  LicenseStatus.deactivated: 'DEACTIVATED',
  LicenseStatus.suspended: 'SUSPENDED',
  LicenseStatus.expired: 'EXPIRED',
  LicenseStatus.pendingDelete: 'PENDING_DELETE',
  LicenseStatus.deleted: 'DELETED',
};

CreateLicenseVersionResponse _$CreateLicenseVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLicenseVersionResponse(
    licenseArn: json['LicenseArn'] as String,
    status: _$enumDecodeNullable(_$LicenseStatusEnumMap, json['Status']),
    version: json['Version'] as String,
  );
}

CreateTokenResponse _$CreateTokenResponseFromJson(Map<String, dynamic> json) {
  return CreateTokenResponse(
    token: json['Token'] as String,
    tokenId: json['TokenId'] as String,
    tokenType: _$enumDecodeNullable(_$TokenTypeEnumMap, json['TokenType']),
  );
}

const _$TokenTypeEnumMap = {
  TokenType.refreshToken: 'REFRESH_TOKEN',
};

DatetimeRange _$DatetimeRangeFromJson(Map<String, dynamic> json) {
  return DatetimeRange(
    begin: json['Begin'] as String,
    end: json['End'] as String,
  );
}

Map<String, dynamic> _$DatetimeRangeToJson(DatetimeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Begin', instance.begin);
  writeNotNull('End', instance.end);
  return val;
}

DeleteGrantResponse _$DeleteGrantResponseFromJson(Map<String, dynamic> json) {
  return DeleteGrantResponse(
    grantArn: json['GrantArn'] as String,
    status: _$enumDecodeNullable(_$GrantStatusEnumMap, json['Status']),
    version: json['Version'] as String,
  );
}

DeleteLicenseConfigurationResponse _$DeleteLicenseConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLicenseConfigurationResponse();
}

DeleteLicenseResponse _$DeleteLicenseResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLicenseResponse(
    deletionDate: json['DeletionDate'] as String,
    status:
        _$enumDecodeNullable(_$LicenseDeletionStatusEnumMap, json['Status']),
  );
}

const _$LicenseDeletionStatusEnumMap = {
  LicenseDeletionStatus.pendingDelete: 'PENDING_DELETE',
  LicenseDeletionStatus.deleted: 'DELETED',
};

DeleteTokenResponse _$DeleteTokenResponseFromJson(Map<String, dynamic> json) {
  return DeleteTokenResponse();
}

Entitlement _$EntitlementFromJson(Map<String, dynamic> json) {
  return Entitlement(
    name: json['Name'] as String,
    unit: _$enumDecodeNullable(_$EntitlementUnitEnumMap, json['Unit']),
    allowCheckIn: json['AllowCheckIn'] as bool,
    maxCount: json['MaxCount'] as int,
    overage: json['Overage'] as bool,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$EntitlementToJson(Entitlement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Unit', _$EntitlementUnitEnumMap[instance.unit]);
  writeNotNull('AllowCheckIn', instance.allowCheckIn);
  writeNotNull('MaxCount', instance.maxCount);
  writeNotNull('Overage', instance.overage);
  writeNotNull('Value', instance.value);
  return val;
}

const _$EntitlementUnitEnumMap = {
  EntitlementUnit.count: 'Count',
  EntitlementUnit.none: 'None',
  EntitlementUnit.seconds: 'Seconds',
  EntitlementUnit.microseconds: 'Microseconds',
  EntitlementUnit.milliseconds: 'Milliseconds',
  EntitlementUnit.bytes: 'Bytes',
  EntitlementUnit.kilobytes: 'Kilobytes',
  EntitlementUnit.megabytes: 'Megabytes',
  EntitlementUnit.gigabytes: 'Gigabytes',
  EntitlementUnit.terabytes: 'Terabytes',
  EntitlementUnit.bits: 'Bits',
  EntitlementUnit.kilobits: 'Kilobits',
  EntitlementUnit.megabits: 'Megabits',
  EntitlementUnit.gigabits: 'Gigabits',
  EntitlementUnit.terabits: 'Terabits',
  EntitlementUnit.percent: 'Percent',
  EntitlementUnit.bytesSecond: 'Bytes/Second',
  EntitlementUnit.kilobytesSecond: 'Kilobytes/Second',
  EntitlementUnit.megabytesSecond: 'Megabytes/Second',
  EntitlementUnit.gigabytesSecond: 'Gigabytes/Second',
  EntitlementUnit.terabytesSecond: 'Terabytes/Second',
  EntitlementUnit.bitsSecond: 'Bits/Second',
  EntitlementUnit.kilobitsSecond: 'Kilobits/Second',
  EntitlementUnit.megabitsSecond: 'Megabits/Second',
  EntitlementUnit.gigabitsSecond: 'Gigabits/Second',
  EntitlementUnit.terabitsSecond: 'Terabits/Second',
  EntitlementUnit.countSecond: 'Count/Second',
};

EntitlementData _$EntitlementDataFromJson(Map<String, dynamic> json) {
  return EntitlementData(
    name: json['Name'] as String,
    unit: _$enumDecodeNullable(_$EntitlementDataUnitEnumMap, json['Unit']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$EntitlementDataToJson(EntitlementData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Unit', _$EntitlementDataUnitEnumMap[instance.unit]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$EntitlementDataUnitEnumMap = {
  EntitlementDataUnit.count: 'Count',
  EntitlementDataUnit.none: 'None',
  EntitlementDataUnit.seconds: 'Seconds',
  EntitlementDataUnit.microseconds: 'Microseconds',
  EntitlementDataUnit.milliseconds: 'Milliseconds',
  EntitlementDataUnit.bytes: 'Bytes',
  EntitlementDataUnit.kilobytes: 'Kilobytes',
  EntitlementDataUnit.megabytes: 'Megabytes',
  EntitlementDataUnit.gigabytes: 'Gigabytes',
  EntitlementDataUnit.terabytes: 'Terabytes',
  EntitlementDataUnit.bits: 'Bits',
  EntitlementDataUnit.kilobits: 'Kilobits',
  EntitlementDataUnit.megabits: 'Megabits',
  EntitlementDataUnit.gigabits: 'Gigabits',
  EntitlementDataUnit.terabits: 'Terabits',
  EntitlementDataUnit.percent: 'Percent',
  EntitlementDataUnit.bytesSecond: 'Bytes/Second',
  EntitlementDataUnit.kilobytesSecond: 'Kilobytes/Second',
  EntitlementDataUnit.megabytesSecond: 'Megabytes/Second',
  EntitlementDataUnit.gigabytesSecond: 'Gigabytes/Second',
  EntitlementDataUnit.terabytesSecond: 'Terabytes/Second',
  EntitlementDataUnit.bitsSecond: 'Bits/Second',
  EntitlementDataUnit.kilobitsSecond: 'Kilobits/Second',
  EntitlementDataUnit.megabitsSecond: 'Megabits/Second',
  EntitlementDataUnit.gigabitsSecond: 'Gigabits/Second',
  EntitlementDataUnit.terabitsSecond: 'Terabits/Second',
  EntitlementDataUnit.countSecond: 'Count/Second',
};

EntitlementUsage _$EntitlementUsageFromJson(Map<String, dynamic> json) {
  return EntitlementUsage(
    consumedValue: json['ConsumedValue'] as String,
    name: json['Name'] as String,
    unit: _$enumDecodeNullable(_$EntitlementDataUnitEnumMap, json['Unit']),
    maxCount: json['MaxCount'] as String,
  );
}

ExtendLicenseConsumptionResponse _$ExtendLicenseConsumptionResponseFromJson(
    Map<String, dynamic> json) {
  return ExtendLicenseConsumptionResponse(
    expiration: json['Expiration'] as String,
    licenseConsumptionToken: json['LicenseConsumptionToken'] as String,
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

GetAccessTokenResponse _$GetAccessTokenResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccessTokenResponse(
    accessToken: json['AccessToken'] as String,
  );
}

GetGrantResponse _$GetGrantResponseFromJson(Map<String, dynamic> json) {
  return GetGrantResponse(
    grant: json['Grant'] == null
        ? null
        : Grant.fromJson(json['Grant'] as Map<String, dynamic>),
  );
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
    disassociateWhenNotFound: json['DisassociateWhenNotFound'] as bool,
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

GetLicenseResponse _$GetLicenseResponseFromJson(Map<String, dynamic> json) {
  return GetLicenseResponse(
    license: json['License'] == null
        ? null
        : License.fromJson(json['License'] as Map<String, dynamic>),
  );
}

GetLicenseUsageResponse _$GetLicenseUsageResponseFromJson(
    Map<String, dynamic> json) {
  return GetLicenseUsageResponse(
    licenseUsage: json['LicenseUsage'] == null
        ? null
        : LicenseUsage.fromJson(json['LicenseUsage'] as Map<String, dynamic>),
  );
}

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

Grant _$GrantFromJson(Map<String, dynamic> json) {
  return Grant(
    grantArn: json['GrantArn'] as String,
    grantName: json['GrantName'] as String,
    grantStatus:
        _$enumDecodeNullable(_$GrantStatusEnumMap, json['GrantStatus']),
    grantedOperations: (json['GrantedOperations'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AllowedOperationEnumMap, e))
        ?.toList(),
    granteePrincipalArn: json['GranteePrincipalArn'] as String,
    homeRegion: json['HomeRegion'] as String,
    licenseArn: json['LicenseArn'] as String,
    parentArn: json['ParentArn'] as String,
    version: json['Version'] as String,
    statusReason: json['StatusReason'] as String,
  );
}

const _$AllowedOperationEnumMap = {
  AllowedOperation.createGrant: 'CreateGrant',
  AllowedOperation.checkoutLicense: 'CheckoutLicense',
  AllowedOperation.checkoutBorrowLicense: 'CheckoutBorrowLicense',
  AllowedOperation.checkInLicense: 'CheckInLicense',
  AllowedOperation.extendConsumptionLicense: 'ExtendConsumptionLicense',
  AllowedOperation.listPurchasedLicenses: 'ListPurchasedLicenses',
  AllowedOperation.createToken: 'CreateToken',
};

GrantedLicense _$GrantedLicenseFromJson(Map<String, dynamic> json) {
  return GrantedLicense(
    beneficiary: json['Beneficiary'] as String,
    consumptionConfiguration: json['ConsumptionConfiguration'] == null
        ? null
        : ConsumptionConfiguration.fromJson(
            json['ConsumptionConfiguration'] as Map<String, dynamic>),
    createTime: json['CreateTime'] as String,
    entitlements: (json['Entitlements'] as List)
        ?.map((e) =>
            e == null ? null : Entitlement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    homeRegion: json['HomeRegion'] as String,
    issuer: json['Issuer'] == null
        ? null
        : IssuerDetails.fromJson(json['Issuer'] as Map<String, dynamic>),
    licenseArn: json['LicenseArn'] as String,
    licenseMetadata: (json['LicenseMetadata'] as List)
        ?.map((e) =>
            e == null ? null : Metadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    licenseName: json['LicenseName'] as String,
    productName: json['ProductName'] as String,
    productSKU: json['ProductSKU'] as String,
    receivedMetadata: json['ReceivedMetadata'] == null
        ? null
        : ReceivedMetadata.fromJson(
            json['ReceivedMetadata'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$LicenseStatusEnumMap, json['Status']),
    validity: json['Validity'] == null
        ? null
        : DatetimeRange.fromJson(json['Validity'] as Map<String, dynamic>),
    version: json['Version'] as String,
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

Map<String, dynamic> _$IssuerToJson(Issuer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('SignKey', instance.signKey);
  return val;
}

IssuerDetails _$IssuerDetailsFromJson(Map<String, dynamic> json) {
  return IssuerDetails(
    keyFingerprint: json['KeyFingerprint'] as String,
    name: json['Name'] as String,
    signKey: json['SignKey'] as String,
  );
}

License _$LicenseFromJson(Map<String, dynamic> json) {
  return License(
    beneficiary: json['Beneficiary'] as String,
    consumptionConfiguration: json['ConsumptionConfiguration'] == null
        ? null
        : ConsumptionConfiguration.fromJson(
            json['ConsumptionConfiguration'] as Map<String, dynamic>),
    createTime: json['CreateTime'] as String,
    entitlements: (json['Entitlements'] as List)
        ?.map((e) =>
            e == null ? null : Entitlement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    homeRegion: json['HomeRegion'] as String,
    issuer: json['Issuer'] == null
        ? null
        : IssuerDetails.fromJson(json['Issuer'] as Map<String, dynamic>),
    licenseArn: json['LicenseArn'] as String,
    licenseMetadata: (json['LicenseMetadata'] as List)
        ?.map((e) =>
            e == null ? null : Metadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    licenseName: json['LicenseName'] as String,
    productName: json['ProductName'] as String,
    productSKU: json['ProductSKU'] as String,
    status: _$enumDecodeNullable(_$LicenseStatusEnumMap, json['Status']),
    validity: json['Validity'] == null
        ? null
        : DatetimeRange.fromJson(json['Validity'] as Map<String, dynamic>),
    version: json['Version'] as String,
  );
}

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
    disassociateWhenNotFound: json['DisassociateWhenNotFound'] as bool,
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
    amiAssociationScope: json['AmiAssociationScope'] as String,
    associationTime:
        const UnixDateTimeConverter().fromJson(json['AssociationTime']),
    resourceArn: json['ResourceArn'] as String,
    resourceOwnerId: json['ResourceOwnerId'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
  );
}

LicenseConfigurationUsage _$LicenseConfigurationUsageFromJson(
    Map<String, dynamic> json) {
  return LicenseConfigurationUsage(
    associationTime:
        const UnixDateTimeConverter().fromJson(json['AssociationTime']),
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
    failureTime: const UnixDateTimeConverter().fromJson(json['FailureTime']),
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
    amiAssociationScope: json['AmiAssociationScope'] as String,
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
  writeNotNull('AmiAssociationScope', instance.amiAssociationScope);
  return val;
}

LicenseUsage _$LicenseUsageFromJson(Map<String, dynamic> json) {
  return LicenseUsage(
    entitlementUsages: (json['EntitlementUsages'] as List)
        ?.map((e) => e == null
            ? null
            : EntitlementUsage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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

ListDistributedGrantsResponse _$ListDistributedGrantsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDistributedGrantsResponse(
    grants: (json['Grants'] as List)
        ?.map(
            (e) => e == null ? null : Grant.fromJson(e as Map<String, dynamic>))
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

ListLicenseVersionsResponse _$ListLicenseVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLicenseVersionsResponse(
    licenses: (json['Licenses'] as List)
        ?.map((e) =>
            e == null ? null : License.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLicensesResponse _$ListLicensesResponseFromJson(Map<String, dynamic> json) {
  return ListLicensesResponse(
    licenses: (json['Licenses'] as List)
        ?.map((e) =>
            e == null ? null : License.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListReceivedGrantsResponse _$ListReceivedGrantsResponseFromJson(
    Map<String, dynamic> json) {
  return ListReceivedGrantsResponse(
    grants: (json['Grants'] as List)
        ?.map(
            (e) => e == null ? null : Grant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListReceivedLicensesResponse _$ListReceivedLicensesResponseFromJson(
    Map<String, dynamic> json) {
  return ListReceivedLicensesResponse(
    licenses: (json['Licenses'] as List)
        ?.map((e) => e == null
            ? null
            : GrantedLicense.fromJson(e as Map<String, dynamic>))
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

ListTokensResponse _$ListTokensResponseFromJson(Map<String, dynamic> json) {
  return ListTokensResponse(
    nextToken: json['NextToken'] as String,
    tokens: (json['Tokens'] as List)
        ?.map((e) =>
            e == null ? null : TokenData.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$MetadataToJson(Metadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
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

ProvisionalConfiguration _$ProvisionalConfigurationFromJson(
    Map<String, dynamic> json) {
  return ProvisionalConfiguration(
    maxTimeToLiveInMinutes: json['MaxTimeToLiveInMinutes'] as int,
  );
}

Map<String, dynamic> _$ProvisionalConfigurationToJson(
    ProvisionalConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxTimeToLiveInMinutes', instance.maxTimeToLiveInMinutes);
  return val;
}

ReceivedMetadata _$ReceivedMetadataFromJson(Map<String, dynamic> json) {
  return ReceivedMetadata(
    allowedOperations: (json['AllowedOperations'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AllowedOperationEnumMap, e))
        ?.toList(),
    receivedStatus:
        _$enumDecodeNullable(_$ReceivedStatusEnumMap, json['ReceivedStatus']),
  );
}

const _$ReceivedStatusEnumMap = {
  ReceivedStatus.pendingWorkflow: 'PENDING_WORKFLOW',
  ReceivedStatus.pendingAccept: 'PENDING_ACCEPT',
  ReceivedStatus.rejected: 'REJECTED',
  ReceivedStatus.active: 'ACTIVE',
  ReceivedStatus.failedWorkflow: 'FAILED_WORKFLOW',
  ReceivedStatus.deleted: 'DELETED',
  ReceivedStatus.disabled: 'DISABLED',
};

RejectGrantResponse _$RejectGrantResponseFromJson(Map<String, dynamic> json) {
  return RejectGrantResponse(
    grantArn: json['GrantArn'] as String,
    status: _$enumDecodeNullable(_$GrantStatusEnumMap, json['Status']),
    version: json['Version'] as String,
  );
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

TokenData _$TokenDataFromJson(Map<String, dynamic> json) {
  return TokenData(
    expirationTime: json['ExpirationTime'] as String,
    licenseArn: json['LicenseArn'] as String,
    roleArns: (json['RoleArns'] as List)?.map((e) => e as String)?.toList(),
    status: json['Status'] as String,
    tokenId: json['TokenId'] as String,
    tokenProperties:
        (json['TokenProperties'] as List)?.map((e) => e as String)?.toList(),
    tokenType: json['TokenType'] as String,
  );
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
