// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-11-01.dart';

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

DescribeRecommendationExportJobsResponse
    _$DescribeRecommendationExportJobsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeRecommendationExportJobsResponse(
    nextToken: json['nextToken'] as String,
    recommendationExportJobs: (json['recommendationExportJobs'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendationExportJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EBSFilterToJson(EBSFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$EBSFilterNameEnumMap[instance.name]);
  writeNotNull('values', instance.values);
  return val;
}

const _$EBSFilterNameEnumMap = {
  EBSFilterName.finding: 'Finding',
};

EBSUtilizationMetric _$EBSUtilizationMetricFromJson(Map<String, dynamic> json) {
  return EBSUtilizationMetric(
    name: _$enumDecodeNullable(_$EBSMetricNameEnumMap, json['name']),
    statistic:
        _$enumDecodeNullable(_$MetricStatisticEnumMap, json['statistic']),
    value: (json['value'] as num)?.toDouble(),
  );
}

const _$EBSMetricNameEnumMap = {
  EBSMetricName.volumeReadOpsPerSecond: 'VolumeReadOpsPerSecond',
  EBSMetricName.volumeWriteOpsPerSecond: 'VolumeWriteOpsPerSecond',
  EBSMetricName.volumeReadBytesPerSecond: 'VolumeReadBytesPerSecond',
  EBSMetricName.volumeWriteBytesPerSecond: 'VolumeWriteBytesPerSecond',
};

const _$MetricStatisticEnumMap = {
  MetricStatistic.maximum: 'Maximum',
  MetricStatistic.average: 'Average',
};

ExportAutoScalingGroupRecommendationsResponse
    _$ExportAutoScalingGroupRecommendationsResponseFromJson(
        Map<String, dynamic> json) {
  return ExportAutoScalingGroupRecommendationsResponse(
    jobId: json['jobId'] as String,
    s3Destination: json['s3Destination'] == null
        ? null
        : S3Destination.fromJson(json['s3Destination'] as Map<String, dynamic>),
  );
}

ExportDestination _$ExportDestinationFromJson(Map<String, dynamic> json) {
  return ExportDestination(
    s3: json['s3'] == null
        ? null
        : S3Destination.fromJson(json['s3'] as Map<String, dynamic>),
  );
}

ExportEC2InstanceRecommendationsResponse
    _$ExportEC2InstanceRecommendationsResponseFromJson(
        Map<String, dynamic> json) {
  return ExportEC2InstanceRecommendationsResponse(
    jobId: json['jobId'] as String,
    s3Destination: json['s3Destination'] == null
        ? null
        : S3Destination.fromJson(json['s3Destination'] as Map<String, dynamic>),
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

GetEBSVolumeRecommendationsResponse
    _$GetEBSVolumeRecommendationsResponseFromJson(Map<String, dynamic> json) {
  return GetEBSVolumeRecommendationsResponse(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : GetRecommendationError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
    volumeRecommendations: (json['volumeRecommendations'] as List)
        ?.map((e) => e == null
            ? null
            : VolumeRecommendation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

GetLambdaFunctionRecommendationsResponse
    _$GetLambdaFunctionRecommendationsResponseFromJson(
        Map<String, dynamic> json) {
  return GetLambdaFunctionRecommendationsResponse(
    lambdaFunctionRecommendations: (json['lambdaFunctionRecommendations']
            as List)
        ?.map((e) => e == null
            ? null
            : LambdaFunctionRecommendation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

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

Map<String, dynamic> _$JobFilterToJson(JobFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$JobFilterNameEnumMap[instance.name]);
  writeNotNull('values', instance.values);
  return val;
}

const _$JobFilterNameEnumMap = {
  JobFilterName.resourceType: 'ResourceType',
  JobFilterName.jobStatus: 'JobStatus',
};

LambdaFunctionMemoryProjectedMetric
    _$LambdaFunctionMemoryProjectedMetricFromJson(Map<String, dynamic> json) {
  return LambdaFunctionMemoryProjectedMetric(
    name: _$enumDecodeNullable(
        _$LambdaFunctionMemoryMetricNameEnumMap, json['name']),
    statistic: _$enumDecodeNullable(
        _$LambdaFunctionMemoryMetricStatisticEnumMap, json['statistic']),
    value: (json['value'] as num)?.toDouble(),
  );
}

const _$LambdaFunctionMemoryMetricNameEnumMap = {
  LambdaFunctionMemoryMetricName.duration: 'Duration',
};

const _$LambdaFunctionMemoryMetricStatisticEnumMap = {
  LambdaFunctionMemoryMetricStatistic.lowerBound: 'LowerBound',
  LambdaFunctionMemoryMetricStatistic.upperBound: 'UpperBound',
  LambdaFunctionMemoryMetricStatistic.expected: 'Expected',
};

LambdaFunctionMemoryRecommendationOption
    _$LambdaFunctionMemoryRecommendationOptionFromJson(
        Map<String, dynamic> json) {
  return LambdaFunctionMemoryRecommendationOption(
    memorySize: json['memorySize'] as int,
    projectedUtilizationMetrics: (json['projectedUtilizationMetrics'] as List)
        ?.map((e) => e == null
            ? null
            : LambdaFunctionMemoryProjectedMetric.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    rank: json['rank'] as int,
  );
}

LambdaFunctionRecommendation _$LambdaFunctionRecommendationFromJson(
    Map<String, dynamic> json) {
  return LambdaFunctionRecommendation(
    accountId: json['accountId'] as String,
    currentMemorySize: json['currentMemorySize'] as int,
    finding: _$enumDecodeNullable(
        _$LambdaFunctionRecommendationFindingEnumMap, json['finding']),
    findingReasonCodes: (json['findingReasonCodes'] as List)
        ?.map((e) => _$enumDecodeNullable(
            _$LambdaFunctionRecommendationFindingReasonCodeEnumMap, e))
        ?.toList(),
    functionArn: json['functionArn'] as String,
    functionVersion: json['functionVersion'] as String,
    lastRefreshTimestamp:
        const UnixDateTimeConverter().fromJson(json['lastRefreshTimestamp']),
    lookbackPeriodInDays: (json['lookbackPeriodInDays'] as num)?.toDouble(),
    memorySizeRecommendationOptions:
        (json['memorySizeRecommendationOptions'] as List)
            ?.map((e) => e == null
                ? null
                : LambdaFunctionMemoryRecommendationOption.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    numberOfInvocations: json['numberOfInvocations'] as int,
    utilizationMetrics: (json['utilizationMetrics'] as List)
        ?.map((e) => e == null
            ? null
            : LambdaFunctionUtilizationMetric.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$LambdaFunctionRecommendationFindingEnumMap = {
  LambdaFunctionRecommendationFinding.optimized: 'Optimized',
  LambdaFunctionRecommendationFinding.notOptimized: 'NotOptimized',
  LambdaFunctionRecommendationFinding.unavailable: 'Unavailable',
};

const _$LambdaFunctionRecommendationFindingReasonCodeEnumMap = {
  LambdaFunctionRecommendationFindingReasonCode.memoryOverprovisioned:
      'MemoryOverprovisioned',
  LambdaFunctionRecommendationFindingReasonCode.memoryUnderprovisioned:
      'MemoryUnderprovisioned',
  LambdaFunctionRecommendationFindingReasonCode.insufficientData:
      'InsufficientData',
  LambdaFunctionRecommendationFindingReasonCode.inconclusive: 'Inconclusive',
};

Map<String, dynamic> _$LambdaFunctionRecommendationFilterToJson(
    LambdaFunctionRecommendationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'name', _$LambdaFunctionRecommendationFilterNameEnumMap[instance.name]);
  writeNotNull('values', instance.values);
  return val;
}

const _$LambdaFunctionRecommendationFilterNameEnumMap = {
  LambdaFunctionRecommendationFilterName.finding: 'Finding',
  LambdaFunctionRecommendationFilterName.findingReasonCode: 'FindingReasonCode',
};

LambdaFunctionUtilizationMetric _$LambdaFunctionUtilizationMetricFromJson(
    Map<String, dynamic> json) {
  return LambdaFunctionUtilizationMetric(
    name: _$enumDecodeNullable(_$LambdaFunctionMetricNameEnumMap, json['name']),
    statistic: _$enumDecodeNullable(
        _$LambdaFunctionMetricStatisticEnumMap, json['statistic']),
    value: (json['value'] as num)?.toDouble(),
  );
}

const _$LambdaFunctionMetricNameEnumMap = {
  LambdaFunctionMetricName.duration: 'Duration',
  LambdaFunctionMetricName.memory: 'Memory',
};

const _$LambdaFunctionMetricStatisticEnumMap = {
  LambdaFunctionMetricStatistic.maximum: 'Maximum',
  LambdaFunctionMetricStatistic.average: 'Average',
};

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
  MetricName.ebsReadOpsPerSecond: 'EBS_READ_OPS_PER_SECOND',
  MetricName.ebsWriteOpsPerSecond: 'EBS_WRITE_OPS_PER_SECOND',
  MetricName.ebsReadBytesPerSecond: 'EBS_READ_BYTES_PER_SECOND',
  MetricName.ebsWriteBytesPerSecond: 'EBS_WRITE_BYTES_PER_SECOND',
};

ReasonCodeSummary _$ReasonCodeSummaryFromJson(Map<String, dynamic> json) {
  return ReasonCodeSummary(
    name: _$enumDecodeNullable(_$FindingReasonCodeEnumMap, json['name']),
    value: (json['value'] as num)?.toDouble(),
  );
}

const _$FindingReasonCodeEnumMap = {
  FindingReasonCode.memoryOverprovisioned: 'MemoryOverprovisioned',
  FindingReasonCode.memoryUnderprovisioned: 'MemoryUnderprovisioned',
};

RecommendationExportJob _$RecommendationExportJobFromJson(
    Map<String, dynamic> json) {
  return RecommendationExportJob(
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['creationTimestamp']),
    destination: json['destination'] == null
        ? null
        : ExportDestination.fromJson(
            json['destination'] as Map<String, dynamic>),
    failureReason: json['failureReason'] as String,
    jobId: json['jobId'] as String,
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedTimestamp']),
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    status: _$enumDecodeNullable(_$JobStatusEnumMap, json['status']),
  );
}

const _$ResourceTypeEnumMap = {
  ResourceType.ec2Instance: 'Ec2Instance',
  ResourceType.autoScalingGroup: 'AutoScalingGroup',
};

const _$JobStatusEnumMap = {
  JobStatus.queued: 'Queued',
  JobStatus.inProgress: 'InProgress',
  JobStatus.complete: 'Complete',
  JobStatus.failed: 'Failed',
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
  RecommendationSourceType.ebsVolume: 'EbsVolume',
  RecommendationSourceType.lambdaFunction: 'LambdaFunction',
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

S3Destination _$S3DestinationFromJson(Map<String, dynamic> json) {
  return S3Destination(
    bucket: json['bucket'] as String,
    key: json['key'] as String,
    metadataKey: json['metadataKey'] as String,
  );
}

Map<String, dynamic> _$S3DestinationConfigToJson(S3DestinationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucket', instance.bucket);
  writeNotNull('keyPrefix', instance.keyPrefix);
  return val;
}

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return Summary(
    name: _$enumDecodeNullable(_$FindingEnumMap, json['name']),
    reasonCodeSummaries: (json['reasonCodeSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ReasonCodeSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

VolumeConfiguration _$VolumeConfigurationFromJson(Map<String, dynamic> json) {
  return VolumeConfiguration(
    volumeBaselineIOPS: json['volumeBaselineIOPS'] as int,
    volumeBaselineThroughput: json['volumeBaselineThroughput'] as int,
    volumeBurstIOPS: json['volumeBurstIOPS'] as int,
    volumeBurstThroughput: json['volumeBurstThroughput'] as int,
    volumeSize: json['volumeSize'] as int,
    volumeType: json['volumeType'] as String,
  );
}

VolumeRecommendation _$VolumeRecommendationFromJson(Map<String, dynamic> json) {
  return VolumeRecommendation(
    accountId: json['accountId'] as String,
    currentConfiguration: json['currentConfiguration'] == null
        ? null
        : VolumeConfiguration.fromJson(
            json['currentConfiguration'] as Map<String, dynamic>),
    finding: _$enumDecodeNullable(_$EBSFindingEnumMap, json['finding']),
    lastRefreshTimestamp:
        const UnixDateTimeConverter().fromJson(json['lastRefreshTimestamp']),
    lookBackPeriodInDays: (json['lookBackPeriodInDays'] as num)?.toDouble(),
    utilizationMetrics: (json['utilizationMetrics'] as List)
        ?.map((e) => e == null
            ? null
            : EBSUtilizationMetric.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    volumeArn: json['volumeArn'] as String,
    volumeRecommendationOptions: (json['volumeRecommendationOptions'] as List)
        ?.map((e) => e == null
            ? null
            : VolumeRecommendationOption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$EBSFindingEnumMap = {
  EBSFinding.optimized: 'Optimized',
  EBSFinding.notOptimized: 'NotOptimized',
};

VolumeRecommendationOption _$VolumeRecommendationOptionFromJson(
    Map<String, dynamic> json) {
  return VolumeRecommendationOption(
    configuration: json['configuration'] == null
        ? null
        : VolumeConfiguration.fromJson(
            json['configuration'] as Map<String, dynamic>),
    performanceRisk: (json['performanceRisk'] as num)?.toDouble(),
    rank: json['rank'] as int,
  );
}
