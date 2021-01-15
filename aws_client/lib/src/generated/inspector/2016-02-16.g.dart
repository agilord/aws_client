// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-02-16.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAttributesToFindingsResponse _$AddAttributesToFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return AddAttributesToFindingsResponse(
    failedItems: (json['failedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : FailedItemDetails.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$AgentFilterToJson(AgentFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'agentHealthCodes',
      instance.agentHealthCodes
          ?.map((e) => _$AgentHealthCodeEnumMap[e])
          ?.toList());
  writeNotNull('agentHealths',
      instance.agentHealths?.map((e) => _$AgentHealthEnumMap[e])?.toList());
  return val;
}

const _$AgentHealthCodeEnumMap = {
  AgentHealthCode.idle: 'IDLE',
  AgentHealthCode.running: 'RUNNING',
  AgentHealthCode.shutdown: 'SHUTDOWN',
  AgentHealthCode.unhealthy: 'UNHEALTHY',
  AgentHealthCode.throttled: 'THROTTLED',
  AgentHealthCode.unknown: 'UNKNOWN',
};

const _$AgentHealthEnumMap = {
  AgentHealth.healthy: 'HEALTHY',
  AgentHealth.unhealthy: 'UNHEALTHY',
  AgentHealth.unknown: 'UNKNOWN',
};

AgentPreview _$AgentPreviewFromJson(Map<String, dynamic> json) {
  return AgentPreview(
    agentId: json['agentId'] as String,
    agentHealth:
        _$enumDecodeNullable(_$AgentHealthEnumMap, json['agentHealth']),
    agentVersion: json['agentVersion'] as String,
    autoScalingGroup: json['autoScalingGroup'] as String,
    hostname: json['hostname'] as String,
    ipv4Address: json['ipv4Address'] as String,
    kernelVersion: json['kernelVersion'] as String,
    operatingSystem: json['operatingSystem'] as String,
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

AssessmentRun _$AssessmentRunFromJson(Map<String, dynamic> json) {
  return AssessmentRun(
    arn: json['arn'] as String,
    assessmentTemplateArn: json['assessmentTemplateArn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    dataCollected: json['dataCollected'] as bool,
    durationInSeconds: json['durationInSeconds'] as int,
    findingCounts: (json['findingCounts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$SeverityEnumMap, k), e as int),
    ),
    name: json['name'] as String,
    notifications: (json['notifications'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentRunNotification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rulesPackageArns:
        (json['rulesPackageArns'] as List)?.map((e) => e as String)?.toList(),
    state: _$enumDecodeNullable(_$AssessmentRunStateEnumMap, json['state']),
    stateChangedAt:
        const UnixDateTimeConverter().fromJson(json['stateChangedAt']),
    stateChanges: (json['stateChanges'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentRunStateChange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userAttributesForFindings: (json['userAttributesForFindings'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    completedAt: const UnixDateTimeConverter().fromJson(json['completedAt']),
    startedAt: const UnixDateTimeConverter().fromJson(json['startedAt']),
  );
}

const _$SeverityEnumMap = {
  Severity.low: 'Low',
  Severity.medium: 'Medium',
  Severity.high: 'High',
  Severity.informational: 'Informational',
  Severity.undefined: 'Undefined',
};

const _$AssessmentRunStateEnumMap = {
  AssessmentRunState.created: 'CREATED',
  AssessmentRunState.startDataCollectionPending:
      'START_DATA_COLLECTION_PENDING',
  AssessmentRunState.startDataCollectionInProgress:
      'START_DATA_COLLECTION_IN_PROGRESS',
  AssessmentRunState.collectingData: 'COLLECTING_DATA',
  AssessmentRunState.stopDataCollectionPending: 'STOP_DATA_COLLECTION_PENDING',
  AssessmentRunState.dataCollected: 'DATA_COLLECTED',
  AssessmentRunState.startEvaluatingRulesPending:
      'START_EVALUATING_RULES_PENDING',
  AssessmentRunState.evaluatingRules: 'EVALUATING_RULES',
  AssessmentRunState.failed: 'FAILED',
  AssessmentRunState.error: 'ERROR',
  AssessmentRunState.completed: 'COMPLETED',
  AssessmentRunState.completedWithErrors: 'COMPLETED_WITH_ERRORS',
  AssessmentRunState.canceled: 'CANCELED',
};

AssessmentRunAgent _$AssessmentRunAgentFromJson(Map<String, dynamic> json) {
  return AssessmentRunAgent(
    agentHealth:
        _$enumDecodeNullable(_$AgentHealthEnumMap, json['agentHealth']),
    agentHealthCode:
        _$enumDecodeNullable(_$AgentHealthCodeEnumMap, json['agentHealthCode']),
    agentId: json['agentId'] as String,
    assessmentRunArn: json['assessmentRunArn'] as String,
    telemetryMetadata: (json['telemetryMetadata'] as List)
        ?.map((e) => e == null
            ? null
            : TelemetryMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    agentHealthDetails: json['agentHealthDetails'] as String,
    autoScalingGroup: json['autoScalingGroup'] as String,
  );
}

Map<String, dynamic> _$AssessmentRunFilterToJson(AssessmentRunFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('completionTimeRange', instance.completionTimeRange?.toJson());
  writeNotNull('durationRange', instance.durationRange?.toJson());
  writeNotNull('namePattern', instance.namePattern);
  writeNotNull('rulesPackageArns', instance.rulesPackageArns);
  writeNotNull('startTimeRange', instance.startTimeRange?.toJson());
  writeNotNull('stateChangeTimeRange', instance.stateChangeTimeRange?.toJson());
  writeNotNull('states',
      instance.states?.map((e) => _$AssessmentRunStateEnumMap[e])?.toList());
  return val;
}

AssessmentRunNotification _$AssessmentRunNotificationFromJson(
    Map<String, dynamic> json) {
  return AssessmentRunNotification(
    date: const UnixDateTimeConverter().fromJson(json['date']),
    error: json['error'] as bool,
    event: _$enumDecodeNullable(_$InspectorEventEnumMap, json['event']),
    message: json['message'] as String,
    snsPublishStatusCode: _$enumDecodeNullable(
        _$AssessmentRunNotificationSnsStatusCodeEnumMap,
        json['snsPublishStatusCode']),
    snsTopicArn: json['snsTopicArn'] as String,
  );
}

const _$InspectorEventEnumMap = {
  InspectorEvent.assessmentRunStarted: 'ASSESSMENT_RUN_STARTED',
  InspectorEvent.assessmentRunCompleted: 'ASSESSMENT_RUN_COMPLETED',
  InspectorEvent.assessmentRunStateChanged: 'ASSESSMENT_RUN_STATE_CHANGED',
  InspectorEvent.findingReported: 'FINDING_REPORTED',
  InspectorEvent.other: 'OTHER',
};

const _$AssessmentRunNotificationSnsStatusCodeEnumMap = {
  AssessmentRunNotificationSnsStatusCode.success: 'SUCCESS',
  AssessmentRunNotificationSnsStatusCode.topicDoesNotExist:
      'TOPIC_DOES_NOT_EXIST',
  AssessmentRunNotificationSnsStatusCode.accessDenied: 'ACCESS_DENIED',
  AssessmentRunNotificationSnsStatusCode.internalError: 'INTERNAL_ERROR',
};

AssessmentRunStateChange _$AssessmentRunStateChangeFromJson(
    Map<String, dynamic> json) {
  return AssessmentRunStateChange(
    state: _$enumDecodeNullable(_$AssessmentRunStateEnumMap, json['state']),
    stateChangedAt:
        const UnixDateTimeConverter().fromJson(json['stateChangedAt']),
  );
}

AssessmentTarget _$AssessmentTargetFromJson(Map<String, dynamic> json) {
  return AssessmentTarget(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    name: json['name'] as String,
    updatedAt: const UnixDateTimeConverter().fromJson(json['updatedAt']),
    resourceGroupArn: json['resourceGroupArn'] as String,
  );
}

Map<String, dynamic> _$AssessmentTargetFilterToJson(
    AssessmentTargetFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'assessmentTargetNamePattern', instance.assessmentTargetNamePattern);
  return val;
}

AssessmentTemplate _$AssessmentTemplateFromJson(Map<String, dynamic> json) {
  return AssessmentTemplate(
    arn: json['arn'] as String,
    assessmentRunCount: json['assessmentRunCount'] as int,
    assessmentTargetArn: json['assessmentTargetArn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    durationInSeconds: json['durationInSeconds'] as int,
    name: json['name'] as String,
    rulesPackageArns:
        (json['rulesPackageArns'] as List)?.map((e) => e as String)?.toList(),
    userAttributesForFindings: (json['userAttributesForFindings'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastAssessmentRunArn: json['lastAssessmentRunArn'] as String,
  );
}

Map<String, dynamic> _$AssessmentTemplateFilterToJson(
    AssessmentTemplateFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('durationRange', instance.durationRange?.toJson());
  writeNotNull('namePattern', instance.namePattern);
  writeNotNull('rulesPackageArns', instance.rulesPackageArns);
  return val;
}

AssetAttributes _$AssetAttributesFromJson(Map<String, dynamic> json) {
  return AssetAttributes(
    schemaVersion: json['schemaVersion'] as int,
    agentId: json['agentId'] as String,
    amiId: json['amiId'] as String,
    autoScalingGroup: json['autoScalingGroup'] as String,
    hostname: json['hostname'] as String,
    ipv4Addresses:
        (json['ipv4Addresses'] as List)?.map((e) => e as String)?.toList(),
    networkInterfaces: (json['networkInterfaces'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

CreateAssessmentTargetResponse _$CreateAssessmentTargetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAssessmentTargetResponse(
    assessmentTargetArn: json['assessmentTargetArn'] as String,
  );
}

CreateAssessmentTemplateResponse _$CreateAssessmentTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAssessmentTemplateResponse(
    assessmentTemplateArn: json['assessmentTemplateArn'] as String,
  );
}

CreateExclusionsPreviewResponse _$CreateExclusionsPreviewResponseFromJson(
    Map<String, dynamic> json) {
  return CreateExclusionsPreviewResponse(
    previewToken: json['previewToken'] as String,
  );
}

CreateResourceGroupResponse _$CreateResourceGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateResourceGroupResponse(
    resourceGroupArn: json['resourceGroupArn'] as String,
  );
}

DescribeAssessmentRunsResponse _$DescribeAssessmentRunsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAssessmentRunsResponse(
    assessmentRuns: (json['assessmentRuns'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentRun.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failedItems: (json['failedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : FailedItemDetails.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

DescribeAssessmentTargetsResponse _$DescribeAssessmentTargetsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAssessmentTargetsResponse(
    assessmentTargets: (json['assessmentTargets'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failedItems: (json['failedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : FailedItemDetails.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

DescribeAssessmentTemplatesResponse
    _$DescribeAssessmentTemplatesResponseFromJson(Map<String, dynamic> json) {
  return DescribeAssessmentTemplatesResponse(
    assessmentTemplates: (json['assessmentTemplates'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentTemplate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failedItems: (json['failedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : FailedItemDetails.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

DescribeCrossAccountAccessRoleResponse
    _$DescribeCrossAccountAccessRoleResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeCrossAccountAccessRoleResponse(
    registeredAt: const UnixDateTimeConverter().fromJson(json['registeredAt']),
    roleArn: json['roleArn'] as String,
    valid: json['valid'] as bool,
  );
}

DescribeExclusionsResponse _$DescribeExclusionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeExclusionsResponse(
    exclusions: (json['exclusions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Exclusion.fromJson(e as Map<String, dynamic>)),
    ),
    failedItems: (json['failedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : FailedItemDetails.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

DescribeFindingsResponse _$DescribeFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFindingsResponse(
    failedItems: (json['failedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : FailedItemDetails.fromJson(e as Map<String, dynamic>)),
    ),
    findings: (json['findings'] as List)
        ?.map((e) =>
            e == null ? null : Finding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeResourceGroupsResponse _$DescribeResourceGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeResourceGroupsResponse(
    failedItems: (json['failedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : FailedItemDetails.fromJson(e as Map<String, dynamic>)),
    ),
    resourceGroups: (json['resourceGroups'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeRulesPackagesResponse _$DescribeRulesPackagesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRulesPackagesResponse(
    failedItems: (json['failedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : FailedItemDetails.fromJson(e as Map<String, dynamic>)),
    ),
    rulesPackages: (json['rulesPackages'] as List)
        ?.map((e) =>
            e == null ? null : RulesPackage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DurationRangeToJson(DurationRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxSeconds', instance.maxSeconds);
  writeNotNull('minSeconds', instance.minSeconds);
  return val;
}

EventSubscription _$EventSubscriptionFromJson(Map<String, dynamic> json) {
  return EventSubscription(
    event: _$enumDecodeNullable(_$InspectorEventEnumMap, json['event']),
    subscribedAt: const UnixDateTimeConverter().fromJson(json['subscribedAt']),
  );
}

Exclusion _$ExclusionFromJson(Map<String, dynamic> json) {
  return Exclusion(
    arn: json['arn'] as String,
    description: json['description'] as String,
    recommendation: json['recommendation'] as String,
    scopes: (json['scopes'] as List)
        ?.map(
            (e) => e == null ? null : Scope.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ExclusionPreview _$ExclusionPreviewFromJson(Map<String, dynamic> json) {
  return ExclusionPreview(
    description: json['description'] as String,
    recommendation: json['recommendation'] as String,
    scopes: (json['scopes'] as List)
        ?.map(
            (e) => e == null ? null : Scope.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

FailedItemDetails _$FailedItemDetailsFromJson(Map<String, dynamic> json) {
  return FailedItemDetails(
    failureCode:
        _$enumDecodeNullable(_$FailedItemErrorCodeEnumMap, json['failureCode']),
    retryable: json['retryable'] as bool,
  );
}

const _$FailedItemErrorCodeEnumMap = {
  FailedItemErrorCode.invalidArn: 'INVALID_ARN',
  FailedItemErrorCode.duplicateArn: 'DUPLICATE_ARN',
  FailedItemErrorCode.itemDoesNotExist: 'ITEM_DOES_NOT_EXIST',
  FailedItemErrorCode.accessDenied: 'ACCESS_DENIED',
  FailedItemErrorCode.limitExceeded: 'LIMIT_EXCEEDED',
  FailedItemErrorCode.internalError: 'INTERNAL_ERROR',
};

Finding _$FindingFromJson(Map<String, dynamic> json) {
  return Finding(
    arn: json['arn'] as String,
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['updatedAt']),
    userAttributes: (json['userAttributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    assetAttributes: json['assetAttributes'] == null
        ? null
        : AssetAttributes.fromJson(
            json['assetAttributes'] as Map<String, dynamic>),
    assetType: _$enumDecodeNullable(_$AssetTypeEnumMap, json['assetType']),
    confidence: json['confidence'] as int,
    description: json['description'] as String,
    id: json['id'] as String,
    indicatorOfCompromise: json['indicatorOfCompromise'] as bool,
    numericSeverity: (json['numericSeverity'] as num)?.toDouble(),
    recommendation: json['recommendation'] as String,
    schemaVersion: json['schemaVersion'] as int,
    service: json['service'] as String,
    serviceAttributes: json['serviceAttributes'] == null
        ? null
        : InspectorServiceAttributes.fromJson(
            json['serviceAttributes'] as Map<String, dynamic>),
    severity: _$enumDecodeNullable(_$SeverityEnumMap, json['severity']),
    title: json['title'] as String,
  );
}

const _$AssetTypeEnumMap = {
  AssetType.ec2Instance: 'ec2-instance',
};

Map<String, dynamic> _$FindingFilterToJson(FindingFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('agentIds', instance.agentIds);
  writeNotNull(
      'attributes', instance.attributes?.map((e) => e?.toJson())?.toList());
  writeNotNull('autoScalingGroups', instance.autoScalingGroups);
  writeNotNull('creationTimeRange', instance.creationTimeRange?.toJson());
  writeNotNull('ruleNames', instance.ruleNames);
  writeNotNull('rulesPackageArns', instance.rulesPackageArns);
  writeNotNull('severities',
      instance.severities?.map((e) => _$SeverityEnumMap[e])?.toList());
  writeNotNull('userAttributes',
      instance.userAttributes?.map((e) => e?.toJson())?.toList());
  return val;
}

GetAssessmentReportResponse _$GetAssessmentReportResponseFromJson(
    Map<String, dynamic> json) {
  return GetAssessmentReportResponse(
    status: _$enumDecodeNullable(_$ReportStatusEnumMap, json['status']),
    url: json['url'] as String,
  );
}

const _$ReportStatusEnumMap = {
  ReportStatus.workInProgress: 'WORK_IN_PROGRESS',
  ReportStatus.failed: 'FAILED',
  ReportStatus.completed: 'COMPLETED',
};

GetExclusionsPreviewResponse _$GetExclusionsPreviewResponseFromJson(
    Map<String, dynamic> json) {
  return GetExclusionsPreviewResponse(
    previewStatus:
        _$enumDecodeNullable(_$PreviewStatusEnumMap, json['previewStatus']),
    exclusionPreviews: (json['exclusionPreviews'] as List)
        ?.map((e) => e == null
            ? null
            : ExclusionPreview.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

const _$PreviewStatusEnumMap = {
  PreviewStatus.workInProgress: 'WORK_IN_PROGRESS',
  PreviewStatus.completed: 'COMPLETED',
};

GetTelemetryMetadataResponse _$GetTelemetryMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return GetTelemetryMetadataResponse(
    telemetryMetadata: (json['telemetryMetadata'] as List)
        ?.map((e) => e == null
            ? null
            : TelemetryMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

InspectorServiceAttributes _$InspectorServiceAttributesFromJson(
    Map<String, dynamic> json) {
  return InspectorServiceAttributes(
    schemaVersion: json['schemaVersion'] as int,
    assessmentRunArn: json['assessmentRunArn'] as String,
    rulesPackageArn: json['rulesPackageArn'] as String,
  );
}

ListAssessmentRunAgentsResponse _$ListAssessmentRunAgentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssessmentRunAgentsResponse(
    assessmentRunAgents: (json['assessmentRunAgents'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentRunAgent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssessmentRunsResponse _$ListAssessmentRunsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssessmentRunsResponse(
    assessmentRunArns:
        (json['assessmentRunArns'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssessmentTargetsResponse _$ListAssessmentTargetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssessmentTargetsResponse(
    assessmentTargetArns: (json['assessmentTargetArns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssessmentTemplatesResponse _$ListAssessmentTemplatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssessmentTemplatesResponse(
    assessmentTemplateArns: (json['assessmentTemplateArns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListEventSubscriptionsResponse _$ListEventSubscriptionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEventSubscriptionsResponse(
    subscriptions: (json['subscriptions'] as List)
        ?.map((e) =>
            e == null ? null : Subscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListExclusionsResponse _$ListExclusionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListExclusionsResponse(
    exclusionArns:
        (json['exclusionArns'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListFindingsResponse _$ListFindingsResponseFromJson(Map<String, dynamic> json) {
  return ListFindingsResponse(
    findingArns:
        (json['findingArns'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListRulesPackagesResponse _$ListRulesPackagesResponseFromJson(
    Map<String, dynamic> json) {
  return ListRulesPackagesResponse(
    rulesPackageArns:
        (json['rulesPackageArns'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NetworkInterface _$NetworkInterfaceFromJson(Map<String, dynamic> json) {
  return NetworkInterface(
    ipv6Addresses:
        (json['ipv6Addresses'] as List)?.map((e) => e as String)?.toList(),
    networkInterfaceId: json['networkInterfaceId'] as String,
    privateDnsName: json['privateDnsName'] as String,
    privateIpAddress: json['privateIpAddress'] as String,
    privateIpAddresses: (json['privateIpAddresses'] as List)
        ?.map((e) =>
            e == null ? null : PrivateIp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    publicDnsName: json['publicDnsName'] as String,
    publicIp: json['publicIp'] as String,
    securityGroups: (json['securityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : SecurityGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subnetId: json['subnetId'] as String,
    vpcId: json['vpcId'] as String,
  );
}

PreviewAgentsResponse _$PreviewAgentsResponseFromJson(
    Map<String, dynamic> json) {
  return PreviewAgentsResponse(
    agentPreviews: (json['agentPreviews'] as List)
        ?.map((e) =>
            e == null ? null : AgentPreview.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

PrivateIp _$PrivateIpFromJson(Map<String, dynamic> json) {
  return PrivateIp(
    privateDnsName: json['privateDnsName'] as String,
    privateIpAddress: json['privateIpAddress'] as String,
  );
}

RemoveAttributesFromFindingsResponse
    _$RemoveAttributesFromFindingsResponseFromJson(Map<String, dynamic> json) {
  return RemoveAttributesFromFindingsResponse(
    failedItems: (json['failedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : FailedItemDetails.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

ResourceGroup _$ResourceGroupFromJson(Map<String, dynamic> json) {
  return ResourceGroup(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    tags: (json['tags'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceGroupTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ResourceGroupTag _$ResourceGroupTagFromJson(Map<String, dynamic> json) {
  return ResourceGroupTag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ResourceGroupTagToJson(ResourceGroupTag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

RulesPackage _$RulesPackageFromJson(Map<String, dynamic> json) {
  return RulesPackage(
    arn: json['arn'] as String,
    name: json['name'] as String,
    provider: json['provider'] as String,
    version: json['version'] as String,
    description: json['description'] as String,
  );
}

Scope _$ScopeFromJson(Map<String, dynamic> json) {
  return Scope(
    key: _$enumDecodeNullable(_$ScopeTypeEnumMap, json['key']),
    value: json['value'] as String,
  );
}

const _$ScopeTypeEnumMap = {
  ScopeType.instanceId: 'INSTANCE_ID',
  ScopeType.rulesPackageArn: 'RULES_PACKAGE_ARN',
};

SecurityGroup _$SecurityGroupFromJson(Map<String, dynamic> json) {
  return SecurityGroup(
    groupId: json['groupId'] as String,
    groupName: json['groupName'] as String,
  );
}

StartAssessmentRunResponse _$StartAssessmentRunResponseFromJson(
    Map<String, dynamic> json) {
  return StartAssessmentRunResponse(
    assessmentRunArn: json['assessmentRunArn'] as String,
  );
}

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
    eventSubscriptions: (json['eventSubscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : EventSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceArn: json['resourceArn'] as String,
    topicArn: json['topicArn'] as String,
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

TelemetryMetadata _$TelemetryMetadataFromJson(Map<String, dynamic> json) {
  return TelemetryMetadata(
    count: json['count'] as int,
    messageType: json['messageType'] as String,
    dataSize: json['dataSize'] as int,
  );
}

Map<String, dynamic> _$TimestampRangeToJson(TimestampRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'beginDate', const UnixDateTimeConverter().toJson(instance.beginDate));
  writeNotNull(
      'endDate', const UnixDateTimeConverter().toJson(instance.endDate));
  return val;
}
