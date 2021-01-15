// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-08-10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ArrayPropertiesToJson(ArrayProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('size', instance.size);
  return val;
}

ArrayPropertiesDetail _$ArrayPropertiesDetailFromJson(
    Map<String, dynamic> json) {
  return ArrayPropertiesDetail(
    index: json['index'] as int,
    size: json['size'] as int,
    statusSummary: (json['statusSummary'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
  );
}

ArrayPropertiesSummary _$ArrayPropertiesSummaryFromJson(
    Map<String, dynamic> json) {
  return ArrayPropertiesSummary(
    index: json['index'] as int,
    size: json['size'] as int,
  );
}

AttemptContainerDetail _$AttemptContainerDetailFromJson(
    Map<String, dynamic> json) {
  return AttemptContainerDetail(
    containerInstanceArn: json['containerInstanceArn'] as String,
    exitCode: json['exitCode'] as int,
    logStreamName: json['logStreamName'] as String,
    networkInterfaces: (json['networkInterfaces'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reason: json['reason'] as String,
    taskArn: json['taskArn'] as String,
  );
}

AttemptDetail _$AttemptDetailFromJson(Map<String, dynamic> json) {
  return AttemptDetail(
    container: json['container'] == null
        ? null
        : AttemptContainerDetail.fromJson(
            json['container'] as Map<String, dynamic>),
    startedAt: json['startedAt'] as int,
    statusReason: json['statusReason'] as String,
    stoppedAt: json['stoppedAt'] as int,
  );
}

CancelJobResponse _$CancelJobResponseFromJson(Map<String, dynamic> json) {
  return CancelJobResponse();
}

ComputeEnvironmentDetail _$ComputeEnvironmentDetailFromJson(
    Map<String, dynamic> json) {
  return ComputeEnvironmentDetail(
    computeEnvironmentArn: json['computeEnvironmentArn'] as String,
    computeEnvironmentName: json['computeEnvironmentName'] as String,
    ecsClusterArn: json['ecsClusterArn'] as String,
    computeResources: json['computeResources'] == null
        ? null
        : ComputeResource.fromJson(
            json['computeResources'] as Map<String, dynamic>),
    serviceRole: json['serviceRole'] as String,
    state: _$enumDecodeNullable(_$CEStateEnumMap, json['state']),
    status: _$enumDecodeNullable(_$CEStatusEnumMap, json['status']),
    statusReason: json['statusReason'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$CETypeEnumMap, json['type']),
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

const _$CEStateEnumMap = {
  CEState.enabled: 'ENABLED',
  CEState.disabled: 'DISABLED',
};

const _$CEStatusEnumMap = {
  CEStatus.creating: 'CREATING',
  CEStatus.updating: 'UPDATING',
  CEStatus.deleting: 'DELETING',
  CEStatus.deleted: 'DELETED',
  CEStatus.valid: 'VALID',
  CEStatus.invalid: 'INVALID',
};

const _$CETypeEnumMap = {
  CEType.managed: 'MANAGED',
  CEType.unmanaged: 'UNMANAGED',
};

ComputeEnvironmentOrder _$ComputeEnvironmentOrderFromJson(
    Map<String, dynamic> json) {
  return ComputeEnvironmentOrder(
    computeEnvironment: json['computeEnvironment'] as String,
    order: json['order'] as int,
  );
}

Map<String, dynamic> _$ComputeEnvironmentOrderToJson(
    ComputeEnvironmentOrder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('computeEnvironment', instance.computeEnvironment);
  writeNotNull('order', instance.order);
  return val;
}

ComputeResource _$ComputeResourceFromJson(Map<String, dynamic> json) {
  return ComputeResource(
    maxvCpus: json['maxvCpus'] as int,
    subnets: (json['subnets'] as List)?.map((e) => e as String)?.toList(),
    type: _$enumDecodeNullable(_$CRTypeEnumMap, json['type']),
    allocationStrategy: _$enumDecodeNullable(
        _$CRAllocationStrategyEnumMap, json['allocationStrategy']),
    bidPercentage: json['bidPercentage'] as int,
    desiredvCpus: json['desiredvCpus'] as int,
    ec2Configuration: (json['ec2Configuration'] as List)
        ?.map((e) => e == null
            ? null
            : Ec2Configuration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ec2KeyPair: json['ec2KeyPair'] as String,
    imageId: json['imageId'] as String,
    instanceRole: json['instanceRole'] as String,
    instanceTypes:
        (json['instanceTypes'] as List)?.map((e) => e as String)?.toList(),
    launchTemplate: json['launchTemplate'] == null
        ? null
        : LaunchTemplateSpecification.fromJson(
            json['launchTemplate'] as Map<String, dynamic>),
    minvCpus: json['minvCpus'] as int,
    placementGroup: json['placementGroup'] as String,
    securityGroupIds:
        (json['securityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    spotIamFleetRole: json['spotIamFleetRole'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ComputeResourceToJson(ComputeResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxvCpus', instance.maxvCpus);
  writeNotNull('subnets', instance.subnets);
  writeNotNull('type', _$CRTypeEnumMap[instance.type]);
  writeNotNull('allocationStrategy',
      _$CRAllocationStrategyEnumMap[instance.allocationStrategy]);
  writeNotNull('bidPercentage', instance.bidPercentage);
  writeNotNull('desiredvCpus', instance.desiredvCpus);
  writeNotNull('ec2Configuration',
      instance.ec2Configuration?.map((e) => e?.toJson())?.toList());
  writeNotNull('ec2KeyPair', instance.ec2KeyPair);
  writeNotNull('imageId', instance.imageId);
  writeNotNull('instanceRole', instance.instanceRole);
  writeNotNull('instanceTypes', instance.instanceTypes);
  writeNotNull('launchTemplate', instance.launchTemplate?.toJson());
  writeNotNull('minvCpus', instance.minvCpus);
  writeNotNull('placementGroup', instance.placementGroup);
  writeNotNull('securityGroupIds', instance.securityGroupIds);
  writeNotNull('spotIamFleetRole', instance.spotIamFleetRole);
  writeNotNull('tags', instance.tags);
  return val;
}

const _$CRTypeEnumMap = {
  CRType.ec2: 'EC2',
  CRType.spot: 'SPOT',
  CRType.fargate: 'FARGATE',
  CRType.fargateSpot: 'FARGATE_SPOT',
};

const _$CRAllocationStrategyEnumMap = {
  CRAllocationStrategy.bestFit: 'BEST_FIT',
  CRAllocationStrategy.bestFitProgressive: 'BEST_FIT_PROGRESSIVE',
  CRAllocationStrategy.spotCapacityOptimized: 'SPOT_CAPACITY_OPTIMIZED',
};

Map<String, dynamic> _$ComputeResourceUpdateToJson(
    ComputeResourceUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('desiredvCpus', instance.desiredvCpus);
  writeNotNull('maxvCpus', instance.maxvCpus);
  writeNotNull('minvCpus', instance.minvCpus);
  writeNotNull('securityGroupIds', instance.securityGroupIds);
  writeNotNull('subnets', instance.subnets);
  return val;
}

ContainerDetail _$ContainerDetailFromJson(Map<String, dynamic> json) {
  return ContainerDetail(
    command: (json['command'] as List)?.map((e) => e as String)?.toList(),
    containerInstanceArn: json['containerInstanceArn'] as String,
    environment: (json['environment'] as List)
        ?.map((e) =>
            e == null ? null : KeyValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    executionRoleArn: json['executionRoleArn'] as String,
    exitCode: json['exitCode'] as int,
    fargatePlatformConfiguration: json['fargatePlatformConfiguration'] == null
        ? null
        : FargatePlatformConfiguration.fromJson(
            json['fargatePlatformConfiguration'] as Map<String, dynamic>),
    image: json['image'] as String,
    instanceType: json['instanceType'] as String,
    jobRoleArn: json['jobRoleArn'] as String,
    linuxParameters: json['linuxParameters'] == null
        ? null
        : LinuxParameters.fromJson(
            json['linuxParameters'] as Map<String, dynamic>),
    logConfiguration: json['logConfiguration'] == null
        ? null
        : LogConfiguration.fromJson(
            json['logConfiguration'] as Map<String, dynamic>),
    logStreamName: json['logStreamName'] as String,
    memory: json['memory'] as int,
    mountPoints: (json['mountPoints'] as List)
        ?.map((e) =>
            e == null ? null : MountPoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkConfiguration: json['networkConfiguration'] == null
        ? null
        : NetworkConfiguration.fromJson(
            json['networkConfiguration'] as Map<String, dynamic>),
    networkInterfaces: (json['networkInterfaces'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    privileged: json['privileged'] as bool,
    readonlyRootFilesystem: json['readonlyRootFilesystem'] as bool,
    reason: json['reason'] as String,
    resourceRequirements: (json['resourceRequirements'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceRequirement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secrets: (json['secrets'] as List)
        ?.map((e) =>
            e == null ? null : Secret.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taskArn: json['taskArn'] as String,
    ulimits: (json['ulimits'] as List)
        ?.map((e) =>
            e == null ? null : Ulimit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    user: json['user'] as String,
    vcpus: json['vcpus'] as int,
    volumes: (json['volumes'] as List)
        ?.map((e) =>
            e == null ? null : Volume.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ContainerOverridesToJson(ContainerOverrides instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('command', instance.command);
  writeNotNull(
      'environment', instance.environment?.map((e) => e?.toJson())?.toList());
  writeNotNull('instanceType', instance.instanceType);
  writeNotNull('memory', instance.memory);
  writeNotNull('resourceRequirements',
      instance.resourceRequirements?.map((e) => e?.toJson())?.toList());
  writeNotNull('vcpus', instance.vcpus);
  return val;
}

ContainerProperties _$ContainerPropertiesFromJson(Map<String, dynamic> json) {
  return ContainerProperties(
    command: (json['command'] as List)?.map((e) => e as String)?.toList(),
    environment: (json['environment'] as List)
        ?.map((e) =>
            e == null ? null : KeyValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    executionRoleArn: json['executionRoleArn'] as String,
    fargatePlatformConfiguration: json['fargatePlatformConfiguration'] == null
        ? null
        : FargatePlatformConfiguration.fromJson(
            json['fargatePlatformConfiguration'] as Map<String, dynamic>),
    image: json['image'] as String,
    instanceType: json['instanceType'] as String,
    jobRoleArn: json['jobRoleArn'] as String,
    linuxParameters: json['linuxParameters'] == null
        ? null
        : LinuxParameters.fromJson(
            json['linuxParameters'] as Map<String, dynamic>),
    logConfiguration: json['logConfiguration'] == null
        ? null
        : LogConfiguration.fromJson(
            json['logConfiguration'] as Map<String, dynamic>),
    memory: json['memory'] as int,
    mountPoints: (json['mountPoints'] as List)
        ?.map((e) =>
            e == null ? null : MountPoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkConfiguration: json['networkConfiguration'] == null
        ? null
        : NetworkConfiguration.fromJson(
            json['networkConfiguration'] as Map<String, dynamic>),
    privileged: json['privileged'] as bool,
    readonlyRootFilesystem: json['readonlyRootFilesystem'] as bool,
    resourceRequirements: (json['resourceRequirements'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceRequirement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secrets: (json['secrets'] as List)
        ?.map((e) =>
            e == null ? null : Secret.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ulimits: (json['ulimits'] as List)
        ?.map((e) =>
            e == null ? null : Ulimit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    user: json['user'] as String,
    vcpus: json['vcpus'] as int,
    volumes: (json['volumes'] as List)
        ?.map((e) =>
            e == null ? null : Volume.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ContainerPropertiesToJson(ContainerProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('command', instance.command);
  writeNotNull(
      'environment', instance.environment?.map((e) => e?.toJson())?.toList());
  writeNotNull('executionRoleArn', instance.executionRoleArn);
  writeNotNull('fargatePlatformConfiguration',
      instance.fargatePlatformConfiguration?.toJson());
  writeNotNull('image', instance.image);
  writeNotNull('instanceType', instance.instanceType);
  writeNotNull('jobRoleArn', instance.jobRoleArn);
  writeNotNull('linuxParameters', instance.linuxParameters?.toJson());
  writeNotNull('logConfiguration', instance.logConfiguration?.toJson());
  writeNotNull('memory', instance.memory);
  writeNotNull(
      'mountPoints', instance.mountPoints?.map((e) => e?.toJson())?.toList());
  writeNotNull('networkConfiguration', instance.networkConfiguration?.toJson());
  writeNotNull('privileged', instance.privileged);
  writeNotNull('readonlyRootFilesystem', instance.readonlyRootFilesystem);
  writeNotNull('resourceRequirements',
      instance.resourceRequirements?.map((e) => e?.toJson())?.toList());
  writeNotNull('secrets', instance.secrets?.map((e) => e?.toJson())?.toList());
  writeNotNull('ulimits', instance.ulimits?.map((e) => e?.toJson())?.toList());
  writeNotNull('user', instance.user);
  writeNotNull('vcpus', instance.vcpus);
  writeNotNull('volumes', instance.volumes?.map((e) => e?.toJson())?.toList());
  return val;
}

ContainerSummary _$ContainerSummaryFromJson(Map<String, dynamic> json) {
  return ContainerSummary(
    exitCode: json['exitCode'] as int,
    reason: json['reason'] as String,
  );
}

CreateComputeEnvironmentResponse _$CreateComputeEnvironmentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateComputeEnvironmentResponse(
    computeEnvironmentArn: json['computeEnvironmentArn'] as String,
    computeEnvironmentName: json['computeEnvironmentName'] as String,
  );
}

CreateJobQueueResponse _$CreateJobQueueResponseFromJson(
    Map<String, dynamic> json) {
  return CreateJobQueueResponse(
    jobQueueArn: json['jobQueueArn'] as String,
    jobQueueName: json['jobQueueName'] as String,
  );
}

DeleteComputeEnvironmentResponse _$DeleteComputeEnvironmentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteComputeEnvironmentResponse();
}

DeleteJobQueueResponse _$DeleteJobQueueResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteJobQueueResponse();
}

DeregisterJobDefinitionResponse _$DeregisterJobDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeregisterJobDefinitionResponse();
}

DescribeComputeEnvironmentsResponse
    _$DescribeComputeEnvironmentsResponseFromJson(Map<String, dynamic> json) {
  return DescribeComputeEnvironmentsResponse(
    computeEnvironments: (json['computeEnvironments'] as List)
        ?.map((e) => e == null
            ? null
            : ComputeEnvironmentDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeJobDefinitionsResponse _$DescribeJobDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeJobDefinitionsResponse(
    jobDefinitions: (json['jobDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : JobDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeJobQueuesResponse _$DescribeJobQueuesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeJobQueuesResponse(
    jobQueues: (json['jobQueues'] as List)
        ?.map((e) => e == null
            ? null
            : JobQueueDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeJobsResponse _$DescribeJobsResponseFromJson(Map<String, dynamic> json) {
  return DescribeJobsResponse(
    jobs: (json['jobs'] as List)
        ?.map((e) =>
            e == null ? null : JobDetail.fromJson(e as Map<String, dynamic>))
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
  DeviceCgroupPermission.read: 'READ',
  DeviceCgroupPermission.write: 'WRITE',
  DeviceCgroupPermission.mknod: 'MKNOD',
};

Ec2Configuration _$Ec2ConfigurationFromJson(Map<String, dynamic> json) {
  return Ec2Configuration(
    imageType: json['imageType'] as String,
    imageIdOverride: json['imageIdOverride'] as String,
  );
}

Map<String, dynamic> _$Ec2ConfigurationToJson(Ec2Configuration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageType', instance.imageType);
  writeNotNull('imageIdOverride', instance.imageIdOverride);
  return val;
}

EvaluateOnExit _$EvaluateOnExitFromJson(Map<String, dynamic> json) {
  return EvaluateOnExit(
    action: _$enumDecodeNullable(_$RetryActionEnumMap, json['action']),
    onExitCode: json['onExitCode'] as String,
    onReason: json['onReason'] as String,
    onStatusReason: json['onStatusReason'] as String,
  );
}

Map<String, dynamic> _$EvaluateOnExitToJson(EvaluateOnExit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('action', _$RetryActionEnumMap[instance.action]);
  writeNotNull('onExitCode', instance.onExitCode);
  writeNotNull('onReason', instance.onReason);
  writeNotNull('onStatusReason', instance.onStatusReason);
  return val;
}

const _$RetryActionEnumMap = {
  RetryAction.retry: 'RETRY',
  RetryAction.exit: 'EXIT',
};

FargatePlatformConfiguration _$FargatePlatformConfigurationFromJson(
    Map<String, dynamic> json) {
  return FargatePlatformConfiguration(
    platformVersion: json['platformVersion'] as String,
  );
}

Map<String, dynamic> _$FargatePlatformConfigurationToJson(
    FargatePlatformConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('platformVersion', instance.platformVersion);
  return val;
}

Host _$HostFromJson(Map<String, dynamic> json) {
  return Host(
    sourcePath: json['sourcePath'] as String,
  );
}

Map<String, dynamic> _$HostToJson(Host instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sourcePath', instance.sourcePath);
  return val;
}

JobDefinition _$JobDefinitionFromJson(Map<String, dynamic> json) {
  return JobDefinition(
    jobDefinitionArn: json['jobDefinitionArn'] as String,
    jobDefinitionName: json['jobDefinitionName'] as String,
    revision: json['revision'] as int,
    type: json['type'] as String,
    containerProperties: json['containerProperties'] == null
        ? null
        : ContainerProperties.fromJson(
            json['containerProperties'] as Map<String, dynamic>),
    nodeProperties: json['nodeProperties'] == null
        ? null
        : NodeProperties.fromJson(
            json['nodeProperties'] as Map<String, dynamic>),
    parameters: (json['parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    platformCapabilities: (json['platformCapabilities'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PlatformCapabilityEnumMap, e))
        ?.toList(),
    propagateTags: json['propagateTags'] as bool,
    retryStrategy: json['retryStrategy'] == null
        ? null
        : RetryStrategy.fromJson(json['retryStrategy'] as Map<String, dynamic>),
    status: json['status'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeout: json['timeout'] == null
        ? null
        : JobTimeout.fromJson(json['timeout'] as Map<String, dynamic>),
  );
}

const _$PlatformCapabilityEnumMap = {
  PlatformCapability.ec2: 'EC2',
  PlatformCapability.fargate: 'FARGATE',
};

JobDependency _$JobDependencyFromJson(Map<String, dynamic> json) {
  return JobDependency(
    jobId: json['jobId'] as String,
    type: _$enumDecodeNullable(_$ArrayJobDependencyEnumMap, json['type']),
  );
}

Map<String, dynamic> _$JobDependencyToJson(JobDependency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jobId', instance.jobId);
  writeNotNull('type', _$ArrayJobDependencyEnumMap[instance.type]);
  return val;
}

const _$ArrayJobDependencyEnumMap = {
  ArrayJobDependency.nToN: 'N_TO_N',
  ArrayJobDependency.sequential: 'SEQUENTIAL',
};

JobDetail _$JobDetailFromJson(Map<String, dynamic> json) {
  return JobDetail(
    jobDefinition: json['jobDefinition'] as String,
    jobId: json['jobId'] as String,
    jobName: json['jobName'] as String,
    jobQueue: json['jobQueue'] as String,
    startedAt: json['startedAt'] as int,
    status: _$enumDecodeNullable(_$JobStatusEnumMap, json['status']),
    arrayProperties: json['arrayProperties'] == null
        ? null
        : ArrayPropertiesDetail.fromJson(
            json['arrayProperties'] as Map<String, dynamic>),
    attempts: (json['attempts'] as List)
        ?.map((e) => e == null
            ? null
            : AttemptDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    container: json['container'] == null
        ? null
        : ContainerDetail.fromJson(json['container'] as Map<String, dynamic>),
    createdAt: json['createdAt'] as int,
    dependsOn: (json['dependsOn'] as List)
        ?.map((e) => e == null
            ? null
            : JobDependency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobArn: json['jobArn'] as String,
    nodeDetails: json['nodeDetails'] == null
        ? null
        : NodeDetails.fromJson(json['nodeDetails'] as Map<String, dynamic>),
    nodeProperties: json['nodeProperties'] == null
        ? null
        : NodeProperties.fromJson(
            json['nodeProperties'] as Map<String, dynamic>),
    parameters: (json['parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    platformCapabilities: (json['platformCapabilities'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PlatformCapabilityEnumMap, e))
        ?.toList(),
    propagateTags: json['propagateTags'] as bool,
    retryStrategy: json['retryStrategy'] == null
        ? null
        : RetryStrategy.fromJson(json['retryStrategy'] as Map<String, dynamic>),
    statusReason: json['statusReason'] as String,
    stoppedAt: json['stoppedAt'] as int,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeout: json['timeout'] == null
        ? null
        : JobTimeout.fromJson(json['timeout'] as Map<String, dynamic>),
  );
}

const _$JobStatusEnumMap = {
  JobStatus.submitted: 'SUBMITTED',
  JobStatus.pending: 'PENDING',
  JobStatus.runnable: 'RUNNABLE',
  JobStatus.starting: 'STARTING',
  JobStatus.running: 'RUNNING',
  JobStatus.succeeded: 'SUCCEEDED',
  JobStatus.failed: 'FAILED',
};

JobQueueDetail _$JobQueueDetailFromJson(Map<String, dynamic> json) {
  return JobQueueDetail(
    computeEnvironmentOrder: (json['computeEnvironmentOrder'] as List)
        ?.map((e) => e == null
            ? null
            : ComputeEnvironmentOrder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobQueueArn: json['jobQueueArn'] as String,
    jobQueueName: json['jobQueueName'] as String,
    priority: json['priority'] as int,
    state: _$enumDecodeNullable(_$JQStateEnumMap, json['state']),
    status: _$enumDecodeNullable(_$JQStatusEnumMap, json['status']),
    statusReason: json['statusReason'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$JQStateEnumMap = {
  JQState.enabled: 'ENABLED',
  JQState.disabled: 'DISABLED',
};

const _$JQStatusEnumMap = {
  JQStatus.creating: 'CREATING',
  JQStatus.updating: 'UPDATING',
  JQStatus.deleting: 'DELETING',
  JQStatus.deleted: 'DELETED',
  JQStatus.valid: 'VALID',
  JQStatus.invalid: 'INVALID',
};

JobSummary _$JobSummaryFromJson(Map<String, dynamic> json) {
  return JobSummary(
    jobId: json['jobId'] as String,
    jobName: json['jobName'] as String,
    arrayProperties: json['arrayProperties'] == null
        ? null
        : ArrayPropertiesSummary.fromJson(
            json['arrayProperties'] as Map<String, dynamic>),
    container: json['container'] == null
        ? null
        : ContainerSummary.fromJson(json['container'] as Map<String, dynamic>),
    createdAt: json['createdAt'] as int,
    jobArn: json['jobArn'] as String,
    nodeProperties: json['nodeProperties'] == null
        ? null
        : NodePropertiesSummary.fromJson(
            json['nodeProperties'] as Map<String, dynamic>),
    startedAt: json['startedAt'] as int,
    status: _$enumDecodeNullable(_$JobStatusEnumMap, json['status']),
    statusReason: json['statusReason'] as String,
    stoppedAt: json['stoppedAt'] as int,
  );
}

JobTimeout _$JobTimeoutFromJson(Map<String, dynamic> json) {
  return JobTimeout(
    attemptDurationSeconds: json['attemptDurationSeconds'] as int,
  );
}

Map<String, dynamic> _$JobTimeoutToJson(JobTimeout instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attemptDurationSeconds', instance.attemptDurationSeconds);
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

LaunchTemplateSpecification _$LaunchTemplateSpecificationFromJson(
    Map<String, dynamic> json) {
  return LaunchTemplateSpecification(
    launchTemplateId: json['launchTemplateId'] as String,
    launchTemplateName: json['launchTemplateName'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$LaunchTemplateSpecificationToJson(
    LaunchTemplateSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('launchTemplateId', instance.launchTemplateId);
  writeNotNull('launchTemplateName', instance.launchTemplateName);
  writeNotNull('version', instance.version);
  return val;
}

LinuxParameters _$LinuxParametersFromJson(Map<String, dynamic> json) {
  return LinuxParameters(
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

  writeNotNull('devices', instance.devices?.map((e) => e?.toJson())?.toList());
  writeNotNull('initProcessEnabled', instance.initProcessEnabled);
  writeNotNull('maxSwap', instance.maxSwap);
  writeNotNull('sharedMemorySize', instance.sharedMemorySize);
  writeNotNull('swappiness', instance.swappiness);
  writeNotNull('tmpfs', instance.tmpfs?.map((e) => e?.toJson())?.toList());
  return val;
}

ListJobsResponse _$ListJobsResponseFromJson(Map<String, dynamic> json) {
  return ListJobsResponse(
    jobSummaryList: (json['jobSummaryList'] as List)
        ?.map((e) =>
            e == null ? null : JobSummary.fromJson(e as Map<String, dynamic>))
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

NetworkConfiguration _$NetworkConfigurationFromJson(Map<String, dynamic> json) {
  return NetworkConfiguration(
    assignPublicIp:
        _$enumDecodeNullable(_$AssignPublicIpEnumMap, json['assignPublicIp']),
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

  writeNotNull(
      'assignPublicIp', _$AssignPublicIpEnumMap[instance.assignPublicIp]);
  return val;
}

const _$AssignPublicIpEnumMap = {
  AssignPublicIp.enabled: 'ENABLED',
  AssignPublicIp.disabled: 'DISABLED',
};

NetworkInterface _$NetworkInterfaceFromJson(Map<String, dynamic> json) {
  return NetworkInterface(
    attachmentId: json['attachmentId'] as String,
    ipv6Address: json['ipv6Address'] as String,
    privateIpv4Address: json['privateIpv4Address'] as String,
  );
}

NodeDetails _$NodeDetailsFromJson(Map<String, dynamic> json) {
  return NodeDetails(
    isMainNode: json['isMainNode'] as bool,
    nodeIndex: json['nodeIndex'] as int,
  );
}

Map<String, dynamic> _$NodeOverridesToJson(NodeOverrides instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nodePropertyOverrides',
      instance.nodePropertyOverrides?.map((e) => e?.toJson())?.toList());
  writeNotNull('numNodes', instance.numNodes);
  return val;
}

NodeProperties _$NodePropertiesFromJson(Map<String, dynamic> json) {
  return NodeProperties(
    mainNode: json['mainNode'] as int,
    nodeRangeProperties: (json['nodeRangeProperties'] as List)
        ?.map((e) => e == null
            ? null
            : NodeRangeProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    numNodes: json['numNodes'] as int,
  );
}

Map<String, dynamic> _$NodePropertiesToJson(NodeProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mainNode', instance.mainNode);
  writeNotNull('nodeRangeProperties',
      instance.nodeRangeProperties?.map((e) => e?.toJson())?.toList());
  writeNotNull('numNodes', instance.numNodes);
  return val;
}

NodePropertiesSummary _$NodePropertiesSummaryFromJson(
    Map<String, dynamic> json) {
  return NodePropertiesSummary(
    isMainNode: json['isMainNode'] as bool,
    nodeIndex: json['nodeIndex'] as int,
    numNodes: json['numNodes'] as int,
  );
}

Map<String, dynamic> _$NodePropertyOverrideToJson(
    NodePropertyOverride instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('targetNodes', instance.targetNodes);
  writeNotNull('containerOverrides', instance.containerOverrides?.toJson());
  return val;
}

NodeRangeProperty _$NodeRangePropertyFromJson(Map<String, dynamic> json) {
  return NodeRangeProperty(
    targetNodes: json['targetNodes'] as String,
    container: json['container'] == null
        ? null
        : ContainerProperties.fromJson(
            json['container'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NodeRangePropertyToJson(NodeRangeProperty instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('targetNodes', instance.targetNodes);
  writeNotNull('container', instance.container?.toJson());
  return val;
}

RegisterJobDefinitionResponse _$RegisterJobDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterJobDefinitionResponse(
    jobDefinitionArn: json['jobDefinitionArn'] as String,
    jobDefinitionName: json['jobDefinitionName'] as String,
    revision: json['revision'] as int,
  );
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
  ResourceType.vcpu: 'VCPU',
  ResourceType.memory: 'MEMORY',
};

RetryStrategy _$RetryStrategyFromJson(Map<String, dynamic> json) {
  return RetryStrategy(
    attempts: json['attempts'] as int,
    evaluateOnExit: (json['evaluateOnExit'] as List)
        ?.map((e) => e == null
            ? null
            : EvaluateOnExit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RetryStrategyToJson(RetryStrategy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attempts', instance.attempts);
  writeNotNull('evaluateOnExit',
      instance.evaluateOnExit?.map((e) => e?.toJson())?.toList());
  return val;
}

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

SubmitJobResponse _$SubmitJobResponseFromJson(Map<String, dynamic> json) {
  return SubmitJobResponse(
    jobId: json['jobId'] as String,
    jobName: json['jobName'] as String,
    jobArn: json['jobArn'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TerminateJobResponse _$TerminateJobResponseFromJson(Map<String, dynamic> json) {
  return TerminateJobResponse();
}

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
    name: json['name'] as String,
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
  writeNotNull('name', instance.name);
  writeNotNull('softLimit', instance.softLimit);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateComputeEnvironmentResponse _$UpdateComputeEnvironmentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateComputeEnvironmentResponse(
    computeEnvironmentArn: json['computeEnvironmentArn'] as String,
    computeEnvironmentName: json['computeEnvironmentName'] as String,
  );
}

UpdateJobQueueResponse _$UpdateJobQueueResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateJobQueueResponse(
    jobQueueArn: json['jobQueueArn'] as String,
    jobQueueName: json['jobQueueName'] as String,
  );
}

Volume _$VolumeFromJson(Map<String, dynamic> json) {
  return Volume(
    host: json['host'] == null
        ? null
        : Host.fromJson(json['host'] as Map<String, dynamic>),
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

  writeNotNull('host', instance.host?.toJson());
  writeNotNull('name', instance.name);
  return val;
}
