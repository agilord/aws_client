// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-12-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNotificationChannelResponse _$AddNotificationChannelResponseFromJson(
    Map<String, dynamic> json) {
  return AddNotificationChannelResponse(
    id: json['Id'] as String,
  );
}

AnomalySourceDetails _$AnomalySourceDetailsFromJson(Map<String, dynamic> json) {
  return AnomalySourceDetails(
    cloudWatchMetrics: (json['CloudWatchMetrics'] as List)
        ?.map((e) => e == null
            ? null
            : CloudWatchMetricsDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AnomalyTimeRange _$AnomalyTimeRangeFromJson(Map<String, dynamic> json) {
  return AnomalyTimeRange(
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
  );
}

CloudFormationCollection _$CloudFormationCollectionFromJson(
    Map<String, dynamic> json) {
  return CloudFormationCollection(
    stackNames: (json['StackNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CloudFormationCollectionToJson(
    CloudFormationCollection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StackNames', instance.stackNames);
  return val;
}

CloudFormationCollectionFilter _$CloudFormationCollectionFilterFromJson(
    Map<String, dynamic> json) {
  return CloudFormationCollectionFilter(
    stackNames: (json['StackNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

CloudFormationHealth _$CloudFormationHealthFromJson(Map<String, dynamic> json) {
  return CloudFormationHealth(
    insight: json['Insight'] == null
        ? null
        : InsightHealth.fromJson(json['Insight'] as Map<String, dynamic>),
    stackName: json['StackName'] as String,
  );
}

CloudWatchMetricsDetail _$CloudWatchMetricsDetailFromJson(
    Map<String, dynamic> json) {
  return CloudWatchMetricsDetail(
    dimensions: (json['Dimensions'] as List)
        ?.map((e) => e == null
            ? null
            : CloudWatchMetricsDimension.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    metricName: json['MetricName'] as String,
    namespace: json['Namespace'] as String,
    period: json['Period'] as int,
    stat: _$enumDecodeNullable(_$CloudWatchMetricsStatEnumMap, json['Stat']),
    unit: json['Unit'] as String,
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

const _$CloudWatchMetricsStatEnumMap = {
  CloudWatchMetricsStat.sum: 'Sum',
  CloudWatchMetricsStat.average: 'Average',
  CloudWatchMetricsStat.sampleCount: 'SampleCount',
  CloudWatchMetricsStat.minimum: 'Minimum',
  CloudWatchMetricsStat.maximum: 'Maximum',
  CloudWatchMetricsStat.p99: 'p99',
  CloudWatchMetricsStat.p90: 'p90',
  CloudWatchMetricsStat.p50: 'p50',
};

CloudWatchMetricsDimension _$CloudWatchMetricsDimensionFromJson(
    Map<String, dynamic> json) {
  return CloudWatchMetricsDimension(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

DescribeAccountHealthResponse _$DescribeAccountHealthResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAccountHealthResponse(
    metricsAnalyzed: json['MetricsAnalyzed'] as int,
    openProactiveInsights: json['OpenProactiveInsights'] as int,
    openReactiveInsights: json['OpenReactiveInsights'] as int,
  );
}

DescribeAccountOverviewResponse _$DescribeAccountOverviewResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAccountOverviewResponse(
    meanTimeToRecoverInMilliseconds:
        json['MeanTimeToRecoverInMilliseconds'] as int,
    proactiveInsights: json['ProactiveInsights'] as int,
    reactiveInsights: json['ReactiveInsights'] as int,
  );
}

DescribeAnomalyResponse _$DescribeAnomalyResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAnomalyResponse(
    proactiveAnomaly: json['ProactiveAnomaly'] == null
        ? null
        : ProactiveAnomaly.fromJson(
            json['ProactiveAnomaly'] as Map<String, dynamic>),
    reactiveAnomaly: json['ReactiveAnomaly'] == null
        ? null
        : ReactiveAnomaly.fromJson(
            json['ReactiveAnomaly'] as Map<String, dynamic>),
  );
}

DescribeInsightResponse _$DescribeInsightResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeInsightResponse(
    proactiveInsight: json['ProactiveInsight'] == null
        ? null
        : ProactiveInsight.fromJson(
            json['ProactiveInsight'] as Map<String, dynamic>),
    reactiveInsight: json['ReactiveInsight'] == null
        ? null
        : ReactiveInsight.fromJson(
            json['ReactiveInsight'] as Map<String, dynamic>),
  );
}

DescribeResourceCollectionHealthResponse
    _$DescribeResourceCollectionHealthResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeResourceCollectionHealthResponse(
    cloudFormation: (json['CloudFormation'] as List)
        ?.map((e) => e == null
            ? null
            : CloudFormationHealth.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeServiceIntegrationResponse _$DescribeServiceIntegrationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeServiceIntegrationResponse(
    serviceIntegration: json['ServiceIntegration'] == null
        ? null
        : ServiceIntegrationConfig.fromJson(
            json['ServiceIntegration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EndTimeRangeToJson(EndTimeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'FromTime', const UnixDateTimeConverter().toJson(instance.fromTime));
  writeNotNull('ToTime', const UnixDateTimeConverter().toJson(instance.toTime));
  return val;
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    dataSource:
        _$enumDecodeNullable(_$EventDataSourceEnumMap, json['DataSource']),
    eventClass: _$enumDecodeNullable(_$EventClassEnumMap, json['EventClass']),
    eventSource: json['EventSource'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    resourceCollection: json['ResourceCollection'] == null
        ? null
        : ResourceCollection.fromJson(
            json['ResourceCollection'] as Map<String, dynamic>),
    resources: (json['Resources'] as List)
        ?.map((e) => e == null
            ? null
            : EventResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    time: const UnixDateTimeConverter().fromJson(json['Time']),
  );
}

const _$EventDataSourceEnumMap = {
  EventDataSource.awsCloudTrail: 'AWS_CLOUD_TRAIL',
  EventDataSource.awsCodeDeploy: 'AWS_CODE_DEPLOY',
};

const _$EventClassEnumMap = {
  EventClass.infrastructure: 'INFRASTRUCTURE',
  EventClass.deployment: 'DEPLOYMENT',
  EventClass.securityChange: 'SECURITY_CHANGE',
  EventClass.configChange: 'CONFIG_CHANGE',
  EventClass.schemaChange: 'SCHEMA_CHANGE',
};

EventResource _$EventResourceFromJson(Map<String, dynamic> json) {
  return EventResource(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$EventTimeRangeToJson(EventTimeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'FromTime', const UnixDateTimeConverter().toJson(instance.fromTime));
  writeNotNull('ToTime', const UnixDateTimeConverter().toJson(instance.toTime));
  return val;
}

GetResourceCollectionResponse _$GetResourceCollectionResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourceCollectionResponse(
    nextToken: json['NextToken'] as String,
    resourceCollection: json['ResourceCollection'] == null
        ? null
        : ResourceCollectionFilter.fromJson(
            json['ResourceCollection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InsightFeedbackToJson(InsightFeedback instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Feedback', _$InsightFeedbackOptionEnumMap[instance.feedback]);
  writeNotNull('Id', instance.id);
  return val;
}

const _$InsightFeedbackOptionEnumMap = {
  InsightFeedbackOption.validCollection: 'VALID_COLLECTION',
  InsightFeedbackOption.recommendationUseful: 'RECOMMENDATION_USEFUL',
  InsightFeedbackOption.alertTooSensitive: 'ALERT_TOO_SENSITIVE',
  InsightFeedbackOption.dataNoisyAnomaly: 'DATA_NOISY_ANOMALY',
  InsightFeedbackOption.dataIncorrect: 'DATA_INCORRECT',
};

InsightHealth _$InsightHealthFromJson(Map<String, dynamic> json) {
  return InsightHealth(
    meanTimeToRecoverInMilliseconds:
        json['MeanTimeToRecoverInMilliseconds'] as int,
    openProactiveInsights: json['OpenProactiveInsights'] as int,
    openReactiveInsights: json['OpenReactiveInsights'] as int,
  );
}

InsightTimeRange _$InsightTimeRangeFromJson(Map<String, dynamic> json) {
  return InsightTimeRange(
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
  );
}

ListAnomaliesForInsightResponse _$ListAnomaliesForInsightResponseFromJson(
    Map<String, dynamic> json) {
  return ListAnomaliesForInsightResponse(
    nextToken: json['NextToken'] as String,
    proactiveAnomalies: (json['ProactiveAnomalies'] as List)
        ?.map((e) => e == null
            ? null
            : ProactiveAnomalySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reactiveAnomalies: (json['ReactiveAnomalies'] as List)
        ?.map((e) => e == null
            ? null
            : ReactiveAnomalySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListEventsFiltersToJson(ListEventsFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSource', _$EventDataSourceEnumMap[instance.dataSource]);
  writeNotNull('EventClass', _$EventClassEnumMap[instance.eventClass]);
  writeNotNull('EventSource', instance.eventSource);
  writeNotNull('EventTimeRange', instance.eventTimeRange?.toJson());
  writeNotNull('InsightId', instance.insightId);
  writeNotNull('ResourceCollection', instance.resourceCollection?.toJson());
  return val;
}

ListEventsResponse _$ListEventsResponseFromJson(Map<String, dynamic> json) {
  return ListEventsResponse(
    events: (json['Events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListInsightsAnyStatusFilterToJson(
    ListInsightsAnyStatusFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StartTimeRange', instance.startTimeRange?.toJson());
  writeNotNull('Type', _$InsightTypeEnumMap[instance.type]);
  return val;
}

const _$InsightTypeEnumMap = {
  InsightType.reactive: 'REACTIVE',
  InsightType.proactive: 'PROACTIVE',
};

Map<String, dynamic> _$ListInsightsClosedStatusFilterToJson(
    ListInsightsClosedStatusFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTimeRange', instance.endTimeRange?.toJson());
  writeNotNull('Type', _$InsightTypeEnumMap[instance.type]);
  return val;
}

Map<String, dynamic> _$ListInsightsOngoingStatusFilterToJson(
    ListInsightsOngoingStatusFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$InsightTypeEnumMap[instance.type]);
  return val;
}

ListInsightsResponse _$ListInsightsResponseFromJson(Map<String, dynamic> json) {
  return ListInsightsResponse(
    nextToken: json['NextToken'] as String,
    proactiveInsights: (json['ProactiveInsights'] as List)
        ?.map((e) => e == null
            ? null
            : ProactiveInsightSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reactiveInsights: (json['ReactiveInsights'] as List)
        ?.map((e) => e == null
            ? null
            : ReactiveInsightSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListInsightsStatusFilterToJson(
    ListInsightsStatusFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Any', instance.any?.toJson());
  writeNotNull('Closed', instance.closed?.toJson());
  writeNotNull('Ongoing', instance.ongoing?.toJson());
  return val;
}

ListNotificationChannelsResponse _$ListNotificationChannelsResponseFromJson(
    Map<String, dynamic> json) {
  return ListNotificationChannelsResponse(
    channels: (json['Channels'] as List)
        ?.map((e) => e == null
            ? null
            : NotificationChannel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListRecommendationsResponse _$ListRecommendationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRecommendationsResponse(
    nextToken: json['NextToken'] as String,
    recommendations: (json['Recommendations'] as List)
        ?.map((e) => e == null
            ? null
            : Recommendation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NotificationChannel _$NotificationChannelFromJson(Map<String, dynamic> json) {
  return NotificationChannel(
    config: json['Config'] == null
        ? null
        : NotificationChannelConfig.fromJson(
            json['Config'] as Map<String, dynamic>),
    id: json['Id'] as String,
  );
}

NotificationChannelConfig _$NotificationChannelConfigFromJson(
    Map<String, dynamic> json) {
  return NotificationChannelConfig(
    sns: json['Sns'] == null
        ? null
        : SnsChannelConfig.fromJson(json['Sns'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NotificationChannelConfigToJson(
    NotificationChannelConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Sns', instance.sns?.toJson());
  return val;
}

OpsCenterIntegration _$OpsCenterIntegrationFromJson(Map<String, dynamic> json) {
  return OpsCenterIntegration(
    optInStatus:
        _$enumDecodeNullable(_$OptInStatusEnumMap, json['OptInStatus']),
  );
}

const _$OptInStatusEnumMap = {
  OptInStatus.enabled: 'ENABLED',
  OptInStatus.disabled: 'DISABLED',
};

Map<String, dynamic> _$OpsCenterIntegrationConfigToJson(
    OpsCenterIntegrationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OptInStatus', _$OptInStatusEnumMap[instance.optInStatus]);
  return val;
}

PredictionTimeRange _$PredictionTimeRangeFromJson(Map<String, dynamic> json) {
  return PredictionTimeRange(
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
  );
}

ProactiveAnomaly _$ProactiveAnomalyFromJson(Map<String, dynamic> json) {
  return ProactiveAnomaly(
    anomalyTimeRange: json['AnomalyTimeRange'] == null
        ? null
        : AnomalyTimeRange.fromJson(
            json['AnomalyTimeRange'] as Map<String, dynamic>),
    associatedInsightId: json['AssociatedInsightId'] as String,
    id: json['Id'] as String,
    limit: (json['Limit'] as num)?.toDouble(),
    predictionTimeRange: json['PredictionTimeRange'] == null
        ? null
        : PredictionTimeRange.fromJson(
            json['PredictionTimeRange'] as Map<String, dynamic>),
    resourceCollection: json['ResourceCollection'] == null
        ? null
        : ResourceCollection.fromJson(
            json['ResourceCollection'] as Map<String, dynamic>),
    severity: _$enumDecodeNullable(_$AnomalySeverityEnumMap, json['Severity']),
    sourceDetails: json['SourceDetails'] == null
        ? null
        : AnomalySourceDetails.fromJson(
            json['SourceDetails'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$AnomalyStatusEnumMap, json['Status']),
    updateTime: const UnixDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

const _$AnomalySeverityEnumMap = {
  AnomalySeverity.low: 'LOW',
  AnomalySeverity.medium: 'MEDIUM',
  AnomalySeverity.high: 'HIGH',
};

const _$AnomalyStatusEnumMap = {
  AnomalyStatus.ongoing: 'ONGOING',
  AnomalyStatus.closed: 'CLOSED',
};

ProactiveAnomalySummary _$ProactiveAnomalySummaryFromJson(
    Map<String, dynamic> json) {
  return ProactiveAnomalySummary(
    anomalyTimeRange: json['AnomalyTimeRange'] == null
        ? null
        : AnomalyTimeRange.fromJson(
            json['AnomalyTimeRange'] as Map<String, dynamic>),
    associatedInsightId: json['AssociatedInsightId'] as String,
    id: json['Id'] as String,
    limit: (json['Limit'] as num)?.toDouble(),
    predictionTimeRange: json['PredictionTimeRange'] == null
        ? null
        : PredictionTimeRange.fromJson(
            json['PredictionTimeRange'] as Map<String, dynamic>),
    resourceCollection: json['ResourceCollection'] == null
        ? null
        : ResourceCollection.fromJson(
            json['ResourceCollection'] as Map<String, dynamic>),
    severity: _$enumDecodeNullable(_$AnomalySeverityEnumMap, json['Severity']),
    sourceDetails: json['SourceDetails'] == null
        ? null
        : AnomalySourceDetails.fromJson(
            json['SourceDetails'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$AnomalyStatusEnumMap, json['Status']),
    updateTime: const UnixDateTimeConverter().fromJson(json['UpdateTime']),
  );
}

ProactiveInsight _$ProactiveInsightFromJson(Map<String, dynamic> json) {
  return ProactiveInsight(
    id: json['Id'] as String,
    insightTimeRange: json['InsightTimeRange'] == null
        ? null
        : InsightTimeRange.fromJson(
            json['InsightTimeRange'] as Map<String, dynamic>),
    name: json['Name'] as String,
    predictionTimeRange: json['PredictionTimeRange'] == null
        ? null
        : PredictionTimeRange.fromJson(
            json['PredictionTimeRange'] as Map<String, dynamic>),
    resourceCollection: json['ResourceCollection'] == null
        ? null
        : ResourceCollection.fromJson(
            json['ResourceCollection'] as Map<String, dynamic>),
    severity: _$enumDecodeNullable(_$InsightSeverityEnumMap, json['Severity']),
    ssmOpsItemId: json['SsmOpsItemId'] as String,
    status: _$enumDecodeNullable(_$InsightStatusEnumMap, json['Status']),
  );
}

const _$InsightSeverityEnumMap = {
  InsightSeverity.low: 'LOW',
  InsightSeverity.medium: 'MEDIUM',
  InsightSeverity.high: 'HIGH',
};

const _$InsightStatusEnumMap = {
  InsightStatus.ongoing: 'ONGOING',
  InsightStatus.closed: 'CLOSED',
};

ProactiveInsightSummary _$ProactiveInsightSummaryFromJson(
    Map<String, dynamic> json) {
  return ProactiveInsightSummary(
    id: json['Id'] as String,
    insightTimeRange: json['InsightTimeRange'] == null
        ? null
        : InsightTimeRange.fromJson(
            json['InsightTimeRange'] as Map<String, dynamic>),
    name: json['Name'] as String,
    predictionTimeRange: json['PredictionTimeRange'] == null
        ? null
        : PredictionTimeRange.fromJson(
            json['PredictionTimeRange'] as Map<String, dynamic>),
    resourceCollection: json['ResourceCollection'] == null
        ? null
        : ResourceCollection.fromJson(
            json['ResourceCollection'] as Map<String, dynamic>),
    severity: _$enumDecodeNullable(_$InsightSeverityEnumMap, json['Severity']),
    status: _$enumDecodeNullable(_$InsightStatusEnumMap, json['Status']),
  );
}

PutFeedbackResponse _$PutFeedbackResponseFromJson(Map<String, dynamic> json) {
  return PutFeedbackResponse();
}

ReactiveAnomaly _$ReactiveAnomalyFromJson(Map<String, dynamic> json) {
  return ReactiveAnomaly(
    anomalyTimeRange: json['AnomalyTimeRange'] == null
        ? null
        : AnomalyTimeRange.fromJson(
            json['AnomalyTimeRange'] as Map<String, dynamic>),
    associatedInsightId: json['AssociatedInsightId'] as String,
    id: json['Id'] as String,
    resourceCollection: json['ResourceCollection'] == null
        ? null
        : ResourceCollection.fromJson(
            json['ResourceCollection'] as Map<String, dynamic>),
    severity: _$enumDecodeNullable(_$AnomalySeverityEnumMap, json['Severity']),
    sourceDetails: json['SourceDetails'] == null
        ? null
        : AnomalySourceDetails.fromJson(
            json['SourceDetails'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$AnomalyStatusEnumMap, json['Status']),
  );
}

ReactiveAnomalySummary _$ReactiveAnomalySummaryFromJson(
    Map<String, dynamic> json) {
  return ReactiveAnomalySummary(
    anomalyTimeRange: json['AnomalyTimeRange'] == null
        ? null
        : AnomalyTimeRange.fromJson(
            json['AnomalyTimeRange'] as Map<String, dynamic>),
    associatedInsightId: json['AssociatedInsightId'] as String,
    id: json['Id'] as String,
    resourceCollection: json['ResourceCollection'] == null
        ? null
        : ResourceCollection.fromJson(
            json['ResourceCollection'] as Map<String, dynamic>),
    severity: _$enumDecodeNullable(_$AnomalySeverityEnumMap, json['Severity']),
    sourceDetails: json['SourceDetails'] == null
        ? null
        : AnomalySourceDetails.fromJson(
            json['SourceDetails'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$AnomalyStatusEnumMap, json['Status']),
  );
}

ReactiveInsight _$ReactiveInsightFromJson(Map<String, dynamic> json) {
  return ReactiveInsight(
    id: json['Id'] as String,
    insightTimeRange: json['InsightTimeRange'] == null
        ? null
        : InsightTimeRange.fromJson(
            json['InsightTimeRange'] as Map<String, dynamic>),
    name: json['Name'] as String,
    resourceCollection: json['ResourceCollection'] == null
        ? null
        : ResourceCollection.fromJson(
            json['ResourceCollection'] as Map<String, dynamic>),
    severity: _$enumDecodeNullable(_$InsightSeverityEnumMap, json['Severity']),
    ssmOpsItemId: json['SsmOpsItemId'] as String,
    status: _$enumDecodeNullable(_$InsightStatusEnumMap, json['Status']),
  );
}

ReactiveInsightSummary _$ReactiveInsightSummaryFromJson(
    Map<String, dynamic> json) {
  return ReactiveInsightSummary(
    id: json['Id'] as String,
    insightTimeRange: json['InsightTimeRange'] == null
        ? null
        : InsightTimeRange.fromJson(
            json['InsightTimeRange'] as Map<String, dynamic>),
    name: json['Name'] as String,
    resourceCollection: json['ResourceCollection'] == null
        ? null
        : ResourceCollection.fromJson(
            json['ResourceCollection'] as Map<String, dynamic>),
    severity: _$enumDecodeNullable(_$InsightSeverityEnumMap, json['Severity']),
    status: _$enumDecodeNullable(_$InsightStatusEnumMap, json['Status']),
  );
}

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) {
  return Recommendation(
    description: json['Description'] as String,
    link: json['Link'] as String,
    name: json['Name'] as String,
    reason: json['Reason'] as String,
    relatedAnomalies: (json['RelatedAnomalies'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendationRelatedAnomaly.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    relatedEvents: (json['RelatedEvents'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendationRelatedEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RecommendationRelatedAnomaly _$RecommendationRelatedAnomalyFromJson(
    Map<String, dynamic> json) {
  return RecommendationRelatedAnomaly(
    resources: (json['Resources'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendationRelatedAnomalyResource.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    sourceDetails: (json['SourceDetails'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendationRelatedAnomalySourceDetail.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

RecommendationRelatedAnomalyResource
    _$RecommendationRelatedAnomalyResourceFromJson(Map<String, dynamic> json) {
  return RecommendationRelatedAnomalyResource(
    name: json['Name'] as String,
    type: json['Type'] as String,
  );
}

RecommendationRelatedAnomalySourceDetail
    _$RecommendationRelatedAnomalySourceDetailFromJson(
        Map<String, dynamic> json) {
  return RecommendationRelatedAnomalySourceDetail(
    cloudWatchMetrics: (json['CloudWatchMetrics'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendationRelatedCloudWatchMetricsSourceDetail.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

RecommendationRelatedCloudWatchMetricsSourceDetail
    _$RecommendationRelatedCloudWatchMetricsSourceDetailFromJson(
        Map<String, dynamic> json) {
  return RecommendationRelatedCloudWatchMetricsSourceDetail(
    metricName: json['MetricName'] as String,
    namespace: json['Namespace'] as String,
  );
}

RecommendationRelatedEvent _$RecommendationRelatedEventFromJson(
    Map<String, dynamic> json) {
  return RecommendationRelatedEvent(
    name: json['Name'] as String,
    resources: (json['Resources'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendationRelatedEventResource.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

RecommendationRelatedEventResource _$RecommendationRelatedEventResourceFromJson(
    Map<String, dynamic> json) {
  return RecommendationRelatedEventResource(
    name: json['Name'] as String,
    type: json['Type'] as String,
  );
}

RemoveNotificationChannelResponse _$RemoveNotificationChannelResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveNotificationChannelResponse();
}

ResourceCollection _$ResourceCollectionFromJson(Map<String, dynamic> json) {
  return ResourceCollection(
    cloudFormation: json['CloudFormation'] == null
        ? null
        : CloudFormationCollection.fromJson(
            json['CloudFormation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResourceCollectionToJson(ResourceCollection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudFormation', instance.cloudFormation?.toJson());
  return val;
}

ResourceCollectionFilter _$ResourceCollectionFilterFromJson(
    Map<String, dynamic> json) {
  return ResourceCollectionFilter(
    cloudFormation: json['CloudFormation'] == null
        ? null
        : CloudFormationCollectionFilter.fromJson(
            json['CloudFormation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SearchInsightsFiltersToJson(
    SearchInsightsFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceCollection', instance.resourceCollection?.toJson());
  writeNotNull('Severities',
      instance.severities?.map((e) => _$InsightSeverityEnumMap[e])?.toList());
  writeNotNull('Statuses',
      instance.statuses?.map((e) => _$InsightStatusEnumMap[e])?.toList());
  return val;
}

SearchInsightsResponse _$SearchInsightsResponseFromJson(
    Map<String, dynamic> json) {
  return SearchInsightsResponse(
    nextToken: json['NextToken'] as String,
    proactiveInsights: (json['ProactiveInsights'] as List)
        ?.map((e) => e == null
            ? null
            : ProactiveInsightSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reactiveInsights: (json['ReactiveInsights'] as List)
        ?.map((e) => e == null
            ? null
            : ReactiveInsightSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ServiceIntegrationConfig _$ServiceIntegrationConfigFromJson(
    Map<String, dynamic> json) {
  return ServiceIntegrationConfig(
    opsCenter: json['OpsCenter'] == null
        ? null
        : OpsCenterIntegration.fromJson(
            json['OpsCenter'] as Map<String, dynamic>),
  );
}

SnsChannelConfig _$SnsChannelConfigFromJson(Map<String, dynamic> json) {
  return SnsChannelConfig(
    topicArn: json['TopicArn'] as String,
  );
}

Map<String, dynamic> _$SnsChannelConfigToJson(SnsChannelConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TopicArn', instance.topicArn);
  return val;
}

Map<String, dynamic> _$StartTimeRangeToJson(StartTimeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'FromTime', const UnixDateTimeConverter().toJson(instance.fromTime));
  writeNotNull('ToTime', const UnixDateTimeConverter().toJson(instance.toTime));
  return val;
}

Map<String, dynamic> _$UpdateCloudFormationCollectionFilterToJson(
    UpdateCloudFormationCollectionFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StackNames', instance.stackNames);
  return val;
}

Map<String, dynamic> _$UpdateResourceCollectionFilterToJson(
    UpdateResourceCollectionFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudFormation', instance.cloudFormation?.toJson());
  return val;
}

UpdateResourceCollectionResponse _$UpdateResourceCollectionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResourceCollectionResponse();
}

Map<String, dynamic> _$UpdateServiceIntegrationConfigToJson(
    UpdateServiceIntegrationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OpsCenter', instance.opsCenter?.toJson());
  return val;
}

UpdateServiceIntegrationResponse _$UpdateServiceIntegrationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateServiceIntegrationResponse();
}
