// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lambda-2015-03-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountLimit _$AccountLimitFromJson(Map<String, dynamic> json) {
  return AccountLimit(
    totalCodeSize: json['TotalCodeSize'] as int,
    codeSizeUnzipped: json['CodeSizeUnzipped'] as int,
    codeSizeZipped: json['CodeSizeZipped'] as int,
    concurrentExecutions: json['ConcurrentExecutions'] as int,
    unreservedConcurrentExecutions:
        json['UnreservedConcurrentExecutions'] as int,
  );
}

Map<String, dynamic> _$AccountLimitToJson(AccountLimit instance) =>
    <String, dynamic>{
      'TotalCodeSize': instance.totalCodeSize,
      'CodeSizeUnzipped': instance.codeSizeUnzipped,
      'CodeSizeZipped': instance.codeSizeZipped,
      'ConcurrentExecutions': instance.concurrentExecutions,
      'UnreservedConcurrentExecutions': instance.unreservedConcurrentExecutions,
    };

AccountUsage _$AccountUsageFromJson(Map<String, dynamic> json) {
  return AccountUsage(
    totalCodeSize: json['TotalCodeSize'] as int,
    functionCount: json['FunctionCount'] as int,
  );
}

Map<String, dynamic> _$AccountUsageToJson(AccountUsage instance) =>
    <String, dynamic>{
      'TotalCodeSize': instance.totalCodeSize,
      'FunctionCount': instance.functionCount,
    };

AddLayerVersionPermissionRequest _$AddLayerVersionPermissionRequestFromJson(
    Map<String, dynamic> json) {
  return AddLayerVersionPermissionRequest(
    layerName: json['LayerName'] as String,
    versionNumber: json['VersionNumber'] as int,
    statementId: json['StatementId'] as String,
    action: json['Action'] as String,
    principal: json['Principal'] as String,
    organizationId: json['OrganizationId'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$AddLayerVersionPermissionRequestToJson(
        AddLayerVersionPermissionRequest instance) =>
    <String, dynamic>{
      'LayerName': instance.layerName,
      'VersionNumber': instance.versionNumber,
      'StatementId': instance.statementId,
      'Action': instance.action,
      'Principal': instance.principal,
      'OrganizationId': instance.organizationId,
      'RevisionId': instance.revisionId,
    };

AddLayerVersionPermissionResponse _$AddLayerVersionPermissionResponseFromJson(
    Map<String, dynamic> json) {
  return AddLayerVersionPermissionResponse(
    statement: json['Statement'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$AddLayerVersionPermissionResponseToJson(
        AddLayerVersionPermissionResponse instance) =>
    <String, dynamic>{
      'Statement': instance.statement,
      'RevisionId': instance.revisionId,
    };

AddPermissionRequest _$AddPermissionRequestFromJson(Map<String, dynamic> json) {
  return AddPermissionRequest(
    functionName: json['FunctionName'] as String,
    statementId: json['StatementId'] as String,
    action: json['Action'] as String,
    principal: json['Principal'] as String,
    sourceArn: json['SourceArn'] as String,
    sourceAccount: json['SourceAccount'] as String,
    eventSourceToken: json['EventSourceToken'] as String,
    qualifier: json['Qualifier'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$AddPermissionRequestToJson(
        AddPermissionRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'StatementId': instance.statementId,
      'Action': instance.action,
      'Principal': instance.principal,
      'SourceArn': instance.sourceArn,
      'SourceAccount': instance.sourceAccount,
      'EventSourceToken': instance.eventSourceToken,
      'Qualifier': instance.qualifier,
      'RevisionId': instance.revisionId,
    };

AddPermissionResponse _$AddPermissionResponseFromJson(
    Map<String, dynamic> json) {
  return AddPermissionResponse(
    statement: json['Statement'] as String,
  );
}

Map<String, dynamic> _$AddPermissionResponseToJson(
        AddPermissionResponse instance) =>
    <String, dynamic>{
      'Statement': instance.statement,
    };

AliasConfiguration _$AliasConfigurationFromJson(Map<String, dynamic> json) {
  return AliasConfiguration(
    aliasArn: json['AliasArn'] as String,
    name: json['Name'] as String,
    functionVersion: json['FunctionVersion'] as String,
    description: json['Description'] as String,
    routingConfig: json['RoutingConfig'] == null
        ? null
        : AliasRoutingConfiguration.fromJson(
            json['RoutingConfig'] as Map<String, dynamic>),
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$AliasConfigurationToJson(AliasConfiguration instance) =>
    <String, dynamic>{
      'AliasArn': instance.aliasArn,
      'Name': instance.name,
      'FunctionVersion': instance.functionVersion,
      'Description': instance.description,
      'RoutingConfig': instance.routingConfig,
      'RevisionId': instance.revisionId,
    };

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
        AliasRoutingConfiguration instance) =>
    <String, dynamic>{
      'AdditionalVersionWeights': instance.additionalVersionWeights,
    };

Concurrency _$ConcurrencyFromJson(Map<String, dynamic> json) {
  return Concurrency(
    reservedConcurrentExecutions: json['ReservedConcurrentExecutions'] as int,
  );
}

Map<String, dynamic> _$ConcurrencyToJson(Concurrency instance) =>
    <String, dynamic>{
      'ReservedConcurrentExecutions': instance.reservedConcurrentExecutions,
    };

CreateAliasRequest _$CreateAliasRequestFromJson(Map<String, dynamic> json) {
  return CreateAliasRequest(
    functionName: json['FunctionName'] as String,
    name: json['Name'] as String,
    functionVersion: json['FunctionVersion'] as String,
    description: json['Description'] as String,
    routingConfig: json['RoutingConfig'] == null
        ? null
        : AliasRoutingConfiguration.fromJson(
            json['RoutingConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateAliasRequestToJson(CreateAliasRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Name': instance.name,
      'FunctionVersion': instance.functionVersion,
      'Description': instance.description,
      'RoutingConfig': instance.routingConfig,
    };

CreateEventSourceMappingRequest _$CreateEventSourceMappingRequestFromJson(
    Map<String, dynamic> json) {
  return CreateEventSourceMappingRequest(
    eventSourceArn: json['EventSourceArn'] as String,
    functionName: json['FunctionName'] as String,
    enabled: json['Enabled'] as bool,
    batchSize: json['BatchSize'] as int,
    maximumBatchingWindowInSeconds:
        json['MaximumBatchingWindowInSeconds'] as int,
    startingPosition: json['StartingPosition'] as String,
    startingPositionTimestamp: json['StartingPositionTimestamp'] as String,
  );
}

Map<String, dynamic> _$CreateEventSourceMappingRequestToJson(
        CreateEventSourceMappingRequest instance) =>
    <String, dynamic>{
      'EventSourceArn': instance.eventSourceArn,
      'FunctionName': instance.functionName,
      'Enabled': instance.enabled,
      'BatchSize': instance.batchSize,
      'MaximumBatchingWindowInSeconds': instance.maximumBatchingWindowInSeconds,
      'StartingPosition': instance.startingPosition,
      'StartingPositionTimestamp': instance.startingPositionTimestamp,
    };

CreateFunctionRequest _$CreateFunctionRequestFromJson(
    Map<String, dynamic> json) {
  return CreateFunctionRequest(
    functionName: json['FunctionName'] as String,
    runtime: json['Runtime'] as String,
    role: json['Role'] as String,
    handler: json['Handler'] as String,
    code: json['Code'] == null
        ? null
        : FunctionCode.fromJson(json['Code'] as Map<String, dynamic>),
    description: json['Description'] as String,
    timeout: json['Timeout'] as int,
    memorySize: json['MemorySize'] as int,
    publish: json['Publish'] as bool,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
    deadLetterConfig: json['DeadLetterConfig'] == null
        ? null
        : DeadLetterConfig.fromJson(
            json['DeadLetterConfig'] as Map<String, dynamic>),
    environment: json['Environment'] == null
        ? null
        : Environment.fromJson(json['Environment'] as Map<String, dynamic>),
    kMSKeyArn: json['KMSKeyArn'] as String,
    tracingConfig: json['TracingConfig'] == null
        ? null
        : TracingConfig.fromJson(json['TracingConfig'] as Map<String, dynamic>),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    layers: (json['Layers'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CreateFunctionRequestToJson(
        CreateFunctionRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Runtime': instance.runtime,
      'Role': instance.role,
      'Handler': instance.handler,
      'Code': instance.code,
      'Description': instance.description,
      'Timeout': instance.timeout,
      'MemorySize': instance.memorySize,
      'Publish': instance.publish,
      'VpcConfig': instance.vpcConfig,
      'DeadLetterConfig': instance.deadLetterConfig,
      'Environment': instance.environment,
      'KMSKeyArn': instance.kMSKeyArn,
      'TracingConfig': instance.tracingConfig,
      'Tags': instance.tags,
      'Layers': instance.layers,
    };

DeadLetterConfig _$DeadLetterConfigFromJson(Map<String, dynamic> json) {
  return DeadLetterConfig(
    targetArn: json['TargetArn'] as String,
  );
}

Map<String, dynamic> _$DeadLetterConfigToJson(DeadLetterConfig instance) =>
    <String, dynamic>{
      'TargetArn': instance.targetArn,
    };

DeleteAliasRequest _$DeleteAliasRequestFromJson(Map<String, dynamic> json) {
  return DeleteAliasRequest(
    functionName: json['FunctionName'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$DeleteAliasRequestToJson(DeleteAliasRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Name': instance.name,
    };

DeleteEventSourceMappingRequest _$DeleteEventSourceMappingRequestFromJson(
    Map<String, dynamic> json) {
  return DeleteEventSourceMappingRequest(
    uUID: json['UUID'] as String,
  );
}

Map<String, dynamic> _$DeleteEventSourceMappingRequestToJson(
        DeleteEventSourceMappingRequest instance) =>
    <String, dynamic>{
      'UUID': instance.uUID,
    };

DeleteFunctionConcurrencyRequest _$DeleteFunctionConcurrencyRequestFromJson(
    Map<String, dynamic> json) {
  return DeleteFunctionConcurrencyRequest(
    functionName: json['FunctionName'] as String,
  );
}

Map<String, dynamic> _$DeleteFunctionConcurrencyRequestToJson(
        DeleteFunctionConcurrencyRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
    };

DeleteFunctionRequest _$DeleteFunctionRequestFromJson(
    Map<String, dynamic> json) {
  return DeleteFunctionRequest(
    functionName: json['FunctionName'] as String,
    qualifier: json['Qualifier'] as String,
  );
}

Map<String, dynamic> _$DeleteFunctionRequestToJson(
        DeleteFunctionRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Qualifier': instance.qualifier,
    };

DeleteLayerVersionRequest _$DeleteLayerVersionRequestFromJson(
    Map<String, dynamic> json) {
  return DeleteLayerVersionRequest(
    layerName: json['LayerName'] as String,
    versionNumber: json['VersionNumber'] as int,
  );
}

Map<String, dynamic> _$DeleteLayerVersionRequestToJson(
        DeleteLayerVersionRequest instance) =>
    <String, dynamic>{
      'LayerName': instance.layerName,
      'VersionNumber': instance.versionNumber,
    };

Environment _$EnvironmentFromJson(Map<String, dynamic> json) {
  return Environment(
    variables: (json['Variables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$EnvironmentToJson(Environment instance) =>
    <String, dynamic>{
      'Variables': instance.variables,
    };

EnvironmentError _$EnvironmentErrorFromJson(Map<String, dynamic> json) {
  return EnvironmentError(
    errorCode: json['ErrorCode'] as String,
    message: json['Message'] as String,
  );
}

Map<String, dynamic> _$EnvironmentErrorToJson(EnvironmentError instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
    };

EnvironmentResponse _$EnvironmentResponseFromJson(Map<String, dynamic> json) {
  return EnvironmentResponse(
    variables: (json['Variables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    error: json['Error'] == null
        ? null
        : EnvironmentError.fromJson(json['Error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EnvironmentResponseToJson(
        EnvironmentResponse instance) =>
    <String, dynamic>{
      'Variables': instance.variables,
      'Error': instance.error,
    };

EventSourceMappingConfiguration _$EventSourceMappingConfigurationFromJson(
    Map<String, dynamic> json) {
  return EventSourceMappingConfiguration(
    uUID: json['UUID'] as String,
    batchSize: json['BatchSize'] as int,
    maximumBatchingWindowInSeconds:
        json['MaximumBatchingWindowInSeconds'] as int,
    eventSourceArn: json['EventSourceArn'] as String,
    functionArn: json['FunctionArn'] as String,
    lastModified: json['LastModified'] as String,
    lastProcessingResult: json['LastProcessingResult'] as String,
    state: json['State'] as String,
    stateTransitionReason: json['StateTransitionReason'] as String,
  );
}

Map<String, dynamic> _$EventSourceMappingConfigurationToJson(
        EventSourceMappingConfiguration instance) =>
    <String, dynamic>{
      'UUID': instance.uUID,
      'BatchSize': instance.batchSize,
      'MaximumBatchingWindowInSeconds': instance.maximumBatchingWindowInSeconds,
      'EventSourceArn': instance.eventSourceArn,
      'FunctionArn': instance.functionArn,
      'LastModified': instance.lastModified,
      'LastProcessingResult': instance.lastProcessingResult,
      'State': instance.state,
      'StateTransitionReason': instance.stateTransitionReason,
    };

FunctionCode _$FunctionCodeFromJson(Map<String, dynamic> json) {
  return FunctionCode(
    zipFile: const Base64Converter().fromJson(json['ZipFile'] as String),
    s3Bucket: json['S3Bucket'] as String,
    s3Key: json['S3Key'] as String,
    s3ObjectVersion: json['S3ObjectVersion'] as String,
  );
}

Map<String, dynamic> _$FunctionCodeToJson(FunctionCode instance) =>
    <String, dynamic>{
      'ZipFile': const Base64Converter().toJson(instance.zipFile),
      'S3Bucket': instance.s3Bucket,
      'S3Key': instance.s3Key,
      'S3ObjectVersion': instance.s3ObjectVersion,
    };

FunctionCodeLocation _$FunctionCodeLocationFromJson(Map<String, dynamic> json) {
  return FunctionCodeLocation(
    repositoryType: json['RepositoryType'] as String,
    location: json['Location'] as String,
  );
}

Map<String, dynamic> _$FunctionCodeLocationToJson(
        FunctionCodeLocation instance) =>
    <String, dynamic>{
      'RepositoryType': instance.repositoryType,
      'Location': instance.location,
    };

FunctionConfiguration _$FunctionConfigurationFromJson(
    Map<String, dynamic> json) {
  return FunctionConfiguration(
    functionName: json['FunctionName'] as String,
    functionArn: json['FunctionArn'] as String,
    runtime: json['Runtime'] as String,
    role: json['Role'] as String,
    handler: json['Handler'] as String,
    codeSize: json['CodeSize'] as int,
    description: json['Description'] as String,
    timeout: json['Timeout'] as int,
    memorySize: json['MemorySize'] as int,
    lastModified: json['LastModified'] as String,
    codeSha256: json['CodeSha256'] as String,
    version: json['Version'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfigResponse.fromJson(json['VpcConfig'] as Map<String, dynamic>),
    deadLetterConfig: json['DeadLetterConfig'] == null
        ? null
        : DeadLetterConfig.fromJson(
            json['DeadLetterConfig'] as Map<String, dynamic>),
    environment: json['Environment'] == null
        ? null
        : EnvironmentResponse.fromJson(
            json['Environment'] as Map<String, dynamic>),
    kMSKeyArn: json['KMSKeyArn'] as String,
    tracingConfig: json['TracingConfig'] == null
        ? null
        : TracingConfigResponse.fromJson(
            json['TracingConfig'] as Map<String, dynamic>),
    masterArn: json['MasterArn'] as String,
    revisionId: json['RevisionId'] as String,
    layers: (json['Layers'] as List)
        ?.map(
            (e) => e == null ? null : Layer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FunctionConfigurationToJson(
        FunctionConfiguration instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'FunctionArn': instance.functionArn,
      'Runtime': instance.runtime,
      'Role': instance.role,
      'Handler': instance.handler,
      'CodeSize': instance.codeSize,
      'Description': instance.description,
      'Timeout': instance.timeout,
      'MemorySize': instance.memorySize,
      'LastModified': instance.lastModified,
      'CodeSha256': instance.codeSha256,
      'Version': instance.version,
      'VpcConfig': instance.vpcConfig,
      'DeadLetterConfig': instance.deadLetterConfig,
      'Environment': instance.environment,
      'KMSKeyArn': instance.kMSKeyArn,
      'TracingConfig': instance.tracingConfig,
      'MasterArn': instance.masterArn,
      'RevisionId': instance.revisionId,
      'Layers': instance.layers,
    };

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

Map<String, dynamic> _$GetAccountSettingsResponseToJson(
        GetAccountSettingsResponse instance) =>
    <String, dynamic>{
      'AccountLimit': instance.accountLimit,
      'AccountUsage': instance.accountUsage,
    };

GetAliasRequest _$GetAliasRequestFromJson(Map<String, dynamic> json) {
  return GetAliasRequest(
    functionName: json['FunctionName'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$GetAliasRequestToJson(GetAliasRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Name': instance.name,
    };

GetEventSourceMappingRequest _$GetEventSourceMappingRequestFromJson(
    Map<String, dynamic> json) {
  return GetEventSourceMappingRequest(
    uUID: json['UUID'] as String,
  );
}

Map<String, dynamic> _$GetEventSourceMappingRequestToJson(
        GetEventSourceMappingRequest instance) =>
    <String, dynamic>{
      'UUID': instance.uUID,
    };

GetFunctionConfigurationRequest _$GetFunctionConfigurationRequestFromJson(
    Map<String, dynamic> json) {
  return GetFunctionConfigurationRequest(
    functionName: json['FunctionName'] as String,
    qualifier: json['Qualifier'] as String,
  );
}

Map<String, dynamic> _$GetFunctionConfigurationRequestToJson(
        GetFunctionConfigurationRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Qualifier': instance.qualifier,
    };

GetFunctionRequest _$GetFunctionRequestFromJson(Map<String, dynamic> json) {
  return GetFunctionRequest(
    functionName: json['FunctionName'] as String,
    qualifier: json['Qualifier'] as String,
  );
}

Map<String, dynamic> _$GetFunctionRequestToJson(GetFunctionRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Qualifier': instance.qualifier,
    };

GetFunctionResponse _$GetFunctionResponseFromJson(Map<String, dynamic> json) {
  return GetFunctionResponse(
    configuration: json['Configuration'] == null
        ? null
        : FunctionConfiguration.fromJson(
            json['Configuration'] as Map<String, dynamic>),
    code: json['Code'] == null
        ? null
        : FunctionCodeLocation.fromJson(json['Code'] as Map<String, dynamic>),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    concurrency: json['Concurrency'] == null
        ? null
        : Concurrency.fromJson(json['Concurrency'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetFunctionResponseToJson(
        GetFunctionResponse instance) =>
    <String, dynamic>{
      'Configuration': instance.configuration,
      'Code': instance.code,
      'Tags': instance.tags,
      'Concurrency': instance.concurrency,
    };

GetLayerVersionByArnRequest _$GetLayerVersionByArnRequestFromJson(
    Map<String, dynamic> json) {
  return GetLayerVersionByArnRequest(
    arn: json['Arn'] as String,
  );
}

Map<String, dynamic> _$GetLayerVersionByArnRequestToJson(
        GetLayerVersionByArnRequest instance) =>
    <String, dynamic>{
      'Arn': instance.arn,
    };

GetLayerVersionPolicyRequest _$GetLayerVersionPolicyRequestFromJson(
    Map<String, dynamic> json) {
  return GetLayerVersionPolicyRequest(
    layerName: json['LayerName'] as String,
    versionNumber: json['VersionNumber'] as int,
  );
}

Map<String, dynamic> _$GetLayerVersionPolicyRequestToJson(
        GetLayerVersionPolicyRequest instance) =>
    <String, dynamic>{
      'LayerName': instance.layerName,
      'VersionNumber': instance.versionNumber,
    };

GetLayerVersionPolicyResponse _$GetLayerVersionPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetLayerVersionPolicyResponse(
    policy: json['Policy'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$GetLayerVersionPolicyResponseToJson(
        GetLayerVersionPolicyResponse instance) =>
    <String, dynamic>{
      'Policy': instance.policy,
      'RevisionId': instance.revisionId,
    };

GetLayerVersionRequest _$GetLayerVersionRequestFromJson(
    Map<String, dynamic> json) {
  return GetLayerVersionRequest(
    layerName: json['LayerName'] as String,
    versionNumber: json['VersionNumber'] as int,
  );
}

Map<String, dynamic> _$GetLayerVersionRequestToJson(
        GetLayerVersionRequest instance) =>
    <String, dynamic>{
      'LayerName': instance.layerName,
      'VersionNumber': instance.versionNumber,
    };

GetLayerVersionResponse _$GetLayerVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetLayerVersionResponse(
    content: json['Content'] == null
        ? null
        : LayerVersionContentOutput.fromJson(
            json['Content'] as Map<String, dynamic>),
    layerArn: json['LayerArn'] as String,
    layerVersionArn: json['LayerVersionArn'] as String,
    description: json['Description'] as String,
    createdDate: json['CreatedDate'] as String,
    version: json['Version'] as int,
    compatibleRuntimes:
        (json['CompatibleRuntimes'] as List)?.map((e) => e as String)?.toList(),
    licenseInfo: json['LicenseInfo'] as String,
  );
}

Map<String, dynamic> _$GetLayerVersionResponseToJson(
        GetLayerVersionResponse instance) =>
    <String, dynamic>{
      'Content': instance.content,
      'LayerArn': instance.layerArn,
      'LayerVersionArn': instance.layerVersionArn,
      'Description': instance.description,
      'CreatedDate': instance.createdDate,
      'Version': instance.version,
      'CompatibleRuntimes': instance.compatibleRuntimes,
      'LicenseInfo': instance.licenseInfo,
    };

GetPolicyRequest _$GetPolicyRequestFromJson(Map<String, dynamic> json) {
  return GetPolicyRequest(
    functionName: json['FunctionName'] as String,
    qualifier: json['Qualifier'] as String,
  );
}

Map<String, dynamic> _$GetPolicyRequestToJson(GetPolicyRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Qualifier': instance.qualifier,
    };

GetPolicyResponse _$GetPolicyResponseFromJson(Map<String, dynamic> json) {
  return GetPolicyResponse(
    policy: json['Policy'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$GetPolicyResponseToJson(GetPolicyResponse instance) =>
    <String, dynamic>{
      'Policy': instance.policy,
      'RevisionId': instance.revisionId,
    };

InvocationRequest _$InvocationRequestFromJson(Map<String, dynamic> json) {
  return InvocationRequest(
    functionName: json['FunctionName'] as String,
    invocationType: json['InvocationType'] as String,
    logType: json['LogType'] as String,
    clientContext: json['ClientContext'] as String,
    payload: const Base64Converter().fromJson(json['Payload'] as String),
    qualifier: json['Qualifier'] as String,
  );
}

Map<String, dynamic> _$InvocationRequestToJson(InvocationRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'InvocationType': instance.invocationType,
      'LogType': instance.logType,
      'ClientContext': instance.clientContext,
      'Payload': const Base64Converter().toJson(instance.payload),
      'Qualifier': instance.qualifier,
    };

InvocationResponse _$InvocationResponseFromJson(Map<String, dynamic> json) {
  return InvocationResponse(
    statusCode: json['StatusCode'] as int,
    functionError: json['FunctionError'] as String,
    logResult: json['LogResult'] as String,
    payload: const Base64Converter().fromJson(json['Payload'] as String),
    executedVersion: json['ExecutedVersion'] as String,
  );
}

Map<String, dynamic> _$InvocationResponseToJson(InvocationResponse instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'FunctionError': instance.functionError,
      'LogResult': instance.logResult,
      'Payload': const Base64Converter().toJson(instance.payload),
      'ExecutedVersion': instance.executedVersion,
    };

InvokeAsyncRequest _$InvokeAsyncRequestFromJson(Map<String, dynamic> json) {
  return InvokeAsyncRequest(
    functionName: json['FunctionName'] as String,
    invokeArgs: const Base64Converter().fromJson(json['InvokeArgs'] as String),
  );
}

Map<String, dynamic> _$InvokeAsyncRequestToJson(InvokeAsyncRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'InvokeArgs': const Base64Converter().toJson(instance.invokeArgs),
    };

InvokeAsyncResponse _$InvokeAsyncResponseFromJson(Map<String, dynamic> json) {
  return InvokeAsyncResponse(
    status: json['Status'] as int,
  );
}

Map<String, dynamic> _$InvokeAsyncResponseToJson(
        InvokeAsyncResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
    };

Layer _$LayerFromJson(Map<String, dynamic> json) {
  return Layer(
    arn: json['Arn'] as String,
    codeSize: json['CodeSize'] as int,
  );
}

Map<String, dynamic> _$LayerToJson(Layer instance) => <String, dynamic>{
      'Arn': instance.arn,
      'CodeSize': instance.codeSize,
    };

LayerVersionContentInput _$LayerVersionContentInputFromJson(
    Map<String, dynamic> json) {
  return LayerVersionContentInput(
    s3Bucket: json['S3Bucket'] as String,
    s3Key: json['S3Key'] as String,
    s3ObjectVersion: json['S3ObjectVersion'] as String,
    zipFile: const Base64Converter().fromJson(json['ZipFile'] as String),
  );
}

Map<String, dynamic> _$LayerVersionContentInputToJson(
        LayerVersionContentInput instance) =>
    <String, dynamic>{
      'S3Bucket': instance.s3Bucket,
      'S3Key': instance.s3Key,
      'S3ObjectVersion': instance.s3ObjectVersion,
      'ZipFile': const Base64Converter().toJson(instance.zipFile),
    };

LayerVersionContentOutput _$LayerVersionContentOutputFromJson(
    Map<String, dynamic> json) {
  return LayerVersionContentOutput(
    location: json['Location'] as String,
    codeSha256: json['CodeSha256'] as String,
    codeSize: json['CodeSize'] as int,
  );
}

Map<String, dynamic> _$LayerVersionContentOutputToJson(
        LayerVersionContentOutput instance) =>
    <String, dynamic>{
      'Location': instance.location,
      'CodeSha256': instance.codeSha256,
      'CodeSize': instance.codeSize,
    };

LayerVersionsListItem _$LayerVersionsListItemFromJson(
    Map<String, dynamic> json) {
  return LayerVersionsListItem(
    layerVersionArn: json['LayerVersionArn'] as String,
    version: json['Version'] as int,
    description: json['Description'] as String,
    createdDate: json['CreatedDate'] as String,
    compatibleRuntimes:
        (json['CompatibleRuntimes'] as List)?.map((e) => e as String)?.toList(),
    licenseInfo: json['LicenseInfo'] as String,
  );
}

Map<String, dynamic> _$LayerVersionsListItemToJson(
        LayerVersionsListItem instance) =>
    <String, dynamic>{
      'LayerVersionArn': instance.layerVersionArn,
      'Version': instance.version,
      'Description': instance.description,
      'CreatedDate': instance.createdDate,
      'CompatibleRuntimes': instance.compatibleRuntimes,
      'LicenseInfo': instance.licenseInfo,
    };

LayersListItem _$LayersListItemFromJson(Map<String, dynamic> json) {
  return LayersListItem(
    layerName: json['LayerName'] as String,
    layerArn: json['LayerArn'] as String,
    latestMatchingVersion: json['LatestMatchingVersion'] == null
        ? null
        : LayerVersionsListItem.fromJson(
            json['LatestMatchingVersion'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LayersListItemToJson(LayersListItem instance) =>
    <String, dynamic>{
      'LayerName': instance.layerName,
      'LayerArn': instance.layerArn,
      'LatestMatchingVersion': instance.latestMatchingVersion,
    };

ListAliasesRequest _$ListAliasesRequestFromJson(Map<String, dynamic> json) {
  return ListAliasesRequest(
    functionName: json['FunctionName'] as String,
    functionVersion: json['FunctionVersion'] as String,
    marker: json['Marker'] as String,
    maxItems: json['MaxItems'] as int,
  );
}

Map<String, dynamic> _$ListAliasesRequestToJson(ListAliasesRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'FunctionVersion': instance.functionVersion,
      'Marker': instance.marker,
      'MaxItems': instance.maxItems,
    };

ListAliasesResponse _$ListAliasesResponseFromJson(Map<String, dynamic> json) {
  return ListAliasesResponse(
    nextMarker: json['NextMarker'] as String,
    aliases: (json['Aliases'] as List)
        ?.map((e) => e == null
            ? null
            : AliasConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListAliasesResponseToJson(
        ListAliasesResponse instance) =>
    <String, dynamic>{
      'NextMarker': instance.nextMarker,
      'Aliases': instance.aliases,
    };

ListEventSourceMappingsRequest _$ListEventSourceMappingsRequestFromJson(
    Map<String, dynamic> json) {
  return ListEventSourceMappingsRequest(
    eventSourceArn: json['EventSourceArn'] as String,
    functionName: json['FunctionName'] as String,
    marker: json['Marker'] as String,
    maxItems: json['MaxItems'] as int,
  );
}

Map<String, dynamic> _$ListEventSourceMappingsRequestToJson(
        ListEventSourceMappingsRequest instance) =>
    <String, dynamic>{
      'EventSourceArn': instance.eventSourceArn,
      'FunctionName': instance.functionName,
      'Marker': instance.marker,
      'MaxItems': instance.maxItems,
    };

ListEventSourceMappingsResponse _$ListEventSourceMappingsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEventSourceMappingsResponse(
    nextMarker: json['NextMarker'] as String,
    eventSourceMappings: (json['EventSourceMappings'] as List)
        ?.map((e) => e == null
            ? null
            : EventSourceMappingConfiguration.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListEventSourceMappingsResponseToJson(
        ListEventSourceMappingsResponse instance) =>
    <String, dynamic>{
      'NextMarker': instance.nextMarker,
      'EventSourceMappings': instance.eventSourceMappings,
    };

ListFunctionsRequest _$ListFunctionsRequestFromJson(Map<String, dynamic> json) {
  return ListFunctionsRequest(
    masterRegion: json['MasterRegion'] as String,
    functionVersion: json['FunctionVersion'] as String,
    marker: json['Marker'] as String,
    maxItems: json['MaxItems'] as int,
  );
}

Map<String, dynamic> _$ListFunctionsRequestToJson(
        ListFunctionsRequest instance) =>
    <String, dynamic>{
      'MasterRegion': instance.masterRegion,
      'FunctionVersion': instance.functionVersion,
      'Marker': instance.marker,
      'MaxItems': instance.maxItems,
    };

ListFunctionsResponse _$ListFunctionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListFunctionsResponse(
    nextMarker: json['NextMarker'] as String,
    functions: (json['Functions'] as List)
        ?.map((e) => e == null
            ? null
            : FunctionConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListFunctionsResponseToJson(
        ListFunctionsResponse instance) =>
    <String, dynamic>{
      'NextMarker': instance.nextMarker,
      'Functions': instance.functions,
    };

ListLayerVersionsRequest _$ListLayerVersionsRequestFromJson(
    Map<String, dynamic> json) {
  return ListLayerVersionsRequest(
    layerName: json['LayerName'] as String,
    compatibleRuntime: json['CompatibleRuntime'] as String,
    marker: json['Marker'] as String,
    maxItems: json['MaxItems'] as int,
  );
}

Map<String, dynamic> _$ListLayerVersionsRequestToJson(
        ListLayerVersionsRequest instance) =>
    <String, dynamic>{
      'LayerName': instance.layerName,
      'CompatibleRuntime': instance.compatibleRuntime,
      'Marker': instance.marker,
      'MaxItems': instance.maxItems,
    };

ListLayerVersionsResponse _$ListLayerVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLayerVersionsResponse(
    nextMarker: json['NextMarker'] as String,
    layerVersions: (json['LayerVersions'] as List)
        ?.map((e) => e == null
            ? null
            : LayerVersionsListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListLayerVersionsResponseToJson(
        ListLayerVersionsResponse instance) =>
    <String, dynamic>{
      'NextMarker': instance.nextMarker,
      'LayerVersions': instance.layerVersions,
    };

ListLayersRequest _$ListLayersRequestFromJson(Map<String, dynamic> json) {
  return ListLayersRequest(
    compatibleRuntime: json['CompatibleRuntime'] as String,
    marker: json['Marker'] as String,
    maxItems: json['MaxItems'] as int,
  );
}

Map<String, dynamic> _$ListLayersRequestToJson(ListLayersRequest instance) =>
    <String, dynamic>{
      'CompatibleRuntime': instance.compatibleRuntime,
      'Marker': instance.marker,
      'MaxItems': instance.maxItems,
    };

ListLayersResponse _$ListLayersResponseFromJson(Map<String, dynamic> json) {
  return ListLayersResponse(
    nextMarker: json['NextMarker'] as String,
    layers: (json['Layers'] as List)
        ?.map((e) => e == null
            ? null
            : LayersListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListLayersResponseToJson(ListLayersResponse instance) =>
    <String, dynamic>{
      'NextMarker': instance.nextMarker,
      'Layers': instance.layers,
    };

ListTagsRequest _$ListTagsRequestFromJson(Map<String, dynamic> json) {
  return ListTagsRequest(
    resource: json['Resource'] as String,
  );
}

Map<String, dynamic> _$ListTagsRequestToJson(ListTagsRequest instance) =>
    <String, dynamic>{
      'Resource': instance.resource,
    };

ListTagsResponse _$ListTagsResponseFromJson(Map<String, dynamic> json) {
  return ListTagsResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ListTagsResponseToJson(ListTagsResponse instance) =>
    <String, dynamic>{
      'Tags': instance.tags,
    };

ListVersionsByFunctionRequest _$ListVersionsByFunctionRequestFromJson(
    Map<String, dynamic> json) {
  return ListVersionsByFunctionRequest(
    functionName: json['FunctionName'] as String,
    marker: json['Marker'] as String,
    maxItems: json['MaxItems'] as int,
  );
}

Map<String, dynamic> _$ListVersionsByFunctionRequestToJson(
        ListVersionsByFunctionRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Marker': instance.marker,
      'MaxItems': instance.maxItems,
    };

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

Map<String, dynamic> _$ListVersionsByFunctionResponseToJson(
        ListVersionsByFunctionResponse instance) =>
    <String, dynamic>{
      'NextMarker': instance.nextMarker,
      'Versions': instance.versions,
    };

PublishLayerVersionRequest _$PublishLayerVersionRequestFromJson(
    Map<String, dynamic> json) {
  return PublishLayerVersionRequest(
    layerName: json['LayerName'] as String,
    content: json['Content'] == null
        ? null
        : LayerVersionContentInput.fromJson(
            json['Content'] as Map<String, dynamic>),
    description: json['Description'] as String,
    compatibleRuntimes:
        (json['CompatibleRuntimes'] as List)?.map((e) => e as String)?.toList(),
    licenseInfo: json['LicenseInfo'] as String,
  );
}

Map<String, dynamic> _$PublishLayerVersionRequestToJson(
        PublishLayerVersionRequest instance) =>
    <String, dynamic>{
      'LayerName': instance.layerName,
      'Content': instance.content,
      'Description': instance.description,
      'CompatibleRuntimes': instance.compatibleRuntimes,
      'LicenseInfo': instance.licenseInfo,
    };

PublishLayerVersionResponse _$PublishLayerVersionResponseFromJson(
    Map<String, dynamic> json) {
  return PublishLayerVersionResponse(
    content: json['Content'] == null
        ? null
        : LayerVersionContentOutput.fromJson(
            json['Content'] as Map<String, dynamic>),
    layerArn: json['LayerArn'] as String,
    layerVersionArn: json['LayerVersionArn'] as String,
    description: json['Description'] as String,
    createdDate: json['CreatedDate'] as String,
    version: json['Version'] as int,
    compatibleRuntimes:
        (json['CompatibleRuntimes'] as List)?.map((e) => e as String)?.toList(),
    licenseInfo: json['LicenseInfo'] as String,
  );
}

Map<String, dynamic> _$PublishLayerVersionResponseToJson(
        PublishLayerVersionResponse instance) =>
    <String, dynamic>{
      'Content': instance.content,
      'LayerArn': instance.layerArn,
      'LayerVersionArn': instance.layerVersionArn,
      'Description': instance.description,
      'CreatedDate': instance.createdDate,
      'Version': instance.version,
      'CompatibleRuntimes': instance.compatibleRuntimes,
      'LicenseInfo': instance.licenseInfo,
    };

PublishVersionRequest _$PublishVersionRequestFromJson(
    Map<String, dynamic> json) {
  return PublishVersionRequest(
    functionName: json['FunctionName'] as String,
    codeSha256: json['CodeSha256'] as String,
    description: json['Description'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$PublishVersionRequestToJson(
        PublishVersionRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'CodeSha256': instance.codeSha256,
      'Description': instance.description,
      'RevisionId': instance.revisionId,
    };

PutFunctionConcurrencyRequest _$PutFunctionConcurrencyRequestFromJson(
    Map<String, dynamic> json) {
  return PutFunctionConcurrencyRequest(
    functionName: json['FunctionName'] as String,
    reservedConcurrentExecutions: json['ReservedConcurrentExecutions'] as int,
  );
}

Map<String, dynamic> _$PutFunctionConcurrencyRequestToJson(
        PutFunctionConcurrencyRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'ReservedConcurrentExecutions': instance.reservedConcurrentExecutions,
    };

RemoveLayerVersionPermissionRequest
    _$RemoveLayerVersionPermissionRequestFromJson(Map<String, dynamic> json) {
  return RemoveLayerVersionPermissionRequest(
    layerName: json['LayerName'] as String,
    versionNumber: json['VersionNumber'] as int,
    statementId: json['StatementId'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$RemoveLayerVersionPermissionRequestToJson(
        RemoveLayerVersionPermissionRequest instance) =>
    <String, dynamic>{
      'LayerName': instance.layerName,
      'VersionNumber': instance.versionNumber,
      'StatementId': instance.statementId,
      'RevisionId': instance.revisionId,
    };

RemovePermissionRequest _$RemovePermissionRequestFromJson(
    Map<String, dynamic> json) {
  return RemovePermissionRequest(
    functionName: json['FunctionName'] as String,
    statementId: json['StatementId'] as String,
    qualifier: json['Qualifier'] as String,
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$RemovePermissionRequestToJson(
        RemovePermissionRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'StatementId': instance.statementId,
      'Qualifier': instance.qualifier,
      'RevisionId': instance.revisionId,
    };

TagResourceRequest _$TagResourceRequestFromJson(Map<String, dynamic> json) {
  return TagResourceRequest(
    resource: json['Resource'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) =>
    <String, dynamic>{
      'Resource': instance.resource,
      'Tags': instance.tags,
    };

TracingConfig _$TracingConfigFromJson(Map<String, dynamic> json) {
  return TracingConfig(
    mode: json['Mode'] as String,
  );
}

Map<String, dynamic> _$TracingConfigToJson(TracingConfig instance) =>
    <String, dynamic>{
      'Mode': instance.mode,
    };

TracingConfigResponse _$TracingConfigResponseFromJson(
    Map<String, dynamic> json) {
  return TracingConfigResponse(
    mode: json['Mode'] as String,
  );
}

Map<String, dynamic> _$TracingConfigResponseToJson(
        TracingConfigResponse instance) =>
    <String, dynamic>{
      'Mode': instance.mode,
    };

UntagResourceRequest _$UntagResourceRequestFromJson(Map<String, dynamic> json) {
  return UntagResourceRequest(
    resource: json['Resource'] as String,
    tagKeys: (json['TagKeys'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UntagResourceRequestToJson(
        UntagResourceRequest instance) =>
    <String, dynamic>{
      'Resource': instance.resource,
      'TagKeys': instance.tagKeys,
    };

UpdateAliasRequest _$UpdateAliasRequestFromJson(Map<String, dynamic> json) {
  return UpdateAliasRequest(
    functionName: json['FunctionName'] as String,
    name: json['Name'] as String,
    functionVersion: json['FunctionVersion'] as String,
    description: json['Description'] as String,
    routingConfig: json['RoutingConfig'] == null
        ? null
        : AliasRoutingConfiguration.fromJson(
            json['RoutingConfig'] as Map<String, dynamic>),
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$UpdateAliasRequestToJson(UpdateAliasRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Name': instance.name,
      'FunctionVersion': instance.functionVersion,
      'Description': instance.description,
      'RoutingConfig': instance.routingConfig,
      'RevisionId': instance.revisionId,
    };

UpdateEventSourceMappingRequest _$UpdateEventSourceMappingRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateEventSourceMappingRequest(
    uUID: json['UUID'] as String,
    functionName: json['FunctionName'] as String,
    enabled: json['Enabled'] as bool,
    batchSize: json['BatchSize'] as int,
    maximumBatchingWindowInSeconds:
        json['MaximumBatchingWindowInSeconds'] as int,
  );
}

Map<String, dynamic> _$UpdateEventSourceMappingRequestToJson(
        UpdateEventSourceMappingRequest instance) =>
    <String, dynamic>{
      'UUID': instance.uUID,
      'FunctionName': instance.functionName,
      'Enabled': instance.enabled,
      'BatchSize': instance.batchSize,
      'MaximumBatchingWindowInSeconds': instance.maximumBatchingWindowInSeconds,
    };

UpdateFunctionCodeRequest _$UpdateFunctionCodeRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateFunctionCodeRequest(
    functionName: json['FunctionName'] as String,
    zipFile: const Base64Converter().fromJson(json['ZipFile'] as String),
    s3Bucket: json['S3Bucket'] as String,
    s3Key: json['S3Key'] as String,
    s3ObjectVersion: json['S3ObjectVersion'] as String,
    publish: json['Publish'] as bool,
    dryRun: json['DryRun'] as bool,
    revisionId: json['RevisionId'] as String,
  );
}

Map<String, dynamic> _$UpdateFunctionCodeRequestToJson(
        UpdateFunctionCodeRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'ZipFile': const Base64Converter().toJson(instance.zipFile),
      'S3Bucket': instance.s3Bucket,
      'S3Key': instance.s3Key,
      'S3ObjectVersion': instance.s3ObjectVersion,
      'Publish': instance.publish,
      'DryRun': instance.dryRun,
      'RevisionId': instance.revisionId,
    };

UpdateFunctionConfigurationRequest _$UpdateFunctionConfigurationRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateFunctionConfigurationRequest(
    functionName: json['FunctionName'] as String,
    role: json['Role'] as String,
    handler: json['Handler'] as String,
    description: json['Description'] as String,
    timeout: json['Timeout'] as int,
    memorySize: json['MemorySize'] as int,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
    environment: json['Environment'] == null
        ? null
        : Environment.fromJson(json['Environment'] as Map<String, dynamic>),
    runtime: json['Runtime'] as String,
    deadLetterConfig: json['DeadLetterConfig'] == null
        ? null
        : DeadLetterConfig.fromJson(
            json['DeadLetterConfig'] as Map<String, dynamic>),
    kMSKeyArn: json['KMSKeyArn'] as String,
    tracingConfig: json['TracingConfig'] == null
        ? null
        : TracingConfig.fromJson(json['TracingConfig'] as Map<String, dynamic>),
    revisionId: json['RevisionId'] as String,
    layers: (json['Layers'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UpdateFunctionConfigurationRequestToJson(
        UpdateFunctionConfigurationRequest instance) =>
    <String, dynamic>{
      'FunctionName': instance.functionName,
      'Role': instance.role,
      'Handler': instance.handler,
      'Description': instance.description,
      'Timeout': instance.timeout,
      'MemorySize': instance.memorySize,
      'VpcConfig': instance.vpcConfig,
      'Environment': instance.environment,
      'Runtime': instance.runtime,
      'DeadLetterConfig': instance.deadLetterConfig,
      'KMSKeyArn': instance.kMSKeyArn,
      'TracingConfig': instance.tracingConfig,
      'RevisionId': instance.revisionId,
      'Layers': instance.layers,
    };

VpcConfig _$VpcConfigFromJson(Map<String, dynamic> json) {
  return VpcConfig(
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$VpcConfigToJson(VpcConfig instance) => <String, dynamic>{
      'SubnetIds': instance.subnetIds,
      'SecurityGroupIds': instance.securityGroupIds,
    };

VpcConfigResponse _$VpcConfigResponseFromJson(Map<String, dynamic> json) {
  return VpcConfigResponse(
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$VpcConfigResponseToJson(VpcConfigResponse instance) =>
    <String, dynamic>{
      'SubnetIds': instance.subnetIds,
      'SecurityGroupIds': instance.securityGroupIds,
      'VpcId': instance.vpcId,
    };
