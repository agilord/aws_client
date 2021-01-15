// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-11-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationComponent _$ApplicationComponentFromJson(Map<String, dynamic> json) {
  return ApplicationComponent(
    componentName: json['ComponentName'] as String,
    componentRemarks: json['ComponentRemarks'] as String,
    detectedWorkload: (json['DetectedWorkload'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$TierEnumMap, k),
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(k, e as String),
          )),
    ),
    monitor: json['Monitor'] as bool,
    osType: _$enumDecodeNullable(_$OsTypeEnumMap, json['OsType']),
    resourceType: json['ResourceType'] as String,
    tier: _$enumDecodeNullable(_$TierEnumMap, json['Tier']),
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

const _$TierEnumMap = {
  Tier.custom: 'CUSTOM',
  Tier.$default: 'DEFAULT',
  Tier.dotNetCore: 'DOT_NET_CORE',
  Tier.dotNetWorker: 'DOT_NET_WORKER',
  Tier.dotNetWebTier: 'DOT_NET_WEB_TIER',
  Tier.dotNetWeb: 'DOT_NET_WEB',
  Tier.sqlServer: 'SQL_SERVER',
  Tier.sqlServerAlwaysonAvailabilityGroup:
      'SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP',
  Tier.mysql: 'MYSQL',
  Tier.postgresql: 'POSTGRESQL',
  Tier.javaJmx: 'JAVA_JMX',
  Tier.oracle: 'ORACLE',
};

const _$OsTypeEnumMap = {
  OsType.windows: 'WINDOWS',
  OsType.linux: 'LINUX',
};

ApplicationInfo _$ApplicationInfoFromJson(Map<String, dynamic> json) {
  return ApplicationInfo(
    cWEMonitorEnabled: json['CWEMonitorEnabled'] as bool,
    lifeCycle: json['LifeCycle'] as String,
    opsCenterEnabled: json['OpsCenterEnabled'] as bool,
    opsItemSNSTopicArn: json['OpsItemSNSTopicArn'] as String,
    remarks: json['Remarks'] as String,
    resourceGroupName: json['ResourceGroupName'] as String,
  );
}

ConfigurationEvent _$ConfigurationEventFromJson(Map<String, dynamic> json) {
  return ConfigurationEvent(
    eventDetail: json['EventDetail'] as String,
    eventResourceName: json['EventResourceName'] as String,
    eventResourceType: _$enumDecodeNullable(
        _$ConfigurationEventResourceTypeEnumMap, json['EventResourceType']),
    eventStatus: _$enumDecodeNullable(
        _$ConfigurationEventStatusEnumMap, json['EventStatus']),
    eventTime: const UnixDateTimeConverter().fromJson(json['EventTime']),
    monitoredResourceARN: json['MonitoredResourceARN'] as String,
  );
}

const _$ConfigurationEventResourceTypeEnumMap = {
  ConfigurationEventResourceType.cloudwatchAlarm: 'CLOUDWATCH_ALARM',
  ConfigurationEventResourceType.cloudwatchLog: 'CLOUDWATCH_LOG',
  ConfigurationEventResourceType.cloudformation: 'CLOUDFORMATION',
  ConfigurationEventResourceType.ssmAssociation: 'SSM_ASSOCIATION',
};

const _$ConfigurationEventStatusEnumMap = {
  ConfigurationEventStatus.info: 'INFO',
  ConfigurationEventStatus.warn: 'WARN',
  ConfigurationEventStatus.error: 'ERROR',
};

CreateApplicationResponse _$CreateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationResponse(
    applicationInfo: json['ApplicationInfo'] == null
        ? null
        : ApplicationInfo.fromJson(
            json['ApplicationInfo'] as Map<String, dynamic>),
  );
}

CreateComponentResponse _$CreateComponentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateComponentResponse();
}

CreateLogPatternResponse _$CreateLogPatternResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLogPatternResponse(
    logPattern: json['LogPattern'] == null
        ? null
        : LogPattern.fromJson(json['LogPattern'] as Map<String, dynamic>),
    resourceGroupName: json['ResourceGroupName'] as String,
  );
}

DeleteApplicationResponse _$DeleteApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApplicationResponse();
}

DeleteComponentResponse _$DeleteComponentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteComponentResponse();
}

DeleteLogPatternResponse _$DeleteLogPatternResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLogPatternResponse();
}

DescribeApplicationResponse _$DescribeApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeApplicationResponse(
    applicationInfo: json['ApplicationInfo'] == null
        ? null
        : ApplicationInfo.fromJson(
            json['ApplicationInfo'] as Map<String, dynamic>),
  );
}

DescribeComponentConfigurationRecommendationResponse
    _$DescribeComponentConfigurationRecommendationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeComponentConfigurationRecommendationResponse(
    componentConfiguration: json['ComponentConfiguration'] as String,
  );
}

DescribeComponentConfigurationResponse
    _$DescribeComponentConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeComponentConfigurationResponse(
    componentConfiguration: json['ComponentConfiguration'] as String,
    monitor: json['Monitor'] as bool,
    tier: _$enumDecodeNullable(_$TierEnumMap, json['Tier']),
  );
}

DescribeComponentResponse _$DescribeComponentResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeComponentResponse(
    applicationComponent: json['ApplicationComponent'] == null
        ? null
        : ApplicationComponent.fromJson(
            json['ApplicationComponent'] as Map<String, dynamic>),
    resourceList:
        (json['ResourceList'] as List)?.map((e) => e as String)?.toList(),
  );
}

DescribeLogPatternResponse _$DescribeLogPatternResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLogPatternResponse(
    logPattern: json['LogPattern'] == null
        ? null
        : LogPattern.fromJson(json['LogPattern'] as Map<String, dynamic>),
    resourceGroupName: json['ResourceGroupName'] as String,
  );
}

DescribeObservationResponse _$DescribeObservationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeObservationResponse(
    observation: json['Observation'] == null
        ? null
        : Observation.fromJson(json['Observation'] as Map<String, dynamic>),
  );
}

DescribeProblemObservationsResponse
    _$DescribeProblemObservationsResponseFromJson(Map<String, dynamic> json) {
  return DescribeProblemObservationsResponse(
    relatedObservations: json['RelatedObservations'] == null
        ? null
        : RelatedObservations.fromJson(
            json['RelatedObservations'] as Map<String, dynamic>),
  );
}

DescribeProblemResponse _$DescribeProblemResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProblemResponse(
    problem: json['Problem'] == null
        ? null
        : Problem.fromJson(json['Problem'] as Map<String, dynamic>),
  );
}

ListApplicationsResponse _$ListApplicationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListApplicationsResponse(
    applicationInfoList: (json['ApplicationInfoList'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListComponentsResponse _$ListComponentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListComponentsResponse(
    applicationComponentList: (json['ApplicationComponentList'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationComponent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListConfigurationHistoryResponse _$ListConfigurationHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return ListConfigurationHistoryResponse(
    eventList: (json['EventList'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLogPatternSetsResponse _$ListLogPatternSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLogPatternSetsResponse(
    logPatternSets:
        (json['LogPatternSets'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
    resourceGroupName: json['ResourceGroupName'] as String,
  );
}

ListLogPatternsResponse _$ListLogPatternsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLogPatternsResponse(
    logPatterns: (json['LogPatterns'] as List)
        ?.map((e) =>
            e == null ? null : LogPattern.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    resourceGroupName: json['ResourceGroupName'] as String,
  );
}

ListProblemsResponse _$ListProblemsResponseFromJson(Map<String, dynamic> json) {
  return ListProblemsResponse(
    nextToken: json['NextToken'] as String,
    problemList: (json['ProblemList'] as List)
        ?.map((e) =>
            e == null ? null : Problem.fromJson(e as Map<String, dynamic>))
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

LogPattern _$LogPatternFromJson(Map<String, dynamic> json) {
  return LogPattern(
    pattern: json['Pattern'] as String,
    patternName: json['PatternName'] as String,
    patternSetName: json['PatternSetName'] as String,
    rank: json['Rank'] as int,
  );
}

Observation _$ObservationFromJson(Map<String, dynamic> json) {
  return Observation(
    cloudWatchEventDetailType: json['CloudWatchEventDetailType'] as String,
    cloudWatchEventId: json['CloudWatchEventId'] as String,
    cloudWatchEventSource: _$enumDecodeNullable(
        _$CloudWatchEventSourceEnumMap, json['CloudWatchEventSource']),
    codeDeployApplication: json['CodeDeployApplication'] as String,
    codeDeployDeploymentGroup: json['CodeDeployDeploymentGroup'] as String,
    codeDeployDeploymentId: json['CodeDeployDeploymentId'] as String,
    codeDeployInstanceGroupId: json['CodeDeployInstanceGroupId'] as String,
    codeDeployState: json['CodeDeployState'] as String,
    ebsCause: json['EbsCause'] as String,
    ebsEvent: json['EbsEvent'] as String,
    ebsRequestId: json['EbsRequestId'] as String,
    ebsResult: json['EbsResult'] as String,
    ec2State: json['Ec2State'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    healthEventArn: json['HealthEventArn'] as String,
    healthEventDescription: json['HealthEventDescription'] as String,
    healthEventTypeCategory: json['HealthEventTypeCategory'] as String,
    healthEventTypeCode: json['HealthEventTypeCode'] as String,
    healthService: json['HealthService'] as String,
    id: json['Id'] as String,
    lineTime: const UnixDateTimeConverter().fromJson(json['LineTime']),
    logFilter: _$enumDecodeNullable(_$LogFilterEnumMap, json['LogFilter']),
    logGroup: json['LogGroup'] as String,
    logText: json['LogText'] as String,
    metricName: json['MetricName'] as String,
    metricNamespace: json['MetricNamespace'] as String,
    rdsEventCategories: json['RdsEventCategories'] as String,
    rdsEventMessage: json['RdsEventMessage'] as String,
    s3EventName: json['S3EventName'] as String,
    sourceARN: json['SourceARN'] as String,
    sourceType: json['SourceType'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    statesArn: json['StatesArn'] as String,
    statesExecutionArn: json['StatesExecutionArn'] as String,
    statesInput: json['StatesInput'] as String,
    statesStatus: json['StatesStatus'] as String,
    unit: json['Unit'] as String,
    value: (json['Value'] as num)?.toDouble(),
    xRayErrorPercent: json['XRayErrorPercent'] as int,
    xRayFaultPercent: json['XRayFaultPercent'] as int,
    xRayNodeName: json['XRayNodeName'] as String,
    xRayNodeType: json['XRayNodeType'] as String,
    xRayRequestAverageLatency: json['XRayRequestAverageLatency'] as int,
    xRayRequestCount: json['XRayRequestCount'] as int,
    xRayThrottlePercent: json['XRayThrottlePercent'] as int,
  );
}

const _$CloudWatchEventSourceEnumMap = {
  CloudWatchEventSource.ec2: 'EC2',
  CloudWatchEventSource.codeDeploy: 'CODE_DEPLOY',
  CloudWatchEventSource.health: 'HEALTH',
  CloudWatchEventSource.rds: 'RDS',
};

const _$LogFilterEnumMap = {
  LogFilter.error: 'ERROR',
  LogFilter.warn: 'WARN',
  LogFilter.info: 'INFO',
};

Problem _$ProblemFromJson(Map<String, dynamic> json) {
  return Problem(
    affectedResource: json['AffectedResource'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    feedback: (json['Feedback'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$FeedbackKeyEnumMap, k),
          _$enumDecodeNullable(_$FeedbackValueEnumMap, e)),
    ),
    id: json['Id'] as String,
    insights: json['Insights'] as String,
    resourceGroupName: json['ResourceGroupName'] as String,
    severityLevel:
        _$enumDecodeNullable(_$SeverityLevelEnumMap, json['SeverityLevel']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
    title: json['Title'] as String,
  );
}

const _$FeedbackValueEnumMap = {
  FeedbackValue.notSpecified: 'NOT_SPECIFIED',
  FeedbackValue.useful: 'USEFUL',
  FeedbackValue.notUseful: 'NOT_USEFUL',
};

const _$FeedbackKeyEnumMap = {
  FeedbackKey.insightsFeedback: 'INSIGHTS_FEEDBACK',
};

const _$SeverityLevelEnumMap = {
  SeverityLevel.low: 'Low',
  SeverityLevel.medium: 'Medium',
  SeverityLevel.high: 'High',
};

const _$StatusEnumMap = {
  Status.ignore: 'IGNORE',
  Status.resolved: 'RESOLVED',
  Status.pending: 'PENDING',
};

RelatedObservations _$RelatedObservationsFromJson(Map<String, dynamic> json) {
  return RelatedObservations(
    observationList: (json['ObservationList'] as List)
        ?.map((e) =>
            e == null ? null : Observation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

UpdateApplicationResponse _$UpdateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApplicationResponse(
    applicationInfo: json['ApplicationInfo'] == null
        ? null
        : ApplicationInfo.fromJson(
            json['ApplicationInfo'] as Map<String, dynamic>),
  );
}

UpdateComponentConfigurationResponse
    _$UpdateComponentConfigurationResponseFromJson(Map<String, dynamic> json) {
  return UpdateComponentConfigurationResponse();
}

UpdateComponentResponse _$UpdateComponentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateComponentResponse();
}

UpdateLogPatternResponse _$UpdateLogPatternResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateLogPatternResponse(
    logPattern: json['LogPattern'] == null
        ? null
        : LogPattern.fromJson(json['LogPattern'] as Map<String, dynamic>),
    resourceGroupName: json['ResourceGroupName'] as String,
  );
}
