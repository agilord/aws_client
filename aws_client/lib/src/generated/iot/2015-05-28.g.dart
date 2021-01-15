// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-05-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbortConfig _$AbortConfigFromJson(Map<String, dynamic> json) {
  return AbortConfig(
    criteriaList: (json['criteriaList'] as List)
        ?.map((e) => e == null
            ? null
            : AbortCriteria.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AbortConfigToJson(AbortConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'criteriaList', instance.criteriaList?.map((e) => e?.toJson())?.toList());
  return val;
}

AbortCriteria _$AbortCriteriaFromJson(Map<String, dynamic> json) {
  return AbortCriteria(
    action: _$enumDecodeNullable(_$AbortActionEnumMap, json['action']),
    failureType: _$enumDecodeNullable(
        _$JobExecutionFailureTypeEnumMap, json['failureType']),
    minNumberOfExecutedThings: json['minNumberOfExecutedThings'] as int,
    thresholdPercentage: (json['thresholdPercentage'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AbortCriteriaToJson(AbortCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('action', _$AbortActionEnumMap[instance.action]);
  writeNotNull(
      'failureType', _$JobExecutionFailureTypeEnumMap[instance.failureType]);
  writeNotNull('minNumberOfExecutedThings', instance.minNumberOfExecutedThings);
  writeNotNull('thresholdPercentage', instance.thresholdPercentage);
  return val;
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

const _$AbortActionEnumMap = {
  AbortAction.cancel: 'CANCEL',
};

const _$JobExecutionFailureTypeEnumMap = {
  JobExecutionFailureType.failed: 'FAILED',
  JobExecutionFailureType.rejected: 'REJECTED',
  JobExecutionFailureType.timedOut: 'TIMED_OUT',
  JobExecutionFailureType.all: 'ALL',
};

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    cloudwatchAlarm: json['cloudwatchAlarm'] == null
        ? null
        : CloudwatchAlarmAction.fromJson(
            json['cloudwatchAlarm'] as Map<String, dynamic>),
    cloudwatchLogs: json['cloudwatchLogs'] == null
        ? null
        : CloudwatchLogsAction.fromJson(
            json['cloudwatchLogs'] as Map<String, dynamic>),
    cloudwatchMetric: json['cloudwatchMetric'] == null
        ? null
        : CloudwatchMetricAction.fromJson(
            json['cloudwatchMetric'] as Map<String, dynamic>),
    dynamoDB: json['dynamoDB'] == null
        ? null
        : DynamoDBAction.fromJson(json['dynamoDB'] as Map<String, dynamic>),
    dynamoDBv2: json['dynamoDBv2'] == null
        ? null
        : DynamoDBv2Action.fromJson(json['dynamoDBv2'] as Map<String, dynamic>),
    elasticsearch: json['elasticsearch'] == null
        ? null
        : ElasticsearchAction.fromJson(
            json['elasticsearch'] as Map<String, dynamic>),
    firehose: json['firehose'] == null
        ? null
        : FirehoseAction.fromJson(json['firehose'] as Map<String, dynamic>),
    http: json['http'] == null
        ? null
        : HttpAction.fromJson(json['http'] as Map<String, dynamic>),
    iotAnalytics: json['iotAnalytics'] == null
        ? null
        : IotAnalyticsAction.fromJson(
            json['iotAnalytics'] as Map<String, dynamic>),
    iotEvents: json['iotEvents'] == null
        ? null
        : IotEventsAction.fromJson(json['iotEvents'] as Map<String, dynamic>),
    iotSiteWise: json['iotSiteWise'] == null
        ? null
        : IotSiteWiseAction.fromJson(
            json['iotSiteWise'] as Map<String, dynamic>),
    kafka: json['kafka'] == null
        ? null
        : KafkaAction.fromJson(json['kafka'] as Map<String, dynamic>),
    kinesis: json['kinesis'] == null
        ? null
        : KinesisAction.fromJson(json['kinesis'] as Map<String, dynamic>),
    lambda: json['lambda'] == null
        ? null
        : LambdaAction.fromJson(json['lambda'] as Map<String, dynamic>),
    republish: json['republish'] == null
        ? null
        : RepublishAction.fromJson(json['republish'] as Map<String, dynamic>),
    s3: json['s3'] == null
        ? null
        : S3Action.fromJson(json['s3'] as Map<String, dynamic>),
    salesforce: json['salesforce'] == null
        ? null
        : SalesforceAction.fromJson(json['salesforce'] as Map<String, dynamic>),
    sns: json['sns'] == null
        ? null
        : SnsAction.fromJson(json['sns'] as Map<String, dynamic>),
    sqs: json['sqs'] == null
        ? null
        : SqsAction.fromJson(json['sqs'] as Map<String, dynamic>),
    stepFunctions: json['stepFunctions'] == null
        ? null
        : StepFunctionsAction.fromJson(
            json['stepFunctions'] as Map<String, dynamic>),
    timestream: json['timestream'] == null
        ? null
        : TimestreamAction.fromJson(json['timestream'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cloudwatchAlarm', instance.cloudwatchAlarm?.toJson());
  writeNotNull('cloudwatchLogs', instance.cloudwatchLogs?.toJson());
  writeNotNull('cloudwatchMetric', instance.cloudwatchMetric?.toJson());
  writeNotNull('dynamoDB', instance.dynamoDB?.toJson());
  writeNotNull('dynamoDBv2', instance.dynamoDBv2?.toJson());
  writeNotNull('elasticsearch', instance.elasticsearch?.toJson());
  writeNotNull('firehose', instance.firehose?.toJson());
  writeNotNull('http', instance.http?.toJson());
  writeNotNull('iotAnalytics', instance.iotAnalytics?.toJson());
  writeNotNull('iotEvents', instance.iotEvents?.toJson());
  writeNotNull('iotSiteWise', instance.iotSiteWise?.toJson());
  writeNotNull('kafka', instance.kafka?.toJson());
  writeNotNull('kinesis', instance.kinesis?.toJson());
  writeNotNull('lambda', instance.lambda?.toJson());
  writeNotNull('republish', instance.republish?.toJson());
  writeNotNull('s3', instance.s3?.toJson());
  writeNotNull('salesforce', instance.salesforce?.toJson());
  writeNotNull('sns', instance.sns?.toJson());
  writeNotNull('sqs', instance.sqs?.toJson());
  writeNotNull('stepFunctions', instance.stepFunctions?.toJson());
  writeNotNull('timestream', instance.timestream?.toJson());
  return val;
}

ActiveViolation _$ActiveViolationFromJson(Map<String, dynamic> json) {
  return ActiveViolation(
    behavior: json['behavior'] == null
        ? null
        : Behavior.fromJson(json['behavior'] as Map<String, dynamic>),
    lastViolationTime:
        const UnixDateTimeConverter().fromJson(json['lastViolationTime']),
    lastViolationValue: json['lastViolationValue'] == null
        ? null
        : MetricValue.fromJson(
            json['lastViolationValue'] as Map<String, dynamic>),
    securityProfileName: json['securityProfileName'] as String,
    thingName: json['thingName'] as String,
    violationEventAdditionalInfo: json['violationEventAdditionalInfo'] == null
        ? null
        : ViolationEventAdditionalInfo.fromJson(
            json['violationEventAdditionalInfo'] as Map<String, dynamic>),
    violationId: json['violationId'] as String,
    violationStartTime:
        const UnixDateTimeConverter().fromJson(json['violationStartTime']),
  );
}

AddThingToBillingGroupResponse _$AddThingToBillingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return AddThingToBillingGroupResponse();
}

AddThingToThingGroupResponse _$AddThingToThingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return AddThingToThingGroupResponse();
}

AddThingsToThingGroupParams _$AddThingsToThingGroupParamsFromJson(
    Map<String, dynamic> json) {
  return AddThingsToThingGroupParams(
    thingGroupNames:
        (json['thingGroupNames'] as List)?.map((e) => e as String)?.toList(),
    overrideDynamicGroups: json['overrideDynamicGroups'] as bool,
  );
}

Map<String, dynamic> _$AddThingsToThingGroupParamsToJson(
    AddThingsToThingGroupParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thingGroupNames', instance.thingGroupNames);
  writeNotNull('overrideDynamicGroups', instance.overrideDynamicGroups);
  return val;
}

AlertTarget _$AlertTargetFromJson(Map<String, dynamic> json) {
  return AlertTarget(
    alertTargetArn: json['alertTargetArn'] as String,
    roleArn: json['roleArn'] as String,
  );
}

Map<String, dynamic> _$AlertTargetToJson(AlertTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alertTargetArn', instance.alertTargetArn);
  writeNotNull('roleArn', instance.roleArn);
  return val;
}

Allowed _$AllowedFromJson(Map<String, dynamic> json) {
  return Allowed(
    policies: (json['policies'] as List)
        ?.map((e) =>
            e == null ? null : Policy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AssetPropertyTimestamp _$AssetPropertyTimestampFromJson(
    Map<String, dynamic> json) {
  return AssetPropertyTimestamp(
    timeInSeconds: json['timeInSeconds'] as String,
    offsetInNanos: json['offsetInNanos'] as String,
  );
}

Map<String, dynamic> _$AssetPropertyTimestampToJson(
    AssetPropertyTimestamp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timeInSeconds', instance.timeInSeconds);
  writeNotNull('offsetInNanos', instance.offsetInNanos);
  return val;
}

AssetPropertyValue _$AssetPropertyValueFromJson(Map<String, dynamic> json) {
  return AssetPropertyValue(
    timestamp: json['timestamp'] == null
        ? null
        : AssetPropertyTimestamp.fromJson(
            json['timestamp'] as Map<String, dynamic>),
    value: json['value'] == null
        ? null
        : AssetPropertyVariant.fromJson(json['value'] as Map<String, dynamic>),
    quality: json['quality'] as String,
  );
}

Map<String, dynamic> _$AssetPropertyValueToJson(AssetPropertyValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timestamp', instance.timestamp?.toJson());
  writeNotNull('value', instance.value?.toJson());
  writeNotNull('quality', instance.quality);
  return val;
}

AssetPropertyVariant _$AssetPropertyVariantFromJson(Map<String, dynamic> json) {
  return AssetPropertyVariant(
    booleanValue: json['booleanValue'] as String,
    doubleValue: json['doubleValue'] as String,
    integerValue: json['integerValue'] as String,
    stringValue: json['stringValue'] as String,
  );
}

Map<String, dynamic> _$AssetPropertyVariantToJson(
    AssetPropertyVariant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('booleanValue', instance.booleanValue);
  writeNotNull('doubleValue', instance.doubleValue);
  writeNotNull('integerValue', instance.integerValue);
  writeNotNull('stringValue', instance.stringValue);
  return val;
}

AssociateTargetsWithJobResponse _$AssociateTargetsWithJobResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateTargetsWithJobResponse(
    description: json['description'] as String,
    jobArn: json['jobArn'] as String,
    jobId: json['jobId'] as String,
  );
}

AttachSecurityProfileResponse _$AttachSecurityProfileResponseFromJson(
    Map<String, dynamic> json) {
  return AttachSecurityProfileResponse();
}

AttachThingPrincipalResponse _$AttachThingPrincipalResponseFromJson(
    Map<String, dynamic> json) {
  return AttachThingPrincipalResponse();
}

AttributePayload _$AttributePayloadFromJson(Map<String, dynamic> json) {
  return AttributePayload(
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    merge: json['merge'] as bool,
  );
}

Map<String, dynamic> _$AttributePayloadToJson(AttributePayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributes', instance.attributes);
  writeNotNull('merge', instance.merge);
  return val;
}

AuditCheckConfiguration _$AuditCheckConfigurationFromJson(
    Map<String, dynamic> json) {
  return AuditCheckConfiguration(
    enabled: json['enabled'] as bool,
  );
}

Map<String, dynamic> _$AuditCheckConfigurationToJson(
    AuditCheckConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  return val;
}

AuditCheckDetails _$AuditCheckDetailsFromJson(Map<String, dynamic> json) {
  return AuditCheckDetails(
    checkCompliant: json['checkCompliant'] as bool,
    checkRunStatus: _$enumDecodeNullable(
        _$AuditCheckRunStatusEnumMap, json['checkRunStatus']),
    errorCode: json['errorCode'] as String,
    message: json['message'] as String,
    nonCompliantResourcesCount: json['nonCompliantResourcesCount'] as int,
    suppressedNonCompliantResourcesCount:
        json['suppressedNonCompliantResourcesCount'] as int,
    totalResourcesCount: json['totalResourcesCount'] as int,
  );
}

const _$AuditCheckRunStatusEnumMap = {
  AuditCheckRunStatus.inProgress: 'IN_PROGRESS',
  AuditCheckRunStatus.waitingForDataCollection: 'WAITING_FOR_DATA_COLLECTION',
  AuditCheckRunStatus.canceled: 'CANCELED',
  AuditCheckRunStatus.completedCompliant: 'COMPLETED_COMPLIANT',
  AuditCheckRunStatus.completedNonCompliant: 'COMPLETED_NON_COMPLIANT',
  AuditCheckRunStatus.failed: 'FAILED',
};

AuditFinding _$AuditFindingFromJson(Map<String, dynamic> json) {
  return AuditFinding(
    checkName: json['checkName'] as String,
    findingId: json['findingId'] as String,
    findingTime: const UnixDateTimeConverter().fromJson(json['findingTime']),
    isSuppressed: json['isSuppressed'] as bool,
    nonCompliantResource: json['nonCompliantResource'] == null
        ? null
        : NonCompliantResource.fromJson(
            json['nonCompliantResource'] as Map<String, dynamic>),
    reasonForNonCompliance: json['reasonForNonCompliance'] as String,
    reasonForNonComplianceCode: json['reasonForNonComplianceCode'] as String,
    relatedResources: (json['relatedResources'] as List)
        ?.map((e) => e == null
            ? null
            : RelatedResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    severity:
        _$enumDecodeNullable(_$AuditFindingSeverityEnumMap, json['severity']),
    taskId: json['taskId'] as String,
    taskStartTime:
        const UnixDateTimeConverter().fromJson(json['taskStartTime']),
  );
}

const _$AuditFindingSeverityEnumMap = {
  AuditFindingSeverity.critical: 'CRITICAL',
  AuditFindingSeverity.high: 'HIGH',
  AuditFindingSeverity.medium: 'MEDIUM',
  AuditFindingSeverity.low: 'LOW',
};

AuditMitigationActionExecutionMetadata
    _$AuditMitigationActionExecutionMetadataFromJson(
        Map<String, dynamic> json) {
  return AuditMitigationActionExecutionMetadata(
    actionId: json['actionId'] as String,
    actionName: json['actionName'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    errorCode: json['errorCode'] as String,
    findingId: json['findingId'] as String,
    message: json['message'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    status: _$enumDecodeNullable(
        _$AuditMitigationActionsExecutionStatusEnumMap, json['status']),
    taskId: json['taskId'] as String,
  );
}

const _$AuditMitigationActionsExecutionStatusEnumMap = {
  AuditMitigationActionsExecutionStatus.inProgress: 'IN_PROGRESS',
  AuditMitigationActionsExecutionStatus.completed: 'COMPLETED',
  AuditMitigationActionsExecutionStatus.failed: 'FAILED',
  AuditMitigationActionsExecutionStatus.canceled: 'CANCELED',
  AuditMitigationActionsExecutionStatus.skipped: 'SKIPPED',
  AuditMitigationActionsExecutionStatus.pending: 'PENDING',
};

AuditMitigationActionsTaskMetadata _$AuditMitigationActionsTaskMetadataFromJson(
    Map<String, dynamic> json) {
  return AuditMitigationActionsTaskMetadata(
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    taskId: json['taskId'] as String,
    taskStatus: _$enumDecodeNullable(
        _$AuditMitigationActionsTaskStatusEnumMap, json['taskStatus']),
  );
}

const _$AuditMitigationActionsTaskStatusEnumMap = {
  AuditMitigationActionsTaskStatus.inProgress: 'IN_PROGRESS',
  AuditMitigationActionsTaskStatus.completed: 'COMPLETED',
  AuditMitigationActionsTaskStatus.failed: 'FAILED',
  AuditMitigationActionsTaskStatus.canceled: 'CANCELED',
};

AuditMitigationActionsTaskTarget _$AuditMitigationActionsTaskTargetFromJson(
    Map<String, dynamic> json) {
  return AuditMitigationActionsTaskTarget(
    auditCheckToReasonCodeFilter:
        (json['auditCheckToReasonCodeFilter'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    auditTaskId: json['auditTaskId'] as String,
    findingIds: (json['findingIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AuditMitigationActionsTaskTargetToJson(
    AuditMitigationActionsTaskTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'auditCheckToReasonCodeFilter', instance.auditCheckToReasonCodeFilter);
  writeNotNull('auditTaskId', instance.auditTaskId);
  writeNotNull('findingIds', instance.findingIds);
  return val;
}

AuditNotificationTarget _$AuditNotificationTargetFromJson(
    Map<String, dynamic> json) {
  return AuditNotificationTarget(
    enabled: json['enabled'] as bool,
    roleArn: json['roleArn'] as String,
    targetArn: json['targetArn'] as String,
  );
}

Map<String, dynamic> _$AuditNotificationTargetToJson(
    AuditNotificationTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('targetArn', instance.targetArn);
  return val;
}

AuditSuppression _$AuditSuppressionFromJson(Map<String, dynamic> json) {
  return AuditSuppression(
    checkName: json['checkName'] as String,
    resourceIdentifier: json['resourceIdentifier'] == null
        ? null
        : ResourceIdentifier.fromJson(
            json['resourceIdentifier'] as Map<String, dynamic>),
    description: json['description'] as String,
    expirationDate:
        const UnixDateTimeConverter().fromJson(json['expirationDate']),
    suppressIndefinitely: json['suppressIndefinitely'] as bool,
  );
}

AuditTaskMetadata _$AuditTaskMetadataFromJson(Map<String, dynamic> json) {
  return AuditTaskMetadata(
    taskId: json['taskId'] as String,
    taskStatus:
        _$enumDecodeNullable(_$AuditTaskStatusEnumMap, json['taskStatus']),
    taskType: _$enumDecodeNullable(_$AuditTaskTypeEnumMap, json['taskType']),
  );
}

const _$AuditTaskStatusEnumMap = {
  AuditTaskStatus.inProgress: 'IN_PROGRESS',
  AuditTaskStatus.completed: 'COMPLETED',
  AuditTaskStatus.failed: 'FAILED',
  AuditTaskStatus.canceled: 'CANCELED',
};

const _$AuditTaskTypeEnumMap = {
  AuditTaskType.onDemandAuditTask: 'ON_DEMAND_AUDIT_TASK',
  AuditTaskType.scheduledAuditTask: 'SCHEDULED_AUDIT_TASK',
};

AuthInfo _$AuthInfoFromJson(Map<String, dynamic> json) {
  return AuthInfo(
    resources: (json['resources'] as List)?.map((e) => e as String)?.toList(),
    actionType: _$enumDecodeNullable(_$ActionTypeEnumMap, json['actionType']),
  );
}

Map<String, dynamic> _$AuthInfoToJson(AuthInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resources', instance.resources);
  writeNotNull('actionType', _$ActionTypeEnumMap[instance.actionType]);
  return val;
}

const _$ActionTypeEnumMap = {
  ActionType.publish: 'PUBLISH',
  ActionType.subscribe: 'SUBSCRIBE',
  ActionType.receive: 'RECEIVE',
  ActionType.connect: 'CONNECT',
};

AuthResult _$AuthResultFromJson(Map<String, dynamic> json) {
  return AuthResult(
    allowed: json['allowed'] == null
        ? null
        : Allowed.fromJson(json['allowed'] as Map<String, dynamic>),
    authDecision:
        _$enumDecodeNullable(_$AuthDecisionEnumMap, json['authDecision']),
    authInfo: json['authInfo'] == null
        ? null
        : AuthInfo.fromJson(json['authInfo'] as Map<String, dynamic>),
    denied: json['denied'] == null
        ? null
        : Denied.fromJson(json['denied'] as Map<String, dynamic>),
    missingContextValues: (json['missingContextValues'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

const _$AuthDecisionEnumMap = {
  AuthDecision.allowed: 'ALLOWED',
  AuthDecision.explicitDeny: 'EXPLICIT_DENY',
  AuthDecision.implicitDeny: 'IMPLICIT_DENY',
};

AuthorizerConfig _$AuthorizerConfigFromJson(Map<String, dynamic> json) {
  return AuthorizerConfig(
    allowAuthorizerOverride: json['allowAuthorizerOverride'] as bool,
    defaultAuthorizerName: json['defaultAuthorizerName'] as String,
  );
}

Map<String, dynamic> _$AuthorizerConfigToJson(AuthorizerConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allowAuthorizerOverride', instance.allowAuthorizerOverride);
  writeNotNull('defaultAuthorizerName', instance.defaultAuthorizerName);
  return val;
}

AuthorizerDescription _$AuthorizerDescriptionFromJson(
    Map<String, dynamic> json) {
  return AuthorizerDescription(
    authorizerArn: json['authorizerArn'] as String,
    authorizerFunctionArn: json['authorizerFunctionArn'] as String,
    authorizerName: json['authorizerName'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    signingDisabled: json['signingDisabled'] as bool,
    status: _$enumDecodeNullable(_$AuthorizerStatusEnumMap, json['status']),
    tokenKeyName: json['tokenKeyName'] as String,
    tokenSigningPublicKeys:
        (json['tokenSigningPublicKeys'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$AuthorizerStatusEnumMap = {
  AuthorizerStatus.active: 'ACTIVE',
  AuthorizerStatus.inactive: 'INACTIVE',
};

AuthorizerSummary _$AuthorizerSummaryFromJson(Map<String, dynamic> json) {
  return AuthorizerSummary(
    authorizerArn: json['authorizerArn'] as String,
    authorizerName: json['authorizerName'] as String,
  );
}

Map<String, dynamic> _$AwsJobAbortConfigToJson(AwsJobAbortConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('abortCriteriaList',
      instance.abortCriteriaList?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$AwsJobAbortCriteriaToJson(AwsJobAbortCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'action', _$AwsJobAbortCriteriaAbortActionEnumMap[instance.action]);
  writeNotNull('failureType',
      _$AwsJobAbortCriteriaFailureTypeEnumMap[instance.failureType]);
  writeNotNull('minNumberOfExecutedThings', instance.minNumberOfExecutedThings);
  writeNotNull('thresholdPercentage', instance.thresholdPercentage);
  return val;
}

const _$AwsJobAbortCriteriaAbortActionEnumMap = {
  AwsJobAbortCriteriaAbortAction.cancel: 'CANCEL',
};

const _$AwsJobAbortCriteriaFailureTypeEnumMap = {
  AwsJobAbortCriteriaFailureType.failed: 'FAILED',
  AwsJobAbortCriteriaFailureType.rejected: 'REJECTED',
  AwsJobAbortCriteriaFailureType.timedOut: 'TIMED_OUT',
  AwsJobAbortCriteriaFailureType.all: 'ALL',
};

AwsJobExecutionsRolloutConfig _$AwsJobExecutionsRolloutConfigFromJson(
    Map<String, dynamic> json) {
  return AwsJobExecutionsRolloutConfig(
    exponentialRate: json['exponentialRate'] == null
        ? null
        : AwsJobExponentialRolloutRate.fromJson(
            json['exponentialRate'] as Map<String, dynamic>),
    maximumPerMinute: json['maximumPerMinute'] as int,
  );
}

Map<String, dynamic> _$AwsJobExecutionsRolloutConfigToJson(
    AwsJobExecutionsRolloutConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exponentialRate', instance.exponentialRate?.toJson());
  writeNotNull('maximumPerMinute', instance.maximumPerMinute);
  return val;
}

AwsJobExponentialRolloutRate _$AwsJobExponentialRolloutRateFromJson(
    Map<String, dynamic> json) {
  return AwsJobExponentialRolloutRate(
    baseRatePerMinute: json['baseRatePerMinute'] as int,
    incrementFactor: (json['incrementFactor'] as num)?.toDouble(),
    rateIncreaseCriteria: json['rateIncreaseCriteria'] == null
        ? null
        : AwsJobRateIncreaseCriteria.fromJson(
            json['rateIncreaseCriteria'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsJobExponentialRolloutRateToJson(
    AwsJobExponentialRolloutRate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseRatePerMinute', instance.baseRatePerMinute);
  writeNotNull('incrementFactor', instance.incrementFactor);
  writeNotNull('rateIncreaseCriteria', instance.rateIncreaseCriteria?.toJson());
  return val;
}

AwsJobPresignedUrlConfig _$AwsJobPresignedUrlConfigFromJson(
    Map<String, dynamic> json) {
  return AwsJobPresignedUrlConfig(
    expiresInSec: json['expiresInSec'] as int,
  );
}

Map<String, dynamic> _$AwsJobPresignedUrlConfigToJson(
    AwsJobPresignedUrlConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expiresInSec', instance.expiresInSec);
  return val;
}

AwsJobRateIncreaseCriteria _$AwsJobRateIncreaseCriteriaFromJson(
    Map<String, dynamic> json) {
  return AwsJobRateIncreaseCriteria(
    numberOfNotifiedThings: json['numberOfNotifiedThings'] as int,
    numberOfSucceededThings: json['numberOfSucceededThings'] as int,
  );
}

Map<String, dynamic> _$AwsJobRateIncreaseCriteriaToJson(
    AwsJobRateIncreaseCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('numberOfNotifiedThings', instance.numberOfNotifiedThings);
  writeNotNull('numberOfSucceededThings', instance.numberOfSucceededThings);
  return val;
}

Map<String, dynamic> _$AwsJobTimeoutConfigToJson(AwsJobTimeoutConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'inProgressTimeoutInMinutes', instance.inProgressTimeoutInMinutes);
  return val;
}

Behavior _$BehaviorFromJson(Map<String, dynamic> json) {
  return Behavior(
    name: json['name'] as String,
    criteria: json['criteria'] == null
        ? null
        : BehaviorCriteria.fromJson(json['criteria'] as Map<String, dynamic>),
    metric: json['metric'] as String,
    metricDimension: json['metricDimension'] == null
        ? null
        : MetricDimension.fromJson(
            json['metricDimension'] as Map<String, dynamic>),
    suppressAlerts: json['suppressAlerts'] as bool,
  );
}

Map<String, dynamic> _$BehaviorToJson(Behavior instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('criteria', instance.criteria?.toJson());
  writeNotNull('metric', instance.metric);
  writeNotNull('metricDimension', instance.metricDimension?.toJson());
  writeNotNull('suppressAlerts', instance.suppressAlerts);
  return val;
}

BehaviorCriteria _$BehaviorCriteriaFromJson(Map<String, dynamic> json) {
  return BehaviorCriteria(
    comparisonOperator: _$enumDecodeNullable(
        _$ComparisonOperatorEnumMap, json['comparisonOperator']),
    consecutiveDatapointsToAlarm: json['consecutiveDatapointsToAlarm'] as int,
    consecutiveDatapointsToClear: json['consecutiveDatapointsToClear'] as int,
    durationSeconds: json['durationSeconds'] as int,
    mlDetectionConfig: json['mlDetectionConfig'] == null
        ? null
        : MachineLearningDetectionConfig.fromJson(
            json['mlDetectionConfig'] as Map<String, dynamic>),
    statisticalThreshold: json['statisticalThreshold'] == null
        ? null
        : StatisticalThreshold.fromJson(
            json['statisticalThreshold'] as Map<String, dynamic>),
    value: json['value'] == null
        ? null
        : MetricValue.fromJson(json['value'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BehaviorCriteriaToJson(BehaviorCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comparisonOperator',
      _$ComparisonOperatorEnumMap[instance.comparisonOperator]);
  writeNotNull(
      'consecutiveDatapointsToAlarm', instance.consecutiveDatapointsToAlarm);
  writeNotNull(
      'consecutiveDatapointsToClear', instance.consecutiveDatapointsToClear);
  writeNotNull('durationSeconds', instance.durationSeconds);
  writeNotNull('mlDetectionConfig', instance.mlDetectionConfig?.toJson());
  writeNotNull('statisticalThreshold', instance.statisticalThreshold?.toJson());
  writeNotNull('value', instance.value?.toJson());
  return val;
}

const _$ComparisonOperatorEnumMap = {
  ComparisonOperator.lessThan: 'less-than',
  ComparisonOperator.lessThanEquals: 'less-than-equals',
  ComparisonOperator.greaterThan: 'greater-than',
  ComparisonOperator.greaterThanEquals: 'greater-than-equals',
  ComparisonOperator.inCidrSet: 'in-cidr-set',
  ComparisonOperator.notInCidrSet: 'not-in-cidr-set',
  ComparisonOperator.inPortSet: 'in-port-set',
  ComparisonOperator.notInPortSet: 'not-in-port-set',
  ComparisonOperator.inSet: 'in-set',
  ComparisonOperator.notInSet: 'not-in-set',
};

BehaviorModelTrainingSummary _$BehaviorModelTrainingSummaryFromJson(
    Map<String, dynamic> json) {
  return BehaviorModelTrainingSummary(
    behaviorName: json['behaviorName'] as String,
    datapointsCollectionPercentage:
        (json['datapointsCollectionPercentage'] as num)?.toDouble(),
    lastModelRefreshDate:
        const UnixDateTimeConverter().fromJson(json['lastModelRefreshDate']),
    modelStatus:
        _$enumDecodeNullable(_$ModelStatusEnumMap, json['modelStatus']),
    securityProfileName: json['securityProfileName'] as String,
    trainingDataCollectionStartDate: const UnixDateTimeConverter()
        .fromJson(json['trainingDataCollectionStartDate']),
  );
}

const _$ModelStatusEnumMap = {
  ModelStatus.pendingBuild: 'PENDING_BUILD',
  ModelStatus.active: 'ACTIVE',
  ModelStatus.expired: 'EXPIRED',
};

BillingGroupMetadata _$BillingGroupMetadataFromJson(Map<String, dynamic> json) {
  return BillingGroupMetadata(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
  );
}

BillingGroupProperties _$BillingGroupPropertiesFromJson(
    Map<String, dynamic> json) {
  return BillingGroupProperties(
    billingGroupDescription: json['billingGroupDescription'] as String,
  );
}

Map<String, dynamic> _$BillingGroupPropertiesToJson(
    BillingGroupProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('billingGroupDescription', instance.billingGroupDescription);
  return val;
}

CACertificate _$CACertificateFromJson(Map<String, dynamic> json) {
  return CACertificate(
    certificateArn: json['certificateArn'] as String,
    certificateId: json['certificateId'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    status: _$enumDecodeNullable(_$CACertificateStatusEnumMap, json['status']),
  );
}

const _$CACertificateStatusEnumMap = {
  CACertificateStatus.active: 'ACTIVE',
  CACertificateStatus.inactive: 'INACTIVE',
};

CACertificateDescription _$CACertificateDescriptionFromJson(
    Map<String, dynamic> json) {
  return CACertificateDescription(
    autoRegistrationStatus: _$enumDecodeNullable(
        _$AutoRegistrationStatusEnumMap, json['autoRegistrationStatus']),
    certificateArn: json['certificateArn'] as String,
    certificateId: json['certificateId'] as String,
    certificatePem: json['certificatePem'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    customerVersion: json['customerVersion'] as int,
    generationId: json['generationId'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    ownedBy: json['ownedBy'] as String,
    status: _$enumDecodeNullable(_$CACertificateStatusEnumMap, json['status']),
    validity: json['validity'] == null
        ? null
        : CertificateValidity.fromJson(
            json['validity'] as Map<String, dynamic>),
  );
}

const _$AutoRegistrationStatusEnumMap = {
  AutoRegistrationStatus.enable: 'ENABLE',
  AutoRegistrationStatus.disable: 'DISABLE',
};

CancelAuditMitigationActionsTaskResponse
    _$CancelAuditMitigationActionsTaskResponseFromJson(
        Map<String, dynamic> json) {
  return CancelAuditMitigationActionsTaskResponse();
}

CancelAuditTaskResponse _$CancelAuditTaskResponseFromJson(
    Map<String, dynamic> json) {
  return CancelAuditTaskResponse();
}

CancelDetectMitigationActionsTaskResponse
    _$CancelDetectMitigationActionsTaskResponseFromJson(
        Map<String, dynamic> json) {
  return CancelDetectMitigationActionsTaskResponse();
}

CancelJobResponse _$CancelJobResponseFromJson(Map<String, dynamic> json) {
  return CancelJobResponse(
    description: json['description'] as String,
    jobArn: json['jobArn'] as String,
    jobId: json['jobId'] as String,
  );
}

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate(
    certificateArn: json['certificateArn'] as String,
    certificateId: json['certificateId'] as String,
    certificateMode:
        _$enumDecodeNullable(_$CertificateModeEnumMap, json['certificateMode']),
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    status: _$enumDecodeNullable(_$CertificateStatusEnumMap, json['status']),
  );
}

const _$CertificateModeEnumMap = {
  CertificateMode.$default: 'DEFAULT',
  CertificateMode.sniOnly: 'SNI_ONLY',
};

const _$CertificateStatusEnumMap = {
  CertificateStatus.active: 'ACTIVE',
  CertificateStatus.inactive: 'INACTIVE',
  CertificateStatus.revoked: 'REVOKED',
  CertificateStatus.pendingTransfer: 'PENDING_TRANSFER',
  CertificateStatus.registerInactive: 'REGISTER_INACTIVE',
  CertificateStatus.pendingActivation: 'PENDING_ACTIVATION',
};

CertificateDescription _$CertificateDescriptionFromJson(
    Map<String, dynamic> json) {
  return CertificateDescription(
    caCertificateId: json['caCertificateId'] as String,
    certificateArn: json['certificateArn'] as String,
    certificateId: json['certificateId'] as String,
    certificateMode:
        _$enumDecodeNullable(_$CertificateModeEnumMap, json['certificateMode']),
    certificatePem: json['certificatePem'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    customerVersion: json['customerVersion'] as int,
    generationId: json['generationId'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    ownedBy: json['ownedBy'] as String,
    previousOwnedBy: json['previousOwnedBy'] as String,
    status: _$enumDecodeNullable(_$CertificateStatusEnumMap, json['status']),
    transferData: json['transferData'] == null
        ? null
        : TransferData.fromJson(json['transferData'] as Map<String, dynamic>),
    validity: json['validity'] == null
        ? null
        : CertificateValidity.fromJson(
            json['validity'] as Map<String, dynamic>),
  );
}

CertificateValidity _$CertificateValidityFromJson(Map<String, dynamic> json) {
  return CertificateValidity(
    notAfter: const UnixDateTimeConverter().fromJson(json['notAfter']),
    notBefore: const UnixDateTimeConverter().fromJson(json['notBefore']),
  );
}

ClearDefaultAuthorizerResponse _$ClearDefaultAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return ClearDefaultAuthorizerResponse();
}

CloudwatchAlarmAction _$CloudwatchAlarmActionFromJson(
    Map<String, dynamic> json) {
  return CloudwatchAlarmAction(
    alarmName: json['alarmName'] as String,
    roleArn: json['roleArn'] as String,
    stateReason: json['stateReason'] as String,
    stateValue: json['stateValue'] as String,
  );
}

Map<String, dynamic> _$CloudwatchAlarmActionToJson(
    CloudwatchAlarmAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alarmName', instance.alarmName);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('stateReason', instance.stateReason);
  writeNotNull('stateValue', instance.stateValue);
  return val;
}

CloudwatchLogsAction _$CloudwatchLogsActionFromJson(Map<String, dynamic> json) {
  return CloudwatchLogsAction(
    logGroupName: json['logGroupName'] as String,
    roleArn: json['roleArn'] as String,
  );
}

Map<String, dynamic> _$CloudwatchLogsActionToJson(
    CloudwatchLogsAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logGroupName', instance.logGroupName);
  writeNotNull('roleArn', instance.roleArn);
  return val;
}

CloudwatchMetricAction _$CloudwatchMetricActionFromJson(
    Map<String, dynamic> json) {
  return CloudwatchMetricAction(
    metricName: json['metricName'] as String,
    metricNamespace: json['metricNamespace'] as String,
    metricUnit: json['metricUnit'] as String,
    metricValue: json['metricValue'] as String,
    roleArn: json['roleArn'] as String,
    metricTimestamp: json['metricTimestamp'] as String,
  );
}

Map<String, dynamic> _$CloudwatchMetricActionToJson(
    CloudwatchMetricAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metricName', instance.metricName);
  writeNotNull('metricNamespace', instance.metricNamespace);
  writeNotNull('metricUnit', instance.metricUnit);
  writeNotNull('metricValue', instance.metricValue);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('metricTimestamp', instance.metricTimestamp);
  return val;
}

CodeSigning _$CodeSigningFromJson(Map<String, dynamic> json) {
  return CodeSigning(
    awsSignerJobId: json['awsSignerJobId'] as String,
    customCodeSigning: json['customCodeSigning'] == null
        ? null
        : CustomCodeSigning.fromJson(
            json['customCodeSigning'] as Map<String, dynamic>),
    startSigningJobParameter: json['startSigningJobParameter'] == null
        ? null
        : StartSigningJobParameter.fromJson(
            json['startSigningJobParameter'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CodeSigningToJson(CodeSigning instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('awsSignerJobId', instance.awsSignerJobId);
  writeNotNull('customCodeSigning', instance.customCodeSigning?.toJson());
  writeNotNull(
      'startSigningJobParameter', instance.startSigningJobParameter?.toJson());
  return val;
}

CodeSigningCertificateChain _$CodeSigningCertificateChainFromJson(
    Map<String, dynamic> json) {
  return CodeSigningCertificateChain(
    certificateName: json['certificateName'] as String,
    inlineDocument: json['inlineDocument'] as String,
  );
}

Map<String, dynamic> _$CodeSigningCertificateChainToJson(
    CodeSigningCertificateChain instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateName', instance.certificateName);
  writeNotNull('inlineDocument', instance.inlineDocument);
  return val;
}

CodeSigningSignature _$CodeSigningSignatureFromJson(Map<String, dynamic> json) {
  return CodeSigningSignature(
    inlineDocument:
        const Uint8ListConverter().fromJson(json['inlineDocument'] as String),
  );
}

Map<String, dynamic> _$CodeSigningSignatureToJson(
    CodeSigningSignature instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inlineDocument',
      const Uint8ListConverter().toJson(instance.inlineDocument));
  return val;
}

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return Configuration(
    enabled: json['Enabled'] as bool,
  );
}

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

ConfirmTopicRuleDestinationResponse
    _$ConfirmTopicRuleDestinationResponseFromJson(Map<String, dynamic> json) {
  return ConfirmTopicRuleDestinationResponse();
}

CreateAuditSuppressionResponse _$CreateAuditSuppressionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAuditSuppressionResponse();
}

CreateAuthorizerResponse _$CreateAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAuthorizerResponse(
    authorizerArn: json['authorizerArn'] as String,
    authorizerName: json['authorizerName'] as String,
  );
}

CreateBillingGroupResponse _$CreateBillingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateBillingGroupResponse(
    billingGroupArn: json['billingGroupArn'] as String,
    billingGroupId: json['billingGroupId'] as String,
    billingGroupName: json['billingGroupName'] as String,
  );
}

CreateCertificateFromCsrResponse _$CreateCertificateFromCsrResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCertificateFromCsrResponse(
    certificateArn: json['certificateArn'] as String,
    certificateId: json['certificateId'] as String,
    certificatePem: json['certificatePem'] as String,
  );
}

CreateCustomMetricResponse _$CreateCustomMetricResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCustomMetricResponse(
    metricArn: json['metricArn'] as String,
    metricName: json['metricName'] as String,
  );
}

CreateDimensionResponse _$CreateDimensionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDimensionResponse(
    arn: json['arn'] as String,
    name: json['name'] as String,
  );
}

CreateDomainConfigurationResponse _$CreateDomainConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDomainConfigurationResponse(
    domainConfigurationArn: json['domainConfigurationArn'] as String,
    domainConfigurationName: json['domainConfigurationName'] as String,
  );
}

CreateDynamicThingGroupResponse _$CreateDynamicThingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDynamicThingGroupResponse(
    indexName: json['indexName'] as String,
    queryString: json['queryString'] as String,
    queryVersion: json['queryVersion'] as String,
    thingGroupArn: json['thingGroupArn'] as String,
    thingGroupId: json['thingGroupId'] as String,
    thingGroupName: json['thingGroupName'] as String,
  );
}

CreateJobResponse _$CreateJobResponseFromJson(Map<String, dynamic> json) {
  return CreateJobResponse(
    description: json['description'] as String,
    jobArn: json['jobArn'] as String,
    jobId: json['jobId'] as String,
  );
}

CreateKeysAndCertificateResponse _$CreateKeysAndCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateKeysAndCertificateResponse(
    certificateArn: json['certificateArn'] as String,
    certificateId: json['certificateId'] as String,
    certificatePem: json['certificatePem'] as String,
    keyPair: json['keyPair'] == null
        ? null
        : KeyPair.fromJson(json['keyPair'] as Map<String, dynamic>),
  );
}

CreateMitigationActionResponse _$CreateMitigationActionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMitigationActionResponse(
    actionArn: json['actionArn'] as String,
    actionId: json['actionId'] as String,
  );
}

CreateOTAUpdateResponse _$CreateOTAUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateOTAUpdateResponse(
    awsIotJobArn: json['awsIotJobArn'] as String,
    awsIotJobId: json['awsIotJobId'] as String,
    otaUpdateArn: json['otaUpdateArn'] as String,
    otaUpdateId: json['otaUpdateId'] as String,
    otaUpdateStatus:
        _$enumDecodeNullable(_$OTAUpdateStatusEnumMap, json['otaUpdateStatus']),
  );
}

const _$OTAUpdateStatusEnumMap = {
  OTAUpdateStatus.createPending: 'CREATE_PENDING',
  OTAUpdateStatus.createInProgress: 'CREATE_IN_PROGRESS',
  OTAUpdateStatus.createComplete: 'CREATE_COMPLETE',
  OTAUpdateStatus.createFailed: 'CREATE_FAILED',
};

CreatePolicyResponse _$CreatePolicyResponseFromJson(Map<String, dynamic> json) {
  return CreatePolicyResponse(
    policyArn: json['policyArn'] as String,
    policyDocument: json['policyDocument'] as String,
    policyName: json['policyName'] as String,
    policyVersionId: json['policyVersionId'] as String,
  );
}

CreatePolicyVersionResponse _$CreatePolicyVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePolicyVersionResponse(
    isDefaultVersion: json['isDefaultVersion'] as bool,
    policyArn: json['policyArn'] as String,
    policyDocument: json['policyDocument'] as String,
    policyVersionId: json['policyVersionId'] as String,
  );
}

CreateProvisioningClaimResponse _$CreateProvisioningClaimResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProvisioningClaimResponse(
    certificateId: json['certificateId'] as String,
    certificatePem: json['certificatePem'] as String,
    expiration: const UnixDateTimeConverter().fromJson(json['expiration']),
    keyPair: json['keyPair'] == null
        ? null
        : KeyPair.fromJson(json['keyPair'] as Map<String, dynamic>),
  );
}

CreateProvisioningTemplateResponse _$CreateProvisioningTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProvisioningTemplateResponse(
    defaultVersionId: json['defaultVersionId'] as int,
    templateArn: json['templateArn'] as String,
    templateName: json['templateName'] as String,
  );
}

CreateProvisioningTemplateVersionResponse
    _$CreateProvisioningTemplateVersionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateProvisioningTemplateVersionResponse(
    isDefaultVersion: json['isDefaultVersion'] as bool,
    templateArn: json['templateArn'] as String,
    templateName: json['templateName'] as String,
    versionId: json['versionId'] as int,
  );
}

CreateRoleAliasResponse _$CreateRoleAliasResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRoleAliasResponse(
    roleAlias: json['roleAlias'] as String,
    roleAliasArn: json['roleAliasArn'] as String,
  );
}

CreateScheduledAuditResponse _$CreateScheduledAuditResponseFromJson(
    Map<String, dynamic> json) {
  return CreateScheduledAuditResponse(
    scheduledAuditArn: json['scheduledAuditArn'] as String,
  );
}

CreateSecurityProfileResponse _$CreateSecurityProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSecurityProfileResponse(
    securityProfileArn: json['securityProfileArn'] as String,
    securityProfileName: json['securityProfileName'] as String,
  );
}

CreateStreamResponse _$CreateStreamResponseFromJson(Map<String, dynamic> json) {
  return CreateStreamResponse(
    description: json['description'] as String,
    streamArn: json['streamArn'] as String,
    streamId: json['streamId'] as String,
    streamVersion: json['streamVersion'] as int,
  );
}

CreateThingGroupResponse _$CreateThingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateThingGroupResponse(
    thingGroupArn: json['thingGroupArn'] as String,
    thingGroupId: json['thingGroupId'] as String,
    thingGroupName: json['thingGroupName'] as String,
  );
}

CreateThingResponse _$CreateThingResponseFromJson(Map<String, dynamic> json) {
  return CreateThingResponse(
    thingArn: json['thingArn'] as String,
    thingId: json['thingId'] as String,
    thingName: json['thingName'] as String,
  );
}

CreateThingTypeResponse _$CreateThingTypeResponseFromJson(
    Map<String, dynamic> json) {
  return CreateThingTypeResponse(
    thingTypeArn: json['thingTypeArn'] as String,
    thingTypeId: json['thingTypeId'] as String,
    thingTypeName: json['thingTypeName'] as String,
  );
}

CreateTopicRuleDestinationResponse _$CreateTopicRuleDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTopicRuleDestinationResponse(
    topicRuleDestination: json['topicRuleDestination'] == null
        ? null
        : TopicRuleDestination.fromJson(
            json['topicRuleDestination'] as Map<String, dynamic>),
  );
}

CustomCodeSigning _$CustomCodeSigningFromJson(Map<String, dynamic> json) {
  return CustomCodeSigning(
    certificateChain: json['certificateChain'] == null
        ? null
        : CodeSigningCertificateChain.fromJson(
            json['certificateChain'] as Map<String, dynamic>),
    hashAlgorithm: json['hashAlgorithm'] as String,
    signature: json['signature'] == null
        ? null
        : CodeSigningSignature.fromJson(
            json['signature'] as Map<String, dynamic>),
    signatureAlgorithm: json['signatureAlgorithm'] as String,
  );
}

Map<String, dynamic> _$CustomCodeSigningToJson(CustomCodeSigning instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateChain', instance.certificateChain?.toJson());
  writeNotNull('hashAlgorithm', instance.hashAlgorithm);
  writeNotNull('signature', instance.signature?.toJson());
  writeNotNull('signatureAlgorithm', instance.signatureAlgorithm);
  return val;
}

DeleteAccountAuditConfigurationResponse
    _$DeleteAccountAuditConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteAccountAuditConfigurationResponse();
}

DeleteAuditSuppressionResponse _$DeleteAuditSuppressionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAuditSuppressionResponse();
}

DeleteAuthorizerResponse _$DeleteAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAuthorizerResponse();
}

DeleteBillingGroupResponse _$DeleteBillingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteBillingGroupResponse();
}

DeleteCACertificateResponse _$DeleteCACertificateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCACertificateResponse();
}

DeleteCustomMetricResponse _$DeleteCustomMetricResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCustomMetricResponse();
}

DeleteDimensionResponse _$DeleteDimensionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDimensionResponse();
}

DeleteDomainConfigurationResponse _$DeleteDomainConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDomainConfigurationResponse();
}

DeleteDynamicThingGroupResponse _$DeleteDynamicThingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDynamicThingGroupResponse();
}

DeleteMitigationActionResponse _$DeleteMitigationActionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteMitigationActionResponse();
}

DeleteOTAUpdateResponse _$DeleteOTAUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteOTAUpdateResponse();
}

DeleteProvisioningTemplateResponse _$DeleteProvisioningTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProvisioningTemplateResponse();
}

DeleteProvisioningTemplateVersionResponse
    _$DeleteProvisioningTemplateVersionResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteProvisioningTemplateVersionResponse();
}

DeleteRegistrationCodeResponse _$DeleteRegistrationCodeResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRegistrationCodeResponse();
}

DeleteRoleAliasResponse _$DeleteRoleAliasResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRoleAliasResponse();
}

DeleteScheduledAuditResponse _$DeleteScheduledAuditResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteScheduledAuditResponse();
}

DeleteSecurityProfileResponse _$DeleteSecurityProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSecurityProfileResponse();
}

DeleteStreamResponse _$DeleteStreamResponseFromJson(Map<String, dynamic> json) {
  return DeleteStreamResponse();
}

DeleteThingGroupResponse _$DeleteThingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteThingGroupResponse();
}

DeleteThingResponse _$DeleteThingResponseFromJson(Map<String, dynamic> json) {
  return DeleteThingResponse();
}

DeleteThingTypeResponse _$DeleteThingTypeResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteThingTypeResponse();
}

DeleteTopicRuleDestinationResponse _$DeleteTopicRuleDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTopicRuleDestinationResponse();
}

Denied _$DeniedFromJson(Map<String, dynamic> json) {
  return Denied(
    explicitDeny: json['explicitDeny'] == null
        ? null
        : ExplicitDeny.fromJson(json['explicitDeny'] as Map<String, dynamic>),
    implicitDeny: json['implicitDeny'] == null
        ? null
        : ImplicitDeny.fromJson(json['implicitDeny'] as Map<String, dynamic>),
  );
}

DeprecateThingTypeResponse _$DeprecateThingTypeResponseFromJson(
    Map<String, dynamic> json) {
  return DeprecateThingTypeResponse();
}

DescribeAccountAuditConfigurationResponse
    _$DescribeAccountAuditConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeAccountAuditConfigurationResponse(
    auditCheckConfigurations:
        (json['auditCheckConfigurations'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AuditCheckConfiguration.fromJson(e as Map<String, dynamic>)),
    ),
    auditNotificationTargetConfigurations:
        (json['auditNotificationTargetConfigurations'] as Map<String, dynamic>)
            ?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$AuditNotificationTypeEnumMap, k),
          e == null
              ? null
              : AuditNotificationTarget.fromJson(e as Map<String, dynamic>)),
    ),
    roleArn: json['roleArn'] as String,
  );
}

const _$AuditNotificationTypeEnumMap = {
  AuditNotificationType.sns: 'SNS',
};

DescribeAuditFindingResponse _$DescribeAuditFindingResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAuditFindingResponse(
    finding: json['finding'] == null
        ? null
        : AuditFinding.fromJson(json['finding'] as Map<String, dynamic>),
  );
}

DescribeAuditMitigationActionsTaskResponse
    _$DescribeAuditMitigationActionsTaskResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeAuditMitigationActionsTaskResponse(
    actionsDefinition: (json['actionsDefinition'] as List)
        ?.map((e) => e == null
            ? null
            : MitigationAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    auditCheckToActionsMapping:
        (json['auditCheckToActionsMapping'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    target: json['target'] == null
        ? null
        : AuditMitigationActionsTaskTarget.fromJson(
            json['target'] as Map<String, dynamic>),
    taskStatistics: (json['taskStatistics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : TaskStatisticsForAuditCheck.fromJson(
                  e as Map<String, dynamic>)),
    ),
    taskStatus: _$enumDecodeNullable(
        _$AuditMitigationActionsTaskStatusEnumMap, json['taskStatus']),
  );
}

DescribeAuditSuppressionResponse _$DescribeAuditSuppressionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAuditSuppressionResponse(
    checkName: json['checkName'] as String,
    description: json['description'] as String,
    expirationDate:
        const UnixDateTimeConverter().fromJson(json['expirationDate']),
    resourceIdentifier: json['resourceIdentifier'] == null
        ? null
        : ResourceIdentifier.fromJson(
            json['resourceIdentifier'] as Map<String, dynamic>),
    suppressIndefinitely: json['suppressIndefinitely'] as bool,
  );
}

DescribeAuditTaskResponse _$DescribeAuditTaskResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAuditTaskResponse(
    auditDetails: (json['auditDetails'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AuditCheckDetails.fromJson(e as Map<String, dynamic>)),
    ),
    scheduledAuditName: json['scheduledAuditName'] as String,
    taskStartTime:
        const UnixDateTimeConverter().fromJson(json['taskStartTime']),
    taskStatistics: json['taskStatistics'] == null
        ? null
        : TaskStatistics.fromJson(
            json['taskStatistics'] as Map<String, dynamic>),
    taskStatus:
        _$enumDecodeNullable(_$AuditTaskStatusEnumMap, json['taskStatus']),
    taskType: _$enumDecodeNullable(_$AuditTaskTypeEnumMap, json['taskType']),
  );
}

DescribeAuthorizerResponse _$DescribeAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAuthorizerResponse(
    authorizerDescription: json['authorizerDescription'] == null
        ? null
        : AuthorizerDescription.fromJson(
            json['authorizerDescription'] as Map<String, dynamic>),
  );
}

DescribeBillingGroupResponse _$DescribeBillingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeBillingGroupResponse(
    billingGroupArn: json['billingGroupArn'] as String,
    billingGroupId: json['billingGroupId'] as String,
    billingGroupMetadata: json['billingGroupMetadata'] == null
        ? null
        : BillingGroupMetadata.fromJson(
            json['billingGroupMetadata'] as Map<String, dynamic>),
    billingGroupName: json['billingGroupName'] as String,
    billingGroupProperties: json['billingGroupProperties'] == null
        ? null
        : BillingGroupProperties.fromJson(
            json['billingGroupProperties'] as Map<String, dynamic>),
    version: json['version'] as int,
  );
}

DescribeCACertificateResponse _$DescribeCACertificateResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCACertificateResponse(
    certificateDescription: json['certificateDescription'] == null
        ? null
        : CACertificateDescription.fromJson(
            json['certificateDescription'] as Map<String, dynamic>),
    registrationConfig: json['registrationConfig'] == null
        ? null
        : RegistrationConfig.fromJson(
            json['registrationConfig'] as Map<String, dynamic>),
  );
}

DescribeCertificateResponse _$DescribeCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCertificateResponse(
    certificateDescription: json['certificateDescription'] == null
        ? null
        : CertificateDescription.fromJson(
            json['certificateDescription'] as Map<String, dynamic>),
  );
}

DescribeCustomMetricResponse _$DescribeCustomMetricResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCustomMetricResponse(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    displayName: json['displayName'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    metricArn: json['metricArn'] as String,
    metricName: json['metricName'] as String,
    metricType:
        _$enumDecodeNullable(_$CustomMetricTypeEnumMap, json['metricType']),
  );
}

const _$CustomMetricTypeEnumMap = {
  CustomMetricType.stringList: 'string-list',
  CustomMetricType.ipAddressList: 'ip-address-list',
  CustomMetricType.numberList: 'number-list',
  CustomMetricType.number: 'number',
};

DescribeDefaultAuthorizerResponse _$DescribeDefaultAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDefaultAuthorizerResponse(
    authorizerDescription: json['authorizerDescription'] == null
        ? null
        : AuthorizerDescription.fromJson(
            json['authorizerDescription'] as Map<String, dynamic>),
  );
}

DescribeDetectMitigationActionsTaskResponse
    _$DescribeDetectMitigationActionsTaskResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeDetectMitigationActionsTaskResponse(
    taskSummary: json['taskSummary'] == null
        ? null
        : DetectMitigationActionsTaskSummary.fromJson(
            json['taskSummary'] as Map<String, dynamic>),
  );
}

DescribeDimensionResponse _$DescribeDimensionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDimensionResponse(
    arn: json['arn'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    name: json['name'] as String,
    stringValues:
        (json['stringValues'] as List)?.map((e) => e as String)?.toList(),
    type: _$enumDecodeNullable(_$DimensionTypeEnumMap, json['type']),
  );
}

const _$DimensionTypeEnumMap = {
  DimensionType.topicFilter: 'TOPIC_FILTER',
};

DescribeDomainConfigurationResponse
    _$DescribeDomainConfigurationResponseFromJson(Map<String, dynamic> json) {
  return DescribeDomainConfigurationResponse(
    authorizerConfig: json['authorizerConfig'] == null
        ? null
        : AuthorizerConfig.fromJson(
            json['authorizerConfig'] as Map<String, dynamic>),
    domainConfigurationArn: json['domainConfigurationArn'] as String,
    domainConfigurationName: json['domainConfigurationName'] as String,
    domainConfigurationStatus: _$enumDecodeNullable(
        _$DomainConfigurationStatusEnumMap, json['domainConfigurationStatus']),
    domainName: json['domainName'] as String,
    domainType: _$enumDecodeNullable(_$DomainTypeEnumMap, json['domainType']),
    lastStatusChangeDate:
        const UnixDateTimeConverter().fromJson(json['lastStatusChangeDate']),
    serverCertificates: (json['serverCertificates'] as List)
        ?.map((e) => e == null
            ? null
            : ServerCertificateSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    serviceType:
        _$enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceType']),
  );
}

const _$DomainConfigurationStatusEnumMap = {
  DomainConfigurationStatus.enabled: 'ENABLED',
  DomainConfigurationStatus.disabled: 'DISABLED',
};

const _$DomainTypeEnumMap = {
  DomainType.endpoint: 'ENDPOINT',
  DomainType.awsManaged: 'AWS_MANAGED',
  DomainType.customerManaged: 'CUSTOMER_MANAGED',
};

const _$ServiceTypeEnumMap = {
  ServiceType.data: 'DATA',
  ServiceType.credentialProvider: 'CREDENTIAL_PROVIDER',
  ServiceType.jobs: 'JOBS',
};

DescribeEndpointResponse _$DescribeEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointResponse(
    endpointAddress: json['endpointAddress'] as String,
  );
}

DescribeEventConfigurationsResponse
    _$DescribeEventConfigurationsResponseFromJson(Map<String, dynamic> json) {
  return DescribeEventConfigurationsResponse(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    eventConfigurations:
        (json['eventConfigurations'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$EventTypeEnumMap, k),
          e == null ? null : Configuration.fromJson(e as Map<String, dynamic>)),
    ),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
  );
}

const _$EventTypeEnumMap = {
  EventType.thing: 'THING',
  EventType.thingGroup: 'THING_GROUP',
  EventType.thingType: 'THING_TYPE',
  EventType.thingGroupMembership: 'THING_GROUP_MEMBERSHIP',
  EventType.thingGroupHierarchy: 'THING_GROUP_HIERARCHY',
  EventType.thingTypeAssociation: 'THING_TYPE_ASSOCIATION',
  EventType.job: 'JOB',
  EventType.jobExecution: 'JOB_EXECUTION',
  EventType.policy: 'POLICY',
  EventType.certificate: 'CERTIFICATE',
  EventType.caCertificate: 'CA_CERTIFICATE',
};

DescribeIndexResponse _$DescribeIndexResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeIndexResponse(
    indexName: json['indexName'] as String,
    indexStatus:
        _$enumDecodeNullable(_$IndexStatusEnumMap, json['indexStatus']),
    schema: json['schema'] as String,
  );
}

const _$IndexStatusEnumMap = {
  IndexStatus.active: 'ACTIVE',
  IndexStatus.building: 'BUILDING',
  IndexStatus.rebuilding: 'REBUILDING',
};

DescribeJobExecutionResponse _$DescribeJobExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeJobExecutionResponse(
    execution: json['execution'] == null
        ? null
        : JobExecution.fromJson(json['execution'] as Map<String, dynamic>),
  );
}

DescribeJobResponse _$DescribeJobResponseFromJson(Map<String, dynamic> json) {
  return DescribeJobResponse(
    documentSource: json['documentSource'] as String,
    job: json['job'] == null
        ? null
        : Job.fromJson(json['job'] as Map<String, dynamic>),
  );
}

DescribeMitigationActionResponse _$DescribeMitigationActionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeMitigationActionResponse(
    actionArn: json['actionArn'] as String,
    actionId: json['actionId'] as String,
    actionName: json['actionName'] as String,
    actionParams: json['actionParams'] == null
        ? null
        : MitigationActionParams.fromJson(
            json['actionParams'] as Map<String, dynamic>),
    actionType:
        _$enumDecodeNullable(_$MitigationActionTypeEnumMap, json['actionType']),
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    roleArn: json['roleArn'] as String,
  );
}

const _$MitigationActionTypeEnumMap = {
  MitigationActionType.updateDeviceCertificate: 'UPDATE_DEVICE_CERTIFICATE',
  MitigationActionType.updateCaCertificate: 'UPDATE_CA_CERTIFICATE',
  MitigationActionType.addThingsToThingGroup: 'ADD_THINGS_TO_THING_GROUP',
  MitigationActionType.replaceDefaultPolicyVersion:
      'REPLACE_DEFAULT_POLICY_VERSION',
  MitigationActionType.enableIotLogging: 'ENABLE_IOT_LOGGING',
  MitigationActionType.publishFindingToSns: 'PUBLISH_FINDING_TO_SNS',
};

DescribeProvisioningTemplateResponse
    _$DescribeProvisioningTemplateResponseFromJson(Map<String, dynamic> json) {
  return DescribeProvisioningTemplateResponse(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    defaultVersionId: json['defaultVersionId'] as int,
    description: json['description'] as String,
    enabled: json['enabled'] as bool,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    preProvisioningHook: json['preProvisioningHook'] == null
        ? null
        : ProvisioningHook.fromJson(
            json['preProvisioningHook'] as Map<String, dynamic>),
    provisioningRoleArn: json['provisioningRoleArn'] as String,
    templateArn: json['templateArn'] as String,
    templateBody: json['templateBody'] as String,
    templateName: json['templateName'] as String,
  );
}

DescribeProvisioningTemplateVersionResponse
    _$DescribeProvisioningTemplateVersionResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeProvisioningTemplateVersionResponse(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    isDefaultVersion: json['isDefaultVersion'] as bool,
    templateBody: json['templateBody'] as String,
    versionId: json['versionId'] as int,
  );
}

DescribeRoleAliasResponse _$DescribeRoleAliasResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRoleAliasResponse(
    roleAliasDescription: json['roleAliasDescription'] == null
        ? null
        : RoleAliasDescription.fromJson(
            json['roleAliasDescription'] as Map<String, dynamic>),
  );
}

DescribeScheduledAuditResponse _$DescribeScheduledAuditResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeScheduledAuditResponse(
    dayOfMonth: json['dayOfMonth'] as String,
    dayOfWeek: _$enumDecodeNullable(_$DayOfWeekEnumMap, json['dayOfWeek']),
    frequency: _$enumDecodeNullable(_$AuditFrequencyEnumMap, json['frequency']),
    scheduledAuditArn: json['scheduledAuditArn'] as String,
    scheduledAuditName: json['scheduledAuditName'] as String,
    targetCheckNames:
        (json['targetCheckNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$DayOfWeekEnumMap = {
  DayOfWeek.sun: 'SUN',
  DayOfWeek.mon: 'MON',
  DayOfWeek.tue: 'TUE',
  DayOfWeek.wed: 'WED',
  DayOfWeek.thu: 'THU',
  DayOfWeek.fri: 'FRI',
  DayOfWeek.sat: 'SAT',
};

const _$AuditFrequencyEnumMap = {
  AuditFrequency.daily: 'DAILY',
  AuditFrequency.weekly: 'WEEKLY',
  AuditFrequency.biweekly: 'BIWEEKLY',
  AuditFrequency.monthly: 'MONTHLY',
};

DescribeSecurityProfileResponse _$DescribeSecurityProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSecurityProfileResponse(
    additionalMetricsToRetain: (json['additionalMetricsToRetain'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    additionalMetricsToRetainV2: (json['additionalMetricsToRetainV2'] as List)
        ?.map((e) => e == null
            ? null
            : MetricToRetain.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    alertTargets: (json['alertTargets'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$AlertTargetTypeEnumMap, k),
          e == null ? null : AlertTarget.fromJson(e as Map<String, dynamic>)),
    ),
    behaviors: (json['behaviors'] as List)
        ?.map((e) =>
            e == null ? null : Behavior.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    securityProfileArn: json['securityProfileArn'] as String,
    securityProfileDescription: json['securityProfileDescription'] as String,
    securityProfileName: json['securityProfileName'] as String,
    version: json['version'] as int,
  );
}

const _$AlertTargetTypeEnumMap = {
  AlertTargetType.sns: 'SNS',
};

DescribeStreamResponse _$DescribeStreamResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeStreamResponse(
    streamInfo: json['streamInfo'] == null
        ? null
        : StreamInfo.fromJson(json['streamInfo'] as Map<String, dynamic>),
  );
}

DescribeThingGroupResponse _$DescribeThingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeThingGroupResponse(
    indexName: json['indexName'] as String,
    queryString: json['queryString'] as String,
    queryVersion: json['queryVersion'] as String,
    status: _$enumDecodeNullable(_$DynamicGroupStatusEnumMap, json['status']),
    thingGroupArn: json['thingGroupArn'] as String,
    thingGroupId: json['thingGroupId'] as String,
    thingGroupMetadata: json['thingGroupMetadata'] == null
        ? null
        : ThingGroupMetadata.fromJson(
            json['thingGroupMetadata'] as Map<String, dynamic>),
    thingGroupName: json['thingGroupName'] as String,
    thingGroupProperties: json['thingGroupProperties'] == null
        ? null
        : ThingGroupProperties.fromJson(
            json['thingGroupProperties'] as Map<String, dynamic>),
    version: json['version'] as int,
  );
}

const _$DynamicGroupStatusEnumMap = {
  DynamicGroupStatus.active: 'ACTIVE',
  DynamicGroupStatus.building: 'BUILDING',
  DynamicGroupStatus.rebuilding: 'REBUILDING',
};

DescribeThingRegistrationTaskResponse
    _$DescribeThingRegistrationTaskResponseFromJson(Map<String, dynamic> json) {
  return DescribeThingRegistrationTaskResponse(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    failureCount: json['failureCount'] as int,
    inputFileBucket: json['inputFileBucket'] as String,
    inputFileKey: json['inputFileKey'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    message: json['message'] as String,
    percentageProgress: json['percentageProgress'] as int,
    roleArn: json['roleArn'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    successCount: json['successCount'] as int,
    taskId: json['taskId'] as String,
    templateBody: json['templateBody'] as String,
  );
}

const _$StatusEnumMap = {
  Status.inProgress: 'InProgress',
  Status.completed: 'Completed',
  Status.failed: 'Failed',
  Status.cancelled: 'Cancelled',
  Status.cancelling: 'Cancelling',
};

DescribeThingResponse _$DescribeThingResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeThingResponse(
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    billingGroupName: json['billingGroupName'] as String,
    defaultClientId: json['defaultClientId'] as String,
    thingArn: json['thingArn'] as String,
    thingId: json['thingId'] as String,
    thingName: json['thingName'] as String,
    thingTypeName: json['thingTypeName'] as String,
    version: json['version'] as int,
  );
}

DescribeThingTypeResponse _$DescribeThingTypeResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeThingTypeResponse(
    thingTypeArn: json['thingTypeArn'] as String,
    thingTypeId: json['thingTypeId'] as String,
    thingTypeMetadata: json['thingTypeMetadata'] == null
        ? null
        : ThingTypeMetadata.fromJson(
            json['thingTypeMetadata'] as Map<String, dynamic>),
    thingTypeName: json['thingTypeName'] as String,
    thingTypeProperties: json['thingTypeProperties'] == null
        ? null
        : ThingTypeProperties.fromJson(
            json['thingTypeProperties'] as Map<String, dynamic>),
  );
}

Destination _$DestinationFromJson(Map<String, dynamic> json) {
  return Destination(
    s3Destination: json['s3Destination'] == null
        ? null
        : S3Destination.fromJson(json['s3Destination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DestinationToJson(Destination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3Destination', instance.s3Destination?.toJson());
  return val;
}

DetachSecurityProfileResponse _$DetachSecurityProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DetachSecurityProfileResponse();
}

DetachThingPrincipalResponse _$DetachThingPrincipalResponseFromJson(
    Map<String, dynamic> json) {
  return DetachThingPrincipalResponse();
}

DetectMitigationActionExecution _$DetectMitigationActionExecutionFromJson(
    Map<String, dynamic> json) {
  return DetectMitigationActionExecution(
    actionName: json['actionName'] as String,
    errorCode: json['errorCode'] as String,
    executionEndDate:
        const UnixDateTimeConverter().fromJson(json['executionEndDate']),
    executionStartDate:
        const UnixDateTimeConverter().fromJson(json['executionStartDate']),
    message: json['message'] as String,
    status: _$enumDecodeNullable(
        _$DetectMitigationActionExecutionStatusEnumMap, json['status']),
    taskId: json['taskId'] as String,
    thingName: json['thingName'] as String,
    violationId: json['violationId'] as String,
  );
}

const _$DetectMitigationActionExecutionStatusEnumMap = {
  DetectMitigationActionExecutionStatus.inProgress: 'IN_PROGRESS',
  DetectMitigationActionExecutionStatus.successful: 'SUCCESSFUL',
  DetectMitigationActionExecutionStatus.failed: 'FAILED',
  DetectMitigationActionExecutionStatus.skipped: 'SKIPPED',
};

DetectMitigationActionsTaskStatistics
    _$DetectMitigationActionsTaskStatisticsFromJson(Map<String, dynamic> json) {
  return DetectMitigationActionsTaskStatistics(
    actionsExecuted: json['actionsExecuted'] as int,
    actionsFailed: json['actionsFailed'] as int,
    actionsSkipped: json['actionsSkipped'] as int,
  );
}

DetectMitigationActionsTaskSummary _$DetectMitigationActionsTaskSummaryFromJson(
    Map<String, dynamic> json) {
  return DetectMitigationActionsTaskSummary(
    actionsDefinition: (json['actionsDefinition'] as List)
        ?.map((e) => e == null
            ? null
            : MitigationAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    onlyActiveViolationsIncluded: json['onlyActiveViolationsIncluded'] as bool,
    suppressedAlertsIncluded: json['suppressedAlertsIncluded'] as bool,
    target: json['target'] == null
        ? null
        : DetectMitigationActionsTaskTarget.fromJson(
            json['target'] as Map<String, dynamic>),
    taskEndTime: const UnixDateTimeConverter().fromJson(json['taskEndTime']),
    taskId: json['taskId'] as String,
    taskStartTime:
        const UnixDateTimeConverter().fromJson(json['taskStartTime']),
    taskStatistics: json['taskStatistics'] == null
        ? null
        : DetectMitigationActionsTaskStatistics.fromJson(
            json['taskStatistics'] as Map<String, dynamic>),
    taskStatus: _$enumDecodeNullable(
        _$DetectMitigationActionsTaskStatusEnumMap, json['taskStatus']),
    violationEventOccurrenceRange: json['violationEventOccurrenceRange'] == null
        ? null
        : ViolationEventOccurrenceRange.fromJson(
            json['violationEventOccurrenceRange'] as Map<String, dynamic>),
  );
}

const _$DetectMitigationActionsTaskStatusEnumMap = {
  DetectMitigationActionsTaskStatus.inProgress: 'IN_PROGRESS',
  DetectMitigationActionsTaskStatus.successful: 'SUCCESSFUL',
  DetectMitigationActionsTaskStatus.failed: 'FAILED',
  DetectMitigationActionsTaskStatus.canceled: 'CANCELED',
};

DetectMitigationActionsTaskTarget _$DetectMitigationActionsTaskTargetFromJson(
    Map<String, dynamic> json) {
  return DetectMitigationActionsTaskTarget(
    behaviorName: json['behaviorName'] as String,
    securityProfileName: json['securityProfileName'] as String,
    violationIds:
        (json['violationIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DetectMitigationActionsTaskTargetToJson(
    DetectMitigationActionsTaskTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('behaviorName', instance.behaviorName);
  writeNotNull('securityProfileName', instance.securityProfileName);
  writeNotNull('violationIds', instance.violationIds);
  return val;
}

DomainConfigurationSummary _$DomainConfigurationSummaryFromJson(
    Map<String, dynamic> json) {
  return DomainConfigurationSummary(
    domainConfigurationArn: json['domainConfigurationArn'] as String,
    domainConfigurationName: json['domainConfigurationName'] as String,
    serviceType:
        _$enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceType']),
  );
}

DynamoDBAction _$DynamoDBActionFromJson(Map<String, dynamic> json) {
  return DynamoDBAction(
    hashKeyField: json['hashKeyField'] as String,
    hashKeyValue: json['hashKeyValue'] as String,
    roleArn: json['roleArn'] as String,
    tableName: json['tableName'] as String,
    hashKeyType:
        _$enumDecodeNullable(_$DynamoKeyTypeEnumMap, json['hashKeyType']),
    operation: json['operation'] as String,
    payloadField: json['payloadField'] as String,
    rangeKeyField: json['rangeKeyField'] as String,
    rangeKeyType:
        _$enumDecodeNullable(_$DynamoKeyTypeEnumMap, json['rangeKeyType']),
    rangeKeyValue: json['rangeKeyValue'] as String,
  );
}

Map<String, dynamic> _$DynamoDBActionToJson(DynamoDBAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hashKeyField', instance.hashKeyField);
  writeNotNull('hashKeyValue', instance.hashKeyValue);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('tableName', instance.tableName);
  writeNotNull('hashKeyType', _$DynamoKeyTypeEnumMap[instance.hashKeyType]);
  writeNotNull('operation', instance.operation);
  writeNotNull('payloadField', instance.payloadField);
  writeNotNull('rangeKeyField', instance.rangeKeyField);
  writeNotNull('rangeKeyType', _$DynamoKeyTypeEnumMap[instance.rangeKeyType]);
  writeNotNull('rangeKeyValue', instance.rangeKeyValue);
  return val;
}

const _$DynamoKeyTypeEnumMap = {
  DynamoKeyType.string: 'STRING',
  DynamoKeyType.number: 'NUMBER',
};

DynamoDBv2Action _$DynamoDBv2ActionFromJson(Map<String, dynamic> json) {
  return DynamoDBv2Action(
    putItem: json['putItem'] == null
        ? null
        : PutItemInput.fromJson(json['putItem'] as Map<String, dynamic>),
    roleArn: json['roleArn'] as String,
  );
}

Map<String, dynamic> _$DynamoDBv2ActionToJson(DynamoDBv2Action instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('putItem', instance.putItem?.toJson());
  writeNotNull('roleArn', instance.roleArn);
  return val;
}

EffectivePolicy _$EffectivePolicyFromJson(Map<String, dynamic> json) {
  return EffectivePolicy(
    policyArn: json['policyArn'] as String,
    policyDocument: json['policyDocument'] as String,
    policyName: json['policyName'] as String,
  );
}

ElasticsearchAction _$ElasticsearchActionFromJson(Map<String, dynamic> json) {
  return ElasticsearchAction(
    endpoint: json['endpoint'] as String,
    id: json['id'] as String,
    index: json['index'] as String,
    roleArn: json['roleArn'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$ElasticsearchActionToJson(ElasticsearchAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endpoint', instance.endpoint);
  writeNotNull('id', instance.id);
  writeNotNull('index', instance.index);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('type', instance.type);
  return val;
}

EnableIoTLoggingParams _$EnableIoTLoggingParamsFromJson(
    Map<String, dynamic> json) {
  return EnableIoTLoggingParams(
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']),
    roleArnForLogging: json['roleArnForLogging'] as String,
  );
}

Map<String, dynamic> _$EnableIoTLoggingParamsToJson(
    EnableIoTLoggingParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logLevel', _$LogLevelEnumMap[instance.logLevel]);
  writeNotNull('roleArnForLogging', instance.roleArnForLogging);
  return val;
}

const _$LogLevelEnumMap = {
  LogLevel.debug: 'DEBUG',
  LogLevel.info: 'INFO',
  LogLevel.error: 'ERROR',
  LogLevel.warn: 'WARN',
  LogLevel.disabled: 'DISABLED',
};

ErrorInfo _$ErrorInfoFromJson(Map<String, dynamic> json) {
  return ErrorInfo(
    code: json['code'] as String,
    message: json['message'] as String,
  );
}

ExplicitDeny _$ExplicitDenyFromJson(Map<String, dynamic> json) {
  return ExplicitDeny(
    policies: (json['policies'] as List)
        ?.map((e) =>
            e == null ? null : Policy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ExponentialRolloutRate _$ExponentialRolloutRateFromJson(
    Map<String, dynamic> json) {
  return ExponentialRolloutRate(
    baseRatePerMinute: json['baseRatePerMinute'] as int,
    incrementFactor: (json['incrementFactor'] as num)?.toDouble(),
    rateIncreaseCriteria: json['rateIncreaseCriteria'] == null
        ? null
        : RateIncreaseCriteria.fromJson(
            json['rateIncreaseCriteria'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExponentialRolloutRateToJson(
    ExponentialRolloutRate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseRatePerMinute', instance.baseRatePerMinute);
  writeNotNull('incrementFactor', instance.incrementFactor);
  writeNotNull('rateIncreaseCriteria', instance.rateIncreaseCriteria?.toJson());
  return val;
}

Field _$FieldFromJson(Map<String, dynamic> json) {
  return Field(
    name: json['name'] as String,
    type: _$enumDecodeNullable(_$FieldTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$FieldToJson(Field instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('type', _$FieldTypeEnumMap[instance.type]);
  return val;
}

const _$FieldTypeEnumMap = {
  FieldType.number: 'Number',
  FieldType.string: 'String',
  FieldType.boolean: 'Boolean',
};

FileLocation _$FileLocationFromJson(Map<String, dynamic> json) {
  return FileLocation(
    s3Location: json['s3Location'] == null
        ? null
        : S3Location.fromJson(json['s3Location'] as Map<String, dynamic>),
    stream: json['stream'] == null
        ? null
        : Stream.fromJson(json['stream'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FileLocationToJson(FileLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3Location', instance.s3Location?.toJson());
  writeNotNull('stream', instance.stream?.toJson());
  return val;
}

FirehoseAction _$FirehoseActionFromJson(Map<String, dynamic> json) {
  return FirehoseAction(
    deliveryStreamName: json['deliveryStreamName'] as String,
    roleArn: json['roleArn'] as String,
    batchMode: json['batchMode'] as bool,
    separator: json['separator'] as String,
  );
}

Map<String, dynamic> _$FirehoseActionToJson(FirehoseAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deliveryStreamName', instance.deliveryStreamName);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('batchMode', instance.batchMode);
  writeNotNull('separator', instance.separator);
  return val;
}

GetBehaviorModelTrainingSummariesResponse
    _$GetBehaviorModelTrainingSummariesResponseFromJson(
        Map<String, dynamic> json) {
  return GetBehaviorModelTrainingSummariesResponse(
    nextToken: json['nextToken'] as String,
    summaries: (json['summaries'] as List)
        ?.map((e) => e == null
            ? null
            : BehaviorModelTrainingSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetCardinalityResponse _$GetCardinalityResponseFromJson(
    Map<String, dynamic> json) {
  return GetCardinalityResponse(
    cardinality: json['cardinality'] as int,
  );
}

GetEffectivePoliciesResponse _$GetEffectivePoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return GetEffectivePoliciesResponse(
    effectivePolicies: (json['effectivePolicies'] as List)
        ?.map((e) => e == null
            ? null
            : EffectivePolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetIndexingConfigurationResponse _$GetIndexingConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return GetIndexingConfigurationResponse(
    thingGroupIndexingConfiguration: json['thingGroupIndexingConfiguration'] ==
            null
        ? null
        : ThingGroupIndexingConfiguration.fromJson(
            json['thingGroupIndexingConfiguration'] as Map<String, dynamic>),
    thingIndexingConfiguration: json['thingIndexingConfiguration'] == null
        ? null
        : ThingIndexingConfiguration.fromJson(
            json['thingIndexingConfiguration'] as Map<String, dynamic>),
  );
}

GetJobDocumentResponse _$GetJobDocumentResponseFromJson(
    Map<String, dynamic> json) {
  return GetJobDocumentResponse(
    document: json['document'] as String,
  );
}

GetLoggingOptionsResponse _$GetLoggingOptionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetLoggingOptionsResponse(
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']),
    roleArn: json['roleArn'] as String,
  );
}

GetOTAUpdateResponse _$GetOTAUpdateResponseFromJson(Map<String, dynamic> json) {
  return GetOTAUpdateResponse(
    otaUpdateInfo: json['otaUpdateInfo'] == null
        ? null
        : OTAUpdateInfo.fromJson(json['otaUpdateInfo'] as Map<String, dynamic>),
  );
}

GetPercentilesResponse _$GetPercentilesResponseFromJson(
    Map<String, dynamic> json) {
  return GetPercentilesResponse(
    percentiles: (json['percentiles'] as List)
        ?.map((e) =>
            e == null ? null : PercentPair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetPolicyResponse _$GetPolicyResponseFromJson(Map<String, dynamic> json) {
  return GetPolicyResponse(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    defaultVersionId: json['defaultVersionId'] as String,
    generationId: json['generationId'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    policyArn: json['policyArn'] as String,
    policyDocument: json['policyDocument'] as String,
    policyName: json['policyName'] as String,
  );
}

GetPolicyVersionResponse _$GetPolicyVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetPolicyVersionResponse(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    generationId: json['generationId'] as String,
    isDefaultVersion: json['isDefaultVersion'] as bool,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    policyArn: json['policyArn'] as String,
    policyDocument: json['policyDocument'] as String,
    policyName: json['policyName'] as String,
    policyVersionId: json['policyVersionId'] as String,
  );
}

GetRegistrationCodeResponse _$GetRegistrationCodeResponseFromJson(
    Map<String, dynamic> json) {
  return GetRegistrationCodeResponse(
    registrationCode: json['registrationCode'] as String,
  );
}

GetStatisticsResponse _$GetStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return GetStatisticsResponse(
    statistics: json['statistics'] == null
        ? null
        : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
  );
}

GetTopicRuleDestinationResponse _$GetTopicRuleDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return GetTopicRuleDestinationResponse(
    topicRuleDestination: json['topicRuleDestination'] == null
        ? null
        : TopicRuleDestination.fromJson(
            json['topicRuleDestination'] as Map<String, dynamic>),
  );
}

GetTopicRuleResponse _$GetTopicRuleResponseFromJson(Map<String, dynamic> json) {
  return GetTopicRuleResponse(
    rule: json['rule'] == null
        ? null
        : TopicRule.fromJson(json['rule'] as Map<String, dynamic>),
    ruleArn: json['ruleArn'] as String,
  );
}

GetV2LoggingOptionsResponse _$GetV2LoggingOptionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetV2LoggingOptionsResponse(
    defaultLogLevel:
        _$enumDecodeNullable(_$LogLevelEnumMap, json['defaultLogLevel']),
    disableAllLogs: json['disableAllLogs'] as bool,
    roleArn: json['roleArn'] as String,
  );
}

GroupNameAndArn _$GroupNameAndArnFromJson(Map<String, dynamic> json) {
  return GroupNameAndArn(
    groupArn: json['groupArn'] as String,
    groupName: json['groupName'] as String,
  );
}

HttpAction _$HttpActionFromJson(Map<String, dynamic> json) {
  return HttpAction(
    url: json['url'] as String,
    auth: json['auth'] == null
        ? null
        : HttpAuthorization.fromJson(json['auth'] as Map<String, dynamic>),
    confirmationUrl: json['confirmationUrl'] as String,
    headers: (json['headers'] as List)
        ?.map((e) => e == null
            ? null
            : HttpActionHeader.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HttpActionToJson(HttpAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('auth', instance.auth?.toJson());
  writeNotNull('confirmationUrl', instance.confirmationUrl);
  writeNotNull('headers', instance.headers?.map((e) => e?.toJson())?.toList());
  return val;
}

HttpActionHeader _$HttpActionHeaderFromJson(Map<String, dynamic> json) {
  return HttpActionHeader(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$HttpActionHeaderToJson(HttpActionHeader instance) {
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

HttpAuthorization _$HttpAuthorizationFromJson(Map<String, dynamic> json) {
  return HttpAuthorization(
    sigv4: json['sigv4'] == null
        ? null
        : SigV4Authorization.fromJson(json['sigv4'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HttpAuthorizationToJson(HttpAuthorization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sigv4', instance.sigv4?.toJson());
  return val;
}

Map<String, dynamic> _$HttpContextToJson(HttpContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('headers', instance.headers);
  writeNotNull('queryString', instance.queryString);
  return val;
}

Map<String, dynamic> _$HttpUrlDestinationConfigurationToJson(
    HttpUrlDestinationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('confirmationUrl', instance.confirmationUrl);
  return val;
}

HttpUrlDestinationProperties _$HttpUrlDestinationPropertiesFromJson(
    Map<String, dynamic> json) {
  return HttpUrlDestinationProperties(
    confirmationUrl: json['confirmationUrl'] as String,
  );
}

HttpUrlDestinationSummary _$HttpUrlDestinationSummaryFromJson(
    Map<String, dynamic> json) {
  return HttpUrlDestinationSummary(
    confirmationUrl: json['confirmationUrl'] as String,
  );
}

ImplicitDeny _$ImplicitDenyFromJson(Map<String, dynamic> json) {
  return ImplicitDeny(
    policies: (json['policies'] as List)
        ?.map((e) =>
            e == null ? null : Policy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

IotAnalyticsAction _$IotAnalyticsActionFromJson(Map<String, dynamic> json) {
  return IotAnalyticsAction(
    batchMode: json['batchMode'] as bool,
    channelArn: json['channelArn'] as String,
    channelName: json['channelName'] as String,
    roleArn: json['roleArn'] as String,
  );
}

Map<String, dynamic> _$IotAnalyticsActionToJson(IotAnalyticsAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('batchMode', instance.batchMode);
  writeNotNull('channelArn', instance.channelArn);
  writeNotNull('channelName', instance.channelName);
  writeNotNull('roleArn', instance.roleArn);
  return val;
}

IotEventsAction _$IotEventsActionFromJson(Map<String, dynamic> json) {
  return IotEventsAction(
    inputName: json['inputName'] as String,
    roleArn: json['roleArn'] as String,
    batchMode: json['batchMode'] as bool,
    messageId: json['messageId'] as String,
  );
}

Map<String, dynamic> _$IotEventsActionToJson(IotEventsAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inputName', instance.inputName);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('batchMode', instance.batchMode);
  writeNotNull('messageId', instance.messageId);
  return val;
}

IotSiteWiseAction _$IotSiteWiseActionFromJson(Map<String, dynamic> json) {
  return IotSiteWiseAction(
    putAssetPropertyValueEntries: (json['putAssetPropertyValueEntries'] as List)
        ?.map((e) => e == null
            ? null
            : PutAssetPropertyValueEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    roleArn: json['roleArn'] as String,
  );
}

Map<String, dynamic> _$IotSiteWiseActionToJson(IotSiteWiseAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('putAssetPropertyValueEntries',
      instance.putAssetPropertyValueEntries?.map((e) => e?.toJson())?.toList());
  writeNotNull('roleArn', instance.roleArn);
  return val;
}

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    abortConfig: json['abortConfig'] == null
        ? null
        : AbortConfig.fromJson(json['abortConfig'] as Map<String, dynamic>),
    comment: json['comment'] as String,
    completedAt: const UnixDateTimeConverter().fromJson(json['completedAt']),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    forceCanceled: json['forceCanceled'] as bool,
    jobArn: json['jobArn'] as String,
    jobExecutionsRolloutConfig: json['jobExecutionsRolloutConfig'] == null
        ? null
        : JobExecutionsRolloutConfig.fromJson(
            json['jobExecutionsRolloutConfig'] as Map<String, dynamic>),
    jobId: json['jobId'] as String,
    jobProcessDetails: json['jobProcessDetails'] == null
        ? null
        : JobProcessDetails.fromJson(
            json['jobProcessDetails'] as Map<String, dynamic>),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    namespaceId: json['namespaceId'] as String,
    presignedUrlConfig: json['presignedUrlConfig'] == null
        ? null
        : PresignedUrlConfig.fromJson(
            json['presignedUrlConfig'] as Map<String, dynamic>),
    reasonCode: json['reasonCode'] as String,
    status: _$enumDecodeNullable(_$JobStatusEnumMap, json['status']),
    targetSelection:
        _$enumDecodeNullable(_$TargetSelectionEnumMap, json['targetSelection']),
    targets: (json['targets'] as List)?.map((e) => e as String)?.toList(),
    timeoutConfig: json['timeoutConfig'] == null
        ? null
        : TimeoutConfig.fromJson(json['timeoutConfig'] as Map<String, dynamic>),
  );
}

const _$JobStatusEnumMap = {
  JobStatus.inProgress: 'IN_PROGRESS',
  JobStatus.canceled: 'CANCELED',
  JobStatus.completed: 'COMPLETED',
  JobStatus.deletionInProgress: 'DELETION_IN_PROGRESS',
};

const _$TargetSelectionEnumMap = {
  TargetSelection.continuous: 'CONTINUOUS',
  TargetSelection.snapshot: 'SNAPSHOT',
};

JobExecution _$JobExecutionFromJson(Map<String, dynamic> json) {
  return JobExecution(
    approximateSecondsBeforeTimedOut:
        json['approximateSecondsBeforeTimedOut'] as int,
    executionNumber: json['executionNumber'] as int,
    forceCanceled: json['forceCanceled'] as bool,
    jobId: json['jobId'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    queuedAt: const UnixDateTimeConverter().fromJson(json['queuedAt']),
    startedAt: const UnixDateTimeConverter().fromJson(json['startedAt']),
    status: _$enumDecodeNullable(_$JobExecutionStatusEnumMap, json['status']),
    statusDetails: json['statusDetails'] == null
        ? null
        : JobExecutionStatusDetails.fromJson(
            json['statusDetails'] as Map<String, dynamic>),
    thingArn: json['thingArn'] as String,
    versionNumber: json['versionNumber'] as int,
  );
}

const _$JobExecutionStatusEnumMap = {
  JobExecutionStatus.queued: 'QUEUED',
  JobExecutionStatus.inProgress: 'IN_PROGRESS',
  JobExecutionStatus.succeeded: 'SUCCEEDED',
  JobExecutionStatus.failed: 'FAILED',
  JobExecutionStatus.timedOut: 'TIMED_OUT',
  JobExecutionStatus.rejected: 'REJECTED',
  JobExecutionStatus.removed: 'REMOVED',
  JobExecutionStatus.canceled: 'CANCELED',
};

JobExecutionStatusDetails _$JobExecutionStatusDetailsFromJson(
    Map<String, dynamic> json) {
  return JobExecutionStatusDetails(
    detailsMap: (json['detailsMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

JobExecutionSummary _$JobExecutionSummaryFromJson(Map<String, dynamic> json) {
  return JobExecutionSummary(
    executionNumber: json['executionNumber'] as int,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    queuedAt: const UnixDateTimeConverter().fromJson(json['queuedAt']),
    startedAt: const UnixDateTimeConverter().fromJson(json['startedAt']),
    status: _$enumDecodeNullable(_$JobExecutionStatusEnumMap, json['status']),
  );
}

JobExecutionSummaryForJob _$JobExecutionSummaryForJobFromJson(
    Map<String, dynamic> json) {
  return JobExecutionSummaryForJob(
    jobExecutionSummary: json['jobExecutionSummary'] == null
        ? null
        : JobExecutionSummary.fromJson(
            json['jobExecutionSummary'] as Map<String, dynamic>),
    thingArn: json['thingArn'] as String,
  );
}

JobExecutionSummaryForThing _$JobExecutionSummaryForThingFromJson(
    Map<String, dynamic> json) {
  return JobExecutionSummaryForThing(
    jobExecutionSummary: json['jobExecutionSummary'] == null
        ? null
        : JobExecutionSummary.fromJson(
            json['jobExecutionSummary'] as Map<String, dynamic>),
    jobId: json['jobId'] as String,
  );
}

JobExecutionsRolloutConfig _$JobExecutionsRolloutConfigFromJson(
    Map<String, dynamic> json) {
  return JobExecutionsRolloutConfig(
    exponentialRate: json['exponentialRate'] == null
        ? null
        : ExponentialRolloutRate.fromJson(
            json['exponentialRate'] as Map<String, dynamic>),
    maximumPerMinute: json['maximumPerMinute'] as int,
  );
}

Map<String, dynamic> _$JobExecutionsRolloutConfigToJson(
    JobExecutionsRolloutConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exponentialRate', instance.exponentialRate?.toJson());
  writeNotNull('maximumPerMinute', instance.maximumPerMinute);
  return val;
}

JobProcessDetails _$JobProcessDetailsFromJson(Map<String, dynamic> json) {
  return JobProcessDetails(
    numberOfCanceledThings: json['numberOfCanceledThings'] as int,
    numberOfFailedThings: json['numberOfFailedThings'] as int,
    numberOfInProgressThings: json['numberOfInProgressThings'] as int,
    numberOfQueuedThings: json['numberOfQueuedThings'] as int,
    numberOfRejectedThings: json['numberOfRejectedThings'] as int,
    numberOfRemovedThings: json['numberOfRemovedThings'] as int,
    numberOfSucceededThings: json['numberOfSucceededThings'] as int,
    numberOfTimedOutThings: json['numberOfTimedOutThings'] as int,
    processingTargets:
        (json['processingTargets'] as List)?.map((e) => e as String)?.toList(),
  );
}

JobSummary _$JobSummaryFromJson(Map<String, dynamic> json) {
  return JobSummary(
    completedAt: const UnixDateTimeConverter().fromJson(json['completedAt']),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    jobArn: json['jobArn'] as String,
    jobId: json['jobId'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    status: _$enumDecodeNullable(_$JobStatusEnumMap, json['status']),
    targetSelection:
        _$enumDecodeNullable(_$TargetSelectionEnumMap, json['targetSelection']),
    thingGroupId: json['thingGroupId'] as String,
  );
}

KafkaAction _$KafkaActionFromJson(Map<String, dynamic> json) {
  return KafkaAction(
    clientProperties: (json['clientProperties'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    destinationArn: json['destinationArn'] as String,
    topic: json['topic'] as String,
    key: json['key'] as String,
    partition: json['partition'] as String,
  );
}

Map<String, dynamic> _$KafkaActionToJson(KafkaAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientProperties', instance.clientProperties);
  writeNotNull('destinationArn', instance.destinationArn);
  writeNotNull('topic', instance.topic);
  writeNotNull('key', instance.key);
  writeNotNull('partition', instance.partition);
  return val;
}

KeyPair _$KeyPairFromJson(Map<String, dynamic> json) {
  return KeyPair(
    privateKey: json['PrivateKey'] as String,
    publicKey: json['PublicKey'] as String,
  );
}

KinesisAction _$KinesisActionFromJson(Map<String, dynamic> json) {
  return KinesisAction(
    roleArn: json['roleArn'] as String,
    streamName: json['streamName'] as String,
    partitionKey: json['partitionKey'] as String,
  );
}

Map<String, dynamic> _$KinesisActionToJson(KinesisAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('streamName', instance.streamName);
  writeNotNull('partitionKey', instance.partitionKey);
  return val;
}

LambdaAction _$LambdaActionFromJson(Map<String, dynamic> json) {
  return LambdaAction(
    functionArn: json['functionArn'] as String,
  );
}

Map<String, dynamic> _$LambdaActionToJson(LambdaAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('functionArn', instance.functionArn);
  return val;
}

ListActiveViolationsResponse _$ListActiveViolationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListActiveViolationsResponse(
    activeViolations: (json['activeViolations'] as List)
        ?.map((e) => e == null
            ? null
            : ActiveViolation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAttachedPoliciesResponse _$ListAttachedPoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAttachedPoliciesResponse(
    nextMarker: json['nextMarker'] as String,
    policies: (json['policies'] as List)
        ?.map((e) =>
            e == null ? null : Policy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListAuditFindingsResponse _$ListAuditFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAuditFindingsResponse(
    findings: (json['findings'] as List)
        ?.map((e) =>
            e == null ? null : AuditFinding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAuditMitigationActionsExecutionsResponse
    _$ListAuditMitigationActionsExecutionsResponseFromJson(
        Map<String, dynamic> json) {
  return ListAuditMitigationActionsExecutionsResponse(
    actionsExecutions: (json['actionsExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : AuditMitigationActionExecutionMetadata.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAuditMitigationActionsTasksResponse
    _$ListAuditMitigationActionsTasksResponseFromJson(
        Map<String, dynamic> json) {
  return ListAuditMitigationActionsTasksResponse(
    nextToken: json['nextToken'] as String,
    tasks: (json['tasks'] as List)
        ?.map((e) => e == null
            ? null
            : AuditMitigationActionsTaskMetadata.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListAuditSuppressionsResponse _$ListAuditSuppressionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAuditSuppressionsResponse(
    nextToken: json['nextToken'] as String,
    suppressions: (json['suppressions'] as List)
        ?.map((e) => e == null
            ? null
            : AuditSuppression.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListAuditTasksResponse _$ListAuditTasksResponseFromJson(
    Map<String, dynamic> json) {
  return ListAuditTasksResponse(
    nextToken: json['nextToken'] as String,
    tasks: (json['tasks'] as List)
        ?.map((e) => e == null
            ? null
            : AuditTaskMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListAuthorizersResponse _$ListAuthorizersResponseFromJson(
    Map<String, dynamic> json) {
  return ListAuthorizersResponse(
    authorizers: (json['authorizers'] as List)
        ?.map((e) => e == null
            ? null
            : AuthorizerSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['nextMarker'] as String,
  );
}

ListBillingGroupsResponse _$ListBillingGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListBillingGroupsResponse(
    billingGroups: (json['billingGroups'] as List)
        ?.map((e) => e == null
            ? null
            : GroupNameAndArn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListCACertificatesResponse _$ListCACertificatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListCACertificatesResponse(
    certificates: (json['certificates'] as List)
        ?.map((e) => e == null
            ? null
            : CACertificate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['nextMarker'] as String,
  );
}

ListCertificatesByCAResponse _$ListCertificatesByCAResponseFromJson(
    Map<String, dynamic> json) {
  return ListCertificatesByCAResponse(
    certificates: (json['certificates'] as List)
        ?.map((e) =>
            e == null ? null : Certificate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['nextMarker'] as String,
  );
}

ListCertificatesResponse _$ListCertificatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListCertificatesResponse(
    certificates: (json['certificates'] as List)
        ?.map((e) =>
            e == null ? null : Certificate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['nextMarker'] as String,
  );
}

ListCustomMetricsResponse _$ListCustomMetricsResponseFromJson(
    Map<String, dynamic> json) {
  return ListCustomMetricsResponse(
    metricNames:
        (json['metricNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDetectMitigationActionsExecutionsResponse
    _$ListDetectMitigationActionsExecutionsResponseFromJson(
        Map<String, dynamic> json) {
  return ListDetectMitigationActionsExecutionsResponse(
    actionsExecutions: (json['actionsExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : DetectMitigationActionExecution.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDetectMitigationActionsTasksResponse
    _$ListDetectMitigationActionsTasksResponseFromJson(
        Map<String, dynamic> json) {
  return ListDetectMitigationActionsTasksResponse(
    nextToken: json['nextToken'] as String,
    tasks: (json['tasks'] as List)
        ?.map((e) => e == null
            ? null
            : DetectMitigationActionsTaskSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListDimensionsResponse _$ListDimensionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDimensionsResponse(
    dimensionNames:
        (json['dimensionNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDomainConfigurationsResponse _$ListDomainConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDomainConfigurationsResponse(
    domainConfigurations: (json['domainConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : DomainConfigurationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['nextMarker'] as String,
  );
}

ListIndicesResponse _$ListIndicesResponseFromJson(Map<String, dynamic> json) {
  return ListIndicesResponse(
    indexNames: (json['indexNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListJobExecutionsForJobResponse _$ListJobExecutionsForJobResponseFromJson(
    Map<String, dynamic> json) {
  return ListJobExecutionsForJobResponse(
    executionSummaries: (json['executionSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : JobExecutionSummaryForJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListJobExecutionsForThingResponse _$ListJobExecutionsForThingResponseFromJson(
    Map<String, dynamic> json) {
  return ListJobExecutionsForThingResponse(
    executionSummaries: (json['executionSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : JobExecutionSummaryForThing.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListJobsResponse _$ListJobsResponseFromJson(Map<String, dynamic> json) {
  return ListJobsResponse(
    jobs: (json['jobs'] as List)
        ?.map((e) =>
            e == null ? null : JobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListMitigationActionsResponse _$ListMitigationActionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListMitigationActionsResponse(
    actionIdentifiers: (json['actionIdentifiers'] as List)
        ?.map((e) => e == null
            ? null
            : MitigationActionIdentifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListOTAUpdatesResponse _$ListOTAUpdatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListOTAUpdatesResponse(
    nextToken: json['nextToken'] as String,
    otaUpdates: (json['otaUpdates'] as List)
        ?.map((e) => e == null
            ? null
            : OTAUpdateSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListOutgoingCertificatesResponse _$ListOutgoingCertificatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListOutgoingCertificatesResponse(
    nextMarker: json['nextMarker'] as String,
    outgoingCertificates: (json['outgoingCertificates'] as List)
        ?.map((e) => e == null
            ? null
            : OutgoingCertificate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPoliciesResponse _$ListPoliciesResponseFromJson(Map<String, dynamic> json) {
  return ListPoliciesResponse(
    nextMarker: json['nextMarker'] as String,
    policies: (json['policies'] as List)
        ?.map((e) =>
            e == null ? null : Policy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPolicyPrincipalsResponse _$ListPolicyPrincipalsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPolicyPrincipalsResponse(
    nextMarker: json['nextMarker'] as String,
    principals: (json['principals'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListPolicyVersionsResponse _$ListPolicyVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPolicyVersionsResponse(
    policyVersions: (json['policyVersions'] as List)
        ?.map((e) => e == null
            ? null
            : PolicyVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPrincipalPoliciesResponse _$ListPrincipalPoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return ListPrincipalPoliciesResponse(
    nextMarker: json['nextMarker'] as String,
    policies: (json['policies'] as List)
        ?.map((e) =>
            e == null ? null : Policy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPrincipalThingsResponse _$ListPrincipalThingsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPrincipalThingsResponse(
    nextToken: json['nextToken'] as String,
    things: (json['things'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListProvisioningTemplateVersionsResponse
    _$ListProvisioningTemplateVersionsResponseFromJson(
        Map<String, dynamic> json) {
  return ListProvisioningTemplateVersionsResponse(
    nextToken: json['nextToken'] as String,
    versions: (json['versions'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisioningTemplateVersionSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListProvisioningTemplatesResponse _$ListProvisioningTemplatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListProvisioningTemplatesResponse(
    nextToken: json['nextToken'] as String,
    templates: (json['templates'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisioningTemplateSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRoleAliasesResponse _$ListRoleAliasesResponseFromJson(
    Map<String, dynamic> json) {
  return ListRoleAliasesResponse(
    nextMarker: json['nextMarker'] as String,
    roleAliases:
        (json['roleAliases'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListScheduledAuditsResponse _$ListScheduledAuditsResponseFromJson(
    Map<String, dynamic> json) {
  return ListScheduledAuditsResponse(
    nextToken: json['nextToken'] as String,
    scheduledAudits: (json['scheduledAudits'] as List)
        ?.map((e) => e == null
            ? null
            : ScheduledAuditMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSecurityProfilesForTargetResponse
    _$ListSecurityProfilesForTargetResponseFromJson(Map<String, dynamic> json) {
  return ListSecurityProfilesForTargetResponse(
    nextToken: json['nextToken'] as String,
    securityProfileTargetMappings: (json['securityProfileTargetMappings']
            as List)
        ?.map((e) => e == null
            ? null
            : SecurityProfileTargetMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSecurityProfilesResponse _$ListSecurityProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListSecurityProfilesResponse(
    nextToken: json['nextToken'] as String,
    securityProfileIdentifiers: (json['securityProfileIdentifiers'] as List)
        ?.map((e) => e == null
            ? null
            : SecurityProfileIdentifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListStreamsResponse _$ListStreamsResponseFromJson(Map<String, dynamic> json) {
  return ListStreamsResponse(
    nextToken: json['nextToken'] as String,
    streams: (json['streams'] as List)
        ?.map((e) => e == null
            ? null
            : StreamSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextToken: json['nextToken'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTargetsForPolicyResponse _$ListTargetsForPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return ListTargetsForPolicyResponse(
    nextMarker: json['nextMarker'] as String,
    targets: (json['targets'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListTargetsForSecurityProfileResponse
    _$ListTargetsForSecurityProfileResponseFromJson(Map<String, dynamic> json) {
  return ListTargetsForSecurityProfileResponse(
    nextToken: json['nextToken'] as String,
    securityProfileTargets: (json['securityProfileTargets'] as List)
        ?.map((e) => e == null
            ? null
            : SecurityProfileTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListThingGroupsForThingResponse _$ListThingGroupsForThingResponseFromJson(
    Map<String, dynamic> json) {
  return ListThingGroupsForThingResponse(
    nextToken: json['nextToken'] as String,
    thingGroups: (json['thingGroups'] as List)
        ?.map((e) => e == null
            ? null
            : GroupNameAndArn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListThingGroupsResponse _$ListThingGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListThingGroupsResponse(
    nextToken: json['nextToken'] as String,
    thingGroups: (json['thingGroups'] as List)
        ?.map((e) => e == null
            ? null
            : GroupNameAndArn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListThingPrincipalsResponse _$ListThingPrincipalsResponseFromJson(
    Map<String, dynamic> json) {
  return ListThingPrincipalsResponse(
    nextToken: json['nextToken'] as String,
    principals: (json['principals'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListThingRegistrationTaskReportsResponse
    _$ListThingRegistrationTaskReportsResponseFromJson(
        Map<String, dynamic> json) {
  return ListThingRegistrationTaskReportsResponse(
    nextToken: json['nextToken'] as String,
    reportType: _$enumDecodeNullable(_$ReportTypeEnumMap, json['reportType']),
    resourceLinks:
        (json['resourceLinks'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$ReportTypeEnumMap = {
  ReportType.errors: 'ERRORS',
  ReportType.results: 'RESULTS',
};

ListThingRegistrationTasksResponse _$ListThingRegistrationTasksResponseFromJson(
    Map<String, dynamic> json) {
  return ListThingRegistrationTasksResponse(
    nextToken: json['nextToken'] as String,
    taskIds: (json['taskIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListThingTypesResponse _$ListThingTypesResponseFromJson(
    Map<String, dynamic> json) {
  return ListThingTypesResponse(
    nextToken: json['nextToken'] as String,
    thingTypes: (json['thingTypes'] as List)
        ?.map((e) => e == null
            ? null
            : ThingTypeDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListThingsInBillingGroupResponse _$ListThingsInBillingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return ListThingsInBillingGroupResponse(
    nextToken: json['nextToken'] as String,
    things: (json['things'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListThingsInThingGroupResponse _$ListThingsInThingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return ListThingsInThingGroupResponse(
    nextToken: json['nextToken'] as String,
    things: (json['things'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListThingsResponse _$ListThingsResponseFromJson(Map<String, dynamic> json) {
  return ListThingsResponse(
    nextToken: json['nextToken'] as String,
    things: (json['things'] as List)
        ?.map((e) => e == null
            ? null
            : ThingAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTopicRuleDestinationsResponse _$ListTopicRuleDestinationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTopicRuleDestinationsResponse(
    destinationSummaries: (json['destinationSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : TopicRuleDestinationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTopicRulesResponse _$ListTopicRulesResponseFromJson(
    Map<String, dynamic> json) {
  return ListTopicRulesResponse(
    nextToken: json['nextToken'] as String,
    rules: (json['rules'] as List)
        ?.map((e) => e == null
            ? null
            : TopicRuleListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListV2LoggingLevelsResponse _$ListV2LoggingLevelsResponseFromJson(
    Map<String, dynamic> json) {
  return ListV2LoggingLevelsResponse(
    logTargetConfigurations: (json['logTargetConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : LogTargetConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListViolationEventsResponse _$ListViolationEventsResponseFromJson(
    Map<String, dynamic> json) {
  return ListViolationEventsResponse(
    nextToken: json['nextToken'] as String,
    violationEvents: (json['violationEvents'] as List)
        ?.map((e) => e == null
            ? null
            : ViolationEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LogTarget _$LogTargetFromJson(Map<String, dynamic> json) {
  return LogTarget(
    targetType:
        _$enumDecodeNullable(_$LogTargetTypeEnumMap, json['targetType']),
    targetName: json['targetName'] as String,
  );
}

Map<String, dynamic> _$LogTargetToJson(LogTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('targetType', _$LogTargetTypeEnumMap[instance.targetType]);
  writeNotNull('targetName', instance.targetName);
  return val;
}

const _$LogTargetTypeEnumMap = {
  LogTargetType.$default: 'DEFAULT',
  LogTargetType.thingGroup: 'THING_GROUP',
};

LogTargetConfiguration _$LogTargetConfigurationFromJson(
    Map<String, dynamic> json) {
  return LogTargetConfiguration(
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']),
    logTarget: json['logTarget'] == null
        ? null
        : LogTarget.fromJson(json['logTarget'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoggingOptionsPayloadToJson(
    LoggingOptionsPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('logLevel', _$LogLevelEnumMap[instance.logLevel]);
  return val;
}

MachineLearningDetectionConfig _$MachineLearningDetectionConfigFromJson(
    Map<String, dynamic> json) {
  return MachineLearningDetectionConfig(
    confidenceLevel:
        _$enumDecodeNullable(_$ConfidenceLevelEnumMap, json['confidenceLevel']),
  );
}

Map<String, dynamic> _$MachineLearningDetectionConfigToJson(
    MachineLearningDetectionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'confidenceLevel', _$ConfidenceLevelEnumMap[instance.confidenceLevel]);
  return val;
}

const _$ConfidenceLevelEnumMap = {
  ConfidenceLevel.low: 'LOW',
  ConfidenceLevel.medium: 'MEDIUM',
  ConfidenceLevel.high: 'HIGH',
};

MetricDimension _$MetricDimensionFromJson(Map<String, dynamic> json) {
  return MetricDimension(
    dimensionName: json['dimensionName'] as String,
    operator:
        _$enumDecodeNullable(_$DimensionValueOperatorEnumMap, json['operator']),
  );
}

Map<String, dynamic> _$MetricDimensionToJson(MetricDimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dimensionName', instance.dimensionName);
  writeNotNull('operator', _$DimensionValueOperatorEnumMap[instance.operator]);
  return val;
}

const _$DimensionValueOperatorEnumMap = {
  DimensionValueOperator.$in: 'IN',
  DimensionValueOperator.notIn: 'NOT_IN',
};

MetricToRetain _$MetricToRetainFromJson(Map<String, dynamic> json) {
  return MetricToRetain(
    metric: json['metric'] as String,
    metricDimension: json['metricDimension'] == null
        ? null
        : MetricDimension.fromJson(
            json['metricDimension'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MetricToRetainToJson(MetricToRetain instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metric', instance.metric);
  writeNotNull('metricDimension', instance.metricDimension?.toJson());
  return val;
}

MetricValue _$MetricValueFromJson(Map<String, dynamic> json) {
  return MetricValue(
    cidrs: (json['cidrs'] as List)?.map((e) => e as String)?.toList(),
    count: json['count'] as int,
    number: (json['number'] as num)?.toDouble(),
    numbers:
        (json['numbers'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
    ports: (json['ports'] as List)?.map((e) => e as int)?.toList(),
    strings: (json['strings'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MetricValueToJson(MetricValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cidrs', instance.cidrs);
  writeNotNull('count', instance.count);
  writeNotNull('number', instance.number);
  writeNotNull('numbers', instance.numbers);
  writeNotNull('ports', instance.ports);
  writeNotNull('strings', instance.strings);
  return val;
}

MitigationAction _$MitigationActionFromJson(Map<String, dynamic> json) {
  return MitigationAction(
    actionParams: json['actionParams'] == null
        ? null
        : MitigationActionParams.fromJson(
            json['actionParams'] as Map<String, dynamic>),
    id: json['id'] as String,
    name: json['name'] as String,
    roleArn: json['roleArn'] as String,
  );
}

MitigationActionIdentifier _$MitigationActionIdentifierFromJson(
    Map<String, dynamic> json) {
  return MitigationActionIdentifier(
    actionArn: json['actionArn'] as String,
    actionName: json['actionName'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
  );
}

MitigationActionParams _$MitigationActionParamsFromJson(
    Map<String, dynamic> json) {
  return MitigationActionParams(
    addThingsToThingGroupParams: json['addThingsToThingGroupParams'] == null
        ? null
        : AddThingsToThingGroupParams.fromJson(
            json['addThingsToThingGroupParams'] as Map<String, dynamic>),
    enableIoTLoggingParams: json['enableIoTLoggingParams'] == null
        ? null
        : EnableIoTLoggingParams.fromJson(
            json['enableIoTLoggingParams'] as Map<String, dynamic>),
    publishFindingToSnsParams: json['publishFindingToSnsParams'] == null
        ? null
        : PublishFindingToSnsParams.fromJson(
            json['publishFindingToSnsParams'] as Map<String, dynamic>),
    replaceDefaultPolicyVersionParams:
        json['replaceDefaultPolicyVersionParams'] == null
            ? null
            : ReplaceDefaultPolicyVersionParams.fromJson(
                json['replaceDefaultPolicyVersionParams']
                    as Map<String, dynamic>),
    updateCACertificateParams: json['updateCACertificateParams'] == null
        ? null
        : UpdateCACertificateParams.fromJson(
            json['updateCACertificateParams'] as Map<String, dynamic>),
    updateDeviceCertificateParams: json['updateDeviceCertificateParams'] == null
        ? null
        : UpdateDeviceCertificateParams.fromJson(
            json['updateDeviceCertificateParams'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MitigationActionParamsToJson(
    MitigationActionParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('addThingsToThingGroupParams',
      instance.addThingsToThingGroupParams?.toJson());
  writeNotNull(
      'enableIoTLoggingParams', instance.enableIoTLoggingParams?.toJson());
  writeNotNull('publishFindingToSnsParams',
      instance.publishFindingToSnsParams?.toJson());
  writeNotNull('replaceDefaultPolicyVersionParams',
      instance.replaceDefaultPolicyVersionParams?.toJson());
  writeNotNull('updateCACertificateParams',
      instance.updateCACertificateParams?.toJson());
  writeNotNull('updateDeviceCertificateParams',
      instance.updateDeviceCertificateParams?.toJson());
  return val;
}

Map<String, dynamic> _$MqttContextToJson(MqttContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull(
      'password', const Uint8ListConverter().toJson(instance.password));
  writeNotNull('username', instance.username);
  return val;
}

NonCompliantResource _$NonCompliantResourceFromJson(Map<String, dynamic> json) {
  return NonCompliantResource(
    additionalInfo: (json['additionalInfo'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    resourceIdentifier: json['resourceIdentifier'] == null
        ? null
        : ResourceIdentifier.fromJson(
            json['resourceIdentifier'] as Map<String, dynamic>),
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
  );
}

const _$ResourceTypeEnumMap = {
  ResourceType.deviceCertificate: 'DEVICE_CERTIFICATE',
  ResourceType.caCertificate: 'CA_CERTIFICATE',
  ResourceType.iotPolicy: 'IOT_POLICY',
  ResourceType.cognitoIdentityPool: 'COGNITO_IDENTITY_POOL',
  ResourceType.clientId: 'CLIENT_ID',
  ResourceType.accountSettings: 'ACCOUNT_SETTINGS',
  ResourceType.roleAlias: 'ROLE_ALIAS',
  ResourceType.iamRole: 'IAM_ROLE',
};

OTAUpdateFile _$OTAUpdateFileFromJson(Map<String, dynamic> json) {
  return OTAUpdateFile(
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    codeSigning: json['codeSigning'] == null
        ? null
        : CodeSigning.fromJson(json['codeSigning'] as Map<String, dynamic>),
    fileLocation: json['fileLocation'] == null
        ? null
        : FileLocation.fromJson(json['fileLocation'] as Map<String, dynamic>),
    fileName: json['fileName'] as String,
    fileType: json['fileType'] as int,
    fileVersion: json['fileVersion'] as String,
  );
}

Map<String, dynamic> _$OTAUpdateFileToJson(OTAUpdateFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributes', instance.attributes);
  writeNotNull('codeSigning', instance.codeSigning?.toJson());
  writeNotNull('fileLocation', instance.fileLocation?.toJson());
  writeNotNull('fileName', instance.fileName);
  writeNotNull('fileType', instance.fileType);
  writeNotNull('fileVersion', instance.fileVersion);
  return val;
}

OTAUpdateInfo _$OTAUpdateInfoFromJson(Map<String, dynamic> json) {
  return OTAUpdateInfo(
    additionalParameters:
        (json['additionalParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    awsIotJobArn: json['awsIotJobArn'] as String,
    awsIotJobId: json['awsIotJobId'] as String,
    awsJobExecutionsRolloutConfig: json['awsJobExecutionsRolloutConfig'] == null
        ? null
        : AwsJobExecutionsRolloutConfig.fromJson(
            json['awsJobExecutionsRolloutConfig'] as Map<String, dynamic>),
    awsJobPresignedUrlConfig: json['awsJobPresignedUrlConfig'] == null
        ? null
        : AwsJobPresignedUrlConfig.fromJson(
            json['awsJobPresignedUrlConfig'] as Map<String, dynamic>),
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    description: json['description'] as String,
    errorInfo: json['errorInfo'] == null
        ? null
        : ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    otaUpdateArn: json['otaUpdateArn'] as String,
    otaUpdateFiles: (json['otaUpdateFiles'] as List)
        ?.map((e) => e == null
            ? null
            : OTAUpdateFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    otaUpdateId: json['otaUpdateId'] as String,
    otaUpdateStatus:
        _$enumDecodeNullable(_$OTAUpdateStatusEnumMap, json['otaUpdateStatus']),
    protocols: (json['protocols'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ProtocolEnumMap, e))
        ?.toList(),
    targetSelection:
        _$enumDecodeNullable(_$TargetSelectionEnumMap, json['targetSelection']),
    targets: (json['targets'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$ProtocolEnumMap = {
  Protocol.mqtt: 'MQTT',
  Protocol.http: 'HTTP',
};

OTAUpdateSummary _$OTAUpdateSummaryFromJson(Map<String, dynamic> json) {
  return OTAUpdateSummary(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    otaUpdateArn: json['otaUpdateArn'] as String,
    otaUpdateId: json['otaUpdateId'] as String,
  );
}

OutgoingCertificate _$OutgoingCertificateFromJson(Map<String, dynamic> json) {
  return OutgoingCertificate(
    certificateArn: json['certificateArn'] as String,
    certificateId: json['certificateId'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    transferDate: const UnixDateTimeConverter().fromJson(json['transferDate']),
    transferMessage: json['transferMessage'] as String,
    transferredTo: json['transferredTo'] as String,
  );
}

PercentPair _$PercentPairFromJson(Map<String, dynamic> json) {
  return PercentPair(
    percent: (json['percent'] as num)?.toDouble(),
    value: (json['value'] as num)?.toDouble(),
  );
}

Policy _$PolicyFromJson(Map<String, dynamic> json) {
  return Policy(
    policyArn: json['policyArn'] as String,
    policyName: json['policyName'] as String,
  );
}

PolicyVersion _$PolicyVersionFromJson(Map<String, dynamic> json) {
  return PolicyVersion(
    createDate: const UnixDateTimeConverter().fromJson(json['createDate']),
    isDefaultVersion: json['isDefaultVersion'] as bool,
    versionId: json['versionId'] as String,
  );
}

PolicyVersionIdentifier _$PolicyVersionIdentifierFromJson(
    Map<String, dynamic> json) {
  return PolicyVersionIdentifier(
    policyName: json['policyName'] as String,
    policyVersionId: json['policyVersionId'] as String,
  );
}

Map<String, dynamic> _$PolicyVersionIdentifierToJson(
    PolicyVersionIdentifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('policyName', instance.policyName);
  writeNotNull('policyVersionId', instance.policyVersionId);
  return val;
}

PresignedUrlConfig _$PresignedUrlConfigFromJson(Map<String, dynamic> json) {
  return PresignedUrlConfig(
    expiresInSec: json['expiresInSec'] as int,
    roleArn: json['roleArn'] as String,
  );
}

Map<String, dynamic> _$PresignedUrlConfigToJson(PresignedUrlConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expiresInSec', instance.expiresInSec);
  writeNotNull('roleArn', instance.roleArn);
  return val;
}

ProvisioningHook _$ProvisioningHookFromJson(Map<String, dynamic> json) {
  return ProvisioningHook(
    targetArn: json['targetArn'] as String,
    payloadVersion: json['payloadVersion'] as String,
  );
}

Map<String, dynamic> _$ProvisioningHookToJson(ProvisioningHook instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('targetArn', instance.targetArn);
  writeNotNull('payloadVersion', instance.payloadVersion);
  return val;
}

ProvisioningTemplateSummary _$ProvisioningTemplateSummaryFromJson(
    Map<String, dynamic> json) {
  return ProvisioningTemplateSummary(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    description: json['description'] as String,
    enabled: json['enabled'] as bool,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    templateArn: json['templateArn'] as String,
    templateName: json['templateName'] as String,
  );
}

ProvisioningTemplateVersionSummary _$ProvisioningTemplateVersionSummaryFromJson(
    Map<String, dynamic> json) {
  return ProvisioningTemplateVersionSummary(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    isDefaultVersion: json['isDefaultVersion'] as bool,
    versionId: json['versionId'] as int,
  );
}

PublishFindingToSnsParams _$PublishFindingToSnsParamsFromJson(
    Map<String, dynamic> json) {
  return PublishFindingToSnsParams(
    topicArn: json['topicArn'] as String,
  );
}

Map<String, dynamic> _$PublishFindingToSnsParamsToJson(
    PublishFindingToSnsParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('topicArn', instance.topicArn);
  return val;
}

PutAssetPropertyValueEntry _$PutAssetPropertyValueEntryFromJson(
    Map<String, dynamic> json) {
  return PutAssetPropertyValueEntry(
    propertyValues: (json['propertyValues'] as List)
        ?.map((e) => e == null
            ? null
            : AssetPropertyValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    assetId: json['assetId'] as String,
    entryId: json['entryId'] as String,
    propertyAlias: json['propertyAlias'] as String,
    propertyId: json['propertyId'] as String,
  );
}

Map<String, dynamic> _$PutAssetPropertyValueEntryToJson(
    PutAssetPropertyValueEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('propertyValues',
      instance.propertyValues?.map((e) => e?.toJson())?.toList());
  writeNotNull('assetId', instance.assetId);
  writeNotNull('entryId', instance.entryId);
  writeNotNull('propertyAlias', instance.propertyAlias);
  writeNotNull('propertyId', instance.propertyId);
  return val;
}

PutItemInput _$PutItemInputFromJson(Map<String, dynamic> json) {
  return PutItemInput(
    tableName: json['tableName'] as String,
  );
}

Map<String, dynamic> _$PutItemInputToJson(PutItemInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tableName', instance.tableName);
  return val;
}

RateIncreaseCriteria _$RateIncreaseCriteriaFromJson(Map<String, dynamic> json) {
  return RateIncreaseCriteria(
    numberOfNotifiedThings: json['numberOfNotifiedThings'] as int,
    numberOfSucceededThings: json['numberOfSucceededThings'] as int,
  );
}

Map<String, dynamic> _$RateIncreaseCriteriaToJson(
    RateIncreaseCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('numberOfNotifiedThings', instance.numberOfNotifiedThings);
  writeNotNull('numberOfSucceededThings', instance.numberOfSucceededThings);
  return val;
}

RegisterCACertificateResponse _$RegisterCACertificateResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterCACertificateResponse(
    certificateArn: json['certificateArn'] as String,
    certificateId: json['certificateId'] as String,
  );
}

RegisterCertificateResponse _$RegisterCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterCertificateResponse(
    certificateArn: json['certificateArn'] as String,
    certificateId: json['certificateId'] as String,
  );
}

RegisterCertificateWithoutCAResponse
    _$RegisterCertificateWithoutCAResponseFromJson(Map<String, dynamic> json) {
  return RegisterCertificateWithoutCAResponse(
    certificateArn: json['certificateArn'] as String,
    certificateId: json['certificateId'] as String,
  );
}

RegisterThingResponse _$RegisterThingResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterThingResponse(
    certificatePem: json['certificatePem'] as String,
    resourceArns: (json['resourceArns'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

RegistrationConfig _$RegistrationConfigFromJson(Map<String, dynamic> json) {
  return RegistrationConfig(
    roleArn: json['roleArn'] as String,
    templateBody: json['templateBody'] as String,
  );
}

Map<String, dynamic> _$RegistrationConfigToJson(RegistrationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('templateBody', instance.templateBody);
  return val;
}

RelatedResource _$RelatedResourceFromJson(Map<String, dynamic> json) {
  return RelatedResource(
    additionalInfo: (json['additionalInfo'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    resourceIdentifier: json['resourceIdentifier'] == null
        ? null
        : ResourceIdentifier.fromJson(
            json['resourceIdentifier'] as Map<String, dynamic>),
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
  );
}

RemoveThingFromBillingGroupResponse
    _$RemoveThingFromBillingGroupResponseFromJson(Map<String, dynamic> json) {
  return RemoveThingFromBillingGroupResponse();
}

RemoveThingFromThingGroupResponse _$RemoveThingFromThingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveThingFromThingGroupResponse();
}

ReplaceDefaultPolicyVersionParams _$ReplaceDefaultPolicyVersionParamsFromJson(
    Map<String, dynamic> json) {
  return ReplaceDefaultPolicyVersionParams(
    templateName:
        _$enumDecodeNullable(_$PolicyTemplateNameEnumMap, json['templateName']),
  );
}

Map<String, dynamic> _$ReplaceDefaultPolicyVersionParamsToJson(
    ReplaceDefaultPolicyVersionParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'templateName', _$PolicyTemplateNameEnumMap[instance.templateName]);
  return val;
}

const _$PolicyTemplateNameEnumMap = {
  PolicyTemplateName.blankPolicy: 'BLANK_POLICY',
};

RepublishAction _$RepublishActionFromJson(Map<String, dynamic> json) {
  return RepublishAction(
    roleArn: json['roleArn'] as String,
    topic: json['topic'] as String,
    qos: json['qos'] as int,
  );
}

Map<String, dynamic> _$RepublishActionToJson(RepublishAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('topic', instance.topic);
  writeNotNull('qos', instance.qos);
  return val;
}

ResourceIdentifier _$ResourceIdentifierFromJson(Map<String, dynamic> json) {
  return ResourceIdentifier(
    account: json['account'] as String,
    caCertificateId: json['caCertificateId'] as String,
    clientId: json['clientId'] as String,
    cognitoIdentityPoolId: json['cognitoIdentityPoolId'] as String,
    deviceCertificateId: json['deviceCertificateId'] as String,
    iamRoleArn: json['iamRoleArn'] as String,
    policyVersionIdentifier: json['policyVersionIdentifier'] == null
        ? null
        : PolicyVersionIdentifier.fromJson(
            json['policyVersionIdentifier'] as Map<String, dynamic>),
    roleAliasArn: json['roleAliasArn'] as String,
  );
}

Map<String, dynamic> _$ResourceIdentifierToJson(ResourceIdentifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('account', instance.account);
  writeNotNull('caCertificateId', instance.caCertificateId);
  writeNotNull('clientId', instance.clientId);
  writeNotNull('cognitoIdentityPoolId', instance.cognitoIdentityPoolId);
  writeNotNull('deviceCertificateId', instance.deviceCertificateId);
  writeNotNull('iamRoleArn', instance.iamRoleArn);
  writeNotNull(
      'policyVersionIdentifier', instance.policyVersionIdentifier?.toJson());
  writeNotNull('roleAliasArn', instance.roleAliasArn);
  return val;
}

RoleAliasDescription _$RoleAliasDescriptionFromJson(Map<String, dynamic> json) {
  return RoleAliasDescription(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    credentialDurationSeconds: json['credentialDurationSeconds'] as int,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    owner: json['owner'] as String,
    roleAlias: json['roleAlias'] as String,
    roleAliasArn: json['roleAliasArn'] as String,
    roleArn: json['roleArn'] as String,
  );
}

S3Action _$S3ActionFromJson(Map<String, dynamic> json) {
  return S3Action(
    bucketName: json['bucketName'] as String,
    key: json['key'] as String,
    roleArn: json['roleArn'] as String,
    cannedAcl: _$enumDecodeNullable(
        _$CannedAccessControlListEnumMap, json['cannedAcl']),
  );
}

Map<String, dynamic> _$S3ActionToJson(S3Action instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('key', instance.key);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull(
      'cannedAcl', _$CannedAccessControlListEnumMap[instance.cannedAcl]);
  return val;
}

const _$CannedAccessControlListEnumMap = {
  CannedAccessControlList.private: 'private',
  CannedAccessControlList.publicRead: 'public-read',
  CannedAccessControlList.publicReadWrite: 'public-read-write',
  CannedAccessControlList.awsExecRead: 'aws-exec-read',
  CannedAccessControlList.authenticatedRead: 'authenticated-read',
  CannedAccessControlList.bucketOwnerRead: 'bucket-owner-read',
  CannedAccessControlList.bucketOwnerFullControl: 'bucket-owner-full-control',
  CannedAccessControlList.logDeliveryWrite: 'log-delivery-write',
};

S3Destination _$S3DestinationFromJson(Map<String, dynamic> json) {
  return S3Destination(
    bucket: json['bucket'] as String,
    prefix: json['prefix'] as String,
  );
}

Map<String, dynamic> _$S3DestinationToJson(S3Destination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucket', instance.bucket);
  writeNotNull('prefix', instance.prefix);
  return val;
}

S3Location _$S3LocationFromJson(Map<String, dynamic> json) {
  return S3Location(
    bucket: json['bucket'] as String,
    key: json['key'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$S3LocationToJson(S3Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucket', instance.bucket);
  writeNotNull('key', instance.key);
  writeNotNull('version', instance.version);
  return val;
}

SalesforceAction _$SalesforceActionFromJson(Map<String, dynamic> json) {
  return SalesforceAction(
    token: json['token'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$SalesforceActionToJson(SalesforceAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('url', instance.url);
  return val;
}

ScheduledAuditMetadata _$ScheduledAuditMetadataFromJson(
    Map<String, dynamic> json) {
  return ScheduledAuditMetadata(
    dayOfMonth: json['dayOfMonth'] as String,
    dayOfWeek: _$enumDecodeNullable(_$DayOfWeekEnumMap, json['dayOfWeek']),
    frequency: _$enumDecodeNullable(_$AuditFrequencyEnumMap, json['frequency']),
    scheduledAuditArn: json['scheduledAuditArn'] as String,
    scheduledAuditName: json['scheduledAuditName'] as String,
  );
}

SearchIndexResponse _$SearchIndexResponseFromJson(Map<String, dynamic> json) {
  return SearchIndexResponse(
    nextToken: json['nextToken'] as String,
    thingGroups: (json['thingGroups'] as List)
        ?.map((e) => e == null
            ? null
            : ThingGroupDocument.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    things: (json['things'] as List)
        ?.map((e) => e == null
            ? null
            : ThingDocument.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SecurityProfileIdentifier _$SecurityProfileIdentifierFromJson(
    Map<String, dynamic> json) {
  return SecurityProfileIdentifier(
    arn: json['arn'] as String,
    name: json['name'] as String,
  );
}

SecurityProfileTarget _$SecurityProfileTargetFromJson(
    Map<String, dynamic> json) {
  return SecurityProfileTarget(
    arn: json['arn'] as String,
  );
}

SecurityProfileTargetMapping _$SecurityProfileTargetMappingFromJson(
    Map<String, dynamic> json) {
  return SecurityProfileTargetMapping(
    securityProfileIdentifier: json['securityProfileIdentifier'] == null
        ? null
        : SecurityProfileIdentifier.fromJson(
            json['securityProfileIdentifier'] as Map<String, dynamic>),
    target: json['target'] == null
        ? null
        : SecurityProfileTarget.fromJson(
            json['target'] as Map<String, dynamic>),
  );
}

ServerCertificateSummary _$ServerCertificateSummaryFromJson(
    Map<String, dynamic> json) {
  return ServerCertificateSummary(
    serverCertificateArn: json['serverCertificateArn'] as String,
    serverCertificateStatus: _$enumDecodeNullable(
        _$ServerCertificateStatusEnumMap, json['serverCertificateStatus']),
    serverCertificateStatusDetail:
        json['serverCertificateStatusDetail'] as String,
  );
}

const _$ServerCertificateStatusEnumMap = {
  ServerCertificateStatus.invalid: 'INVALID',
  ServerCertificateStatus.valid: 'VALID',
};

SetDefaultAuthorizerResponse _$SetDefaultAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return SetDefaultAuthorizerResponse(
    authorizerArn: json['authorizerArn'] as String,
    authorizerName: json['authorizerName'] as String,
  );
}

SigV4Authorization _$SigV4AuthorizationFromJson(Map<String, dynamic> json) {
  return SigV4Authorization(
    roleArn: json['roleArn'] as String,
    serviceName: json['serviceName'] as String,
    signingRegion: json['signingRegion'] as String,
  );
}

Map<String, dynamic> _$SigV4AuthorizationToJson(SigV4Authorization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('serviceName', instance.serviceName);
  writeNotNull('signingRegion', instance.signingRegion);
  return val;
}

SigningProfileParameter _$SigningProfileParameterFromJson(
    Map<String, dynamic> json) {
  return SigningProfileParameter(
    certificateArn: json['certificateArn'] as String,
    certificatePathOnDevice: json['certificatePathOnDevice'] as String,
    platform: json['platform'] as String,
  );
}

Map<String, dynamic> _$SigningProfileParameterToJson(
    SigningProfileParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateArn', instance.certificateArn);
  writeNotNull('certificatePathOnDevice', instance.certificatePathOnDevice);
  writeNotNull('platform', instance.platform);
  return val;
}

SnsAction _$SnsActionFromJson(Map<String, dynamic> json) {
  return SnsAction(
    roleArn: json['roleArn'] as String,
    targetArn: json['targetArn'] as String,
    messageFormat:
        _$enumDecodeNullable(_$MessageFormatEnumMap, json['messageFormat']),
  );
}

Map<String, dynamic> _$SnsActionToJson(SnsAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('targetArn', instance.targetArn);
  writeNotNull('messageFormat', _$MessageFormatEnumMap[instance.messageFormat]);
  return val;
}

const _$MessageFormatEnumMap = {
  MessageFormat.raw: 'RAW',
  MessageFormat.json: 'JSON',
};

SqsAction _$SqsActionFromJson(Map<String, dynamic> json) {
  return SqsAction(
    queueUrl: json['queueUrl'] as String,
    roleArn: json['roleArn'] as String,
    useBase64: json['useBase64'] as bool,
  );
}

Map<String, dynamic> _$SqsActionToJson(SqsAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('queueUrl', instance.queueUrl);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('useBase64', instance.useBase64);
  return val;
}

StartAuditMitigationActionsTaskResponse
    _$StartAuditMitigationActionsTaskResponseFromJson(
        Map<String, dynamic> json) {
  return StartAuditMitigationActionsTaskResponse(
    taskId: json['taskId'] as String,
  );
}

StartDetectMitigationActionsTaskResponse
    _$StartDetectMitigationActionsTaskResponseFromJson(
        Map<String, dynamic> json) {
  return StartDetectMitigationActionsTaskResponse(
    taskId: json['taskId'] as String,
  );
}

StartOnDemandAuditTaskResponse _$StartOnDemandAuditTaskResponseFromJson(
    Map<String, dynamic> json) {
  return StartOnDemandAuditTaskResponse(
    taskId: json['taskId'] as String,
  );
}

StartSigningJobParameter _$StartSigningJobParameterFromJson(
    Map<String, dynamic> json) {
  return StartSigningJobParameter(
    destination: json['destination'] == null
        ? null
        : Destination.fromJson(json['destination'] as Map<String, dynamic>),
    signingProfileName: json['signingProfileName'] as String,
    signingProfileParameter: json['signingProfileParameter'] == null
        ? null
        : SigningProfileParameter.fromJson(
            json['signingProfileParameter'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StartSigningJobParameterToJson(
    StartSigningJobParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull('signingProfileName', instance.signingProfileName);
  writeNotNull(
      'signingProfileParameter', instance.signingProfileParameter?.toJson());
  return val;
}

StartThingRegistrationTaskResponse _$StartThingRegistrationTaskResponseFromJson(
    Map<String, dynamic> json) {
  return StartThingRegistrationTaskResponse(
    taskId: json['taskId'] as String,
  );
}

StatisticalThreshold _$StatisticalThresholdFromJson(Map<String, dynamic> json) {
  return StatisticalThreshold(
    statistic: json['statistic'] as String,
  );
}

Map<String, dynamic> _$StatisticalThresholdToJson(
    StatisticalThreshold instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('statistic', instance.statistic);
  return val;
}

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return Statistics(
    average: (json['average'] as num)?.toDouble(),
    count: json['count'] as int,
    maximum: (json['maximum'] as num)?.toDouble(),
    minimum: (json['minimum'] as num)?.toDouble(),
    stdDeviation: (json['stdDeviation'] as num)?.toDouble(),
    sum: (json['sum'] as num)?.toDouble(),
    sumOfSquares: (json['sumOfSquares'] as num)?.toDouble(),
    variance: (json['variance'] as num)?.toDouble(),
  );
}

StepFunctionsAction _$StepFunctionsActionFromJson(Map<String, dynamic> json) {
  return StepFunctionsAction(
    roleArn: json['roleArn'] as String,
    stateMachineName: json['stateMachineName'] as String,
    executionNamePrefix: json['executionNamePrefix'] as String,
  );
}

Map<String, dynamic> _$StepFunctionsActionToJson(StepFunctionsAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('stateMachineName', instance.stateMachineName);
  writeNotNull('executionNamePrefix', instance.executionNamePrefix);
  return val;
}

StopThingRegistrationTaskResponse _$StopThingRegistrationTaskResponseFromJson(
    Map<String, dynamic> json) {
  return StopThingRegistrationTaskResponse();
}

Stream _$StreamFromJson(Map<String, dynamic> json) {
  return Stream(
    fileId: json['fileId'] as int,
    streamId: json['streamId'] as String,
  );
}

Map<String, dynamic> _$StreamToJson(Stream instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fileId', instance.fileId);
  writeNotNull('streamId', instance.streamId);
  return val;
}

StreamFile _$StreamFileFromJson(Map<String, dynamic> json) {
  return StreamFile(
    fileId: json['fileId'] as int,
    s3Location: json['s3Location'] == null
        ? null
        : S3Location.fromJson(json['s3Location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StreamFileToJson(StreamFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fileId', instance.fileId);
  writeNotNull('s3Location', instance.s3Location?.toJson());
  return val;
}

StreamInfo _$StreamInfoFromJson(Map<String, dynamic> json) {
  return StreamInfo(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    files: (json['files'] as List)
        ?.map((e) =>
            e == null ? null : StreamFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    roleArn: json['roleArn'] as String,
    streamArn: json['streamArn'] as String,
    streamId: json['streamId'] as String,
    streamVersion: json['streamVersion'] as int,
  );
}

StreamSummary _$StreamSummaryFromJson(Map<String, dynamic> json) {
  return StreamSummary(
    description: json['description'] as String,
    streamArn: json['streamArn'] as String,
    streamId: json['streamId'] as String,
    streamVersion: json['streamVersion'] as int,
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

TaskStatistics _$TaskStatisticsFromJson(Map<String, dynamic> json) {
  return TaskStatistics(
    canceledChecks: json['canceledChecks'] as int,
    compliantChecks: json['compliantChecks'] as int,
    failedChecks: json['failedChecks'] as int,
    inProgressChecks: json['inProgressChecks'] as int,
    nonCompliantChecks: json['nonCompliantChecks'] as int,
    totalChecks: json['totalChecks'] as int,
    waitingForDataCollectionChecks:
        json['waitingForDataCollectionChecks'] as int,
  );
}

TaskStatisticsForAuditCheck _$TaskStatisticsForAuditCheckFromJson(
    Map<String, dynamic> json) {
  return TaskStatisticsForAuditCheck(
    canceledFindingsCount: json['canceledFindingsCount'] as int,
    failedFindingsCount: json['failedFindingsCount'] as int,
    skippedFindingsCount: json['skippedFindingsCount'] as int,
    succeededFindingsCount: json['succeededFindingsCount'] as int,
    totalFindingsCount: json['totalFindingsCount'] as int,
  );
}

TestAuthorizationResponse _$TestAuthorizationResponseFromJson(
    Map<String, dynamic> json) {
  return TestAuthorizationResponse(
    authResults: (json['authResults'] as List)
        ?.map((e) =>
            e == null ? null : AuthResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

TestInvokeAuthorizerResponse _$TestInvokeAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return TestInvokeAuthorizerResponse(
    disconnectAfterInSeconds: json['disconnectAfterInSeconds'] as int,
    isAuthenticated: json['isAuthenticated'] as bool,
    policyDocuments:
        (json['policyDocuments'] as List)?.map((e) => e as String)?.toList(),
    principalId: json['principalId'] as String,
    refreshAfterInSeconds: json['refreshAfterInSeconds'] as int,
  );
}

ThingAttribute _$ThingAttributeFromJson(Map<String, dynamic> json) {
  return ThingAttribute(
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    thingArn: json['thingArn'] as String,
    thingName: json['thingName'] as String,
    thingTypeName: json['thingTypeName'] as String,
    version: json['version'] as int,
  );
}

ThingConnectivity _$ThingConnectivityFromJson(Map<String, dynamic> json) {
  return ThingConnectivity(
    connected: json['connected'] as bool,
    timestamp: json['timestamp'] as int,
  );
}

ThingDocument _$ThingDocumentFromJson(Map<String, dynamic> json) {
  return ThingDocument(
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    connectivity: json['connectivity'] == null
        ? null
        : ThingConnectivity.fromJson(
            json['connectivity'] as Map<String, dynamic>),
    shadow: json['shadow'] as String,
    thingGroupNames:
        (json['thingGroupNames'] as List)?.map((e) => e as String)?.toList(),
    thingId: json['thingId'] as String,
    thingName: json['thingName'] as String,
    thingTypeName: json['thingTypeName'] as String,
  );
}

ThingGroupDocument _$ThingGroupDocumentFromJson(Map<String, dynamic> json) {
  return ThingGroupDocument(
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    parentGroupNames:
        (json['parentGroupNames'] as List)?.map((e) => e as String)?.toList(),
    thingGroupDescription: json['thingGroupDescription'] as String,
    thingGroupId: json['thingGroupId'] as String,
    thingGroupName: json['thingGroupName'] as String,
  );
}

ThingGroupIndexingConfiguration _$ThingGroupIndexingConfigurationFromJson(
    Map<String, dynamic> json) {
  return ThingGroupIndexingConfiguration(
    thingGroupIndexingMode: _$enumDecodeNullable(
        _$ThingGroupIndexingModeEnumMap, json['thingGroupIndexingMode']),
    customFields: (json['customFields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    managedFields: (json['managedFields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ThingGroupIndexingConfigurationToJson(
    ThingGroupIndexingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thingGroupIndexingMode',
      _$ThingGroupIndexingModeEnumMap[instance.thingGroupIndexingMode]);
  writeNotNull(
      'customFields', instance.customFields?.map((e) => e?.toJson())?.toList());
  writeNotNull('managedFields',
      instance.managedFields?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ThingGroupIndexingModeEnumMap = {
  ThingGroupIndexingMode.off: 'OFF',
  ThingGroupIndexingMode.on: 'ON',
};

ThingGroupMetadata _$ThingGroupMetadataFromJson(Map<String, dynamic> json) {
  return ThingGroupMetadata(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    parentGroupName: json['parentGroupName'] as String,
    rootToParentThingGroups: (json['rootToParentThingGroups'] as List)
        ?.map((e) => e == null
            ? null
            : GroupNameAndArn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ThingGroupProperties _$ThingGroupPropertiesFromJson(Map<String, dynamic> json) {
  return ThingGroupProperties(
    attributePayload: json['attributePayload'] == null
        ? null
        : AttributePayload.fromJson(
            json['attributePayload'] as Map<String, dynamic>),
    thingGroupDescription: json['thingGroupDescription'] as String,
  );
}

Map<String, dynamic> _$ThingGroupPropertiesToJson(
    ThingGroupProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributePayload', instance.attributePayload?.toJson());
  writeNotNull('thingGroupDescription', instance.thingGroupDescription);
  return val;
}

ThingIndexingConfiguration _$ThingIndexingConfigurationFromJson(
    Map<String, dynamic> json) {
  return ThingIndexingConfiguration(
    thingIndexingMode: _$enumDecodeNullable(
        _$ThingIndexingModeEnumMap, json['thingIndexingMode']),
    customFields: (json['customFields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    managedFields: (json['managedFields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    thingConnectivityIndexingMode: _$enumDecodeNullable(
        _$ThingConnectivityIndexingModeEnumMap,
        json['thingConnectivityIndexingMode']),
  );
}

Map<String, dynamic> _$ThingIndexingConfigurationToJson(
    ThingIndexingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thingIndexingMode',
      _$ThingIndexingModeEnumMap[instance.thingIndexingMode]);
  writeNotNull(
      'customFields', instance.customFields?.map((e) => e?.toJson())?.toList());
  writeNotNull('managedFields',
      instance.managedFields?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'thingConnectivityIndexingMode',
      _$ThingConnectivityIndexingModeEnumMap[
          instance.thingConnectivityIndexingMode]);
  return val;
}

const _$ThingIndexingModeEnumMap = {
  ThingIndexingMode.off: 'OFF',
  ThingIndexingMode.registry: 'REGISTRY',
  ThingIndexingMode.registryAndShadow: 'REGISTRY_AND_SHADOW',
};

const _$ThingConnectivityIndexingModeEnumMap = {
  ThingConnectivityIndexingMode.off: 'OFF',
  ThingConnectivityIndexingMode.status: 'STATUS',
};

ThingTypeDefinition _$ThingTypeDefinitionFromJson(Map<String, dynamic> json) {
  return ThingTypeDefinition(
    thingTypeArn: json['thingTypeArn'] as String,
    thingTypeMetadata: json['thingTypeMetadata'] == null
        ? null
        : ThingTypeMetadata.fromJson(
            json['thingTypeMetadata'] as Map<String, dynamic>),
    thingTypeName: json['thingTypeName'] as String,
    thingTypeProperties: json['thingTypeProperties'] == null
        ? null
        : ThingTypeProperties.fromJson(
            json['thingTypeProperties'] as Map<String, dynamic>),
  );
}

ThingTypeMetadata _$ThingTypeMetadataFromJson(Map<String, dynamic> json) {
  return ThingTypeMetadata(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    deprecated: json['deprecated'] as bool,
    deprecationDate:
        const UnixDateTimeConverter().fromJson(json['deprecationDate']),
  );
}

ThingTypeProperties _$ThingTypePropertiesFromJson(Map<String, dynamic> json) {
  return ThingTypeProperties(
    searchableAttributes: (json['searchableAttributes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    thingTypeDescription: json['thingTypeDescription'] as String,
  );
}

Map<String, dynamic> _$ThingTypePropertiesToJson(ThingTypeProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('searchableAttributes', instance.searchableAttributes);
  writeNotNull('thingTypeDescription', instance.thingTypeDescription);
  return val;
}

TimeoutConfig _$TimeoutConfigFromJson(Map<String, dynamic> json) {
  return TimeoutConfig(
    inProgressTimeoutInMinutes: json['inProgressTimeoutInMinutes'] as int,
  );
}

Map<String, dynamic> _$TimeoutConfigToJson(TimeoutConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'inProgressTimeoutInMinutes', instance.inProgressTimeoutInMinutes);
  return val;
}

TimestreamAction _$TimestreamActionFromJson(Map<String, dynamic> json) {
  return TimestreamAction(
    databaseName: json['databaseName'] as String,
    dimensions: (json['dimensions'] as List)
        ?.map((e) => e == null
            ? null
            : TimestreamDimension.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    roleArn: json['roleArn'] as String,
    tableName: json['tableName'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : TimestreamTimestamp.fromJson(
            json['timestamp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TimestreamActionToJson(TimestreamAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('databaseName', instance.databaseName);
  writeNotNull(
      'dimensions', instance.dimensions?.map((e) => e?.toJson())?.toList());
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('tableName', instance.tableName);
  writeNotNull('timestamp', instance.timestamp?.toJson());
  return val;
}

TimestreamDimension _$TimestreamDimensionFromJson(Map<String, dynamic> json) {
  return TimestreamDimension(
    name: json['name'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TimestreamDimensionToJson(TimestreamDimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  return val;
}

TimestreamTimestamp _$TimestreamTimestampFromJson(Map<String, dynamic> json) {
  return TimestreamTimestamp(
    unit: json['unit'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TimestreamTimestampToJson(TimestreamTimestamp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', instance.unit);
  writeNotNull('value', instance.value);
  return val;
}

Map<String, dynamic> _$TlsContextToJson(TlsContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('serverName', instance.serverName);
  return val;
}

TopicRule _$TopicRuleFromJson(Map<String, dynamic> json) {
  return TopicRule(
    actions: (json['actions'] as List)
        ?.map((e) =>
            e == null ? null : Action.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    awsIotSqlVersion: json['awsIotSqlVersion'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    errorAction: json['errorAction'] == null
        ? null
        : Action.fromJson(json['errorAction'] as Map<String, dynamic>),
    ruleDisabled: json['ruleDisabled'] as bool,
    ruleName: json['ruleName'] as String,
    sql: json['sql'] as String,
  );
}

TopicRuleDestination _$TopicRuleDestinationFromJson(Map<String, dynamic> json) {
  return TopicRuleDestination(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    httpUrlProperties: json['httpUrlProperties'] == null
        ? null
        : HttpUrlDestinationProperties.fromJson(
            json['httpUrlProperties'] as Map<String, dynamic>),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    status: _$enumDecodeNullable(
        _$TopicRuleDestinationStatusEnumMap, json['status']),
    statusReason: json['statusReason'] as String,
    vpcProperties: json['vpcProperties'] == null
        ? null
        : VpcDestinationProperties.fromJson(
            json['vpcProperties'] as Map<String, dynamic>),
  );
}

const _$TopicRuleDestinationStatusEnumMap = {
  TopicRuleDestinationStatus.enabled: 'ENABLED',
  TopicRuleDestinationStatus.inProgress: 'IN_PROGRESS',
  TopicRuleDestinationStatus.disabled: 'DISABLED',
  TopicRuleDestinationStatus.error: 'ERROR',
  TopicRuleDestinationStatus.deleting: 'DELETING',
};

Map<String, dynamic> _$TopicRuleDestinationConfigurationToJson(
    TopicRuleDestinationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('httpUrlConfiguration', instance.httpUrlConfiguration?.toJson());
  writeNotNull('vpcConfiguration', instance.vpcConfiguration?.toJson());
  return val;
}

TopicRuleDestinationSummary _$TopicRuleDestinationSummaryFromJson(
    Map<String, dynamic> json) {
  return TopicRuleDestinationSummary(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    httpUrlSummary: json['httpUrlSummary'] == null
        ? null
        : HttpUrlDestinationSummary.fromJson(
            json['httpUrlSummary'] as Map<String, dynamic>),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    status: _$enumDecodeNullable(
        _$TopicRuleDestinationStatusEnumMap, json['status']),
    statusReason: json['statusReason'] as String,
    vpcDestinationSummary: json['vpcDestinationSummary'] == null
        ? null
        : VpcDestinationSummary.fromJson(
            json['vpcDestinationSummary'] as Map<String, dynamic>),
  );
}

TopicRuleListItem _$TopicRuleListItemFromJson(Map<String, dynamic> json) {
  return TopicRuleListItem(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    ruleArn: json['ruleArn'] as String,
    ruleDisabled: json['ruleDisabled'] as bool,
    ruleName: json['ruleName'] as String,
    topicPattern: json['topicPattern'] as String,
  );
}

Map<String, dynamic> _$TopicRulePayloadToJson(TopicRulePayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('actions', instance.actions?.map((e) => e?.toJson())?.toList());
  writeNotNull('sql', instance.sql);
  writeNotNull('awsIotSqlVersion', instance.awsIotSqlVersion);
  writeNotNull('description', instance.description);
  writeNotNull('errorAction', instance.errorAction?.toJson());
  writeNotNull('ruleDisabled', instance.ruleDisabled);
  return val;
}

TransferCertificateResponse _$TransferCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return TransferCertificateResponse(
    transferredCertificateArn: json['transferredCertificateArn'] as String,
  );
}

TransferData _$TransferDataFromJson(Map<String, dynamic> json) {
  return TransferData(
    acceptDate: const UnixDateTimeConverter().fromJson(json['acceptDate']),
    rejectDate: const UnixDateTimeConverter().fromJson(json['rejectDate']),
    rejectReason: json['rejectReason'] as String,
    transferDate: const UnixDateTimeConverter().fromJson(json['transferDate']),
    transferMessage: json['transferMessage'] as String,
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateAccountAuditConfigurationResponse
    _$UpdateAccountAuditConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateAccountAuditConfigurationResponse();
}

UpdateAuditSuppressionResponse _$UpdateAuditSuppressionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAuditSuppressionResponse();
}

UpdateAuthorizerResponse _$UpdateAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAuthorizerResponse(
    authorizerArn: json['authorizerArn'] as String,
    authorizerName: json['authorizerName'] as String,
  );
}

UpdateBillingGroupResponse _$UpdateBillingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBillingGroupResponse(
    version: json['version'] as int,
  );
}

UpdateCACertificateParams _$UpdateCACertificateParamsFromJson(
    Map<String, dynamic> json) {
  return UpdateCACertificateParams(
    action: _$enumDecodeNullable(
        _$CACertificateUpdateActionEnumMap, json['action']),
  );
}

Map<String, dynamic> _$UpdateCACertificateParamsToJson(
    UpdateCACertificateParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('action', _$CACertificateUpdateActionEnumMap[instance.action]);
  return val;
}

const _$CACertificateUpdateActionEnumMap = {
  CACertificateUpdateAction.deactivate: 'DEACTIVATE',
};

UpdateCustomMetricResponse _$UpdateCustomMetricResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateCustomMetricResponse(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    displayName: json['displayName'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    metricArn: json['metricArn'] as String,
    metricName: json['metricName'] as String,
    metricType:
        _$enumDecodeNullable(_$CustomMetricTypeEnumMap, json['metricType']),
  );
}

UpdateDeviceCertificateParams _$UpdateDeviceCertificateParamsFromJson(
    Map<String, dynamic> json) {
  return UpdateDeviceCertificateParams(
    action: _$enumDecodeNullable(
        _$DeviceCertificateUpdateActionEnumMap, json['action']),
  );
}

Map<String, dynamic> _$UpdateDeviceCertificateParamsToJson(
    UpdateDeviceCertificateParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'action', _$DeviceCertificateUpdateActionEnumMap[instance.action]);
  return val;
}

const _$DeviceCertificateUpdateActionEnumMap = {
  DeviceCertificateUpdateAction.deactivate: 'DEACTIVATE',
};

UpdateDimensionResponse _$UpdateDimensionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDimensionResponse(
    arn: json['arn'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    name: json['name'] as String,
    stringValues:
        (json['stringValues'] as List)?.map((e) => e as String)?.toList(),
    type: _$enumDecodeNullable(_$DimensionTypeEnumMap, json['type']),
  );
}

UpdateDomainConfigurationResponse _$UpdateDomainConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDomainConfigurationResponse(
    domainConfigurationArn: json['domainConfigurationArn'] as String,
    domainConfigurationName: json['domainConfigurationName'] as String,
  );
}

UpdateDynamicThingGroupResponse _$UpdateDynamicThingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDynamicThingGroupResponse(
    version: json['version'] as int,
  );
}

UpdateEventConfigurationsResponse _$UpdateEventConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEventConfigurationsResponse();
}

UpdateIndexingConfigurationResponse
    _$UpdateIndexingConfigurationResponseFromJson(Map<String, dynamic> json) {
  return UpdateIndexingConfigurationResponse();
}

UpdateMitigationActionResponse _$UpdateMitigationActionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMitigationActionResponse(
    actionArn: json['actionArn'] as String,
    actionId: json['actionId'] as String,
  );
}

UpdateProvisioningTemplateResponse _$UpdateProvisioningTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProvisioningTemplateResponse();
}

UpdateRoleAliasResponse _$UpdateRoleAliasResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRoleAliasResponse(
    roleAlias: json['roleAlias'] as String,
    roleAliasArn: json['roleAliasArn'] as String,
  );
}

UpdateScheduledAuditResponse _$UpdateScheduledAuditResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateScheduledAuditResponse(
    scheduledAuditArn: json['scheduledAuditArn'] as String,
  );
}

UpdateSecurityProfileResponse _$UpdateSecurityProfileResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSecurityProfileResponse(
    additionalMetricsToRetain: (json['additionalMetricsToRetain'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    additionalMetricsToRetainV2: (json['additionalMetricsToRetainV2'] as List)
        ?.map((e) => e == null
            ? null
            : MetricToRetain.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    alertTargets: (json['alertTargets'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$AlertTargetTypeEnumMap, k),
          e == null ? null : AlertTarget.fromJson(e as Map<String, dynamic>)),
    ),
    behaviors: (json['behaviors'] as List)
        ?.map((e) =>
            e == null ? null : Behavior.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    securityProfileArn: json['securityProfileArn'] as String,
    securityProfileDescription: json['securityProfileDescription'] as String,
    securityProfileName: json['securityProfileName'] as String,
    version: json['version'] as int,
  );
}

UpdateStreamResponse _$UpdateStreamResponseFromJson(Map<String, dynamic> json) {
  return UpdateStreamResponse(
    description: json['description'] as String,
    streamArn: json['streamArn'] as String,
    streamId: json['streamId'] as String,
    streamVersion: json['streamVersion'] as int,
  );
}

UpdateThingGroupResponse _$UpdateThingGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateThingGroupResponse(
    version: json['version'] as int,
  );
}

UpdateThingGroupsForThingResponse _$UpdateThingGroupsForThingResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateThingGroupsForThingResponse();
}

UpdateThingResponse _$UpdateThingResponseFromJson(Map<String, dynamic> json) {
  return UpdateThingResponse();
}

UpdateTopicRuleDestinationResponse _$UpdateTopicRuleDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTopicRuleDestinationResponse();
}

ValidateSecurityProfileBehaviorsResponse
    _$ValidateSecurityProfileBehaviorsResponseFromJson(
        Map<String, dynamic> json) {
  return ValidateSecurityProfileBehaviorsResponse(
    valid: json['valid'] as bool,
    validationErrors: (json['validationErrors'] as List)
        ?.map((e) => e == null
            ? null
            : ValidationError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) {
  return ValidationError(
    errorMessage: json['errorMessage'] as String,
  );
}

ViolationEvent _$ViolationEventFromJson(Map<String, dynamic> json) {
  return ViolationEvent(
    behavior: json['behavior'] == null
        ? null
        : Behavior.fromJson(json['behavior'] as Map<String, dynamic>),
    metricValue: json['metricValue'] == null
        ? null
        : MetricValue.fromJson(json['metricValue'] as Map<String, dynamic>),
    securityProfileName: json['securityProfileName'] as String,
    thingName: json['thingName'] as String,
    violationEventAdditionalInfo: json['violationEventAdditionalInfo'] == null
        ? null
        : ViolationEventAdditionalInfo.fromJson(
            json['violationEventAdditionalInfo'] as Map<String, dynamic>),
    violationEventTime:
        const UnixDateTimeConverter().fromJson(json['violationEventTime']),
    violationEventType: _$enumDecodeNullable(
        _$ViolationEventTypeEnumMap, json['violationEventType']),
    violationId: json['violationId'] as String,
  );
}

const _$ViolationEventTypeEnumMap = {
  ViolationEventType.inAlarm: 'in-alarm',
  ViolationEventType.alarmCleared: 'alarm-cleared',
  ViolationEventType.alarmInvalidated: 'alarm-invalidated',
};

ViolationEventAdditionalInfo _$ViolationEventAdditionalInfoFromJson(
    Map<String, dynamic> json) {
  return ViolationEventAdditionalInfo(
    confidenceLevel:
        _$enumDecodeNullable(_$ConfidenceLevelEnumMap, json['confidenceLevel']),
  );
}

ViolationEventOccurrenceRange _$ViolationEventOccurrenceRangeFromJson(
    Map<String, dynamic> json) {
  return ViolationEventOccurrenceRange(
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
  );
}

Map<String, dynamic> _$ViolationEventOccurrenceRangeToJson(
    ViolationEventOccurrenceRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'endTime', const UnixDateTimeConverter().toJson(instance.endTime));
  writeNotNull(
      'startTime', const UnixDateTimeConverter().toJson(instance.startTime));
  return val;
}

Map<String, dynamic> _$VpcDestinationConfigurationToJson(
    VpcDestinationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('subnetIds', instance.subnetIds);
  writeNotNull('vpcId', instance.vpcId);
  writeNotNull('securityGroups', instance.securityGroups);
  return val;
}

VpcDestinationProperties _$VpcDestinationPropertiesFromJson(
    Map<String, dynamic> json) {
  return VpcDestinationProperties(
    roleArn: json['roleArn'] as String,
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['subnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['vpcId'] as String,
  );
}

VpcDestinationSummary _$VpcDestinationSummaryFromJson(
    Map<String, dynamic> json) {
  return VpcDestinationSummary(
    roleArn: json['roleArn'] as String,
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['subnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['vpcId'] as String,
  );
}
