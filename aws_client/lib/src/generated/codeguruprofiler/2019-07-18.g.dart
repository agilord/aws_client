// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-07-18.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNotificationChannelsResponse _$AddNotificationChannelsResponseFromJson(
    Map<String, dynamic> json) {
  return AddNotificationChannelsResponse(
    notificationConfiguration: json['notificationConfiguration'] == null
        ? null
        : NotificationConfiguration.fromJson(
            json['notificationConfiguration'] as Map<String, dynamic>),
  );
}

AgentConfiguration _$AgentConfigurationFromJson(Map<String, dynamic> json) {
  return AgentConfiguration(
    periodInSeconds: json['periodInSeconds'] as int,
    shouldProfile: json['shouldProfile'] as bool,
    agentParameters: (json['agentParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$AgentParameterFieldEnumMap, k), e as String),
    ),
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

const _$AgentParameterFieldEnumMap = {
  AgentParameterField.maxStackDepth: 'MaxStackDepth',
  AgentParameterField.memoryUsageLimitPercent: 'MemoryUsageLimitPercent',
  AgentParameterField.minimumTimeForReportingInMilliseconds:
      'MinimumTimeForReportingInMilliseconds',
  AgentParameterField.reportingIntervalInMilliseconds:
      'ReportingIntervalInMilliseconds',
  AgentParameterField.samplingIntervalInMilliseconds:
      'SamplingIntervalInMilliseconds',
};

AgentOrchestrationConfig _$AgentOrchestrationConfigFromJson(
    Map<String, dynamic> json) {
  return AgentOrchestrationConfig(
    profilingEnabled: json['profilingEnabled'] as bool,
  );
}

Map<String, dynamic> _$AgentOrchestrationConfigToJson(
    AgentOrchestrationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profilingEnabled', instance.profilingEnabled);
  return val;
}

AggregatedProfileTime _$AggregatedProfileTimeFromJson(
    Map<String, dynamic> json) {
  return AggregatedProfileTime(
    period: _$enumDecodeNullable(_$AggregationPeriodEnumMap, json['period']),
    start: const IsoDateTimeConverter().fromJson(json['start']),
  );
}

const _$AggregationPeriodEnumMap = {
  AggregationPeriod.p1d: 'P1D',
  AggregationPeriod.pt1h: 'PT1H',
  AggregationPeriod.pt5m: 'PT5M',
};

Anomaly _$AnomalyFromJson(Map<String, dynamic> json) {
  return Anomaly(
    instances: (json['instances'] as List)
        ?.map((e) => e == null
            ? null
            : AnomalyInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    metric: json['metric'] == null
        ? null
        : Metric.fromJson(json['metric'] as Map<String, dynamic>),
    reason: json['reason'] as String,
  );
}

AnomalyInstance _$AnomalyInstanceFromJson(Map<String, dynamic> json) {
  return AnomalyInstance(
    id: json['id'] as String,
    startTime: const IsoDateTimeConverter().fromJson(json['startTime']),
    endTime: const IsoDateTimeConverter().fromJson(json['endTime']),
    userFeedback: json['userFeedback'] == null
        ? null
        : UserFeedback.fromJson(json['userFeedback'] as Map<String, dynamic>),
  );
}

BatchGetFrameMetricDataResponse _$BatchGetFrameMetricDataResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetFrameMetricDataResponse(
    endTime: const IsoDateTimeConverter().fromJson(json['endTime']),
    endTimes: (json['endTimes'] as List)
        ?.map((e) => e == null
            ? null
            : TimestampStructure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    frameMetricData: (json['frameMetricData'] as List)
        ?.map((e) => e == null
            ? null
            : FrameMetricDatum.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resolution:
        _$enumDecodeNullable(_$AggregationPeriodEnumMap, json['resolution']),
    startTime: const IsoDateTimeConverter().fromJson(json['startTime']),
    unprocessedEndTimes:
        (json['unprocessedEndTimes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : TimestampStructure.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
  );
}

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    eventPublishers: (json['eventPublishers'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EventPublisherEnumMap, e))
        ?.toList(),
    uri: json['uri'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ChannelToJson(Channel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'eventPublishers',
      instance.eventPublishers
          ?.map((e) => _$EventPublisherEnumMap[e])
          ?.toList());
  writeNotNull('uri', instance.uri);
  writeNotNull('id', instance.id);
  return val;
}

const _$EventPublisherEnumMap = {
  EventPublisher.anomalyDetection: 'AnomalyDetection',
};

ConfigureAgentResponse _$ConfigureAgentResponseFromJson(
    Map<String, dynamic> json) {
  return ConfigureAgentResponse(
    configuration: json['configuration'] == null
        ? null
        : AgentConfiguration.fromJson(
            json['configuration'] as Map<String, dynamic>),
  );
}

CreateProfilingGroupResponse _$CreateProfilingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProfilingGroupResponse(
    profilingGroup: json['profilingGroup'] == null
        ? null
        : ProfilingGroupDescription.fromJson(
            json['profilingGroup'] as Map<String, dynamic>),
  );
}

DeleteProfilingGroupResponse _$DeleteProfilingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProfilingGroupResponse();
}

DescribeProfilingGroupResponse _$DescribeProfilingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProfilingGroupResponse(
    profilingGroup: json['profilingGroup'] == null
        ? null
        : ProfilingGroupDescription.fromJson(
            json['profilingGroup'] as Map<String, dynamic>),
  );
}

FindingsReportSummary _$FindingsReportSummaryFromJson(
    Map<String, dynamic> json) {
  return FindingsReportSummary(
    id: json['id'] as String,
    profileEndTime:
        const IsoDateTimeConverter().fromJson(json['profileEndTime']),
    profileStartTime:
        const IsoDateTimeConverter().fromJson(json['profileStartTime']),
    profilingGroupName: json['profilingGroupName'] as String,
    totalNumberOfFindings: json['totalNumberOfFindings'] as int,
  );
}

FrameMetric _$FrameMetricFromJson(Map<String, dynamic> json) {
  return FrameMetric(
    frameName: json['frameName'] as String,
    threadStates:
        (json['threadStates'] as List)?.map((e) => e as String)?.toList(),
    type: _$enumDecodeNullable(_$MetricTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$FrameMetricToJson(FrameMetric instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('frameName', instance.frameName);
  writeNotNull('threadStates', instance.threadStates);
  writeNotNull('type', _$MetricTypeEnumMap[instance.type]);
  return val;
}

const _$MetricTypeEnumMap = {
  MetricType.aggregatedRelativeTotalTime: 'AggregatedRelativeTotalTime',
};

FrameMetricDatum _$FrameMetricDatumFromJson(Map<String, dynamic> json) {
  return FrameMetricDatum(
    frameMetric: json['frameMetric'] == null
        ? null
        : FrameMetric.fromJson(json['frameMetric'] as Map<String, dynamic>),
    values:
        (json['values'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
  );
}

GetFindingsReportAccountSummaryResponse
    _$GetFindingsReportAccountSummaryResponseFromJson(
        Map<String, dynamic> json) {
  return GetFindingsReportAccountSummaryResponse(
    reportSummaries: (json['reportSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : FindingsReportSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetNotificationConfigurationResponse
    _$GetNotificationConfigurationResponseFromJson(Map<String, dynamic> json) {
  return GetNotificationConfigurationResponse(
    notificationConfiguration: json['notificationConfiguration'] == null
        ? null
        : NotificationConfiguration.fromJson(
            json['notificationConfiguration'] as Map<String, dynamic>),
  );
}

GetPolicyResponse _$GetPolicyResponseFromJson(Map<String, dynamic> json) {
  return GetPolicyResponse(
    policy: json['policy'] as String,
    revisionId: json['revisionId'] as String,
  );
}

GetProfileResponse _$GetProfileResponseFromJson(Map<String, dynamic> json) {
  return GetProfileResponse(
    contentType: json['Content-Type'] as String,
    profile: const Uint8ListConverter().fromJson(json['profile'] as String),
    contentEncoding: json['Content-Encoding'] as String,
  );
}

GetRecommendationsResponse _$GetRecommendationsResponseFromJson(
    Map<String, dynamic> json) {
  return GetRecommendationsResponse(
    anomalies: (json['anomalies'] as List)
        ?.map((e) =>
            e == null ? null : Anomaly.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    profileEndTime:
        const IsoDateTimeConverter().fromJson(json['profileEndTime']),
    profileStartTime:
        const IsoDateTimeConverter().fromJson(json['profileStartTime']),
    profilingGroupName: json['profilingGroupName'] as String,
    recommendations: (json['recommendations'] as List)
        ?.map((e) => e == null
            ? null
            : Recommendation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListFindingsReportsResponse _$ListFindingsReportsResponseFromJson(
    Map<String, dynamic> json) {
  return ListFindingsReportsResponse(
    findingsReportSummaries: (json['findingsReportSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : FindingsReportSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListProfileTimesResponse _$ListProfileTimesResponseFromJson(
    Map<String, dynamic> json) {
  return ListProfileTimesResponse(
    profileTimes: (json['profileTimes'] as List)
        ?.map((e) =>
            e == null ? null : ProfileTime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListProfilingGroupsResponse _$ListProfilingGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProfilingGroupsResponse(
    profilingGroupNames: (json['profilingGroupNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['nextToken'] as String,
    profilingGroups: (json['profilingGroups'] as List)
        ?.map((e) => e == null
            ? null
            : ProfilingGroupDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Match _$MatchFromJson(Map<String, dynamic> json) {
  return Match(
    frameAddress: json['frameAddress'] as String,
    targetFramesIndex: json['targetFramesIndex'] as int,
    thresholdBreachValue: (json['thresholdBreachValue'] as num)?.toDouble(),
  );
}

Metric _$MetricFromJson(Map<String, dynamic> json) {
  return Metric(
    frameName: json['frameName'] as String,
    threadStates:
        (json['threadStates'] as List)?.map((e) => e as String)?.toList(),
    type: _$enumDecodeNullable(_$MetricTypeEnumMap, json['type']),
  );
}

NotificationConfiguration _$NotificationConfigurationFromJson(
    Map<String, dynamic> json) {
  return NotificationConfiguration(
    channels: (json['channels'] as List)
        ?.map((e) =>
            e == null ? null : Channel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Pattern _$PatternFromJson(Map<String, dynamic> json) {
  return Pattern(
    countersToAggregate: (json['countersToAggregate'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    description: json['description'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    resolutionSteps: json['resolutionSteps'] as String,
    targetFrames: (json['targetFrames'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
    thresholdPercent: (json['thresholdPercent'] as num)?.toDouble(),
  );
}

PostAgentProfileResponse _$PostAgentProfileResponseFromJson(
    Map<String, dynamic> json) {
  return PostAgentProfileResponse();
}

ProfileTime _$ProfileTimeFromJson(Map<String, dynamic> json) {
  return ProfileTime(
    start: const IsoDateTimeConverter().fromJson(json['start']),
  );
}

ProfilingGroupDescription _$ProfilingGroupDescriptionFromJson(
    Map<String, dynamic> json) {
  return ProfilingGroupDescription(
    agentOrchestrationConfig: json['agentOrchestrationConfig'] == null
        ? null
        : AgentOrchestrationConfig.fromJson(
            json['agentOrchestrationConfig'] as Map<String, dynamic>),
    arn: json['arn'] as String,
    computePlatform:
        _$enumDecodeNullable(_$ComputePlatformEnumMap, json['computePlatform']),
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    name: json['name'] as String,
    profilingStatus: json['profilingStatus'] == null
        ? null
        : ProfilingStatus.fromJson(
            json['profilingStatus'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    updatedAt: const IsoDateTimeConverter().fromJson(json['updatedAt']),
  );
}

const _$ComputePlatformEnumMap = {
  ComputePlatform.awsLambda: 'AWSLambda',
  ComputePlatform.$default: 'Default',
};

ProfilingStatus _$ProfilingStatusFromJson(Map<String, dynamic> json) {
  return ProfilingStatus(
    latestAgentOrchestratedAt: const IsoDateTimeConverter()
        .fromJson(json['latestAgentOrchestratedAt']),
    latestAgentProfileReportedAt: const IsoDateTimeConverter()
        .fromJson(json['latestAgentProfileReportedAt']),
    latestAggregatedProfile: json['latestAggregatedProfile'] == null
        ? null
        : AggregatedProfileTime.fromJson(
            json['latestAggregatedProfile'] as Map<String, dynamic>),
  );
}

PutPermissionResponse _$PutPermissionResponseFromJson(
    Map<String, dynamic> json) {
  return PutPermissionResponse(
    policy: json['policy'] as String,
    revisionId: json['revisionId'] as String,
  );
}

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) {
  return Recommendation(
    allMatchesCount: json['allMatchesCount'] as int,
    allMatchesSum: (json['allMatchesSum'] as num)?.toDouble(),
    endTime: const IsoDateTimeConverter().fromJson(json['endTime']),
    pattern: json['pattern'] == null
        ? null
        : Pattern.fromJson(json['pattern'] as Map<String, dynamic>),
    startTime: const IsoDateTimeConverter().fromJson(json['startTime']),
    topMatches: (json['topMatches'] as List)
        ?.map(
            (e) => e == null ? null : Match.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RemoveNotificationChannelResponse _$RemoveNotificationChannelResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveNotificationChannelResponse(
    notificationConfiguration: json['notificationConfiguration'] == null
        ? null
        : NotificationConfiguration.fromJson(
            json['notificationConfiguration'] as Map<String, dynamic>),
  );
}

RemovePermissionResponse _$RemovePermissionResponseFromJson(
    Map<String, dynamic> json) {
  return RemovePermissionResponse(
    policy: json['policy'] as String,
    revisionId: json['revisionId'] as String,
  );
}

SubmitFeedbackResponse _$SubmitFeedbackResponseFromJson(
    Map<String, dynamic> json) {
  return SubmitFeedbackResponse();
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TimestampStructure _$TimestampStructureFromJson(Map<String, dynamic> json) {
  return TimestampStructure(
    value: const IsoDateTimeConverter().fromJson(json['value']),
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateProfilingGroupResponse _$UpdateProfilingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProfilingGroupResponse(
    profilingGroup: json['profilingGroup'] == null
        ? null
        : ProfilingGroupDescription.fromJson(
            json['profilingGroup'] as Map<String, dynamic>),
  );
}

UserFeedback _$UserFeedbackFromJson(Map<String, dynamic> json) {
  return UserFeedback(
    type: _$enumDecodeNullable(_$FeedbackTypeEnumMap, json['type']),
  );
}

const _$FeedbackTypeEnumMap = {
  FeedbackType.negative: 'Negative',
  FeedbackType.positive: 'Positive',
};
