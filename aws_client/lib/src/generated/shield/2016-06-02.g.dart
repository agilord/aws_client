// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-06-02.dart';

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

AssociateProactiveEngagementDetailsResponse
    _$AssociateProactiveEngagementDetailsResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateProactiveEngagementDetailsResponse();
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
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    mitigations: (json['Mitigations'] as List)
        ?.map((e) =>
            e == null ? null : Mitigation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceArn: json['ResourceArn'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
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

AttackStatisticsDataItem _$AttackStatisticsDataItemFromJson(
    Map<String, dynamic> json) {
  return AttackStatisticsDataItem(
    attackCount: json['AttackCount'] as int,
    attackVolume: json['AttackVolume'] == null
        ? null
        : AttackVolume.fromJson(json['AttackVolume'] as Map<String, dynamic>),
  );
}

AttackSummary _$AttackSummaryFromJson(Map<String, dynamic> json) {
  return AttackSummary(
    attackId: json['AttackId'] as String,
    attackVectors: (json['AttackVectors'] as List)
        ?.map((e) => e == null
            ? null
            : AttackVectorDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    resourceArn: json['ResourceArn'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
  );
}

AttackVectorDescription _$AttackVectorDescriptionFromJson(
    Map<String, dynamic> json) {
  return AttackVectorDescription(
    vectorType: json['VectorType'] as String,
  );
}

AttackVolume _$AttackVolumeFromJson(Map<String, dynamic> json) {
  return AttackVolume(
    bitsPerSecond: json['BitsPerSecond'] == null
        ? null
        : AttackVolumeStatistics.fromJson(
            json['BitsPerSecond'] as Map<String, dynamic>),
    packetsPerSecond: json['PacketsPerSecond'] == null
        ? null
        : AttackVolumeStatistics.fromJson(
            json['PacketsPerSecond'] as Map<String, dynamic>),
    requestsPerSecond: json['RequestsPerSecond'] == null
        ? null
        : AttackVolumeStatistics.fromJson(
            json['RequestsPerSecond'] as Map<String, dynamic>),
  );
}

AttackVolumeStatistics _$AttackVolumeStatisticsFromJson(
    Map<String, dynamic> json) {
  return AttackVolumeStatistics(
    max: (json['Max'] as num)?.toDouble(),
  );
}

Contributor _$ContributorFromJson(Map<String, dynamic> json) {
  return Contributor(
    name: json['Name'] as String,
    value: json['Value'] as int,
  );
}

CreateProtectionGroupResponse _$CreateProtectionGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProtectionGroupResponse();
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

DeleteProtectionGroupResponse _$DeleteProtectionGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProtectionGroupResponse();
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

DescribeAttackStatisticsResponse _$DescribeAttackStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAttackStatisticsResponse(
    dataItems: (json['DataItems'] as List)
        ?.map((e) => e == null
            ? null
            : AttackStatisticsDataItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timeRange: json['TimeRange'] == null
        ? null
        : TimeRange.fromJson(json['TimeRange'] as Map<String, dynamic>),
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

DescribeProtectionGroupResponse _$DescribeProtectionGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProtectionGroupResponse(
    protectionGroup: json['ProtectionGroup'] == null
        ? null
        : ProtectionGroup.fromJson(
            json['ProtectionGroup'] as Map<String, dynamic>),
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

DisableProactiveEngagementResponse _$DisableProactiveEngagementResponseFromJson(
    Map<String, dynamic> json) {
  return DisableProactiveEngagementResponse();
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
    contactNotes: json['ContactNotes'] as String,
    phoneNumber: json['PhoneNumber'] as String,
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
  writeNotNull('ContactNotes', instance.contactNotes);
  writeNotNull('PhoneNumber', instance.phoneNumber);
  return val;
}

EnableProactiveEngagementResponse _$EnableProactiveEngagementResponseFromJson(
    Map<String, dynamic> json) {
  return EnableProactiveEngagementResponse();
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

ListProtectionGroupsResponse _$ListProtectionGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProtectionGroupsResponse(
    protectionGroups: (json['ProtectionGroups'] as List)
        ?.map((e) => e == null
            ? null
            : ProtectionGroup.fromJson(e as Map<String, dynamic>))
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

ListResourcesInProtectionGroupResponse
    _$ListResourcesInProtectionGroupResponseFromJson(
        Map<String, dynamic> json) {
  return ListResourcesInProtectionGroupResponse(
    resourceArns:
        (json['ResourceArns'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
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

ProtectionGroup _$ProtectionGroupFromJson(Map<String, dynamic> json) {
  return ProtectionGroup(
    aggregation: _$enumDecodeNullable(
        _$ProtectionGroupAggregationEnumMap, json['Aggregation']),
    members: (json['Members'] as List)?.map((e) => e as String)?.toList(),
    pattern:
        _$enumDecodeNullable(_$ProtectionGroupPatternEnumMap, json['Pattern']),
    protectionGroupId: json['ProtectionGroupId'] as String,
    resourceType: _$enumDecodeNullable(
        _$ProtectedResourceTypeEnumMap, json['ResourceType']),
  );
}

const _$ProtectionGroupAggregationEnumMap = {
  ProtectionGroupAggregation.sum: 'SUM',
  ProtectionGroupAggregation.mean: 'MEAN',
  ProtectionGroupAggregation.max: 'MAX',
};

const _$ProtectionGroupPatternEnumMap = {
  ProtectionGroupPattern.all: 'ALL',
  ProtectionGroupPattern.arbitrary: 'ARBITRARY',
  ProtectionGroupPattern.byResourceType: 'BY_RESOURCE_TYPE',
};

const _$ProtectedResourceTypeEnumMap = {
  ProtectedResourceType.cloudfrontDistribution: 'CLOUDFRONT_DISTRIBUTION',
  ProtectedResourceType.route_53HostedZone: 'ROUTE_53_HOSTED_ZONE',
  ProtectedResourceType.elasticIpAllocation: 'ELASTIC_IP_ALLOCATION',
  ProtectedResourceType.classicLoadBalancer: 'CLASSIC_LOAD_BALANCER',
  ProtectedResourceType.applicationLoadBalancer: 'APPLICATION_LOAD_BALANCER',
  ProtectedResourceType.globalAccelerator: 'GLOBAL_ACCELERATOR',
};

ProtectionGroupArbitraryPatternLimits
    _$ProtectionGroupArbitraryPatternLimitsFromJson(Map<String, dynamic> json) {
  return ProtectionGroupArbitraryPatternLimits(
    maxMembers: json['MaxMembers'] as int,
  );
}

ProtectionGroupLimits _$ProtectionGroupLimitsFromJson(
    Map<String, dynamic> json) {
  return ProtectionGroupLimits(
    maxProtectionGroups: json['MaxProtectionGroups'] as int,
    patternTypeLimits: json['PatternTypeLimits'] == null
        ? null
        : ProtectionGroupPatternTypeLimits.fromJson(
            json['PatternTypeLimits'] as Map<String, dynamic>),
  );
}

ProtectionGroupPatternTypeLimits _$ProtectionGroupPatternTypeLimitsFromJson(
    Map<String, dynamic> json) {
  return ProtectionGroupPatternTypeLimits(
    arbitraryPatternLimits: json['ArbitraryPatternLimits'] == null
        ? null
        : ProtectionGroupArbitraryPatternLimits.fromJson(
            json['ArbitraryPatternLimits'] as Map<String, dynamic>),
  );
}

ProtectionLimits _$ProtectionLimitsFromJson(Map<String, dynamic> json) {
  return ProtectionLimits(
    protectedResourceTypeLimits: (json['ProtectedResourceTypeLimits'] as List)
        ?.map(
            (e) => e == null ? null : Limit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
    subscriptionLimits: json['SubscriptionLimits'] == null
        ? null
        : SubscriptionLimits.fromJson(
            json['SubscriptionLimits'] as Map<String, dynamic>),
    autoRenew: _$enumDecodeNullable(_$AutoRenewEnumMap, json['AutoRenew']),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    limits: (json['Limits'] as List)
        ?.map(
            (e) => e == null ? null : Limit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    proactiveEngagementStatus: _$enumDecodeNullable(
        _$ProactiveEngagementStatusEnumMap, json['ProactiveEngagementStatus']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    timeCommitmentInSeconds: json['TimeCommitmentInSeconds'] as int,
  );
}

const _$AutoRenewEnumMap = {
  AutoRenew.enabled: 'ENABLED',
  AutoRenew.disabled: 'DISABLED',
};

const _$ProactiveEngagementStatusEnumMap = {
  ProactiveEngagementStatus.enabled: 'ENABLED',
  ProactiveEngagementStatus.disabled: 'DISABLED',
  ProactiveEngagementStatus.pending: 'PENDING',
};

SubscriptionLimits _$SubscriptionLimitsFromJson(Map<String, dynamic> json) {
  return SubscriptionLimits(
    protectionGroupLimits: json['ProtectionGroupLimits'] == null
        ? null
        : ProtectionGroupLimits.fromJson(
            json['ProtectionGroupLimits'] as Map<String, dynamic>),
    protectionLimits: json['ProtectionLimits'] == null
        ? null
        : ProtectionLimits.fromJson(
            json['ProtectionLimits'] as Map<String, dynamic>),
  );
}

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

TimeRange _$TimeRangeFromJson(Map<String, dynamic> json) {
  return TimeRange(
    fromInclusive:
        const UnixDateTimeConverter().fromJson(json['FromInclusive']),
    toExclusive: const UnixDateTimeConverter().fromJson(json['ToExclusive']),
  );
}

Map<String, dynamic> _$TimeRangeToJson(TimeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FromInclusive',
      const UnixDateTimeConverter().toJson(instance.fromInclusive));
  writeNotNull('ToExclusive',
      const UnixDateTimeConverter().toJson(instance.toExclusive));
  return val;
}

UpdateEmergencyContactSettingsResponse
    _$UpdateEmergencyContactSettingsResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateEmergencyContactSettingsResponse();
}

UpdateProtectionGroupResponse _$UpdateProtectionGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProtectionGroupResponse();
}

UpdateSubscriptionResponse _$UpdateSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSubscriptionResponse();
}
