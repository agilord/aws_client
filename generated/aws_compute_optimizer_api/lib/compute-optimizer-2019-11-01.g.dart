// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compute-optimizer-2019-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoScalingGroupConfiguration _$AutoScalingGroupConfigurationFromJson(
    Map<String, dynamic> json) {
  return AutoScalingGroupConfiguration(
    desiredCapacity: json['desiredCapacity'] as int,
    instanceType: json['instanceType'] as String,
    maxSize: json['maxSize'] as int,
    minSize: json['minSize'] as int,
  );
}

AutoScalingGroupRecommendation _$AutoScalingGroupRecommendationFromJson(
    Map<String, dynamic> json) {
  return AutoScalingGroupRecommendation(
    accountId: json['accountId'] as String,
    autoScalingGroupArn: json['autoScalingGroupArn'] as String,
    autoScalingGroupName: json['autoScalingGroupName'] as String,
    currentConfiguration: json['currentConfiguration'] == null
        ? null
        : AutoScalingGroupConfiguration.fromJson(
            json['currentConfiguration'] as Map<String, dynamic>),
    finding: _$enumDecodeNullable(_$FindingEnumMap, json['finding']),
    lastRefreshTimestamp:
        const UnixDateTimeConverter().fromJson(json['lastRefreshTimestamp']),
    lookBackPeriodInDays: (json['lookBackPeriodInDays'] as num)?.toDouble(),
    recommendationOptions: (json['recommendationOptions'] as List)
        ?.map((e) => e == null
            ? null
            : AutoScalingGroupRecommendationOption.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    utilizationMetrics: (json['utilizationMetrics'] as List)
        ?.map((e) => e == null
            ? null
            : UtilizationMetric.fromJson(e as Map<String, dynamic>))
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

const _$FindingEnumMap = {
  Finding.underprovisioned: 'Underprovisioned',
  Finding.overprovisioned: 'Overprovisioned',
  Finding.optimized: 'Optimized',
  Finding.notOptimized: 'NotOptimized',
};

AutoScalingGroupRecommendationOption
    _$AutoScalingGroupRecommendationOptionFromJson(Map<String, dynamic> json) {
  return AutoScalingGroupRecommendationOption(
    configuration: json['configuration'] == null
        ? null
        : AutoScalingGroupConfiguration.fromJson(
            json['configuration'] as Map<String, dynamic>),
    performanceRisk: (json['performanceRisk'] as num)?.toDouble(),
    projectedUtilizationMetrics: (json['projectedUtilizationMetrics'] as List)
        ?.map((e) => e == null
            ? null
            : UtilizationMetric.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rank: json['rank'] as int,
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$FilterNameEnumMap[instance.name]);
  writeNotNull('values', instance.values);
  return val;
}

const _$FilterNameEnumMap = {
  FilterName.finding: 'Finding',
  FilterName.recommendationSourceType: 'RecommendationSourceType',
};

GetAutoScalingGroupRecommendationsResponse
    _$GetAutoScalingGroupRecommendationsResponseFromJson(
        Map<String, dynamic> json) {
  return GetAutoScalingGroupRecommendationsResponse(
    autoScalingGroupRecommendations:
        (json['autoScalingGroupRecommendations'] as List)
            ?.map((e) => e == null
                ? null
                : AutoScalingGroupRecommendation.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : GetRecommendationError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetEC2InstanceRecommendationsResponse
    _$GetEC2InstanceRecommendationsResponseFromJson(Map<String, dynamic> json) {
  return GetEC2InstanceRecommendationsResponse(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : GetRecommendationError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    instanceRecommendations: (json['instanceRecommendations'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceRecommendation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetEC2RecommendationProjectedMetricsResponse
    _$GetEC2RecommendationProjectedMetricsResponseFromJson(
        Map<String, dynamic> json) {
  return GetEC2RecommendationProjectedMetricsResponse(
    recommendedOptionProjectedMetrics:
        (json['recommendedOptionProjectedMetrics'] as List)
            ?.map((e) => e == null
                ? null
                : RecommendedOptionProjectedMetric.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

GetEnrollmentStatusResponse _$GetEnrollmentStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetEnrollmentStatusResponse(
    memberAccountsEnrolled: json['memberAccountsEnrolled'] as bool,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    statusReason: json['statusReason'] as String,
  );
}

const _$StatusEnumMap = {
  Status.active: 'Active',
  Status.inactive: 'Inactive',
  Status.pending: 'Pending',
  Status.failed: 'Failed',
};

GetRecommendationError _$GetRecommendationErrorFromJson(
    Map<String, dynamic> json) {
  return GetRecommendationError(
    code: json['code'] as String,
    identifier: json['identifier'] as String,
    message: json['message'] as String,
  );
}

GetRecommendationSummariesResponse _$GetRecommendationSummariesResponseFromJson(
    Map<String, dynamic> json) {
  return GetRecommendationSummariesResponse(
    nextToken: json['nextToken'] as String,
    recommendationSummaries: (json['recommendationSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

InstanceRecommendation _$InstanceRecommendationFromJson(
    Map<String, dynamic> json) {
  return InstanceRecommendation(
    accountId: json['accountId'] as String,
    currentInstanceType: json['currentInstanceType'] as String,
    finding: _$enumDecodeNullable(_$FindingEnumMap, json['finding']),
    instanceArn: json['instanceArn'] as String,
    instanceName: json['instanceName'] as String,
    lastRefreshTimestamp:
        const UnixDateTimeConverter().fromJson(json['lastRefreshTimestamp']),
    lookBackPeriodInDays: (json['lookBackPeriodInDays'] as num)?.toDouble(),
    recommendationOptions: (json['recommendationOptions'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceRecommendationOption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recommendationSources: (json['recommendationSources'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendationSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    utilizationMetrics: (json['utilizationMetrics'] as List)
        ?.map((e) => e == null
            ? null
            : UtilizationMetric.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

InstanceRecommendationOption _$InstanceRecommendationOptionFromJson(
    Map<String, dynamic> json) {
  return InstanceRecommendationOption(
    instanceType: json['instanceType'] as String,
    performanceRisk: (json['performanceRisk'] as num)?.toDouble(),
    projectedUtilizationMetrics: (json['projectedUtilizationMetrics'] as List)
        ?.map((e) => e == null
            ? null
            : UtilizationMetric.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rank: json['rank'] as int,
  );
}

ProjectedMetric _$ProjectedMetricFromJson(Map<String, dynamic> json) {
  return ProjectedMetric(
    name: _$enumDecodeNullable(_$MetricNameEnumMap, json['name']),
    timestamps: (json['timestamps'] as List)
        ?.map(const UnixDateTimeConverter().fromJson)
        ?.toList(),
    values:
        (json['values'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
  );
}

const _$MetricNameEnumMap = {
  MetricName.cpu: 'Cpu',
  MetricName.memory: 'Memory',
};

RecommendationSource _$RecommendationSourceFromJson(Map<String, dynamic> json) {
  return RecommendationSource(
    recommendationSourceArn: json['recommendationSourceArn'] as String,
    recommendationSourceType: _$enumDecodeNullable(
        _$RecommendationSourceTypeEnumMap, json['recommendationSourceType']),
  );
}

const _$RecommendationSourceTypeEnumMap = {
  RecommendationSourceType.ec2Instance: 'Ec2Instance',
  RecommendationSourceType.autoScalingGroup: 'AutoScalingGroup',
};

RecommendationSummary _$RecommendationSummaryFromJson(
    Map<String, dynamic> json) {
  return RecommendationSummary(
    accountId: json['accountId'] as String,
    recommendationResourceType: _$enumDecodeNullable(
        _$RecommendationSourceTypeEnumMap, json['recommendationResourceType']),
    summaries: (json['summaries'] as List)
        ?.map((e) =>
            e == null ? null : Summary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RecommendedOptionProjectedMetric _$RecommendedOptionProjectedMetricFromJson(
    Map<String, dynamic> json) {
  return RecommendedOptionProjectedMetric(
    projectedMetrics: (json['projectedMetrics'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectedMetric.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rank: json['rank'] as int,
    recommendedInstanceType: json['recommendedInstanceType'] as String,
  );
}

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return Summary(
    name: _$enumDecodeNullable(_$FindingEnumMap, json['name']),
    value: (json['value'] as num)?.toDouble(),
  );
}

UpdateEnrollmentStatusResponse _$UpdateEnrollmentStatusResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEnrollmentStatusResponse(
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    statusReason: json['statusReason'] as String,
  );
}

UtilizationMetric _$UtilizationMetricFromJson(Map<String, dynamic> json) {
  return UtilizationMetric(
    name: _$enumDecodeNullable(_$MetricNameEnumMap, json['name']),
    statistic:
        _$enumDecodeNullable(_$MetricStatisticEnumMap, json['statistic']),
    value: (json['value'] as num)?.toDouble(),
  );
}

const _$MetricStatisticEnumMap = {
  MetricStatistic.maximum: 'Maximum',
  MetricStatistic.average: 'Average',
};
