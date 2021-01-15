// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-11-06.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSharingInfo _$AccountSharingInfoFromJson(Map<String, dynamic> json) {
  return AccountSharingInfo(
    accountId: json['AccountId'] as String,
    sharedDocumentVersion: json['SharedDocumentVersion'] as String,
  );
}

Activation _$ActivationFromJson(Map<String, dynamic> json) {
  return Activation(
    activationId: json['ActivationId'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    defaultInstanceName: json['DefaultInstanceName'] as String,
    description: json['Description'] as String,
    expirationDate:
        const UnixDateTimeConverter().fromJson(json['ExpirationDate']),
    expired: json['Expired'] as bool,
    iamRole: json['IamRole'] as String,
    registrationLimit: json['RegistrationLimit'] as int,
    registrationsCount: json['RegistrationsCount'] as int,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AddTagsToResourceResult _$AddTagsToResourceResultFromJson(
    Map<String, dynamic> json) {
  return AddTagsToResourceResult();
}

Association _$AssociationFromJson(Map<String, dynamic> json) {
  return Association(
    associationId: json['AssociationId'] as String,
    associationName: json['AssociationName'] as String,
    associationVersion: json['AssociationVersion'] as String,
    documentVersion: json['DocumentVersion'] as String,
    instanceId: json['InstanceId'] as String,
    lastExecutionDate:
        const UnixDateTimeConverter().fromJson(json['LastExecutionDate']),
    name: json['Name'] as String,
    overview: json['Overview'] == null
        ? null
        : AssociationOverview.fromJson(
            json['Overview'] as Map<String, dynamic>),
    scheduleExpression: json['ScheduleExpression'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AssociationDescription _$AssociationDescriptionFromJson(
    Map<String, dynamic> json) {
  return AssociationDescription(
    applyOnlyAtCronInterval: json['ApplyOnlyAtCronInterval'] as bool,
    associationId: json['AssociationId'] as String,
    associationName: json['AssociationName'] as String,
    associationVersion: json['AssociationVersion'] as String,
    automationTargetParameterName:
        json['AutomationTargetParameterName'] as String,
    complianceSeverity: _$enumDecodeNullable(
        _$AssociationComplianceSeverityEnumMap, json['ComplianceSeverity']),
    date: const UnixDateTimeConverter().fromJson(json['Date']),
    documentVersion: json['DocumentVersion'] as String,
    instanceId: json['InstanceId'] as String,
    lastExecutionDate:
        const UnixDateTimeConverter().fromJson(json['LastExecutionDate']),
    lastSuccessfulExecutionDate: const UnixDateTimeConverter()
        .fromJson(json['LastSuccessfulExecutionDate']),
    lastUpdateAssociationDate: const UnixDateTimeConverter()
        .fromJson(json['LastUpdateAssociationDate']),
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    name: json['Name'] as String,
    outputLocation: json['OutputLocation'] == null
        ? null
        : InstanceAssociationOutputLocation.fromJson(
            json['OutputLocation'] as Map<String, dynamic>),
    overview: json['Overview'] == null
        ? null
        : AssociationOverview.fromJson(
            json['Overview'] as Map<String, dynamic>),
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    scheduleExpression: json['ScheduleExpression'] as String,
    status: json['Status'] == null
        ? null
        : AssociationStatus.fromJson(json['Status'] as Map<String, dynamic>),
    syncCompliance: _$enumDecodeNullable(
        _$AssociationSyncComplianceEnumMap, json['SyncCompliance']),
    targetLocations: (json['TargetLocations'] as List)
        ?.map((e) => e == null
            ? null
            : TargetLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
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

const _$AssociationComplianceSeverityEnumMap = {
  AssociationComplianceSeverity.critical: 'CRITICAL',
  AssociationComplianceSeverity.high: 'HIGH',
  AssociationComplianceSeverity.medium: 'MEDIUM',
  AssociationComplianceSeverity.low: 'LOW',
  AssociationComplianceSeverity.unspecified: 'UNSPECIFIED',
};

const _$AssociationSyncComplianceEnumMap = {
  AssociationSyncCompliance.auto: 'AUTO',
  AssociationSyncCompliance.manual: 'MANUAL',
};

AssociationExecution _$AssociationExecutionFromJson(Map<String, dynamic> json) {
  return AssociationExecution(
    associationId: json['AssociationId'] as String,
    associationVersion: json['AssociationVersion'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    detailedStatus: json['DetailedStatus'] as String,
    executionId: json['ExecutionId'] as String,
    lastExecutionDate:
        const UnixDateTimeConverter().fromJson(json['LastExecutionDate']),
    resourceCountByStatus: json['ResourceCountByStatus'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AssociationExecutionFilterToJson(
    AssociationExecutionFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$AssociationExecutionFilterKeyEnumMap[instance.key]);
  writeNotNull('Type', _$AssociationFilterOperatorTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$AssociationExecutionFilterKeyEnumMap = {
  AssociationExecutionFilterKey.executionId: 'ExecutionId',
  AssociationExecutionFilterKey.status: 'Status',
  AssociationExecutionFilterKey.createdTime: 'CreatedTime',
};

const _$AssociationFilterOperatorTypeEnumMap = {
  AssociationFilterOperatorType.equal: 'EQUAL',
  AssociationFilterOperatorType.lessThan: 'LESS_THAN',
  AssociationFilterOperatorType.greaterThan: 'GREATER_THAN',
};

AssociationExecutionTarget _$AssociationExecutionTargetFromJson(
    Map<String, dynamic> json) {
  return AssociationExecutionTarget(
    associationId: json['AssociationId'] as String,
    associationVersion: json['AssociationVersion'] as String,
    detailedStatus: json['DetailedStatus'] as String,
    executionId: json['ExecutionId'] as String,
    lastExecutionDate:
        const UnixDateTimeConverter().fromJson(json['LastExecutionDate']),
    outputSource: json['OutputSource'] == null
        ? null
        : OutputSource.fromJson(json['OutputSource'] as Map<String, dynamic>),
    resourceId: json['ResourceId'] as String,
    resourceType: json['ResourceType'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AssociationExecutionTargetsFilterToJson(
    AssociationExecutionTargetsFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Key', _$AssociationExecutionTargetsFilterKeyEnumMap[instance.key]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$AssociationExecutionTargetsFilterKeyEnumMap = {
  AssociationExecutionTargetsFilterKey.status: 'Status',
  AssociationExecutionTargetsFilterKey.resourceId: 'ResourceId',
  AssociationExecutionTargetsFilterKey.resourceType: 'ResourceType',
};

Map<String, dynamic> _$AssociationFilterToJson(AssociationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', _$AssociationFilterKeyEnumMap[instance.key]);
  writeNotNull('value', instance.value);
  return val;
}

const _$AssociationFilterKeyEnumMap = {
  AssociationFilterKey.instanceId: 'InstanceId',
  AssociationFilterKey.name: 'Name',
  AssociationFilterKey.associationId: 'AssociationId',
  AssociationFilterKey.associationStatusName: 'AssociationStatusName',
  AssociationFilterKey.lastExecutedBefore: 'LastExecutedBefore',
  AssociationFilterKey.lastExecutedAfter: 'LastExecutedAfter',
  AssociationFilterKey.associationName: 'AssociationName',
  AssociationFilterKey.resourceGroupName: 'ResourceGroupName',
};

AssociationOverview _$AssociationOverviewFromJson(Map<String, dynamic> json) {
  return AssociationOverview(
    associationStatusAggregatedCount:
        (json['AssociationStatusAggregatedCount'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
    detailedStatus: json['DetailedStatus'] as String,
    status: json['Status'] as String,
  );
}

AssociationStatus _$AssociationStatusFromJson(Map<String, dynamic> json) {
  return AssociationStatus(
    date: const UnixDateTimeConverter().fromJson(json['Date']),
    message: json['Message'] as String,
    name: _$enumDecodeNullable(_$AssociationStatusNameEnumMap, json['Name']),
    additionalInfo: json['AdditionalInfo'] as String,
  );
}

Map<String, dynamic> _$AssociationStatusToJson(AssociationStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Date', const UnixDateTimeConverter().toJson(instance.date));
  writeNotNull('Message', instance.message);
  writeNotNull('Name', _$AssociationStatusNameEnumMap[instance.name]);
  writeNotNull('AdditionalInfo', instance.additionalInfo);
  return val;
}

const _$AssociationStatusNameEnumMap = {
  AssociationStatusName.pending: 'Pending',
  AssociationStatusName.success: 'Success',
  AssociationStatusName.failed: 'Failed',
};

AssociationVersionInfo _$AssociationVersionInfoFromJson(
    Map<String, dynamic> json) {
  return AssociationVersionInfo(
    applyOnlyAtCronInterval: json['ApplyOnlyAtCronInterval'] as bool,
    associationId: json['AssociationId'] as String,
    associationName: json['AssociationName'] as String,
    associationVersion: json['AssociationVersion'] as String,
    complianceSeverity: _$enumDecodeNullable(
        _$AssociationComplianceSeverityEnumMap, json['ComplianceSeverity']),
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    documentVersion: json['DocumentVersion'] as String,
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    name: json['Name'] as String,
    outputLocation: json['OutputLocation'] == null
        ? null
        : InstanceAssociationOutputLocation.fromJson(
            json['OutputLocation'] as Map<String, dynamic>),
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    scheduleExpression: json['ScheduleExpression'] as String,
    syncCompliance: _$enumDecodeNullable(
        _$AssociationSyncComplianceEnumMap, json['SyncCompliance']),
    targetLocations: (json['TargetLocations'] as List)
        ?.map((e) => e == null
            ? null
            : TargetLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AttachmentContent _$AttachmentContentFromJson(Map<String, dynamic> json) {
  return AttachmentContent(
    hash: json['Hash'] as String,
    hashType:
        _$enumDecodeNullable(_$AttachmentHashTypeEnumMap, json['HashType']),
    name: json['Name'] as String,
    size: json['Size'] as int,
    url: json['Url'] as String,
  );
}

const _$AttachmentHashTypeEnumMap = {
  AttachmentHashType.sha256: 'Sha256',
};

AttachmentInformation _$AttachmentInformationFromJson(
    Map<String, dynamic> json) {
  return AttachmentInformation(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$AttachmentsSourceToJson(AttachmentsSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$AttachmentsSourceKeyEnumMap[instance.key]);
  writeNotNull('Name', instance.name);
  writeNotNull('Values', instance.values);
  return val;
}

const _$AttachmentsSourceKeyEnumMap = {
  AttachmentsSourceKey.sourceUrl: 'SourceUrl',
  AttachmentsSourceKey.s3FileUrl: 'S3FileUrl',
  AttachmentsSourceKey.attachmentReference: 'AttachmentReference',
};

AutomationExecution _$AutomationExecutionFromJson(Map<String, dynamic> json) {
  return AutomationExecution(
    associationId: json['AssociationId'] as String,
    automationExecutionId: json['AutomationExecutionId'] as String,
    automationExecutionStatus: _$enumDecodeNullable(
        _$AutomationExecutionStatusEnumMap, json['AutomationExecutionStatus']),
    automationSubtype: _$enumDecodeNullable(
        _$AutomationSubtypeEnumMap, json['AutomationSubtype']),
    changeRequestName: json['ChangeRequestName'] as String,
    currentAction: json['CurrentAction'] as String,
    currentStepName: json['CurrentStepName'] as String,
    documentName: json['DocumentName'] as String,
    documentVersion: json['DocumentVersion'] as String,
    executedBy: json['ExecutedBy'] as String,
    executionEndTime:
        const UnixDateTimeConverter().fromJson(json['ExecutionEndTime']),
    executionStartTime:
        const UnixDateTimeConverter().fromJson(json['ExecutionStartTime']),
    failureMessage: json['FailureMessage'] as String,
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    mode: _$enumDecodeNullable(_$ExecutionModeEnumMap, json['Mode']),
    opsItemId: json['OpsItemId'] as String,
    outputs: (json['Outputs'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    parentAutomationExecutionId: json['ParentAutomationExecutionId'] as String,
    progressCounters: json['ProgressCounters'] == null
        ? null
        : ProgressCounters.fromJson(
            json['ProgressCounters'] as Map<String, dynamic>),
    resolvedTargets: json['ResolvedTargets'] == null
        ? null
        : ResolvedTargets.fromJson(
            json['ResolvedTargets'] as Map<String, dynamic>),
    runbooks: (json['Runbooks'] as List)
        ?.map((e) =>
            e == null ? null : Runbook.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    scheduledTime:
        const UnixDateTimeConverter().fromJson(json['ScheduledTime']),
    stepExecutions: (json['StepExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : StepExecution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stepExecutionsTruncated: json['StepExecutionsTruncated'] as bool,
    target: json['Target'] as String,
    targetLocations: (json['TargetLocations'] as List)
        ?.map((e) => e == null
            ? null
            : TargetLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    targetMaps: (json['TargetMaps'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) =>
                  MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
            ))
        ?.toList(),
    targetParameterName: json['TargetParameterName'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$AutomationExecutionStatusEnumMap = {
  AutomationExecutionStatus.pending: 'Pending',
  AutomationExecutionStatus.inProgress: 'InProgress',
  AutomationExecutionStatus.waiting: 'Waiting',
  AutomationExecutionStatus.success: 'Success',
  AutomationExecutionStatus.timedOut: 'TimedOut',
  AutomationExecutionStatus.cancelling: 'Cancelling',
  AutomationExecutionStatus.cancelled: 'Cancelled',
  AutomationExecutionStatus.failed: 'Failed',
  AutomationExecutionStatus.pendingApproval: 'PendingApproval',
  AutomationExecutionStatus.approved: 'Approved',
  AutomationExecutionStatus.rejected: 'Rejected',
  AutomationExecutionStatus.scheduled: 'Scheduled',
  AutomationExecutionStatus.runbookInProgress: 'RunbookInProgress',
  AutomationExecutionStatus.pendingChangeCalendarOverride:
      'PendingChangeCalendarOverride',
  AutomationExecutionStatus.changeCalendarOverrideApproved:
      'ChangeCalendarOverrideApproved',
  AutomationExecutionStatus.changeCalendarOverrideRejected:
      'ChangeCalendarOverrideRejected',
  AutomationExecutionStatus.completedWithSuccess: 'CompletedWithSuccess',
  AutomationExecutionStatus.completedWithFailure: 'CompletedWithFailure',
};

const _$AutomationSubtypeEnumMap = {
  AutomationSubtype.changeRequest: 'ChangeRequest',
};

const _$ExecutionModeEnumMap = {
  ExecutionMode.auto: 'Auto',
  ExecutionMode.interactive: 'Interactive',
};

Map<String, dynamic> _$AutomationExecutionFilterToJson(
    AutomationExecutionFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$AutomationExecutionFilterKeyEnumMap[instance.key]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$AutomationExecutionFilterKeyEnumMap = {
  AutomationExecutionFilterKey.documentNamePrefix: 'DocumentNamePrefix',
  AutomationExecutionFilterKey.executionStatus: 'ExecutionStatus',
  AutomationExecutionFilterKey.executionId: 'ExecutionId',
  AutomationExecutionFilterKey.parentExecutionId: 'ParentExecutionId',
  AutomationExecutionFilterKey.currentAction: 'CurrentAction',
  AutomationExecutionFilterKey.startTimeBefore: 'StartTimeBefore',
  AutomationExecutionFilterKey.startTimeAfter: 'StartTimeAfter',
  AutomationExecutionFilterKey.automationType: 'AutomationType',
  AutomationExecutionFilterKey.tagKey: 'TagKey',
  AutomationExecutionFilterKey.targetResourceGroup: 'TargetResourceGroup',
  AutomationExecutionFilterKey.automationSubtype: 'AutomationSubtype',
  AutomationExecutionFilterKey.opsItemId: 'OpsItemId',
};

AutomationExecutionMetadata _$AutomationExecutionMetadataFromJson(
    Map<String, dynamic> json) {
  return AutomationExecutionMetadata(
    associationId: json['AssociationId'] as String,
    automationExecutionId: json['AutomationExecutionId'] as String,
    automationExecutionStatus: _$enumDecodeNullable(
        _$AutomationExecutionStatusEnumMap, json['AutomationExecutionStatus']),
    automationSubtype: _$enumDecodeNullable(
        _$AutomationSubtypeEnumMap, json['AutomationSubtype']),
    automationType:
        _$enumDecodeNullable(_$AutomationTypeEnumMap, json['AutomationType']),
    changeRequestName: json['ChangeRequestName'] as String,
    currentAction: json['CurrentAction'] as String,
    currentStepName: json['CurrentStepName'] as String,
    documentName: json['DocumentName'] as String,
    documentVersion: json['DocumentVersion'] as String,
    executedBy: json['ExecutedBy'] as String,
    executionEndTime:
        const UnixDateTimeConverter().fromJson(json['ExecutionEndTime']),
    executionStartTime:
        const UnixDateTimeConverter().fromJson(json['ExecutionStartTime']),
    failureMessage: json['FailureMessage'] as String,
    logFile: json['LogFile'] as String,
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    mode: _$enumDecodeNullable(_$ExecutionModeEnumMap, json['Mode']),
    opsItemId: json['OpsItemId'] as String,
    outputs: (json['Outputs'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    parentAutomationExecutionId: json['ParentAutomationExecutionId'] as String,
    resolvedTargets: json['ResolvedTargets'] == null
        ? null
        : ResolvedTargets.fromJson(
            json['ResolvedTargets'] as Map<String, dynamic>),
    runbooks: (json['Runbooks'] as List)
        ?.map((e) =>
            e == null ? null : Runbook.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    scheduledTime:
        const UnixDateTimeConverter().fromJson(json['ScheduledTime']),
    target: json['Target'] as String,
    targetMaps: (json['TargetMaps'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) =>
                  MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
            ))
        ?.toList(),
    targetParameterName: json['TargetParameterName'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$AutomationTypeEnumMap = {
  AutomationType.crossAccount: 'CrossAccount',
  AutomationType.local: 'Local',
};

CancelCommandResult _$CancelCommandResultFromJson(Map<String, dynamic> json) {
  return CancelCommandResult();
}

CancelMaintenanceWindowExecutionResult
    _$CancelMaintenanceWindowExecutionResultFromJson(
        Map<String, dynamic> json) {
  return CancelMaintenanceWindowExecutionResult(
    windowExecutionId: json['WindowExecutionId'] as String,
  );
}

CloudWatchOutputConfig _$CloudWatchOutputConfigFromJson(
    Map<String, dynamic> json) {
  return CloudWatchOutputConfig(
    cloudWatchLogGroupName: json['CloudWatchLogGroupName'] as String,
    cloudWatchOutputEnabled: json['CloudWatchOutputEnabled'] as bool,
  );
}

Map<String, dynamic> _$CloudWatchOutputConfigToJson(
    CloudWatchOutputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudWatchLogGroupName', instance.cloudWatchLogGroupName);
  writeNotNull('CloudWatchOutputEnabled', instance.cloudWatchOutputEnabled);
  return val;
}

Command _$CommandFromJson(Map<String, dynamic> json) {
  return Command(
    cloudWatchOutputConfig: json['CloudWatchOutputConfig'] == null
        ? null
        : CloudWatchOutputConfig.fromJson(
            json['CloudWatchOutputConfig'] as Map<String, dynamic>),
    commandId: json['CommandId'] as String,
    comment: json['Comment'] as String,
    completedCount: json['CompletedCount'] as int,
    deliveryTimedOutCount: json['DeliveryTimedOutCount'] as int,
    documentName: json['DocumentName'] as String,
    documentVersion: json['DocumentVersion'] as String,
    errorCount: json['ErrorCount'] as int,
    expiresAfter: const UnixDateTimeConverter().fromJson(json['ExpiresAfter']),
    instanceIds:
        (json['InstanceIds'] as List)?.map((e) => e as String)?.toList(),
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    notificationConfig: json['NotificationConfig'] == null
        ? null
        : NotificationConfig.fromJson(
            json['NotificationConfig'] as Map<String, dynamic>),
    outputS3BucketName: json['OutputS3BucketName'] as String,
    outputS3KeyPrefix: json['OutputS3KeyPrefix'] as String,
    outputS3Region: json['OutputS3Region'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    requestedDateTime:
        const UnixDateTimeConverter().fromJson(json['RequestedDateTime']),
    serviceRole: json['ServiceRole'] as String,
    status: _$enumDecodeNullable(_$CommandStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
    targetCount: json['TargetCount'] as int,
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timeoutSeconds: json['TimeoutSeconds'] as int,
  );
}

const _$CommandStatusEnumMap = {
  CommandStatus.pending: 'Pending',
  CommandStatus.inProgress: 'InProgress',
  CommandStatus.success: 'Success',
  CommandStatus.cancelled: 'Cancelled',
  CommandStatus.failed: 'Failed',
  CommandStatus.timedOut: 'TimedOut',
  CommandStatus.cancelling: 'Cancelling',
};

Map<String, dynamic> _$CommandFilterToJson(CommandFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', _$CommandFilterKeyEnumMap[instance.key]);
  writeNotNull('value', instance.value);
  return val;
}

const _$CommandFilterKeyEnumMap = {
  CommandFilterKey.invokedAfter: 'InvokedAfter',
  CommandFilterKey.invokedBefore: 'InvokedBefore',
  CommandFilterKey.status: 'Status',
  CommandFilterKey.executionStage: 'ExecutionStage',
  CommandFilterKey.documentName: 'DocumentName',
};

CommandInvocation _$CommandInvocationFromJson(Map<String, dynamic> json) {
  return CommandInvocation(
    cloudWatchOutputConfig: json['CloudWatchOutputConfig'] == null
        ? null
        : CloudWatchOutputConfig.fromJson(
            json['CloudWatchOutputConfig'] as Map<String, dynamic>),
    commandId: json['CommandId'] as String,
    commandPlugins: (json['CommandPlugins'] as List)
        ?.map((e) => e == null
            ? null
            : CommandPlugin.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    comment: json['Comment'] as String,
    documentName: json['DocumentName'] as String,
    documentVersion: json['DocumentVersion'] as String,
    instanceId: json['InstanceId'] as String,
    instanceName: json['InstanceName'] as String,
    notificationConfig: json['NotificationConfig'] == null
        ? null
        : NotificationConfig.fromJson(
            json['NotificationConfig'] as Map<String, dynamic>),
    requestedDateTime:
        const UnixDateTimeConverter().fromJson(json['RequestedDateTime']),
    serviceRole: json['ServiceRole'] as String,
    standardErrorUrl: json['StandardErrorUrl'] as String,
    standardOutputUrl: json['StandardOutputUrl'] as String,
    status:
        _$enumDecodeNullable(_$CommandInvocationStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
    traceOutput: json['TraceOutput'] as String,
  );
}

const _$CommandInvocationStatusEnumMap = {
  CommandInvocationStatus.pending: 'Pending',
  CommandInvocationStatus.inProgress: 'InProgress',
  CommandInvocationStatus.delayed: 'Delayed',
  CommandInvocationStatus.success: 'Success',
  CommandInvocationStatus.cancelled: 'Cancelled',
  CommandInvocationStatus.timedOut: 'TimedOut',
  CommandInvocationStatus.failed: 'Failed',
  CommandInvocationStatus.cancelling: 'Cancelling',
};

CommandPlugin _$CommandPluginFromJson(Map<String, dynamic> json) {
  return CommandPlugin(
    name: json['Name'] as String,
    output: json['Output'] as String,
    outputS3BucketName: json['OutputS3BucketName'] as String,
    outputS3KeyPrefix: json['OutputS3KeyPrefix'] as String,
    outputS3Region: json['OutputS3Region'] as String,
    responseCode: json['ResponseCode'] as int,
    responseFinishDateTime:
        const UnixDateTimeConverter().fromJson(json['ResponseFinishDateTime']),
    responseStartDateTime:
        const UnixDateTimeConverter().fromJson(json['ResponseStartDateTime']),
    standardErrorUrl: json['StandardErrorUrl'] as String,
    standardOutputUrl: json['StandardOutputUrl'] as String,
    status: _$enumDecodeNullable(_$CommandPluginStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
  );
}

const _$CommandPluginStatusEnumMap = {
  CommandPluginStatus.pending: 'Pending',
  CommandPluginStatus.inProgress: 'InProgress',
  CommandPluginStatus.success: 'Success',
  CommandPluginStatus.timedOut: 'TimedOut',
  CommandPluginStatus.cancelled: 'Cancelled',
  CommandPluginStatus.failed: 'Failed',
};

ComplianceExecutionSummary _$ComplianceExecutionSummaryFromJson(
    Map<String, dynamic> json) {
  return ComplianceExecutionSummary(
    executionTime:
        const UnixDateTimeConverter().fromJson(json['ExecutionTime']),
    executionId: json['ExecutionId'] as String,
    executionType: json['ExecutionType'] as String,
  );
}

Map<String, dynamic> _$ComplianceExecutionSummaryToJson(
    ComplianceExecutionSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExecutionTime',
      const UnixDateTimeConverter().toJson(instance.executionTime));
  writeNotNull('ExecutionId', instance.executionId);
  writeNotNull('ExecutionType', instance.executionType);
  return val;
}

ComplianceItem _$ComplianceItemFromJson(Map<String, dynamic> json) {
  return ComplianceItem(
    complianceType: json['ComplianceType'] as String,
    details: (json['Details'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    executionSummary: json['ExecutionSummary'] == null
        ? null
        : ComplianceExecutionSummary.fromJson(
            json['ExecutionSummary'] as Map<String, dynamic>),
    id: json['Id'] as String,
    resourceId: json['ResourceId'] as String,
    resourceType: json['ResourceType'] as String,
    severity:
        _$enumDecodeNullable(_$ComplianceSeverityEnumMap, json['Severity']),
    status: _$enumDecodeNullable(_$ComplianceStatusEnumMap, json['Status']),
    title: json['Title'] as String,
  );
}

const _$ComplianceSeverityEnumMap = {
  ComplianceSeverity.critical: 'CRITICAL',
  ComplianceSeverity.high: 'HIGH',
  ComplianceSeverity.medium: 'MEDIUM',
  ComplianceSeverity.low: 'LOW',
  ComplianceSeverity.informational: 'INFORMATIONAL',
  ComplianceSeverity.unspecified: 'UNSPECIFIED',
};

const _$ComplianceStatusEnumMap = {
  ComplianceStatus.compliant: 'COMPLIANT',
  ComplianceStatus.nonCompliant: 'NON_COMPLIANT',
};

Map<String, dynamic> _$ComplianceItemEntryToJson(ComplianceItemEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Severity', _$ComplianceSeverityEnumMap[instance.severity]);
  writeNotNull('Status', _$ComplianceStatusEnumMap[instance.status]);
  writeNotNull('Details', instance.details);
  writeNotNull('Id', instance.id);
  writeNotNull('Title', instance.title);
  return val;
}

Map<String, dynamic> _$ComplianceStringFilterToJson(
    ComplianceStringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Type', _$ComplianceQueryOperatorTypeEnumMap[instance.type]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$ComplianceQueryOperatorTypeEnumMap = {
  ComplianceQueryOperatorType.equal: 'EQUAL',
  ComplianceQueryOperatorType.notEqual: 'NOT_EQUAL',
  ComplianceQueryOperatorType.beginWith: 'BEGIN_WITH',
  ComplianceQueryOperatorType.lessThan: 'LESS_THAN',
  ComplianceQueryOperatorType.greaterThan: 'GREATER_THAN',
};

ComplianceSummaryItem _$ComplianceSummaryItemFromJson(
    Map<String, dynamic> json) {
  return ComplianceSummaryItem(
    complianceType: json['ComplianceType'] as String,
    compliantSummary: json['CompliantSummary'] == null
        ? null
        : CompliantSummary.fromJson(
            json['CompliantSummary'] as Map<String, dynamic>),
    nonCompliantSummary: json['NonCompliantSummary'] == null
        ? null
        : NonCompliantSummary.fromJson(
            json['NonCompliantSummary'] as Map<String, dynamic>),
  );
}

CompliantSummary _$CompliantSummaryFromJson(Map<String, dynamic> json) {
  return CompliantSummary(
    compliantCount: json['CompliantCount'] as int,
    severitySummary: json['SeveritySummary'] == null
        ? null
        : SeveritySummary.fromJson(
            json['SeveritySummary'] as Map<String, dynamic>),
  );
}

CreateActivationResult _$CreateActivationResultFromJson(
    Map<String, dynamic> json) {
  return CreateActivationResult(
    activationCode: json['ActivationCode'] as String,
    activationId: json['ActivationId'] as String,
  );
}

CreateAssociationBatchRequestEntry _$CreateAssociationBatchRequestEntryFromJson(
    Map<String, dynamic> json) {
  return CreateAssociationBatchRequestEntry(
    name: json['Name'] as String,
    applyOnlyAtCronInterval: json['ApplyOnlyAtCronInterval'] as bool,
    associationName: json['AssociationName'] as String,
    automationTargetParameterName:
        json['AutomationTargetParameterName'] as String,
    complianceSeverity: _$enumDecodeNullable(
        _$AssociationComplianceSeverityEnumMap, json['ComplianceSeverity']),
    documentVersion: json['DocumentVersion'] as String,
    instanceId: json['InstanceId'] as String,
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    outputLocation: json['OutputLocation'] == null
        ? null
        : InstanceAssociationOutputLocation.fromJson(
            json['OutputLocation'] as Map<String, dynamic>),
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    scheduleExpression: json['ScheduleExpression'] as String,
    syncCompliance: _$enumDecodeNullable(
        _$AssociationSyncComplianceEnumMap, json['SyncCompliance']),
    targetLocations: (json['TargetLocations'] as List)
        ?.map((e) => e == null
            ? null
            : TargetLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateAssociationBatchRequestEntryToJson(
    CreateAssociationBatchRequestEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('ApplyOnlyAtCronInterval', instance.applyOnlyAtCronInterval);
  writeNotNull('AssociationName', instance.associationName);
  writeNotNull(
      'AutomationTargetParameterName', instance.automationTargetParameterName);
  writeNotNull('ComplianceSeverity',
      _$AssociationComplianceSeverityEnumMap[instance.complianceSeverity]);
  writeNotNull('DocumentVersion', instance.documentVersion);
  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('MaxConcurrency', instance.maxConcurrency);
  writeNotNull('MaxErrors', instance.maxErrors);
  writeNotNull('OutputLocation', instance.outputLocation?.toJson());
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('ScheduleExpression', instance.scheduleExpression);
  writeNotNull('SyncCompliance',
      _$AssociationSyncComplianceEnumMap[instance.syncCompliance]);
  writeNotNull('TargetLocations',
      instance.targetLocations?.map((e) => e?.toJson())?.toList());
  writeNotNull('Targets', instance.targets?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateAssociationBatchResult _$CreateAssociationBatchResultFromJson(
    Map<String, dynamic> json) {
  return CreateAssociationBatchResult(
    failed: (json['Failed'] as List)
        ?.map((e) => e == null
            ? null
            : FailedCreateAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    successful: (json['Successful'] as List)
        ?.map((e) => e == null
            ? null
            : AssociationDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateAssociationResult _$CreateAssociationResultFromJson(
    Map<String, dynamic> json) {
  return CreateAssociationResult(
    associationDescription: json['AssociationDescription'] == null
        ? null
        : AssociationDescription.fromJson(
            json['AssociationDescription'] as Map<String, dynamic>),
  );
}

CreateDocumentResult _$CreateDocumentResultFromJson(Map<String, dynamic> json) {
  return CreateDocumentResult(
    documentDescription: json['DocumentDescription'] == null
        ? null
        : DocumentDescription.fromJson(
            json['DocumentDescription'] as Map<String, dynamic>),
  );
}

CreateMaintenanceWindowResult _$CreateMaintenanceWindowResultFromJson(
    Map<String, dynamic> json) {
  return CreateMaintenanceWindowResult(
    windowId: json['WindowId'] as String,
  );
}

CreateOpsItemResponse _$CreateOpsItemResponseFromJson(
    Map<String, dynamic> json) {
  return CreateOpsItemResponse(
    opsItemId: json['OpsItemId'] as String,
  );
}

CreateOpsMetadataResult _$CreateOpsMetadataResultFromJson(
    Map<String, dynamic> json) {
  return CreateOpsMetadataResult(
    opsMetadataArn: json['OpsMetadataArn'] as String,
  );
}

CreatePatchBaselineResult _$CreatePatchBaselineResultFromJson(
    Map<String, dynamic> json) {
  return CreatePatchBaselineResult(
    baselineId: json['BaselineId'] as String,
  );
}

CreateResourceDataSyncResult _$CreateResourceDataSyncResultFromJson(
    Map<String, dynamic> json) {
  return CreateResourceDataSyncResult();
}

DeleteActivationResult _$DeleteActivationResultFromJson(
    Map<String, dynamic> json) {
  return DeleteActivationResult();
}

DeleteAssociationResult _$DeleteAssociationResultFromJson(
    Map<String, dynamic> json) {
  return DeleteAssociationResult();
}

DeleteDocumentResult _$DeleteDocumentResultFromJson(Map<String, dynamic> json) {
  return DeleteDocumentResult();
}

DeleteInventoryResult _$DeleteInventoryResultFromJson(
    Map<String, dynamic> json) {
  return DeleteInventoryResult(
    deletionId: json['DeletionId'] as String,
    deletionSummary: json['DeletionSummary'] == null
        ? null
        : InventoryDeletionSummary.fromJson(
            json['DeletionSummary'] as Map<String, dynamic>),
    typeName: json['TypeName'] as String,
  );
}

DeleteMaintenanceWindowResult _$DeleteMaintenanceWindowResultFromJson(
    Map<String, dynamic> json) {
  return DeleteMaintenanceWindowResult(
    windowId: json['WindowId'] as String,
  );
}

DeleteOpsMetadataResult _$DeleteOpsMetadataResultFromJson(
    Map<String, dynamic> json) {
  return DeleteOpsMetadataResult();
}

DeleteParameterResult _$DeleteParameterResultFromJson(
    Map<String, dynamic> json) {
  return DeleteParameterResult();
}

DeleteParametersResult _$DeleteParametersResultFromJson(
    Map<String, dynamic> json) {
  return DeleteParametersResult(
    deletedParameters:
        (json['DeletedParameters'] as List)?.map((e) => e as String)?.toList(),
    invalidParameters:
        (json['InvalidParameters'] as List)?.map((e) => e as String)?.toList(),
  );
}

DeletePatchBaselineResult _$DeletePatchBaselineResultFromJson(
    Map<String, dynamic> json) {
  return DeletePatchBaselineResult(
    baselineId: json['BaselineId'] as String,
  );
}

DeleteResourceDataSyncResult _$DeleteResourceDataSyncResultFromJson(
    Map<String, dynamic> json) {
  return DeleteResourceDataSyncResult();
}

DeregisterManagedInstanceResult _$DeregisterManagedInstanceResultFromJson(
    Map<String, dynamic> json) {
  return DeregisterManagedInstanceResult();
}

DeregisterPatchBaselineForPatchGroupResult
    _$DeregisterPatchBaselineForPatchGroupResultFromJson(
        Map<String, dynamic> json) {
  return DeregisterPatchBaselineForPatchGroupResult(
    baselineId: json['BaselineId'] as String,
    patchGroup: json['PatchGroup'] as String,
  );
}

DeregisterTargetFromMaintenanceWindowResult
    _$DeregisterTargetFromMaintenanceWindowResultFromJson(
        Map<String, dynamic> json) {
  return DeregisterTargetFromMaintenanceWindowResult(
    windowId: json['WindowId'] as String,
    windowTargetId: json['WindowTargetId'] as String,
  );
}

DeregisterTaskFromMaintenanceWindowResult
    _$DeregisterTaskFromMaintenanceWindowResultFromJson(
        Map<String, dynamic> json) {
  return DeregisterTaskFromMaintenanceWindowResult(
    windowId: json['WindowId'] as String,
    windowTaskId: json['WindowTaskId'] as String,
  );
}

Map<String, dynamic> _$DescribeActivationsFilterToJson(
    DescribeActivationsFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'FilterKey', _$DescribeActivationsFilterKeysEnumMap[instance.filterKey]);
  writeNotNull('FilterValues', instance.filterValues);
  return val;
}

const _$DescribeActivationsFilterKeysEnumMap = {
  DescribeActivationsFilterKeys.activationIds: 'ActivationIds',
  DescribeActivationsFilterKeys.defaultInstanceName: 'DefaultInstanceName',
  DescribeActivationsFilterKeys.iamRole: 'IamRole',
};

DescribeActivationsResult _$DescribeActivationsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeActivationsResult(
    activationList: (json['ActivationList'] as List)
        ?.map((e) =>
            e == null ? null : Activation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeAssociationExecutionTargetsResult
    _$DescribeAssociationExecutionTargetsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeAssociationExecutionTargetsResult(
    associationExecutionTargets: (json['AssociationExecutionTargets'] as List)
        ?.map((e) => e == null
            ? null
            : AssociationExecutionTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeAssociationExecutionsResult
    _$DescribeAssociationExecutionsResultFromJson(Map<String, dynamic> json) {
  return DescribeAssociationExecutionsResult(
    associationExecutions: (json['AssociationExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : AssociationExecution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeAssociationResult _$DescribeAssociationResultFromJson(
    Map<String, dynamic> json) {
  return DescribeAssociationResult(
    associationDescription: json['AssociationDescription'] == null
        ? null
        : AssociationDescription.fromJson(
            json['AssociationDescription'] as Map<String, dynamic>),
  );
}

DescribeAutomationExecutionsResult _$DescribeAutomationExecutionsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeAutomationExecutionsResult(
    automationExecutionMetadataList: (json['AutomationExecutionMetadataList']
            as List)
        ?.map((e) => e == null
            ? null
            : AutomationExecutionMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeAutomationStepExecutionsResult
    _$DescribeAutomationStepExecutionsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeAutomationStepExecutionsResult(
    nextToken: json['NextToken'] as String,
    stepExecutions: (json['StepExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : StepExecution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeAvailablePatchesResult _$DescribeAvailablePatchesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeAvailablePatchesResult(
    nextToken: json['NextToken'] as String,
    patches: (json['Patches'] as List)
        ?.map(
            (e) => e == null ? null : Patch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeDocumentPermissionResponse _$DescribeDocumentPermissionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDocumentPermissionResponse(
    accountIds: (json['AccountIds'] as List)?.map((e) => e as String)?.toList(),
    accountSharingInfoList: (json['AccountSharingInfoList'] as List)
        ?.map((e) => e == null
            ? null
            : AccountSharingInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeDocumentResult _$DescribeDocumentResultFromJson(
    Map<String, dynamic> json) {
  return DescribeDocumentResult(
    document: json['Document'] == null
        ? null
        : DocumentDescription.fromJson(
            json['Document'] as Map<String, dynamic>),
  );
}

DescribeEffectiveInstanceAssociationsResult
    _$DescribeEffectiveInstanceAssociationsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeEffectiveInstanceAssociationsResult(
    associations: (json['Associations'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeEffectivePatchesForPatchBaselineResult
    _$DescribeEffectivePatchesForPatchBaselineResultFromJson(
        Map<String, dynamic> json) {
  return DescribeEffectivePatchesForPatchBaselineResult(
    effectivePatches: (json['EffectivePatches'] as List)
        ?.map((e) => e == null
            ? null
            : EffectivePatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeInstanceAssociationsStatusResult
    _$DescribeInstanceAssociationsStatusResultFromJson(
        Map<String, dynamic> json) {
  return DescribeInstanceAssociationsStatusResult(
    instanceAssociationStatusInfos: (json['InstanceAssociationStatusInfos']
            as List)
        ?.map((e) => e == null
            ? null
            : InstanceAssociationStatusInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeInstanceInformationResult _$DescribeInstanceInformationResultFromJson(
    Map<String, dynamic> json) {
  return DescribeInstanceInformationResult(
    instanceInformationList: (json['InstanceInformationList'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeInstancePatchStatesForPatchGroupResult
    _$DescribeInstancePatchStatesForPatchGroupResultFromJson(
        Map<String, dynamic> json) {
  return DescribeInstancePatchStatesForPatchGroupResult(
    instancePatchStates: (json['InstancePatchStates'] as List)
        ?.map((e) => e == null
            ? null
            : InstancePatchState.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeInstancePatchStatesResult _$DescribeInstancePatchStatesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeInstancePatchStatesResult(
    instancePatchStates: (json['InstancePatchStates'] as List)
        ?.map((e) => e == null
            ? null
            : InstancePatchState.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeInstancePatchesResult _$DescribeInstancePatchesResultFromJson(
    Map<String, dynamic> json) {
  return DescribeInstancePatchesResult(
    nextToken: json['NextToken'] as String,
    patches: (json['Patches'] as List)
        ?.map((e) => e == null
            ? null
            : PatchComplianceData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeInventoryDeletionsResult _$DescribeInventoryDeletionsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeInventoryDeletionsResult(
    inventoryDeletions: (json['InventoryDeletions'] as List)
        ?.map((e) => e == null
            ? null
            : InventoryDeletionStatusItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeMaintenanceWindowExecutionTaskInvocationsResult
    _$DescribeMaintenanceWindowExecutionTaskInvocationsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeMaintenanceWindowExecutionTaskInvocationsResult(
    nextToken: json['NextToken'] as String,
    windowExecutionTaskInvocationIdentities:
        (json['WindowExecutionTaskInvocationIdentities'] as List)
            ?.map((e) => e == null
                ? null
                : MaintenanceWindowExecutionTaskInvocationIdentity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

DescribeMaintenanceWindowExecutionTasksResult
    _$DescribeMaintenanceWindowExecutionTasksResultFromJson(
        Map<String, dynamic> json) {
  return DescribeMaintenanceWindowExecutionTasksResult(
    nextToken: json['NextToken'] as String,
    windowExecutionTaskIdentities:
        (json['WindowExecutionTaskIdentities'] as List)
            ?.map((e) => e == null
                ? null
                : MaintenanceWindowExecutionTaskIdentity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

DescribeMaintenanceWindowExecutionsResult
    _$DescribeMaintenanceWindowExecutionsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeMaintenanceWindowExecutionsResult(
    nextToken: json['NextToken'] as String,
    windowExecutions: (json['WindowExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : MaintenanceWindowExecution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeMaintenanceWindowScheduleResult
    _$DescribeMaintenanceWindowScheduleResultFromJson(
        Map<String, dynamic> json) {
  return DescribeMaintenanceWindowScheduleResult(
    nextToken: json['NextToken'] as String,
    scheduledWindowExecutions: (json['ScheduledWindowExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : ScheduledWindowExecution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeMaintenanceWindowTargetsResult
    _$DescribeMaintenanceWindowTargetsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeMaintenanceWindowTargetsResult(
    nextToken: json['NextToken'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) => e == null
            ? null
            : MaintenanceWindowTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeMaintenanceWindowTasksResult
    _$DescribeMaintenanceWindowTasksResultFromJson(Map<String, dynamic> json) {
  return DescribeMaintenanceWindowTasksResult(
    nextToken: json['NextToken'] as String,
    tasks: (json['Tasks'] as List)
        ?.map((e) => e == null
            ? null
            : MaintenanceWindowTask.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeMaintenanceWindowsForTargetResult
    _$DescribeMaintenanceWindowsForTargetResultFromJson(
        Map<String, dynamic> json) {
  return DescribeMaintenanceWindowsForTargetResult(
    nextToken: json['NextToken'] as String,
    windowIdentities: (json['WindowIdentities'] as List)
        ?.map((e) => e == null
            ? null
            : MaintenanceWindowIdentityForTarget.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeMaintenanceWindowsResult _$DescribeMaintenanceWindowsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeMaintenanceWindowsResult(
    nextToken: json['NextToken'] as String,
    windowIdentities: (json['WindowIdentities'] as List)
        ?.map((e) => e == null
            ? null
            : MaintenanceWindowIdentity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeOpsItemsResponse _$DescribeOpsItemsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeOpsItemsResponse(
    nextToken: json['NextToken'] as String,
    opsItemSummaries: (json['OpsItemSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : OpsItemSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeParametersResult _$DescribeParametersResultFromJson(
    Map<String, dynamic> json) {
  return DescribeParametersResult(
    nextToken: json['NextToken'] as String,
    parameters: (json['Parameters'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribePatchBaselinesResult _$DescribePatchBaselinesResultFromJson(
    Map<String, dynamic> json) {
  return DescribePatchBaselinesResult(
    baselineIdentities: (json['BaselineIdentities'] as List)
        ?.map((e) => e == null
            ? null
            : PatchBaselineIdentity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribePatchGroupStateResult _$DescribePatchGroupStateResultFromJson(
    Map<String, dynamic> json) {
  return DescribePatchGroupStateResult(
    instances: json['Instances'] as int,
    instancesWithFailedPatches: json['InstancesWithFailedPatches'] as int,
    instancesWithInstalledOtherPatches:
        json['InstancesWithInstalledOtherPatches'] as int,
    instancesWithInstalledPatches: json['InstancesWithInstalledPatches'] as int,
    instancesWithInstalledPendingRebootPatches:
        json['InstancesWithInstalledPendingRebootPatches'] as int,
    instancesWithInstalledRejectedPatches:
        json['InstancesWithInstalledRejectedPatches'] as int,
    instancesWithMissingPatches: json['InstancesWithMissingPatches'] as int,
    instancesWithNotApplicablePatches:
        json['InstancesWithNotApplicablePatches'] as int,
    instancesWithUnreportedNotApplicablePatches:
        json['InstancesWithUnreportedNotApplicablePatches'] as int,
  );
}

DescribePatchGroupsResult _$DescribePatchGroupsResultFromJson(
    Map<String, dynamic> json) {
  return DescribePatchGroupsResult(
    mappings: (json['Mappings'] as List)
        ?.map((e) => e == null
            ? null
            : PatchGroupPatchBaselineMapping.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribePatchPropertiesResult _$DescribePatchPropertiesResultFromJson(
    Map<String, dynamic> json) {
  return DescribePatchPropertiesResult(
    nextToken: json['NextToken'] as String,
    properties: (json['Properties'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as String),
            ))
        ?.toList(),
  );
}

DescribeSessionsResponse _$DescribeSessionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSessionsResponse(
    nextToken: json['NextToken'] as String,
    sessions: (json['Sessions'] as List)
        ?.map((e) =>
            e == null ? null : Session.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DocumentDefaultVersionDescription _$DocumentDefaultVersionDescriptionFromJson(
    Map<String, dynamic> json) {
  return DocumentDefaultVersionDescription(
    defaultVersion: json['DefaultVersion'] as String,
    defaultVersionName: json['DefaultVersionName'] as String,
    name: json['Name'] as String,
  );
}

DocumentDescription _$DocumentDescriptionFromJson(Map<String, dynamic> json) {
  return DocumentDescription(
    approvedVersion: json['ApprovedVersion'] as String,
    attachmentsInformation: (json['AttachmentsInformation'] as List)
        ?.map((e) => e == null
            ? null
            : AttachmentInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    author: json['Author'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    defaultVersion: json['DefaultVersion'] as String,
    description: json['Description'] as String,
    documentFormat:
        _$enumDecodeNullable(_$DocumentFormatEnumMap, json['DocumentFormat']),
    documentType:
        _$enumDecodeNullable(_$DocumentTypeEnumMap, json['DocumentType']),
    documentVersion: json['DocumentVersion'] as String,
    hash: json['Hash'] as String,
    hashType: _$enumDecodeNullable(_$DocumentHashTypeEnumMap, json['HashType']),
    latestVersion: json['LatestVersion'] as String,
    name: json['Name'] as String,
    owner: json['Owner'] as String,
    parameters: (json['Parameters'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pendingReviewVersion: json['PendingReviewVersion'] as String,
    platformTypes: (json['PlatformTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PlatformTypeEnumMap, e))
        ?.toList(),
    requires: (json['Requires'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentRequires.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reviewInformation: (json['ReviewInformation'] as List)
        ?.map((e) => e == null
            ? null
            : ReviewInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reviewStatus:
        _$enumDecodeNullable(_$ReviewStatusEnumMap, json['ReviewStatus']),
    schemaVersion: json['SchemaVersion'] as String,
    sha1: json['Sha1'] as String,
    status: _$enumDecodeNullable(_$DocumentStatusEnumMap, json['Status']),
    statusInformation: json['StatusInformation'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    targetType: json['TargetType'] as String,
    versionName: json['VersionName'] as String,
  );
}

const _$DocumentFormatEnumMap = {
  DocumentFormat.yaml: 'YAML',
  DocumentFormat.json: 'JSON',
  DocumentFormat.text: 'TEXT',
};

const _$DocumentTypeEnumMap = {
  DocumentType.command: 'Command',
  DocumentType.policy: 'Policy',
  DocumentType.automation: 'Automation',
  DocumentType.session: 'Session',
  DocumentType.package: 'Package',
  DocumentType.applicationConfiguration: 'ApplicationConfiguration',
  DocumentType.applicationConfigurationSchema: 'ApplicationConfigurationSchema',
  DocumentType.deploymentStrategy: 'DeploymentStrategy',
  DocumentType.changeCalendar: 'ChangeCalendar',
  DocumentType.automationChangeTemplate: 'Automation.ChangeTemplate',
};

const _$DocumentHashTypeEnumMap = {
  DocumentHashType.sha256: 'Sha256',
  DocumentHashType.sha1: 'Sha1',
};

const _$PlatformTypeEnumMap = {
  PlatformType.windows: 'Windows',
  PlatformType.linux: 'Linux',
};

const _$ReviewStatusEnumMap = {
  ReviewStatus.approved: 'APPROVED',
  ReviewStatus.notReviewed: 'NOT_REVIEWED',
  ReviewStatus.pending: 'PENDING',
  ReviewStatus.rejected: 'REJECTED',
};

const _$DocumentStatusEnumMap = {
  DocumentStatus.creating: 'Creating',
  DocumentStatus.active: 'Active',
  DocumentStatus.updating: 'Updating',
  DocumentStatus.deleting: 'Deleting',
  DocumentStatus.failed: 'Failed',
};

Map<String, dynamic> _$DocumentFilterToJson(DocumentFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', _$DocumentFilterKeyEnumMap[instance.key]);
  writeNotNull('value', instance.value);
  return val;
}

const _$DocumentFilterKeyEnumMap = {
  DocumentFilterKey.name: 'Name',
  DocumentFilterKey.owner: 'Owner',
  DocumentFilterKey.platformTypes: 'PlatformTypes',
  DocumentFilterKey.documentType: 'DocumentType',
};

DocumentIdentifier _$DocumentIdentifierFromJson(Map<String, dynamic> json) {
  return DocumentIdentifier(
    author: json['Author'] as String,
    documentFormat:
        _$enumDecodeNullable(_$DocumentFormatEnumMap, json['DocumentFormat']),
    documentType:
        _$enumDecodeNullable(_$DocumentTypeEnumMap, json['DocumentType']),
    documentVersion: json['DocumentVersion'] as String,
    name: json['Name'] as String,
    owner: json['Owner'] as String,
    platformTypes: (json['PlatformTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PlatformTypeEnumMap, e))
        ?.toList(),
    requires: (json['Requires'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentRequires.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reviewStatus:
        _$enumDecodeNullable(_$ReviewStatusEnumMap, json['ReviewStatus']),
    schemaVersion: json['SchemaVersion'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    targetType: json['TargetType'] as String,
    versionName: json['VersionName'] as String,
  );
}

Map<String, dynamic> _$DocumentKeyValuesFilterToJson(
    DocumentKeyValuesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

DocumentMetadataResponseInfo _$DocumentMetadataResponseInfoFromJson(
    Map<String, dynamic> json) {
  return DocumentMetadataResponseInfo(
    reviewerResponse: (json['ReviewerResponse'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentReviewerResponseSource.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

DocumentParameter _$DocumentParameterFromJson(Map<String, dynamic> json) {
  return DocumentParameter(
    defaultValue: json['DefaultValue'] as String,
    description: json['Description'] as String,
    name: json['Name'] as String,
    type: _$enumDecodeNullable(_$DocumentParameterTypeEnumMap, json['Type']),
  );
}

const _$DocumentParameterTypeEnumMap = {
  DocumentParameterType.string: 'String',
  DocumentParameterType.stringList: 'StringList',
};

DocumentRequires _$DocumentRequiresFromJson(Map<String, dynamic> json) {
  return DocumentRequires(
    name: json['Name'] as String,
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$DocumentRequiresToJson(DocumentRequires instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Version', instance.version);
  return val;
}

DocumentReviewCommentSource _$DocumentReviewCommentSourceFromJson(
    Map<String, dynamic> json) {
  return DocumentReviewCommentSource(
    content: json['Content'] as String,
    type:
        _$enumDecodeNullable(_$DocumentReviewCommentTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$DocumentReviewCommentSourceToJson(
    DocumentReviewCommentSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Content', instance.content);
  writeNotNull('Type', _$DocumentReviewCommentTypeEnumMap[instance.type]);
  return val;
}

const _$DocumentReviewCommentTypeEnumMap = {
  DocumentReviewCommentType.comment: 'Comment',
};

DocumentReviewerResponseSource _$DocumentReviewerResponseSourceFromJson(
    Map<String, dynamic> json) {
  return DocumentReviewerResponseSource(
    comment: (json['Comment'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentReviewCommentSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createTime: const UnixDateTimeConverter().fromJson(json['CreateTime']),
    reviewStatus:
        _$enumDecodeNullable(_$ReviewStatusEnumMap, json['ReviewStatus']),
    reviewer: json['Reviewer'] as String,
    updatedTime: const UnixDateTimeConverter().fromJson(json['UpdatedTime']),
  );
}

Map<String, dynamic> _$DocumentReviewsToJson(DocumentReviews instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$DocumentReviewActionEnumMap[instance.action]);
  writeNotNull('Comment', instance.comment?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$DocumentReviewActionEnumMap = {
  DocumentReviewAction.sendForReview: 'SendForReview',
  DocumentReviewAction.updateReview: 'UpdateReview',
  DocumentReviewAction.approve: 'Approve',
  DocumentReviewAction.reject: 'Reject',
};

DocumentVersionInfo _$DocumentVersionInfoFromJson(Map<String, dynamic> json) {
  return DocumentVersionInfo(
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    documentFormat:
        _$enumDecodeNullable(_$DocumentFormatEnumMap, json['DocumentFormat']),
    documentVersion: json['DocumentVersion'] as String,
    isDefaultVersion: json['IsDefaultVersion'] as bool,
    name: json['Name'] as String,
    reviewStatus:
        _$enumDecodeNullable(_$ReviewStatusEnumMap, json['ReviewStatus']),
    status: _$enumDecodeNullable(_$DocumentStatusEnumMap, json['Status']),
    statusInformation: json['StatusInformation'] as String,
    versionName: json['VersionName'] as String,
  );
}

EffectivePatch _$EffectivePatchFromJson(Map<String, dynamic> json) {
  return EffectivePatch(
    patch: json['Patch'] == null
        ? null
        : Patch.fromJson(json['Patch'] as Map<String, dynamic>),
    patchStatus: json['PatchStatus'] == null
        ? null
        : PatchStatus.fromJson(json['PatchStatus'] as Map<String, dynamic>),
  );
}

FailedCreateAssociation _$FailedCreateAssociationFromJson(
    Map<String, dynamic> json) {
  return FailedCreateAssociation(
    entry: json['Entry'] == null
        ? null
        : CreateAssociationBatchRequestEntry.fromJson(
            json['Entry'] as Map<String, dynamic>),
    fault: _$enumDecodeNullable(_$FaultEnumMap, json['Fault']),
    message: json['Message'] as String,
  );
}

const _$FaultEnumMap = {
  Fault.client: 'Client',
  Fault.server: 'Server',
  Fault.unknown: 'Unknown',
};

FailureDetails _$FailureDetailsFromJson(Map<String, dynamic> json) {
  return FailureDetails(
    details: (json['Details'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    failureStage: json['FailureStage'] as String,
    failureType: json['FailureType'] as String,
  );
}

GetAutomationExecutionResult _$GetAutomationExecutionResultFromJson(
    Map<String, dynamic> json) {
  return GetAutomationExecutionResult(
    automationExecution: json['AutomationExecution'] == null
        ? null
        : AutomationExecution.fromJson(
            json['AutomationExecution'] as Map<String, dynamic>),
  );
}

GetCalendarStateResponse _$GetCalendarStateResponseFromJson(
    Map<String, dynamic> json) {
  return GetCalendarStateResponse(
    atTime: json['AtTime'] as String,
    nextTransitionTime: json['NextTransitionTime'] as String,
    state: _$enumDecodeNullable(_$CalendarStateEnumMap, json['State']),
  );
}

const _$CalendarStateEnumMap = {
  CalendarState.open: 'OPEN',
  CalendarState.closed: 'CLOSED',
};

GetCommandInvocationResult _$GetCommandInvocationResultFromJson(
    Map<String, dynamic> json) {
  return GetCommandInvocationResult(
    cloudWatchOutputConfig: json['CloudWatchOutputConfig'] == null
        ? null
        : CloudWatchOutputConfig.fromJson(
            json['CloudWatchOutputConfig'] as Map<String, dynamic>),
    commandId: json['CommandId'] as String,
    comment: json['Comment'] as String,
    documentName: json['DocumentName'] as String,
    documentVersion: json['DocumentVersion'] as String,
    executionElapsedTime: json['ExecutionElapsedTime'] as String,
    executionEndDateTime: json['ExecutionEndDateTime'] as String,
    executionStartDateTime: json['ExecutionStartDateTime'] as String,
    instanceId: json['InstanceId'] as String,
    pluginName: json['PluginName'] as String,
    responseCode: json['ResponseCode'] as int,
    standardErrorContent: json['StandardErrorContent'] as String,
    standardErrorUrl: json['StandardErrorUrl'] as String,
    standardOutputContent: json['StandardOutputContent'] as String,
    standardOutputUrl: json['StandardOutputUrl'] as String,
    status:
        _$enumDecodeNullable(_$CommandInvocationStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
  );
}

GetConnectionStatusResponse _$GetConnectionStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetConnectionStatusResponse(
    status: _$enumDecodeNullable(_$ConnectionStatusEnumMap, json['Status']),
    target: json['Target'] as String,
  );
}

const _$ConnectionStatusEnumMap = {
  ConnectionStatus.connected: 'Connected',
  ConnectionStatus.notConnected: 'NotConnected',
};

GetDefaultPatchBaselineResult _$GetDefaultPatchBaselineResultFromJson(
    Map<String, dynamic> json) {
  return GetDefaultPatchBaselineResult(
    baselineId: json['BaselineId'] as String,
    operatingSystem:
        _$enumDecodeNullable(_$OperatingSystemEnumMap, json['OperatingSystem']),
  );
}

const _$OperatingSystemEnumMap = {
  OperatingSystem.windows: 'WINDOWS',
  OperatingSystem.amazonLinux: 'AMAZON_LINUX',
  OperatingSystem.amazonLinux_2: 'AMAZON_LINUX_2',
  OperatingSystem.ubuntu: 'UBUNTU',
  OperatingSystem.redhatEnterpriseLinux: 'REDHAT_ENTERPRISE_LINUX',
  OperatingSystem.suse: 'SUSE',
  OperatingSystem.centos: 'CENTOS',
  OperatingSystem.oracleLinux: 'ORACLE_LINUX',
  OperatingSystem.debian: 'DEBIAN',
  OperatingSystem.macos: 'MACOS',
};

GetDeployablePatchSnapshotForInstanceResult
    _$GetDeployablePatchSnapshotForInstanceResultFromJson(
        Map<String, dynamic> json) {
  return GetDeployablePatchSnapshotForInstanceResult(
    instanceId: json['InstanceId'] as String,
    product: json['Product'] as String,
    snapshotDownloadUrl: json['SnapshotDownloadUrl'] as String,
    snapshotId: json['SnapshotId'] as String,
  );
}

GetDocumentResult _$GetDocumentResultFromJson(Map<String, dynamic> json) {
  return GetDocumentResult(
    attachmentsContent: (json['AttachmentsContent'] as List)
        ?.map((e) => e == null
            ? null
            : AttachmentContent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    content: json['Content'] as String,
    documentFormat:
        _$enumDecodeNullable(_$DocumentFormatEnumMap, json['DocumentFormat']),
    documentType:
        _$enumDecodeNullable(_$DocumentTypeEnumMap, json['DocumentType']),
    documentVersion: json['DocumentVersion'] as String,
    name: json['Name'] as String,
    requires: (json['Requires'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentRequires.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reviewStatus:
        _$enumDecodeNullable(_$ReviewStatusEnumMap, json['ReviewStatus']),
    status: _$enumDecodeNullable(_$DocumentStatusEnumMap, json['Status']),
    statusInformation: json['StatusInformation'] as String,
    versionName: json['VersionName'] as String,
  );
}

GetInventoryResult _$GetInventoryResultFromJson(Map<String, dynamic> json) {
  return GetInventoryResult(
    entities: (json['Entities'] as List)
        ?.map((e) => e == null
            ? null
            : InventoryResultEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetInventorySchemaResult _$GetInventorySchemaResultFromJson(
    Map<String, dynamic> json) {
  return GetInventorySchemaResult(
    nextToken: json['NextToken'] as String,
    schemas: (json['Schemas'] as List)
        ?.map((e) => e == null
            ? null
            : InventoryItemSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetMaintenanceWindowExecutionResult
    _$GetMaintenanceWindowExecutionResultFromJson(Map<String, dynamic> json) {
  return GetMaintenanceWindowExecutionResult(
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(
        _$MaintenanceWindowExecutionStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
    taskIds: (json['TaskIds'] as List)?.map((e) => e as String)?.toList(),
    windowExecutionId: json['WindowExecutionId'] as String,
  );
}

const _$MaintenanceWindowExecutionStatusEnumMap = {
  MaintenanceWindowExecutionStatus.pending: 'PENDING',
  MaintenanceWindowExecutionStatus.inProgress: 'IN_PROGRESS',
  MaintenanceWindowExecutionStatus.success: 'SUCCESS',
  MaintenanceWindowExecutionStatus.failed: 'FAILED',
  MaintenanceWindowExecutionStatus.timedOut: 'TIMED_OUT',
  MaintenanceWindowExecutionStatus.cancelling: 'CANCELLING',
  MaintenanceWindowExecutionStatus.cancelled: 'CANCELLED',
  MaintenanceWindowExecutionStatus.skippedOverlapping: 'SKIPPED_OVERLAPPING',
};

GetMaintenanceWindowExecutionTaskInvocationResult
    _$GetMaintenanceWindowExecutionTaskInvocationResultFromJson(
        Map<String, dynamic> json) {
  return GetMaintenanceWindowExecutionTaskInvocationResult(
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    executionId: json['ExecutionId'] as String,
    invocationId: json['InvocationId'] as String,
    ownerInformation: json['OwnerInformation'] as String,
    parameters: json['Parameters'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(
        _$MaintenanceWindowExecutionStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
    taskExecutionId: json['TaskExecutionId'] as String,
    taskType: _$enumDecodeNullable(
        _$MaintenanceWindowTaskTypeEnumMap, json['TaskType']),
    windowExecutionId: json['WindowExecutionId'] as String,
    windowTargetId: json['WindowTargetId'] as String,
  );
}

const _$MaintenanceWindowTaskTypeEnumMap = {
  MaintenanceWindowTaskType.runCommand: 'RUN_COMMAND',
  MaintenanceWindowTaskType.automation: 'AUTOMATION',
  MaintenanceWindowTaskType.stepFunctions: 'STEP_FUNCTIONS',
  MaintenanceWindowTaskType.lambda: 'LAMBDA',
};

GetMaintenanceWindowExecutionTaskResult
    _$GetMaintenanceWindowExecutionTaskResultFromJson(
        Map<String, dynamic> json) {
  return GetMaintenanceWindowExecutionTaskResult(
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    priority: json['Priority'] as int,
    serviceRole: json['ServiceRole'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(
        _$MaintenanceWindowExecutionStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
    taskArn: json['TaskArn'] as String,
    taskExecutionId: json['TaskExecutionId'] as String,
    taskParameters: (json['TaskParameters'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(
                  k,
                  e == null
                      ? null
                      : MaintenanceWindowTaskParameterValueExpression.fromJson(
                          e as Map<String, dynamic>)),
            ))
        ?.toList(),
    type:
        _$enumDecodeNullable(_$MaintenanceWindowTaskTypeEnumMap, json['Type']),
    windowExecutionId: json['WindowExecutionId'] as String,
  );
}

GetMaintenanceWindowResult _$GetMaintenanceWindowResultFromJson(
    Map<String, dynamic> json) {
  return GetMaintenanceWindowResult(
    allowUnassociatedTargets: json['AllowUnassociatedTargets'] as bool,
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    cutoff: json['Cutoff'] as int,
    description: json['Description'] as String,
    duration: json['Duration'] as int,
    enabled: json['Enabled'] as bool,
    endDate: json['EndDate'] as String,
    modifiedDate: const UnixDateTimeConverter().fromJson(json['ModifiedDate']),
    name: json['Name'] as String,
    nextExecutionTime: json['NextExecutionTime'] as String,
    schedule: json['Schedule'] as String,
    scheduleOffset: json['ScheduleOffset'] as int,
    scheduleTimezone: json['ScheduleTimezone'] as String,
    startDate: json['StartDate'] as String,
    windowId: json['WindowId'] as String,
  );
}

GetMaintenanceWindowTaskResult _$GetMaintenanceWindowTaskResultFromJson(
    Map<String, dynamic> json) {
  return GetMaintenanceWindowTaskResult(
    description: json['Description'] as String,
    loggingInfo: json['LoggingInfo'] == null
        ? null
        : LoggingInfo.fromJson(json['LoggingInfo'] as Map<String, dynamic>),
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    name: json['Name'] as String,
    priority: json['Priority'] as int,
    serviceRoleArn: json['ServiceRoleArn'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taskArn: json['TaskArn'] as String,
    taskInvocationParameters: json['TaskInvocationParameters'] == null
        ? null
        : MaintenanceWindowTaskInvocationParameters.fromJson(
            json['TaskInvocationParameters'] as Map<String, dynamic>),
    taskParameters: (json['TaskParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : MaintenanceWindowTaskParameterValueExpression.fromJson(
                  e as Map<String, dynamic>)),
    ),
    taskType: _$enumDecodeNullable(
        _$MaintenanceWindowTaskTypeEnumMap, json['TaskType']),
    windowId: json['WindowId'] as String,
    windowTaskId: json['WindowTaskId'] as String,
  );
}

GetOpsItemResponse _$GetOpsItemResponseFromJson(Map<String, dynamic> json) {
  return GetOpsItemResponse(
    opsItem: json['OpsItem'] == null
        ? null
        : OpsItem.fromJson(json['OpsItem'] as Map<String, dynamic>),
  );
}

GetOpsMetadataResult _$GetOpsMetadataResultFromJson(Map<String, dynamic> json) {
  return GetOpsMetadataResult(
    metadata: (json['Metadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : MetadataValue.fromJson(e as Map<String, dynamic>)),
    ),
    nextToken: json['NextToken'] as String,
    resourceId: json['ResourceId'] as String,
  );
}

GetOpsSummaryResult _$GetOpsSummaryResultFromJson(Map<String, dynamic> json) {
  return GetOpsSummaryResult(
    entities: (json['Entities'] as List)
        ?.map((e) =>
            e == null ? null : OpsEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetParameterHistoryResult _$GetParameterHistoryResultFromJson(
    Map<String, dynamic> json) {
  return GetParameterHistoryResult(
    nextToken: json['NextToken'] as String,
    parameters: (json['Parameters'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterHistory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetParameterResult _$GetParameterResultFromJson(Map<String, dynamic> json) {
  return GetParameterResult(
    parameter: json['Parameter'] == null
        ? null
        : Parameter.fromJson(json['Parameter'] as Map<String, dynamic>),
  );
}

GetParametersByPathResult _$GetParametersByPathResultFromJson(
    Map<String, dynamic> json) {
  return GetParametersByPathResult(
    nextToken: json['NextToken'] as String,
    parameters: (json['Parameters'] as List)
        ?.map((e) =>
            e == null ? null : Parameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetParametersResult _$GetParametersResultFromJson(Map<String, dynamic> json) {
  return GetParametersResult(
    invalidParameters:
        (json['InvalidParameters'] as List)?.map((e) => e as String)?.toList(),
    parameters: (json['Parameters'] as List)
        ?.map((e) =>
            e == null ? null : Parameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetPatchBaselineForPatchGroupResult
    _$GetPatchBaselineForPatchGroupResultFromJson(Map<String, dynamic> json) {
  return GetPatchBaselineForPatchGroupResult(
    baselineId: json['BaselineId'] as String,
    operatingSystem:
        _$enumDecodeNullable(_$OperatingSystemEnumMap, json['OperatingSystem']),
    patchGroup: json['PatchGroup'] as String,
  );
}

GetPatchBaselineResult _$GetPatchBaselineResultFromJson(
    Map<String, dynamic> json) {
  return GetPatchBaselineResult(
    approvalRules: json['ApprovalRules'] == null
        ? null
        : PatchRuleGroup.fromJson(
            json['ApprovalRules'] as Map<String, dynamic>),
    approvedPatches:
        (json['ApprovedPatches'] as List)?.map((e) => e as String)?.toList(),
    approvedPatchesComplianceLevel: _$enumDecodeNullable(
        _$PatchComplianceLevelEnumMap, json['ApprovedPatchesComplianceLevel']),
    approvedPatchesEnableNonSecurity:
        json['ApprovedPatchesEnableNonSecurity'] as bool,
    baselineId: json['BaselineId'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    description: json['Description'] as String,
    globalFilters: json['GlobalFilters'] == null
        ? null
        : PatchFilterGroup.fromJson(
            json['GlobalFilters'] as Map<String, dynamic>),
    modifiedDate: const UnixDateTimeConverter().fromJson(json['ModifiedDate']),
    name: json['Name'] as String,
    operatingSystem:
        _$enumDecodeNullable(_$OperatingSystemEnumMap, json['OperatingSystem']),
    patchGroups:
        (json['PatchGroups'] as List)?.map((e) => e as String)?.toList(),
    rejectedPatches:
        (json['RejectedPatches'] as List)?.map((e) => e as String)?.toList(),
    rejectedPatchesAction: _$enumDecodeNullable(
        _$PatchActionEnumMap, json['RejectedPatchesAction']),
    sources: (json['Sources'] as List)
        ?.map((e) =>
            e == null ? null : PatchSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$PatchComplianceLevelEnumMap = {
  PatchComplianceLevel.critical: 'CRITICAL',
  PatchComplianceLevel.high: 'HIGH',
  PatchComplianceLevel.medium: 'MEDIUM',
  PatchComplianceLevel.low: 'LOW',
  PatchComplianceLevel.informational: 'INFORMATIONAL',
  PatchComplianceLevel.unspecified: 'UNSPECIFIED',
};

const _$PatchActionEnumMap = {
  PatchAction.allowAsDependency: 'ALLOW_AS_DEPENDENCY',
  PatchAction.block: 'BLOCK',
};

GetServiceSettingResult _$GetServiceSettingResultFromJson(
    Map<String, dynamic> json) {
  return GetServiceSettingResult(
    serviceSetting: json['ServiceSetting'] == null
        ? null
        : ServiceSetting.fromJson(
            json['ServiceSetting'] as Map<String, dynamic>),
  );
}

InstanceAggregatedAssociationOverview
    _$InstanceAggregatedAssociationOverviewFromJson(Map<String, dynamic> json) {
  return InstanceAggregatedAssociationOverview(
    detailedStatus: json['DetailedStatus'] as String,
    instanceAssociationStatusAggregatedCount:
        (json['InstanceAssociationStatusAggregatedCount']
                as Map<String, dynamic>)
            ?.map(
      (k, e) => MapEntry(k, e as int),
    ),
  );
}

InstanceAssociation _$InstanceAssociationFromJson(Map<String, dynamic> json) {
  return InstanceAssociation(
    associationId: json['AssociationId'] as String,
    associationVersion: json['AssociationVersion'] as String,
    content: json['Content'] as String,
    instanceId: json['InstanceId'] as String,
  );
}

InstanceAssociationOutputLocation _$InstanceAssociationOutputLocationFromJson(
    Map<String, dynamic> json) {
  return InstanceAssociationOutputLocation(
    s3Location: json['S3Location'] == null
        ? null
        : S3OutputLocation.fromJson(json['S3Location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InstanceAssociationOutputLocationToJson(
    InstanceAssociationOutputLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Location', instance.s3Location?.toJson());
  return val;
}

InstanceAssociationOutputUrl _$InstanceAssociationOutputUrlFromJson(
    Map<String, dynamic> json) {
  return InstanceAssociationOutputUrl(
    s3OutputUrl: json['S3OutputUrl'] == null
        ? null
        : S3OutputUrl.fromJson(json['S3OutputUrl'] as Map<String, dynamic>),
  );
}

InstanceAssociationStatusInfo _$InstanceAssociationStatusInfoFromJson(
    Map<String, dynamic> json) {
  return InstanceAssociationStatusInfo(
    associationId: json['AssociationId'] as String,
    associationName: json['AssociationName'] as String,
    associationVersion: json['AssociationVersion'] as String,
    detailedStatus: json['DetailedStatus'] as String,
    documentVersion: json['DocumentVersion'] as String,
    errorCode: json['ErrorCode'] as String,
    executionDate:
        const UnixDateTimeConverter().fromJson(json['ExecutionDate']),
    executionSummary: json['ExecutionSummary'] as String,
    instanceId: json['InstanceId'] as String,
    name: json['Name'] as String,
    outputUrl: json['OutputUrl'] == null
        ? null
        : InstanceAssociationOutputUrl.fromJson(
            json['OutputUrl'] as Map<String, dynamic>),
    status: json['Status'] as String,
  );
}

InstanceInformation _$InstanceInformationFromJson(Map<String, dynamic> json) {
  return InstanceInformation(
    activationId: json['ActivationId'] as String,
    agentVersion: json['AgentVersion'] as String,
    associationOverview: json['AssociationOverview'] == null
        ? null
        : InstanceAggregatedAssociationOverview.fromJson(
            json['AssociationOverview'] as Map<String, dynamic>),
    associationStatus: json['AssociationStatus'] as String,
    computerName: json['ComputerName'] as String,
    iPAddress: json['IPAddress'] as String,
    iamRole: json['IamRole'] as String,
    instanceId: json['InstanceId'] as String,
    isLatestVersion: json['IsLatestVersion'] as bool,
    lastAssociationExecutionDate: const UnixDateTimeConverter()
        .fromJson(json['LastAssociationExecutionDate']),
    lastPingDateTime:
        const UnixDateTimeConverter().fromJson(json['LastPingDateTime']),
    lastSuccessfulAssociationExecutionDate: const UnixDateTimeConverter()
        .fromJson(json['LastSuccessfulAssociationExecutionDate']),
    name: json['Name'] as String,
    pingStatus: _$enumDecodeNullable(_$PingStatusEnumMap, json['PingStatus']),
    platformName: json['PlatformName'] as String,
    platformType:
        _$enumDecodeNullable(_$PlatformTypeEnumMap, json['PlatformType']),
    platformVersion: json['PlatformVersion'] as String,
    registrationDate:
        const UnixDateTimeConverter().fromJson(json['RegistrationDate']),
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
  );
}

const _$PingStatusEnumMap = {
  PingStatus.online: 'Online',
  PingStatus.connectionLost: 'ConnectionLost',
  PingStatus.inactive: 'Inactive',
};

const _$ResourceTypeEnumMap = {
  ResourceType.managedInstance: 'ManagedInstance',
  ResourceType.document: 'Document',
  ResourceType.eC2Instance: 'EC2Instance',
};

Map<String, dynamic> _$InstanceInformationFilterToJson(
    InstanceInformationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', _$InstanceInformationFilterKeyEnumMap[instance.key]);
  writeNotNull('valueSet', instance.valueSet);
  return val;
}

const _$InstanceInformationFilterKeyEnumMap = {
  InstanceInformationFilterKey.instanceIds: 'InstanceIds',
  InstanceInformationFilterKey.agentVersion: 'AgentVersion',
  InstanceInformationFilterKey.pingStatus: 'PingStatus',
  InstanceInformationFilterKey.platformTypes: 'PlatformTypes',
  InstanceInformationFilterKey.activationIds: 'ActivationIds',
  InstanceInformationFilterKey.iamRole: 'IamRole',
  InstanceInformationFilterKey.resourceType: 'ResourceType',
  InstanceInformationFilterKey.associationStatus: 'AssociationStatus',
};

Map<String, dynamic> _$InstanceInformationStringFilterToJson(
    InstanceInformationStringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

InstancePatchState _$InstancePatchStateFromJson(Map<String, dynamic> json) {
  return InstancePatchState(
    baselineId: json['BaselineId'] as String,
    instanceId: json['InstanceId'] as String,
    operation:
        _$enumDecodeNullable(_$PatchOperationTypeEnumMap, json['Operation']),
    operationEndTime:
        const UnixDateTimeConverter().fromJson(json['OperationEndTime']),
    operationStartTime:
        const UnixDateTimeConverter().fromJson(json['OperationStartTime']),
    patchGroup: json['PatchGroup'] as String,
    failedCount: json['FailedCount'] as int,
    installOverrideList: json['InstallOverrideList'] as String,
    installedCount: json['InstalledCount'] as int,
    installedOtherCount: json['InstalledOtherCount'] as int,
    installedPendingRebootCount: json['InstalledPendingRebootCount'] as int,
    installedRejectedCount: json['InstalledRejectedCount'] as int,
    lastNoRebootInstallOperationTime: const UnixDateTimeConverter()
        .fromJson(json['LastNoRebootInstallOperationTime']),
    missingCount: json['MissingCount'] as int,
    notApplicableCount: json['NotApplicableCount'] as int,
    ownerInformation: json['OwnerInformation'] as String,
    rebootOption:
        _$enumDecodeNullable(_$RebootOptionEnumMap, json['RebootOption']),
    snapshotId: json['SnapshotId'] as String,
    unreportedNotApplicableCount: json['UnreportedNotApplicableCount'] as int,
  );
}

const _$PatchOperationTypeEnumMap = {
  PatchOperationType.scan: 'Scan',
  PatchOperationType.install: 'Install',
};

const _$RebootOptionEnumMap = {
  RebootOption.rebootIfNeeded: 'RebootIfNeeded',
  RebootOption.noReboot: 'NoReboot',
};

Map<String, dynamic> _$InstancePatchStateFilterToJson(
    InstancePatchStateFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Type', _$InstancePatchStateOperatorTypeEnumMap[instance.type]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$InstancePatchStateOperatorTypeEnumMap = {
  InstancePatchStateOperatorType.equal: 'Equal',
  InstancePatchStateOperatorType.notEqual: 'NotEqual',
  InstancePatchStateOperatorType.lessThan: 'LessThan',
  InstancePatchStateOperatorType.greaterThan: 'GreaterThan',
};

Map<String, dynamic> _$InventoryAggregatorToJson(InventoryAggregator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Aggregators', instance.aggregators?.map((e) => e?.toJson())?.toList());
  writeNotNull('Expression', instance.expression);
  writeNotNull('Groups', instance.groups?.map((e) => e?.toJson())?.toList());
  return val;
}

InventoryDeletionStatusItem _$InventoryDeletionStatusItemFromJson(
    Map<String, dynamic> json) {
  return InventoryDeletionStatusItem(
    deletionId: json['DeletionId'] as String,
    deletionStartTime:
        const UnixDateTimeConverter().fromJson(json['DeletionStartTime']),
    deletionSummary: json['DeletionSummary'] == null
        ? null
        : InventoryDeletionSummary.fromJson(
            json['DeletionSummary'] as Map<String, dynamic>),
    lastStatus: _$enumDecodeNullable(
        _$InventoryDeletionStatusEnumMap, json['LastStatus']),
    lastStatusMessage: json['LastStatusMessage'] as String,
    lastStatusUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastStatusUpdateTime']),
    typeName: json['TypeName'] as String,
  );
}

const _$InventoryDeletionStatusEnumMap = {
  InventoryDeletionStatus.inProgress: 'InProgress',
  InventoryDeletionStatus.complete: 'Complete',
};

InventoryDeletionSummary _$InventoryDeletionSummaryFromJson(
    Map<String, dynamic> json) {
  return InventoryDeletionSummary(
    remainingCount: json['RemainingCount'] as int,
    summaryItems: (json['SummaryItems'] as List)
        ?.map((e) => e == null
            ? null
            : InventoryDeletionSummaryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['TotalCount'] as int,
  );
}

InventoryDeletionSummaryItem _$InventoryDeletionSummaryItemFromJson(
    Map<String, dynamic> json) {
  return InventoryDeletionSummaryItem(
    count: json['Count'] as int,
    remainingCount: json['RemainingCount'] as int,
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$InventoryFilterToJson(InventoryFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  writeNotNull('Type', _$InventoryQueryOperatorTypeEnumMap[instance.type]);
  return val;
}

const _$InventoryQueryOperatorTypeEnumMap = {
  InventoryQueryOperatorType.equal: 'Equal',
  InventoryQueryOperatorType.notEqual: 'NotEqual',
  InventoryQueryOperatorType.beginWith: 'BeginWith',
  InventoryQueryOperatorType.lessThan: 'LessThan',
  InventoryQueryOperatorType.greaterThan: 'GreaterThan',
  InventoryQueryOperatorType.exists: 'Exists',
};

Map<String, dynamic> _$InventoryGroupToJson(InventoryGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$InventoryItemToJson(InventoryItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CaptureTime', instance.captureTime);
  writeNotNull('SchemaVersion', instance.schemaVersion);
  writeNotNull('TypeName', instance.typeName);
  writeNotNull('Content', instance.content);
  writeNotNull('ContentHash', instance.contentHash);
  writeNotNull('Context', instance.context);
  return val;
}

InventoryItemAttribute _$InventoryItemAttributeFromJson(
    Map<String, dynamic> json) {
  return InventoryItemAttribute(
    dataType: _$enumDecodeNullable(
        _$InventoryAttributeDataTypeEnumMap, json['DataType']),
    name: json['Name'] as String,
  );
}

const _$InventoryAttributeDataTypeEnumMap = {
  InventoryAttributeDataType.string: 'string',
  InventoryAttributeDataType.number: 'number',
};

InventoryItemSchema _$InventoryItemSchemaFromJson(Map<String, dynamic> json) {
  return InventoryItemSchema(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : InventoryItemAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    typeName: json['TypeName'] as String,
    displayName: json['DisplayName'] as String,
    version: json['Version'] as String,
  );
}

InventoryResultEntity _$InventoryResultEntityFromJson(
    Map<String, dynamic> json) {
  return InventoryResultEntity(
    data: (json['Data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : InventoryResultItem.fromJson(e as Map<String, dynamic>)),
    ),
    id: json['Id'] as String,
  );
}

InventoryResultItem _$InventoryResultItemFromJson(Map<String, dynamic> json) {
  return InventoryResultItem(
    content: (json['Content'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as String),
            ))
        ?.toList(),
    schemaVersion: json['SchemaVersion'] as String,
    typeName: json['TypeName'] as String,
    captureTime: json['CaptureTime'] as String,
    contentHash: json['ContentHash'] as String,
  );
}

LabelParameterVersionResult _$LabelParameterVersionResultFromJson(
    Map<String, dynamic> json) {
  return LabelParameterVersionResult(
    invalidLabels:
        (json['InvalidLabels'] as List)?.map((e) => e as String)?.toList(),
    parameterVersion: json['ParameterVersion'] as int,
  );
}

ListAssociationVersionsResult _$ListAssociationVersionsResultFromJson(
    Map<String, dynamic> json) {
  return ListAssociationVersionsResult(
    associationVersions: (json['AssociationVersions'] as List)
        ?.map((e) => e == null
            ? null
            : AssociationVersionInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListAssociationsResult _$ListAssociationsResultFromJson(
    Map<String, dynamic> json) {
  return ListAssociationsResult(
    associations: (json['Associations'] as List)
        ?.map((e) =>
            e == null ? null : Association.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListCommandInvocationsResult _$ListCommandInvocationsResultFromJson(
    Map<String, dynamic> json) {
  return ListCommandInvocationsResult(
    commandInvocations: (json['CommandInvocations'] as List)
        ?.map((e) => e == null
            ? null
            : CommandInvocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListCommandsResult _$ListCommandsResultFromJson(Map<String, dynamic> json) {
  return ListCommandsResult(
    commands: (json['Commands'] as List)
        ?.map((e) =>
            e == null ? null : Command.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListComplianceItemsResult _$ListComplianceItemsResultFromJson(
    Map<String, dynamic> json) {
  return ListComplianceItemsResult(
    complianceItems: (json['ComplianceItems'] as List)
        ?.map((e) => e == null
            ? null
            : ComplianceItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListComplianceSummariesResult _$ListComplianceSummariesResultFromJson(
    Map<String, dynamic> json) {
  return ListComplianceSummariesResult(
    complianceSummaryItems: (json['ComplianceSummaryItems'] as List)
        ?.map((e) => e == null
            ? null
            : ComplianceSummaryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDocumentMetadataHistoryResponse
    _$ListDocumentMetadataHistoryResponseFromJson(Map<String, dynamic> json) {
  return ListDocumentMetadataHistoryResponse(
    author: json['Author'] as String,
    documentVersion: json['DocumentVersion'] as String,
    metadata: json['Metadata'] == null
        ? null
        : DocumentMetadataResponseInfo.fromJson(
            json['Metadata'] as Map<String, dynamic>),
    name: json['Name'] as String,
    nextToken: json['NextToken'] as String,
  );
}

ListDocumentVersionsResult _$ListDocumentVersionsResultFromJson(
    Map<String, dynamic> json) {
  return ListDocumentVersionsResult(
    documentVersions: (json['DocumentVersions'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentVersionInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDocumentsResult _$ListDocumentsResultFromJson(Map<String, dynamic> json) {
  return ListDocumentsResult(
    documentIdentifiers: (json['DocumentIdentifiers'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentIdentifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListInventoryEntriesResult _$ListInventoryEntriesResultFromJson(
    Map<String, dynamic> json) {
  return ListInventoryEntriesResult(
    captureTime: json['CaptureTime'] as String,
    entries: (json['Entries'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as String),
            ))
        ?.toList(),
    instanceId: json['InstanceId'] as String,
    nextToken: json['NextToken'] as String,
    schemaVersion: json['SchemaVersion'] as String,
    typeName: json['TypeName'] as String,
  );
}

ListOpsItemEventsResponse _$ListOpsItemEventsResponseFromJson(
    Map<String, dynamic> json) {
  return ListOpsItemEventsResponse(
    nextToken: json['NextToken'] as String,
    summaries: (json['Summaries'] as List)
        ?.map((e) => e == null
            ? null
            : OpsItemEventSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListOpsMetadataResult _$ListOpsMetadataResultFromJson(
    Map<String, dynamic> json) {
  return ListOpsMetadataResult(
    nextToken: json['NextToken'] as String,
    opsMetadataList: (json['OpsMetadataList'] as List)
        ?.map((e) =>
            e == null ? null : OpsMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListResourceComplianceSummariesResult
    _$ListResourceComplianceSummariesResultFromJson(Map<String, dynamic> json) {
  return ListResourceComplianceSummariesResult(
    nextToken: json['NextToken'] as String,
    resourceComplianceSummaryItems: (json['ResourceComplianceSummaryItems']
            as List)
        ?.map((e) => e == null
            ? null
            : ResourceComplianceSummaryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListResourceDataSyncResult _$ListResourceDataSyncResultFromJson(
    Map<String, dynamic> json) {
  return ListResourceDataSyncResult(
    nextToken: json['NextToken'] as String,
    resourceDataSyncItems: (json['ResourceDataSyncItems'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceDataSyncItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResult _$ListTagsForResourceResultFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResult(
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LoggingInfo _$LoggingInfoFromJson(Map<String, dynamic> json) {
  return LoggingInfo(
    s3BucketName: json['S3BucketName'] as String,
    s3Region: json['S3Region'] as String,
    s3KeyPrefix: json['S3KeyPrefix'] as String,
  );
}

Map<String, dynamic> _$LoggingInfoToJson(LoggingInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3BucketName', instance.s3BucketName);
  writeNotNull('S3Region', instance.s3Region);
  writeNotNull('S3KeyPrefix', instance.s3KeyPrefix);
  return val;
}

MaintenanceWindowAutomationParameters
    _$MaintenanceWindowAutomationParametersFromJson(Map<String, dynamic> json) {
  return MaintenanceWindowAutomationParameters(
    documentVersion: json['DocumentVersion'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
  );
}

Map<String, dynamic> _$MaintenanceWindowAutomationParametersToJson(
    MaintenanceWindowAutomationParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentVersion', instance.documentVersion);
  writeNotNull('Parameters', instance.parameters);
  return val;
}

MaintenanceWindowExecution _$MaintenanceWindowExecutionFromJson(
    Map<String, dynamic> json) {
  return MaintenanceWindowExecution(
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(
        _$MaintenanceWindowExecutionStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
    windowExecutionId: json['WindowExecutionId'] as String,
    windowId: json['WindowId'] as String,
  );
}

MaintenanceWindowExecutionTaskIdentity
    _$MaintenanceWindowExecutionTaskIdentityFromJson(
        Map<String, dynamic> json) {
  return MaintenanceWindowExecutionTaskIdentity(
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(
        _$MaintenanceWindowExecutionStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
    taskArn: json['TaskArn'] as String,
    taskExecutionId: json['TaskExecutionId'] as String,
    taskType: _$enumDecodeNullable(
        _$MaintenanceWindowTaskTypeEnumMap, json['TaskType']),
    windowExecutionId: json['WindowExecutionId'] as String,
  );
}

MaintenanceWindowExecutionTaskInvocationIdentity
    _$MaintenanceWindowExecutionTaskInvocationIdentityFromJson(
        Map<String, dynamic> json) {
  return MaintenanceWindowExecutionTaskInvocationIdentity(
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    executionId: json['ExecutionId'] as String,
    invocationId: json['InvocationId'] as String,
    ownerInformation: json['OwnerInformation'] as String,
    parameters: json['Parameters'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(
        _$MaintenanceWindowExecutionStatusEnumMap, json['Status']),
    statusDetails: json['StatusDetails'] as String,
    taskExecutionId: json['TaskExecutionId'] as String,
    taskType: _$enumDecodeNullable(
        _$MaintenanceWindowTaskTypeEnumMap, json['TaskType']),
    windowExecutionId: json['WindowExecutionId'] as String,
    windowTargetId: json['WindowTargetId'] as String,
  );
}

Map<String, dynamic> _$MaintenanceWindowFilterToJson(
    MaintenanceWindowFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

MaintenanceWindowIdentity _$MaintenanceWindowIdentityFromJson(
    Map<String, dynamic> json) {
  return MaintenanceWindowIdentity(
    cutoff: json['Cutoff'] as int,
    description: json['Description'] as String,
    duration: json['Duration'] as int,
    enabled: json['Enabled'] as bool,
    endDate: json['EndDate'] as String,
    name: json['Name'] as String,
    nextExecutionTime: json['NextExecutionTime'] as String,
    schedule: json['Schedule'] as String,
    scheduleOffset: json['ScheduleOffset'] as int,
    scheduleTimezone: json['ScheduleTimezone'] as String,
    startDate: json['StartDate'] as String,
    windowId: json['WindowId'] as String,
  );
}

MaintenanceWindowIdentityForTarget _$MaintenanceWindowIdentityForTargetFromJson(
    Map<String, dynamic> json) {
  return MaintenanceWindowIdentityForTarget(
    name: json['Name'] as String,
    windowId: json['WindowId'] as String,
  );
}

MaintenanceWindowLambdaParameters _$MaintenanceWindowLambdaParametersFromJson(
    Map<String, dynamic> json) {
  return MaintenanceWindowLambdaParameters(
    clientContext: json['ClientContext'] as String,
    payload: const Uint8ListConverter().fromJson(json['Payload'] as String),
    qualifier: json['Qualifier'] as String,
  );
}

Map<String, dynamic> _$MaintenanceWindowLambdaParametersToJson(
    MaintenanceWindowLambdaParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientContext', instance.clientContext);
  writeNotNull('Payload', const Uint8ListConverter().toJson(instance.payload));
  writeNotNull('Qualifier', instance.qualifier);
  return val;
}

MaintenanceWindowRunCommandParameters
    _$MaintenanceWindowRunCommandParametersFromJson(Map<String, dynamic> json) {
  return MaintenanceWindowRunCommandParameters(
    cloudWatchOutputConfig: json['CloudWatchOutputConfig'] == null
        ? null
        : CloudWatchOutputConfig.fromJson(
            json['CloudWatchOutputConfig'] as Map<String, dynamic>),
    comment: json['Comment'] as String,
    documentHash: json['DocumentHash'] as String,
    documentHashType: _$enumDecodeNullable(
        _$DocumentHashTypeEnumMap, json['DocumentHashType']),
    documentVersion: json['DocumentVersion'] as String,
    notificationConfig: json['NotificationConfig'] == null
        ? null
        : NotificationConfig.fromJson(
            json['NotificationConfig'] as Map<String, dynamic>),
    outputS3BucketName: json['OutputS3BucketName'] as String,
    outputS3KeyPrefix: json['OutputS3KeyPrefix'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    serviceRoleArn: json['ServiceRoleArn'] as String,
    timeoutSeconds: json['TimeoutSeconds'] as int,
  );
}

Map<String, dynamic> _$MaintenanceWindowRunCommandParametersToJson(
    MaintenanceWindowRunCommandParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CloudWatchOutputConfig', instance.cloudWatchOutputConfig?.toJson());
  writeNotNull('Comment', instance.comment);
  writeNotNull('DocumentHash', instance.documentHash);
  writeNotNull(
      'DocumentHashType', _$DocumentHashTypeEnumMap[instance.documentHashType]);
  writeNotNull('DocumentVersion', instance.documentVersion);
  writeNotNull('NotificationConfig', instance.notificationConfig?.toJson());
  writeNotNull('OutputS3BucketName', instance.outputS3BucketName);
  writeNotNull('OutputS3KeyPrefix', instance.outputS3KeyPrefix);
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('ServiceRoleArn', instance.serviceRoleArn);
  writeNotNull('TimeoutSeconds', instance.timeoutSeconds);
  return val;
}

MaintenanceWindowStepFunctionsParameters
    _$MaintenanceWindowStepFunctionsParametersFromJson(
        Map<String, dynamic> json) {
  return MaintenanceWindowStepFunctionsParameters(
    input: json['Input'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$MaintenanceWindowStepFunctionsParametersToJson(
    MaintenanceWindowStepFunctionsParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Input', instance.input);
  writeNotNull('Name', instance.name);
  return val;
}

MaintenanceWindowTarget _$MaintenanceWindowTargetFromJson(
    Map<String, dynamic> json) {
  return MaintenanceWindowTarget(
    description: json['Description'] as String,
    name: json['Name'] as String,
    ownerInformation: json['OwnerInformation'] as String,
    resourceType: _$enumDecodeNullable(
        _$MaintenanceWindowResourceTypeEnumMap, json['ResourceType']),
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    windowId: json['WindowId'] as String,
    windowTargetId: json['WindowTargetId'] as String,
  );
}

const _$MaintenanceWindowResourceTypeEnumMap = {
  MaintenanceWindowResourceType.instance: 'INSTANCE',
  MaintenanceWindowResourceType.resourceGroup: 'RESOURCE_GROUP',
};

MaintenanceWindowTask _$MaintenanceWindowTaskFromJson(
    Map<String, dynamic> json) {
  return MaintenanceWindowTask(
    description: json['Description'] as String,
    loggingInfo: json['LoggingInfo'] == null
        ? null
        : LoggingInfo.fromJson(json['LoggingInfo'] as Map<String, dynamic>),
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    name: json['Name'] as String,
    priority: json['Priority'] as int,
    serviceRoleArn: json['ServiceRoleArn'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taskArn: json['TaskArn'] as String,
    taskParameters: (json['TaskParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : MaintenanceWindowTaskParameterValueExpression.fromJson(
                  e as Map<String, dynamic>)),
    ),
    type:
        _$enumDecodeNullable(_$MaintenanceWindowTaskTypeEnumMap, json['Type']),
    windowId: json['WindowId'] as String,
    windowTaskId: json['WindowTaskId'] as String,
  );
}

MaintenanceWindowTaskInvocationParameters
    _$MaintenanceWindowTaskInvocationParametersFromJson(
        Map<String, dynamic> json) {
  return MaintenanceWindowTaskInvocationParameters(
    automation: json['Automation'] == null
        ? null
        : MaintenanceWindowAutomationParameters.fromJson(
            json['Automation'] as Map<String, dynamic>),
    lambda: json['Lambda'] == null
        ? null
        : MaintenanceWindowLambdaParameters.fromJson(
            json['Lambda'] as Map<String, dynamic>),
    runCommand: json['RunCommand'] == null
        ? null
        : MaintenanceWindowRunCommandParameters.fromJson(
            json['RunCommand'] as Map<String, dynamic>),
    stepFunctions: json['StepFunctions'] == null
        ? null
        : MaintenanceWindowStepFunctionsParameters.fromJson(
            json['StepFunctions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MaintenanceWindowTaskInvocationParametersToJson(
    MaintenanceWindowTaskInvocationParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Automation', instance.automation?.toJson());
  writeNotNull('Lambda', instance.lambda?.toJson());
  writeNotNull('RunCommand', instance.runCommand?.toJson());
  writeNotNull('StepFunctions', instance.stepFunctions?.toJson());
  return val;
}

MaintenanceWindowTaskParameterValueExpression
    _$MaintenanceWindowTaskParameterValueExpressionFromJson(
        Map<String, dynamic> json) {
  return MaintenanceWindowTaskParameterValueExpression(
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MaintenanceWindowTaskParameterValueExpressionToJson(
    MaintenanceWindowTaskParameterValueExpression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  return val;
}

MetadataValue _$MetadataValueFromJson(Map<String, dynamic> json) {
  return MetadataValue(
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$MetadataValueToJson(MetadataValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', instance.value);
  return val;
}

ModifyDocumentPermissionResponse _$ModifyDocumentPermissionResponseFromJson(
    Map<String, dynamic> json) {
  return ModifyDocumentPermissionResponse();
}

NonCompliantSummary _$NonCompliantSummaryFromJson(Map<String, dynamic> json) {
  return NonCompliantSummary(
    nonCompliantCount: json['NonCompliantCount'] as int,
    severitySummary: json['SeveritySummary'] == null
        ? null
        : SeveritySummary.fromJson(
            json['SeveritySummary'] as Map<String, dynamic>),
  );
}

NotificationConfig _$NotificationConfigFromJson(Map<String, dynamic> json) {
  return NotificationConfig(
    notificationArn: json['NotificationArn'] as String,
    notificationEvents: (json['NotificationEvents'] as List)
        ?.map((e) => _$enumDecodeNullable(_$NotificationEventEnumMap, e))
        ?.toList(),
    notificationType: _$enumDecodeNullable(
        _$NotificationTypeEnumMap, json['NotificationType']),
  );
}

Map<String, dynamic> _$NotificationConfigToJson(NotificationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NotificationArn', instance.notificationArn);
  writeNotNull(
      'NotificationEvents',
      instance.notificationEvents
          ?.map((e) => _$NotificationEventEnumMap[e])
          ?.toList());
  writeNotNull(
      'NotificationType', _$NotificationTypeEnumMap[instance.notificationType]);
  return val;
}

const _$NotificationEventEnumMap = {
  NotificationEvent.all: 'All',
  NotificationEvent.inProgress: 'InProgress',
  NotificationEvent.success: 'Success',
  NotificationEvent.timedOut: 'TimedOut',
  NotificationEvent.cancelled: 'Cancelled',
  NotificationEvent.failed: 'Failed',
};

const _$NotificationTypeEnumMap = {
  NotificationType.command: 'Command',
  NotificationType.invocation: 'Invocation',
};

Map<String, dynamic> _$OpsAggregatorToJson(OpsAggregator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AggregatorType', instance.aggregatorType);
  writeNotNull(
      'Aggregators', instance.aggregators?.map((e) => e?.toJson())?.toList());
  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('TypeName', instance.typeName);
  writeNotNull('Values', instance.values);
  return val;
}

OpsEntity _$OpsEntityFromJson(Map<String, dynamic> json) {
  return OpsEntity(
    data: (json['Data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : OpsEntityItem.fromJson(e as Map<String, dynamic>)),
    ),
    id: json['Id'] as String,
  );
}

OpsEntityItem _$OpsEntityItemFromJson(Map<String, dynamic> json) {
  return OpsEntityItem(
    captureTime: json['CaptureTime'] as String,
    content: (json['Content'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as String),
            ))
        ?.toList(),
  );
}

Map<String, dynamic> _$OpsFilterToJson(OpsFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  writeNotNull('Type', _$OpsFilterOperatorTypeEnumMap[instance.type]);
  return val;
}

const _$OpsFilterOperatorTypeEnumMap = {
  OpsFilterOperatorType.equal: 'Equal',
  OpsFilterOperatorType.notEqual: 'NotEqual',
  OpsFilterOperatorType.beginWith: 'BeginWith',
  OpsFilterOperatorType.lessThan: 'LessThan',
  OpsFilterOperatorType.greaterThan: 'GreaterThan',
  OpsFilterOperatorType.exists: 'Exists',
};

OpsItem _$OpsItemFromJson(Map<String, dynamic> json) {
  return OpsItem(
    actualEndTime:
        const UnixDateTimeConverter().fromJson(json['ActualEndTime']),
    actualStartTime:
        const UnixDateTimeConverter().fromJson(json['ActualStartTime']),
    category: json['Category'] as String,
    createdBy: json['CreatedBy'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    description: json['Description'] as String,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    notifications: (json['Notifications'] as List)
        ?.map((e) => e == null
            ? null
            : OpsItemNotification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    operationalData: (json['OperationalData'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : OpsItemDataValue.fromJson(e as Map<String, dynamic>)),
    ),
    opsItemId: json['OpsItemId'] as String,
    opsItemType: json['OpsItemType'] as String,
    plannedEndTime:
        const UnixDateTimeConverter().fromJson(json['PlannedEndTime']),
    plannedStartTime:
        const UnixDateTimeConverter().fromJson(json['PlannedStartTime']),
    priority: json['Priority'] as int,
    relatedOpsItems: (json['RelatedOpsItems'] as List)
        ?.map((e) => e == null
            ? null
            : RelatedOpsItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    severity: json['Severity'] as String,
    source: json['Source'] as String,
    status: _$enumDecodeNullable(_$OpsItemStatusEnumMap, json['Status']),
    title: json['Title'] as String,
    version: json['Version'] as String,
  );
}

const _$OpsItemStatusEnumMap = {
  OpsItemStatus.open: 'Open',
  OpsItemStatus.inProgress: 'InProgress',
  OpsItemStatus.resolved: 'Resolved',
  OpsItemStatus.pending: 'Pending',
  OpsItemStatus.timedOut: 'TimedOut',
  OpsItemStatus.cancelling: 'Cancelling',
  OpsItemStatus.cancelled: 'Cancelled',
  OpsItemStatus.failed: 'Failed',
  OpsItemStatus.completedWithSuccess: 'CompletedWithSuccess',
  OpsItemStatus.completedWithFailure: 'CompletedWithFailure',
  OpsItemStatus.scheduled: 'Scheduled',
  OpsItemStatus.runbookInProgress: 'RunbookInProgress',
  OpsItemStatus.pendingChangeCalendarOverride: 'PendingChangeCalendarOverride',
  OpsItemStatus.changeCalendarOverrideApproved:
      'ChangeCalendarOverrideApproved',
  OpsItemStatus.changeCalendarOverrideRejected:
      'ChangeCalendarOverrideRejected',
  OpsItemStatus.pendingApproval: 'PendingApproval',
  OpsItemStatus.approved: 'Approved',
  OpsItemStatus.rejected: 'Rejected',
};

OpsItemDataValue _$OpsItemDataValueFromJson(Map<String, dynamic> json) {
  return OpsItemDataValue(
    type: _$enumDecodeNullable(_$OpsItemDataTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$OpsItemDataValueToJson(OpsItemDataValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$OpsItemDataTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$OpsItemDataTypeEnumMap = {
  OpsItemDataType.searchableString: 'SearchableString',
  OpsItemDataType.string: 'String',
};

Map<String, dynamic> _$OpsItemEventFilterToJson(OpsItemEventFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$OpsItemEventFilterKeyEnumMap[instance.key]);
  writeNotNull(
      'Operator', _$OpsItemEventFilterOperatorEnumMap[instance.operator]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$OpsItemEventFilterKeyEnumMap = {
  OpsItemEventFilterKey.opsItemId: 'OpsItemId',
};

const _$OpsItemEventFilterOperatorEnumMap = {
  OpsItemEventFilterOperator.equal: 'Equal',
};

OpsItemEventSummary _$OpsItemEventSummaryFromJson(Map<String, dynamic> json) {
  return OpsItemEventSummary(
    createdBy: json['CreatedBy'] == null
        ? null
        : OpsItemIdentity.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    detail: json['Detail'] as String,
    detailType: json['DetailType'] as String,
    eventId: json['EventId'] as String,
    opsItemId: json['OpsItemId'] as String,
    source: json['Source'] as String,
  );
}

Map<String, dynamic> _$OpsItemFilterToJson(OpsItemFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$OpsItemFilterKeyEnumMap[instance.key]);
  writeNotNull('Operator', _$OpsItemFilterOperatorEnumMap[instance.operator]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$OpsItemFilterKeyEnumMap = {
  OpsItemFilterKey.status: 'Status',
  OpsItemFilterKey.createdBy: 'CreatedBy',
  OpsItemFilterKey.source: 'Source',
  OpsItemFilterKey.priority: 'Priority',
  OpsItemFilterKey.title: 'Title',
  OpsItemFilterKey.opsItemId: 'OpsItemId',
  OpsItemFilterKey.createdTime: 'CreatedTime',
  OpsItemFilterKey.lastModifiedTime: 'LastModifiedTime',
  OpsItemFilterKey.actualStartTime: 'ActualStartTime',
  OpsItemFilterKey.actualEndTime: 'ActualEndTime',
  OpsItemFilterKey.plannedStartTime: 'PlannedStartTime',
  OpsItemFilterKey.plannedEndTime: 'PlannedEndTime',
  OpsItemFilterKey.operationalData: 'OperationalData',
  OpsItemFilterKey.operationalDataKey: 'OperationalDataKey',
  OpsItemFilterKey.operationalDataValue: 'OperationalDataValue',
  OpsItemFilterKey.resourceId: 'ResourceId',
  OpsItemFilterKey.automationId: 'AutomationId',
  OpsItemFilterKey.category: 'Category',
  OpsItemFilterKey.severity: 'Severity',
  OpsItemFilterKey.opsItemType: 'OpsItemType',
  OpsItemFilterKey.changeRequestByRequesterArn: 'ChangeRequestByRequesterArn',
  OpsItemFilterKey.changeRequestByRequesterName: 'ChangeRequestByRequesterName',
  OpsItemFilterKey.changeRequestByApproverArn: 'ChangeRequestByApproverArn',
  OpsItemFilterKey.changeRequestByApproverName: 'ChangeRequestByApproverName',
  OpsItemFilterKey.changeRequestByTemplate: 'ChangeRequestByTemplate',
  OpsItemFilterKey.changeRequestByTargetsResourceGroup:
      'ChangeRequestByTargetsResourceGroup',
};

const _$OpsItemFilterOperatorEnumMap = {
  OpsItemFilterOperator.equal: 'Equal',
  OpsItemFilterOperator.contains: 'Contains',
  OpsItemFilterOperator.greaterThan: 'GreaterThan',
  OpsItemFilterOperator.lessThan: 'LessThan',
};

OpsItemIdentity _$OpsItemIdentityFromJson(Map<String, dynamic> json) {
  return OpsItemIdentity(
    arn: json['Arn'] as String,
  );
}

OpsItemNotification _$OpsItemNotificationFromJson(Map<String, dynamic> json) {
  return OpsItemNotification(
    arn: json['Arn'] as String,
  );
}

Map<String, dynamic> _$OpsItemNotificationToJson(OpsItemNotification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  return val;
}

OpsItemSummary _$OpsItemSummaryFromJson(Map<String, dynamic> json) {
  return OpsItemSummary(
    actualEndTime:
        const UnixDateTimeConverter().fromJson(json['ActualEndTime']),
    actualStartTime:
        const UnixDateTimeConverter().fromJson(json['ActualStartTime']),
    category: json['Category'] as String,
    createdBy: json['CreatedBy'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    operationalData: (json['OperationalData'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : OpsItemDataValue.fromJson(e as Map<String, dynamic>)),
    ),
    opsItemId: json['OpsItemId'] as String,
    opsItemType: json['OpsItemType'] as String,
    plannedEndTime:
        const UnixDateTimeConverter().fromJson(json['PlannedEndTime']),
    plannedStartTime:
        const UnixDateTimeConverter().fromJson(json['PlannedStartTime']),
    priority: json['Priority'] as int,
    severity: json['Severity'] as String,
    source: json['Source'] as String,
    status: _$enumDecodeNullable(_$OpsItemStatusEnumMap, json['Status']),
    title: json['Title'] as String,
  );
}

OpsMetadata _$OpsMetadataFromJson(Map<String, dynamic> json) {
  return OpsMetadata(
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    lastModifiedUser: json['LastModifiedUser'] as String,
    opsMetadataArn: json['OpsMetadataArn'] as String,
    resourceId: json['ResourceId'] as String,
  );
}

Map<String, dynamic> _$OpsMetadataFilterToJson(OpsMetadataFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$OpsResultAttributeToJson(OpsResultAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TypeName', instance.typeName);
  return val;
}

OutputSource _$OutputSourceFromJson(Map<String, dynamic> json) {
  return OutputSource(
    outputSourceId: json['OutputSourceId'] as String,
    outputSourceType: json['OutputSourceType'] as String,
  );
}

Parameter _$ParameterFromJson(Map<String, dynamic> json) {
  return Parameter(
    arn: json['ARN'] as String,
    dataType: json['DataType'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    name: json['Name'] as String,
    selector: json['Selector'] as String,
    sourceResult: json['SourceResult'] as String,
    type: _$enumDecodeNullable(_$ParameterTypeEnumMap, json['Type']),
    value: json['Value'] as String,
    version: json['Version'] as int,
  );
}

const _$ParameterTypeEnumMap = {
  ParameterType.string: 'String',
  ParameterType.stringList: 'StringList',
  ParameterType.secureString: 'SecureString',
};

ParameterHistory _$ParameterHistoryFromJson(Map<String, dynamic> json) {
  return ParameterHistory(
    allowedPattern: json['AllowedPattern'] as String,
    dataType: json['DataType'] as String,
    description: json['Description'] as String,
    keyId: json['KeyId'] as String,
    labels: (json['Labels'] as List)?.map((e) => e as String)?.toList(),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    lastModifiedUser: json['LastModifiedUser'] as String,
    name: json['Name'] as String,
    policies: (json['Policies'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterInlinePolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tier: _$enumDecodeNullable(_$ParameterTierEnumMap, json['Tier']),
    type: _$enumDecodeNullable(_$ParameterTypeEnumMap, json['Type']),
    value: json['Value'] as String,
    version: json['Version'] as int,
  );
}

const _$ParameterTierEnumMap = {
  ParameterTier.standard: 'Standard',
  ParameterTier.advanced: 'Advanced',
  ParameterTier.intelligentTiering: 'Intelligent-Tiering',
};

ParameterInlinePolicy _$ParameterInlinePolicyFromJson(
    Map<String, dynamic> json) {
  return ParameterInlinePolicy(
    policyStatus: json['PolicyStatus'] as String,
    policyText: json['PolicyText'] as String,
    policyType: json['PolicyType'] as String,
  );
}

ParameterMetadata _$ParameterMetadataFromJson(Map<String, dynamic> json) {
  return ParameterMetadata(
    allowedPattern: json['AllowedPattern'] as String,
    dataType: json['DataType'] as String,
    description: json['Description'] as String,
    keyId: json['KeyId'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    lastModifiedUser: json['LastModifiedUser'] as String,
    name: json['Name'] as String,
    policies: (json['Policies'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterInlinePolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tier: _$enumDecodeNullable(_$ParameterTierEnumMap, json['Tier']),
    type: _$enumDecodeNullable(_$ParameterTypeEnumMap, json['Type']),
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$ParameterStringFilterToJson(
    ParameterStringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Option', instance.option);
  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$ParametersFilterToJson(ParametersFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$ParametersFilterKeyEnumMap[instance.key]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$ParametersFilterKeyEnumMap = {
  ParametersFilterKey.name: 'Name',
  ParametersFilterKey.type: 'Type',
  ParametersFilterKey.keyId: 'KeyId',
};

Patch _$PatchFromJson(Map<String, dynamic> json) {
  return Patch(
    advisoryIds:
        (json['AdvisoryIds'] as List)?.map((e) => e as String)?.toList(),
    arch: json['Arch'] as String,
    bugzillaIds:
        (json['BugzillaIds'] as List)?.map((e) => e as String)?.toList(),
    cVEIds: (json['CVEIds'] as List)?.map((e) => e as String)?.toList(),
    classification: json['Classification'] as String,
    contentUrl: json['ContentUrl'] as String,
    description: json['Description'] as String,
    epoch: json['Epoch'] as int,
    id: json['Id'] as String,
    kbNumber: json['KbNumber'] as String,
    language: json['Language'] as String,
    msrcNumber: json['MsrcNumber'] as String,
    msrcSeverity: json['MsrcSeverity'] as String,
    name: json['Name'] as String,
    product: json['Product'] as String,
    productFamily: json['ProductFamily'] as String,
    release: json['Release'] as String,
    releaseDate: const UnixDateTimeConverter().fromJson(json['ReleaseDate']),
    repository: json['Repository'] as String,
    severity: json['Severity'] as String,
    title: json['Title'] as String,
    vendor: json['Vendor'] as String,
    version: json['Version'] as String,
  );
}

PatchBaselineIdentity _$PatchBaselineIdentityFromJson(
    Map<String, dynamic> json) {
  return PatchBaselineIdentity(
    baselineDescription: json['BaselineDescription'] as String,
    baselineId: json['BaselineId'] as String,
    baselineName: json['BaselineName'] as String,
    defaultBaseline: json['DefaultBaseline'] as bool,
    operatingSystem:
        _$enumDecodeNullable(_$OperatingSystemEnumMap, json['OperatingSystem']),
  );
}

PatchComplianceData _$PatchComplianceDataFromJson(Map<String, dynamic> json) {
  return PatchComplianceData(
    classification: json['Classification'] as String,
    installedTime:
        const UnixDateTimeConverter().fromJson(json['InstalledTime']),
    kBId: json['KBId'] as String,
    severity: json['Severity'] as String,
    state:
        _$enumDecodeNullable(_$PatchComplianceDataStateEnumMap, json['State']),
    title: json['Title'] as String,
    cVEIds: json['CVEIds'] as String,
  );
}

const _$PatchComplianceDataStateEnumMap = {
  PatchComplianceDataState.installed: 'INSTALLED',
  PatchComplianceDataState.installedOther: 'INSTALLED_OTHER',
  PatchComplianceDataState.installedPendingReboot: 'INSTALLED_PENDING_REBOOT',
  PatchComplianceDataState.installedRejected: 'INSTALLED_REJECTED',
  PatchComplianceDataState.missing: 'MISSING',
  PatchComplianceDataState.notApplicable: 'NOT_APPLICABLE',
  PatchComplianceDataState.failed: 'FAILED',
};

PatchFilter _$PatchFilterFromJson(Map<String, dynamic> json) {
  return PatchFilter(
    key: _$enumDecodeNullable(_$PatchFilterKeyEnumMap, json['Key']),
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PatchFilterToJson(PatchFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$PatchFilterKeyEnumMap[instance.key]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$PatchFilterKeyEnumMap = {
  PatchFilterKey.arch: 'ARCH',
  PatchFilterKey.advisoryId: 'ADVISORY_ID',
  PatchFilterKey.bugzillaId: 'BUGZILLA_ID',
  PatchFilterKey.patchSet: 'PATCH_SET',
  PatchFilterKey.product: 'PRODUCT',
  PatchFilterKey.productFamily: 'PRODUCT_FAMILY',
  PatchFilterKey.classification: 'CLASSIFICATION',
  PatchFilterKey.cveId: 'CVE_ID',
  PatchFilterKey.epoch: 'EPOCH',
  PatchFilterKey.msrcSeverity: 'MSRC_SEVERITY',
  PatchFilterKey.name: 'NAME',
  PatchFilterKey.patchId: 'PATCH_ID',
  PatchFilterKey.section: 'SECTION',
  PatchFilterKey.priority: 'PRIORITY',
  PatchFilterKey.repository: 'REPOSITORY',
  PatchFilterKey.release: 'RELEASE',
  PatchFilterKey.severity: 'SEVERITY',
  PatchFilterKey.security: 'SECURITY',
  PatchFilterKey.version: 'VERSION',
};

PatchFilterGroup _$PatchFilterGroupFromJson(Map<String, dynamic> json) {
  return PatchFilterGroup(
    patchFilters: (json['PatchFilters'] as List)
        ?.map((e) =>
            e == null ? null : PatchFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PatchFilterGroupToJson(PatchFilterGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'PatchFilters', instance.patchFilters?.map((e) => e?.toJson())?.toList());
  return val;
}

PatchGroupPatchBaselineMapping _$PatchGroupPatchBaselineMappingFromJson(
    Map<String, dynamic> json) {
  return PatchGroupPatchBaselineMapping(
    baselineIdentity: json['BaselineIdentity'] == null
        ? null
        : PatchBaselineIdentity.fromJson(
            json['BaselineIdentity'] as Map<String, dynamic>),
    patchGroup: json['PatchGroup'] as String,
  );
}

Map<String, dynamic> _$PatchOrchestratorFilterToJson(
    PatchOrchestratorFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

PatchRule _$PatchRuleFromJson(Map<String, dynamic> json) {
  return PatchRule(
    patchFilterGroup: json['PatchFilterGroup'] == null
        ? null
        : PatchFilterGroup.fromJson(
            json['PatchFilterGroup'] as Map<String, dynamic>),
    approveAfterDays: json['ApproveAfterDays'] as int,
    approveUntilDate: json['ApproveUntilDate'] as String,
    complianceLevel: _$enumDecodeNullable(
        _$PatchComplianceLevelEnumMap, json['ComplianceLevel']),
    enableNonSecurity: json['EnableNonSecurity'] as bool,
  );
}

Map<String, dynamic> _$PatchRuleToJson(PatchRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PatchFilterGroup', instance.patchFilterGroup?.toJson());
  writeNotNull('ApproveAfterDays', instance.approveAfterDays);
  writeNotNull('ApproveUntilDate', instance.approveUntilDate);
  writeNotNull('ComplianceLevel',
      _$PatchComplianceLevelEnumMap[instance.complianceLevel]);
  writeNotNull('EnableNonSecurity', instance.enableNonSecurity);
  return val;
}

PatchRuleGroup _$PatchRuleGroupFromJson(Map<String, dynamic> json) {
  return PatchRuleGroup(
    patchRules: (json['PatchRules'] as List)
        ?.map((e) =>
            e == null ? null : PatchRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PatchRuleGroupToJson(PatchRuleGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'PatchRules', instance.patchRules?.map((e) => e?.toJson())?.toList());
  return val;
}

PatchSource _$PatchSourceFromJson(Map<String, dynamic> json) {
  return PatchSource(
    configuration: json['Configuration'] as String,
    name: json['Name'] as String,
    products: (json['Products'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PatchSourceToJson(PatchSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Configuration', instance.configuration);
  writeNotNull('Name', instance.name);
  writeNotNull('Products', instance.products);
  return val;
}

PatchStatus _$PatchStatusFromJson(Map<String, dynamic> json) {
  return PatchStatus(
    approvalDate: const UnixDateTimeConverter().fromJson(json['ApprovalDate']),
    complianceLevel: _$enumDecodeNullable(
        _$PatchComplianceLevelEnumMap, json['ComplianceLevel']),
    deploymentStatus: _$enumDecodeNullable(
        _$PatchDeploymentStatusEnumMap, json['DeploymentStatus']),
  );
}

const _$PatchDeploymentStatusEnumMap = {
  PatchDeploymentStatus.approved: 'APPROVED',
  PatchDeploymentStatus.pendingApproval: 'PENDING_APPROVAL',
  PatchDeploymentStatus.explicitApproved: 'EXPLICIT_APPROVED',
  PatchDeploymentStatus.explicitRejected: 'EXPLICIT_REJECTED',
};

ProgressCounters _$ProgressCountersFromJson(Map<String, dynamic> json) {
  return ProgressCounters(
    cancelledSteps: json['CancelledSteps'] as int,
    failedSteps: json['FailedSteps'] as int,
    successSteps: json['SuccessSteps'] as int,
    timedOutSteps: json['TimedOutSteps'] as int,
    totalSteps: json['TotalSteps'] as int,
  );
}

PutComplianceItemsResult _$PutComplianceItemsResultFromJson(
    Map<String, dynamic> json) {
  return PutComplianceItemsResult();
}

PutInventoryResult _$PutInventoryResultFromJson(Map<String, dynamic> json) {
  return PutInventoryResult(
    message: json['Message'] as String,
  );
}

PutParameterResult _$PutParameterResultFromJson(Map<String, dynamic> json) {
  return PutParameterResult(
    tier: _$enumDecodeNullable(_$ParameterTierEnumMap, json['Tier']),
    version: json['Version'] as int,
  );
}

RegisterDefaultPatchBaselineResult _$RegisterDefaultPatchBaselineResultFromJson(
    Map<String, dynamic> json) {
  return RegisterDefaultPatchBaselineResult(
    baselineId: json['BaselineId'] as String,
  );
}

RegisterPatchBaselineForPatchGroupResult
    _$RegisterPatchBaselineForPatchGroupResultFromJson(
        Map<String, dynamic> json) {
  return RegisterPatchBaselineForPatchGroupResult(
    baselineId: json['BaselineId'] as String,
    patchGroup: json['PatchGroup'] as String,
  );
}

RegisterTargetWithMaintenanceWindowResult
    _$RegisterTargetWithMaintenanceWindowResultFromJson(
        Map<String, dynamic> json) {
  return RegisterTargetWithMaintenanceWindowResult(
    windowTargetId: json['WindowTargetId'] as String,
  );
}

RegisterTaskWithMaintenanceWindowResult
    _$RegisterTaskWithMaintenanceWindowResultFromJson(
        Map<String, dynamic> json) {
  return RegisterTaskWithMaintenanceWindowResult(
    windowTaskId: json['WindowTaskId'] as String,
  );
}

RelatedOpsItem _$RelatedOpsItemFromJson(Map<String, dynamic> json) {
  return RelatedOpsItem(
    opsItemId: json['OpsItemId'] as String,
  );
}

Map<String, dynamic> _$RelatedOpsItemToJson(RelatedOpsItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OpsItemId', instance.opsItemId);
  return val;
}

RemoveTagsFromResourceResult _$RemoveTagsFromResourceResultFromJson(
    Map<String, dynamic> json) {
  return RemoveTagsFromResourceResult();
}

ResetServiceSettingResult _$ResetServiceSettingResultFromJson(
    Map<String, dynamic> json) {
  return ResetServiceSettingResult(
    serviceSetting: json['ServiceSetting'] == null
        ? null
        : ServiceSetting.fromJson(
            json['ServiceSetting'] as Map<String, dynamic>),
  );
}

ResolvedTargets _$ResolvedTargetsFromJson(Map<String, dynamic> json) {
  return ResolvedTargets(
    parameterValues:
        (json['ParameterValues'] as List)?.map((e) => e as String)?.toList(),
    truncated: json['Truncated'] as bool,
  );
}

ResourceComplianceSummaryItem _$ResourceComplianceSummaryItemFromJson(
    Map<String, dynamic> json) {
  return ResourceComplianceSummaryItem(
    complianceType: json['ComplianceType'] as String,
    compliantSummary: json['CompliantSummary'] == null
        ? null
        : CompliantSummary.fromJson(
            json['CompliantSummary'] as Map<String, dynamic>),
    executionSummary: json['ExecutionSummary'] == null
        ? null
        : ComplianceExecutionSummary.fromJson(
            json['ExecutionSummary'] as Map<String, dynamic>),
    nonCompliantSummary: json['NonCompliantSummary'] == null
        ? null
        : NonCompliantSummary.fromJson(
            json['NonCompliantSummary'] as Map<String, dynamic>),
    overallSeverity: _$enumDecodeNullable(
        _$ComplianceSeverityEnumMap, json['OverallSeverity']),
    resourceId: json['ResourceId'] as String,
    resourceType: json['ResourceType'] as String,
    status: _$enumDecodeNullable(_$ComplianceStatusEnumMap, json['Status']),
  );
}

ResourceDataSyncAwsOrganizationsSource
    _$ResourceDataSyncAwsOrganizationsSourceFromJson(
        Map<String, dynamic> json) {
  return ResourceDataSyncAwsOrganizationsSource(
    organizationSourceType: json['OrganizationSourceType'] as String,
    organizationalUnits: (json['OrganizationalUnits'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceDataSyncOrganizationalUnit.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResourceDataSyncAwsOrganizationsSourceToJson(
    ResourceDataSyncAwsOrganizationsSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OrganizationSourceType', instance.organizationSourceType);
  writeNotNull('OrganizationalUnits',
      instance.organizationalUnits?.map((e) => e?.toJson())?.toList());
  return val;
}

ResourceDataSyncDestinationDataSharing
    _$ResourceDataSyncDestinationDataSharingFromJson(
        Map<String, dynamic> json) {
  return ResourceDataSyncDestinationDataSharing(
    destinationDataSharingType: json['DestinationDataSharingType'] as String,
  );
}

Map<String, dynamic> _$ResourceDataSyncDestinationDataSharingToJson(
    ResourceDataSyncDestinationDataSharing instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DestinationDataSharingType', instance.destinationDataSharingType);
  return val;
}

ResourceDataSyncItem _$ResourceDataSyncItemFromJson(Map<String, dynamic> json) {
  return ResourceDataSyncItem(
    lastStatus: _$enumDecodeNullable(
        _$LastResourceDataSyncStatusEnumMap, json['LastStatus']),
    lastSuccessfulSyncTime:
        const UnixDateTimeConverter().fromJson(json['LastSuccessfulSyncTime']),
    lastSyncStatusMessage: json['LastSyncStatusMessage'] as String,
    lastSyncTime: const UnixDateTimeConverter().fromJson(json['LastSyncTime']),
    s3Destination: json['S3Destination'] == null
        ? null
        : ResourceDataSyncS3Destination.fromJson(
            json['S3Destination'] as Map<String, dynamic>),
    syncCreatedTime:
        const UnixDateTimeConverter().fromJson(json['SyncCreatedTime']),
    syncLastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['SyncLastModifiedTime']),
    syncName: json['SyncName'] as String,
    syncSource: json['SyncSource'] == null
        ? null
        : ResourceDataSyncSourceWithState.fromJson(
            json['SyncSource'] as Map<String, dynamic>),
    syncType: json['SyncType'] as String,
  );
}

const _$LastResourceDataSyncStatusEnumMap = {
  LastResourceDataSyncStatus.successful: 'Successful',
  LastResourceDataSyncStatus.failed: 'Failed',
  LastResourceDataSyncStatus.inProgress: 'InProgress',
};

ResourceDataSyncOrganizationalUnit _$ResourceDataSyncOrganizationalUnitFromJson(
    Map<String, dynamic> json) {
  return ResourceDataSyncOrganizationalUnit(
    organizationalUnitId: json['OrganizationalUnitId'] as String,
  );
}

Map<String, dynamic> _$ResourceDataSyncOrganizationalUnitToJson(
    ResourceDataSyncOrganizationalUnit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OrganizationalUnitId', instance.organizationalUnitId);
  return val;
}

ResourceDataSyncS3Destination _$ResourceDataSyncS3DestinationFromJson(
    Map<String, dynamic> json) {
  return ResourceDataSyncS3Destination(
    bucketName: json['BucketName'] as String,
    region: json['Region'] as String,
    syncFormat: _$enumDecodeNullable(
        _$ResourceDataSyncS3FormatEnumMap, json['SyncFormat']),
    awsKMSKeyARN: json['AWSKMSKeyARN'] as String,
    destinationDataSharing: json['DestinationDataSharing'] == null
        ? null
        : ResourceDataSyncDestinationDataSharing.fromJson(
            json['DestinationDataSharing'] as Map<String, dynamic>),
    prefix: json['Prefix'] as String,
  );
}

Map<String, dynamic> _$ResourceDataSyncS3DestinationToJson(
    ResourceDataSyncS3Destination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketName', instance.bucketName);
  writeNotNull('Region', instance.region);
  writeNotNull(
      'SyncFormat', _$ResourceDataSyncS3FormatEnumMap[instance.syncFormat]);
  writeNotNull('AWSKMSKeyARN', instance.awsKMSKeyARN);
  writeNotNull(
      'DestinationDataSharing', instance.destinationDataSharing?.toJson());
  writeNotNull('Prefix', instance.prefix);
  return val;
}

const _$ResourceDataSyncS3FormatEnumMap = {
  ResourceDataSyncS3Format.jsonSerDe: 'JsonSerDe',
};

Map<String, dynamic> _$ResourceDataSyncSourceToJson(
    ResourceDataSyncSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceRegions', instance.sourceRegions);
  writeNotNull('SourceType', instance.sourceType);
  writeNotNull(
      'AwsOrganizationsSource', instance.awsOrganizationsSource?.toJson());
  writeNotNull('IncludeFutureRegions', instance.includeFutureRegions);
  return val;
}

ResourceDataSyncSourceWithState _$ResourceDataSyncSourceWithStateFromJson(
    Map<String, dynamic> json) {
  return ResourceDataSyncSourceWithState(
    awsOrganizationsSource: json['AwsOrganizationsSource'] == null
        ? null
        : ResourceDataSyncAwsOrganizationsSource.fromJson(
            json['AwsOrganizationsSource'] as Map<String, dynamic>),
    includeFutureRegions: json['IncludeFutureRegions'] as bool,
    sourceRegions:
        (json['SourceRegions'] as List)?.map((e) => e as String)?.toList(),
    sourceType: json['SourceType'] as String,
    state: json['State'] as String,
  );
}

Map<String, dynamic> _$ResultAttributeToJson(ResultAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TypeName', instance.typeName);
  return val;
}

ResumeSessionResponse _$ResumeSessionResponseFromJson(
    Map<String, dynamic> json) {
  return ResumeSessionResponse(
    sessionId: json['SessionId'] as String,
    streamUrl: json['StreamUrl'] as String,
    tokenValue: json['TokenValue'] as String,
  );
}

ReviewInformation _$ReviewInformationFromJson(Map<String, dynamic> json) {
  return ReviewInformation(
    reviewedTime: const UnixDateTimeConverter().fromJson(json['ReviewedTime']),
    reviewer: json['Reviewer'] as String,
    status: _$enumDecodeNullable(_$ReviewStatusEnumMap, json['Status']),
  );
}

Runbook _$RunbookFromJson(Map<String, dynamic> json) {
  return Runbook(
    documentName: json['DocumentName'] as String,
    documentVersion: json['DocumentVersion'] as String,
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    targetLocations: (json['TargetLocations'] as List)
        ?.map((e) => e == null
            ? null
            : TargetLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    targetParameterName: json['TargetParameterName'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RunbookToJson(Runbook instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DocumentName', instance.documentName);
  writeNotNull('DocumentVersion', instance.documentVersion);
  writeNotNull('MaxConcurrency', instance.maxConcurrency);
  writeNotNull('MaxErrors', instance.maxErrors);
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('TargetLocations',
      instance.targetLocations?.map((e) => e?.toJson())?.toList());
  writeNotNull('TargetParameterName', instance.targetParameterName);
  writeNotNull('Targets', instance.targets?.map((e) => e?.toJson())?.toList());
  return val;
}

S3OutputLocation _$S3OutputLocationFromJson(Map<String, dynamic> json) {
  return S3OutputLocation(
    outputS3BucketName: json['OutputS3BucketName'] as String,
    outputS3KeyPrefix: json['OutputS3KeyPrefix'] as String,
    outputS3Region: json['OutputS3Region'] as String,
  );
}

Map<String, dynamic> _$S3OutputLocationToJson(S3OutputLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OutputS3BucketName', instance.outputS3BucketName);
  writeNotNull('OutputS3KeyPrefix', instance.outputS3KeyPrefix);
  writeNotNull('OutputS3Region', instance.outputS3Region);
  return val;
}

S3OutputUrl _$S3OutputUrlFromJson(Map<String, dynamic> json) {
  return S3OutputUrl(
    outputUrl: json['OutputUrl'] as String,
  );
}

ScheduledWindowExecution _$ScheduledWindowExecutionFromJson(
    Map<String, dynamic> json) {
  return ScheduledWindowExecution(
    executionTime: json['ExecutionTime'] as String,
    name: json['Name'] as String,
    windowId: json['WindowId'] as String,
  );
}

SendAutomationSignalResult _$SendAutomationSignalResultFromJson(
    Map<String, dynamic> json) {
  return SendAutomationSignalResult();
}

SendCommandResult _$SendCommandResultFromJson(Map<String, dynamic> json) {
  return SendCommandResult(
    command: json['Command'] == null
        ? null
        : Command.fromJson(json['Command'] as Map<String, dynamic>),
  );
}

ServiceSetting _$ServiceSettingFromJson(Map<String, dynamic> json) {
  return ServiceSetting(
    arn: json['ARN'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    lastModifiedUser: json['LastModifiedUser'] as String,
    settingId: json['SettingId'] as String,
    settingValue: json['SettingValue'] as String,
    status: json['Status'] as String,
  );
}

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
    details: json['Details'] as String,
    documentName: json['DocumentName'] as String,
    endDate: const UnixDateTimeConverter().fromJson(json['EndDate']),
    outputUrl: json['OutputUrl'] == null
        ? null
        : SessionManagerOutputUrl.fromJson(
            json['OutputUrl'] as Map<String, dynamic>),
    owner: json['Owner'] as String,
    sessionId: json['SessionId'] as String,
    startDate: const UnixDateTimeConverter().fromJson(json['StartDate']),
    status: _$enumDecodeNullable(_$SessionStatusEnumMap, json['Status']),
    target: json['Target'] as String,
  );
}

const _$SessionStatusEnumMap = {
  SessionStatus.connected: 'Connected',
  SessionStatus.connecting: 'Connecting',
  SessionStatus.disconnected: 'Disconnected',
  SessionStatus.terminated: 'Terminated',
  SessionStatus.terminating: 'Terminating',
  SessionStatus.failed: 'Failed',
};

Map<String, dynamic> _$SessionFilterToJson(SessionFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', _$SessionFilterKeyEnumMap[instance.key]);
  writeNotNull('value', instance.value);
  return val;
}

const _$SessionFilterKeyEnumMap = {
  SessionFilterKey.invokedAfter: 'InvokedAfter',
  SessionFilterKey.invokedBefore: 'InvokedBefore',
  SessionFilterKey.target: 'Target',
  SessionFilterKey.owner: 'Owner',
  SessionFilterKey.status: 'Status',
  SessionFilterKey.sessionId: 'SessionId',
};

SessionManagerOutputUrl _$SessionManagerOutputUrlFromJson(
    Map<String, dynamic> json) {
  return SessionManagerOutputUrl(
    cloudWatchOutputUrl: json['CloudWatchOutputUrl'] as String,
    s3OutputUrl: json['S3OutputUrl'] as String,
  );
}

SeveritySummary _$SeveritySummaryFromJson(Map<String, dynamic> json) {
  return SeveritySummary(
    criticalCount: json['CriticalCount'] as int,
    highCount: json['HighCount'] as int,
    informationalCount: json['InformationalCount'] as int,
    lowCount: json['LowCount'] as int,
    mediumCount: json['MediumCount'] as int,
    unspecifiedCount: json['UnspecifiedCount'] as int,
  );
}

StartAssociationsOnceResult _$StartAssociationsOnceResultFromJson(
    Map<String, dynamic> json) {
  return StartAssociationsOnceResult();
}

StartAutomationExecutionResult _$StartAutomationExecutionResultFromJson(
    Map<String, dynamic> json) {
  return StartAutomationExecutionResult(
    automationExecutionId: json['AutomationExecutionId'] as String,
  );
}

StartChangeRequestExecutionResult _$StartChangeRequestExecutionResultFromJson(
    Map<String, dynamic> json) {
  return StartChangeRequestExecutionResult(
    automationExecutionId: json['AutomationExecutionId'] as String,
  );
}

StartSessionResponse _$StartSessionResponseFromJson(Map<String, dynamic> json) {
  return StartSessionResponse(
    sessionId: json['SessionId'] as String,
    streamUrl: json['StreamUrl'] as String,
    tokenValue: json['TokenValue'] as String,
  );
}

StepExecution _$StepExecutionFromJson(Map<String, dynamic> json) {
  return StepExecution(
    action: json['Action'] as String,
    executionEndTime:
        const UnixDateTimeConverter().fromJson(json['ExecutionEndTime']),
    executionStartTime:
        const UnixDateTimeConverter().fromJson(json['ExecutionStartTime']),
    failureDetails: json['FailureDetails'] == null
        ? null
        : FailureDetails.fromJson(
            json['FailureDetails'] as Map<String, dynamic>),
    failureMessage: json['FailureMessage'] as String,
    inputs: (json['Inputs'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    isCritical: json['IsCritical'] as bool,
    isEnd: json['IsEnd'] as bool,
    maxAttempts: json['MaxAttempts'] as int,
    nextStep: json['NextStep'] as String,
    onFailure: json['OnFailure'] as String,
    outputs: (json['Outputs'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    overriddenParameters:
        (json['OverriddenParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    response: json['Response'] as String,
    responseCode: json['ResponseCode'] as String,
    stepExecutionId: json['StepExecutionId'] as String,
    stepName: json['StepName'] as String,
    stepStatus: _$enumDecodeNullable(
        _$AutomationExecutionStatusEnumMap, json['StepStatus']),
    targetLocation: json['TargetLocation'] == null
        ? null
        : TargetLocation.fromJson(
            json['TargetLocation'] as Map<String, dynamic>),
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timeoutSeconds: json['TimeoutSeconds'] as int,
    validNextSteps:
        (json['ValidNextSteps'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$StepExecutionFilterToJson(StepExecutionFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$StepExecutionFilterKeyEnumMap[instance.key]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$StepExecutionFilterKeyEnumMap = {
  StepExecutionFilterKey.startTimeBefore: 'StartTimeBefore',
  StepExecutionFilterKey.startTimeAfter: 'StartTimeAfter',
  StepExecutionFilterKey.stepExecutionStatus: 'StepExecutionStatus',
  StepExecutionFilterKey.stepExecutionId: 'StepExecutionId',
  StepExecutionFilterKey.stepName: 'StepName',
  StepExecutionFilterKey.action: 'Action',
};

StopAutomationExecutionResult _$StopAutomationExecutionResultFromJson(
    Map<String, dynamic> json) {
  return StopAutomationExecutionResult();
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

Target _$TargetFromJson(Map<String, dynamic> json) {
  return Target(
    key: json['Key'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TargetToJson(Target instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

TargetLocation _$TargetLocationFromJson(Map<String, dynamic> json) {
  return TargetLocation(
    accounts: (json['Accounts'] as List)?.map((e) => e as String)?.toList(),
    executionRoleName: json['ExecutionRoleName'] as String,
    regions: (json['Regions'] as List)?.map((e) => e as String)?.toList(),
    targetLocationMaxConcurrency:
        json['TargetLocationMaxConcurrency'] as String,
    targetLocationMaxErrors: json['TargetLocationMaxErrors'] as String,
  );
}

Map<String, dynamic> _$TargetLocationToJson(TargetLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Accounts', instance.accounts);
  writeNotNull('ExecutionRoleName', instance.executionRoleName);
  writeNotNull('Regions', instance.regions);
  writeNotNull(
      'TargetLocationMaxConcurrency', instance.targetLocationMaxConcurrency);
  writeNotNull('TargetLocationMaxErrors', instance.targetLocationMaxErrors);
  return val;
}

TerminateSessionResponse _$TerminateSessionResponseFromJson(
    Map<String, dynamic> json) {
  return TerminateSessionResponse(
    sessionId: json['SessionId'] as String,
  );
}

UpdateAssociationResult _$UpdateAssociationResultFromJson(
    Map<String, dynamic> json) {
  return UpdateAssociationResult(
    associationDescription: json['AssociationDescription'] == null
        ? null
        : AssociationDescription.fromJson(
            json['AssociationDescription'] as Map<String, dynamic>),
  );
}

UpdateAssociationStatusResult _$UpdateAssociationStatusResultFromJson(
    Map<String, dynamic> json) {
  return UpdateAssociationStatusResult(
    associationDescription: json['AssociationDescription'] == null
        ? null
        : AssociationDescription.fromJson(
            json['AssociationDescription'] as Map<String, dynamic>),
  );
}

UpdateDocumentDefaultVersionResult _$UpdateDocumentDefaultVersionResultFromJson(
    Map<String, dynamic> json) {
  return UpdateDocumentDefaultVersionResult(
    description: json['Description'] == null
        ? null
        : DocumentDefaultVersionDescription.fromJson(
            json['Description'] as Map<String, dynamic>),
  );
}

UpdateDocumentMetadataResponse _$UpdateDocumentMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDocumentMetadataResponse();
}

UpdateDocumentResult _$UpdateDocumentResultFromJson(Map<String, dynamic> json) {
  return UpdateDocumentResult(
    documentDescription: json['DocumentDescription'] == null
        ? null
        : DocumentDescription.fromJson(
            json['DocumentDescription'] as Map<String, dynamic>),
  );
}

UpdateMaintenanceWindowResult _$UpdateMaintenanceWindowResultFromJson(
    Map<String, dynamic> json) {
  return UpdateMaintenanceWindowResult(
    allowUnassociatedTargets: json['AllowUnassociatedTargets'] as bool,
    cutoff: json['Cutoff'] as int,
    description: json['Description'] as String,
    duration: json['Duration'] as int,
    enabled: json['Enabled'] as bool,
    endDate: json['EndDate'] as String,
    name: json['Name'] as String,
    schedule: json['Schedule'] as String,
    scheduleOffset: json['ScheduleOffset'] as int,
    scheduleTimezone: json['ScheduleTimezone'] as String,
    startDate: json['StartDate'] as String,
    windowId: json['WindowId'] as String,
  );
}

UpdateMaintenanceWindowTargetResult
    _$UpdateMaintenanceWindowTargetResultFromJson(Map<String, dynamic> json) {
  return UpdateMaintenanceWindowTargetResult(
    description: json['Description'] as String,
    name: json['Name'] as String,
    ownerInformation: json['OwnerInformation'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    windowId: json['WindowId'] as String,
    windowTargetId: json['WindowTargetId'] as String,
  );
}

UpdateMaintenanceWindowTaskResult _$UpdateMaintenanceWindowTaskResultFromJson(
    Map<String, dynamic> json) {
  return UpdateMaintenanceWindowTaskResult(
    description: json['Description'] as String,
    loggingInfo: json['LoggingInfo'] == null
        ? null
        : LoggingInfo.fromJson(json['LoggingInfo'] as Map<String, dynamic>),
    maxConcurrency: json['MaxConcurrency'] as String,
    maxErrors: json['MaxErrors'] as String,
    name: json['Name'] as String,
    priority: json['Priority'] as int,
    serviceRoleArn: json['ServiceRoleArn'] as String,
    targets: (json['Targets'] as List)
        ?.map((e) =>
            e == null ? null : Target.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taskArn: json['TaskArn'] as String,
    taskInvocationParameters: json['TaskInvocationParameters'] == null
        ? null
        : MaintenanceWindowTaskInvocationParameters.fromJson(
            json['TaskInvocationParameters'] as Map<String, dynamic>),
    taskParameters: (json['TaskParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : MaintenanceWindowTaskParameterValueExpression.fromJson(
                  e as Map<String, dynamic>)),
    ),
    windowId: json['WindowId'] as String,
    windowTaskId: json['WindowTaskId'] as String,
  );
}

UpdateManagedInstanceRoleResult _$UpdateManagedInstanceRoleResultFromJson(
    Map<String, dynamic> json) {
  return UpdateManagedInstanceRoleResult();
}

UpdateOpsItemResponse _$UpdateOpsItemResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateOpsItemResponse();
}

UpdateOpsMetadataResult _$UpdateOpsMetadataResultFromJson(
    Map<String, dynamic> json) {
  return UpdateOpsMetadataResult(
    opsMetadataArn: json['OpsMetadataArn'] as String,
  );
}

UpdatePatchBaselineResult _$UpdatePatchBaselineResultFromJson(
    Map<String, dynamic> json) {
  return UpdatePatchBaselineResult(
    approvalRules: json['ApprovalRules'] == null
        ? null
        : PatchRuleGroup.fromJson(
            json['ApprovalRules'] as Map<String, dynamic>),
    approvedPatches:
        (json['ApprovedPatches'] as List)?.map((e) => e as String)?.toList(),
    approvedPatchesComplianceLevel: _$enumDecodeNullable(
        _$PatchComplianceLevelEnumMap, json['ApprovedPatchesComplianceLevel']),
    approvedPatchesEnableNonSecurity:
        json['ApprovedPatchesEnableNonSecurity'] as bool,
    baselineId: json['BaselineId'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    description: json['Description'] as String,
    globalFilters: json['GlobalFilters'] == null
        ? null
        : PatchFilterGroup.fromJson(
            json['GlobalFilters'] as Map<String, dynamic>),
    modifiedDate: const UnixDateTimeConverter().fromJson(json['ModifiedDate']),
    name: json['Name'] as String,
    operatingSystem:
        _$enumDecodeNullable(_$OperatingSystemEnumMap, json['OperatingSystem']),
    rejectedPatches:
        (json['RejectedPatches'] as List)?.map((e) => e as String)?.toList(),
    rejectedPatchesAction: _$enumDecodeNullable(
        _$PatchActionEnumMap, json['RejectedPatchesAction']),
    sources: (json['Sources'] as List)
        ?.map((e) =>
            e == null ? null : PatchSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateResourceDataSyncResult _$UpdateResourceDataSyncResultFromJson(
    Map<String, dynamic> json) {
  return UpdateResourceDataSyncResult();
}

UpdateServiceSettingResult _$UpdateServiceSettingResultFromJson(
    Map<String, dynamic> json) {
  return UpdateServiceSettingResult();
}
