// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shield-2016-06-02.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociateDRTLogBucketResponse _$AssociateDRTLogBucketResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateDRTLogBucketResponse();
}

AssociateDRTRoleResponse _$AssociateDRTRoleResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateDRTRoleResponse();
}

AssociateHealthCheckResponse _$AssociateHealthCheckResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateHealthCheckResponse();
}

AttackDetail _$AttackDetailFromJson(Map<String, dynamic> json) {
  return AttackDetail(
    attackCounters: (json['AttackCounters'] as List)
        ?.map((e) => e == null
            ? null
            : SummarizedCounter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    attackId: json['AttackId'] as String,
    attackProperties: (json['AttackProperties'] as List)
        ?.map((e) => e == null
            ? null
            : AttackProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    endTime: timeStampFromJson(json['EndTime']),
    mitigations: (json['Mitigations'] as List)
        ?.map((e) =>
            e == null ? null : Mitigation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceArn: json['ResourceArn'] as String,
    startTime: timeStampFromJson(json['StartTime']),
    subResources: (json['SubResources'] as List)
        ?.map((e) => e == null
            ? null
            : SubResourceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AttackProperty _$AttackPropertyFromJson(Map<String, dynamic> json) {
  return AttackProperty(
    attackLayer:
        _$enumDecodeNullable(_$AttackLayerEnumMap, json['AttackLayer']),
    attackPropertyIdentifier: _$enumDecodeNullable(
        _$AttackPropertyIdentifierEnumMap, json['AttackPropertyIdentifier']),
    topContributors: (json['TopContributors'] as List)
        ?.map((e) =>
            e == null ? null : Contributor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    total: json['Total'] as int,
    unit: _$enumDecodeNullable(_$UnitEnumMap, json['Unit']),
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

const _$AttackLayerEnumMap = {
  AttackLayer.network: 'NETWORK',
  AttackLayer.application: 'APPLICATION',
};

const _$AttackPropertyIdentifierEnumMap = {
  AttackPropertyIdentifier.destinationUrl: 'DESTINATION_URL',
  AttackPropertyIdentifier.referrer: 'REFERRER',
  AttackPropertyIdentifier.sourceAsn: 'SOURCE_ASN',
  AttackPropertyIdentifier.sourceCountry: 'SOURCE_COUNTRY',
  AttackPropertyIdentifier.sourceIpAddress: 'SOURCE_IP_ADDRESS',
  AttackPropertyIdentifier.sourceUserAgent: 'SOURCE_USER_AGENT',
  AttackPropertyIdentifier.wordpressPingbackReflector:
      'WORDPRESS_PINGBACK_REFLECTOR',
  AttackPropertyIdentifier.wordpressPingbackSource: 'WORDPRESS_PINGBACK_SOURCE',
};

const _$UnitEnumMap = {
  Unit.bits: 'BITS',
  Unit.bytes: 'BYTES',
  Unit.packets: 'PACKETS',
  Unit.requests: 'REQUESTS',
};

AttackSummary _$AttackSummaryFromJson(Map<String, dynamic> json) {
  return AttackSummary(
    attackId: json['AttackId'] as String,
    attackVectors: (json['AttackVectors'] as List)
        ?.map((e) => e == null
            ? null
            : AttackVectorDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    endTime: timeStampFromJson(json['EndTime']),
    resourceArn: json['ResourceArn'] as String,
    startTime: timeStampFromJson(json['StartTime']),
  );
}

AttackVectorDescription _$AttackVectorDescriptionFromJson(
    Map<String, dynamic> json) {
  return AttackVectorDescription(
    vectorType: json['VectorType'] as String,
  );
}

Contributor _$ContributorFromJson(Map<String, dynamic> json) {
  return Contributor(
    name: json['Name'] as String,
    value: json['Value'] as int,
  );
}

CreateProtectionResponse _$CreateProtectionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProtectionResponse(
    protectionId: json['ProtectionId'] as String,
  );
}

CreateSubscriptionResponse _$CreateSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSubscriptionResponse();
}

DeleteProtectionResponse _$DeleteProtectionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProtectionResponse();
}

DeleteSubscriptionResponse _$DeleteSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSubscriptionResponse();
}

DescribeAttackResponse _$DescribeAttackResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAttackResponse(
    attack: json['Attack'] == null
        ? null
        : AttackDetail.fromJson(json['Attack'] as Map<String, dynamic>),
  );
}

DescribeDRTAccessResponse _$DescribeDRTAccessResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDRTAccessResponse(
    logBucketList:
        (json['LogBucketList'] as List)?.map((e) => e as String)?.toList(),
    roleArn: json['RoleArn'] as String,
  );
}

DescribeEmergencyContactSettingsResponse
    _$DescribeEmergencyContactSettingsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeEmergencyContactSettingsResponse(
    emergencyContactList: (json['EmergencyContactList'] as List)
        ?.map((e) => e == null
            ? null
            : EmergencyContact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeProtectionResponse _$DescribeProtectionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProtectionResponse(
    protection: json['Protection'] == null
        ? null
        : Protection.fromJson(json['Protection'] as Map<String, dynamic>),
  );
}

DescribeSubscriptionResponse _$DescribeSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSubscriptionResponse(
    subscription: json['Subscription'] == null
        ? null
        : Subscription.fromJson(json['Subscription'] as Map<String, dynamic>),
  );
}

DisassociateDRTLogBucketResponse _$DisassociateDRTLogBucketResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateDRTLogBucketResponse();
}

DisassociateDRTRoleResponse _$DisassociateDRTRoleResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateDRTRoleResponse();
}

DisassociateHealthCheckResponse _$DisassociateHealthCheckResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateHealthCheckResponse();
}

EmergencyContact _$EmergencyContactFromJson(Map<String, dynamic> json) {
  return EmergencyContact(
    emailAddress: json['EmailAddress'] as String,
  );
}

Map<String, dynamic> _$EmergencyContactToJson(EmergencyContact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EmailAddress', instance.emailAddress);
  return val;
}

GetSubscriptionStateResponse _$GetSubscriptionStateResponseFromJson(
    Map<String, dynamic> json) {
  return GetSubscriptionStateResponse(
    subscriptionState: _$enumDecodeNullable(
        _$SubscriptionStateEnumMap, json['SubscriptionState']),
  );
}

const _$SubscriptionStateEnumMap = {
  SubscriptionState.active: 'ACTIVE',
  SubscriptionState.inactive: 'INACTIVE',
};

Limit _$LimitFromJson(Map<String, dynamic> json) {
  return Limit(
    max: json['Max'] as int,
    type: json['Type'] as String,
  );
}

ListAttacksResponse _$ListAttacksResponseFromJson(Map<String, dynamic> json) {
  return ListAttacksResponse(
    attackSummaries: (json['AttackSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : AttackSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListProtectionsResponse _$ListProtectionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProtectionsResponse(
    nextToken: json['NextToken'] as String,
    protections: (json['Protections'] as List)
        ?.map((e) =>
            e == null ? null : Protection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Mitigation _$MitigationFromJson(Map<String, dynamic> json) {
  return Mitigation(
    mitigationName: json['MitigationName'] as String,
  );
}

Protection _$ProtectionFromJson(Map<String, dynamic> json) {
  return Protection(
    healthCheckIds:
        (json['HealthCheckIds'] as List)?.map((e) => e as String)?.toList(),
    id: json['Id'] as String,
    name: json['Name'] as String,
    resourceArn: json['ResourceArn'] as String,
  );
}

SubResourceSummary _$SubResourceSummaryFromJson(Map<String, dynamic> json) {
  return SubResourceSummary(
    attackVectors: (json['AttackVectors'] as List)
        ?.map((e) => e == null
            ? null
            : SummarizedAttackVector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    counters: (json['Counters'] as List)
        ?.map((e) => e == null
            ? null
            : SummarizedCounter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['Id'] as String,
    type: _$enumDecodeNullable(_$SubResourceTypeEnumMap, json['Type']),
  );
}

const _$SubResourceTypeEnumMap = {
  SubResourceType.ip: 'IP',
  SubResourceType.url: 'URL',
};

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
    autoRenew: _$enumDecodeNullable(_$AutoRenewEnumMap, json['AutoRenew']),
    endTime: timeStampFromJson(json['EndTime']),
    limits: (json['Limits'] as List)
        ?.map(
            (e) => e == null ? null : Limit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    startTime: timeStampFromJson(json['StartTime']),
    timeCommitmentInSeconds: json['TimeCommitmentInSeconds'] as int,
  );
}

const _$AutoRenewEnumMap = {
  AutoRenew.enabled: 'ENABLED',
  AutoRenew.disabled: 'DISABLED',
};

SummarizedAttackVector _$SummarizedAttackVectorFromJson(
    Map<String, dynamic> json) {
  return SummarizedAttackVector(
    vectorType: json['VectorType'] as String,
    vectorCounters: (json['VectorCounters'] as List)
        ?.map((e) => e == null
            ? null
            : SummarizedCounter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SummarizedCounter _$SummarizedCounterFromJson(Map<String, dynamic> json) {
  return SummarizedCounter(
    average: (json['Average'] as num)?.toDouble(),
    max: (json['Max'] as num)?.toDouble(),
    n: json['N'] as int,
    name: json['Name'] as String,
    sum: (json['Sum'] as num)?.toDouble(),
    unit: json['Unit'] as String,
  );
}

Map<String, dynamic> _$TimeRangeToJson(TimeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FromInclusive', unixTimestampToJson(instance.fromInclusive));
  writeNotNull('ToExclusive', unixTimestampToJson(instance.toExclusive));
  return val;
}

UpdateEmergencyContactSettingsResponse
    _$UpdateEmergencyContactSettingsResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateEmergencyContactSettingsResponse();
}

UpdateSubscriptionResponse _$UpdateSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSubscriptionResponse();
}
