// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup-2018-11-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackupJob _$BackupJobFromJson(Map<String, dynamic> json) {
  return BackupJob(
    backupJobId: json['BackupJobId'] as String,
    backupSizeInBytes: json['BackupSizeInBytes'] as int,
    backupVaultArn: json['BackupVaultArn'] as String,
    backupVaultName: json['BackupVaultName'] as String,
    bytesTransferred: json['BytesTransferred'] as int,
    completionDate: unixTimestampFromJson(json['CompletionDate']),
    createdBy: json['CreatedBy'] == null
        ? null
        : RecoveryPointCreator.fromJson(
            json['CreatedBy'] as Map<String, dynamic>),
    creationDate: unixTimestampFromJson(json['CreationDate']),
    expectedCompletionDate:
        unixTimestampFromJson(json['ExpectedCompletionDate']),
    iamRoleArn: json['IamRoleArn'] as String,
    percentDone: json['PercentDone'] as String,
    recoveryPointArn: json['RecoveryPointArn'] as String,
    resourceArn: json['ResourceArn'] as String,
    resourceType: json['ResourceType'] as String,
    startBy: unixTimestampFromJson(json['StartBy']),
    state: _$enumDecodeNullable(_$BackupJobStateEnumMap, json['State']),
    statusMessage: json['StatusMessage'] as String,
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

const _$BackupJobStateEnumMap = {
  BackupJobState.created: 'CREATED',
  BackupJobState.pending: 'PENDING',
  BackupJobState.running: 'RUNNING',
  BackupJobState.aborting: 'ABORTING',
  BackupJobState.aborted: 'ABORTED',
  BackupJobState.completed: 'COMPLETED',
  BackupJobState.failed: 'FAILED',
  BackupJobState.expired: 'EXPIRED',
};

BackupPlan _$BackupPlanFromJson(Map<String, dynamic> json) {
  return BackupPlan(
    backupPlanName: json['BackupPlanName'] as String,
    rules: (json['Rules'] as List)
        ?.map((e) =>
            e == null ? null : BackupRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BackupPlanInputToJson(BackupPlanInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupPlanName', instance.backupPlanName);
  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  return val;
}

BackupPlanTemplatesListMember _$BackupPlanTemplatesListMemberFromJson(
    Map<String, dynamic> json) {
  return BackupPlanTemplatesListMember(
    backupPlanTemplateId: json['BackupPlanTemplateId'] as String,
    backupPlanTemplateName: json['BackupPlanTemplateName'] as String,
  );
}

BackupPlansListMember _$BackupPlansListMemberFromJson(
    Map<String, dynamic> json) {
  return BackupPlansListMember(
    backupPlanArn: json['BackupPlanArn'] as String,
    backupPlanId: json['BackupPlanId'] as String,
    backupPlanName: json['BackupPlanName'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    creatorRequestId: json['CreatorRequestId'] as String,
    deletionDate: unixTimestampFromJson(json['DeletionDate']),
    lastExecutionDate: unixTimestampFromJson(json['LastExecutionDate']),
    versionId: json['VersionId'] as String,
  );
}

BackupRule _$BackupRuleFromJson(Map<String, dynamic> json) {
  return BackupRule(
    ruleName: json['RuleName'] as String,
    targetBackupVaultName: json['TargetBackupVaultName'] as String,
    completionWindowMinutes: json['CompletionWindowMinutes'] as int,
    copyActions: (json['CopyActions'] as List)
        ?.map((e) =>
            e == null ? null : CopyAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lifecycle: json['Lifecycle'] == null
        ? null
        : Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>),
    recoveryPointTags: (json['RecoveryPointTags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    ruleId: json['RuleId'] as String,
    scheduleExpression: json['ScheduleExpression'] as String,
    startWindowMinutes: json['StartWindowMinutes'] as int,
  );
}

Map<String, dynamic> _$BackupRuleInputToJson(BackupRuleInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RuleName', instance.ruleName);
  writeNotNull('TargetBackupVaultName', instance.targetBackupVaultName);
  writeNotNull('CompletionWindowMinutes', instance.completionWindowMinutes);
  writeNotNull(
      'CopyActions', instance.copyActions?.map((e) => e?.toJson())?.toList());
  writeNotNull('Lifecycle', instance.lifecycle?.toJson());
  writeNotNull('RecoveryPointTags', instance.recoveryPointTags);
  writeNotNull('ScheduleExpression', instance.scheduleExpression);
  writeNotNull('StartWindowMinutes', instance.startWindowMinutes);
  return val;
}

BackupSelection _$BackupSelectionFromJson(Map<String, dynamic> json) {
  return BackupSelection(
    iamRoleArn: json['IamRoleArn'] as String,
    selectionName: json['SelectionName'] as String,
    listOfTags: (json['ListOfTags'] as List)
        ?.map((e) =>
            e == null ? null : Condition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resources: (json['Resources'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$BackupSelectionToJson(BackupSelection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('SelectionName', instance.selectionName);
  writeNotNull(
      'ListOfTags', instance.listOfTags?.map((e) => e?.toJson())?.toList());
  writeNotNull('Resources', instance.resources);
  return val;
}

BackupSelectionsListMember _$BackupSelectionsListMemberFromJson(
    Map<String, dynamic> json) {
  return BackupSelectionsListMember(
    backupPlanId: json['BackupPlanId'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    creatorRequestId: json['CreatorRequestId'] as String,
    iamRoleArn: json['IamRoleArn'] as String,
    selectionId: json['SelectionId'] as String,
    selectionName: json['SelectionName'] as String,
  );
}

BackupVaultListMember _$BackupVaultListMemberFromJson(
    Map<String, dynamic> json) {
  return BackupVaultListMember(
    backupVaultArn: json['BackupVaultArn'] as String,
    backupVaultName: json['BackupVaultName'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    creatorRequestId: json['CreatorRequestId'] as String,
    encryptionKeyArn: json['EncryptionKeyArn'] as String,
    numberOfRecoveryPoints: json['NumberOfRecoveryPoints'] as int,
  );
}

CalculatedLifecycle _$CalculatedLifecycleFromJson(Map<String, dynamic> json) {
  return CalculatedLifecycle(
    deleteAt: unixTimestampFromJson(json['DeleteAt']),
    moveToColdStorageAt: unixTimestampFromJson(json['MoveToColdStorageAt']),
  );
}

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(
    conditionKey: json['ConditionKey'] as String,
    conditionType:
        _$enumDecodeNullable(_$ConditionTypeEnumMap, json['ConditionType']),
    conditionValue: json['ConditionValue'] as String,
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConditionKey', instance.conditionKey);
  writeNotNull('ConditionType', _$ConditionTypeEnumMap[instance.conditionType]);
  writeNotNull('ConditionValue', instance.conditionValue);
  return val;
}

const _$ConditionTypeEnumMap = {
  ConditionType.stringequals: 'STRINGEQUALS',
};

CopyAction _$CopyActionFromJson(Map<String, dynamic> json) {
  return CopyAction(
    destinationBackupVaultArn: json['DestinationBackupVaultArn'] as String,
    lifecycle: json['Lifecycle'] == null
        ? null
        : Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CopyActionToJson(CopyAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationBackupVaultArn', instance.destinationBackupVaultArn);
  writeNotNull('Lifecycle', instance.lifecycle?.toJson());
  return val;
}

CopyJob _$CopyJobFromJson(Map<String, dynamic> json) {
  return CopyJob(
    backupSizeInBytes: json['BackupSizeInBytes'] as int,
    completionDate: unixTimestampFromJson(json['CompletionDate']),
    copyJobId: json['CopyJobId'] as String,
    createdBy: json['CreatedBy'] == null
        ? null
        : RecoveryPointCreator.fromJson(
            json['CreatedBy'] as Map<String, dynamic>),
    creationDate: unixTimestampFromJson(json['CreationDate']),
    destinationBackupVaultArn: json['DestinationBackupVaultArn'] as String,
    destinationRecoveryPointArn: json['DestinationRecoveryPointArn'] as String,
    iamRoleArn: json['IamRoleArn'] as String,
    resourceArn: json['ResourceArn'] as String,
    resourceType: json['ResourceType'] as String,
    sourceBackupVaultArn: json['SourceBackupVaultArn'] as String,
    sourceRecoveryPointArn: json['SourceRecoveryPointArn'] as String,
    state: _$enumDecodeNullable(_$CopyJobStateEnumMap, json['State']),
    statusMessage: json['StatusMessage'] as String,
  );
}

const _$CopyJobStateEnumMap = {
  CopyJobState.created: 'CREATED',
  CopyJobState.running: 'RUNNING',
  CopyJobState.completed: 'COMPLETED',
  CopyJobState.failed: 'FAILED',
};

Map<String, dynamic> _$CreateBackupPlanInputToJson(
    CreateBackupPlanInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupPlan', instance.backupPlan?.toJson());
  writeNotNull('BackupPlanTags', instance.backupPlanTags);
  writeNotNull('CreatorRequestId', instance.creatorRequestId);
  return val;
}

CreateBackupPlanOutput _$CreateBackupPlanOutputFromJson(
    Map<String, dynamic> json) {
  return CreateBackupPlanOutput(
    backupPlanArn: json['BackupPlanArn'] as String,
    backupPlanId: json['BackupPlanId'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$CreateBackupSelectionInputToJson(
    CreateBackupSelectionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupSelection', instance.backupSelection?.toJson());
  writeNotNull('CreatorRequestId', instance.creatorRequestId);
  return val;
}

CreateBackupSelectionOutput _$CreateBackupSelectionOutputFromJson(
    Map<String, dynamic> json) {
  return CreateBackupSelectionOutput(
    backupPlanId: json['BackupPlanId'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    selectionId: json['SelectionId'] as String,
  );
}

Map<String, dynamic> _$CreateBackupVaultInputToJson(
    CreateBackupVaultInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupVaultTags', instance.backupVaultTags);
  writeNotNull('CreatorRequestId', instance.creatorRequestId);
  writeNotNull('EncryptionKeyArn', instance.encryptionKeyArn);
  return val;
}

CreateBackupVaultOutput _$CreateBackupVaultOutputFromJson(
    Map<String, dynamic> json) {
  return CreateBackupVaultOutput(
    backupVaultArn: json['BackupVaultArn'] as String,
    backupVaultName: json['BackupVaultName'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
  );
}

Map<String, dynamic> _$DeleteBackupPlanInputToJson(
        DeleteBackupPlanInput instance) =>
    <String, dynamic>{};

DeleteBackupPlanOutput _$DeleteBackupPlanOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteBackupPlanOutput(
    backupPlanArn: json['BackupPlanArn'] as String,
    backupPlanId: json['BackupPlanId'] as String,
    deletionDate: unixTimestampFromJson(json['DeletionDate']),
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$DeleteBackupSelectionInputToJson(
        DeleteBackupSelectionInput instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteBackupVaultAccessPolicyInputToJson(
        DeleteBackupVaultAccessPolicyInput instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteBackupVaultInputToJson(
        DeleteBackupVaultInput instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteBackupVaultNotificationsInputToJson(
        DeleteBackupVaultNotificationsInput instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteRecoveryPointInputToJson(
        DeleteRecoveryPointInput instance) =>
    <String, dynamic>{};

DescribeBackupJobOutput _$DescribeBackupJobOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeBackupJobOutput(
    backupJobId: json['BackupJobId'] as String,
    backupSizeInBytes: json['BackupSizeInBytes'] as int,
    backupVaultArn: json['BackupVaultArn'] as String,
    backupVaultName: json['BackupVaultName'] as String,
    bytesTransferred: json['BytesTransferred'] as int,
    completionDate: unixTimestampFromJson(json['CompletionDate']),
    createdBy: json['CreatedBy'] == null
        ? null
        : RecoveryPointCreator.fromJson(
            json['CreatedBy'] as Map<String, dynamic>),
    creationDate: unixTimestampFromJson(json['CreationDate']),
    expectedCompletionDate:
        unixTimestampFromJson(json['ExpectedCompletionDate']),
    iamRoleArn: json['IamRoleArn'] as String,
    percentDone: json['PercentDone'] as String,
    recoveryPointArn: json['RecoveryPointArn'] as String,
    resourceArn: json['ResourceArn'] as String,
    resourceType: json['ResourceType'] as String,
    startBy: unixTimestampFromJson(json['StartBy']),
    state: _$enumDecodeNullable(_$BackupJobStateEnumMap, json['State']),
    statusMessage: json['StatusMessage'] as String,
  );
}

DescribeBackupVaultOutput _$DescribeBackupVaultOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeBackupVaultOutput(
    backupVaultArn: json['BackupVaultArn'] as String,
    backupVaultName: json['BackupVaultName'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    creatorRequestId: json['CreatorRequestId'] as String,
    encryptionKeyArn: json['EncryptionKeyArn'] as String,
    numberOfRecoveryPoints: json['NumberOfRecoveryPoints'] as int,
  );
}

DescribeCopyJobOutput _$DescribeCopyJobOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeCopyJobOutput(
    copyJob: json['CopyJob'] == null
        ? null
        : CopyJob.fromJson(json['CopyJob'] as Map<String, dynamic>),
  );
}

DescribeProtectedResourceOutput _$DescribeProtectedResourceOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeProtectedResourceOutput(
    lastBackupTime: unixTimestampFromJson(json['LastBackupTime']),
    resourceArn: json['ResourceArn'] as String,
    resourceType: json['ResourceType'] as String,
  );
}

DescribeRecoveryPointOutput _$DescribeRecoveryPointOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeRecoveryPointOutput(
    backupSizeInBytes: json['BackupSizeInBytes'] as int,
    backupVaultArn: json['BackupVaultArn'] as String,
    backupVaultName: json['BackupVaultName'] as String,
    calculatedLifecycle: json['CalculatedLifecycle'] == null
        ? null
        : CalculatedLifecycle.fromJson(
            json['CalculatedLifecycle'] as Map<String, dynamic>),
    completionDate: unixTimestampFromJson(json['CompletionDate']),
    createdBy: json['CreatedBy'] == null
        ? null
        : RecoveryPointCreator.fromJson(
            json['CreatedBy'] as Map<String, dynamic>),
    creationDate: unixTimestampFromJson(json['CreationDate']),
    encryptionKeyArn: json['EncryptionKeyArn'] as String,
    iamRoleArn: json['IamRoleArn'] as String,
    isEncrypted: json['IsEncrypted'] as bool,
    lastRestoreTime: unixTimestampFromJson(json['LastRestoreTime']),
    lifecycle: json['Lifecycle'] == null
        ? null
        : Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>),
    recoveryPointArn: json['RecoveryPointArn'] as String,
    resourceArn: json['ResourceArn'] as String,
    resourceType: json['ResourceType'] as String,
    status: _$enumDecodeNullable(_$RecoveryPointStatusEnumMap, json['Status']),
    storageClass:
        _$enumDecodeNullable(_$StorageClassEnumMap, json['StorageClass']),
  );
}

const _$RecoveryPointStatusEnumMap = {
  RecoveryPointStatus.completed: 'COMPLETED',
  RecoveryPointStatus.partial: 'PARTIAL',
  RecoveryPointStatus.deleting: 'DELETING',
  RecoveryPointStatus.expired: 'EXPIRED',
};

const _$StorageClassEnumMap = {
  StorageClass.warm: 'WARM',
  StorageClass.cold: 'COLD',
  StorageClass.deleted: 'DELETED',
};

DescribeRestoreJobOutput _$DescribeRestoreJobOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeRestoreJobOutput(
    backupSizeInBytes: json['BackupSizeInBytes'] as int,
    completionDate: unixTimestampFromJson(json['CompletionDate']),
    createdResourceArn: json['CreatedResourceArn'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    expectedCompletionTimeMinutes: json['ExpectedCompletionTimeMinutes'] as int,
    iamRoleArn: json['IamRoleArn'] as String,
    percentDone: json['PercentDone'] as String,
    recoveryPointArn: json['RecoveryPointArn'] as String,
    restoreJobId: json['RestoreJobId'] as String,
    status: _$enumDecodeNullable(_$RestoreJobStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
  );
}

const _$RestoreJobStatusEnumMap = {
  RestoreJobStatus.pending: 'PENDING',
  RestoreJobStatus.running: 'RUNNING',
  RestoreJobStatus.completed: 'COMPLETED',
  RestoreJobStatus.aborted: 'ABORTED',
  RestoreJobStatus.failed: 'FAILED',
};

ExportBackupPlanTemplateOutput _$ExportBackupPlanTemplateOutputFromJson(
    Map<String, dynamic> json) {
  return ExportBackupPlanTemplateOutput(
    backupPlanTemplateJson: json['BackupPlanTemplateJson'] as String,
  );
}

Map<String, dynamic> _$GetBackupPlanFromJSONInputToJson(
    GetBackupPlanFromJSONInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupPlanTemplateJson', instance.backupPlanTemplateJson);
  return val;
}

GetBackupPlanFromJSONOutput _$GetBackupPlanFromJSONOutputFromJson(
    Map<String, dynamic> json) {
  return GetBackupPlanFromJSONOutput(
    backupPlan: json['BackupPlan'] == null
        ? null
        : BackupPlan.fromJson(json['BackupPlan'] as Map<String, dynamic>),
  );
}

GetBackupPlanFromTemplateOutput _$GetBackupPlanFromTemplateOutputFromJson(
    Map<String, dynamic> json) {
  return GetBackupPlanFromTemplateOutput(
    backupPlanDocument: json['BackupPlanDocument'] == null
        ? null
        : BackupPlan.fromJson(
            json['BackupPlanDocument'] as Map<String, dynamic>),
  );
}

GetBackupPlanOutput _$GetBackupPlanOutputFromJson(Map<String, dynamic> json) {
  return GetBackupPlanOutput(
    backupPlan: json['BackupPlan'] == null
        ? null
        : BackupPlan.fromJson(json['BackupPlan'] as Map<String, dynamic>),
    backupPlanArn: json['BackupPlanArn'] as String,
    backupPlanId: json['BackupPlanId'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    creatorRequestId: json['CreatorRequestId'] as String,
    deletionDate: unixTimestampFromJson(json['DeletionDate']),
    lastExecutionDate: unixTimestampFromJson(json['LastExecutionDate']),
    versionId: json['VersionId'] as String,
  );
}

GetBackupSelectionOutput _$GetBackupSelectionOutputFromJson(
    Map<String, dynamic> json) {
  return GetBackupSelectionOutput(
    backupPlanId: json['BackupPlanId'] as String,
    backupSelection: json['BackupSelection'] == null
        ? null
        : BackupSelection.fromJson(
            json['BackupSelection'] as Map<String, dynamic>),
    creationDate: unixTimestampFromJson(json['CreationDate']),
    creatorRequestId: json['CreatorRequestId'] as String,
    selectionId: json['SelectionId'] as String,
  );
}

GetBackupVaultAccessPolicyOutput _$GetBackupVaultAccessPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetBackupVaultAccessPolicyOutput(
    backupVaultArn: json['BackupVaultArn'] as String,
    backupVaultName: json['BackupVaultName'] as String,
    policy: json['Policy'] as String,
  );
}

GetBackupVaultNotificationsOutput _$GetBackupVaultNotificationsOutputFromJson(
    Map<String, dynamic> json) {
  return GetBackupVaultNotificationsOutput(
    backupVaultArn: json['BackupVaultArn'] as String,
    backupVaultEvents:
        (json['BackupVaultEvents'] as List)?.map((e) => e as String)?.toList(),
    backupVaultName: json['BackupVaultName'] as String,
    sNSTopicArn: json['SNSTopicArn'] as String,
  );
}

GetRecoveryPointRestoreMetadataOutput
    _$GetRecoveryPointRestoreMetadataOutputFromJson(Map<String, dynamic> json) {
  return GetRecoveryPointRestoreMetadataOutput(
    backupVaultArn: json['BackupVaultArn'] as String,
    recoveryPointArn: json['RecoveryPointArn'] as String,
    restoreMetadata: (json['RestoreMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetSupportedResourceTypesOutput _$GetSupportedResourceTypesOutputFromJson(
    Map<String, dynamic> json) {
  return GetSupportedResourceTypesOutput(
    resourceTypes:
        (json['ResourceTypes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Lifecycle _$LifecycleFromJson(Map<String, dynamic> json) {
  return Lifecycle(
    deleteAfterDays: json['DeleteAfterDays'] as int,
    moveToColdStorageAfterDays: json['MoveToColdStorageAfterDays'] as int,
  );
}

Map<String, dynamic> _$LifecycleToJson(Lifecycle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeleteAfterDays', instance.deleteAfterDays);
  writeNotNull(
      'MoveToColdStorageAfterDays', instance.moveToColdStorageAfterDays);
  return val;
}

ListBackupJobsOutput _$ListBackupJobsOutputFromJson(Map<String, dynamic> json) {
  return ListBackupJobsOutput(
    backupJobs: (json['BackupJobs'] as List)
        ?.map((e) =>
            e == null ? null : BackupJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListBackupPlanTemplatesOutput _$ListBackupPlanTemplatesOutputFromJson(
    Map<String, dynamic> json) {
  return ListBackupPlanTemplatesOutput(
    backupPlanTemplatesList: (json['BackupPlanTemplatesList'] as List)
        ?.map((e) => e == null
            ? null
            : BackupPlanTemplatesListMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListBackupPlanVersionsOutput _$ListBackupPlanVersionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListBackupPlanVersionsOutput(
    backupPlanVersionsList: (json['BackupPlanVersionsList'] as List)
        ?.map((e) => e == null
            ? null
            : BackupPlansListMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListBackupPlansOutput _$ListBackupPlansOutputFromJson(
    Map<String, dynamic> json) {
  return ListBackupPlansOutput(
    backupPlansList: (json['BackupPlansList'] as List)
        ?.map((e) => e == null
            ? null
            : BackupPlansListMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListBackupSelectionsOutput _$ListBackupSelectionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListBackupSelectionsOutput(
    backupSelectionsList: (json['BackupSelectionsList'] as List)
        ?.map((e) => e == null
            ? null
            : BackupSelectionsListMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListBackupVaultsOutput _$ListBackupVaultsOutputFromJson(
    Map<String, dynamic> json) {
  return ListBackupVaultsOutput(
    backupVaultList: (json['BackupVaultList'] as List)
        ?.map((e) => e == null
            ? null
            : BackupVaultListMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListCopyJobsOutput _$ListCopyJobsOutputFromJson(Map<String, dynamic> json) {
  return ListCopyJobsOutput(
    copyJobs: (json['CopyJobs'] as List)
        ?.map((e) =>
            e == null ? null : CopyJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListProtectedResourcesOutput _$ListProtectedResourcesOutputFromJson(
    Map<String, dynamic> json) {
  return ListProtectedResourcesOutput(
    nextToken: json['NextToken'] as String,
    results: (json['Results'] as List)
        ?.map((e) => e == null
            ? null
            : ProtectedResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRecoveryPointsByBackupVaultOutput
    _$ListRecoveryPointsByBackupVaultOutputFromJson(Map<String, dynamic> json) {
  return ListRecoveryPointsByBackupVaultOutput(
    nextToken: json['NextToken'] as String,
    recoveryPoints: (json['RecoveryPoints'] as List)
        ?.map((e) => e == null
            ? null
            : RecoveryPointByBackupVault.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRecoveryPointsByResourceOutput _$ListRecoveryPointsByResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListRecoveryPointsByResourceOutput(
    nextToken: json['NextToken'] as String,
    recoveryPoints: (json['RecoveryPoints'] as List)
        ?.map((e) => e == null
            ? null
            : RecoveryPointByResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRestoreJobsOutput _$ListRestoreJobsOutputFromJson(
    Map<String, dynamic> json) {
  return ListRestoreJobsOutput(
    nextToken: json['NextToken'] as String,
    restoreJobs: (json['RestoreJobs'] as List)
        ?.map((e) => e == null
            ? null
            : RestoreJobsListMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsOutput _$ListTagsOutputFromJson(Map<String, dynamic> json) {
  return ListTagsOutput(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ProtectedResource _$ProtectedResourceFromJson(Map<String, dynamic> json) {
  return ProtectedResource(
    lastBackupTime: unixTimestampFromJson(json['LastBackupTime']),
    resourceArn: json['ResourceArn'] as String,
    resourceType: json['ResourceType'] as String,
  );
}

Map<String, dynamic> _$PutBackupVaultAccessPolicyInputToJson(
    PutBackupVaultAccessPolicyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Policy', instance.policy);
  return val;
}

Map<String, dynamic> _$PutBackupVaultNotificationsInputToJson(
    PutBackupVaultNotificationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupVaultEvents', instance.backupVaultEvents);
  writeNotNull('SNSTopicArn', instance.sNSTopicArn);
  return val;
}

RecoveryPointByBackupVault _$RecoveryPointByBackupVaultFromJson(
    Map<String, dynamic> json) {
  return RecoveryPointByBackupVault(
    backupSizeInBytes: json['BackupSizeInBytes'] as int,
    backupVaultArn: json['BackupVaultArn'] as String,
    backupVaultName: json['BackupVaultName'] as String,
    calculatedLifecycle: json['CalculatedLifecycle'] == null
        ? null
        : CalculatedLifecycle.fromJson(
            json['CalculatedLifecycle'] as Map<String, dynamic>),
    completionDate: unixTimestampFromJson(json['CompletionDate']),
    createdBy: json['CreatedBy'] == null
        ? null
        : RecoveryPointCreator.fromJson(
            json['CreatedBy'] as Map<String, dynamic>),
    creationDate: unixTimestampFromJson(json['CreationDate']),
    encryptionKeyArn: json['EncryptionKeyArn'] as String,
    iamRoleArn: json['IamRoleArn'] as String,
    isEncrypted: json['IsEncrypted'] as bool,
    lastRestoreTime: unixTimestampFromJson(json['LastRestoreTime']),
    lifecycle: json['Lifecycle'] == null
        ? null
        : Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>),
    recoveryPointArn: json['RecoveryPointArn'] as String,
    resourceArn: json['ResourceArn'] as String,
    resourceType: json['ResourceType'] as String,
    status: _$enumDecodeNullable(_$RecoveryPointStatusEnumMap, json['Status']),
  );
}

RecoveryPointByResource _$RecoveryPointByResourceFromJson(
    Map<String, dynamic> json) {
  return RecoveryPointByResource(
    backupSizeBytes: json['BackupSizeBytes'] as int,
    backupVaultName: json['BackupVaultName'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    encryptionKeyArn: json['EncryptionKeyArn'] as String,
    recoveryPointArn: json['RecoveryPointArn'] as String,
    status: _$enumDecodeNullable(_$RecoveryPointStatusEnumMap, json['Status']),
  );
}

RecoveryPointCreator _$RecoveryPointCreatorFromJson(Map<String, dynamic> json) {
  return RecoveryPointCreator(
    backupPlanArn: json['BackupPlanArn'] as String,
    backupPlanId: json['BackupPlanId'] as String,
    backupPlanVersion: json['BackupPlanVersion'] as String,
    backupRuleId: json['BackupRuleId'] as String,
  );
}

RestoreJobsListMember _$RestoreJobsListMemberFromJson(
    Map<String, dynamic> json) {
  return RestoreJobsListMember(
    backupSizeInBytes: json['BackupSizeInBytes'] as int,
    completionDate: unixTimestampFromJson(json['CompletionDate']),
    createdResourceArn: json['CreatedResourceArn'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    expectedCompletionTimeMinutes: json['ExpectedCompletionTimeMinutes'] as int,
    iamRoleArn: json['IamRoleArn'] as String,
    percentDone: json['PercentDone'] as String,
    recoveryPointArn: json['RecoveryPointArn'] as String,
    restoreJobId: json['RestoreJobId'] as String,
    status: _$enumDecodeNullable(_$RestoreJobStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
  );
}

Map<String, dynamic> _$StartBackupJobInputToJson(StartBackupJobInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupVaultName', instance.backupVaultName);
  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('CompleteWindowMinutes', instance.completeWindowMinutes);
  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('Lifecycle', instance.lifecycle?.toJson());
  writeNotNull('RecoveryPointTags', instance.recoveryPointTags);
  writeNotNull('StartWindowMinutes', instance.startWindowMinutes);
  return val;
}

StartBackupJobOutput _$StartBackupJobOutputFromJson(Map<String, dynamic> json) {
  return StartBackupJobOutput(
    backupJobId: json['BackupJobId'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    recoveryPointArn: json['RecoveryPointArn'] as String,
  );
}

Map<String, dynamic> _$StartCopyJobInputToJson(StartCopyJobInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationBackupVaultArn', instance.destinationBackupVaultArn);
  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('RecoveryPointArn', instance.recoveryPointArn);
  writeNotNull('SourceBackupVaultName', instance.sourceBackupVaultName);
  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('Lifecycle', instance.lifecycle?.toJson());
  return val;
}

StartCopyJobOutput _$StartCopyJobOutputFromJson(Map<String, dynamic> json) {
  return StartCopyJobOutput(
    copyJobId: json['CopyJobId'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
  );
}

Map<String, dynamic> _$StartRestoreJobInputToJson(
    StartRestoreJobInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('Metadata', instance.metadata);
  writeNotNull('RecoveryPointArn', instance.recoveryPointArn);
  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('ResourceType', instance.resourceType);
  return val;
}

StartRestoreJobOutput _$StartRestoreJobOutputFromJson(
    Map<String, dynamic> json) {
  return StartRestoreJobOutput(
    restoreJobId: json['RestoreJobId'] as String,
  );
}

Map<String, dynamic> _$StopBackupJobInputToJson(StopBackupJobInput instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$TagResourceInputToJson(TagResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tags', instance.tags);
  return val;
}

Map<String, dynamic> _$UntagResourceInputToJson(UntagResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TagKeyList', instance.tagKeyList);
  return val;
}

Map<String, dynamic> _$UpdateBackupPlanInputToJson(
    UpdateBackupPlanInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupPlan', instance.backupPlan?.toJson());
  return val;
}

UpdateBackupPlanOutput _$UpdateBackupPlanOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateBackupPlanOutput(
    backupPlanArn: json['BackupPlanArn'] as String,
    backupPlanId: json['BackupPlanId'] as String,
    creationDate: unixTimestampFromJson(json['CreationDate']),
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$UpdateRecoveryPointLifecycleInputToJson(
    UpdateRecoveryPointLifecycleInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Lifecycle', instance.lifecycle?.toJson());
  return val;
}

UpdateRecoveryPointLifecycleOutput _$UpdateRecoveryPointLifecycleOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateRecoveryPointLifecycleOutput(
    backupVaultArn: json['BackupVaultArn'] as String,
    calculatedLifecycle: json['CalculatedLifecycle'] == null
        ? null
        : CalculatedLifecycle.fromJson(
            json['CalculatedLifecycle'] as Map<String, dynamic>),
    lifecycle: json['Lifecycle'] == null
        ? null
        : Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>),
    recoveryPointArn: json['RecoveryPointArn'] as String,
  );
}
