// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-11-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelDeploymentResponse _$CancelDeploymentResponseFromJson(
    Map<String, dynamic> json) {
  return CancelDeploymentResponse(
    message: json['message'] as String,
  );
}

CloudComponentStatus _$CloudComponentStatusFromJson(Map<String, dynamic> json) {
  return CloudComponentStatus(
    componentState: _$enumDecodeNullable(
        _$CloudComponentStateEnumMap, json['componentState']),
    errors: (json['errors'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    message: json['message'] as String,
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

const _$CloudComponentStateEnumMap = {
  CloudComponentState.requested: 'REQUESTED',
  CloudComponentState.initiated: 'INITIATED',
  CloudComponentState.deployable: 'DEPLOYABLE',
  CloudComponentState.failed: 'FAILED',
  CloudComponentState.deprecated: 'DEPRECATED',
};

Component _$ComponentFromJson(Map<String, dynamic> json) {
  return Component(
    arn: json['arn'] as String,
    componentName: json['componentName'] as String,
    latestVersion: json['latestVersion'] == null
        ? null
        : ComponentLatestVersion.fromJson(
            json['latestVersion'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ComponentCandidateToJson(ComponentCandidate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('componentName', instance.componentName);
  writeNotNull('componentVersion', instance.componentVersion);
  writeNotNull('versionRequirements', instance.versionRequirements);
  return val;
}

ComponentConfigurationUpdate _$ComponentConfigurationUpdateFromJson(
    Map<String, dynamic> json) {
  return ComponentConfigurationUpdate(
    merge: json['merge'] as String,
    reset: (json['reset'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ComponentConfigurationUpdateToJson(
    ComponentConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('merge', instance.merge);
  writeNotNull('reset', instance.reset);
  return val;
}

Map<String, dynamic> _$ComponentDependencyRequirementToJson(
    ComponentDependencyRequirement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dependencyType',
      _$ComponentDependencyTypeEnumMap[instance.dependencyType]);
  writeNotNull('versionRequirement', instance.versionRequirement);
  return val;
}

const _$ComponentDependencyTypeEnumMap = {
  ComponentDependencyType.hard: 'HARD',
  ComponentDependencyType.soft: 'SOFT',
};

ComponentDeploymentSpecification _$ComponentDeploymentSpecificationFromJson(
    Map<String, dynamic> json) {
  return ComponentDeploymentSpecification(
    componentVersion: json['componentVersion'] as String,
    configurationUpdate: json['configurationUpdate'] == null
        ? null
        : ComponentConfigurationUpdate.fromJson(
            json['configurationUpdate'] as Map<String, dynamic>),
    runWith: json['runWith'] == null
        ? null
        : ComponentRunWith.fromJson(json['runWith'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ComponentDeploymentSpecificationToJson(
    ComponentDeploymentSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('componentVersion', instance.componentVersion);
  writeNotNull('configurationUpdate', instance.configurationUpdate?.toJson());
  writeNotNull('runWith', instance.runWith?.toJson());
  return val;
}

ComponentLatestVersion _$ComponentLatestVersionFromJson(
    Map<String, dynamic> json) {
  return ComponentLatestVersion(
    arn: json['arn'] as String,
    componentVersion: json['componentVersion'] as String,
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['creationTimestamp']),
    description: json['description'] as String,
    platforms: (json['platforms'] as List)
        ?.map((e) => e == null
            ? null
            : ComponentPlatform.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    publisher: json['publisher'] as String,
  );
}

ComponentPlatform _$ComponentPlatformFromJson(Map<String, dynamic> json) {
  return ComponentPlatform(
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ComponentPlatformToJson(ComponentPlatform instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributes', instance.attributes);
  writeNotNull('name', instance.name);
  return val;
}

ComponentRunWith _$ComponentRunWithFromJson(Map<String, dynamic> json) {
  return ComponentRunWith(
    posixUser: json['posixUser'] as String,
  );
}

Map<String, dynamic> _$ComponentRunWithToJson(ComponentRunWith instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('posixUser', instance.posixUser);
  return val;
}

ComponentVersionListItem _$ComponentVersionListItemFromJson(
    Map<String, dynamic> json) {
  return ComponentVersionListItem(
    arn: json['arn'] as String,
    componentName: json['componentName'] as String,
    componentVersion: json['componentVersion'] as String,
  );
}

CoreDevice _$CoreDeviceFromJson(Map<String, dynamic> json) {
  return CoreDevice(
    coreDeviceThingName: json['coreDeviceThingName'] as String,
    lastStatusUpdateTimestamp: const UnixDateTimeConverter()
        .fromJson(json['lastStatusUpdateTimestamp']),
    status: _$enumDecodeNullable(_$CoreDeviceStatusEnumMap, json['status']),
  );
}

const _$CoreDeviceStatusEnumMap = {
  CoreDeviceStatus.healthy: 'HEALTHY',
  CoreDeviceStatus.unhealthy: 'UNHEALTHY',
};

CreateComponentVersionResponse _$CreateComponentVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateComponentVersionResponse(
    componentName: json['componentName'] as String,
    componentVersion: json['componentVersion'] as String,
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['creationTimestamp']),
    status: json['status'] == null
        ? null
        : CloudComponentStatus.fromJson(json['status'] as Map<String, dynamic>),
    arn: json['arn'] as String,
  );
}

CreateDeploymentResponse _$CreateDeploymentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDeploymentResponse(
    deploymentId: json['deploymentId'] as String,
    iotJobArn: json['iotJobArn'] as String,
    iotJobId: json['iotJobId'] as String,
  );
}

Deployment _$DeploymentFromJson(Map<String, dynamic> json) {
  return Deployment(
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['creationTimestamp']),
    deploymentId: json['deploymentId'] as String,
    deploymentName: json['deploymentName'] as String,
    deploymentStatus: _$enumDecodeNullable(
        _$DeploymentStatusEnumMap, json['deploymentStatus']),
    isLatestForTarget: json['isLatestForTarget'] as bool,
    revisionId: json['revisionId'] as String,
    targetArn: json['targetArn'] as String,
  );
}

const _$DeploymentStatusEnumMap = {
  DeploymentStatus.active: 'ACTIVE',
  DeploymentStatus.completed: 'COMPLETED',
  DeploymentStatus.canceled: 'CANCELED',
  DeploymentStatus.failed: 'FAILED',
  DeploymentStatus.inactive: 'INACTIVE',
};

DeploymentComponentUpdatePolicy _$DeploymentComponentUpdatePolicyFromJson(
    Map<String, dynamic> json) {
  return DeploymentComponentUpdatePolicy(
    action: _$enumDecodeNullable(
        _$DeploymentComponentUpdatePolicyActionEnumMap, json['action']),
    timeoutInSeconds: json['timeoutInSeconds'] as int,
  );
}

Map<String, dynamic> _$DeploymentComponentUpdatePolicyToJson(
    DeploymentComponentUpdatePolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('action',
      _$DeploymentComponentUpdatePolicyActionEnumMap[instance.action]);
  writeNotNull('timeoutInSeconds', instance.timeoutInSeconds);
  return val;
}

const _$DeploymentComponentUpdatePolicyActionEnumMap = {
  DeploymentComponentUpdatePolicyAction.notifyComponents: 'NOTIFY_COMPONENTS',
  DeploymentComponentUpdatePolicyAction.skipNotifyComponents:
      'SKIP_NOTIFY_COMPONENTS',
};

DeploymentConfigurationValidationPolicy
    _$DeploymentConfigurationValidationPolicyFromJson(
        Map<String, dynamic> json) {
  return DeploymentConfigurationValidationPolicy(
    timeoutInSeconds: json['timeoutInSeconds'] as int,
  );
}

Map<String, dynamic> _$DeploymentConfigurationValidationPolicyToJson(
    DeploymentConfigurationValidationPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timeoutInSeconds', instance.timeoutInSeconds);
  return val;
}

DeploymentIoTJobConfiguration _$DeploymentIoTJobConfigurationFromJson(
    Map<String, dynamic> json) {
  return DeploymentIoTJobConfiguration(
    abortConfig: json['abortConfig'] == null
        ? null
        : IoTJobAbortConfig.fromJson(
            json['abortConfig'] as Map<String, dynamic>),
    jobExecutionsRolloutConfig: json['jobExecutionsRolloutConfig'] == null
        ? null
        : IoTJobExecutionsRolloutConfig.fromJson(
            json['jobExecutionsRolloutConfig'] as Map<String, dynamic>),
    timeoutConfig: json['timeoutConfig'] == null
        ? null
        : IoTJobTimeoutConfig.fromJson(
            json['timeoutConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeploymentIoTJobConfigurationToJson(
    DeploymentIoTJobConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('abortConfig', instance.abortConfig?.toJson());
  writeNotNull('jobExecutionsRolloutConfig',
      instance.jobExecutionsRolloutConfig?.toJson());
  writeNotNull('timeoutConfig', instance.timeoutConfig?.toJson());
  return val;
}

DeploymentPolicies _$DeploymentPoliciesFromJson(Map<String, dynamic> json) {
  return DeploymentPolicies(
    componentUpdatePolicy: json['componentUpdatePolicy'] == null
        ? null
        : DeploymentComponentUpdatePolicy.fromJson(
            json['componentUpdatePolicy'] as Map<String, dynamic>),
    configurationValidationPolicy: json['configurationValidationPolicy'] == null
        ? null
        : DeploymentConfigurationValidationPolicy.fromJson(
            json['configurationValidationPolicy'] as Map<String, dynamic>),
    failureHandlingPolicy: _$enumDecodeNullable(
        _$DeploymentFailureHandlingPolicyEnumMap,
        json['failureHandlingPolicy']),
  );
}

Map<String, dynamic> _$DeploymentPoliciesToJson(DeploymentPolicies instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'componentUpdatePolicy', instance.componentUpdatePolicy?.toJson());
  writeNotNull('configurationValidationPolicy',
      instance.configurationValidationPolicy?.toJson());
  writeNotNull('failureHandlingPolicy',
      _$DeploymentFailureHandlingPolicyEnumMap[instance.failureHandlingPolicy]);
  return val;
}

const _$DeploymentFailureHandlingPolicyEnumMap = {
  DeploymentFailureHandlingPolicy.rollback: 'ROLLBACK',
  DeploymentFailureHandlingPolicy.doNothing: 'DO_NOTHING',
};

DescribeComponentResponse _$DescribeComponentResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeComponentResponse(
    arn: json['arn'] as String,
    componentName: json['componentName'] as String,
    componentVersion: json['componentVersion'] as String,
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['creationTimestamp']),
    description: json['description'] as String,
    platforms: (json['platforms'] as List)
        ?.map((e) => e == null
            ? null
            : ComponentPlatform.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    publisher: json['publisher'] as String,
    status: json['status'] == null
        ? null
        : CloudComponentStatus.fromJson(json['status'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

EffectiveDeployment _$EffectiveDeploymentFromJson(Map<String, dynamic> json) {
  return EffectiveDeployment(
    coreDeviceExecutionStatus: _$enumDecodeNullable(
        _$EffectiveDeploymentExecutionStatusEnumMap,
        json['coreDeviceExecutionStatus']),
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['creationTimestamp']),
    deploymentId: json['deploymentId'] as String,
    deploymentName: json['deploymentName'] as String,
    modifiedTimestamp:
        const UnixDateTimeConverter().fromJson(json['modifiedTimestamp']),
    targetArn: json['targetArn'] as String,
    description: json['description'] as String,
    iotJobArn: json['iotJobArn'] as String,
    iotJobId: json['iotJobId'] as String,
    reason: json['reason'] as String,
  );
}

const _$EffectiveDeploymentExecutionStatusEnumMap = {
  EffectiveDeploymentExecutionStatus.inProgress: 'IN_PROGRESS',
  EffectiveDeploymentExecutionStatus.queued: 'QUEUED',
  EffectiveDeploymentExecutionStatus.failed: 'FAILED',
  EffectiveDeploymentExecutionStatus.completed: 'COMPLETED',
  EffectiveDeploymentExecutionStatus.timedOut: 'TIMED_OUT',
  EffectiveDeploymentExecutionStatus.canceled: 'CANCELED',
  EffectiveDeploymentExecutionStatus.rejected: 'REJECTED',
};

GetComponentResponse _$GetComponentResponseFromJson(Map<String, dynamic> json) {
  return GetComponentResponse(
    recipe: const Uint8ListConverter().fromJson(json['recipe'] as String),
    recipeOutputFormat: _$enumDecodeNullable(
        _$RecipeOutputFormatEnumMap, json['recipeOutputFormat']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$RecipeOutputFormatEnumMap = {
  RecipeOutputFormat.json: 'JSON',
  RecipeOutputFormat.yaml: 'YAML',
};

GetComponentVersionArtifactResponse
    _$GetComponentVersionArtifactResponseFromJson(Map<String, dynamic> json) {
  return GetComponentVersionArtifactResponse(
    preSignedUrl: json['preSignedUrl'] as String,
  );
}

GetCoreDeviceResponse _$GetCoreDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return GetCoreDeviceResponse(
    architecture: json['architecture'] as String,
    coreDeviceThingName: json['coreDeviceThingName'] as String,
    coreVersion: json['coreVersion'] as String,
    lastStatusUpdateTimestamp: const UnixDateTimeConverter()
        .fromJson(json['lastStatusUpdateTimestamp']),
    platform: json['platform'] as String,
    status: _$enumDecodeNullable(_$CoreDeviceStatusEnumMap, json['status']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetDeploymentResponse _$GetDeploymentResponseFromJson(
    Map<String, dynamic> json) {
  return GetDeploymentResponse(
    components: (json['components'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ComponentDeploymentSpecification.fromJson(
                  e as Map<String, dynamic>)),
    ),
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['creationTimestamp']),
    deploymentId: json['deploymentId'] as String,
    deploymentName: json['deploymentName'] as String,
    deploymentPolicies: json['deploymentPolicies'] == null
        ? null
        : DeploymentPolicies.fromJson(
            json['deploymentPolicies'] as Map<String, dynamic>),
    deploymentStatus: _$enumDecodeNullable(
        _$DeploymentStatusEnumMap, json['deploymentStatus']),
    iotJobArn: json['iotJobArn'] as String,
    iotJobConfiguration: json['iotJobConfiguration'] == null
        ? null
        : DeploymentIoTJobConfiguration.fromJson(
            json['iotJobConfiguration'] as Map<String, dynamic>),
    iotJobId: json['iotJobId'] as String,
    isLatestForTarget: json['isLatestForTarget'] as bool,
    revisionId: json['revisionId'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    targetArn: json['targetArn'] as String,
  );
}

InstalledComponent _$InstalledComponentFromJson(Map<String, dynamic> json) {
  return InstalledComponent(
    componentName: json['componentName'] as String,
    componentVersion: json['componentVersion'] as String,
    isRoot: json['isRoot'] as bool,
    lifecycleState: _$enumDecodeNullable(
        _$InstalledComponentLifecycleStateEnumMap, json['lifecycleState']),
    lifecycleStateDetails: json['lifecycleStateDetails'] as String,
  );
}

const _$InstalledComponentLifecycleStateEnumMap = {
  InstalledComponentLifecycleState.$new: 'NEW',
  InstalledComponentLifecycleState.installed: 'INSTALLED',
  InstalledComponentLifecycleState.starting: 'STARTING',
  InstalledComponentLifecycleState.running: 'RUNNING',
  InstalledComponentLifecycleState.stopping: 'STOPPING',
  InstalledComponentLifecycleState.errored: 'ERRORED',
  InstalledComponentLifecycleState.broken: 'BROKEN',
  InstalledComponentLifecycleState.finished: 'FINISHED',
};

IoTJobAbortConfig _$IoTJobAbortConfigFromJson(Map<String, dynamic> json) {
  return IoTJobAbortConfig(
    criteriaList: (json['criteriaList'] as List)
        ?.map((e) => e == null
            ? null
            : IoTJobAbortCriteria.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$IoTJobAbortConfigToJson(IoTJobAbortConfig instance) {
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

IoTJobAbortCriteria _$IoTJobAbortCriteriaFromJson(Map<String, dynamic> json) {
  return IoTJobAbortCriteria(
    action: _$enumDecodeNullable(_$IoTJobAbortActionEnumMap, json['action']),
    failureType: _$enumDecodeNullable(
        _$IoTJobExecutionFailureTypeEnumMap, json['failureType']),
    minNumberOfExecutedThings: json['minNumberOfExecutedThings'] as int,
    thresholdPercentage: (json['thresholdPercentage'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$IoTJobAbortCriteriaToJson(IoTJobAbortCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('action', _$IoTJobAbortActionEnumMap[instance.action]);
  writeNotNull(
      'failureType', _$IoTJobExecutionFailureTypeEnumMap[instance.failureType]);
  writeNotNull('minNumberOfExecutedThings', instance.minNumberOfExecutedThings);
  writeNotNull('thresholdPercentage', instance.thresholdPercentage);
  return val;
}

const _$IoTJobAbortActionEnumMap = {
  IoTJobAbortAction.cancel: 'CANCEL',
};

const _$IoTJobExecutionFailureTypeEnumMap = {
  IoTJobExecutionFailureType.failed: 'FAILED',
  IoTJobExecutionFailureType.rejected: 'REJECTED',
  IoTJobExecutionFailureType.timedOut: 'TIMED_OUT',
  IoTJobExecutionFailureType.all: 'ALL',
};

IoTJobExecutionsRolloutConfig _$IoTJobExecutionsRolloutConfigFromJson(
    Map<String, dynamic> json) {
  return IoTJobExecutionsRolloutConfig(
    exponentialRate: json['exponentialRate'] == null
        ? null
        : IoTJobExponentialRolloutRate.fromJson(
            json['exponentialRate'] as Map<String, dynamic>),
    maximumPerMinute: json['maximumPerMinute'] as int,
  );
}

Map<String, dynamic> _$IoTJobExecutionsRolloutConfigToJson(
    IoTJobExecutionsRolloutConfig instance) {
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

IoTJobExponentialRolloutRate _$IoTJobExponentialRolloutRateFromJson(
    Map<String, dynamic> json) {
  return IoTJobExponentialRolloutRate(
    baseRatePerMinute: json['baseRatePerMinute'] as int,
    incrementFactor: (json['incrementFactor'] as num)?.toDouble(),
    rateIncreaseCriteria: json['rateIncreaseCriteria'] == null
        ? null
        : IoTJobRateIncreaseCriteria.fromJson(
            json['rateIncreaseCriteria'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IoTJobExponentialRolloutRateToJson(
    IoTJobExponentialRolloutRate instance) {
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

IoTJobRateIncreaseCriteria _$IoTJobRateIncreaseCriteriaFromJson(
    Map<String, dynamic> json) {
  return IoTJobRateIncreaseCriteria(
    numberOfNotifiedThings: json['numberOfNotifiedThings'] as int,
    numberOfSucceededThings: json['numberOfSucceededThings'] as int,
  );
}

Map<String, dynamic> _$IoTJobRateIncreaseCriteriaToJson(
    IoTJobRateIncreaseCriteria instance) {
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

IoTJobTimeoutConfig _$IoTJobTimeoutConfigFromJson(Map<String, dynamic> json) {
  return IoTJobTimeoutConfig(
    inProgressTimeoutInMinutes: json['inProgressTimeoutInMinutes'] as int,
  );
}

Map<String, dynamic> _$IoTJobTimeoutConfigToJson(IoTJobTimeoutConfig instance) {
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

Map<String, dynamic> _$LambdaContainerParamsToJson(
    LambdaContainerParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('devices', instance.devices?.map((e) => e?.toJson())?.toList());
  writeNotNull('memorySizeInKB', instance.memorySizeInKB);
  writeNotNull('mountROSysfs', instance.mountROSysfs);
  writeNotNull('volumes', instance.volumes?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$LambdaDeviceMountToJson(LambdaDeviceMount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('path', instance.path);
  writeNotNull('addGroupOwner', instance.addGroupOwner);
  writeNotNull(
      'permission', _$LambdaFilesystemPermissionEnumMap[instance.permission]);
  return val;
}

const _$LambdaFilesystemPermissionEnumMap = {
  LambdaFilesystemPermission.ro: 'ro',
  LambdaFilesystemPermission.rw: 'rw',
};

Map<String, dynamic> _$LambdaEventSourceToJson(LambdaEventSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('topic', instance.topic);
  writeNotNull('type', _$LambdaEventSourceTypeEnumMap[instance.type]);
  return val;
}

const _$LambdaEventSourceTypeEnumMap = {
  LambdaEventSourceType.pubSub: 'PUB_SUB',
  LambdaEventSourceType.iotCore: 'IOT_CORE',
};

Map<String, dynamic> _$LambdaExecutionParametersToJson(
    LambdaExecutionParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('environmentVariables', instance.environmentVariables);
  writeNotNull(
      'eventSources', instance.eventSources?.map((e) => e?.toJson())?.toList());
  writeNotNull('execArgs', instance.execArgs);
  writeNotNull(
      'inputPayloadEncodingType',
      _$LambdaInputPayloadEncodingTypeEnumMap[
          instance.inputPayloadEncodingType]);
  writeNotNull('linuxProcessParams', instance.linuxProcessParams?.toJson());
  writeNotNull('maxIdleTimeInSeconds', instance.maxIdleTimeInSeconds);
  writeNotNull('maxInstancesCount', instance.maxInstancesCount);
  writeNotNull('maxQueueSize', instance.maxQueueSize);
  writeNotNull('pinned', instance.pinned);
  writeNotNull('statusTimeoutInSeconds', instance.statusTimeoutInSeconds);
  writeNotNull('timeoutInSeconds', instance.timeoutInSeconds);
  return val;
}

const _$LambdaInputPayloadEncodingTypeEnumMap = {
  LambdaInputPayloadEncodingType.json: 'json',
  LambdaInputPayloadEncodingType.binary: 'binary',
};

Map<String, dynamic> _$LambdaFunctionRecipeSourceToJson(
    LambdaFunctionRecipeSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lambdaArn', instance.lambdaArn);
  writeNotNull('componentDependencies',
      instance.componentDependencies?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('componentLambdaParameters',
      instance.componentLambdaParameters?.toJson());
  writeNotNull('componentName', instance.componentName);
  writeNotNull('componentPlatforms',
      instance.componentPlatforms?.map((e) => e?.toJson())?.toList());
  writeNotNull('componentVersion', instance.componentVersion);
  return val;
}

Map<String, dynamic> _$LambdaLinuxProcessParamsToJson(
    LambdaLinuxProcessParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerParams', instance.containerParams?.toJson());
  writeNotNull(
      'isolationMode', _$LambdaIsolationModeEnumMap[instance.isolationMode]);
  return val;
}

const _$LambdaIsolationModeEnumMap = {
  LambdaIsolationMode.greengrassContainer: 'GreengrassContainer',
  LambdaIsolationMode.noContainer: 'NoContainer',
};

Map<String, dynamic> _$LambdaVolumeMountToJson(LambdaVolumeMount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destinationPath', instance.destinationPath);
  writeNotNull('sourcePath', instance.sourcePath);
  writeNotNull('addGroupOwner', instance.addGroupOwner);
  writeNotNull(
      'permission', _$LambdaFilesystemPermissionEnumMap[instance.permission]);
  return val;
}

ListComponentVersionsResponse _$ListComponentVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListComponentVersionsResponse(
    componentVersions: (json['componentVersions'] as List)
        ?.map((e) => e == null
            ? null
            : ComponentVersionListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListComponentsResponse _$ListComponentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListComponentsResponse(
    components: (json['components'] as List)
        ?.map((e) =>
            e == null ? null : Component.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListCoreDevicesResponse _$ListCoreDevicesResponseFromJson(
    Map<String, dynamic> json) {
  return ListCoreDevicesResponse(
    coreDevices: (json['coreDevices'] as List)
        ?.map((e) =>
            e == null ? null : CoreDevice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDeploymentsResponse _$ListDeploymentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDeploymentsResponse(
    deployments: (json['deployments'] as List)
        ?.map((e) =>
            e == null ? null : Deployment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListEffectiveDeploymentsResponse _$ListEffectiveDeploymentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEffectiveDeploymentsResponse(
    effectiveDeployments: (json['effectiveDeployments'] as List)
        ?.map((e) => e == null
            ? null
            : EffectiveDeployment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListInstalledComponentsResponse _$ListInstalledComponentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListInstalledComponentsResponse(
    installedComponents: (json['installedComponents'] as List)
        ?.map((e) => e == null
            ? null
            : InstalledComponent.fromJson(e as Map<String, dynamic>))
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

ResolveComponentCandidatesResponse _$ResolveComponentCandidatesResponseFromJson(
    Map<String, dynamic> json) {
  return ResolveComponentCandidatesResponse(
    resolvedComponentVersions: (json['resolvedComponentVersions'] as List)
        ?.map((e) => e == null
            ? null
            : ResolvedComponentVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ResolvedComponentVersion _$ResolvedComponentVersionFromJson(
    Map<String, dynamic> json) {
  return ResolvedComponentVersion(
    arn: json['arn'] as String,
    componentName: json['componentName'] as String,
    componentVersion: json['componentVersion'] as String,
    recipe: const Uint8ListConverter().fromJson(json['recipe'] as String),
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}
