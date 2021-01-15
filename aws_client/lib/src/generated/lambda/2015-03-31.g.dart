// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-03-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountLimit _$AccountLimitFromJson(Map<String, dynamic> json) {
  return AccountLimit(
    codeSizeUnzipped: json['CodeSizeUnzipped'] as int,
    codeSizeZipped: json['CodeSizeZipped'] as int,
    concurrentExecutions: json['ConcurrentExecutions'] as int,
    totalCodeSize: json['TotalCodeSize'] as int,
    unreservedConcurrentExecutions:
        json['UnreservedConcurrentExecutions'] as int,
  );
}

AccountUsage _$AccountUsageFromJson(Map<String, dynamic> json) {
  return AccountUsage(
    functionCount: json['FunctionCount'] as int,
    totalCodeSize: json['TotalCodeSize'] as int,
  );
}

AddLayerVersionPermissionResponse _$AddLayerVersionPermissionResponseFromJson(
    Map<String, dynamic> json) {
  return AddLayerVersionPermissionResponse(
    revisionId: json['RevisionId'] as String,
    statement: json['Statement'] as String,
  );
}

AddPermissionResponse _$AddPermissionResponseFromJson(
    Map<String, dynamic> json) {
  return AddPermissionResponse(
    statement: json['Statement'] as String,
  );
}

AliasConfiguration _$AliasConfigurationFromJson(Map<String, dynamic> json) {
  return AliasConfiguration(
    aliasArn: json['AliasArn'] as String,
    description: json['Description'] as String,
    functionVersion: json['FunctionVersion'] as String,
    name: json['Name'] as String,
    revisionId: json['RevisionId'] as String,
    routingConfig: json['RoutingConfig'] == null
        ? null
        : AliasRoutingConfiguration.fromJson(
            json['RoutingConfig'] as Map<String, dynamic>),
  );
}

AliasRoutingConfiguration _$AliasRoutingConfigurationFromJson(
    Map<String, dynamic> json) {
  return AliasRoutingConfiguration(
    additionalVersionWeights:
        (json['AdditionalVersionWeights'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
  );
}

Map<String, dynamic> _$AliasRoutingConfigurationToJson(
    AliasRoutingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdditionalVersionWeights', instance.additionalVersionWeights);
  return val;
}

AllowedPublishers _$AllowedPublishersFromJson(Map<String, dynamic> json) {
  return AllowedPublishers(
    signingProfileVersionArns: (json['SigningProfileVersionArns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$AllowedPublishersToJson(AllowedPublishers instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SigningProfileVersionArns', instance.signingProfileVersionArns);
  return val;
}

CodeSigningConfig _$CodeSigningConfigFromJson(Map<String, dynamic> json) {
  return CodeSigningConfig(
    allowedPublishers: json['AllowedPublishers'] == null
        ? null
        : AllowedPublishers.fromJson(
            json['AllowedPublishers'] as Map<String, dynamic>),
    codeSigningConfigArn: json['CodeSigningConfigArn'] as String,
    codeSigningConfigId: json['CodeSigningConfigId'] as String,
    codeSigningPolicies: json['CodeSigningPolicies'] == null
        ? null
        : CodeSigningPolicies.fromJson(
            json['CodeSigningPolicies'] as Map<String, dynamic>),
    lastModified: json['LastModified'] as String,
    description: json['Description'] as String,
  );
}

CodeSigningPolicies _$CodeSigningPoliciesFromJson(Map<String, dynamic> json) {
  return CodeSigningPolicies(
    untrustedArtifactOnDeployment: _$enumDecodeNullable(
        _$CodeSigningPolicyEnumMap, json['UntrustedArtifactOnDeployment']),
  );
}

Map<String, dynamic> _$CodeSigningPoliciesToJson(CodeSigningPolicies instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UntrustedArtifactOnDeployment',
      _$CodeSigningPolicyEnumMap[instance.untrustedArtifactOnDeployment]);
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

const _$CodeSigningPolicyEnumMap = {
  CodeSigningPolicy.warn: 'Warn',
  CodeSigningPolicy.enforce: 'Enforce',
};

Concurrency _$ConcurrencyFromJson(Map<String, dynamic> json) {
  return Concurrency(
    reservedConcurrentExecutions: json['ReservedConcurrentExecutions'] as int,
  );
}

CreateCodeSigningConfigResponse _$CreateCodeSigningConfigResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCodeSigningConfigResponse(
    codeSigningConfig: json['CodeSigningConfig'] == null
        ? null
        : CodeSigningConfig.fromJson(
            json['CodeSigningConfig'] as Map<String, dynamic>),
  );
}

DeadLetterConfig _$DeadLetterConfigFromJson(Map<String, dynamic> json) {
  return DeadLetterConfig(
    targetArn: json['TargetArn'] as String,
  );
}

Map<String, dynamic> _$DeadLetterConfigToJson(DeadLetterConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetArn', instance.targetArn);
  return val;
}

DeleteCodeSigningConfigResponse _$DeleteCodeSigningConfigResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCodeSigningConfigResponse();
}

DestinationConfig _$DestinationConfigFromJson(Map<String, dynamic> json) {
  return DestinationConfig(
    onFailure: json['OnFailure'] == null
        ? null
        : OnFailure.fromJson(json['OnFailure'] as Map<String, dynamic>),
    onSuccess: json['OnSuccess'] == null
        ? null
        : OnSuccess.fromJson(json['OnSuccess'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DestinationConfigToJson(DestinationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OnFailure', instance.onFailure?.toJson());
  writeNotNull('OnSuccess', instance.onSuccess?.toJson());
  return val;
}

Map<String, dynamic> _$EnvironmentToJson(Environment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Variables', instance.variables);
  return val;
}

EnvironmentError _$EnvironmentErrorFromJson(Map<String, dynamic> json) {
  return EnvironmentError(
    errorCode: json['ErrorCode'] as String,
    message: json['Message'] as String,
  );
}

EnvironmentResponse _$EnvironmentResponseFromJson(Map<String, dynamic> json) {
  return EnvironmentResponse(
    error: json['Error'] == null
        ? null
        : EnvironmentError.fromJson(json['Error'] as Map<String, dynamic>),
    variables: (json['Variables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

EventSourceMappingConfiguration _$EventSourceMappingConfigurationFromJson(
    Map<String, dynamic> json) {
  return EventSourceMappingConfiguration(
    batchSize: json['BatchSize'] as int,
    bisectBatchOnFunctionError: json['BisectBatchOnFunctionError'] as bool,
    destinationConfig: json['DestinationConfig'] == null
        ? null
        : DestinationConfig.fromJson(
            json['DestinationConfig'] as Map<String, dynamic>),
    eventSourceArn: json['EventSourceArn'] as String,
    functionArn: json['FunctionArn'] as String,
    functionResponseTypes: (json['FunctionResponseTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$FunctionResponseTypeEnumMap, e))
        ?.toList(),
    lastModified: const UnixDateTimeConverter().fromJson(json['LastModified']),
    lastProcessingResult: json['LastProcessingResult'] as String,
    maximumBatchingWindowInSeconds:
        json['MaximumBatchingWindowInSeconds'] as int,
    maximumRecordAgeInSeconds: json['MaximumRecordAgeInSeconds'] as int,
    maximumRetryAttempts: json['MaximumRetryAttempts'] as int,
    parallelizationFactor: json['ParallelizationFactor'] as int,
    queues: (json['Queues'] as List)?.map((e) => e as String)?.toList(),
    selfManagedEventSource: json['SelfManagedEventSource'] == null
        ? null
        : SelfManagedEventSource.fromJson(
            json['SelfManagedEventSource'] as Map<String, dynamic>),
    sourceAccessConfigurations: (json['SourceAccessConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : SourceAccessConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    startingPosition: _$enumDecodeNullable(
        _$EventSourcePositionEnumMap, json['StartingPosition']),
    startingPositionTimestamp: const UnixDateTimeConverter()
        .fromJson(json['StartingPositionTimestamp']),
    state: json['State'] as String,
    stateTransitionReason: json['StateTransitionReason'] as String,
    topics: (json['Topics'] as List)?.map((e) => e as String)?.toList(),
    tumblingWindowInSeconds: json['TumblingWindowInSeconds'] as int,
    uuid: json['UUID'] as String,
  );
}

const _$FunctionResponseTypeEnumMap = {
  FunctionResponseType.reportBatchItemFailures: 'ReportBatchItemFailures',
};

const _$EventSourcePositionEnumMap = {
  EventSourcePosition.trimHorizon: 'TRIM_HORIZON',
  EventSourcePosition.latest: 'LATEST',
  EventSourcePosition.atTimestamp: 'AT_TIMESTAMP',
};

FileSystemConfig _$FileSystemConfigFromJson(Map<String, dynamic> json) {
  return FileSystemConfig(
    arn: json['Arn'] as String,
    localMountPath: json['LocalMountPath'] as String,
  );
}

Map<String, dynamic> _$FileSystemConfigToJson(FileSystemConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('LocalMountPath', instance.localMountPath);
  return val;
}

Map<String, dynamic> _$FunctionCodeToJson(FunctionCode instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ImageUri', instance.imageUri);
  writeNotNull('S3Bucket', instance.s3Bucket);
  writeNotNull('S3Key', instance.s3Key);
  writeNotNull('S3ObjectVersion', instance.s3ObjectVersion);
  writeNotNull('ZipFile', const Uint8ListConverter().toJson(instance.zipFile));
  return val;
}

FunctionCodeLocation _$FunctionCodeLocationFromJson(Map<String, dynamic> json) {
  return FunctionCodeLocation(
    imageUri: json['ImageUri'] as String,
    location: json['Location'] as String,
    repositoryType: json['RepositoryType'] as String,
    resolvedImageUri: json['ResolvedImageUri'] as String,
  );
}

FunctionConfiguration _$FunctionConfigurationFromJson(
    Map<String, dynamic> json) {
  return FunctionConfiguration(
    codeSha256: json['CodeSha256'] as String,
    codeSize: json['CodeSize'] as int,
    deadLetterConfig: json['DeadLetterConfig'] == null
        ? null
        : DeadLetterConfig.fromJson(
            json['DeadLetterConfig'] as Map<String, dynamic>),
    description: json['Description'] as String,
    environment: json['Environment'] == null
        ? null
        : EnvironmentResponse.fromJson(
            json['Environment'] as Map<String, dynamic>),
    fileSystemConfigs: (json['FileSystemConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : FileSystemConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    functionArn: json['FunctionArn'] as String,
    functionName: json['FunctionName'] as String,
    handler: json['Handler'] as String,
    imageConfigResponse: json['ImageConfigResponse'] == null
        ? null
        : ImageConfigResponse.fromJson(
            json['ImageConfigResponse'] as Map<String, dynamic>),
    kMSKeyArn: json['KMSKeyArn'] as String,
    lastModified: json['LastModified'] as String,
    lastUpdateStatus: _$enumDecodeNullable(
        _$LastUpdateStatusEnumMap, json['LastUpdateStatus']),
    lastUpdateStatusReason: json['LastUpdateStatusReason'] as String,
    lastUpdateStatusReasonCode: _$enumDecodeNullable(
        _$LastUpdateStatusReasonCodeEnumMap,
        json['LastUpdateStatusReasonCode']),
    layers: (json['Layers'] as List)
        ?.map(
            (e) => e == null ? null : Layer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    masterArn: json['MasterArn'] as String,
    memorySize: json['MemorySize'] as int,
    packageType:
        _$enumDecodeNullable(_$PackageTypeEnumMap, json['PackageType']),
    revisionId: json['RevisionId'] as String,
    role: json['Role'] as String,
    runtime: _$enumDecodeNullable(_$RuntimeEnumMap, json['Runtime']),
    signingJobArn: json['SigningJobArn'] as String,
    signingProfileVersionArn: json['SigningProfileVersionArn'] as String,
    state: _$enumDecodeNullable(_$StateEnumMap, json['State']),
    stateReason: json['StateReason'] as String,
    stateReasonCode:
        _$enumDecodeNullable(_$StateReasonCodeEnumMap, json['StateReasonCode']),
    timeout: json['Timeout'] as int,
    tracingConfig: json['TracingConfig'] == null
        ? null
        : TracingConfigResponse.fromJson(
            json['TracingConfig'] as Map<String, dynamic>),
    version: json['Version'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfigResponse.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

const _$LastUpdateStatusEnumMap = {
  LastUpdateStatus.successful: 'Successful',
  LastUpdateStatus.failed: 'Failed',
  LastUpdateStatus.inProgress: 'InProgress',
};

const _$LastUpdateStatusReasonCodeEnumMap = {
  LastUpdateStatusReasonCode.eniLimitExceeded: 'EniLimitExceeded',
  LastUpdateStatusReasonCode.insufficientRolePermissions:
      'InsufficientRolePermissions',
  LastUpdateStatusReasonCode.invalidConfiguration: 'InvalidConfiguration',
  LastUpdateStatusReasonCode.internalError: 'InternalError',
  LastUpdateStatusReasonCode.subnetOutOfIPAddresses: 'SubnetOutOfIPAddresses',
  LastUpdateStatusReasonCode.invalidSubnet: 'InvalidSubnet',
  LastUpdateStatusReasonCode.invalidSecurityGroup: 'InvalidSecurityGroup',
  LastUpdateStatusReasonCode.imageDeleted: 'ImageDeleted',
  LastUpdateStatusReasonCode.imageAccessDenied: 'ImageAccessDenied',
  LastUpdateStatusReasonCode.invalidImage: 'InvalidImage',
};

const _$PackageTypeEnumMap = {
  PackageType.zip: 'Zip',
  PackageType.image: 'Image',
};

const _$RuntimeEnumMap = {
  Runtime.nodejs: 'nodejs',
  Runtime.nodejs4_3: 'nodejs4.3',
  Runtime.nodejs6_10: 'nodejs6.10',
  Runtime.nodejs8_10: 'nodejs8.10',
  Runtime.nodejs10X: 'nodejs10.x',
  Runtime.nodejs12X: 'nodejs12.x',
  Runtime.java8: 'java8',
  Runtime.java8Al2: 'java8.al2',
  Runtime.java11: 'java11',
  Runtime.python2_7: 'python2.7',
  Runtime.python3_6: 'python3.6',
  Runtime.python3_7: 'python3.7',
  Runtime.python3_8: 'python3.8',
  Runtime.dotnetcore1_0: 'dotnetcore1.0',
  Runtime.dotnetcore2_0: 'dotnetcore2.0',
  Runtime.dotnetcore2_1: 'dotnetcore2.1',
  Runtime.dotnetcore3_1: 'dotnetcore3.1',
  Runtime.nodejs4_3Edge: 'nodejs4.3-edge',
  Runtime.go1X: 'go1.x',
  Runtime.ruby2_5: 'ruby2.5',
  Runtime.ruby2_7: 'ruby2.7',
  Runtime.provided: 'provided',
  Runtime.providedAl2: 'provided.al2',
};

const _$StateEnumMap = {
  State.pending: 'Pending',
  State.active: 'Active',
  State.inactive: 'Inactive',
  State.failed: 'Failed',
};

const _$StateReasonCodeEnumMap = {
  StateReasonCode.idle: 'Idle',
  StateReasonCode.creating: 'Creating',
  StateReasonCode.restoring: 'Restoring',
  StateReasonCode.eniLimitExceeded: 'EniLimitExceeded',
  StateReasonCode.insufficientRolePermissions: 'InsufficientRolePermissions',
  StateReasonCode.invalidConfiguration: 'InvalidConfiguration',
  StateReasonCode.internalError: 'InternalError',
  StateReasonCode.subnetOutOfIPAddresses: 'SubnetOutOfIPAddresses',
  StateReasonCode.invalidSubnet: 'InvalidSubnet',
  StateReasonCode.invalidSecurityGroup: 'InvalidSecurityGroup',
  StateReasonCode.imageDeleted: 'ImageDeleted',
  StateReasonCode.imageAccessDenied: 'ImageAccessDenied',
  StateReasonCode.invalidImage: 'InvalidImage',
};

FunctionEventInvokeConfig _$FunctionEventInvokeConfigFromJson(
    Map<String, dynamic> json) {
  return FunctionEventInvokeConfig(
    destinationConfig: json['DestinationConfig'] == null
        ? null
        : DestinationConfig.fromJson(
            json['DestinationConfig'] as Map<String, dynamic>),
    functionArn: json['FunctionArn'] as String,
    lastModified: const UnixDateTimeConverter().fromJson(json['LastModified']),
    maximumEventAgeInSeconds: json['MaximumEventAgeInSeconds'] as int,
    maximumRetryAttempts: json['MaximumRetryAttempts'] as int,
  );
}

GetAccountSettingsResponse _$GetAccountSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccountSettingsResponse(
    accountLimit: json['AccountLimit'] == null
        ? null
        : AccountLimit.fromJson(json['AccountLimit'] as Map<String, dynamic>),
    accountUsage: json['AccountUsage'] == null
        ? null
        : AccountUsage.fromJson(json['AccountUsage'] as Map<String, dynamic>),
  );
}

GetCodeSigningConfigResponse _$GetCodeSigningConfigResponseFromJson(
    Map<String, dynamic> json) {
  return GetCodeSigningConfigResponse(
    codeSigningConfig: json['CodeSigningConfig'] == null
        ? null
        : CodeSigningConfig.fromJson(
            json['CodeSigningConfig'] as Map<String, dynamic>),
  );
}

GetFunctionCodeSigningConfigResponse
    _$GetFunctionCodeSigningConfigResponseFromJson(Map<String, dynamic> json) {
  return GetFunctionCodeSigningConfigResponse(
    codeSigningConfigArn: json['CodeSigningConfigArn'] as String,
    functionName: json['FunctionName'] as String,
  );
}

GetFunctionConcurrencyResponse _$GetFunctionConcurrencyResponseFromJson(
    Map<String, dynamic> json) {
  return GetFunctionConcurrencyResponse(
    reservedConcurrentExecutions: json['ReservedConcurrentExecutions'] as int,
  );
}

GetFunctionResponse _$GetFunctionResponseFromJson(Map<String, dynamic> json) {
  return GetFunctionResponse(
    code: json['Code'] == null
        ? null
        : FunctionCodeLocation.fromJson(json['Code'] as Map<String, dynamic>),
    concurrency: json['Concurrency'] == null
        ? null
        : Concurrency.fromJson(json['Concurrency'] as Map<String, dynamic>),
    configuration: json['Configuration'] == null
        ? null
        : FunctionConfiguration.fromJson(
            json['Configuration'] as Map<String, dynamic>),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetLayerVersionPolicyResponse _$GetLayerVersionPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetLayerVersionPolicyResponse(
    policy: json['Policy'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

GetLayerVersionResponse _$GetLayerVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetLayerVersionResponse(
    compatibleRuntimes: (json['CompatibleRuntimes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$RuntimeEnumMap, e))
        ?.toList(),
    content: json['Content'] == null
        ? null
        : LayerVersionContentOutput.fromJson(
            json['Content'] as Map<String, dynamic>),
    createdDate: json['CreatedDate'] as String,
    description: json['Description'] as String,
    layerArn: json['LayerArn'] as String,
    layerVersionArn: json['LayerVersionArn'] as String,
    licenseInfo: json['LicenseInfo'] as String,
    version: json['Version'] as int,
  );
}

GetPolicyResponse _$GetPolicyResponseFromJson(Map<String, dynamic> json) {
  return GetPolicyResponse(
    policy: json['Policy'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

GetProvisionedConcurrencyConfigResponse
    _$GetProvisionedConcurrencyConfigResponseFromJson(
        Map<String, dynamic> json) {
  return GetProvisionedConcurrencyConfigResponse(
    allocatedProvisionedConcurrentExecutions:
        json['AllocatedProvisionedConcurrentExecutions'] as int,
    availableProvisionedConcurrentExecutions:
        json['AvailableProvisionedConcurrentExecutions'] as int,
    lastModified: json['LastModified'] as String,
    requestedProvisionedConcurrentExecutions:
        json['RequestedProvisionedConcurrentExecutions'] as int,
    status: _$enumDecodeNullable(
        _$ProvisionedConcurrencyStatusEnumEnumMap, json['Status']),
    statusReason: json['StatusReason'] as String,
  );
}

const _$ProvisionedConcurrencyStatusEnumEnumMap = {
  ProvisionedConcurrencyStatusEnum.inProgress: 'IN_PROGRESS',
  ProvisionedConcurrencyStatusEnum.ready: 'READY',
  ProvisionedConcurrencyStatusEnum.failed: 'FAILED',
};

ImageConfig _$ImageConfigFromJson(Map<String, dynamic> json) {
  return ImageConfig(
    command: (json['Command'] as List)?.map((e) => e as String)?.toList(),
    entryPoint: (json['EntryPoint'] as List)?.map((e) => e as String)?.toList(),
    workingDirectory: json['WorkingDirectory'] as String,
  );
}

Map<String, dynamic> _$ImageConfigToJson(ImageConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Command', instance.command);
  writeNotNull('EntryPoint', instance.entryPoint);
  writeNotNull('WorkingDirectory', instance.workingDirectory);
  return val;
}

ImageConfigError _$ImageConfigErrorFromJson(Map<String, dynamic> json) {
  return ImageConfigError(
    errorCode: json['ErrorCode'] as String,
    message: json['Message'] as String,
  );
}

ImageConfigResponse _$ImageConfigResponseFromJson(Map<String, dynamic> json) {
  return ImageConfigResponse(
    error: json['Error'] == null
        ? null
        : ImageConfigError.fromJson(json['Error'] as Map<String, dynamic>),
    imageConfig: json['ImageConfig'] == null
        ? null
        : ImageConfig.fromJson(json['ImageConfig'] as Map<String, dynamic>),
  );
}

InvocationResponse _$InvocationResponseFromJson(Map<String, dynamic> json) {
  return InvocationResponse(
    executedVersion: json['X-Amz-Executed-Version'] as String,
    functionError: json['X-Amz-Function-Error'] as String,
    logResult: json['X-Amz-Log-Result'] as String,
    payload: const Uint8ListConverter().fromJson(json['Payload'] as String),
    statusCode: json['StatusCode'] as int,
  );
}

InvokeAsyncResponse _$InvokeAsyncResponseFromJson(Map<String, dynamic> json) {
  return InvokeAsyncResponse(
    status: json['Status'] as int,
  );
}

Layer _$LayerFromJson(Map<String, dynamic> json) {
  return Layer(
    arn: json['Arn'] as String,
    codeSize: json['CodeSize'] as int,
    signingJobArn: json['SigningJobArn'] as String,
    signingProfileVersionArn: json['SigningProfileVersionArn'] as String,
  );
}

Map<String, dynamic> _$LayerVersionContentInputToJson(
    LayerVersionContentInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Bucket', instance.s3Bucket);
  writeNotNull('S3Key', instance.s3Key);
  writeNotNull('S3ObjectVersion', instance.s3ObjectVersion);
  writeNotNull('ZipFile', const Uint8ListConverter().toJson(instance.zipFile));
  return val;
}

LayerVersionContentOutput _$LayerVersionContentOutputFromJson(
    Map<String, dynamic> json) {
  return LayerVersionContentOutput(
    codeSha256: json['CodeSha256'] as String,
    codeSize: json['CodeSize'] as int,
    location: json['Location'] as String,
    signingJobArn: json['SigningJobArn'] as String,
    signingProfileVersionArn: json['SigningProfileVersionArn'] as String,
  );
}

LayerVersionsListItem _$LayerVersionsListItemFromJson(
    Map<String, dynamic> json) {
  return LayerVersionsListItem(
    compatibleRuntimes: (json['CompatibleRuntimes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$RuntimeEnumMap, e))
        ?.toList(),
    createdDate: json['CreatedDate'] as String,
    description: json['Description'] as String,
    layerVersionArn: json['LayerVersionArn'] as String,
    licenseInfo: json['LicenseInfo'] as String,
    version: json['Version'] as int,
  );
}

LayersListItem _$LayersListItemFromJson(Map<String, dynamic> json) {
  return LayersListItem(
    latestMatchingVersion: json['LatestMatchingVersion'] == null
        ? null
        : LayerVersionsListItem.fromJson(
            json['LatestMatchingVersion'] as Map<String, dynamic>),
    layerArn: json['LayerArn'] as String,
    layerName: json['LayerName'] as String,
  );
}

ListAliasesResponse _$ListAliasesResponseFromJson(Map<String, dynamic> json) {
  return ListAliasesResponse(
    aliases: (json['Aliases'] as List)
        ?.map((e) => e == null
            ? null
            : AliasConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListCodeSigningConfigsResponse _$ListCodeSigningConfigsResponseFromJson(
    Map<String, dynamic> json) {
  return ListCodeSigningConfigsResponse(
    codeSigningConfigs: (json['CodeSigningConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : CodeSigningConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListEventSourceMappingsResponse _$ListEventSourceMappingsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEventSourceMappingsResponse(
    eventSourceMappings: (json['EventSourceMappings'] as List)
        ?.map((e) => e == null
            ? null
            : EventSourceMappingConfiguration.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListFunctionEventInvokeConfigsResponse
    _$ListFunctionEventInvokeConfigsResponseFromJson(
        Map<String, dynamic> json) {
  return ListFunctionEventInvokeConfigsResponse(
    functionEventInvokeConfigs: (json['FunctionEventInvokeConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : FunctionEventInvokeConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListFunctionsByCodeSigningConfigResponse
    _$ListFunctionsByCodeSigningConfigResponseFromJson(
        Map<String, dynamic> json) {
  return ListFunctionsByCodeSigningConfigResponse(
    functionArns:
        (json['FunctionArns'] as List)?.map((e) => e as String)?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListFunctionsResponse _$ListFunctionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListFunctionsResponse(
    functions: (json['Functions'] as List)
        ?.map((e) => e == null
            ? null
            : FunctionConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListLayerVersionsResponse _$ListLayerVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLayerVersionsResponse(
    layerVersions: (json['LayerVersions'] as List)
        ?.map((e) => e == null
            ? null
            : LayerVersionsListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListLayersResponse _$ListLayersResponseFromJson(Map<String, dynamic> json) {
  return ListLayersResponse(
    layers: (json['Layers'] as List)
        ?.map((e) => e == null
            ? null
            : LayersListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListProvisionedConcurrencyConfigsResponse
    _$ListProvisionedConcurrencyConfigsResponseFromJson(
        Map<String, dynamic> json) {
  return ListProvisionedConcurrencyConfigsResponse(
    nextMarker: json['NextMarker'] as String,
    provisionedConcurrencyConfigs:
        (json['ProvisionedConcurrencyConfigs'] as List)
            ?.map((e) => e == null
                ? null
                : ProvisionedConcurrencyConfigListItem.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

ListTagsResponse _$ListTagsResponseFromJson(Map<String, dynamic> json) {
  return ListTagsResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListVersionsByFunctionResponse _$ListVersionsByFunctionResponseFromJson(
    Map<String, dynamic> json) {
  return ListVersionsByFunctionResponse(
    nextMarker: json['NextMarker'] as String,
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : FunctionConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OnFailure _$OnFailureFromJson(Map<String, dynamic> json) {
  return OnFailure(
    destination: json['Destination'] as String,
  );
}

Map<String, dynamic> _$OnFailureToJson(OnFailure instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Destination', instance.destination);
  return val;
}

OnSuccess _$OnSuccessFromJson(Map<String, dynamic> json) {
  return OnSuccess(
    destination: json['Destination'] as String,
  );
}

Map<String, dynamic> _$OnSuccessToJson(OnSuccess instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Destination', instance.destination);
  return val;
}

ProvisionedConcurrencyConfigListItem
    _$ProvisionedConcurrencyConfigListItemFromJson(Map<String, dynamic> json) {
  return ProvisionedConcurrencyConfigListItem(
    allocatedProvisionedConcurrentExecutions:
        json['AllocatedProvisionedConcurrentExecutions'] as int,
    availableProvisionedConcurrentExecutions:
        json['AvailableProvisionedConcurrentExecutions'] as int,
    functionArn: json['FunctionArn'] as String,
    lastModified: json['LastModified'] as String,
    requestedProvisionedConcurrentExecutions:
        json['RequestedProvisionedConcurrentExecutions'] as int,
    status: _$enumDecodeNullable(
        _$ProvisionedConcurrencyStatusEnumEnumMap, json['Status']),
    statusReason: json['StatusReason'] as String,
  );
}

PublishLayerVersionResponse _$PublishLayerVersionResponseFromJson(
    Map<String, dynamic> json) {
  return PublishLayerVersionResponse(
    compatibleRuntimes: (json['CompatibleRuntimes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$RuntimeEnumMap, e))
        ?.toList(),
    content: json['Content'] == null
        ? null
        : LayerVersionContentOutput.fromJson(
            json['Content'] as Map<String, dynamic>),
    createdDate: json['CreatedDate'] as String,
    description: json['Description'] as String,
    layerArn: json['LayerArn'] as String,
    layerVersionArn: json['LayerVersionArn'] as String,
    licenseInfo: json['LicenseInfo'] as String,
    version: json['Version'] as int,
  );
}

PutFunctionCodeSigningConfigResponse
    _$PutFunctionCodeSigningConfigResponseFromJson(Map<String, dynamic> json) {
  return PutFunctionCodeSigningConfigResponse(
    codeSigningConfigArn: json['CodeSigningConfigArn'] as String,
    functionName: json['FunctionName'] as String,
  );
}

PutProvisionedConcurrencyConfigResponse
    _$PutProvisionedConcurrencyConfigResponseFromJson(
        Map<String, dynamic> json) {
  return PutProvisionedConcurrencyConfigResponse(
    allocatedProvisionedConcurrentExecutions:
        json['AllocatedProvisionedConcurrentExecutions'] as int,
    availableProvisionedConcurrentExecutions:
        json['AvailableProvisionedConcurrentExecutions'] as int,
    lastModified: json['LastModified'] as String,
    requestedProvisionedConcurrentExecutions:
        json['RequestedProvisionedConcurrentExecutions'] as int,
    status: _$enumDecodeNullable(
        _$ProvisionedConcurrencyStatusEnumEnumMap, json['Status']),
    statusReason: json['StatusReason'] as String,
  );
}

SelfManagedEventSource _$SelfManagedEventSourceFromJson(
    Map<String, dynamic> json) {
  return SelfManagedEventSource(
    endpoints: (json['Endpoints'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$EndPointTypeEnumMap, k),
          (e as List)?.map((e) => e as String)?.toList()),
    ),
  );
}

Map<String, dynamic> _$SelfManagedEventSourceToJson(
    SelfManagedEventSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Endpoints',
      instance.endpoints?.map((k, e) => MapEntry(_$EndPointTypeEnumMap[k], e)));
  return val;
}

const _$EndPointTypeEnumMap = {
  EndPointType.kafkaBootstrapServers: 'KAFKA_BOOTSTRAP_SERVERS',
};

SourceAccessConfiguration _$SourceAccessConfigurationFromJson(
    Map<String, dynamic> json) {
  return SourceAccessConfiguration(
    type: _$enumDecodeNullable(_$SourceAccessTypeEnumMap, json['Type']),
    uri: json['URI'] as String,
  );
}

Map<String, dynamic> _$SourceAccessConfigurationToJson(
    SourceAccessConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$SourceAccessTypeEnumMap[instance.type]);
  writeNotNull('URI', instance.uri);
  return val;
}

const _$SourceAccessTypeEnumMap = {
  SourceAccessType.basicAuth: 'BASIC_AUTH',
  SourceAccessType.vpcSubnet: 'VPC_SUBNET',
  SourceAccessType.vpcSecurityGroup: 'VPC_SECURITY_GROUP',
  SourceAccessType.saslScram_512Auth: 'SASL_SCRAM_512_AUTH',
  SourceAccessType.saslScram_256Auth: 'SASL_SCRAM_256_AUTH',
};

Map<String, dynamic> _$TracingConfigToJson(TracingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Mode', _$TracingModeEnumMap[instance.mode]);
  return val;
}

const _$TracingModeEnumMap = {
  TracingMode.active: 'Active',
  TracingMode.passThrough: 'PassThrough',
};

TracingConfigResponse _$TracingConfigResponseFromJson(
    Map<String, dynamic> json) {
  return TracingConfigResponse(
    mode: _$enumDecodeNullable(_$TracingModeEnumMap, json['Mode']),
  );
}

UpdateCodeSigningConfigResponse _$UpdateCodeSigningConfigResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateCodeSigningConfigResponse(
    codeSigningConfig: json['CodeSigningConfig'] == null
        ? null
        : CodeSigningConfig.fromJson(
            json['CodeSigningConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VpcConfigToJson(VpcConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  return val;
}

VpcConfigResponse _$VpcConfigResponseFromJson(Map<String, dynamic> json) {
  return VpcConfigResponse(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}
