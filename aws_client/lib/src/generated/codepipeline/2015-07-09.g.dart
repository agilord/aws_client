// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-07-09.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AWSSessionCredentials _$AWSSessionCredentialsFromJson(
    Map<String, dynamic> json) {
  return AWSSessionCredentials(
    accessKeyId: json['accessKeyId'] as String,
    secretAccessKey: json['secretAccessKey'] as String,
    sessionToken: json['sessionToken'] as String,
  );
}

AcknowledgeJobOutput _$AcknowledgeJobOutputFromJson(Map<String, dynamic> json) {
  return AcknowledgeJobOutput(
    status: _$enumDecodeNullable(_$JobStatusEnumMap, json['status']),
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

const _$JobStatusEnumMap = {
  JobStatus.created: 'Created',
  JobStatus.queued: 'Queued',
  JobStatus.dispatched: 'Dispatched',
  JobStatus.inProgress: 'InProgress',
  JobStatus.timedOut: 'TimedOut',
  JobStatus.succeeded: 'Succeeded',
  JobStatus.failed: 'Failed',
};

AcknowledgeThirdPartyJobOutput _$AcknowledgeThirdPartyJobOutputFromJson(
    Map<String, dynamic> json) {
  return AcknowledgeThirdPartyJobOutput(
    status: _$enumDecodeNullable(_$JobStatusEnumMap, json['status']),
  );
}

ActionConfiguration _$ActionConfigurationFromJson(Map<String, dynamic> json) {
  return ActionConfiguration(
    configuration: (json['configuration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ActionConfigurationProperty _$ActionConfigurationPropertyFromJson(
    Map<String, dynamic> json) {
  return ActionConfigurationProperty(
    key: json['key'] as bool,
    name: json['name'] as String,
    required: json['required'] as bool,
    secret: json['secret'] as bool,
    description: json['description'] as String,
    queryable: json['queryable'] as bool,
    type: _$enumDecodeNullable(
        _$ActionConfigurationPropertyTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$ActionConfigurationPropertyToJson(
    ActionConfigurationProperty instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('name', instance.name);
  writeNotNull('required', instance.required);
  writeNotNull('secret', instance.secret);
  writeNotNull('description', instance.description);
  writeNotNull('queryable', instance.queryable);
  writeNotNull('type', _$ActionConfigurationPropertyTypeEnumMap[instance.type]);
  return val;
}

const _$ActionConfigurationPropertyTypeEnumMap = {
  ActionConfigurationPropertyType.string: 'String',
  ActionConfigurationPropertyType.number: 'Number',
  ActionConfigurationPropertyType.boolean: 'Boolean',
};

ActionContext _$ActionContextFromJson(Map<String, dynamic> json) {
  return ActionContext(
    actionExecutionId: json['actionExecutionId'] as String,
    name: json['name'] as String,
  );
}

ActionDeclaration _$ActionDeclarationFromJson(Map<String, dynamic> json) {
  return ActionDeclaration(
    actionTypeId: json['actionTypeId'] == null
        ? null
        : ActionTypeId.fromJson(json['actionTypeId'] as Map<String, dynamic>),
    name: json['name'] as String,
    configuration: (json['configuration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    inputArtifacts: (json['inputArtifacts'] as List)
        ?.map((e) => e == null
            ? null
            : InputArtifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    namespace: json['namespace'] as String,
    outputArtifacts: (json['outputArtifacts'] as List)
        ?.map((e) => e == null
            ? null
            : OutputArtifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    region: json['region'] as String,
    roleArn: json['roleArn'] as String,
    runOrder: json['runOrder'] as int,
  );
}

Map<String, dynamic> _$ActionDeclarationToJson(ActionDeclaration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('actionTypeId', instance.actionTypeId?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('configuration', instance.configuration);
  writeNotNull('inputArtifacts',
      instance.inputArtifacts?.map((e) => e?.toJson())?.toList());
  writeNotNull('namespace', instance.namespace);
  writeNotNull('outputArtifacts',
      instance.outputArtifacts?.map((e) => e?.toJson())?.toList());
  writeNotNull('region', instance.region);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('runOrder', instance.runOrder);
  return val;
}

ActionExecution _$ActionExecutionFromJson(Map<String, dynamic> json) {
  return ActionExecution(
    actionExecutionId: json['actionExecutionId'] as String,
    errorDetails: json['errorDetails'] == null
        ? null
        : ErrorDetails.fromJson(json['errorDetails'] as Map<String, dynamic>),
    externalExecutionId: json['externalExecutionId'] as String,
    externalExecutionUrl: json['externalExecutionUrl'] as String,
    lastStatusChange:
        const UnixDateTimeConverter().fromJson(json['lastStatusChange']),
    lastUpdatedBy: json['lastUpdatedBy'] as String,
    percentComplete: json['percentComplete'] as int,
    status:
        _$enumDecodeNullable(_$ActionExecutionStatusEnumMap, json['status']),
    summary: json['summary'] as String,
    token: json['token'] as String,
  );
}

const _$ActionExecutionStatusEnumMap = {
  ActionExecutionStatus.inProgress: 'InProgress',
  ActionExecutionStatus.abandoned: 'Abandoned',
  ActionExecutionStatus.succeeded: 'Succeeded',
  ActionExecutionStatus.failed: 'Failed',
};

ActionExecutionDetail _$ActionExecutionDetailFromJson(
    Map<String, dynamic> json) {
  return ActionExecutionDetail(
    actionExecutionId: json['actionExecutionId'] as String,
    actionName: json['actionName'] as String,
    input: json['input'] == null
        ? null
        : ActionExecutionInput.fromJson(json['input'] as Map<String, dynamic>),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    output: json['output'] == null
        ? null
        : ActionExecutionOutput.fromJson(
            json['output'] as Map<String, dynamic>),
    pipelineExecutionId: json['pipelineExecutionId'] as String,
    pipelineVersion: json['pipelineVersion'] as int,
    stageName: json['stageName'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    status:
        _$enumDecodeNullable(_$ActionExecutionStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$ActionExecutionFilterToJson(
    ActionExecutionFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineExecutionId', instance.pipelineExecutionId);
  return val;
}

ActionExecutionInput _$ActionExecutionInputFromJson(Map<String, dynamic> json) {
  return ActionExecutionInput(
    actionTypeId: json['actionTypeId'] == null
        ? null
        : ActionTypeId.fromJson(json['actionTypeId'] as Map<String, dynamic>),
    configuration: (json['configuration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    inputArtifacts: (json['inputArtifacts'] as List)
        ?.map((e) => e == null
            ? null
            : ArtifactDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    namespace: json['namespace'] as String,
    region: json['region'] as String,
    resolvedConfiguration:
        (json['resolvedConfiguration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    roleArn: json['roleArn'] as String,
  );
}

ActionExecutionOutput _$ActionExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return ActionExecutionOutput(
    executionResult: json['executionResult'] == null
        ? null
        : ActionExecutionResult.fromJson(
            json['executionResult'] as Map<String, dynamic>),
    outputArtifacts: (json['outputArtifacts'] as List)
        ?.map((e) => e == null
            ? null
            : ArtifactDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputVariables: (json['outputVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ActionExecutionResult _$ActionExecutionResultFromJson(
    Map<String, dynamic> json) {
  return ActionExecutionResult(
    externalExecutionId: json['externalExecutionId'] as String,
    externalExecutionSummary: json['externalExecutionSummary'] as String,
    externalExecutionUrl: json['externalExecutionUrl'] as String,
  );
}

ActionRevision _$ActionRevisionFromJson(Map<String, dynamic> json) {
  return ActionRevision(
    created: const UnixDateTimeConverter().fromJson(json['created']),
    revisionChangeId: json['revisionChangeId'] as String,
    revisionId: json['revisionId'] as String,
  );
}

Map<String, dynamic> _$ActionRevisionToJson(ActionRevision instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'created', const UnixDateTimeConverter().toJson(instance.created));
  writeNotNull('revisionChangeId', instance.revisionChangeId);
  writeNotNull('revisionId', instance.revisionId);
  return val;
}

ActionState _$ActionStateFromJson(Map<String, dynamic> json) {
  return ActionState(
    actionName: json['actionName'] as String,
    currentRevision: json['currentRevision'] == null
        ? null
        : ActionRevision.fromJson(
            json['currentRevision'] as Map<String, dynamic>),
    entityUrl: json['entityUrl'] as String,
    latestExecution: json['latestExecution'] == null
        ? null
        : ActionExecution.fromJson(
            json['latestExecution'] as Map<String, dynamic>),
    revisionUrl: json['revisionUrl'] as String,
  );
}

ActionType _$ActionTypeFromJson(Map<String, dynamic> json) {
  return ActionType(
    id: json['id'] == null
        ? null
        : ActionTypeId.fromJson(json['id'] as Map<String, dynamic>),
    inputArtifactDetails: json['inputArtifactDetails'] == null
        ? null
        : ArtifactDetails.fromJson(
            json['inputArtifactDetails'] as Map<String, dynamic>),
    outputArtifactDetails: json['outputArtifactDetails'] == null
        ? null
        : ArtifactDetails.fromJson(
            json['outputArtifactDetails'] as Map<String, dynamic>),
    actionConfigurationProperties: (json['actionConfigurationProperties']
            as List)
        ?.map((e) => e == null
            ? null
            : ActionConfigurationProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    settings: json['settings'] == null
        ? null
        : ActionTypeSettings.fromJson(json['settings'] as Map<String, dynamic>),
  );
}

ActionTypeId _$ActionTypeIdFromJson(Map<String, dynamic> json) {
  return ActionTypeId(
    category: _$enumDecodeNullable(_$ActionCategoryEnumMap, json['category']),
    owner: _$enumDecodeNullable(_$ActionOwnerEnumMap, json['owner']),
    provider: json['provider'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$ActionTypeIdToJson(ActionTypeId instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('category', _$ActionCategoryEnumMap[instance.category]);
  writeNotNull('owner', _$ActionOwnerEnumMap[instance.owner]);
  writeNotNull('provider', instance.provider);
  writeNotNull('version', instance.version);
  return val;
}

const _$ActionCategoryEnumMap = {
  ActionCategory.source: 'Source',
  ActionCategory.build: 'Build',
  ActionCategory.deploy: 'Deploy',
  ActionCategory.test: 'Test',
  ActionCategory.invoke: 'Invoke',
  ActionCategory.approval: 'Approval',
};

const _$ActionOwnerEnumMap = {
  ActionOwner.aws: 'AWS',
  ActionOwner.thirdParty: 'ThirdParty',
  ActionOwner.custom: 'Custom',
};

ActionTypeSettings _$ActionTypeSettingsFromJson(Map<String, dynamic> json) {
  return ActionTypeSettings(
    entityUrlTemplate: json['entityUrlTemplate'] as String,
    executionUrlTemplate: json['executionUrlTemplate'] as String,
    revisionUrlTemplate: json['revisionUrlTemplate'] as String,
    thirdPartyConfigurationUrl: json['thirdPartyConfigurationUrl'] as String,
  );
}

Map<String, dynamic> _$ActionTypeSettingsToJson(ActionTypeSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('entityUrlTemplate', instance.entityUrlTemplate);
  writeNotNull('executionUrlTemplate', instance.executionUrlTemplate);
  writeNotNull('revisionUrlTemplate', instance.revisionUrlTemplate);
  writeNotNull(
      'thirdPartyConfigurationUrl', instance.thirdPartyConfigurationUrl);
  return val;
}

Map<String, dynamic> _$ApprovalResultToJson(ApprovalResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$ApprovalStatusEnumMap[instance.status]);
  writeNotNull('summary', instance.summary);
  return val;
}

const _$ApprovalStatusEnumMap = {
  ApprovalStatus.approved: 'Approved',
  ApprovalStatus.rejected: 'Rejected',
};

Artifact _$ArtifactFromJson(Map<String, dynamic> json) {
  return Artifact(
    location: json['location'] == null
        ? null
        : ArtifactLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    revision: json['revision'] as String,
  );
}

ArtifactDetail _$ArtifactDetailFromJson(Map<String, dynamic> json) {
  return ArtifactDetail(
    name: json['name'] as String,
    s3location: json['s3location'] == null
        ? null
        : S3Location.fromJson(json['s3location'] as Map<String, dynamic>),
  );
}

ArtifactDetails _$ArtifactDetailsFromJson(Map<String, dynamic> json) {
  return ArtifactDetails(
    maximumCount: json['maximumCount'] as int,
    minimumCount: json['minimumCount'] as int,
  );
}

Map<String, dynamic> _$ArtifactDetailsToJson(ArtifactDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maximumCount', instance.maximumCount);
  writeNotNull('minimumCount', instance.minimumCount);
  return val;
}

ArtifactLocation _$ArtifactLocationFromJson(Map<String, dynamic> json) {
  return ArtifactLocation(
    s3Location: json['s3Location'] == null
        ? null
        : S3ArtifactLocation.fromJson(
            json['s3Location'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$ArtifactLocationTypeEnumMap, json['type']),
  );
}

const _$ArtifactLocationTypeEnumMap = {
  ArtifactLocationType.s3: 'S3',
};

ArtifactRevision _$ArtifactRevisionFromJson(Map<String, dynamic> json) {
  return ArtifactRevision(
    created: const UnixDateTimeConverter().fromJson(json['created']),
    name: json['name'] as String,
    revisionChangeIdentifier: json['revisionChangeIdentifier'] as String,
    revisionId: json['revisionId'] as String,
    revisionSummary: json['revisionSummary'] as String,
    revisionUrl: json['revisionUrl'] as String,
  );
}

ArtifactStore _$ArtifactStoreFromJson(Map<String, dynamic> json) {
  return ArtifactStore(
    location: json['location'] as String,
    type: _$enumDecodeNullable(_$ArtifactStoreTypeEnumMap, json['type']),
    encryptionKey: json['encryptionKey'] == null
        ? null
        : EncryptionKey.fromJson(json['encryptionKey'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArtifactStoreToJson(ArtifactStore instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location);
  writeNotNull('type', _$ArtifactStoreTypeEnumMap[instance.type]);
  writeNotNull('encryptionKey', instance.encryptionKey?.toJson());
  return val;
}

const _$ArtifactStoreTypeEnumMap = {
  ArtifactStoreType.s3: 'S3',
};

BlockerDeclaration _$BlockerDeclarationFromJson(Map<String, dynamic> json) {
  return BlockerDeclaration(
    name: json['name'] as String,
    type: _$enumDecodeNullable(_$BlockerTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$BlockerDeclarationToJson(BlockerDeclaration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('type', _$BlockerTypeEnumMap[instance.type]);
  return val;
}

const _$BlockerTypeEnumMap = {
  BlockerType.schedule: 'Schedule',
};

CreateCustomActionTypeOutput _$CreateCustomActionTypeOutputFromJson(
    Map<String, dynamic> json) {
  return CreateCustomActionTypeOutput(
    actionType: json['actionType'] == null
        ? null
        : ActionType.fromJson(json['actionType'] as Map<String, dynamic>),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreatePipelineOutput _$CreatePipelineOutputFromJson(Map<String, dynamic> json) {
  return CreatePipelineOutput(
    pipeline: json['pipeline'] == null
        ? null
        : PipelineDeclaration.fromJson(
            json['pipeline'] as Map<String, dynamic>),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CurrentRevisionToJson(CurrentRevision instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('changeIdentifier', instance.changeIdentifier);
  writeNotNull('revision', instance.revision);
  writeNotNull(
      'created', const UnixDateTimeConverter().toJson(instance.created));
  writeNotNull('revisionSummary', instance.revisionSummary);
  return val;
}

DeleteWebhookOutput _$DeleteWebhookOutputFromJson(Map<String, dynamic> json) {
  return DeleteWebhookOutput();
}

DeregisterWebhookWithThirdPartyOutput
    _$DeregisterWebhookWithThirdPartyOutputFromJson(Map<String, dynamic> json) {
  return DeregisterWebhookWithThirdPartyOutput();
}

EncryptionKey _$EncryptionKeyFromJson(Map<String, dynamic> json) {
  return EncryptionKey(
    id: json['id'] as String,
    type: _$enumDecodeNullable(_$EncryptionKeyTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$EncryptionKeyToJson(EncryptionKey instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', _$EncryptionKeyTypeEnumMap[instance.type]);
  return val;
}

const _$EncryptionKeyTypeEnumMap = {
  EncryptionKeyType.kms: 'KMS',
};

ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) {
  return ErrorDetails(
    code: json['code'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ExecutionDetailsToJson(ExecutionDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('externalExecutionId', instance.externalExecutionId);
  writeNotNull('percentComplete', instance.percentComplete);
  writeNotNull('summary', instance.summary);
  return val;
}

ExecutionTrigger _$ExecutionTriggerFromJson(Map<String, dynamic> json) {
  return ExecutionTrigger(
    triggerDetail: json['triggerDetail'] as String,
    triggerType:
        _$enumDecodeNullable(_$TriggerTypeEnumMap, json['triggerType']),
  );
}

const _$TriggerTypeEnumMap = {
  TriggerType.createPipeline: 'CreatePipeline',
  TriggerType.startPipelineExecution: 'StartPipelineExecution',
  TriggerType.pollForSourceChanges: 'PollForSourceChanges',
  TriggerType.webhook: 'Webhook',
  TriggerType.cloudWatchEvent: 'CloudWatchEvent',
  TriggerType.putActionRevision: 'PutActionRevision',
};

Map<String, dynamic> _$FailureDetailsToJson(FailureDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('type', _$FailureTypeEnumMap[instance.type]);
  writeNotNull('externalExecutionId', instance.externalExecutionId);
  return val;
}

const _$FailureTypeEnumMap = {
  FailureType.jobFailed: 'JobFailed',
  FailureType.configurationError: 'ConfigurationError',
  FailureType.permissionError: 'PermissionError',
  FailureType.revisionOutOfSync: 'RevisionOutOfSync',
  FailureType.revisionUnavailable: 'RevisionUnavailable',
  FailureType.systemUnavailable: 'SystemUnavailable',
};

GetJobDetailsOutput _$GetJobDetailsOutputFromJson(Map<String, dynamic> json) {
  return GetJobDetailsOutput(
    jobDetails: json['jobDetails'] == null
        ? null
        : JobDetails.fromJson(json['jobDetails'] as Map<String, dynamic>),
  );
}

GetPipelineExecutionOutput _$GetPipelineExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return GetPipelineExecutionOutput(
    pipelineExecution: json['pipelineExecution'] == null
        ? null
        : PipelineExecution.fromJson(
            json['pipelineExecution'] as Map<String, dynamic>),
  );
}

GetPipelineOutput _$GetPipelineOutputFromJson(Map<String, dynamic> json) {
  return GetPipelineOutput(
    metadata: json['metadata'] == null
        ? null
        : PipelineMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    pipeline: json['pipeline'] == null
        ? null
        : PipelineDeclaration.fromJson(
            json['pipeline'] as Map<String, dynamic>),
  );
}

GetPipelineStateOutput _$GetPipelineStateOutputFromJson(
    Map<String, dynamic> json) {
  return GetPipelineStateOutput(
    created: const UnixDateTimeConverter().fromJson(json['created']),
    pipelineName: json['pipelineName'] as String,
    pipelineVersion: json['pipelineVersion'] as int,
    stageStates: (json['stageStates'] as List)
        ?.map((e) =>
            e == null ? null : StageState.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    updated: const UnixDateTimeConverter().fromJson(json['updated']),
  );
}

GetThirdPartyJobDetailsOutput _$GetThirdPartyJobDetailsOutputFromJson(
    Map<String, dynamic> json) {
  return GetThirdPartyJobDetailsOutput(
    jobDetails: json['jobDetails'] == null
        ? null
        : ThirdPartyJobDetails.fromJson(
            json['jobDetails'] as Map<String, dynamic>),
  );
}

InputArtifact _$InputArtifactFromJson(Map<String, dynamic> json) {
  return InputArtifact(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$InputArtifactToJson(InputArtifact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    accountId: json['accountId'] as String,
    data: json['data'] == null
        ? null
        : JobData.fromJson(json['data'] as Map<String, dynamic>),
    id: json['id'] as String,
    nonce: json['nonce'] as String,
  );
}

JobData _$JobDataFromJson(Map<String, dynamic> json) {
  return JobData(
    actionConfiguration: json['actionConfiguration'] == null
        ? null
        : ActionConfiguration.fromJson(
            json['actionConfiguration'] as Map<String, dynamic>),
    actionTypeId: json['actionTypeId'] == null
        ? null
        : ActionTypeId.fromJson(json['actionTypeId'] as Map<String, dynamic>),
    artifactCredentials: json['artifactCredentials'] == null
        ? null
        : AWSSessionCredentials.fromJson(
            json['artifactCredentials'] as Map<String, dynamic>),
    continuationToken: json['continuationToken'] as String,
    encryptionKey: json['encryptionKey'] == null
        ? null
        : EncryptionKey.fromJson(json['encryptionKey'] as Map<String, dynamic>),
    inputArtifacts: (json['inputArtifacts'] as List)
        ?.map((e) =>
            e == null ? null : Artifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputArtifacts: (json['outputArtifacts'] as List)
        ?.map((e) =>
            e == null ? null : Artifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pipelineContext: json['pipelineContext'] == null
        ? null
        : PipelineContext.fromJson(
            json['pipelineContext'] as Map<String, dynamic>),
  );
}

JobDetails _$JobDetailsFromJson(Map<String, dynamic> json) {
  return JobDetails(
    accountId: json['accountId'] as String,
    data: json['data'] == null
        ? null
        : JobData.fromJson(json['data'] as Map<String, dynamic>),
    id: json['id'] as String,
  );
}

ListActionExecutionsOutput _$ListActionExecutionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListActionExecutionsOutput(
    actionExecutionDetails: (json['actionExecutionDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ActionExecutionDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListActionTypesOutput _$ListActionTypesOutputFromJson(
    Map<String, dynamic> json) {
  return ListActionTypesOutput(
    actionTypes: (json['actionTypes'] as List)
        ?.map((e) =>
            e == null ? null : ActionType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListPipelineExecutionsOutput _$ListPipelineExecutionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListPipelineExecutionsOutput(
    nextToken: json['nextToken'] as String,
    pipelineExecutionSummaries: (json['pipelineExecutionSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineExecutionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPipelinesOutput _$ListPipelinesOutputFromJson(Map<String, dynamic> json) {
  return ListPipelinesOutput(
    nextToken: json['nextToken'] as String,
    pipelines: (json['pipelines'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    nextToken: json['nextToken'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListWebhookItem _$ListWebhookItemFromJson(Map<String, dynamic> json) {
  return ListWebhookItem(
    definition: json['definition'] == null
        ? null
        : WebhookDefinition.fromJson(
            json['definition'] as Map<String, dynamic>),
    url: json['url'] as String,
    arn: json['arn'] as String,
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
    lastTriggered:
        const UnixDateTimeConverter().fromJson(json['lastTriggered']),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListWebhooksOutput _$ListWebhooksOutputFromJson(Map<String, dynamic> json) {
  return ListWebhooksOutput(
    nextToken: json['NextToken'] as String,
    webhooks: (json['webhooks'] as List)
        ?.map((e) => e == null
            ? null
            : ListWebhookItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OutputArtifact _$OutputArtifactFromJson(Map<String, dynamic> json) {
  return OutputArtifact(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$OutputArtifactToJson(OutputArtifact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

PipelineContext _$PipelineContextFromJson(Map<String, dynamic> json) {
  return PipelineContext(
    action: json['action'] == null
        ? null
        : ActionContext.fromJson(json['action'] as Map<String, dynamic>),
    pipelineArn: json['pipelineArn'] as String,
    pipelineExecutionId: json['pipelineExecutionId'] as String,
    pipelineName: json['pipelineName'] as String,
    stage: json['stage'] == null
        ? null
        : StageContext.fromJson(json['stage'] as Map<String, dynamic>),
  );
}

PipelineDeclaration _$PipelineDeclarationFromJson(Map<String, dynamic> json) {
  return PipelineDeclaration(
    name: json['name'] as String,
    roleArn: json['roleArn'] as String,
    stages: (json['stages'] as List)
        ?.map((e) => e == null
            ? null
            : StageDeclaration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    artifactStore: json['artifactStore'] == null
        ? null
        : ArtifactStore.fromJson(json['artifactStore'] as Map<String, dynamic>),
    artifactStores: (json['artifactStores'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : ArtifactStore.fromJson(e as Map<String, dynamic>)),
    ),
    version: json['version'] as int,
  );
}

Map<String, dynamic> _$PipelineDeclarationToJson(PipelineDeclaration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('stages', instance.stages?.map((e) => e?.toJson())?.toList());
  writeNotNull('artifactStore', instance.artifactStore?.toJson());
  writeNotNull('artifactStores',
      instance.artifactStores?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('version', instance.version);
  return val;
}

PipelineExecution _$PipelineExecutionFromJson(Map<String, dynamic> json) {
  return PipelineExecution(
    artifactRevisions: (json['artifactRevisions'] as List)
        ?.map((e) => e == null
            ? null
            : ArtifactRevision.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pipelineExecutionId: json['pipelineExecutionId'] as String,
    pipelineName: json['pipelineName'] as String,
    pipelineVersion: json['pipelineVersion'] as int,
    status:
        _$enumDecodeNullable(_$PipelineExecutionStatusEnumMap, json['status']),
  );
}

const _$PipelineExecutionStatusEnumMap = {
  PipelineExecutionStatus.inProgress: 'InProgress',
  PipelineExecutionStatus.stopped: 'Stopped',
  PipelineExecutionStatus.stopping: 'Stopping',
  PipelineExecutionStatus.succeeded: 'Succeeded',
  PipelineExecutionStatus.superseded: 'Superseded',
  PipelineExecutionStatus.failed: 'Failed',
};

PipelineExecutionSummary _$PipelineExecutionSummaryFromJson(
    Map<String, dynamic> json) {
  return PipelineExecutionSummary(
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    pipelineExecutionId: json['pipelineExecutionId'] as String,
    sourceRevisions: (json['sourceRevisions'] as List)
        ?.map((e) => e == null
            ? null
            : SourceRevision.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    status:
        _$enumDecodeNullable(_$PipelineExecutionStatusEnumMap, json['status']),
    stopTrigger: json['stopTrigger'] == null
        ? null
        : StopExecutionTrigger.fromJson(
            json['stopTrigger'] as Map<String, dynamic>),
    trigger: json['trigger'] == null
        ? null
        : ExecutionTrigger.fromJson(json['trigger'] as Map<String, dynamic>),
  );
}

PipelineMetadata _$PipelineMetadataFromJson(Map<String, dynamic> json) {
  return PipelineMetadata(
    created: const UnixDateTimeConverter().fromJson(json['created']),
    pipelineArn: json['pipelineArn'] as String,
    updated: const UnixDateTimeConverter().fromJson(json['updated']),
  );
}

PipelineSummary _$PipelineSummaryFromJson(Map<String, dynamic> json) {
  return PipelineSummary(
    created: const UnixDateTimeConverter().fromJson(json['created']),
    name: json['name'] as String,
    updated: const UnixDateTimeConverter().fromJson(json['updated']),
    version: json['version'] as int,
  );
}

PollForJobsOutput _$PollForJobsOutputFromJson(Map<String, dynamic> json) {
  return PollForJobsOutput(
    jobs: (json['jobs'] as List)
        ?.map((e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PollForThirdPartyJobsOutput _$PollForThirdPartyJobsOutputFromJson(
    Map<String, dynamic> json) {
  return PollForThirdPartyJobsOutput(
    jobs: (json['jobs'] as List)
        ?.map((e) => e == null
            ? null
            : ThirdPartyJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutActionRevisionOutput _$PutActionRevisionOutputFromJson(
    Map<String, dynamic> json) {
  return PutActionRevisionOutput(
    newRevision: json['newRevision'] as bool,
    pipelineExecutionId: json['pipelineExecutionId'] as String,
  );
}

PutApprovalResultOutput _$PutApprovalResultOutputFromJson(
    Map<String, dynamic> json) {
  return PutApprovalResultOutput(
    approvedAt: const UnixDateTimeConverter().fromJson(json['approvedAt']),
  );
}

PutWebhookOutput _$PutWebhookOutputFromJson(Map<String, dynamic> json) {
  return PutWebhookOutput(
    webhook: json['webhook'] == null
        ? null
        : ListWebhookItem.fromJson(json['webhook'] as Map<String, dynamic>),
  );
}

RegisterWebhookWithThirdPartyOutput
    _$RegisterWebhookWithThirdPartyOutputFromJson(Map<String, dynamic> json) {
  return RegisterWebhookWithThirdPartyOutput();
}

RetryStageExecutionOutput _$RetryStageExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return RetryStageExecutionOutput(
    pipelineExecutionId: json['pipelineExecutionId'] as String,
  );
}

S3ArtifactLocation _$S3ArtifactLocationFromJson(Map<String, dynamic> json) {
  return S3ArtifactLocation(
    bucketName: json['bucketName'] as String,
    objectKey: json['objectKey'] as String,
  );
}

S3Location _$S3LocationFromJson(Map<String, dynamic> json) {
  return S3Location(
    bucket: json['bucket'] as String,
    key: json['key'] as String,
  );
}

SourceRevision _$SourceRevisionFromJson(Map<String, dynamic> json) {
  return SourceRevision(
    actionName: json['actionName'] as String,
    revisionId: json['revisionId'] as String,
    revisionSummary: json['revisionSummary'] as String,
    revisionUrl: json['revisionUrl'] as String,
  );
}

StageContext _$StageContextFromJson(Map<String, dynamic> json) {
  return StageContext(
    name: json['name'] as String,
  );
}

StageDeclaration _$StageDeclarationFromJson(Map<String, dynamic> json) {
  return StageDeclaration(
    actions: (json['actions'] as List)
        ?.map((e) => e == null
            ? null
            : ActionDeclaration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    blockers: (json['blockers'] as List)
        ?.map((e) => e == null
            ? null
            : BlockerDeclaration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StageDeclarationToJson(StageDeclaration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('actions', instance.actions?.map((e) => e?.toJson())?.toList());
  writeNotNull('name', instance.name);
  writeNotNull(
      'blockers', instance.blockers?.map((e) => e?.toJson())?.toList());
  return val;
}

StageExecution _$StageExecutionFromJson(Map<String, dynamic> json) {
  return StageExecution(
    pipelineExecutionId: json['pipelineExecutionId'] as String,
    status: _$enumDecodeNullable(_$StageExecutionStatusEnumMap, json['status']),
  );
}

const _$StageExecutionStatusEnumMap = {
  StageExecutionStatus.inProgress: 'InProgress',
  StageExecutionStatus.failed: 'Failed',
  StageExecutionStatus.stopped: 'Stopped',
  StageExecutionStatus.stopping: 'Stopping',
  StageExecutionStatus.succeeded: 'Succeeded',
};

StageState _$StageStateFromJson(Map<String, dynamic> json) {
  return StageState(
    actionStates: (json['actionStates'] as List)
        ?.map((e) =>
            e == null ? null : ActionState.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inboundExecution: json['inboundExecution'] == null
        ? null
        : StageExecution.fromJson(
            json['inboundExecution'] as Map<String, dynamic>),
    inboundTransitionState: json['inboundTransitionState'] == null
        ? null
        : TransitionState.fromJson(
            json['inboundTransitionState'] as Map<String, dynamic>),
    latestExecution: json['latestExecution'] == null
        ? null
        : StageExecution.fromJson(
            json['latestExecution'] as Map<String, dynamic>),
    stageName: json['stageName'] as String,
  );
}

StartPipelineExecutionOutput _$StartPipelineExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return StartPipelineExecutionOutput(
    pipelineExecutionId: json['pipelineExecutionId'] as String,
  );
}

StopExecutionTrigger _$StopExecutionTriggerFromJson(Map<String, dynamic> json) {
  return StopExecutionTrigger(
    reason: json['reason'] as String,
  );
}

StopPipelineExecutionOutput _$StopPipelineExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return StopPipelineExecutionOutput(
    pipelineExecutionId: json['pipelineExecutionId'] as String,
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

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

ThirdPartyJob _$ThirdPartyJobFromJson(Map<String, dynamic> json) {
  return ThirdPartyJob(
    clientId: json['clientId'] as String,
    jobId: json['jobId'] as String,
  );
}

ThirdPartyJobData _$ThirdPartyJobDataFromJson(Map<String, dynamic> json) {
  return ThirdPartyJobData(
    actionConfiguration: json['actionConfiguration'] == null
        ? null
        : ActionConfiguration.fromJson(
            json['actionConfiguration'] as Map<String, dynamic>),
    actionTypeId: json['actionTypeId'] == null
        ? null
        : ActionTypeId.fromJson(json['actionTypeId'] as Map<String, dynamic>),
    artifactCredentials: json['artifactCredentials'] == null
        ? null
        : AWSSessionCredentials.fromJson(
            json['artifactCredentials'] as Map<String, dynamic>),
    continuationToken: json['continuationToken'] as String,
    encryptionKey: json['encryptionKey'] == null
        ? null
        : EncryptionKey.fromJson(json['encryptionKey'] as Map<String, dynamic>),
    inputArtifacts: (json['inputArtifacts'] as List)
        ?.map((e) =>
            e == null ? null : Artifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputArtifacts: (json['outputArtifacts'] as List)
        ?.map((e) =>
            e == null ? null : Artifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pipelineContext: json['pipelineContext'] == null
        ? null
        : PipelineContext.fromJson(
            json['pipelineContext'] as Map<String, dynamic>),
  );
}

ThirdPartyJobDetails _$ThirdPartyJobDetailsFromJson(Map<String, dynamic> json) {
  return ThirdPartyJobDetails(
    data: json['data'] == null
        ? null
        : ThirdPartyJobData.fromJson(json['data'] as Map<String, dynamic>),
    id: json['id'] as String,
    nonce: json['nonce'] as String,
  );
}

TransitionState _$TransitionStateFromJson(Map<String, dynamic> json) {
  return TransitionState(
    disabledReason: json['disabledReason'] as String,
    enabled: json['enabled'] as bool,
    lastChangedAt:
        const UnixDateTimeConverter().fromJson(json['lastChangedAt']),
    lastChangedBy: json['lastChangedBy'] as String,
  );
}

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
}

UpdatePipelineOutput _$UpdatePipelineOutputFromJson(Map<String, dynamic> json) {
  return UpdatePipelineOutput(
    pipeline: json['pipeline'] == null
        ? null
        : PipelineDeclaration.fromJson(
            json['pipeline'] as Map<String, dynamic>),
  );
}

WebhookAuthConfiguration _$WebhookAuthConfigurationFromJson(
    Map<String, dynamic> json) {
  return WebhookAuthConfiguration(
    allowedIPRange: json['AllowedIPRange'] as String,
    secretToken: json['SecretToken'] as String,
  );
}

Map<String, dynamic> _$WebhookAuthConfigurationToJson(
    WebhookAuthConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowedIPRange', instance.allowedIPRange);
  writeNotNull('SecretToken', instance.secretToken);
  return val;
}

WebhookDefinition _$WebhookDefinitionFromJson(Map<String, dynamic> json) {
  return WebhookDefinition(
    authentication: _$enumDecodeNullable(
        _$WebhookAuthenticationTypeEnumMap, json['authentication']),
    authenticationConfiguration: json['authenticationConfiguration'] == null
        ? null
        : WebhookAuthConfiguration.fromJson(
            json['authenticationConfiguration'] as Map<String, dynamic>),
    filters: (json['filters'] as List)
        ?.map((e) => e == null
            ? null
            : WebhookFilterRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    targetAction: json['targetAction'] as String,
    targetPipeline: json['targetPipeline'] as String,
  );
}

Map<String, dynamic> _$WebhookDefinitionToJson(WebhookDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authentication',
      _$WebhookAuthenticationTypeEnumMap[instance.authentication]);
  writeNotNull('authenticationConfiguration',
      instance.authenticationConfiguration?.toJson());
  writeNotNull('filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('name', instance.name);
  writeNotNull('targetAction', instance.targetAction);
  writeNotNull('targetPipeline', instance.targetPipeline);
  return val;
}

const _$WebhookAuthenticationTypeEnumMap = {
  WebhookAuthenticationType.githubHmac: 'GITHUB_HMAC',
  WebhookAuthenticationType.ip: 'IP',
  WebhookAuthenticationType.unauthenticated: 'UNAUTHENTICATED',
};

WebhookFilterRule _$WebhookFilterRuleFromJson(Map<String, dynamic> json) {
  return WebhookFilterRule(
    jsonPath: json['jsonPath'] as String,
    matchEquals: json['matchEquals'] as String,
  );
}

Map<String, dynamic> _$WebhookFilterRuleToJson(WebhookFilterRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jsonPath', instance.jsonPath);
  writeNotNull('matchEquals', instance.matchEquals);
  return val;
}
