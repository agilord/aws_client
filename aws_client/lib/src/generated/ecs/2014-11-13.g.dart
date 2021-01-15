// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-11-13.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return Attachment(
    details: (json['details'] as List)
        ?.map((e) =>
            e == null ? null : KeyValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    status: json['status'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$AttachmentStateChangeToJson(
    AttachmentStateChange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attachmentArn', instance.attachmentArn);
  writeNotNull('status', instance.status);
  return val;
}

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    name: json['name'] as String,
    targetId: json['targetId'] as String,
    targetType: _$enumDecodeNullable(_$TargetTypeEnumMap, json['targetType']),
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

  writeNotNull('name', instance.name);
  writeNotNull('targetId', instance.targetId);
  writeNotNull('targetType', _$TargetTypeEnumMap[instance.targetType]);
  writeNotNull('value', instance.value);
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

const _$TargetTypeEnumMap = {
  TargetType.containerInstance: 'container-instance',
};

AutoScalingGroupProvider _$AutoScalingGroupProviderFromJson(
    Map<String, dynamic> json) {
  return AutoScalingGroupProvider(
    autoScalingGroupArn: json['autoScalingGroupArn'] as String,
    managedScaling: json['managedScaling'] == null
        ? null
        : ManagedScaling.fromJson(
            json['managedScaling'] as Map<String, dynamic>),
    managedTerminationProtection: _$enumDecodeNullable(
        _$ManagedTerminationProtectionEnumMap,
        json['managedTerminationProtection']),
  );
}

Map<String, dynamic> _$AutoScalingGroupProviderToJson(
    AutoScalingGroupProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('autoScalingGroupArn', instance.autoScalingGroupArn);
  writeNotNull('managedScaling', instance.managedScaling?.toJson());
  writeNotNull(
      'managedTerminationProtection',
      _$ManagedTerminationProtectionEnumMap[
          instance.managedTerminationProtection]);
  return val;
}

const _$ManagedTerminationProtectionEnumMap = {
  ManagedTerminationProtection.enabled: 'ENABLED',
  ManagedTerminationProtection.disabled: 'DISABLED',
};

Map<String, dynamic> _$AutoScalingGroupProviderUpdateToJson(
    AutoScalingGroupProviderUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('managedScaling', instance.managedScaling?.toJson());
  writeNotNull(
      'managedTerminationProtection',
      _$ManagedTerminationProtectionEnumMap[
          instance.managedTerminationProtection]);
  return val;
}

AwsVpcConfiguration _$AwsVpcConfigurationFromJson(Map<String, dynamic> json) {
  return AwsVpcConfiguration(
    subnets: (json['subnets'] as List)?.map((e) => e as String)?.toList(),
    assignPublicIp:
        _$enumDecodeNullable(_$AssignPublicIpEnumMap, json['assignPublicIp']),
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AwsVpcConfigurationToJson(AwsVpcConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subnets', instance.subnets);
  writeNotNull(
      'assignPublicIp', _$AssignPublicIpEnumMap[instance.assignPublicIp]);
  writeNotNull('securityGroups', instance.securityGroups);
  return val;
}

const _$AssignPublicIpEnumMap = {
  AssignPublicIp.enabled: 'ENABLED',
  AssignPublicIp.disabled: 'DISABLED',
};

CapacityProvider _$CapacityProviderFromJson(Map<String, dynamic> json) {
  return CapacityProvider(
    autoScalingGroupProvider: json['autoScalingGroupProvider'] == null
        ? null
        : AutoScalingGroupProvider.fromJson(
            json['autoScalingGroupProvider'] as Map<String, dynamic>),
    capacityProviderArn: json['capacityProviderArn'] as String,
    name: json['name'] as String,
    status:
        _$enumDecodeNullable(_$CapacityProviderStatusEnumMap, json['status']),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    updateStatus: _$enumDecodeNullable(
        _$CapacityProviderUpdateStatusEnumMap, json['updateStatus']),
    updateStatusReason: json['updateStatusReason'] as String,
  );
}

const _$CapacityProviderStatusEnumMap = {
  CapacityProviderStatus.active: 'ACTIVE',
  CapacityProviderStatus.inactive: 'INACTIVE',
};

const _$CapacityProviderUpdateStatusEnumMap = {
  CapacityProviderUpdateStatus.deleteInProgress: 'DELETE_IN_PROGRESS',
  CapacityProviderUpdateStatus.deleteComplete: 'DELETE_COMPLETE',
  CapacityProviderUpdateStatus.deleteFailed: 'DELETE_FAILED',
  CapacityProviderUpdateStatus.updateInProgress: 'UPDATE_IN_PROGRESS',
  CapacityProviderUpdateStatus.updateComplete: 'UPDATE_COMPLETE',
  CapacityProviderUpdateStatus.updateFailed: 'UPDATE_FAILED',
};

CapacityProviderStrategyItem _$CapacityProviderStrategyItemFromJson(
    Map<String, dynamic> json) {
  return CapacityProviderStrategyItem(
    capacityProvider: json['capacityProvider'] as String,
    base: json['base'] as int,
    weight: json['weight'] as int,
  );
}

Map<String, dynamic> _$CapacityProviderStrategyItemToJson(
    CapacityProviderStrategyItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('capacityProvider', instance.capacityProvider);
  writeNotNull('base', instance.base);
  writeNotNull('weight', instance.weight);
  return val;
}

Cluster _$ClusterFromJson(Map<String, dynamic> json) {
  return Cluster(
    activeServicesCount: json['activeServicesCount'] as int,
    attachments: (json['attachments'] as List)
        ?.map((e) =>
            e == null ? null : Attachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    attachmentsStatus: json['attachmentsStatus'] as String,
    capacityProviders:
        (json['capacityProviders'] as List)?.map((e) => e as String)?.toList(),
    clusterArn: json['clusterArn'] as String,
    clusterName: json['clusterName'] as String,
    defaultCapacityProviderStrategy: (json['defaultCapacityProviderStrategy']
            as List)
        ?.map((e) => e == null
            ? null
            : CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pendingTasksCount: json['pendingTasksCount'] as int,
    registeredContainerInstancesCount:
        json['registeredContainerInstancesCount'] as int,
    runningTasksCount: json['runningTasksCount'] as int,
    settings: (json['settings'] as List)
        ?.map((e) => e == null
            ? null
            : ClusterSetting.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statistics: (json['statistics'] as List)
        ?.map((e) =>
            e == null ? null : KeyValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ClusterSetting _$ClusterSettingFromJson(Map<String, dynamic> json) {
  return ClusterSetting(
    name: _$enumDecodeNullable(_$ClusterSettingNameEnumMap, json['name']),
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ClusterSettingToJson(ClusterSetting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$ClusterSettingNameEnumMap[instance.name]);
  writeNotNull('value', instance.value);
  return val;
}

const _$ClusterSettingNameEnumMap = {
  ClusterSettingName.containerInsights: 'containerInsights',
};

Container _$ContainerFromJson(Map<String, dynamic> json) {
  return Container(
    containerArn: json['containerArn'] as String,
    cpu: json['cpu'] as String,
    exitCode: json['exitCode'] as int,
    gpuIds: (json['gpuIds'] as List)?.map((e) => e as String)?.toList(),
    healthStatus:
        _$enumDecodeNullable(_$HealthStatusEnumMap, json['healthStatus']),
    image: json['image'] as String,
    imageDigest: json['imageDigest'] as String,
    lastStatus: json['lastStatus'] as String,
    memory: json['memory'] as String,
    memoryReservation: json['memoryReservation'] as String,
    name: json['name'] as String,
    networkBindings: (json['networkBindings'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkBinding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkInterfaces: (json['networkInterfaces'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reason: json['reason'] as String,
    runtimeId: json['runtimeId'] as String,
    taskArn: json['taskArn'] as String,
  );
}

const _$HealthStatusEnumMap = {
  HealthStatus.healthy: 'HEALTHY',
  HealthStatus.unhealthy: 'UNHEALTHY',
  HealthStatus.unknown: 'UNKNOWN',
};

ContainerDefinition _$ContainerDefinitionFromJson(Map<String, dynamic> json) {
  return ContainerDefinition(
    command: (json['command'] as List)?.map((e) => e as String)?.toList(),
    cpu: json['cpu'] as int,
    dependsOn: (json['dependsOn'] as List)
        ?.map((e) => e == null
            ? null
            : ContainerDependency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    disableNetworking: json['disableNetworking'] as bool,
    dnsSearchDomains:
        (json['dnsSearchDomains'] as List)?.map((e) => e as String)?.toList(),
    dnsServers: (json['dnsServers'] as List)?.map((e) => e as String)?.toList(),
    dockerLabels: (json['dockerLabels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    dockerSecurityOptions: (json['dockerSecurityOptions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    entryPoint: (json['entryPoint'] as List)?.map((e) => e as String)?.toList(),
    environment: (json['environment'] as List)
        ?.map((e) =>
            e == null ? null : KeyValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    environmentFiles: (json['environmentFiles'] as List)
        ?.map((e) => e == null
            ? null
            : EnvironmentFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    essential: json['essential'] as bool,
    extraHosts: (json['extraHosts'] as List)
        ?.map((e) =>
            e == null ? null : HostEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    firelensConfiguration: json['firelensConfiguration'] == null
        ? null
        : FirelensConfiguration.fromJson(
            json['firelensConfiguration'] as Map<String, dynamic>),
    healthCheck: json['healthCheck'] == null
        ? null
        : HealthCheck.fromJson(json['healthCheck'] as Map<String, dynamic>),
    hostname: json['hostname'] as String,
    image: json['image'] as String,
    interactive: json['interactive'] as bool,
    links: (json['links'] as List)?.map((e) => e as String)?.toList(),
    linuxParameters: json['linuxParameters'] == null
        ? null
        : LinuxParameters.fromJson(
            json['linuxParameters'] as Map<String, dynamic>),
    logConfiguration: json['logConfiguration'] == null
        ? null
        : LogConfiguration.fromJson(
            json['logConfiguration'] as Map<String, dynamic>),
    memory: json['memory'] as int,
    memoryReservation: json['memoryReservation'] as int,
    mountPoints: (json['mountPoints'] as List)
        ?.map((e) =>
            e == null ? null : MountPoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    portMappings: (json['portMappings'] as List)
        ?.map((e) =>
            e == null ? null : PortMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    privileged: json['privileged'] as bool,
    pseudoTerminal: json['pseudoTerminal'] as bool,
    readonlyRootFilesystem: json['readonlyRootFilesystem'] as bool,
    repositoryCredentials: json['repositoryCredentials'] == null
        ? null
        : RepositoryCredentials.fromJson(
            json['repositoryCredentials'] as Map<String, dynamic>),
    resourceRequirements: (json['resourceRequirements'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceRequirement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secrets: (json['secrets'] as List)
        ?.map((e) =>
            e == null ? null : Secret.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    startTimeout: json['startTimeout'] as int,
    stopTimeout: json['stopTimeout'] as int,
    systemControls: (json['systemControls'] as List)
        ?.map((e) => e == null
            ? null
            : SystemControl.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ulimits: (json['ulimits'] as List)
        ?.map((e) =>
            e == null ? null : Ulimit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    user: json['user'] as String,
    volumesFrom: (json['volumesFrom'] as List)
        ?.map((e) =>
            e == null ? null : VolumeFrom.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    workingDirectory: json['workingDirectory'] as String,
  );
}

Map<String, dynamic> _$ContainerDefinitionToJson(ContainerDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('command', instance.command);
  writeNotNull('cpu', instance.cpu);
  writeNotNull(
      'dependsOn', instance.dependsOn?.map((e) => e?.toJson())?.toList());
  writeNotNull('disableNetworking', instance.disableNetworking);
  writeNotNull('dnsSearchDomains', instance.dnsSearchDomains);
  writeNotNull('dnsServers', instance.dnsServers);
  writeNotNull('dockerLabels', instance.dockerLabels);
  writeNotNull('dockerSecurityOptions', instance.dockerSecurityOptions);
  writeNotNull('entryPoint', instance.entryPoint);
  writeNotNull(
      'environment', instance.environment?.map((e) => e?.toJson())?.toList());
  writeNotNull('environmentFiles',
      instance.environmentFiles?.map((e) => e?.toJson())?.toList());
  writeNotNull('essential', instance.essential);
  writeNotNull(
      'extraHosts', instance.extraHosts?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'firelensConfiguration', instance.firelensConfiguration?.toJson());
  writeNotNull('healthCheck', instance.healthCheck?.toJson());
  writeNotNull('hostname', instance.hostname);
  writeNotNull('image', instance.image);
  writeNotNull('interactive', instance.interactive);
  writeNotNull('links', instance.links);
  writeNotNull('linuxParameters', instance.linuxParameters?.toJson());
  writeNotNull('logConfiguration', instance.logConfiguration?.toJson());
  writeNotNull('memory', instance.memory);
  writeNotNull('memoryReservation', instance.memoryReservation);
  writeNotNull(
      'mountPoints', instance.mountPoints?.map((e) => e?.toJson())?.toList());
  writeNotNull('name', instance.name);
  writeNotNull(
      'portMappings', instance.portMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull('privileged', instance.privileged);
  writeNotNull('pseudoTerminal', instance.pseudoTerminal);
  writeNotNull('readonlyRootFilesystem', instance.readonlyRootFilesystem);
  writeNotNull(
      'repositoryCredentials', instance.repositoryCredentials?.toJson());
  writeNotNull('resourceRequirements',
      instance.resourceRequirements?.map((e) => e?.toJson())?.toList());
  writeNotNull('secrets', instance.secrets?.map((e) => e?.toJson())?.toList());
  writeNotNull('startTimeout', instance.startTimeout);
  writeNotNull('stopTimeout', instance.stopTimeout);
  writeNotNull('systemControls',
      instance.systemControls?.map((e) => e?.toJson())?.toList());
  writeNotNull('ulimits', instance.ulimits?.map((e) => e?.toJson())?.toList());
  writeNotNull('user', instance.user);
  writeNotNull(
      'volumesFrom', instance.volumesFrom?.map((e) => e?.toJson())?.toList());
  writeNotNull('workingDirectory', instance.workingDirectory);
  return val;
}

ContainerDependency _$ContainerDependencyFromJson(Map<String, dynamic> json) {
  return ContainerDependency(
    condition:
        _$enumDecodeNullable(_$ContainerConditionEnumMap, json['condition']),
    containerName: json['containerName'] as String,
  );
}

Map<String, dynamic> _$ContainerDependencyToJson(ContainerDependency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('condition', _$ContainerConditionEnumMap[instance.condition]);
  writeNotNull('containerName', instance.containerName);
  return val;
}

const _$ContainerConditionEnumMap = {
  ContainerCondition.start: 'START',
  ContainerCondition.complete: 'COMPLETE',
  ContainerCondition.success: 'SUCCESS',
  ContainerCondition.healthy: 'HEALTHY',
};

ContainerInstance _$ContainerInstanceFromJson(Map<String, dynamic> json) {
  return ContainerInstance(
    agentConnected: json['agentConnected'] as bool,
    agentUpdateStatus: _$enumDecodeNullable(
        _$AgentUpdateStatusEnumMap, json['agentUpdateStatus']),
    attachments: (json['attachments'] as List)
        ?.map((e) =>
            e == null ? null : Attachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    capacityProviderName: json['capacityProviderName'] as String,
    containerInstanceArn: json['containerInstanceArn'] as String,
    ec2InstanceId: json['ec2InstanceId'] as String,
    pendingTasksCount: json['pendingTasksCount'] as int,
    registeredAt: const UnixDateTimeConverter().fromJson(json['registeredAt']),
    registeredResources: (json['registeredResources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    remainingResources: (json['remainingResources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    runningTasksCount: json['runningTasksCount'] as int,
    status: json['status'] as String,
    statusReason: json['statusReason'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as int,
    versionInfo: json['versionInfo'] == null
        ? null
        : VersionInfo.fromJson(json['versionInfo'] as Map<String, dynamic>),
  );
}

const _$AgentUpdateStatusEnumMap = {
  AgentUpdateStatus.pending: 'PENDING',
  AgentUpdateStatus.staging: 'STAGING',
  AgentUpdateStatus.staged: 'STAGED',
  AgentUpdateStatus.updating: 'UPDATING',
  AgentUpdateStatus.updated: 'UPDATED',
  AgentUpdateStatus.failed: 'FAILED',
};

ContainerOverride _$ContainerOverrideFromJson(Map<String, dynamic> json) {
  return ContainerOverride(
    command: (json['command'] as List)?.map((e) => e as String)?.toList(),
    cpu: json['cpu'] as int,
    environment: (json['environment'] as List)
        ?.map((e) =>
            e == null ? null : KeyValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    environmentFiles: (json['environmentFiles'] as List)
        ?.map((e) => e == null
            ? null
            : EnvironmentFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    memory: json['memory'] as int,
    memoryReservation: json['memoryReservation'] as int,
    name: json['name'] as String,
    resourceRequirements: (json['resourceRequirements'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceRequirement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ContainerOverrideToJson(ContainerOverride instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('command', instance.command);
  writeNotNull('cpu', instance.cpu);
  writeNotNull(
      'environment', instance.environment?.map((e) => e?.toJson())?.toList());
  writeNotNull('environmentFiles',
      instance.environmentFiles?.map((e) => e?.toJson())?.toList());
  writeNotNull('memory', instance.memory);
  writeNotNull('memoryReservation', instance.memoryReservation);
  writeNotNull('name', instance.name);
  writeNotNull('resourceRequirements',
      instance.resourceRequirements?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$ContainerStateChangeToJson(
    ContainerStateChange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerName', instance.containerName);
  writeNotNull('exitCode', instance.exitCode);
  writeNotNull('imageDigest', instance.imageDigest);
  writeNotNull('networkBindings',
      instance.networkBindings?.map((e) => e?.toJson())?.toList());
  writeNotNull('reason', instance.reason);
  writeNotNull('runtimeId', instance.runtimeId);
  writeNotNull('status', instance.status);
  return val;
}

CreateCapacityProviderResponse _$CreateCapacityProviderResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCapacityProviderResponse(
    capacityProvider: json['capacityProvider'] == null
        ? null
        : CapacityProvider.fromJson(
            json['capacityProvider'] as Map<String, dynamic>),
  );
}

CreateClusterResponse _$CreateClusterResponseFromJson(
    Map<String, dynamic> json) {
  return CreateClusterResponse(
    cluster: json['cluster'] == null
        ? null
        : Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
  );
}

CreateServiceResponse _$CreateServiceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateServiceResponse(
    service: json['service'] == null
        ? null
        : Service.fromJson(json['service'] as Map<String, dynamic>),
  );
}

CreateTaskSetResponse _$CreateTaskSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTaskSetResponse(
    taskSet: json['taskSet'] == null
        ? null
        : TaskSet.fromJson(json['taskSet'] as Map<String, dynamic>),
  );
}

DeleteAccountSettingResponse _$DeleteAccountSettingResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAccountSettingResponse(
    setting: json['setting'] == null
        ? null
        : Setting.fromJson(json['setting'] as Map<String, dynamic>),
  );
}

DeleteAttributesResponse _$DeleteAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAttributesResponse(
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteCapacityProviderResponse _$DeleteCapacityProviderResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCapacityProviderResponse(
    capacityProvider: json['capacityProvider'] == null
        ? null
        : CapacityProvider.fromJson(
            json['capacityProvider'] as Map<String, dynamic>),
  );
}

DeleteClusterResponse _$DeleteClusterResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteClusterResponse(
    cluster: json['cluster'] == null
        ? null
        : Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
  );
}

DeleteServiceResponse _$DeleteServiceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteServiceResponse(
    service: json['service'] == null
        ? null
        : Service.fromJson(json['service'] as Map<String, dynamic>),
  );
}

DeleteTaskSetResponse _$DeleteTaskSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTaskSetResponse(
    taskSet: json['taskSet'] == null
        ? null
        : TaskSet.fromJson(json['taskSet'] as Map<String, dynamic>),
  );
}

Deployment _$DeploymentFromJson(Map<String, dynamic> json) {
  return Deployment(
    capacityProviderStrategy: (json['capacityProviderStrategy'] as List)
        ?.map((e) => e == null
            ? null
            : CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    desiredCount: json['desiredCount'] as int,
    failedTasks: json['failedTasks'] as int,
    id: json['id'] as String,
    launchType: _$enumDecodeNullable(_$LaunchTypeEnumMap, json['launchType']),
    networkConfiguration: json['networkConfiguration'] == null
        ? null
        : NetworkConfiguration.fromJson(
            json['networkConfiguration'] as Map<String, dynamic>),
    pendingCount: json['pendingCount'] as int,
    platformVersion: json['platformVersion'] as String,
    rolloutState: _$enumDecodeNullable(
        _$DeploymentRolloutStateEnumMap, json['rolloutState']),
    rolloutStateReason: json['rolloutStateReason'] as String,
    runningCount: json['runningCount'] as int,
    status: json['status'] as String,
    taskDefinition: json['taskDefinition'] as String,
    updatedAt: const UnixDateTimeConverter().fromJson(json['updatedAt']),
  );
}

const _$LaunchTypeEnumMap = {
  LaunchType.ec2: 'EC2',
  LaunchType.fargate: 'FARGATE',
};

const _$DeploymentRolloutStateEnumMap = {
  DeploymentRolloutState.completed: 'COMPLETED',
  DeploymentRolloutState.failed: 'FAILED',
  DeploymentRolloutState.inProgress: 'IN_PROGRESS',
};

DeploymentCircuitBreaker _$DeploymentCircuitBreakerFromJson(
    Map<String, dynamic> json) {
  return DeploymentCircuitBreaker(
    enable: json['enable'] as bool,
    rollback: json['rollback'] as bool,
  );
}

Map<String, dynamic> _$DeploymentCircuitBreakerToJson(
    DeploymentCircuitBreaker instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enable', instance.enable);
  writeNotNull('rollback', instance.rollback);
  return val;
}

DeploymentConfiguration _$DeploymentConfigurationFromJson(
    Map<String, dynamic> json) {
  return DeploymentConfiguration(
    deploymentCircuitBreaker: json['deploymentCircuitBreaker'] == null
        ? null
        : DeploymentCircuitBreaker.fromJson(
            json['deploymentCircuitBreaker'] as Map<String, dynamic>),
    maximumPercent: json['maximumPercent'] as int,
    minimumHealthyPercent: json['minimumHealthyPercent'] as int,
  );
}

Map<String, dynamic> _$DeploymentConfigurationToJson(
    DeploymentConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'deploymentCircuitBreaker', instance.deploymentCircuitBreaker?.toJson());
  writeNotNull('maximumPercent', instance.maximumPercent);
  writeNotNull('minimumHealthyPercent', instance.minimumHealthyPercent);
  return val;
}

DeploymentController _$DeploymentControllerFromJson(Map<String, dynamic> json) {
  return DeploymentController(
    type: _$enumDecodeNullable(_$DeploymentControllerTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$DeploymentControllerToJson(
    DeploymentController instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$DeploymentControllerTypeEnumMap[instance.type]);
  return val;
}

const _$DeploymentControllerTypeEnumMap = {
  DeploymentControllerType.ecs: 'ECS',
  DeploymentControllerType.codeDeploy: 'CODE_DEPLOY',
  DeploymentControllerType.external: 'EXTERNAL',
};

DeregisterContainerInstanceResponse
    _$DeregisterContainerInstanceResponseFromJson(Map<String, dynamic> json) {
  return DeregisterContainerInstanceResponse(
    containerInstance: json['containerInstance'] == null
        ? null
        : ContainerInstance.fromJson(
            json['containerInstance'] as Map<String, dynamic>),
  );
}

DeregisterTaskDefinitionResponse _$DeregisterTaskDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeregisterTaskDefinitionResponse(
    taskDefinition: json['taskDefinition'] == null
        ? null
        : TaskDefinition.fromJson(
            json['taskDefinition'] as Map<String, dynamic>),
  );
}

DescribeCapacityProvidersResponse _$DescribeCapacityProvidersResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCapacityProvidersResponse(
    capacityProviders: (json['capacityProviders'] as List)
        ?.map((e) => e == null
            ? null
            : CapacityProvider.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : Failure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeClustersResponse _$DescribeClustersResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeClustersResponse(
    clusters: (json['clusters'] as List)
        ?.map((e) =>
            e == null ? null : Cluster.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : Failure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeContainerInstancesResponse _$DescribeContainerInstancesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeContainerInstancesResponse(
    containerInstances: (json['containerInstances'] as List)
        ?.map((e) => e == null
            ? null
            : ContainerInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : Failure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeServicesResponse _$DescribeServicesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeServicesResponse(
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : Failure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    services: (json['services'] as List)
        ?.map((e) =>
            e == null ? null : Service.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeTaskDefinitionResponse _$DescribeTaskDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTaskDefinitionResponse(
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taskDefinition: json['taskDefinition'] == null
        ? null
        : TaskDefinition.fromJson(
            json['taskDefinition'] as Map<String, dynamic>),
  );
}

DescribeTaskSetsResponse _$DescribeTaskSetsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTaskSetsResponse(
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : Failure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taskSets: (json['taskSets'] as List)
        ?.map((e) =>
            e == null ? null : TaskSet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeTasksResponse _$DescribeTasksResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTasksResponse(
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : Failure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tasks: (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    hostPath: json['hostPath'] as String,
    containerPath: json['containerPath'] as String,
    permissions: (json['permissions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$DeviceCgroupPermissionEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$DeviceToJson(Device instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hostPath', instance.hostPath);
  writeNotNull('containerPath', instance.containerPath);
  writeNotNull(
      'permissions',
      instance.permissions
          ?.map((e) => _$DeviceCgroupPermissionEnumMap[e])
          ?.toList());
  return val;
}

const _$DeviceCgroupPermissionEnumMap = {
  DeviceCgroupPermission.read: 'read',
  DeviceCgroupPermission.write: 'write',
  DeviceCgroupPermission.mknod: 'mknod',
};

DiscoverPollEndpointResponse _$DiscoverPollEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DiscoverPollEndpointResponse(
    endpoint: json['endpoint'] as String,
    telemetryEndpoint: json['telemetryEndpoint'] as String,
  );
}

DockerVolumeConfiguration _$DockerVolumeConfigurationFromJson(
    Map<String, dynamic> json) {
  return DockerVolumeConfiguration(
    autoprovision: json['autoprovision'] as bool,
    driver: json['driver'] as String,
    driverOpts: (json['driverOpts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    labels: (json['labels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    scope: _$enumDecodeNullable(_$ScopeEnumMap, json['scope']),
  );
}

Map<String, dynamic> _$DockerVolumeConfigurationToJson(
    DockerVolumeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('autoprovision', instance.autoprovision);
  writeNotNull('driver', instance.driver);
  writeNotNull('driverOpts', instance.driverOpts);
  writeNotNull('labels', instance.labels);
  writeNotNull('scope', _$ScopeEnumMap[instance.scope]);
  return val;
}

const _$ScopeEnumMap = {
  Scope.task: 'task',
  Scope.shared: 'shared',
};

EFSAuthorizationConfig _$EFSAuthorizationConfigFromJson(
    Map<String, dynamic> json) {
  return EFSAuthorizationConfig(
    accessPointId: json['accessPointId'] as String,
    iam: _$enumDecodeNullable(_$EFSAuthorizationConfigIAMEnumMap, json['iam']),
  );
}

Map<String, dynamic> _$EFSAuthorizationConfigToJson(
    EFSAuthorizationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessPointId', instance.accessPointId);
  writeNotNull('iam', _$EFSAuthorizationConfigIAMEnumMap[instance.iam]);
  return val;
}

const _$EFSAuthorizationConfigIAMEnumMap = {
  EFSAuthorizationConfigIAM.enabled: 'ENABLED',
  EFSAuthorizationConfigIAM.disabled: 'DISABLED',
};

EFSVolumeConfiguration _$EFSVolumeConfigurationFromJson(
    Map<String, dynamic> json) {
  return EFSVolumeConfiguration(
    fileSystemId: json['fileSystemId'] as String,
    authorizationConfig: json['authorizationConfig'] == null
        ? null
        : EFSAuthorizationConfig.fromJson(
            json['authorizationConfig'] as Map<String, dynamic>),
    rootDirectory: json['rootDirectory'] as String,
    transitEncryption: _$enumDecodeNullable(
        _$EFSTransitEncryptionEnumMap, json['transitEncryption']),
    transitEncryptionPort: json['transitEncryptionPort'] as int,
  );
}

Map<String, dynamic> _$EFSVolumeConfigurationToJson(
    EFSVolumeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fileSystemId', instance.fileSystemId);
  writeNotNull('authorizationConfig', instance.authorizationConfig?.toJson());
  writeNotNull('rootDirectory', instance.rootDirectory);
  writeNotNull('transitEncryption',
      _$EFSTransitEncryptionEnumMap[instance.transitEncryption]);
  writeNotNull('transitEncryptionPort', instance.transitEncryptionPort);
  return val;
}

const _$EFSTransitEncryptionEnumMap = {
  EFSTransitEncryption.enabled: 'ENABLED',
  EFSTransitEncryption.disabled: 'DISABLED',
};

EnvironmentFile _$EnvironmentFileFromJson(Map<String, dynamic> json) {
  return EnvironmentFile(
    type: _$enumDecodeNullable(_$EnvironmentFileTypeEnumMap, json['type']),
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$EnvironmentFileToJson(EnvironmentFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$EnvironmentFileTypeEnumMap[instance.type]);
  writeNotNull('value', instance.value);
  return val;
}

const _$EnvironmentFileTypeEnumMap = {
  EnvironmentFileType.s3: 's3',
};

FSxWindowsFileServerAuthorizationConfig
    _$FSxWindowsFileServerAuthorizationConfigFromJson(
        Map<String, dynamic> json) {
  return FSxWindowsFileServerAuthorizationConfig(
    credentialsParameter: json['credentialsParameter'] as String,
    domain: json['domain'] as String,
  );
}

Map<String, dynamic> _$FSxWindowsFileServerAuthorizationConfigToJson(
    FSxWindowsFileServerAuthorizationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('credentialsParameter', instance.credentialsParameter);
  writeNotNull('domain', instance.domain);
  return val;
}

FSxWindowsFileServerVolumeConfiguration
    _$FSxWindowsFileServerVolumeConfigurationFromJson(
        Map<String, dynamic> json) {
  return FSxWindowsFileServerVolumeConfiguration(
    authorizationConfig: json['authorizationConfig'] == null
        ? null
        : FSxWindowsFileServerAuthorizationConfig.fromJson(
            json['authorizationConfig'] as Map<String, dynamic>),
    fileSystemId: json['fileSystemId'] as String,
    rootDirectory: json['rootDirectory'] as String,
  );
}

Map<String, dynamic> _$FSxWindowsFileServerVolumeConfigurationToJson(
    FSxWindowsFileServerVolumeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authorizationConfig', instance.authorizationConfig?.toJson());
  writeNotNull('fileSystemId', instance.fileSystemId);
  writeNotNull('rootDirectory', instance.rootDirectory);
  return val;
}

Failure _$FailureFromJson(Map<String, dynamic> json) {
  return Failure(
    arn: json['arn'] as String,
    detail: json['detail'] as String,
    reason: json['reason'] as String,
  );
}

FirelensConfiguration _$FirelensConfigurationFromJson(
    Map<String, dynamic> json) {
  return FirelensConfiguration(
    type:
        _$enumDecodeNullable(_$FirelensConfigurationTypeEnumMap, json['type']),
    options: (json['options'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$FirelensConfigurationToJson(
    FirelensConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$FirelensConfigurationTypeEnumMap[instance.type]);
  writeNotNull('options', instance.options);
  return val;
}

const _$FirelensConfigurationTypeEnumMap = {
  FirelensConfigurationType.fluentd: 'fluentd',
  FirelensConfigurationType.fluentbit: 'fluentbit',
};

HealthCheck _$HealthCheckFromJson(Map<String, dynamic> json) {
  return HealthCheck(
    command: (json['command'] as List)?.map((e) => e as String)?.toList(),
    interval: json['interval'] as int,
    retries: json['retries'] as int,
    startPeriod: json['startPeriod'] as int,
    timeout: json['timeout'] as int,
  );
}

Map<String, dynamic> _$HealthCheckToJson(HealthCheck instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('command', instance.command);
  writeNotNull('interval', instance.interval);
  writeNotNull('retries', instance.retries);
  writeNotNull('startPeriod', instance.startPeriod);
  writeNotNull('timeout', instance.timeout);
  return val;
}

HostEntry _$HostEntryFromJson(Map<String, dynamic> json) {
  return HostEntry(
    hostname: json['hostname'] as String,
    ipAddress: json['ipAddress'] as String,
  );
}

Map<String, dynamic> _$HostEntryToJson(HostEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hostname', instance.hostname);
  writeNotNull('ipAddress', instance.ipAddress);
  return val;
}

HostVolumeProperties _$HostVolumePropertiesFromJson(Map<String, dynamic> json) {
  return HostVolumeProperties(
    sourcePath: json['sourcePath'] as String,
  );
}

Map<String, dynamic> _$HostVolumePropertiesToJson(
    HostVolumeProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sourcePath', instance.sourcePath);
  return val;
}

InferenceAccelerator _$InferenceAcceleratorFromJson(Map<String, dynamic> json) {
  return InferenceAccelerator(
    deviceName: json['deviceName'] as String,
    deviceType: json['deviceType'] as String,
  );
}

Map<String, dynamic> _$InferenceAcceleratorToJson(
    InferenceAccelerator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deviceName', instance.deviceName);
  writeNotNull('deviceType', instance.deviceType);
  return val;
}

InferenceAcceleratorOverride _$InferenceAcceleratorOverrideFromJson(
    Map<String, dynamic> json) {
  return InferenceAcceleratorOverride(
    deviceName: json['deviceName'] as String,
    deviceType: json['deviceType'] as String,
  );
}

Map<String, dynamic> _$InferenceAcceleratorOverrideToJson(
    InferenceAcceleratorOverride instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deviceName', instance.deviceName);
  writeNotNull('deviceType', instance.deviceType);
  return val;
}

KernelCapabilities _$KernelCapabilitiesFromJson(Map<String, dynamic> json) {
  return KernelCapabilities(
    add: (json['add'] as List)?.map((e) => e as String)?.toList(),
    drop: (json['drop'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$KernelCapabilitiesToJson(KernelCapabilities instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('add', instance.add);
  writeNotNull('drop', instance.drop);
  return val;
}

KeyValuePair _$KeyValuePairFromJson(Map<String, dynamic> json) {
  return KeyValuePair(
    name: json['name'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$KeyValuePairToJson(KeyValuePair instance) {
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

LinuxParameters _$LinuxParametersFromJson(Map<String, dynamic> json) {
  return LinuxParameters(
    capabilities: json['capabilities'] == null
        ? null
        : KernelCapabilities.fromJson(
            json['capabilities'] as Map<String, dynamic>),
    devices: (json['devices'] as List)
        ?.map((e) =>
            e == null ? null : Device.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    initProcessEnabled: json['initProcessEnabled'] as bool,
    maxSwap: json['maxSwap'] as int,
    sharedMemorySize: json['sharedMemorySize'] as int,
    swappiness: json['swappiness'] as int,
    tmpfs: (json['tmpfs'] as List)
        ?.map(
            (e) => e == null ? null : Tmpfs.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LinuxParametersToJson(LinuxParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('capabilities', instance.capabilities?.toJson());
  writeNotNull('devices', instance.devices?.map((e) => e?.toJson())?.toList());
  writeNotNull('initProcessEnabled', instance.initProcessEnabled);
  writeNotNull('maxSwap', instance.maxSwap);
  writeNotNull('sharedMemorySize', instance.sharedMemorySize);
  writeNotNull('swappiness', instance.swappiness);
  writeNotNull('tmpfs', instance.tmpfs?.map((e) => e?.toJson())?.toList());
  return val;
}

ListAccountSettingsResponse _$ListAccountSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAccountSettingsResponse(
    nextToken: json['nextToken'] as String,
    settings: (json['settings'] as List)
        ?.map((e) =>
            e == null ? null : Setting.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListAttributesResponse _$ListAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAttributesResponse(
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListClustersResponse _$ListClustersResponseFromJson(Map<String, dynamic> json) {
  return ListClustersResponse(
    clusterArns:
        (json['clusterArns'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListContainerInstancesResponse _$ListContainerInstancesResponseFromJson(
    Map<String, dynamic> json) {
  return ListContainerInstancesResponse(
    containerInstanceArns: (json['containerInstanceArns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListServicesResponse _$ListServicesResponseFromJson(Map<String, dynamic> json) {
  return ListServicesResponse(
    nextToken: json['nextToken'] as String,
    serviceArns:
        (json['serviceArns'] as List)?.map((e) => e as String)?.toList(),
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

ListTaskDefinitionFamiliesResponse _$ListTaskDefinitionFamiliesResponseFromJson(
    Map<String, dynamic> json) {
  return ListTaskDefinitionFamiliesResponse(
    families: (json['families'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTaskDefinitionsResponse _$ListTaskDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTaskDefinitionsResponse(
    nextToken: json['nextToken'] as String,
    taskDefinitionArns:
        (json['taskDefinitionArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListTasksResponse _$ListTasksResponseFromJson(Map<String, dynamic> json) {
  return ListTasksResponse(
    nextToken: json['nextToken'] as String,
    taskArns: (json['taskArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

LoadBalancer _$LoadBalancerFromJson(Map<String, dynamic> json) {
  return LoadBalancer(
    containerName: json['containerName'] as String,
    containerPort: json['containerPort'] as int,
    loadBalancerName: json['loadBalancerName'] as String,
    targetGroupArn: json['targetGroupArn'] as String,
  );
}

Map<String, dynamic> _$LoadBalancerToJson(LoadBalancer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerName', instance.containerName);
  writeNotNull('containerPort', instance.containerPort);
  writeNotNull('loadBalancerName', instance.loadBalancerName);
  writeNotNull('targetGroupArn', instance.targetGroupArn);
  return val;
}

LogConfiguration _$LogConfigurationFromJson(Map<String, dynamic> json) {
  return LogConfiguration(
    logDriver: _$enumDecodeNullable(_$LogDriverEnumMap, json['logDriver']),
    options: (json['options'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    secretOptions: (json['secretOptions'] as List)
        ?.map((e) =>
            e == null ? null : Secret.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LogConfigurationToJson(LogConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logDriver', _$LogDriverEnumMap[instance.logDriver]);
  writeNotNull('options', instance.options);
  writeNotNull('secretOptions',
      instance.secretOptions?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$LogDriverEnumMap = {
  LogDriver.jsonFile: 'json-file',
  LogDriver.syslog: 'syslog',
  LogDriver.journald: 'journald',
  LogDriver.gelf: 'gelf',
  LogDriver.fluentd: 'fluentd',
  LogDriver.awslogs: 'awslogs',
  LogDriver.splunk: 'splunk',
  LogDriver.awsfirelens: 'awsfirelens',
};

ManagedScaling _$ManagedScalingFromJson(Map<String, dynamic> json) {
  return ManagedScaling(
    instanceWarmupPeriod: json['instanceWarmupPeriod'] as int,
    maximumScalingStepSize: json['maximumScalingStepSize'] as int,
    minimumScalingStepSize: json['minimumScalingStepSize'] as int,
    status: _$enumDecodeNullable(_$ManagedScalingStatusEnumMap, json['status']),
    targetCapacity: json['targetCapacity'] as int,
  );
}

Map<String, dynamic> _$ManagedScalingToJson(ManagedScaling instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceWarmupPeriod', instance.instanceWarmupPeriod);
  writeNotNull('maximumScalingStepSize', instance.maximumScalingStepSize);
  writeNotNull('minimumScalingStepSize', instance.minimumScalingStepSize);
  writeNotNull('status', _$ManagedScalingStatusEnumMap[instance.status]);
  writeNotNull('targetCapacity', instance.targetCapacity);
  return val;
}

const _$ManagedScalingStatusEnumMap = {
  ManagedScalingStatus.enabled: 'ENABLED',
  ManagedScalingStatus.disabled: 'DISABLED',
};

MountPoint _$MountPointFromJson(Map<String, dynamic> json) {
  return MountPoint(
    containerPath: json['containerPath'] as String,
    readOnly: json['readOnly'] as bool,
    sourceVolume: json['sourceVolume'] as String,
  );
}

Map<String, dynamic> _$MountPointToJson(MountPoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerPath', instance.containerPath);
  writeNotNull('readOnly', instance.readOnly);
  writeNotNull('sourceVolume', instance.sourceVolume);
  return val;
}

NetworkBinding _$NetworkBindingFromJson(Map<String, dynamic> json) {
  return NetworkBinding(
    bindIP: json['bindIP'] as String,
    containerPort: json['containerPort'] as int,
    hostPort: json['hostPort'] as int,
    protocol:
        _$enumDecodeNullable(_$TransportProtocolEnumMap, json['protocol']),
  );
}

Map<String, dynamic> _$NetworkBindingToJson(NetworkBinding instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bindIP', instance.bindIP);
  writeNotNull('containerPort', instance.containerPort);
  writeNotNull('hostPort', instance.hostPort);
  writeNotNull('protocol', _$TransportProtocolEnumMap[instance.protocol]);
  return val;
}

const _$TransportProtocolEnumMap = {
  TransportProtocol.tcp: 'tcp',
  TransportProtocol.udp: 'udp',
};

NetworkConfiguration _$NetworkConfigurationFromJson(Map<String, dynamic> json) {
  return NetworkConfiguration(
    awsvpcConfiguration: json['awsvpcConfiguration'] == null
        ? null
        : AwsVpcConfiguration.fromJson(
            json['awsvpcConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkConfigurationToJson(
    NetworkConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('awsvpcConfiguration', instance.awsvpcConfiguration?.toJson());
  return val;
}

NetworkInterface _$NetworkInterfaceFromJson(Map<String, dynamic> json) {
  return NetworkInterface(
    attachmentId: json['attachmentId'] as String,
    ipv6Address: json['ipv6Address'] as String,
    privateIpv4Address: json['privateIpv4Address'] as String,
  );
}

PlacementConstraint _$PlacementConstraintFromJson(Map<String, dynamic> json) {
  return PlacementConstraint(
    expression: json['expression'] as String,
    type: _$enumDecodeNullable(_$PlacementConstraintTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$PlacementConstraintToJson(PlacementConstraint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expression', instance.expression);
  writeNotNull('type', _$PlacementConstraintTypeEnumMap[instance.type]);
  return val;
}

const _$PlacementConstraintTypeEnumMap = {
  PlacementConstraintType.distinctInstance: 'distinctInstance',
  PlacementConstraintType.memberOf: 'memberOf',
};

PlacementStrategy _$PlacementStrategyFromJson(Map<String, dynamic> json) {
  return PlacementStrategy(
    field: json['field'] as String,
    type: _$enumDecodeNullable(_$PlacementStrategyTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$PlacementStrategyToJson(PlacementStrategy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('field', instance.field);
  writeNotNull('type', _$PlacementStrategyTypeEnumMap[instance.type]);
  return val;
}

const _$PlacementStrategyTypeEnumMap = {
  PlacementStrategyType.random: 'random',
  PlacementStrategyType.spread: 'spread',
  PlacementStrategyType.binpack: 'binpack',
};

Map<String, dynamic> _$PlatformDeviceToJson(PlatformDevice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', _$PlatformDeviceTypeEnumMap[instance.type]);
  return val;
}

const _$PlatformDeviceTypeEnumMap = {
  PlatformDeviceType.gpu: 'GPU',
};

PortMapping _$PortMappingFromJson(Map<String, dynamic> json) {
  return PortMapping(
    containerPort: json['containerPort'] as int,
    hostPort: json['hostPort'] as int,
    protocol:
        _$enumDecodeNullable(_$TransportProtocolEnumMap, json['protocol']),
  );
}

Map<String, dynamic> _$PortMappingToJson(PortMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerPort', instance.containerPort);
  writeNotNull('hostPort', instance.hostPort);
  writeNotNull('protocol', _$TransportProtocolEnumMap[instance.protocol]);
  return val;
}

ProxyConfiguration _$ProxyConfigurationFromJson(Map<String, dynamic> json) {
  return ProxyConfiguration(
    containerName: json['containerName'] as String,
    properties: (json['properties'] as List)
        ?.map((e) =>
            e == null ? null : KeyValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$ProxyConfigurationTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$ProxyConfigurationToJson(ProxyConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerName', instance.containerName);
  writeNotNull(
      'properties', instance.properties?.map((e) => e?.toJson())?.toList());
  writeNotNull('type', _$ProxyConfigurationTypeEnumMap[instance.type]);
  return val;
}

const _$ProxyConfigurationTypeEnumMap = {
  ProxyConfigurationType.appmesh: 'APPMESH',
};

PutAccountSettingDefaultResponse _$PutAccountSettingDefaultResponseFromJson(
    Map<String, dynamic> json) {
  return PutAccountSettingDefaultResponse(
    setting: json['setting'] == null
        ? null
        : Setting.fromJson(json['setting'] as Map<String, dynamic>),
  );
}

PutAccountSettingResponse _$PutAccountSettingResponseFromJson(
    Map<String, dynamic> json) {
  return PutAccountSettingResponse(
    setting: json['setting'] == null
        ? null
        : Setting.fromJson(json['setting'] as Map<String, dynamic>),
  );
}

PutAttributesResponse _$PutAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return PutAttributesResponse(
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutClusterCapacityProvidersResponse
    _$PutClusterCapacityProvidersResponseFromJson(Map<String, dynamic> json) {
  return PutClusterCapacityProvidersResponse(
    cluster: json['cluster'] == null
        ? null
        : Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
  );
}

RegisterContainerInstanceResponse _$RegisterContainerInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterContainerInstanceResponse(
    containerInstance: json['containerInstance'] == null
        ? null
        : ContainerInstance.fromJson(
            json['containerInstance'] as Map<String, dynamic>),
  );
}

RegisterTaskDefinitionResponse _$RegisterTaskDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterTaskDefinitionResponse(
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taskDefinition: json['taskDefinition'] == null
        ? null
        : TaskDefinition.fromJson(
            json['taskDefinition'] as Map<String, dynamic>),
  );
}

RepositoryCredentials _$RepositoryCredentialsFromJson(
    Map<String, dynamic> json) {
  return RepositoryCredentials(
    credentialsParameter: json['credentialsParameter'] as String,
  );
}

Map<String, dynamic> _$RepositoryCredentialsToJson(
    RepositoryCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('credentialsParameter', instance.credentialsParameter);
  return val;
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    doubleValue: (json['doubleValue'] as num)?.toDouble(),
    integerValue: json['integerValue'] as int,
    longValue: json['longValue'] as int,
    name: json['name'] as String,
    stringSetValue:
        (json['stringSetValue'] as List)?.map((e) => e as String)?.toList(),
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('doubleValue', instance.doubleValue);
  writeNotNull('integerValue', instance.integerValue);
  writeNotNull('longValue', instance.longValue);
  writeNotNull('name', instance.name);
  writeNotNull('stringSetValue', instance.stringSetValue);
  writeNotNull('type', instance.type);
  return val;
}

ResourceRequirement _$ResourceRequirementFromJson(Map<String, dynamic> json) {
  return ResourceRequirement(
    type: _$enumDecodeNullable(_$ResourceTypeEnumMap, json['type']),
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ResourceRequirementToJson(ResourceRequirement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$ResourceTypeEnumMap[instance.type]);
  writeNotNull('value', instance.value);
  return val;
}

const _$ResourceTypeEnumMap = {
  ResourceType.gpu: 'GPU',
  ResourceType.inferenceAccelerator: 'InferenceAccelerator',
};

RunTaskResponse _$RunTaskResponseFromJson(Map<String, dynamic> json) {
  return RunTaskResponse(
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : Failure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tasks: (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Scale _$ScaleFromJson(Map<String, dynamic> json) {
  return Scale(
    unit: _$enumDecodeNullable(_$ScaleUnitEnumMap, json['unit']),
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ScaleToJson(Scale instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', _$ScaleUnitEnumMap[instance.unit]);
  writeNotNull('value', instance.value);
  return val;
}

const _$ScaleUnitEnumMap = {
  ScaleUnit.percent: 'PERCENT',
};

Secret _$SecretFromJson(Map<String, dynamic> json) {
  return Secret(
    name: json['name'] as String,
    valueFrom: json['valueFrom'] as String,
  );
}

Map<String, dynamic> _$SecretToJson(Secret instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('valueFrom', instance.valueFrom);
  return val;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    capacityProviderStrategy: (json['capacityProviderStrategy'] as List)
        ?.map((e) => e == null
            ? null
            : CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    clusterArn: json['clusterArn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    createdBy: json['createdBy'] as String,
    deploymentConfiguration: json['deploymentConfiguration'] == null
        ? null
        : DeploymentConfiguration.fromJson(
            json['deploymentConfiguration'] as Map<String, dynamic>),
    deploymentController: json['deploymentController'] == null
        ? null
        : DeploymentController.fromJson(
            json['deploymentController'] as Map<String, dynamic>),
    deployments: (json['deployments'] as List)
        ?.map((e) =>
            e == null ? null : Deployment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    desiredCount: json['desiredCount'] as int,
    enableECSManagedTags: json['enableECSManagedTags'] as bool,
    events: (json['events'] as List)
        ?.map((e) =>
            e == null ? null : ServiceEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    healthCheckGracePeriodSeconds: json['healthCheckGracePeriodSeconds'] as int,
    launchType: _$enumDecodeNullable(_$LaunchTypeEnumMap, json['launchType']),
    loadBalancers: (json['loadBalancers'] as List)
        ?.map((e) =>
            e == null ? null : LoadBalancer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkConfiguration: json['networkConfiguration'] == null
        ? null
        : NetworkConfiguration.fromJson(
            json['networkConfiguration'] as Map<String, dynamic>),
    pendingCount: json['pendingCount'] as int,
    placementConstraints: (json['placementConstraints'] as List)
        ?.map((e) => e == null
            ? null
            : PlacementConstraint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    placementStrategy: (json['placementStrategy'] as List)
        ?.map((e) => e == null
            ? null
            : PlacementStrategy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    platformVersion: json['platformVersion'] as String,
    propagateTags:
        _$enumDecodeNullable(_$PropagateTagsEnumMap, json['propagateTags']),
    roleArn: json['roleArn'] as String,
    runningCount: json['runningCount'] as int,
    schedulingStrategy: _$enumDecodeNullable(
        _$SchedulingStrategyEnumMap, json['schedulingStrategy']),
    serviceArn: json['serviceArn'] as String,
    serviceName: json['serviceName'] as String,
    serviceRegistries: (json['serviceRegistries'] as List)
        ?.map((e) => e == null
            ? null
            : ServiceRegistry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taskDefinition: json['taskDefinition'] as String,
    taskSets: (json['taskSets'] as List)
        ?.map((e) =>
            e == null ? null : TaskSet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$PropagateTagsEnumMap = {
  PropagateTags.taskDefinition: 'TASK_DEFINITION',
  PropagateTags.service: 'SERVICE',
};

const _$SchedulingStrategyEnumMap = {
  SchedulingStrategy.replica: 'REPLICA',
  SchedulingStrategy.daemon: 'DAEMON',
};

ServiceEvent _$ServiceEventFromJson(Map<String, dynamic> json) {
  return ServiceEvent(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    id: json['id'] as String,
    message: json['message'] as String,
  );
}

ServiceRegistry _$ServiceRegistryFromJson(Map<String, dynamic> json) {
  return ServiceRegistry(
    containerName: json['containerName'] as String,
    containerPort: json['containerPort'] as int,
    port: json['port'] as int,
    registryArn: json['registryArn'] as String,
  );
}

Map<String, dynamic> _$ServiceRegistryToJson(ServiceRegistry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerName', instance.containerName);
  writeNotNull('containerPort', instance.containerPort);
  writeNotNull('port', instance.port);
  writeNotNull('registryArn', instance.registryArn);
  return val;
}

Setting _$SettingFromJson(Map<String, dynamic> json) {
  return Setting(
    name: _$enumDecodeNullable(_$SettingNameEnumMap, json['name']),
    principalArn: json['principalArn'] as String,
    value: json['value'] as String,
  );
}

const _$SettingNameEnumMap = {
  SettingName.serviceLongArnFormat: 'serviceLongArnFormat',
  SettingName.taskLongArnFormat: 'taskLongArnFormat',
  SettingName.containerInstanceLongArnFormat: 'containerInstanceLongArnFormat',
  SettingName.awsvpcTrunking: 'awsvpcTrunking',
  SettingName.containerInsights: 'containerInsights',
};

StartTaskResponse _$StartTaskResponseFromJson(Map<String, dynamic> json) {
  return StartTaskResponse(
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : Failure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tasks: (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StopTaskResponse _$StopTaskResponseFromJson(Map<String, dynamic> json) {
  return StopTaskResponse(
    task: json['task'] == null
        ? null
        : Task.fromJson(json['task'] as Map<String, dynamic>),
  );
}

SubmitAttachmentStateChangesResponse
    _$SubmitAttachmentStateChangesResponseFromJson(Map<String, dynamic> json) {
  return SubmitAttachmentStateChangesResponse(
    acknowledgment: json['acknowledgment'] as String,
  );
}

SubmitContainerStateChangeResponse _$SubmitContainerStateChangeResponseFromJson(
    Map<String, dynamic> json) {
  return SubmitContainerStateChangeResponse(
    acknowledgment: json['acknowledgment'] as String,
  );
}

SubmitTaskStateChangeResponse _$SubmitTaskStateChangeResponseFromJson(
    Map<String, dynamic> json) {
  return SubmitTaskStateChangeResponse(
    acknowledgment: json['acknowledgment'] as String,
  );
}

SystemControl _$SystemControlFromJson(Map<String, dynamic> json) {
  return SystemControl(
    namespace: json['namespace'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$SystemControlToJson(SystemControl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('namespace', instance.namespace);
  writeNotNull('value', instance.value);
  return val;
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    attachments: (json['attachments'] as List)
        ?.map((e) =>
            e == null ? null : Attachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    availabilityZone: json['availabilityZone'] as String,
    capacityProviderName: json['capacityProviderName'] as String,
    clusterArn: json['clusterArn'] as String,
    connectivity:
        _$enumDecodeNullable(_$ConnectivityEnumMap, json['connectivity']),
    connectivityAt:
        const UnixDateTimeConverter().fromJson(json['connectivityAt']),
    containerInstanceArn: json['containerInstanceArn'] as String,
    containers: (json['containers'] as List)
        ?.map((e) =>
            e == null ? null : Container.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cpu: json['cpu'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    desiredStatus: json['desiredStatus'] as String,
    executionStoppedAt:
        const UnixDateTimeConverter().fromJson(json['executionStoppedAt']),
    group: json['group'] as String,
    healthStatus:
        _$enumDecodeNullable(_$HealthStatusEnumMap, json['healthStatus']),
    inferenceAccelerators: (json['inferenceAccelerators'] as List)
        ?.map((e) => e == null
            ? null
            : InferenceAccelerator.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastStatus: json['lastStatus'] as String,
    launchType: _$enumDecodeNullable(_$LaunchTypeEnumMap, json['launchType']),
    memory: json['memory'] as String,
    overrides: json['overrides'] == null
        ? null
        : TaskOverride.fromJson(json['overrides'] as Map<String, dynamic>),
    platformVersion: json['platformVersion'] as String,
    pullStartedAt:
        const UnixDateTimeConverter().fromJson(json['pullStartedAt']),
    pullStoppedAt:
        const UnixDateTimeConverter().fromJson(json['pullStoppedAt']),
    startedAt: const UnixDateTimeConverter().fromJson(json['startedAt']),
    startedBy: json['startedBy'] as String,
    stopCode: _$enumDecodeNullable(_$TaskStopCodeEnumMap, json['stopCode']),
    stoppedAt: const UnixDateTimeConverter().fromJson(json['stoppedAt']),
    stoppedReason: json['stoppedReason'] as String,
    stoppingAt: const UnixDateTimeConverter().fromJson(json['stoppingAt']),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taskArn: json['taskArn'] as String,
    taskDefinitionArn: json['taskDefinitionArn'] as String,
    version: json['version'] as int,
  );
}

const _$ConnectivityEnumMap = {
  Connectivity.connected: 'CONNECTED',
  Connectivity.disconnected: 'DISCONNECTED',
};

const _$TaskStopCodeEnumMap = {
  TaskStopCode.taskFailedToStart: 'TaskFailedToStart',
  TaskStopCode.essentialContainerExited: 'EssentialContainerExited',
  TaskStopCode.userInitiated: 'UserInitiated',
};

TaskDefinition _$TaskDefinitionFromJson(Map<String, dynamic> json) {
  return TaskDefinition(
    compatibilities: (json['compatibilities'] as List)
        ?.map((e) => _$enumDecodeNullable(_$CompatibilityEnumMap, e))
        ?.toList(),
    containerDefinitions: (json['containerDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : ContainerDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cpu: json['cpu'] as String,
    executionRoleArn: json['executionRoleArn'] as String,
    family: json['family'] as String,
    inferenceAccelerators: (json['inferenceAccelerators'] as List)
        ?.map((e) => e == null
            ? null
            : InferenceAccelerator.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ipcMode: _$enumDecodeNullable(_$IpcModeEnumMap, json['ipcMode']),
    memory: json['memory'] as String,
    networkMode:
        _$enumDecodeNullable(_$NetworkModeEnumMap, json['networkMode']),
    pidMode: _$enumDecodeNullable(_$PidModeEnumMap, json['pidMode']),
    placementConstraints: (json['placementConstraints'] as List)
        ?.map((e) => e == null
            ? null
            : TaskDefinitionPlacementConstraint.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    proxyConfiguration: json['proxyConfiguration'] == null
        ? null
        : ProxyConfiguration.fromJson(
            json['proxyConfiguration'] as Map<String, dynamic>),
    requiresAttributes: (json['requiresAttributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requiresCompatibilities: (json['requiresCompatibilities'] as List)
        ?.map((e) => _$enumDecodeNullable(_$CompatibilityEnumMap, e))
        ?.toList(),
    revision: json['revision'] as int,
    status: _$enumDecodeNullable(_$TaskDefinitionStatusEnumMap, json['status']),
    taskDefinitionArn: json['taskDefinitionArn'] as String,
    taskRoleArn: json['taskRoleArn'] as String,
    volumes: (json['volumes'] as List)
        ?.map((e) =>
            e == null ? null : Volume.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$CompatibilityEnumMap = {
  Compatibility.ec2: 'EC2',
  Compatibility.fargate: 'FARGATE',
};

const _$IpcModeEnumMap = {
  IpcMode.host: 'host',
  IpcMode.task: 'task',
  IpcMode.none: 'none',
};

const _$NetworkModeEnumMap = {
  NetworkMode.bridge: 'bridge',
  NetworkMode.host: 'host',
  NetworkMode.awsvpc: 'awsvpc',
  NetworkMode.none: 'none',
};

const _$PidModeEnumMap = {
  PidMode.host: 'host',
  PidMode.task: 'task',
};

const _$TaskDefinitionStatusEnumMap = {
  TaskDefinitionStatus.active: 'ACTIVE',
  TaskDefinitionStatus.inactive: 'INACTIVE',
};

TaskDefinitionPlacementConstraint _$TaskDefinitionPlacementConstraintFromJson(
    Map<String, dynamic> json) {
  return TaskDefinitionPlacementConstraint(
    expression: json['expression'] as String,
    type: _$enumDecodeNullable(
        _$TaskDefinitionPlacementConstraintTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$TaskDefinitionPlacementConstraintToJson(
    TaskDefinitionPlacementConstraint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expression', instance.expression);
  writeNotNull(
      'type', _$TaskDefinitionPlacementConstraintTypeEnumMap[instance.type]);
  return val;
}

const _$TaskDefinitionPlacementConstraintTypeEnumMap = {
  TaskDefinitionPlacementConstraintType.memberOf: 'memberOf',
};

TaskOverride _$TaskOverrideFromJson(Map<String, dynamic> json) {
  return TaskOverride(
    containerOverrides: (json['containerOverrides'] as List)
        ?.map((e) => e == null
            ? null
            : ContainerOverride.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cpu: json['cpu'] as String,
    executionRoleArn: json['executionRoleArn'] as String,
    inferenceAcceleratorOverrides: (json['inferenceAcceleratorOverrides']
            as List)
        ?.map((e) => e == null
            ? null
            : InferenceAcceleratorOverride.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    memory: json['memory'] as String,
    taskRoleArn: json['taskRoleArn'] as String,
  );
}

Map<String, dynamic> _$TaskOverrideToJson(TaskOverride instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerOverrides',
      instance.containerOverrides?.map((e) => e?.toJson())?.toList());
  writeNotNull('cpu', instance.cpu);
  writeNotNull('executionRoleArn', instance.executionRoleArn);
  writeNotNull(
      'inferenceAcceleratorOverrides',
      instance.inferenceAcceleratorOverrides
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('memory', instance.memory);
  writeNotNull('taskRoleArn', instance.taskRoleArn);
  return val;
}

TaskSet _$TaskSetFromJson(Map<String, dynamic> json) {
  return TaskSet(
    capacityProviderStrategy: (json['capacityProviderStrategy'] as List)
        ?.map((e) => e == null
            ? null
            : CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    clusterArn: json['clusterArn'] as String,
    computedDesiredCount: json['computedDesiredCount'] as int,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    externalId: json['externalId'] as String,
    id: json['id'] as String,
    launchType: _$enumDecodeNullable(_$LaunchTypeEnumMap, json['launchType']),
    loadBalancers: (json['loadBalancers'] as List)
        ?.map((e) =>
            e == null ? null : LoadBalancer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkConfiguration: json['networkConfiguration'] == null
        ? null
        : NetworkConfiguration.fromJson(
            json['networkConfiguration'] as Map<String, dynamic>),
    pendingCount: json['pendingCount'] as int,
    platformVersion: json['platformVersion'] as String,
    runningCount: json['runningCount'] as int,
    scale: json['scale'] == null
        ? null
        : Scale.fromJson(json['scale'] as Map<String, dynamic>),
    serviceArn: json['serviceArn'] as String,
    serviceRegistries: (json['serviceRegistries'] as List)
        ?.map((e) => e == null
            ? null
            : ServiceRegistry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stabilityStatus:
        _$enumDecodeNullable(_$StabilityStatusEnumMap, json['stabilityStatus']),
    stabilityStatusAt:
        const UnixDateTimeConverter().fromJson(json['stabilityStatusAt']),
    startedBy: json['startedBy'] as String,
    status: json['status'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taskDefinition: json['taskDefinition'] as String,
    taskSetArn: json['taskSetArn'] as String,
    updatedAt: const UnixDateTimeConverter().fromJson(json['updatedAt']),
  );
}

const _$StabilityStatusEnumMap = {
  StabilityStatus.steadyState: 'STEADY_STATE',
  StabilityStatus.stabilizing: 'STABILIZING',
};

Tmpfs _$TmpfsFromJson(Map<String, dynamic> json) {
  return Tmpfs(
    containerPath: json['containerPath'] as String,
    size: json['size'] as int,
    mountOptions:
        (json['mountOptions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TmpfsToJson(Tmpfs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('containerPath', instance.containerPath);
  writeNotNull('size', instance.size);
  writeNotNull('mountOptions', instance.mountOptions);
  return val;
}

Ulimit _$UlimitFromJson(Map<String, dynamic> json) {
  return Ulimit(
    hardLimit: json['hardLimit'] as int,
    name: _$enumDecodeNullable(_$UlimitNameEnumMap, json['name']),
    softLimit: json['softLimit'] as int,
  );
}

Map<String, dynamic> _$UlimitToJson(Ulimit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hardLimit', instance.hardLimit);
  writeNotNull('name', _$UlimitNameEnumMap[instance.name]);
  writeNotNull('softLimit', instance.softLimit);
  return val;
}

const _$UlimitNameEnumMap = {
  UlimitName.core: 'core',
  UlimitName.cpu: 'cpu',
  UlimitName.data: 'data',
  UlimitName.fsize: 'fsize',
  UlimitName.locks: 'locks',
  UlimitName.memlock: 'memlock',
  UlimitName.msgqueue: 'msgqueue',
  UlimitName.nice: 'nice',
  UlimitName.nofile: 'nofile',
  UlimitName.nproc: 'nproc',
  UlimitName.rss: 'rss',
  UlimitName.rtprio: 'rtprio',
  UlimitName.rttime: 'rttime',
  UlimitName.sigpending: 'sigpending',
  UlimitName.stack: 'stack',
};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateCapacityProviderResponse _$UpdateCapacityProviderResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateCapacityProviderResponse(
    capacityProvider: json['capacityProvider'] == null
        ? null
        : CapacityProvider.fromJson(
            json['capacityProvider'] as Map<String, dynamic>),
  );
}

UpdateClusterSettingsResponse _$UpdateClusterSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateClusterSettingsResponse(
    cluster: json['cluster'] == null
        ? null
        : Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
  );
}

UpdateContainerAgentResponse _$UpdateContainerAgentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateContainerAgentResponse(
    containerInstance: json['containerInstance'] == null
        ? null
        : ContainerInstance.fromJson(
            json['containerInstance'] as Map<String, dynamic>),
  );
}

UpdateContainerInstancesStateResponse
    _$UpdateContainerInstancesStateResponseFromJson(Map<String, dynamic> json) {
  return UpdateContainerInstancesStateResponse(
    containerInstances: (json['containerInstances'] as List)
        ?.map((e) => e == null
            ? null
            : ContainerInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failures: (json['failures'] as List)
        ?.map((e) =>
            e == null ? null : Failure.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateServicePrimaryTaskSetResponse
    _$UpdateServicePrimaryTaskSetResponseFromJson(Map<String, dynamic> json) {
  return UpdateServicePrimaryTaskSetResponse(
    taskSet: json['taskSet'] == null
        ? null
        : TaskSet.fromJson(json['taskSet'] as Map<String, dynamic>),
  );
}

UpdateServiceResponse _$UpdateServiceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateServiceResponse(
    service: json['service'] == null
        ? null
        : Service.fromJson(json['service'] as Map<String, dynamic>),
  );
}

UpdateTaskSetResponse _$UpdateTaskSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTaskSetResponse(
    taskSet: json['taskSet'] == null
        ? null
        : TaskSet.fromJson(json['taskSet'] as Map<String, dynamic>),
  );
}

VersionInfo _$VersionInfoFromJson(Map<String, dynamic> json) {
  return VersionInfo(
    agentHash: json['agentHash'] as String,
    agentVersion: json['agentVersion'] as String,
    dockerVersion: json['dockerVersion'] as String,
  );
}

Map<String, dynamic> _$VersionInfoToJson(VersionInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('agentHash', instance.agentHash);
  writeNotNull('agentVersion', instance.agentVersion);
  writeNotNull('dockerVersion', instance.dockerVersion);
  return val;
}

Volume _$VolumeFromJson(Map<String, dynamic> json) {
  return Volume(
    dockerVolumeConfiguration: json['dockerVolumeConfiguration'] == null
        ? null
        : DockerVolumeConfiguration.fromJson(
            json['dockerVolumeConfiguration'] as Map<String, dynamic>),
    efsVolumeConfiguration: json['efsVolumeConfiguration'] == null
        ? null
        : EFSVolumeConfiguration.fromJson(
            json['efsVolumeConfiguration'] as Map<String, dynamic>),
    fsxWindowsFileServerVolumeConfiguration:
        json['fsxWindowsFileServerVolumeConfiguration'] == null
            ? null
            : FSxWindowsFileServerVolumeConfiguration.fromJson(
                json['fsxWindowsFileServerVolumeConfiguration']
                    as Map<String, dynamic>),
    host: json['host'] == null
        ? null
        : HostVolumeProperties.fromJson(json['host'] as Map<String, dynamic>),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$VolumeToJson(Volume instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dockerVolumeConfiguration',
      instance.dockerVolumeConfiguration?.toJson());
  writeNotNull(
      'efsVolumeConfiguration', instance.efsVolumeConfiguration?.toJson());
  writeNotNull('fsxWindowsFileServerVolumeConfiguration',
      instance.fsxWindowsFileServerVolumeConfiguration?.toJson());
  writeNotNull('host', instance.host?.toJson());
  writeNotNull('name', instance.name);
  return val;
}

VolumeFrom _$VolumeFromFromJson(Map<String, dynamic> json) {
  return VolumeFrom(
    readOnly: json['readOnly'] as bool,
    sourceContainer: json['sourceContainer'] as String,
  );
}

Map<String, dynamic> _$VolumeFromToJson(VolumeFrom instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('readOnly', instance.readOnly);
  writeNotNull('sourceContainer', instance.sourceContainer);
  return val;
}
