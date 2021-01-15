// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-06-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchDeleteWorldsResponse _$BatchDeleteWorldsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteWorldsResponse(
    unprocessedWorlds:
        (json['unprocessedWorlds'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchDescribeSimulationJobResponse _$BatchDescribeSimulationJobResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDescribeSimulationJobResponse(
    jobs: (json['jobs'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedJobs:
        (json['unprocessedJobs'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchPolicy _$BatchPolicyFromJson(Map<String, dynamic> json) {
  return BatchPolicy(
    maxConcurrency: json['maxConcurrency'] as int,
    timeoutInSeconds: json['timeoutInSeconds'] as int,
  );
}

Map<String, dynamic> _$BatchPolicyToJson(BatchPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxConcurrency', instance.maxConcurrency);
  writeNotNull('timeoutInSeconds', instance.timeoutInSeconds);
  return val;
}

CancelDeploymentJobResponse _$CancelDeploymentJobResponseFromJson(
    Map<String, dynamic> json) {
  return CancelDeploymentJobResponse();
}

CancelSimulationJobBatchResponse _$CancelSimulationJobBatchResponseFromJson(
    Map<String, dynamic> json) {
  return CancelSimulationJobBatchResponse();
}

CancelSimulationJobResponse _$CancelSimulationJobResponseFromJson(
    Map<String, dynamic> json) {
  return CancelSimulationJobResponse();
}

CancelWorldExportJobResponse _$CancelWorldExportJobResponseFromJson(
    Map<String, dynamic> json) {
  return CancelWorldExportJobResponse();
}

CancelWorldGenerationJobResponse _$CancelWorldGenerationJobResponseFromJson(
    Map<String, dynamic> json) {
  return CancelWorldGenerationJobResponse();
}

Compute _$ComputeFromJson(Map<String, dynamic> json) {
  return Compute(
    simulationUnitLimit: json['simulationUnitLimit'] as int,
  );
}

Map<String, dynamic> _$ComputeToJson(Compute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('simulationUnitLimit', instance.simulationUnitLimit);
  return val;
}

ComputeResponse _$ComputeResponseFromJson(Map<String, dynamic> json) {
  return ComputeResponse(
    simulationUnitLimit: json['simulationUnitLimit'] as int,
  );
}

CreateDeploymentJobResponse _$CreateDeploymentJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDeploymentJobResponse(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    deploymentApplicationConfigs: (json['deploymentApplicationConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    deploymentConfig: json['deploymentConfig'] == null
        ? null
        : DeploymentConfig.fromJson(
            json['deploymentConfig'] as Map<String, dynamic>),
    failureCode: _$enumDecodeNullable(
        _$DeploymentJobErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    fleet: json['fleet'] as String,
    status: _$enumDecodeNullable(_$DeploymentStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
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

const _$DeploymentJobErrorCodeEnumMap = {
  DeploymentJobErrorCode.resourceNotFound: 'ResourceNotFound',
  DeploymentJobErrorCode.environmentSetupError: 'EnvironmentSetupError',
  DeploymentJobErrorCode.etagMismatch: 'EtagMismatch',
  DeploymentJobErrorCode.failureThresholdBreached: 'FailureThresholdBreached',
  DeploymentJobErrorCode.robotDeploymentAborted: 'RobotDeploymentAborted',
  DeploymentJobErrorCode.robotDeploymentNoResponse: 'RobotDeploymentNoResponse',
  DeploymentJobErrorCode.robotAgentConnectionTimeout:
      'RobotAgentConnectionTimeout',
  DeploymentJobErrorCode.greengrassDeploymentFailed:
      'GreengrassDeploymentFailed',
  DeploymentJobErrorCode.invalidGreengrassGroup: 'InvalidGreengrassGroup',
  DeploymentJobErrorCode.missingRobotArchitecture: 'MissingRobotArchitecture',
  DeploymentJobErrorCode.missingRobotApplicationArchitecture:
      'MissingRobotApplicationArchitecture',
  DeploymentJobErrorCode.missingRobotDeploymentResource:
      'MissingRobotDeploymentResource',
  DeploymentJobErrorCode.greengrassGroupVersionDoesNotExist:
      'GreengrassGroupVersionDoesNotExist',
  DeploymentJobErrorCode.lambdaDeleted: 'LambdaDeleted',
  DeploymentJobErrorCode.extractingBundleFailure: 'ExtractingBundleFailure',
  DeploymentJobErrorCode.preLaunchFileFailure: 'PreLaunchFileFailure',
  DeploymentJobErrorCode.postLaunchFileFailure: 'PostLaunchFileFailure',
  DeploymentJobErrorCode.badPermissionError: 'BadPermissionError',
  DeploymentJobErrorCode.downloadConditionFailed: 'DownloadConditionFailed',
  DeploymentJobErrorCode.internalServerError: 'InternalServerError',
};

const _$DeploymentStatusEnumMap = {
  DeploymentStatus.pending: 'Pending',
  DeploymentStatus.preparing: 'Preparing',
  DeploymentStatus.inProgress: 'InProgress',
  DeploymentStatus.failed: 'Failed',
  DeploymentStatus.succeeded: 'Succeeded',
  DeploymentStatus.canceled: 'Canceled',
};

CreateFleetResponse _$CreateFleetResponseFromJson(Map<String, dynamic> json) {
  return CreateFleetResponse(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreateRobotApplicationResponse _$CreateRobotApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRobotApplicationResponse(
    arn: json['arn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    revisionId: json['revisionId'] as String,
    robotSoftwareSuite: json['robotSoftwareSuite'] == null
        ? null
        : RobotSoftwareSuite.fromJson(
            json['robotSoftwareSuite'] as Map<String, dynamic>),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
  );
}

CreateRobotApplicationVersionResponse
    _$CreateRobotApplicationVersionResponseFromJson(Map<String, dynamic> json) {
  return CreateRobotApplicationVersionResponse(
    arn: json['arn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    revisionId: json['revisionId'] as String,
    robotSoftwareSuite: json['robotSoftwareSuite'] == null
        ? null
        : RobotSoftwareSuite.fromJson(
            json['robotSoftwareSuite'] as Map<String, dynamic>),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
  );
}

CreateRobotResponse _$CreateRobotResponseFromJson(Map<String, dynamic> json) {
  return CreateRobotResponse(
    architecture:
        _$enumDecodeNullable(_$ArchitectureEnumMap, json['architecture']),
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    greengrassGroupId: json['greengrassGroupId'] as String,
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$ArchitectureEnumMap = {
  Architecture.x86_64: 'X86_64',
  Architecture.arm64: 'ARM64',
  Architecture.armhf: 'ARMHF',
};

CreateSimulationApplicationResponse
    _$CreateSimulationApplicationResponseFromJson(Map<String, dynamic> json) {
  return CreateSimulationApplicationResponse(
    arn: json['arn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    renderingEngine: json['renderingEngine'] == null
        ? null
        : RenderingEngine.fromJson(
            json['renderingEngine'] as Map<String, dynamic>),
    revisionId: json['revisionId'] as String,
    robotSoftwareSuite: json['robotSoftwareSuite'] == null
        ? null
        : RobotSoftwareSuite.fromJson(
            json['robotSoftwareSuite'] as Map<String, dynamic>),
    simulationSoftwareSuite: json['simulationSoftwareSuite'] == null
        ? null
        : SimulationSoftwareSuite.fromJson(
            json['simulationSoftwareSuite'] as Map<String, dynamic>),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
  );
}

CreateSimulationApplicationVersionResponse
    _$CreateSimulationApplicationVersionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateSimulationApplicationVersionResponse(
    arn: json['arn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    renderingEngine: json['renderingEngine'] == null
        ? null
        : RenderingEngine.fromJson(
            json['renderingEngine'] as Map<String, dynamic>),
    revisionId: json['revisionId'] as String,
    robotSoftwareSuite: json['robotSoftwareSuite'] == null
        ? null
        : RobotSoftwareSuite.fromJson(
            json['robotSoftwareSuite'] as Map<String, dynamic>),
    simulationSoftwareSuite: json['simulationSoftwareSuite'] == null
        ? null
        : SimulationSoftwareSuite.fromJson(
            json['simulationSoftwareSuite'] as Map<String, dynamic>),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
  );
}

CreateSimulationJobResponse _$CreateSimulationJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSimulationJobResponse(
    arn: json['arn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    compute: json['compute'] == null
        ? null
        : ComputeResponse.fromJson(json['compute'] as Map<String, dynamic>),
    dataSources: (json['dataSources'] as List)
        ?.map((e) =>
            e == null ? null : DataSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failureBehavior:
        _$enumDecodeNullable(_$FailureBehaviorEnumMap, json['failureBehavior']),
    failureCode: _$enumDecodeNullable(
        _$SimulationJobErrorCodeEnumMap, json['failureCode']),
    iamRole: json['iamRole'] as String,
    lastStartedAt:
        const UnixDateTimeConverter().fromJson(json['lastStartedAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    loggingConfig: json['loggingConfig'] == null
        ? null
        : LoggingConfig.fromJson(json['loggingConfig'] as Map<String, dynamic>),
    maxJobDurationInSeconds: json['maxJobDurationInSeconds'] as int,
    outputLocation: json['outputLocation'] == null
        ? null
        : OutputLocation.fromJson(
            json['outputLocation'] as Map<String, dynamic>),
    robotApplications: (json['robotApplications'] as List)
        ?.map((e) => e == null
            ? null
            : RobotApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    simulationApplications: (json['simulationApplications'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    simulationTimeMillis: json['simulationTimeMillis'] as int,
    status: _$enumDecodeNullable(_$SimulationJobStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    vpcConfig: json['vpcConfig'] == null
        ? null
        : VPCConfigResponse.fromJson(json['vpcConfig'] as Map<String, dynamic>),
  );
}

const _$FailureBehaviorEnumMap = {
  FailureBehavior.fail: 'Fail',
  FailureBehavior.$continue: 'Continue',
};

const _$SimulationJobErrorCodeEnumMap = {
  SimulationJobErrorCode.internalServiceError: 'InternalServiceError',
  SimulationJobErrorCode.robotApplicationCrash: 'RobotApplicationCrash',
  SimulationJobErrorCode.simulationApplicationCrash:
      'SimulationApplicationCrash',
  SimulationJobErrorCode.badPermissionsRobotApplication:
      'BadPermissionsRobotApplication',
  SimulationJobErrorCode.badPermissionsSimulationApplication:
      'BadPermissionsSimulationApplication',
  SimulationJobErrorCode.badPermissionsS3Object: 'BadPermissionsS3Object',
  SimulationJobErrorCode.badPermissionsS3Output: 'BadPermissionsS3Output',
  SimulationJobErrorCode.badPermissionsCloudwatchLogs:
      'BadPermissionsCloudwatchLogs',
  SimulationJobErrorCode.subnetIpLimitExceeded: 'SubnetIpLimitExceeded',
  SimulationJobErrorCode.eNILimitExceeded: 'ENILimitExceeded',
  SimulationJobErrorCode.badPermissionsUserCredentials:
      'BadPermissionsUserCredentials',
  SimulationJobErrorCode.invalidBundleRobotApplication:
      'InvalidBundleRobotApplication',
  SimulationJobErrorCode.invalidBundleSimulationApplication:
      'InvalidBundleSimulationApplication',
  SimulationJobErrorCode.invalidS3Resource: 'InvalidS3Resource',
  SimulationJobErrorCode.limitExceeded: 'LimitExceeded',
  SimulationJobErrorCode.mismatchedEtag: 'MismatchedEtag',
  SimulationJobErrorCode.robotApplicationVersionMismatchedEtag:
      'RobotApplicationVersionMismatchedEtag',
  SimulationJobErrorCode.simulationApplicationVersionMismatchedEtag:
      'SimulationApplicationVersionMismatchedEtag',
  SimulationJobErrorCode.resourceNotFound: 'ResourceNotFound',
  SimulationJobErrorCode.requestThrottled: 'RequestThrottled',
  SimulationJobErrorCode.batchTimedOut: 'BatchTimedOut',
  SimulationJobErrorCode.batchCanceled: 'BatchCanceled',
  SimulationJobErrorCode.invalidInput: 'InvalidInput',
  SimulationJobErrorCode.wrongRegionS3Bucket: 'WrongRegionS3Bucket',
  SimulationJobErrorCode.wrongRegionS3Output: 'WrongRegionS3Output',
  SimulationJobErrorCode.wrongRegionRobotApplication:
      'WrongRegionRobotApplication',
  SimulationJobErrorCode.wrongRegionSimulationApplication:
      'WrongRegionSimulationApplication',
};

const _$SimulationJobStatusEnumMap = {
  SimulationJobStatus.pending: 'Pending',
  SimulationJobStatus.preparing: 'Preparing',
  SimulationJobStatus.running: 'Running',
  SimulationJobStatus.restarting: 'Restarting',
  SimulationJobStatus.completed: 'Completed',
  SimulationJobStatus.failed: 'Failed',
  SimulationJobStatus.runningFailed: 'RunningFailed',
  SimulationJobStatus.terminating: 'Terminating',
  SimulationJobStatus.terminated: 'Terminated',
  SimulationJobStatus.canceled: 'Canceled',
};

CreateWorldExportJobResponse _$CreateWorldExportJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWorldExportJobResponse(
    arn: json['arn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    failureCode: _$enumDecodeNullable(
        _$WorldExportJobErrorCodeEnumMap, json['failureCode']),
    iamRole: json['iamRole'] as String,
    outputLocation: json['outputLocation'] == null
        ? null
        : OutputLocation.fromJson(
            json['outputLocation'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$WorldExportJobStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$WorldExportJobErrorCodeEnumMap = {
  WorldExportJobErrorCode.internalServiceError: 'InternalServiceError',
  WorldExportJobErrorCode.limitExceeded: 'LimitExceeded',
  WorldExportJobErrorCode.resourceNotFound: 'ResourceNotFound',
  WorldExportJobErrorCode.requestThrottled: 'RequestThrottled',
  WorldExportJobErrorCode.invalidInput: 'InvalidInput',
  WorldExportJobErrorCode.accessDenied: 'AccessDenied',
};

const _$WorldExportJobStatusEnumMap = {
  WorldExportJobStatus.pending: 'Pending',
  WorldExportJobStatus.running: 'Running',
  WorldExportJobStatus.completed: 'Completed',
  WorldExportJobStatus.failed: 'Failed',
  WorldExportJobStatus.canceling: 'Canceling',
  WorldExportJobStatus.canceled: 'Canceled',
};

CreateWorldGenerationJobResponse _$CreateWorldGenerationJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWorldGenerationJobResponse(
    arn: json['arn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    failureCode: _$enumDecodeNullable(
        _$WorldGenerationJobErrorCodeEnumMap, json['failureCode']),
    status:
        _$enumDecodeNullable(_$WorldGenerationJobStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    template: json['template'] as String,
    worldCount: json['worldCount'] == null
        ? null
        : WorldCount.fromJson(json['worldCount'] as Map<String, dynamic>),
    worldTags: (json['worldTags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$WorldGenerationJobErrorCodeEnumMap = {
  WorldGenerationJobErrorCode.internalServiceError: 'InternalServiceError',
  WorldGenerationJobErrorCode.limitExceeded: 'LimitExceeded',
  WorldGenerationJobErrorCode.resourceNotFound: 'ResourceNotFound',
  WorldGenerationJobErrorCode.requestThrottled: 'RequestThrottled',
  WorldGenerationJobErrorCode.invalidInput: 'InvalidInput',
  WorldGenerationJobErrorCode.allWorldGenerationFailed:
      'AllWorldGenerationFailed',
};

const _$WorldGenerationJobStatusEnumMap = {
  WorldGenerationJobStatus.pending: 'Pending',
  WorldGenerationJobStatus.running: 'Running',
  WorldGenerationJobStatus.completed: 'Completed',
  WorldGenerationJobStatus.failed: 'Failed',
  WorldGenerationJobStatus.partialFailed: 'PartialFailed',
  WorldGenerationJobStatus.canceling: 'Canceling',
  WorldGenerationJobStatus.canceled: 'Canceled',
};

CreateWorldTemplateResponse _$CreateWorldTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWorldTemplateResponse(
    arn: json['arn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return DataSource(
    name: json['name'] as String,
    s3Bucket: json['s3Bucket'] as String,
    s3Keys: (json['s3Keys'] as List)
        ?.map((e) =>
            e == null ? null : S3KeyOutput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DataSourceConfig _$DataSourceConfigFromJson(Map<String, dynamic> json) {
  return DataSourceConfig(
    name: json['name'] as String,
    s3Bucket: json['s3Bucket'] as String,
    s3Keys: (json['s3Keys'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DataSourceConfigToJson(DataSourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('s3Bucket', instance.s3Bucket);
  writeNotNull('s3Keys', instance.s3Keys);
  return val;
}

DeleteFleetResponse _$DeleteFleetResponseFromJson(Map<String, dynamic> json) {
  return DeleteFleetResponse();
}

DeleteRobotApplicationResponse _$DeleteRobotApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRobotApplicationResponse();
}

DeleteRobotResponse _$DeleteRobotResponseFromJson(Map<String, dynamic> json) {
  return DeleteRobotResponse();
}

DeleteSimulationApplicationResponse
    _$DeleteSimulationApplicationResponseFromJson(Map<String, dynamic> json) {
  return DeleteSimulationApplicationResponse();
}

DeleteWorldTemplateResponse _$DeleteWorldTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteWorldTemplateResponse();
}

DeploymentApplicationConfig _$DeploymentApplicationConfigFromJson(
    Map<String, dynamic> json) {
  return DeploymentApplicationConfig(
    application: json['application'] as String,
    applicationVersion: json['applicationVersion'] as String,
    launchConfig: json['launchConfig'] == null
        ? null
        : DeploymentLaunchConfig.fromJson(
            json['launchConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeploymentApplicationConfigToJson(
    DeploymentApplicationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('application', instance.application);
  writeNotNull('applicationVersion', instance.applicationVersion);
  writeNotNull('launchConfig', instance.launchConfig?.toJson());
  return val;
}

DeploymentConfig _$DeploymentConfigFromJson(Map<String, dynamic> json) {
  return DeploymentConfig(
    concurrentDeploymentPercentage:
        json['concurrentDeploymentPercentage'] as int,
    downloadConditionFile: json['downloadConditionFile'] == null
        ? null
        : S3Object.fromJson(
            json['downloadConditionFile'] as Map<String, dynamic>),
    failureThresholdPercentage: json['failureThresholdPercentage'] as int,
    robotDeploymentTimeoutInSeconds:
        json['robotDeploymentTimeoutInSeconds'] as int,
  );
}

Map<String, dynamic> _$DeploymentConfigToJson(DeploymentConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('concurrentDeploymentPercentage',
      instance.concurrentDeploymentPercentage);
  writeNotNull(
      'downloadConditionFile', instance.downloadConditionFile?.toJson());
  writeNotNull(
      'failureThresholdPercentage', instance.failureThresholdPercentage);
  writeNotNull('robotDeploymentTimeoutInSeconds',
      instance.robotDeploymentTimeoutInSeconds);
  return val;
}

DeploymentJob _$DeploymentJobFromJson(Map<String, dynamic> json) {
  return DeploymentJob(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    deploymentApplicationConfigs: (json['deploymentApplicationConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    deploymentConfig: json['deploymentConfig'] == null
        ? null
        : DeploymentConfig.fromJson(
            json['deploymentConfig'] as Map<String, dynamic>),
    failureCode: _$enumDecodeNullable(
        _$DeploymentJobErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    fleet: json['fleet'] as String,
    status: _$enumDecodeNullable(_$DeploymentStatusEnumMap, json['status']),
  );
}

DeploymentLaunchConfig _$DeploymentLaunchConfigFromJson(
    Map<String, dynamic> json) {
  return DeploymentLaunchConfig(
    launchFile: json['launchFile'] as String,
    packageName: json['packageName'] as String,
    environmentVariables:
        (json['environmentVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    postLaunchFile: json['postLaunchFile'] as String,
    preLaunchFile: json['preLaunchFile'] as String,
  );
}

Map<String, dynamic> _$DeploymentLaunchConfigToJson(
    DeploymentLaunchConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('launchFile', instance.launchFile);
  writeNotNull('packageName', instance.packageName);
  writeNotNull('environmentVariables', instance.environmentVariables);
  writeNotNull('postLaunchFile', instance.postLaunchFile);
  writeNotNull('preLaunchFile', instance.preLaunchFile);
  return val;
}

DeregisterRobotResponse _$DeregisterRobotResponseFromJson(
    Map<String, dynamic> json) {
  return DeregisterRobotResponse(
    fleet: json['fleet'] as String,
    robot: json['robot'] as String,
  );
}

DescribeDeploymentJobResponse _$DescribeDeploymentJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDeploymentJobResponse(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    deploymentApplicationConfigs: (json['deploymentApplicationConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    deploymentConfig: json['deploymentConfig'] == null
        ? null
        : DeploymentConfig.fromJson(
            json['deploymentConfig'] as Map<String, dynamic>),
    failureCode: _$enumDecodeNullable(
        _$DeploymentJobErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    fleet: json['fleet'] as String,
    robotDeploymentSummary: (json['robotDeploymentSummary'] as List)
        ?.map((e) => e == null
            ? null
            : RobotDeployment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$DeploymentStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribeFleetResponse _$DescribeFleetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFleetResponse(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    lastDeploymentJob: json['lastDeploymentJob'] as String,
    lastDeploymentStatus: _$enumDecodeNullable(
        _$DeploymentStatusEnumMap, json['lastDeploymentStatus']),
    lastDeploymentTime:
        const UnixDateTimeConverter().fromJson(json['lastDeploymentTime']),
    name: json['name'] as String,
    robots: (json['robots'] as List)
        ?.map(
            (e) => e == null ? null : Robot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribeRobotApplicationResponse _$DescribeRobotApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRobotApplicationResponse(
    arn: json['arn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    revisionId: json['revisionId'] as String,
    robotSoftwareSuite: json['robotSoftwareSuite'] == null
        ? null
        : RobotSoftwareSuite.fromJson(
            json['robotSoftwareSuite'] as Map<String, dynamic>),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
  );
}

DescribeRobotResponse _$DescribeRobotResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRobotResponse(
    architecture:
        _$enumDecodeNullable(_$ArchitectureEnumMap, json['architecture']),
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    fleetArn: json['fleetArn'] as String,
    greengrassGroupId: json['greengrassGroupId'] as String,
    lastDeploymentJob: json['lastDeploymentJob'] as String,
    lastDeploymentTime:
        const UnixDateTimeConverter().fromJson(json['lastDeploymentTime']),
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$RobotStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$RobotStatusEnumMap = {
  RobotStatus.available: 'Available',
  RobotStatus.registered: 'Registered',
  RobotStatus.pendingNewDeployment: 'PendingNewDeployment',
  RobotStatus.deploying: 'Deploying',
  RobotStatus.failed: 'Failed',
  RobotStatus.inSync: 'InSync',
  RobotStatus.noResponse: 'NoResponse',
};

DescribeSimulationApplicationResponse
    _$DescribeSimulationApplicationResponseFromJson(Map<String, dynamic> json) {
  return DescribeSimulationApplicationResponse(
    arn: json['arn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    renderingEngine: json['renderingEngine'] == null
        ? null
        : RenderingEngine.fromJson(
            json['renderingEngine'] as Map<String, dynamic>),
    revisionId: json['revisionId'] as String,
    robotSoftwareSuite: json['robotSoftwareSuite'] == null
        ? null
        : RobotSoftwareSuite.fromJson(
            json['robotSoftwareSuite'] as Map<String, dynamic>),
    simulationSoftwareSuite: json['simulationSoftwareSuite'] == null
        ? null
        : SimulationSoftwareSuite.fromJson(
            json['simulationSoftwareSuite'] as Map<String, dynamic>),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
  );
}

DescribeSimulationJobBatchResponse _$DescribeSimulationJobBatchResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSimulationJobBatchResponse(
    arn: json['arn'] as String,
    batchPolicy: json['batchPolicy'] == null
        ? null
        : BatchPolicy.fromJson(json['batchPolicy'] as Map<String, dynamic>),
    clientRequestToken: json['clientRequestToken'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    createdRequests: (json['createdRequests'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failedRequests: (json['failedRequests'] as List)
        ?.map((e) => e == null
            ? null
            : FailedCreateSimulationJobRequest.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    failureCode: _$enumDecodeNullable(
        _$SimulationJobBatchErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    pendingRequests: (json['pendingRequests'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationJobRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status:
        _$enumDecodeNullable(_$SimulationJobBatchStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$SimulationJobBatchErrorCodeEnumMap = {
  SimulationJobBatchErrorCode.internalServiceError: 'InternalServiceError',
};

const _$SimulationJobBatchStatusEnumMap = {
  SimulationJobBatchStatus.pending: 'Pending',
  SimulationJobBatchStatus.inProgress: 'InProgress',
  SimulationJobBatchStatus.failed: 'Failed',
  SimulationJobBatchStatus.completed: 'Completed',
  SimulationJobBatchStatus.canceled: 'Canceled',
  SimulationJobBatchStatus.canceling: 'Canceling',
  SimulationJobBatchStatus.completing: 'Completing',
  SimulationJobBatchStatus.timingOut: 'TimingOut',
  SimulationJobBatchStatus.timedOut: 'TimedOut',
};

DescribeSimulationJobResponse _$DescribeSimulationJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSimulationJobResponse(
    arn: json['arn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    compute: json['compute'] == null
        ? null
        : ComputeResponse.fromJson(json['compute'] as Map<String, dynamic>),
    dataSources: (json['dataSources'] as List)
        ?.map((e) =>
            e == null ? null : DataSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failureBehavior:
        _$enumDecodeNullable(_$FailureBehaviorEnumMap, json['failureBehavior']),
    failureCode: _$enumDecodeNullable(
        _$SimulationJobErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    iamRole: json['iamRole'] as String,
    lastStartedAt:
        const UnixDateTimeConverter().fromJson(json['lastStartedAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    loggingConfig: json['loggingConfig'] == null
        ? null
        : LoggingConfig.fromJson(json['loggingConfig'] as Map<String, dynamic>),
    maxJobDurationInSeconds: json['maxJobDurationInSeconds'] as int,
    name: json['name'] as String,
    networkInterface: json['networkInterface'] == null
        ? null
        : NetworkInterface.fromJson(
            json['networkInterface'] as Map<String, dynamic>),
    outputLocation: json['outputLocation'] == null
        ? null
        : OutputLocation.fromJson(
            json['outputLocation'] as Map<String, dynamic>),
    robotApplications: (json['robotApplications'] as List)
        ?.map((e) => e == null
            ? null
            : RobotApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    simulationApplications: (json['simulationApplications'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    simulationTimeMillis: json['simulationTimeMillis'] as int,
    status: _$enumDecodeNullable(_$SimulationJobStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    vpcConfig: json['vpcConfig'] == null
        ? null
        : VPCConfigResponse.fromJson(json['vpcConfig'] as Map<String, dynamic>),
  );
}

DescribeWorldExportJobResponse _$DescribeWorldExportJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeWorldExportJobResponse(
    arn: json['arn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    failureCode: _$enumDecodeNullable(
        _$WorldExportJobErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    iamRole: json['iamRole'] as String,
    outputLocation: json['outputLocation'] == null
        ? null
        : OutputLocation.fromJson(
            json['outputLocation'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$WorldExportJobStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    worlds: (json['worlds'] as List)?.map((e) => e as String)?.toList(),
  );
}

DescribeWorldGenerationJobResponse _$DescribeWorldGenerationJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeWorldGenerationJobResponse(
    arn: json['arn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    failureCode: _$enumDecodeNullable(
        _$WorldGenerationJobErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    finishedWorldsSummary: json['finishedWorldsSummary'] == null
        ? null
        : FinishedWorldsSummary.fromJson(
            json['finishedWorldsSummary'] as Map<String, dynamic>),
    status:
        _$enumDecodeNullable(_$WorldGenerationJobStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    template: json['template'] as String,
    worldCount: json['worldCount'] == null
        ? null
        : WorldCount.fromJson(json['worldCount'] as Map<String, dynamic>),
    worldTags: (json['worldTags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribeWorldResponse _$DescribeWorldResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeWorldResponse(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    generationJob: json['generationJob'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    template: json['template'] as String,
  );
}

DescribeWorldTemplateResponse _$DescribeWorldTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeWorldTemplateResponse(
    arn: json['arn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

FailedCreateSimulationJobRequest _$FailedCreateSimulationJobRequestFromJson(
    Map<String, dynamic> json) {
  return FailedCreateSimulationJobRequest(
    failedAt: const UnixDateTimeConverter().fromJson(json['failedAt']),
    failureCode: _$enumDecodeNullable(
        _$SimulationJobErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    request: json['request'] == null
        ? null
        : SimulationJobRequest.fromJson(
            json['request'] as Map<String, dynamic>),
  );
}

FailureSummary _$FailureSummaryFromJson(Map<String, dynamic> json) {
  return FailureSummary(
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : WorldFailure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalFailureCount: json['totalFailureCount'] as int,
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('values', instance.values);
  return val;
}

FinishedWorldsSummary _$FinishedWorldsSummaryFromJson(
    Map<String, dynamic> json) {
  return FinishedWorldsSummary(
    failureSummary: json['failureSummary'] == null
        ? null
        : FailureSummary.fromJson(
            json['failureSummary'] as Map<String, dynamic>),
    finishedCount: json['finishedCount'] as int,
    succeededWorlds:
        (json['succeededWorlds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Fleet _$FleetFromJson(Map<String, dynamic> json) {
  return Fleet(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    lastDeploymentJob: json['lastDeploymentJob'] as String,
    lastDeploymentStatus: _$enumDecodeNullable(
        _$DeploymentStatusEnumMap, json['lastDeploymentStatus']),
    lastDeploymentTime:
        const UnixDateTimeConverter().fromJson(json['lastDeploymentTime']),
    name: json['name'] as String,
  );
}

GetWorldTemplateBodyResponse _$GetWorldTemplateBodyResponseFromJson(
    Map<String, dynamic> json) {
  return GetWorldTemplateBodyResponse(
    templateBody: json['templateBody'] as String,
  );
}

LaunchConfig _$LaunchConfigFromJson(Map<String, dynamic> json) {
  return LaunchConfig(
    launchFile: json['launchFile'] as String,
    packageName: json['packageName'] as String,
    environmentVariables:
        (json['environmentVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    portForwardingConfig: json['portForwardingConfig'] == null
        ? null
        : PortForwardingConfig.fromJson(
            json['portForwardingConfig'] as Map<String, dynamic>),
    streamUI: json['streamUI'] as bool,
  );
}

Map<String, dynamic> _$LaunchConfigToJson(LaunchConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('launchFile', instance.launchFile);
  writeNotNull('packageName', instance.packageName);
  writeNotNull('environmentVariables', instance.environmentVariables);
  writeNotNull('portForwardingConfig', instance.portForwardingConfig?.toJson());
  writeNotNull('streamUI', instance.streamUI);
  return val;
}

ListDeploymentJobsResponse _$ListDeploymentJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDeploymentJobsResponse(
    deploymentJobs: (json['deploymentJobs'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListFleetsResponse _$ListFleetsResponseFromJson(Map<String, dynamic> json) {
  return ListFleetsResponse(
    fleetDetails: (json['fleetDetails'] as List)
        ?.map(
            (e) => e == null ? null : Fleet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListRobotApplicationsResponse _$ListRobotApplicationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRobotApplicationsResponse(
    nextToken: json['nextToken'] as String,
    robotApplicationSummaries: (json['robotApplicationSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : RobotApplicationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRobotsResponse _$ListRobotsResponseFromJson(Map<String, dynamic> json) {
  return ListRobotsResponse(
    nextToken: json['nextToken'] as String,
    robots: (json['robots'] as List)
        ?.map(
            (e) => e == null ? null : Robot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSimulationApplicationsResponse _$ListSimulationApplicationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSimulationApplicationsResponse(
    nextToken: json['nextToken'] as String,
    simulationApplicationSummaries: (json['simulationApplicationSummaries']
            as List)
        ?.map((e) => e == null
            ? null
            : SimulationApplicationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSimulationJobBatchesResponse _$ListSimulationJobBatchesResponseFromJson(
    Map<String, dynamic> json) {
  return ListSimulationJobBatchesResponse(
    nextToken: json['nextToken'] as String,
    simulationJobBatchSummaries: (json['simulationJobBatchSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationJobBatchSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSimulationJobsResponse _$ListSimulationJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSimulationJobsResponse(
    simulationJobSummaries: (json['simulationJobSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListWorldExportJobsResponse _$ListWorldExportJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListWorldExportJobsResponse(
    worldExportJobSummaries: (json['worldExportJobSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : WorldExportJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListWorldGenerationJobsResponse _$ListWorldGenerationJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListWorldGenerationJobsResponse(
    worldGenerationJobSummaries: (json['worldGenerationJobSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : WorldGenerationJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListWorldTemplatesResponse _$ListWorldTemplatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListWorldTemplatesResponse(
    nextToken: json['nextToken'] as String,
    templateSummaries: (json['templateSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : TemplateSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListWorldsResponse _$ListWorldsResponseFromJson(Map<String, dynamic> json) {
  return ListWorldsResponse(
    nextToken: json['nextToken'] as String,
    worldSummaries: (json['worldSummaries'] as List)
        ?.map((e) =>
            e == null ? null : WorldSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LoggingConfig _$LoggingConfigFromJson(Map<String, dynamic> json) {
  return LoggingConfig(
    recordAllRosTopics: json['recordAllRosTopics'] as bool,
  );
}

Map<String, dynamic> _$LoggingConfigToJson(LoggingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('recordAllRosTopics', instance.recordAllRosTopics);
  return val;
}

NetworkInterface _$NetworkInterfaceFromJson(Map<String, dynamic> json) {
  return NetworkInterface(
    networkInterfaceId: json['networkInterfaceId'] as String,
    privateIpAddress: json['privateIpAddress'] as String,
    publicIpAddress: json['publicIpAddress'] as String,
  );
}

OutputLocation _$OutputLocationFromJson(Map<String, dynamic> json) {
  return OutputLocation(
    s3Bucket: json['s3Bucket'] as String,
    s3Prefix: json['s3Prefix'] as String,
  );
}

Map<String, dynamic> _$OutputLocationToJson(OutputLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3Bucket', instance.s3Bucket);
  writeNotNull('s3Prefix', instance.s3Prefix);
  return val;
}

PortForwardingConfig _$PortForwardingConfigFromJson(Map<String, dynamic> json) {
  return PortForwardingConfig(
    portMappings: (json['portMappings'] as List)
        ?.map((e) =>
            e == null ? null : PortMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PortForwardingConfigToJson(
    PortForwardingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'portMappings', instance.portMappings?.map((e) => e?.toJson())?.toList());
  return val;
}

PortMapping _$PortMappingFromJson(Map<String, dynamic> json) {
  return PortMapping(
    applicationPort: json['applicationPort'] as int,
    jobPort: json['jobPort'] as int,
    enableOnPublicIp: json['enableOnPublicIp'] as bool,
  );
}

Map<String, dynamic> _$PortMappingToJson(PortMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('applicationPort', instance.applicationPort);
  writeNotNull('jobPort', instance.jobPort);
  writeNotNull('enableOnPublicIp', instance.enableOnPublicIp);
  return val;
}

ProgressDetail _$ProgressDetailFromJson(Map<String, dynamic> json) {
  return ProgressDetail(
    currentProgress: _$enumDecodeNullable(
        _$RobotDeploymentStepEnumMap, json['currentProgress']),
    estimatedTimeRemainingSeconds: json['estimatedTimeRemainingSeconds'] as int,
    percentDone: (json['percentDone'] as num)?.toDouble(),
    targetResource: json['targetResource'] as String,
  );
}

const _$RobotDeploymentStepEnumMap = {
  RobotDeploymentStep.validating: 'Validating',
  RobotDeploymentStep.downloadingExtracting: 'DownloadingExtracting',
  RobotDeploymentStep.executingDownloadCondition: 'ExecutingDownloadCondition',
  RobotDeploymentStep.executingPreLaunch: 'ExecutingPreLaunch',
  RobotDeploymentStep.launching: 'Launching',
  RobotDeploymentStep.executingPostLaunch: 'ExecutingPostLaunch',
  RobotDeploymentStep.finished: 'Finished',
};

RegisterRobotResponse _$RegisterRobotResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterRobotResponse(
    fleet: json['fleet'] as String,
    robot: json['robot'] as String,
  );
}

RenderingEngine _$RenderingEngineFromJson(Map<String, dynamic> json) {
  return RenderingEngine(
    name: _$enumDecodeNullable(_$RenderingEngineTypeEnumMap, json['name']),
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$RenderingEngineToJson(RenderingEngine instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$RenderingEngineTypeEnumMap[instance.name]);
  writeNotNull('version', instance.version);
  return val;
}

const _$RenderingEngineTypeEnumMap = {
  RenderingEngineType.ogre: 'OGRE',
};

RestartSimulationJobResponse _$RestartSimulationJobResponseFromJson(
    Map<String, dynamic> json) {
  return RestartSimulationJobResponse();
}

Robot _$RobotFromJson(Map<String, dynamic> json) {
  return Robot(
    architecture:
        _$enumDecodeNullable(_$ArchitectureEnumMap, json['architecture']),
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    fleetArn: json['fleetArn'] as String,
    greenGrassGroupId: json['greenGrassGroupId'] as String,
    lastDeploymentJob: json['lastDeploymentJob'] as String,
    lastDeploymentTime:
        const UnixDateTimeConverter().fromJson(json['lastDeploymentTime']),
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$RobotStatusEnumMap, json['status']),
  );
}

RobotApplicationConfig _$RobotApplicationConfigFromJson(
    Map<String, dynamic> json) {
  return RobotApplicationConfig(
    application: json['application'] as String,
    launchConfig: json['launchConfig'] == null
        ? null
        : LaunchConfig.fromJson(json['launchConfig'] as Map<String, dynamic>),
    applicationVersion: json['applicationVersion'] as String,
  );
}

Map<String, dynamic> _$RobotApplicationConfigToJson(
    RobotApplicationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('application', instance.application);
  writeNotNull('launchConfig', instance.launchConfig?.toJson());
  writeNotNull('applicationVersion', instance.applicationVersion);
  return val;
}

RobotApplicationSummary _$RobotApplicationSummaryFromJson(
    Map<String, dynamic> json) {
  return RobotApplicationSummary(
    arn: json['arn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    robotSoftwareSuite: json['robotSoftwareSuite'] == null
        ? null
        : RobotSoftwareSuite.fromJson(
            json['robotSoftwareSuite'] as Map<String, dynamic>),
    version: json['version'] as String,
  );
}

RobotDeployment _$RobotDeploymentFromJson(Map<String, dynamic> json) {
  return RobotDeployment(
    arn: json['arn'] as String,
    deploymentFinishTime:
        const UnixDateTimeConverter().fromJson(json['deploymentFinishTime']),
    deploymentStartTime:
        const UnixDateTimeConverter().fromJson(json['deploymentStartTime']),
    failureCode: _$enumDecodeNullable(
        _$DeploymentJobErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    progressDetail: json['progressDetail'] == null
        ? null
        : ProgressDetail.fromJson(
            json['progressDetail'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$RobotStatusEnumMap, json['status']),
  );
}

RobotSoftwareSuite _$RobotSoftwareSuiteFromJson(Map<String, dynamic> json) {
  return RobotSoftwareSuite(
    name: _$enumDecodeNullable(_$RobotSoftwareSuiteTypeEnumMap, json['name']),
    version: _$enumDecodeNullable(
        _$RobotSoftwareSuiteVersionTypeEnumMap, json['version']),
  );
}

Map<String, dynamic> _$RobotSoftwareSuiteToJson(RobotSoftwareSuite instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$RobotSoftwareSuiteTypeEnumMap[instance.name]);
  writeNotNull(
      'version', _$RobotSoftwareSuiteVersionTypeEnumMap[instance.version]);
  return val;
}

const _$RobotSoftwareSuiteTypeEnumMap = {
  RobotSoftwareSuiteType.ros: 'ROS',
  RobotSoftwareSuiteType.ros2: 'ROS2',
};

const _$RobotSoftwareSuiteVersionTypeEnumMap = {
  RobotSoftwareSuiteVersionType.kinetic: 'Kinetic',
  RobotSoftwareSuiteVersionType.melodic: 'Melodic',
  RobotSoftwareSuiteVersionType.dashing: 'Dashing',
};

S3KeyOutput _$S3KeyOutputFromJson(Map<String, dynamic> json) {
  return S3KeyOutput(
    etag: json['etag'] as String,
    s3Key: json['s3Key'] as String,
  );
}

S3Object _$S3ObjectFromJson(Map<String, dynamic> json) {
  return S3Object(
    bucket: json['bucket'] as String,
    key: json['key'] as String,
    etag: json['etag'] as String,
  );
}

Map<String, dynamic> _$S3ObjectToJson(S3Object instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucket', instance.bucket);
  writeNotNull('key', instance.key);
  writeNotNull('etag', instance.etag);
  return val;
}

SimulationApplicationConfig _$SimulationApplicationConfigFromJson(
    Map<String, dynamic> json) {
  return SimulationApplicationConfig(
    application: json['application'] as String,
    launchConfig: json['launchConfig'] == null
        ? null
        : LaunchConfig.fromJson(json['launchConfig'] as Map<String, dynamic>),
    applicationVersion: json['applicationVersion'] as String,
    worldConfigs: (json['worldConfigs'] as List)
        ?.map((e) =>
            e == null ? null : WorldConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SimulationApplicationConfigToJson(
    SimulationApplicationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('application', instance.application);
  writeNotNull('launchConfig', instance.launchConfig?.toJson());
  writeNotNull('applicationVersion', instance.applicationVersion);
  writeNotNull(
      'worldConfigs', instance.worldConfigs?.map((e) => e?.toJson())?.toList());
  return val;
}

SimulationApplicationSummary _$SimulationApplicationSummaryFromJson(
    Map<String, dynamic> json) {
  return SimulationApplicationSummary(
    arn: json['arn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    robotSoftwareSuite: json['robotSoftwareSuite'] == null
        ? null
        : RobotSoftwareSuite.fromJson(
            json['robotSoftwareSuite'] as Map<String, dynamic>),
    simulationSoftwareSuite: json['simulationSoftwareSuite'] == null
        ? null
        : SimulationSoftwareSuite.fromJson(
            json['simulationSoftwareSuite'] as Map<String, dynamic>),
    version: json['version'] as String,
  );
}

SimulationJob _$SimulationJobFromJson(Map<String, dynamic> json) {
  return SimulationJob(
    arn: json['arn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    compute: json['compute'] == null
        ? null
        : ComputeResponse.fromJson(json['compute'] as Map<String, dynamic>),
    dataSources: (json['dataSources'] as List)
        ?.map((e) =>
            e == null ? null : DataSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failureBehavior:
        _$enumDecodeNullable(_$FailureBehaviorEnumMap, json['failureBehavior']),
    failureCode: _$enumDecodeNullable(
        _$SimulationJobErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    iamRole: json['iamRole'] as String,
    lastStartedAt:
        const UnixDateTimeConverter().fromJson(json['lastStartedAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    loggingConfig: json['loggingConfig'] == null
        ? null
        : LoggingConfig.fromJson(json['loggingConfig'] as Map<String, dynamic>),
    maxJobDurationInSeconds: json['maxJobDurationInSeconds'] as int,
    name: json['name'] as String,
    networkInterface: json['networkInterface'] == null
        ? null
        : NetworkInterface.fromJson(
            json['networkInterface'] as Map<String, dynamic>),
    outputLocation: json['outputLocation'] == null
        ? null
        : OutputLocation.fromJson(
            json['outputLocation'] as Map<String, dynamic>),
    robotApplications: (json['robotApplications'] as List)
        ?.map((e) => e == null
            ? null
            : RobotApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    simulationApplications: (json['simulationApplications'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    simulationTimeMillis: json['simulationTimeMillis'] as int,
    status: _$enumDecodeNullable(_$SimulationJobStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    vpcConfig: json['vpcConfig'] == null
        ? null
        : VPCConfigResponse.fromJson(json['vpcConfig'] as Map<String, dynamic>),
  );
}

SimulationJobBatchSummary _$SimulationJobBatchSummaryFromJson(
    Map<String, dynamic> json) {
  return SimulationJobBatchSummary(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    createdRequestCount: json['createdRequestCount'] as int,
    failedRequestCount: json['failedRequestCount'] as int,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    pendingRequestCount: json['pendingRequestCount'] as int,
    status:
        _$enumDecodeNullable(_$SimulationJobBatchStatusEnumMap, json['status']),
  );
}

SimulationJobRequest _$SimulationJobRequestFromJson(Map<String, dynamic> json) {
  return SimulationJobRequest(
    maxJobDurationInSeconds: json['maxJobDurationInSeconds'] as int,
    compute: json['compute'] == null
        ? null
        : Compute.fromJson(json['compute'] as Map<String, dynamic>),
    dataSources: (json['dataSources'] as List)
        ?.map((e) => e == null
            ? null
            : DataSourceConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failureBehavior:
        _$enumDecodeNullable(_$FailureBehaviorEnumMap, json['failureBehavior']),
    iamRole: json['iamRole'] as String,
    loggingConfig: json['loggingConfig'] == null
        ? null
        : LoggingConfig.fromJson(json['loggingConfig'] as Map<String, dynamic>),
    outputLocation: json['outputLocation'] == null
        ? null
        : OutputLocation.fromJson(
            json['outputLocation'] as Map<String, dynamic>),
    robotApplications: (json['robotApplications'] as List)
        ?.map((e) => e == null
            ? null
            : RobotApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    simulationApplications: (json['simulationApplications'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    useDefaultApplications: json['useDefaultApplications'] as bool,
    vpcConfig: json['vpcConfig'] == null
        ? null
        : VPCConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SimulationJobRequestToJson(
    SimulationJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxJobDurationInSeconds', instance.maxJobDurationInSeconds);
  writeNotNull('compute', instance.compute?.toJson());
  writeNotNull(
      'dataSources', instance.dataSources?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'failureBehavior', _$FailureBehaviorEnumMap[instance.failureBehavior]);
  writeNotNull('iamRole', instance.iamRole);
  writeNotNull('loggingConfig', instance.loggingConfig?.toJson());
  writeNotNull('outputLocation', instance.outputLocation?.toJson());
  writeNotNull('robotApplications',
      instance.robotApplications?.map((e) => e?.toJson())?.toList());
  writeNotNull('simulationApplications',
      instance.simulationApplications?.map((e) => e?.toJson())?.toList());
  writeNotNull('tags', instance.tags);
  writeNotNull('useDefaultApplications', instance.useDefaultApplications);
  writeNotNull('vpcConfig', instance.vpcConfig?.toJson());
  return val;
}

SimulationJobSummary _$SimulationJobSummaryFromJson(Map<String, dynamic> json) {
  return SimulationJobSummary(
    arn: json['arn'] as String,
    dataSourceNames:
        (json['dataSourceNames'] as List)?.map((e) => e as String)?.toList(),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    robotApplicationNames: (json['robotApplicationNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    simulationApplicationNames: (json['simulationApplicationNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    status: _$enumDecodeNullable(_$SimulationJobStatusEnumMap, json['status']),
  );
}

SimulationSoftwareSuite _$SimulationSoftwareSuiteFromJson(
    Map<String, dynamic> json) {
  return SimulationSoftwareSuite(
    name: _$enumDecodeNullable(
        _$SimulationSoftwareSuiteTypeEnumMap, json['name']),
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$SimulationSoftwareSuiteToJson(
    SimulationSoftwareSuite instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$SimulationSoftwareSuiteTypeEnumMap[instance.name]);
  writeNotNull('version', instance.version);
  return val;
}

const _$SimulationSoftwareSuiteTypeEnumMap = {
  SimulationSoftwareSuiteType.gazebo: 'Gazebo',
  SimulationSoftwareSuiteType.rosbagPlay: 'RosbagPlay',
};

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    architecture:
        _$enumDecodeNullable(_$ArchitectureEnumMap, json['architecture']),
    etag: json['etag'] as String,
    s3Bucket: json['s3Bucket'] as String,
    s3Key: json['s3Key'] as String,
  );
}

Map<String, dynamic> _$SourceConfigToJson(SourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('architecture', _$ArchitectureEnumMap[instance.architecture]);
  writeNotNull('s3Bucket', instance.s3Bucket);
  writeNotNull('s3Key', instance.s3Key);
  return val;
}

StartSimulationJobBatchResponse _$StartSimulationJobBatchResponseFromJson(
    Map<String, dynamic> json) {
  return StartSimulationJobBatchResponse(
    arn: json['arn'] as String,
    batchPolicy: json['batchPolicy'] == null
        ? null
        : BatchPolicy.fromJson(json['batchPolicy'] as Map<String, dynamic>),
    clientRequestToken: json['clientRequestToken'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    createdRequests: (json['createdRequests'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failedRequests: (json['failedRequests'] as List)
        ?.map((e) => e == null
            ? null
            : FailedCreateSimulationJobRequest.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    failureCode: _$enumDecodeNullable(
        _$SimulationJobBatchErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    pendingRequests: (json['pendingRequests'] as List)
        ?.map((e) => e == null
            ? null
            : SimulationJobRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status:
        _$enumDecodeNullable(_$SimulationJobBatchStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

SyncDeploymentJobResponse _$SyncDeploymentJobResponseFromJson(
    Map<String, dynamic> json) {
  return SyncDeploymentJobResponse(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    deploymentApplicationConfigs: (json['deploymentApplicationConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentApplicationConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    deploymentConfig: json['deploymentConfig'] == null
        ? null
        : DeploymentConfig.fromJson(
            json['deploymentConfig'] as Map<String, dynamic>),
    failureCode: _$enumDecodeNullable(
        _$DeploymentJobErrorCodeEnumMap, json['failureCode']),
    failureReason: json['failureReason'] as String,
    fleet: json['fleet'] as String,
    status: _$enumDecodeNullable(_$DeploymentStatusEnumMap, json['status']),
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$TemplateLocationToJson(TemplateLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3Bucket', instance.s3Bucket);
  writeNotNull('s3Key', instance.s3Key);
  return val;
}

TemplateSummary _$TemplateSummaryFromJson(Map<String, dynamic> json) {
  return TemplateSummary(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateRobotApplicationResponse _$UpdateRobotApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRobotApplicationResponse(
    arn: json['arn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    revisionId: json['revisionId'] as String,
    robotSoftwareSuite: json['robotSoftwareSuite'] == null
        ? null
        : RobotSoftwareSuite.fromJson(
            json['robotSoftwareSuite'] as Map<String, dynamic>),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
  );
}

UpdateSimulationApplicationResponse
    _$UpdateSimulationApplicationResponseFromJson(Map<String, dynamic> json) {
  return UpdateSimulationApplicationResponse(
    arn: json['arn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
    renderingEngine: json['renderingEngine'] == null
        ? null
        : RenderingEngine.fromJson(
            json['renderingEngine'] as Map<String, dynamic>),
    revisionId: json['revisionId'] as String,
    robotSoftwareSuite: json['robotSoftwareSuite'] == null
        ? null
        : RobotSoftwareSuite.fromJson(
            json['robotSoftwareSuite'] as Map<String, dynamic>),
    simulationSoftwareSuite: json['simulationSoftwareSuite'] == null
        ? null
        : SimulationSoftwareSuite.fromJson(
            json['simulationSoftwareSuite'] as Map<String, dynamic>),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
  );
}

UpdateWorldTemplateResponse _$UpdateWorldTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateWorldTemplateResponse(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
  );
}

VPCConfig _$VPCConfigFromJson(Map<String, dynamic> json) {
  return VPCConfig(
    subnets: (json['subnets'] as List)?.map((e) => e as String)?.toList(),
    assignPublicIp: json['assignPublicIp'] as bool,
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$VPCConfigToJson(VPCConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subnets', instance.subnets);
  writeNotNull('assignPublicIp', instance.assignPublicIp);
  writeNotNull('securityGroups', instance.securityGroups);
  return val;
}

VPCConfigResponse _$VPCConfigResponseFromJson(Map<String, dynamic> json) {
  return VPCConfigResponse(
    assignPublicIp: json['assignPublicIp'] as bool,
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
    subnets: (json['subnets'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['vpcId'] as String,
  );
}

WorldConfig _$WorldConfigFromJson(Map<String, dynamic> json) {
  return WorldConfig(
    world: json['world'] as String,
  );
}

Map<String, dynamic> _$WorldConfigToJson(WorldConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('world', instance.world);
  return val;
}

WorldCount _$WorldCountFromJson(Map<String, dynamic> json) {
  return WorldCount(
    floorplanCount: json['floorplanCount'] as int,
    interiorCountPerFloorplan: json['interiorCountPerFloorplan'] as int,
  );
}

Map<String, dynamic> _$WorldCountToJson(WorldCount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('floorplanCount', instance.floorplanCount);
  writeNotNull('interiorCountPerFloorplan', instance.interiorCountPerFloorplan);
  return val;
}

WorldExportJobSummary _$WorldExportJobSummaryFromJson(
    Map<String, dynamic> json) {
  return WorldExportJobSummary(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    status: _$enumDecodeNullable(_$WorldExportJobStatusEnumMap, json['status']),
    worlds: (json['worlds'] as List)?.map((e) => e as String)?.toList(),
  );
}

WorldFailure _$WorldFailureFromJson(Map<String, dynamic> json) {
  return WorldFailure(
    failureCode: _$enumDecodeNullable(
        _$WorldGenerationJobErrorCodeEnumMap, json['failureCode']),
    failureCount: json['failureCount'] as int,
    sampleFailureReason: json['sampleFailureReason'] as String,
  );
}

WorldGenerationJobSummary _$WorldGenerationJobSummaryFromJson(
    Map<String, dynamic> json) {
  return WorldGenerationJobSummary(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    failedWorldCount: json['failedWorldCount'] as int,
    status:
        _$enumDecodeNullable(_$WorldGenerationJobStatusEnumMap, json['status']),
    succeededWorldCount: json['succeededWorldCount'] as int,
    template: json['template'] as String,
    worldCount: json['worldCount'] == null
        ? null
        : WorldCount.fromJson(json['worldCount'] as Map<String, dynamic>),
  );
}

WorldSummary _$WorldSummaryFromJson(Map<String, dynamic> json) {
  return WorldSummary(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    generationJob: json['generationJob'] as String,
    template: json['template'] as String,
  );
}
