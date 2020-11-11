// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application-insights-2018-11-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationComponent _$ApplicationComponentFromJson(Map<String, dynamic> json) {
  return ApplicationComponent(
    componentName: json['ComponentName'] as String,
    monitor: json['Monitor'] as bool,
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
  Tier.$default: 'DEFAULT',
  Tier.dotNetCore: 'DOT_NET_CORE',
  Tier.dotNetWorker: 'DOT_NET_WORKER',
  Tier.dotNetWeb: 'DOT_NET_WEB',
  Tier.sqlServer: 'SQL_SERVER',
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
    eventTime: unixTimestampFromJson(json['EventTime']),
    monitoredResourceARN: json['MonitoredResourceARN'] as String,
  );
}

const _$ConfigurationEventResourceTypeEnumMap = {
  ConfigurationEventResourceType.cloudwatchAlarm: 'CLOUDWATCH_ALARM',
  ConfigurationEventResourceType.cloudformation: 'CLOUDFORMATION',
  ConfigurationEventResourceType.ssmAssociation: 'SSM_ASSOCIATION',
};

const _$ConfigurationEventStatusEnumMap = {
  ConfigurationEventStatus.info: 'INFO',
  ConfigurationEventStatus.warn: 'WARN',
  ConfigurationEventStatus.error: 'ERROR',
};

Map<String, dynamic> _$CreateApplicationRequestToJson(
    CreateApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('CWEMonitorEnabled', instance.cWEMonitorEnabled);
  writeNotNull('OpsCenterEnabled', instance.opsCenterEnabled);
  writeNotNull('OpsItemSNSTopicArn', instance.opsItemSNSTopicArn);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateApplicationResponse _$CreateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationResponse(
    applicationInfo: json['ApplicationInfo'] == null
        ? null
        : ApplicationInfo.fromJson(
            json['ApplicationInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateComponentRequestToJson(
    CreateComponentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComponentName', instance.componentName);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('ResourceList', instance.resourceList);
  return val;
}

CreateComponentResponse _$CreateComponentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateComponentResponse();
}

Map<String, dynamic> _$CreateLogPatternRequestToJson(
    CreateLogPatternRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Pattern', instance.pattern);
  writeNotNull('PatternName', instance.patternName);
  writeNotNull('PatternSetName', instance.patternSetName);
  writeNotNull('Rank', instance.rank);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  return val;
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

Map<String, dynamic> _$DeleteApplicationRequestToJson(
    DeleteApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  return val;
}

DeleteApplicationResponse _$DeleteApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApplicationResponse();
}

Map<String, dynamic> _$DeleteComponentRequestToJson(
    DeleteComponentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComponentName', instance.componentName);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  return val;
}

DeleteComponentResponse _$DeleteComponentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteComponentResponse();
}

Map<String, dynamic> _$DeleteLogPatternRequestToJson(
    DeleteLogPatternRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PatternName', instance.patternName);
  writeNotNull('PatternSetName', instance.patternSetName);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  return val;
}

DeleteLogPatternResponse _$DeleteLogPatternResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLogPatternResponse();
}

Map<String, dynamic> _$DescribeApplicationRequestToJson(
    DescribeApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  return val;
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

Map<String, dynamic>
    _$DescribeComponentConfigurationRecommendationRequestToJson(
        DescribeComponentConfigurationRecommendationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComponentName', instance.componentName);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('Tier', _$TierEnumMap[instance.tier]);
  return val;
}

DescribeComponentConfigurationRecommendationResponse
    _$DescribeComponentConfigurationRecommendationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeComponentConfigurationRecommendationResponse(
    componentConfiguration: json['ComponentConfiguration'] as String,
  );
}

Map<String, dynamic> _$DescribeComponentConfigurationRequestToJson(
    DescribeComponentConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComponentName', instance.componentName);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  return val;
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

Map<String, dynamic> _$DescribeComponentRequestToJson(
    DescribeComponentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComponentName', instance.componentName);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  return val;
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

Map<String, dynamic> _$DescribeLogPatternRequestToJson(
    DescribeLogPatternRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PatternName', instance.patternName);
  writeNotNull('PatternSetName', instance.patternSetName);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  return val;
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

Map<String, dynamic> _$DescribeObservationRequestToJson(
    DescribeObservationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObservationId', instance.observationId);
  return val;
}

DescribeObservationResponse _$DescribeObservationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeObservationResponse(
    observation: json['Observation'] == null
        ? null
        : Observation.fromJson(json['Observation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeProblemObservationsRequestToJson(
    DescribeProblemObservationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProblemId', instance.problemId);
  return val;
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

Map<String, dynamic> _$DescribeProblemRequestToJson(
    DescribeProblemRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProblemId', instance.problemId);
  return val;
}

DescribeProblemResponse _$DescribeProblemResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProblemResponse(
    problem: json['Problem'] == null
        ? null
        : Problem.fromJson(json['Problem'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListApplicationsRequestToJson(
    ListApplicationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListComponentsRequestToJson(
    ListComponentsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListConfigurationHistoryRequestToJson(
    ListConfigurationHistoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTime', unixTimestampToJson(instance.endTime));
  writeNotNull(
      'EventStatus', _$ConfigurationEventStatusEnumMap[instance.eventStatus]);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('StartTime', unixTimestampToJson(instance.startTime));
  return val;
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

Map<String, dynamic> _$ListLogPatternSetsRequestToJson(
    ListLogPatternSetsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListLogPatternsRequestToJson(
    ListLogPatternsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('PatternSetName', instance.patternSetName);
  return val;
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

Map<String, dynamic> _$ListProblemsRequestToJson(ListProblemsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTime', unixTimestampToJson(instance.endTime));
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('StartTime', unixTimestampToJson(instance.startTime));
  return val;
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

Map<String, dynamic> _$ListTagsForResourceRequestToJson(
    ListTagsForResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  return val;
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
    ec2State: json['Ec2State'] as String,
    endTime: unixTimestampFromJson(json['EndTime']),
    healthEventArn: json['HealthEventArn'] as String,
    healthEventDescription: json['HealthEventDescription'] as String,
    healthEventTypeCategory: json['HealthEventTypeCategory'] as String,
    healthEventTypeCode: json['HealthEventTypeCode'] as String,
    healthService: json['HealthService'] as String,
    id: json['Id'] as String,
    lineTime: unixTimestampFromJson(json['LineTime']),
    logFilter: _$enumDecodeNullable(_$LogFilterEnumMap, json['LogFilter']),
    logGroup: json['LogGroup'] as String,
    logText: json['LogText'] as String,
    metricName: json['MetricName'] as String,
    metricNamespace: json['MetricNamespace'] as String,
    sourceARN: json['SourceARN'] as String,
    sourceType: json['SourceType'] as String,
    startTime: unixTimestampFromJson(json['StartTime']),
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
};

const _$LogFilterEnumMap = {
  LogFilter.error: 'ERROR',
  LogFilter.warn: 'WARN',
  LogFilter.info: 'INFO',
};

Problem _$ProblemFromJson(Map<String, dynamic> json) {
  return Problem(
    affectedResource: json['AffectedResource'] as String,
    endTime: unixTimestampFromJson(json['EndTime']),
    feedback: (json['Feedback'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    id: json['Id'] as String,
    insights: json['Insights'] as String,
    resourceGroupName: json['ResourceGroupName'] as String,
    severityLevel:
        _$enumDecodeNullable(_$SeverityLevelEnumMap, json['SeverityLevel']),
    startTime: unixTimestampFromJson(json['StartTime']),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
    title: json['Title'] as String,
  );
}

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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UpdateApplicationRequestToJson(
    UpdateApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('CWEMonitorEnabled', instance.cWEMonitorEnabled);
  writeNotNull('OpsCenterEnabled', instance.opsCenterEnabled);
  writeNotNull('OpsItemSNSTopicArn', instance.opsItemSNSTopicArn);
  writeNotNull('RemoveSNSTopic', instance.removeSNSTopic);
  return val;
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

Map<String, dynamic> _$UpdateComponentConfigurationRequestToJson(
    UpdateComponentConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComponentName', instance.componentName);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('ComponentConfiguration', instance.componentConfiguration);
  writeNotNull('Monitor', instance.monitor);
  writeNotNull('Tier', _$TierEnumMap[instance.tier]);
  return val;
}

UpdateComponentConfigurationResponse
    _$UpdateComponentConfigurationResponseFromJson(Map<String, dynamic> json) {
  return UpdateComponentConfigurationResponse();
}

Map<String, dynamic> _$UpdateComponentRequestToJson(
    UpdateComponentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComponentName', instance.componentName);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('NewComponentName', instance.newComponentName);
  writeNotNull('ResourceList', instance.resourceList);
  return val;
}

UpdateComponentResponse _$UpdateComponentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateComponentResponse();
}

Map<String, dynamic> _$UpdateLogPatternRequestToJson(
    UpdateLogPatternRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PatternName', instance.patternName);
  writeNotNull('PatternSetName', instance.patternSetName);
  writeNotNull('ResourceGroupName', instance.resourceGroupName);
  writeNotNull('Pattern', instance.pattern);
  writeNotNull('Rank', instance.rank);
  return val;
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
