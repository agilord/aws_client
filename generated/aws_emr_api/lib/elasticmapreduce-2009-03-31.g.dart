// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elasticmapreduce-2009-03-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddInstanceFleetOutput _$AddInstanceFleetOutputFromJson(
    Map<String, dynamic> json) {
  return AddInstanceFleetOutput(
    clusterArn: json['ClusterArn'] as String?,
    clusterId: json['ClusterId'] as String?,
    instanceFleetId: json['InstanceFleetId'] as String?,
  );
}

AddInstanceGroupsOutput _$AddInstanceGroupsOutputFromJson(
    Map<String, dynamic> json) {
  return AddInstanceGroupsOutput(
    clusterArn: json['ClusterArn'] as String?,
    instanceGroupIds: (json['InstanceGroupIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    jobFlowId: json['JobFlowId'] as String?,
  );
}

AddJobFlowStepsOutput _$AddJobFlowStepsOutputFromJson(
    Map<String, dynamic> json) {
  return AddJobFlowStepsOutput(
    stepIds:
        (json['StepIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

AddTagsOutput _$AddTagsOutputFromJson(Map<String, dynamic> json) {
  return AddTagsOutput();
}

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    additionalInfo: (json['AdditionalInfo'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    args: (json['Args'] as List<dynamic>?)?.map((e) => e as String).toList(),
    name: json['Name'] as String?,
    version: json['Version'] as String?,
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdditionalInfo', instance.additionalInfo);
  writeNotNull('Args', instance.args);
  writeNotNull('Name', instance.name);
  writeNotNull('Version', instance.version);
  return val;
}

Map<String, dynamic> _$AutoScalingPolicyToJson(AutoScalingPolicy instance) =>
    <String, dynamic>{
      'Constraints': instance.constraints.toJson(),
      'Rules': instance.rules.map((e) => e.toJson()).toList(),
    };

AutoScalingPolicyDescription _$AutoScalingPolicyDescriptionFromJson(
    Map<String, dynamic> json) {
  return AutoScalingPolicyDescription(
    constraints: json['Constraints'] == null
        ? null
        : ScalingConstraints.fromJson(
            json['Constraints'] as Map<String, dynamic>),
    rules: (json['Rules'] as List<dynamic>?)
        ?.map((e) => ScalingRule.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['Status'] == null
        ? null
        : AutoScalingPolicyStatus.fromJson(
            json['Status'] as Map<String, dynamic>),
  );
}

AutoScalingPolicyStateChangeReason _$AutoScalingPolicyStateChangeReasonFromJson(
    Map<String, dynamic> json) {
  return AutoScalingPolicyStateChangeReason(
    code: _$enumDecodeNullable(
        _$AutoScalingPolicyStateChangeReasonCodeEnumMap, json['Code']),
    message: json['Message'] as String?,
  );
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$AutoScalingPolicyStateChangeReasonCodeEnumMap = {
  AutoScalingPolicyStateChangeReasonCode.userRequest: 'USER_REQUEST',
  AutoScalingPolicyStateChangeReasonCode.provisionFailure: 'PROVISION_FAILURE',
  AutoScalingPolicyStateChangeReasonCode.cleanupFailure: 'CLEANUP_FAILURE',
};

AutoScalingPolicyStatus _$AutoScalingPolicyStatusFromJson(
    Map<String, dynamic> json) {
  return AutoScalingPolicyStatus(
    state: _$enumDecodeNullable(_$AutoScalingPolicyStateEnumMap, json['State']),
    stateChangeReason: json['StateChangeReason'] == null
        ? null
        : AutoScalingPolicyStateChangeReason.fromJson(
            json['StateChangeReason'] as Map<String, dynamic>),
  );
}

const _$AutoScalingPolicyStateEnumMap = {
  AutoScalingPolicyState.pending: 'PENDING',
  AutoScalingPolicyState.attaching: 'ATTACHING',
  AutoScalingPolicyState.attached: 'ATTACHED',
  AutoScalingPolicyState.detaching: 'DETACHING',
  AutoScalingPolicyState.detached: 'DETACHED',
  AutoScalingPolicyState.failed: 'FAILED',
};

BlockPublicAccessConfiguration _$BlockPublicAccessConfigurationFromJson(
    Map<String, dynamic> json) {
  return BlockPublicAccessConfiguration(
    blockPublicSecurityGroupRules:
        json['BlockPublicSecurityGroupRules'] as bool,
    permittedPublicSecurityGroupRuleRanges:
        (json['PermittedPublicSecurityGroupRuleRanges'] as List<dynamic>?)
            ?.map((e) => PortRange.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

Map<String, dynamic> _$BlockPublicAccessConfigurationToJson(
    BlockPublicAccessConfiguration instance) {
  final val = <String, dynamic>{
    'BlockPublicSecurityGroupRules': instance.blockPublicSecurityGroupRules,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'PermittedPublicSecurityGroupRuleRanges',
      instance.permittedPublicSecurityGroupRuleRanges
          ?.map((e) => e.toJson())
          .toList());
  return val;
}

BlockPublicAccessConfigurationMetadata
    _$BlockPublicAccessConfigurationMetadataFromJson(
        Map<String, dynamic> json) {
  return BlockPublicAccessConfigurationMetadata(
    createdByArn: json['CreatedByArn'] as String,
    creationDateTime: DateTime.parse(json['CreationDateTime'] as String),
  );
}

BootstrapActionConfig _$BootstrapActionConfigFromJson(
    Map<String, dynamic> json) {
  return BootstrapActionConfig(
    name: json['Name'] as String,
    scriptBootstrapAction: ScriptBootstrapActionConfig.fromJson(
        json['ScriptBootstrapAction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BootstrapActionConfigToJson(
        BootstrapActionConfig instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'ScriptBootstrapAction': instance.scriptBootstrapAction.toJson(),
    };

BootstrapActionDetail _$BootstrapActionDetailFromJson(
    Map<String, dynamic> json) {
  return BootstrapActionDetail(
    bootstrapActionConfig: json['BootstrapActionConfig'] == null
        ? null
        : BootstrapActionConfig.fromJson(
            json['BootstrapActionConfig'] as Map<String, dynamic>),
  );
}

CancelStepsInfo _$CancelStepsInfoFromJson(Map<String, dynamic> json) {
  return CancelStepsInfo(
    reason: json['Reason'] as String?,
    status:
        _$enumDecodeNullable(_$CancelStepsRequestStatusEnumMap, json['Status']),
    stepId: json['StepId'] as String?,
  );
}

const _$CancelStepsRequestStatusEnumMap = {
  CancelStepsRequestStatus.submitted: 'SUBMITTED',
  CancelStepsRequestStatus.failed: 'FAILED',
};

CancelStepsOutput _$CancelStepsOutputFromJson(Map<String, dynamic> json) {
  return CancelStepsOutput(
    cancelStepsInfoList: (json['CancelStepsInfoList'] as List<dynamic>?)
        ?.map((e) => CancelStepsInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

CloudWatchAlarmDefinition _$CloudWatchAlarmDefinitionFromJson(
    Map<String, dynamic> json) {
  return CloudWatchAlarmDefinition(
    comparisonOperator:
        _$enumDecode(_$ComparisonOperatorEnumMap, json['ComparisonOperator']),
    metricName: json['MetricName'] as String,
    period: json['Period'] as int,
    threshold: (json['Threshold'] as num).toDouble(),
    dimensions: (json['Dimensions'] as List<dynamic>?)
        ?.map((e) => MetricDimension.fromJson(e as Map<String, dynamic>))
        .toList(),
    evaluationPeriods: json['EvaluationPeriods'] as int?,
    namespace: json['Namespace'] as String?,
    statistic: _$enumDecodeNullable(_$StatisticEnumMap, json['Statistic']),
    unit: _$enumDecodeNullable(_$UnitEnumMap, json['Unit']),
  );
}

Map<String, dynamic> _$CloudWatchAlarmDefinitionToJson(
    CloudWatchAlarmDefinition instance) {
  final val = <String, dynamic>{
    'ComparisonOperator':
        _$ComparisonOperatorEnumMap[instance.comparisonOperator],
    'MetricName': instance.metricName,
    'Period': instance.period,
    'Threshold': instance.threshold,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Dimensions', instance.dimensions?.map((e) => e.toJson()).toList());
  writeNotNull('EvaluationPeriods', instance.evaluationPeriods);
  writeNotNull('Namespace', instance.namespace);
  writeNotNull('Statistic', _$StatisticEnumMap[instance.statistic]);
  writeNotNull('Unit', _$UnitEnumMap[instance.unit]);
  return val;
}

const _$ComparisonOperatorEnumMap = {
  ComparisonOperator.greaterThanOrEqual: 'GREATER_THAN_OR_EQUAL',
  ComparisonOperator.greaterThan: 'GREATER_THAN',
  ComparisonOperator.lessThan: 'LESS_THAN',
  ComparisonOperator.lessThanOrEqual: 'LESS_THAN_OR_EQUAL',
};

const _$StatisticEnumMap = {
  Statistic.sampleCount: 'SAMPLE_COUNT',
  Statistic.average: 'AVERAGE',
  Statistic.sum: 'SUM',
  Statistic.minimum: 'MINIMUM',
  Statistic.maximum: 'MAXIMUM',
};

const _$UnitEnumMap = {
  Unit.none: 'NONE',
  Unit.seconds: 'SECONDS',
  Unit.microSeconds: 'MICRO_SECONDS',
  Unit.milliSeconds: 'MILLI_SECONDS',
  Unit.bytes: 'BYTES',
  Unit.kiloBytes: 'KILO_BYTES',
  Unit.megaBytes: 'MEGA_BYTES',
  Unit.gigaBytes: 'GIGA_BYTES',
  Unit.teraBytes: 'TERA_BYTES',
  Unit.bits: 'BITS',
  Unit.kiloBits: 'KILO_BITS',
  Unit.megaBits: 'MEGA_BITS',
  Unit.gigaBits: 'GIGA_BITS',
  Unit.teraBits: 'TERA_BITS',
  Unit.percent: 'PERCENT',
  Unit.count: 'COUNT',
  Unit.bytesPerSecond: 'BYTES_PER_SECOND',
  Unit.kiloBytesPerSecond: 'KILO_BYTES_PER_SECOND',
  Unit.megaBytesPerSecond: 'MEGA_BYTES_PER_SECOND',
  Unit.gigaBytesPerSecond: 'GIGA_BYTES_PER_SECOND',
  Unit.teraBytesPerSecond: 'TERA_BYTES_PER_SECOND',
  Unit.bitsPerSecond: 'BITS_PER_SECOND',
  Unit.kiloBitsPerSecond: 'KILO_BITS_PER_SECOND',
  Unit.megaBitsPerSecond: 'MEGA_BITS_PER_SECOND',
  Unit.gigaBitsPerSecond: 'GIGA_BITS_PER_SECOND',
  Unit.teraBitsPerSecond: 'TERA_BITS_PER_SECOND',
  Unit.countPerSecond: 'COUNT_PER_SECOND',
};

Cluster _$ClusterFromJson(Map<String, dynamic> json) {
  return Cluster(
    applications: (json['Applications'] as List<dynamic>?)
        ?.map((e) => Application.fromJson(e as Map<String, dynamic>))
        .toList(),
    autoScalingRole: json['AutoScalingRole'] as String?,
    autoTerminate: json['AutoTerminate'] as bool?,
    clusterArn: json['ClusterArn'] as String?,
    configurations: (json['Configurations'] as List<dynamic>?)
        ?.map((e) => Configuration.fromJson(e as Map<String, dynamic>))
        .toList(),
    customAmiId: json['CustomAmiId'] as String?,
    ebsRootVolumeSize: json['EbsRootVolumeSize'] as int?,
    ec2InstanceAttributes: json['Ec2InstanceAttributes'] == null
        ? null
        : Ec2InstanceAttributes.fromJson(
            json['Ec2InstanceAttributes'] as Map<String, dynamic>),
    id: json['Id'] as String?,
    instanceCollectionType: _$enumDecodeNullable(
        _$InstanceCollectionTypeEnumMap, json['InstanceCollectionType']),
    kerberosAttributes: json['KerberosAttributes'] == null
        ? null
        : KerberosAttributes.fromJson(
            json['KerberosAttributes'] as Map<String, dynamic>),
    logEncryptionKmsKeyId: json['LogEncryptionKmsKeyId'] as String?,
    logUri: json['LogUri'] as String?,
    masterPublicDnsName: json['MasterPublicDnsName'] as String?,
    name: json['Name'] as String?,
    normalizedInstanceHours: json['NormalizedInstanceHours'] as int?,
    outpostArn: json['OutpostArn'] as String?,
    placementGroups: (json['PlacementGroups'] as List<dynamic>?)
        ?.map((e) => PlacementGroupConfig.fromJson(e as Map<String, dynamic>))
        .toList(),
    releaseLabel: json['ReleaseLabel'] as String?,
    repoUpgradeOnBoot: _$enumDecodeNullable(
        _$RepoUpgradeOnBootEnumMap, json['RepoUpgradeOnBoot']),
    requestedAmiVersion: json['RequestedAmiVersion'] as String?,
    runningAmiVersion: json['RunningAmiVersion'] as String?,
    scaleDownBehavior: _$enumDecodeNullable(
        _$ScaleDownBehaviorEnumMap, json['ScaleDownBehavior']),
    securityConfiguration: json['SecurityConfiguration'] as String?,
    serviceRole: json['ServiceRole'] as String?,
    status: json['Status'] == null
        ? null
        : ClusterStatus.fromJson(json['Status'] as Map<String, dynamic>),
    stepConcurrencyLevel: json['StepConcurrencyLevel'] as int?,
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    terminationProtected: json['TerminationProtected'] as bool?,
    visibleToAllUsers: json['VisibleToAllUsers'] as bool?,
  );
}

const _$InstanceCollectionTypeEnumMap = {
  InstanceCollectionType.instanceFleet: 'INSTANCE_FLEET',
  InstanceCollectionType.instanceGroup: 'INSTANCE_GROUP',
};

const _$RepoUpgradeOnBootEnumMap = {
  RepoUpgradeOnBoot.security: 'SECURITY',
  RepoUpgradeOnBoot.none: 'NONE',
};

const _$ScaleDownBehaviorEnumMap = {
  ScaleDownBehavior.terminateAtInstanceHour: 'TERMINATE_AT_INSTANCE_HOUR',
  ScaleDownBehavior.terminateAtTaskCompletion: 'TERMINATE_AT_TASK_COMPLETION',
};

ClusterStateChangeReason _$ClusterStateChangeReasonFromJson(
    Map<String, dynamic> json) {
  return ClusterStateChangeReason(
    code: _$enumDecodeNullable(
        _$ClusterStateChangeReasonCodeEnumMap, json['Code']),
    message: json['Message'] as String?,
  );
}

const _$ClusterStateChangeReasonCodeEnumMap = {
  ClusterStateChangeReasonCode.internalError: 'INTERNAL_ERROR',
  ClusterStateChangeReasonCode.validationError: 'VALIDATION_ERROR',
  ClusterStateChangeReasonCode.instanceFailure: 'INSTANCE_FAILURE',
  ClusterStateChangeReasonCode.instanceFleetTimeout: 'INSTANCE_FLEET_TIMEOUT',
  ClusterStateChangeReasonCode.bootstrapFailure: 'BOOTSTRAP_FAILURE',
  ClusterStateChangeReasonCode.userRequest: 'USER_REQUEST',
  ClusterStateChangeReasonCode.stepFailure: 'STEP_FAILURE',
  ClusterStateChangeReasonCode.allStepsCompleted: 'ALL_STEPS_COMPLETED',
};

ClusterStatus _$ClusterStatusFromJson(Map<String, dynamic> json) {
  return ClusterStatus(
    state: _$enumDecodeNullable(_$ClusterStateEnumMap, json['State']),
    stateChangeReason: json['StateChangeReason'] == null
        ? null
        : ClusterStateChangeReason.fromJson(
            json['StateChangeReason'] as Map<String, dynamic>),
    timeline: json['Timeline'] == null
        ? null
        : ClusterTimeline.fromJson(json['Timeline'] as Map<String, dynamic>),
  );
}

const _$ClusterStateEnumMap = {
  ClusterState.starting: 'STARTING',
  ClusterState.bootstrapping: 'BOOTSTRAPPING',
  ClusterState.running: 'RUNNING',
  ClusterState.waiting: 'WAITING',
  ClusterState.terminating: 'TERMINATING',
  ClusterState.terminated: 'TERMINATED',
  ClusterState.terminatedWithErrors: 'TERMINATED_WITH_ERRORS',
};

ClusterSummary _$ClusterSummaryFromJson(Map<String, dynamic> json) {
  return ClusterSummary(
    clusterArn: json['ClusterArn'] as String?,
    id: json['Id'] as String?,
    name: json['Name'] as String?,
    normalizedInstanceHours: json['NormalizedInstanceHours'] as int?,
    outpostArn: json['OutpostArn'] as String?,
    status: json['Status'] == null
        ? null
        : ClusterStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

ClusterTimeline _$ClusterTimelineFromJson(Map<String, dynamic> json) {
  return ClusterTimeline(
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    endDateTime: const UnixDateTimeConverter().fromJson(json['EndDateTime']),
    readyDateTime:
        const UnixDateTimeConverter().fromJson(json['ReadyDateTime']),
  );
}

Command _$CommandFromJson(Map<String, dynamic> json) {
  return Command(
    args: (json['Args'] as List<dynamic>?)?.map((e) => e as String).toList(),
    name: json['Name'] as String?,
    scriptPath: json['ScriptPath'] as String?,
  );
}

ComputeLimits _$ComputeLimitsFromJson(Map<String, dynamic> json) {
  return ComputeLimits(
    maximumCapacityUnits: json['MaximumCapacityUnits'] as int,
    minimumCapacityUnits: json['MinimumCapacityUnits'] as int,
    unitType: _$enumDecode(_$ComputeLimitsUnitTypeEnumMap, json['UnitType']),
    maximumCoreCapacityUnits: json['MaximumCoreCapacityUnits'] as int?,
    maximumOnDemandCapacityUnits: json['MaximumOnDemandCapacityUnits'] as int?,
  );
}

Map<String, dynamic> _$ComputeLimitsToJson(ComputeLimits instance) {
  final val = <String, dynamic>{
    'MaximumCapacityUnits': instance.maximumCapacityUnits,
    'MinimumCapacityUnits': instance.minimumCapacityUnits,
    'UnitType': _$ComputeLimitsUnitTypeEnumMap[instance.unitType],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaximumCoreCapacityUnits', instance.maximumCoreCapacityUnits);
  writeNotNull(
      'MaximumOnDemandCapacityUnits', instance.maximumOnDemandCapacityUnits);
  return val;
}

const _$ComputeLimitsUnitTypeEnumMap = {
  ComputeLimitsUnitType.instanceFleetUnits: 'InstanceFleetUnits',
  ComputeLimitsUnitType.instances: 'Instances',
  ComputeLimitsUnitType.vcpu: 'VCPU',
};

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return Configuration(
    classification: json['Classification'] as String?,
    configurations: (json['Configurations'] as List<dynamic>?)
        ?.map((e) => Configuration.fromJson(e as Map<String, dynamic>))
        .toList(),
    properties: (json['Properties'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Classification', instance.classification);
  writeNotNull('Configurations',
      instance.configurations?.map((e) => e.toJson()).toList());
  writeNotNull('Properties', instance.properties);
  return val;
}

CreateSecurityConfigurationOutput _$CreateSecurityConfigurationOutputFromJson(
    Map<String, dynamic> json) {
  return CreateSecurityConfigurationOutput(
    creationDateTime: DateTime.parse(json['CreationDateTime'] as String),
    name: json['Name'] as String,
  );
}

CreateStudioOutput _$CreateStudioOutputFromJson(Map<String, dynamic> json) {
  return CreateStudioOutput(
    studioId: json['StudioId'] as String?,
    url: json['Url'] as String?,
  );
}

DeleteSecurityConfigurationOutput _$DeleteSecurityConfigurationOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteSecurityConfigurationOutput();
}

DescribeClusterOutput _$DescribeClusterOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeClusterOutput(
    cluster: json['Cluster'] == null
        ? null
        : Cluster.fromJson(json['Cluster'] as Map<String, dynamic>),
  );
}

DescribeJobFlowsOutput _$DescribeJobFlowsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeJobFlowsOutput(
    jobFlows: (json['JobFlows'] as List<dynamic>?)
        ?.map((e) => JobFlowDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DescribeNotebookExecutionOutput _$DescribeNotebookExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeNotebookExecutionOutput(
    notebookExecution: json['NotebookExecution'] == null
        ? null
        : NotebookExecution.fromJson(
            json['NotebookExecution'] as Map<String, dynamic>),
  );
}

DescribeSecurityConfigurationOutput
    _$DescribeSecurityConfigurationOutputFromJson(Map<String, dynamic> json) {
  return DescribeSecurityConfigurationOutput(
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    name: json['Name'] as String?,
    securityConfiguration: json['SecurityConfiguration'] as String?,
  );
}

DescribeStepOutput _$DescribeStepOutputFromJson(Map<String, dynamic> json) {
  return DescribeStepOutput(
    step: json['Step'] == null
        ? null
        : Step.fromJson(json['Step'] as Map<String, dynamic>),
  );
}

DescribeStudioOutput _$DescribeStudioOutputFromJson(Map<String, dynamic> json) {
  return DescribeStudioOutput(
    studio: json['Studio'] == null
        ? null
        : Studio.fromJson(json['Studio'] as Map<String, dynamic>),
  );
}

EbsBlockDevice _$EbsBlockDeviceFromJson(Map<String, dynamic> json) {
  return EbsBlockDevice(
    device: json['Device'] as String?,
    volumeSpecification: json['VolumeSpecification'] == null
        ? null
        : VolumeSpecification.fromJson(
            json['VolumeSpecification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EbsBlockDeviceConfigToJson(
    EbsBlockDeviceConfig instance) {
  final val = <String, dynamic>{
    'VolumeSpecification': instance.volumeSpecification.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumesPerInstance', instance.volumesPerInstance);
  return val;
}

Map<String, dynamic> _$EbsConfigurationToJson(EbsConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EbsBlockDeviceConfigs',
      instance.ebsBlockDeviceConfigs?.map((e) => e.toJson()).toList());
  writeNotNull('EbsOptimized', instance.ebsOptimized);
  return val;
}

EbsVolume _$EbsVolumeFromJson(Map<String, dynamic> json) {
  return EbsVolume(
    device: json['Device'] as String?,
    volumeId: json['VolumeId'] as String?,
  );
}

Ec2InstanceAttributes _$Ec2InstanceAttributesFromJson(
    Map<String, dynamic> json) {
  return Ec2InstanceAttributes(
    additionalMasterSecurityGroups:
        (json['AdditionalMasterSecurityGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    additionalSlaveSecurityGroups:
        (json['AdditionalSlaveSecurityGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    ec2AvailabilityZone: json['Ec2AvailabilityZone'] as String?,
    ec2KeyName: json['Ec2KeyName'] as String?,
    ec2SubnetId: json['Ec2SubnetId'] as String?,
    emrManagedMasterSecurityGroup:
        json['EmrManagedMasterSecurityGroup'] as String?,
    emrManagedSlaveSecurityGroup:
        json['EmrManagedSlaveSecurityGroup'] as String?,
    iamInstanceProfile: json['IamInstanceProfile'] as String?,
    requestedEc2AvailabilityZones:
        (json['RequestedEc2AvailabilityZones'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    requestedEc2SubnetIds: (json['RequestedEc2SubnetIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    serviceAccessSecurityGroup: json['ServiceAccessSecurityGroup'] as String?,
  );
}

ExecutionEngineConfig _$ExecutionEngineConfigFromJson(
    Map<String, dynamic> json) {
  return ExecutionEngineConfig(
    id: json['Id'] as String,
    masterInstanceSecurityGroupId:
        json['MasterInstanceSecurityGroupId'] as String?,
    type: _$enumDecodeNullable(_$ExecutionEngineTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$ExecutionEngineConfigToJson(
    ExecutionEngineConfig instance) {
  final val = <String, dynamic>{
    'Id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'MasterInstanceSecurityGroupId', instance.masterInstanceSecurityGroupId);
  writeNotNull('Type', _$ExecutionEngineTypeEnumMap[instance.type]);
  return val;
}

const _$ExecutionEngineTypeEnumMap = {
  ExecutionEngineType.emr: 'EMR',
};

FailureDetails _$FailureDetailsFromJson(Map<String, dynamic> json) {
  return FailureDetails(
    logFile: json['LogFile'] as String?,
    message: json['Message'] as String?,
    reason: json['Reason'] as String?,
  );
}

GetBlockPublicAccessConfigurationOutput
    _$GetBlockPublicAccessConfigurationOutputFromJson(
        Map<String, dynamic> json) {
  return GetBlockPublicAccessConfigurationOutput(
    blockPublicAccessConfiguration: BlockPublicAccessConfiguration.fromJson(
        json['BlockPublicAccessConfiguration'] as Map<String, dynamic>),
    blockPublicAccessConfigurationMetadata:
        BlockPublicAccessConfigurationMetadata.fromJson(
            json['BlockPublicAccessConfigurationMetadata']
                as Map<String, dynamic>),
  );
}

GetManagedScalingPolicyOutput _$GetManagedScalingPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetManagedScalingPolicyOutput(
    managedScalingPolicy: json['ManagedScalingPolicy'] == null
        ? null
        : ManagedScalingPolicy.fromJson(
            json['ManagedScalingPolicy'] as Map<String, dynamic>),
  );
}

GetStudioSessionMappingOutput _$GetStudioSessionMappingOutputFromJson(
    Map<String, dynamic> json) {
  return GetStudioSessionMappingOutput(
    sessionMapping: json['SessionMapping'] == null
        ? null
        : SessionMappingDetail.fromJson(
            json['SessionMapping'] as Map<String, dynamic>),
  );
}

HadoopJarStepConfig _$HadoopJarStepConfigFromJson(Map<String, dynamic> json) {
  return HadoopJarStepConfig(
    jar: json['Jar'] as String,
    args: (json['Args'] as List<dynamic>?)?.map((e) => e as String).toList(),
    mainClass: json['MainClass'] as String?,
    properties: (json['Properties'] as List<dynamic>?)
        ?.map((e) => KeyValue.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HadoopJarStepConfigToJson(HadoopJarStepConfig instance) {
  final val = <String, dynamic>{
    'Jar': instance.jar,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Args', instance.args);
  writeNotNull('MainClass', instance.mainClass);
  writeNotNull(
      'Properties', instance.properties?.map((e) => e.toJson()).toList());
  return val;
}

HadoopStepConfig _$HadoopStepConfigFromJson(Map<String, dynamic> json) {
  return HadoopStepConfig(
    args: (json['Args'] as List<dynamic>?)?.map((e) => e as String).toList(),
    jar: json['Jar'] as String?,
    mainClass: json['MainClass'] as String?,
    properties: (json['Properties'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Instance _$InstanceFromJson(Map<String, dynamic> json) {
  return Instance(
    ebsVolumes: (json['EbsVolumes'] as List<dynamic>?)
        ?.map((e) => EbsVolume.fromJson(e as Map<String, dynamic>))
        .toList(),
    ec2InstanceId: json['Ec2InstanceId'] as String?,
    id: json['Id'] as String?,
    instanceFleetId: json['InstanceFleetId'] as String?,
    instanceGroupId: json['InstanceGroupId'] as String?,
    instanceType: json['InstanceType'] as String?,
    market: _$enumDecodeNullable(_$MarketTypeEnumMap, json['Market']),
    privateDnsName: json['PrivateDnsName'] as String?,
    privateIpAddress: json['PrivateIpAddress'] as String?,
    publicDnsName: json['PublicDnsName'] as String?,
    publicIpAddress: json['PublicIpAddress'] as String?,
    status: json['Status'] == null
        ? null
        : InstanceStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

const _$MarketTypeEnumMap = {
  MarketType.onDemand: 'ON_DEMAND',
  MarketType.spot: 'SPOT',
};

InstanceFleet _$InstanceFleetFromJson(Map<String, dynamic> json) {
  return InstanceFleet(
    id: json['Id'] as String?,
    instanceFleetType: _$enumDecodeNullable(
        _$InstanceFleetTypeEnumMap, json['InstanceFleetType']),
    instanceTypeSpecifications:
        (json['InstanceTypeSpecifications'] as List<dynamic>?)
            ?.map((e) =>
                InstanceTypeSpecification.fromJson(e as Map<String, dynamic>))
            .toList(),
    launchSpecifications: json['LaunchSpecifications'] == null
        ? null
        : InstanceFleetProvisioningSpecifications.fromJson(
            json['LaunchSpecifications'] as Map<String, dynamic>),
    name: json['Name'] as String?,
    provisionedOnDemandCapacity: json['ProvisionedOnDemandCapacity'] as int?,
    provisionedSpotCapacity: json['ProvisionedSpotCapacity'] as int?,
    status: json['Status'] == null
        ? null
        : InstanceFleetStatus.fromJson(json['Status'] as Map<String, dynamic>),
    targetOnDemandCapacity: json['TargetOnDemandCapacity'] as int?,
    targetSpotCapacity: json['TargetSpotCapacity'] as int?,
  );
}

const _$InstanceFleetTypeEnumMap = {
  InstanceFleetType.master: 'MASTER',
  InstanceFleetType.core: 'CORE',
  InstanceFleetType.task: 'TASK',
};

Map<String, dynamic> _$InstanceFleetConfigToJson(InstanceFleetConfig instance) {
  final val = <String, dynamic>{
    'InstanceFleetType': _$InstanceFleetTypeEnumMap[instance.instanceFleetType],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceTypeConfigs',
      instance.instanceTypeConfigs?.map((e) => e.toJson()).toList());
  writeNotNull('LaunchSpecifications', instance.launchSpecifications?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('TargetOnDemandCapacity', instance.targetOnDemandCapacity);
  writeNotNull('TargetSpotCapacity', instance.targetSpotCapacity);
  return val;
}

Map<String, dynamic> _$InstanceFleetModifyConfigToJson(
    InstanceFleetModifyConfig instance) {
  final val = <String, dynamic>{
    'InstanceFleetId': instance.instanceFleetId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetOnDemandCapacity', instance.targetOnDemandCapacity);
  writeNotNull('TargetSpotCapacity', instance.targetSpotCapacity);
  return val;
}

InstanceFleetProvisioningSpecifications
    _$InstanceFleetProvisioningSpecificationsFromJson(
        Map<String, dynamic> json) {
  return InstanceFleetProvisioningSpecifications(
    onDemandSpecification: json['OnDemandSpecification'] == null
        ? null
        : OnDemandProvisioningSpecification.fromJson(
            json['OnDemandSpecification'] as Map<String, dynamic>),
    spotSpecification: json['SpotSpecification'] == null
        ? null
        : SpotProvisioningSpecification.fromJson(
            json['SpotSpecification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InstanceFleetProvisioningSpecificationsToJson(
    InstanceFleetProvisioningSpecifications instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'OnDemandSpecification', instance.onDemandSpecification?.toJson());
  writeNotNull('SpotSpecification', instance.spotSpecification?.toJson());
  return val;
}

InstanceFleetStateChangeReason _$InstanceFleetStateChangeReasonFromJson(
    Map<String, dynamic> json) {
  return InstanceFleetStateChangeReason(
    code: _$enumDecodeNullable(
        _$InstanceFleetStateChangeReasonCodeEnumMap, json['Code']),
    message: json['Message'] as String?,
  );
}

const _$InstanceFleetStateChangeReasonCodeEnumMap = {
  InstanceFleetStateChangeReasonCode.internalError: 'INTERNAL_ERROR',
  InstanceFleetStateChangeReasonCode.validationError: 'VALIDATION_ERROR',
  InstanceFleetStateChangeReasonCode.instanceFailure: 'INSTANCE_FAILURE',
  InstanceFleetStateChangeReasonCode.clusterTerminated: 'CLUSTER_TERMINATED',
};

InstanceFleetStatus _$InstanceFleetStatusFromJson(Map<String, dynamic> json) {
  return InstanceFleetStatus(
    state: _$enumDecodeNullable(_$InstanceFleetStateEnumMap, json['State']),
    stateChangeReason: json['StateChangeReason'] == null
        ? null
        : InstanceFleetStateChangeReason.fromJson(
            json['StateChangeReason'] as Map<String, dynamic>),
    timeline: json['Timeline'] == null
        ? null
        : InstanceFleetTimeline.fromJson(
            json['Timeline'] as Map<String, dynamic>),
  );
}

const _$InstanceFleetStateEnumMap = {
  InstanceFleetState.provisioning: 'PROVISIONING',
  InstanceFleetState.bootstrapping: 'BOOTSTRAPPING',
  InstanceFleetState.running: 'RUNNING',
  InstanceFleetState.resizing: 'RESIZING',
  InstanceFleetState.suspended: 'SUSPENDED',
  InstanceFleetState.terminating: 'TERMINATING',
  InstanceFleetState.terminated: 'TERMINATED',
};

InstanceFleetTimeline _$InstanceFleetTimelineFromJson(
    Map<String, dynamic> json) {
  return InstanceFleetTimeline(
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    endDateTime: const UnixDateTimeConverter().fromJson(json['EndDateTime']),
    readyDateTime:
        const UnixDateTimeConverter().fromJson(json['ReadyDateTime']),
  );
}

InstanceGroup _$InstanceGroupFromJson(Map<String, dynamic> json) {
  return InstanceGroup(
    autoScalingPolicy: json['AutoScalingPolicy'] == null
        ? null
        : AutoScalingPolicyDescription.fromJson(
            json['AutoScalingPolicy'] as Map<String, dynamic>),
    bidPrice: json['BidPrice'] as String?,
    configurations: (json['Configurations'] as List<dynamic>?)
        ?.map((e) => Configuration.fromJson(e as Map<String, dynamic>))
        .toList(),
    configurationsVersion: json['ConfigurationsVersion'] as int?,
    ebsBlockDevices: (json['EbsBlockDevices'] as List<dynamic>?)
        ?.map((e) => EbsBlockDevice.fromJson(e as Map<String, dynamic>))
        .toList(),
    ebsOptimized: json['EbsOptimized'] as bool?,
    id: json['Id'] as String?,
    instanceGroupType: _$enumDecodeNullable(
        _$InstanceGroupTypeEnumMap, json['InstanceGroupType']),
    instanceType: json['InstanceType'] as String?,
    lastSuccessfullyAppliedConfigurations:
        (json['LastSuccessfullyAppliedConfigurations'] as List<dynamic>?)
            ?.map((e) => Configuration.fromJson(e as Map<String, dynamic>))
            .toList(),
    lastSuccessfullyAppliedConfigurationsVersion:
        json['LastSuccessfullyAppliedConfigurationsVersion'] as int?,
    market: _$enumDecodeNullable(_$MarketTypeEnumMap, json['Market']),
    name: json['Name'] as String?,
    requestedInstanceCount: json['RequestedInstanceCount'] as int?,
    runningInstanceCount: json['RunningInstanceCount'] as int?,
    shrinkPolicy: json['ShrinkPolicy'] == null
        ? null
        : ShrinkPolicy.fromJson(json['ShrinkPolicy'] as Map<String, dynamic>),
    status: json['Status'] == null
        ? null
        : InstanceGroupStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

const _$InstanceGroupTypeEnumMap = {
  InstanceGroupType.master: 'MASTER',
  InstanceGroupType.core: 'CORE',
  InstanceGroupType.task: 'TASK',
};

Map<String, dynamic> _$InstanceGroupConfigToJson(InstanceGroupConfig instance) {
  final val = <String, dynamic>{
    'InstanceCount': instance.instanceCount,
    'InstanceRole': _$InstanceRoleTypeEnumMap[instance.instanceRole],
    'InstanceType': instance.instanceType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AutoScalingPolicy', instance.autoScalingPolicy?.toJson());
  writeNotNull('BidPrice', instance.bidPrice);
  writeNotNull('Configurations',
      instance.configurations?.map((e) => e.toJson()).toList());
  writeNotNull('EbsConfiguration', instance.ebsConfiguration?.toJson());
  writeNotNull('Market', _$MarketTypeEnumMap[instance.market]);
  writeNotNull('Name', instance.name);
  return val;
}

const _$InstanceRoleTypeEnumMap = {
  InstanceRoleType.master: 'MASTER',
  InstanceRoleType.core: 'CORE',
  InstanceRoleType.task: 'TASK',
};

InstanceGroupDetail _$InstanceGroupDetailFromJson(Map<String, dynamic> json) {
  return InstanceGroupDetail(
    creationDateTime: DateTime.parse(json['CreationDateTime'] as String),
    instanceRequestCount: json['InstanceRequestCount'] as int,
    instanceRole: _$enumDecode(_$InstanceRoleTypeEnumMap, json['InstanceRole']),
    instanceRunningCount: json['InstanceRunningCount'] as int,
    instanceType: json['InstanceType'] as String,
    market: _$enumDecode(_$MarketTypeEnumMap, json['Market']),
    state: _$enumDecode(_$InstanceGroupStateEnumMap, json['State']),
    bidPrice: json['BidPrice'] as String?,
    endDateTime: const UnixDateTimeConverter().fromJson(json['EndDateTime']),
    instanceGroupId: json['InstanceGroupId'] as String?,
    lastStateChangeReason: json['LastStateChangeReason'] as String?,
    name: json['Name'] as String?,
    readyDateTime:
        const UnixDateTimeConverter().fromJson(json['ReadyDateTime']),
    startDateTime:
        const UnixDateTimeConverter().fromJson(json['StartDateTime']),
  );
}

const _$InstanceGroupStateEnumMap = {
  InstanceGroupState.provisioning: 'PROVISIONING',
  InstanceGroupState.bootstrapping: 'BOOTSTRAPPING',
  InstanceGroupState.running: 'RUNNING',
  InstanceGroupState.reconfiguring: 'RECONFIGURING',
  InstanceGroupState.resizing: 'RESIZING',
  InstanceGroupState.suspended: 'SUSPENDED',
  InstanceGroupState.terminating: 'TERMINATING',
  InstanceGroupState.terminated: 'TERMINATED',
  InstanceGroupState.arrested: 'ARRESTED',
  InstanceGroupState.shuttingDown: 'SHUTTING_DOWN',
  InstanceGroupState.ended: 'ENDED',
};

Map<String, dynamic> _$InstanceGroupModifyConfigToJson(
    InstanceGroupModifyConfig instance) {
  final val = <String, dynamic>{
    'InstanceGroupId': instance.instanceGroupId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Configurations',
      instance.configurations?.map((e) => e.toJson()).toList());
  writeNotNull('EC2InstanceIdsToTerminate', instance.eC2InstanceIdsToTerminate);
  writeNotNull('InstanceCount', instance.instanceCount);
  writeNotNull('ShrinkPolicy', instance.shrinkPolicy?.toJson());
  return val;
}

InstanceGroupStateChangeReason _$InstanceGroupStateChangeReasonFromJson(
    Map<String, dynamic> json) {
  return InstanceGroupStateChangeReason(
    code: _$enumDecodeNullable(
        _$InstanceGroupStateChangeReasonCodeEnumMap, json['Code']),
    message: json['Message'] as String?,
  );
}

const _$InstanceGroupStateChangeReasonCodeEnumMap = {
  InstanceGroupStateChangeReasonCode.internalError: 'INTERNAL_ERROR',
  InstanceGroupStateChangeReasonCode.validationError: 'VALIDATION_ERROR',
  InstanceGroupStateChangeReasonCode.instanceFailure: 'INSTANCE_FAILURE',
  InstanceGroupStateChangeReasonCode.clusterTerminated: 'CLUSTER_TERMINATED',
};

InstanceGroupStatus _$InstanceGroupStatusFromJson(Map<String, dynamic> json) {
  return InstanceGroupStatus(
    state: _$enumDecodeNullable(_$InstanceGroupStateEnumMap, json['State']),
    stateChangeReason: json['StateChangeReason'] == null
        ? null
        : InstanceGroupStateChangeReason.fromJson(
            json['StateChangeReason'] as Map<String, dynamic>),
    timeline: json['Timeline'] == null
        ? null
        : InstanceGroupTimeline.fromJson(
            json['Timeline'] as Map<String, dynamic>),
  );
}

InstanceGroupTimeline _$InstanceGroupTimelineFromJson(
    Map<String, dynamic> json) {
  return InstanceGroupTimeline(
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    endDateTime: const UnixDateTimeConverter().fromJson(json['EndDateTime']),
    readyDateTime:
        const UnixDateTimeConverter().fromJson(json['ReadyDateTime']),
  );
}

InstanceResizePolicy _$InstanceResizePolicyFromJson(Map<String, dynamic> json) {
  return InstanceResizePolicy(
    instanceTerminationTimeout: json['InstanceTerminationTimeout'] as int?,
    instancesToProtect: (json['InstancesToProtect'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    instancesToTerminate: (json['InstancesToTerminate'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$InstanceResizePolicyToJson(
    InstanceResizePolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'InstanceTerminationTimeout', instance.instanceTerminationTimeout);
  writeNotNull('InstancesToProtect', instance.instancesToProtect);
  writeNotNull('InstancesToTerminate', instance.instancesToTerminate);
  return val;
}

InstanceStateChangeReason _$InstanceStateChangeReasonFromJson(
    Map<String, dynamic> json) {
  return InstanceStateChangeReason(
    code: _$enumDecodeNullable(
        _$InstanceStateChangeReasonCodeEnumMap, json['Code']),
    message: json['Message'] as String?,
  );
}

const _$InstanceStateChangeReasonCodeEnumMap = {
  InstanceStateChangeReasonCode.internalError: 'INTERNAL_ERROR',
  InstanceStateChangeReasonCode.validationError: 'VALIDATION_ERROR',
  InstanceStateChangeReasonCode.instanceFailure: 'INSTANCE_FAILURE',
  InstanceStateChangeReasonCode.bootstrapFailure: 'BOOTSTRAP_FAILURE',
  InstanceStateChangeReasonCode.clusterTerminated: 'CLUSTER_TERMINATED',
};

InstanceStatus _$InstanceStatusFromJson(Map<String, dynamic> json) {
  return InstanceStatus(
    state: _$enumDecodeNullable(_$InstanceStateEnumMap, json['State']),
    stateChangeReason: json['StateChangeReason'] == null
        ? null
        : InstanceStateChangeReason.fromJson(
            json['StateChangeReason'] as Map<String, dynamic>),
    timeline: json['Timeline'] == null
        ? null
        : InstanceTimeline.fromJson(json['Timeline'] as Map<String, dynamic>),
  );
}

const _$InstanceStateEnumMap = {
  InstanceState.awaitingFulfillment: 'AWAITING_FULFILLMENT',
  InstanceState.provisioning: 'PROVISIONING',
  InstanceState.bootstrapping: 'BOOTSTRAPPING',
  InstanceState.running: 'RUNNING',
  InstanceState.terminated: 'TERMINATED',
};

InstanceTimeline _$InstanceTimelineFromJson(Map<String, dynamic> json) {
  return InstanceTimeline(
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    endDateTime: const UnixDateTimeConverter().fromJson(json['EndDateTime']),
    readyDateTime:
        const UnixDateTimeConverter().fromJson(json['ReadyDateTime']),
  );
}

Map<String, dynamic> _$InstanceTypeConfigToJson(InstanceTypeConfig instance) {
  final val = <String, dynamic>{
    'InstanceType': instance.instanceType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BidPrice', instance.bidPrice);
  writeNotNull('BidPriceAsPercentageOfOnDemandPrice',
      instance.bidPriceAsPercentageOfOnDemandPrice);
  writeNotNull('Configurations',
      instance.configurations?.map((e) => e.toJson()).toList());
  writeNotNull('EbsConfiguration', instance.ebsConfiguration?.toJson());
  writeNotNull('WeightedCapacity', instance.weightedCapacity);
  return val;
}

InstanceTypeSpecification _$InstanceTypeSpecificationFromJson(
    Map<String, dynamic> json) {
  return InstanceTypeSpecification(
    bidPrice: json['BidPrice'] as String?,
    bidPriceAsPercentageOfOnDemandPrice:
        (json['BidPriceAsPercentageOfOnDemandPrice'] as num?)?.toDouble(),
    configurations: (json['Configurations'] as List<dynamic>?)
        ?.map((e) => Configuration.fromJson(e as Map<String, dynamic>))
        .toList(),
    ebsBlockDevices: (json['EbsBlockDevices'] as List<dynamic>?)
        ?.map((e) => EbsBlockDevice.fromJson(e as Map<String, dynamic>))
        .toList(),
    ebsOptimized: json['EbsOptimized'] as bool?,
    instanceType: json['InstanceType'] as String?,
    weightedCapacity: json['WeightedCapacity'] as int?,
  );
}

JobFlowDetail _$JobFlowDetailFromJson(Map<String, dynamic> json) {
  return JobFlowDetail(
    executionStatusDetail: JobFlowExecutionStatusDetail.fromJson(
        json['ExecutionStatusDetail'] as Map<String, dynamic>),
    instances: JobFlowInstancesDetail.fromJson(
        json['Instances'] as Map<String, dynamic>),
    jobFlowId: json['JobFlowId'] as String,
    name: json['Name'] as String,
    amiVersion: json['AmiVersion'] as String?,
    autoScalingRole: json['AutoScalingRole'] as String?,
    bootstrapActions: (json['BootstrapActions'] as List<dynamic>?)
        ?.map((e) => BootstrapActionDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    jobFlowRole: json['JobFlowRole'] as String?,
    logEncryptionKmsKeyId: json['LogEncryptionKmsKeyId'] as String?,
    logUri: json['LogUri'] as String?,
    scaleDownBehavior: _$enumDecodeNullable(
        _$ScaleDownBehaviorEnumMap, json['ScaleDownBehavior']),
    serviceRole: json['ServiceRole'] as String?,
    steps: (json['Steps'] as List<dynamic>?)
        ?.map((e) => StepDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    supportedProducts: (json['SupportedProducts'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    visibleToAllUsers: json['VisibleToAllUsers'] as bool?,
  );
}

JobFlowExecutionStatusDetail _$JobFlowExecutionStatusDetailFromJson(
    Map<String, dynamic> json) {
  return JobFlowExecutionStatusDetail(
    creationDateTime: DateTime.parse(json['CreationDateTime'] as String),
    state: _$enumDecode(_$JobFlowExecutionStateEnumMap, json['State']),
    endDateTime: const UnixDateTimeConverter().fromJson(json['EndDateTime']),
    lastStateChangeReason: json['LastStateChangeReason'] as String?,
    readyDateTime:
        const UnixDateTimeConverter().fromJson(json['ReadyDateTime']),
    startDateTime:
        const UnixDateTimeConverter().fromJson(json['StartDateTime']),
  );
}

const _$JobFlowExecutionStateEnumMap = {
  JobFlowExecutionState.starting: 'STARTING',
  JobFlowExecutionState.bootstrapping: 'BOOTSTRAPPING',
  JobFlowExecutionState.running: 'RUNNING',
  JobFlowExecutionState.waiting: 'WAITING',
  JobFlowExecutionState.shuttingDown: 'SHUTTING_DOWN',
  JobFlowExecutionState.terminated: 'TERMINATED',
  JobFlowExecutionState.completed: 'COMPLETED',
  JobFlowExecutionState.failed: 'FAILED',
};

Map<String, dynamic> _$JobFlowInstancesConfigToJson(
    JobFlowInstancesConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdditionalMasterSecurityGroups',
      instance.additionalMasterSecurityGroups);
  writeNotNull(
      'AdditionalSlaveSecurityGroups', instance.additionalSlaveSecurityGroups);
  writeNotNull('Ec2KeyName', instance.ec2KeyName);
  writeNotNull('Ec2SubnetId', instance.ec2SubnetId);
  writeNotNull('Ec2SubnetIds', instance.ec2SubnetIds);
  writeNotNull(
      'EmrManagedMasterSecurityGroup', instance.emrManagedMasterSecurityGroup);
  writeNotNull(
      'EmrManagedSlaveSecurityGroup', instance.emrManagedSlaveSecurityGroup);
  writeNotNull('HadoopVersion', instance.hadoopVersion);
  writeNotNull('InstanceCount', instance.instanceCount);
  writeNotNull('InstanceFleets',
      instance.instanceFleets?.map((e) => e.toJson()).toList());
  writeNotNull('InstanceGroups',
      instance.instanceGroups?.map((e) => e.toJson()).toList());
  writeNotNull(
      'KeepJobFlowAliveWhenNoSteps', instance.keepJobFlowAliveWhenNoSteps);
  writeNotNull('MasterInstanceType', instance.masterInstanceType);
  writeNotNull('Placement', instance.placement?.toJson());
  writeNotNull(
      'ServiceAccessSecurityGroup', instance.serviceAccessSecurityGroup);
  writeNotNull('SlaveInstanceType', instance.slaveInstanceType);
  writeNotNull('TerminationProtected', instance.terminationProtected);
  return val;
}

JobFlowInstancesDetail _$JobFlowInstancesDetailFromJson(
    Map<String, dynamic> json) {
  return JobFlowInstancesDetail(
    instanceCount: json['InstanceCount'] as int,
    masterInstanceType: json['MasterInstanceType'] as String,
    slaveInstanceType: json['SlaveInstanceType'] as String,
    ec2KeyName: json['Ec2KeyName'] as String?,
    ec2SubnetId: json['Ec2SubnetId'] as String?,
    hadoopVersion: json['HadoopVersion'] as String?,
    instanceGroups: (json['InstanceGroups'] as List<dynamic>?)
        ?.map((e) => InstanceGroupDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    keepJobFlowAliveWhenNoSteps: json['KeepJobFlowAliveWhenNoSteps'] as bool?,
    masterInstanceId: json['MasterInstanceId'] as String?,
    masterPublicDnsName: json['MasterPublicDnsName'] as String?,
    normalizedInstanceHours: json['NormalizedInstanceHours'] as int?,
    placement: json['Placement'] == null
        ? null
        : PlacementType.fromJson(json['Placement'] as Map<String, dynamic>),
    terminationProtected: json['TerminationProtected'] as bool?,
  );
}

KerberosAttributes _$KerberosAttributesFromJson(Map<String, dynamic> json) {
  return KerberosAttributes(
    kdcAdminPassword: json['KdcAdminPassword'] as String,
    realm: json['Realm'] as String,
    aDDomainJoinPassword: json['ADDomainJoinPassword'] as String?,
    aDDomainJoinUser: json['ADDomainJoinUser'] as String?,
    crossRealmTrustPrincipalPassword:
        json['CrossRealmTrustPrincipalPassword'] as String?,
  );
}

Map<String, dynamic> _$KerberosAttributesToJson(KerberosAttributes instance) {
  final val = <String, dynamic>{
    'KdcAdminPassword': instance.kdcAdminPassword,
    'Realm': instance.realm,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ADDomainJoinPassword', instance.aDDomainJoinPassword);
  writeNotNull('ADDomainJoinUser', instance.aDDomainJoinUser);
  writeNotNull('CrossRealmTrustPrincipalPassword',
      instance.crossRealmTrustPrincipalPassword);
  return val;
}

KeyValue _$KeyValueFromJson(Map<String, dynamic> json) {
  return KeyValue(
    key: json['Key'] as String?,
    value: json['Value'] as String?,
  );
}

Map<String, dynamic> _$KeyValueToJson(KeyValue instance) {
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

ListBootstrapActionsOutput _$ListBootstrapActionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListBootstrapActionsOutput(
    bootstrapActions: (json['BootstrapActions'] as List<dynamic>?)
        ?.map((e) => Command.fromJson(e as Map<String, dynamic>))
        .toList(),
    marker: json['Marker'] as String?,
  );
}

ListClustersOutput _$ListClustersOutputFromJson(Map<String, dynamic> json) {
  return ListClustersOutput(
    clusters: (json['Clusters'] as List<dynamic>?)
        ?.map((e) => ClusterSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    marker: json['Marker'] as String?,
  );
}

ListInstanceFleetsOutput _$ListInstanceFleetsOutputFromJson(
    Map<String, dynamic> json) {
  return ListInstanceFleetsOutput(
    instanceFleets: (json['InstanceFleets'] as List<dynamic>?)
        ?.map((e) => InstanceFleet.fromJson(e as Map<String, dynamic>))
        .toList(),
    marker: json['Marker'] as String?,
  );
}

ListInstanceGroupsOutput _$ListInstanceGroupsOutputFromJson(
    Map<String, dynamic> json) {
  return ListInstanceGroupsOutput(
    instanceGroups: (json['InstanceGroups'] as List<dynamic>?)
        ?.map((e) => InstanceGroup.fromJson(e as Map<String, dynamic>))
        .toList(),
    marker: json['Marker'] as String?,
  );
}

ListInstancesOutput _$ListInstancesOutputFromJson(Map<String, dynamic> json) {
  return ListInstancesOutput(
    instances: (json['Instances'] as List<dynamic>?)
        ?.map((e) => Instance.fromJson(e as Map<String, dynamic>))
        .toList(),
    marker: json['Marker'] as String?,
  );
}

ListNotebookExecutionsOutput _$ListNotebookExecutionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListNotebookExecutionsOutput(
    marker: json['Marker'] as String?,
    notebookExecutions: (json['NotebookExecutions'] as List<dynamic>?)
        ?.map(
            (e) => NotebookExecutionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListSecurityConfigurationsOutput _$ListSecurityConfigurationsOutputFromJson(
    Map<String, dynamic> json) {
  return ListSecurityConfigurationsOutput(
    marker: json['Marker'] as String?,
    securityConfigurations: (json['SecurityConfigurations'] as List<dynamic>?)
        ?.map((e) =>
            SecurityConfigurationSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListStepsOutput _$ListStepsOutputFromJson(Map<String, dynamic> json) {
  return ListStepsOutput(
    marker: json['Marker'] as String?,
    steps: (json['Steps'] as List<dynamic>?)
        ?.map((e) => StepSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListStudioSessionMappingsOutput _$ListStudioSessionMappingsOutputFromJson(
    Map<String, dynamic> json) {
  return ListStudioSessionMappingsOutput(
    marker: json['Marker'] as String?,
    sessionMappings: (json['SessionMappings'] as List<dynamic>?)
        ?.map((e) => SessionMappingSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListStudiosOutput _$ListStudiosOutputFromJson(Map<String, dynamic> json) {
  return ListStudiosOutput(
    marker: json['Marker'] as String?,
    studios: (json['Studios'] as List<dynamic>?)
        ?.map((e) => StudioSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ManagedScalingPolicy _$ManagedScalingPolicyFromJson(Map<String, dynamic> json) {
  return ManagedScalingPolicy(
    computeLimits: json['ComputeLimits'] == null
        ? null
        : ComputeLimits.fromJson(json['ComputeLimits'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ManagedScalingPolicyToJson(
    ManagedScalingPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComputeLimits', instance.computeLimits?.toJson());
  return val;
}

MetricDimension _$MetricDimensionFromJson(Map<String, dynamic> json) {
  return MetricDimension(
    key: json['Key'] as String?,
    value: json['Value'] as String?,
  );
}

Map<String, dynamic> _$MetricDimensionToJson(MetricDimension instance) {
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

ModifyClusterOutput _$ModifyClusterOutputFromJson(Map<String, dynamic> json) {
  return ModifyClusterOutput(
    stepConcurrencyLevel: json['StepConcurrencyLevel'] as int?,
  );
}

NotebookExecution _$NotebookExecutionFromJson(Map<String, dynamic> json) {
  return NotebookExecution(
    arn: json['Arn'] as String?,
    editorId: json['EditorId'] as String?,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    executionEngine: json['ExecutionEngine'] == null
        ? null
        : ExecutionEngineConfig.fromJson(
            json['ExecutionEngine'] as Map<String, dynamic>),
    lastStateChangeReason: json['LastStateChangeReason'] as String?,
    notebookExecutionId: json['NotebookExecutionId'] as String?,
    notebookExecutionName: json['NotebookExecutionName'] as String?,
    notebookInstanceSecurityGroupId:
        json['NotebookInstanceSecurityGroupId'] as String?,
    notebookParams: json['NotebookParams'] as String?,
    outputNotebookURI: json['OutputNotebookURI'] as String?,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status:
        _$enumDecodeNullable(_$NotebookExecutionStatusEnumMap, json['Status']),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

const _$NotebookExecutionStatusEnumMap = {
  NotebookExecutionStatus.startPending: 'START_PENDING',
  NotebookExecutionStatus.starting: 'STARTING',
  NotebookExecutionStatus.running: 'RUNNING',
  NotebookExecutionStatus.finishing: 'FINISHING',
  NotebookExecutionStatus.finished: 'FINISHED',
  NotebookExecutionStatus.failing: 'FAILING',
  NotebookExecutionStatus.failed: 'FAILED',
  NotebookExecutionStatus.stopPending: 'STOP_PENDING',
  NotebookExecutionStatus.stopping: 'STOPPING',
  NotebookExecutionStatus.stopped: 'STOPPED',
};

NotebookExecutionSummary _$NotebookExecutionSummaryFromJson(
    Map<String, dynamic> json) {
  return NotebookExecutionSummary(
    editorId: json['EditorId'] as String?,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    notebookExecutionId: json['NotebookExecutionId'] as String?,
    notebookExecutionName: json['NotebookExecutionName'] as String?,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status:
        _$enumDecodeNullable(_$NotebookExecutionStatusEnumMap, json['Status']),
  );
}

OnDemandProvisioningSpecification _$OnDemandProvisioningSpecificationFromJson(
    Map<String, dynamic> json) {
  return OnDemandProvisioningSpecification(
    allocationStrategy: _$enumDecode(
        _$OnDemandProvisioningAllocationStrategyEnumMap,
        json['AllocationStrategy']),
  );
}

Map<String, dynamic> _$OnDemandProvisioningSpecificationToJson(
        OnDemandProvisioningSpecification instance) =>
    <String, dynamic>{
      'AllocationStrategy': _$OnDemandProvisioningAllocationStrategyEnumMap[
          instance.allocationStrategy],
    };

const _$OnDemandProvisioningAllocationStrategyEnumMap = {
  OnDemandProvisioningAllocationStrategy.lowestPrice: 'lowest-price',
};

PlacementGroupConfig _$PlacementGroupConfigFromJson(Map<String, dynamic> json) {
  return PlacementGroupConfig(
    instanceRole: _$enumDecode(_$InstanceRoleTypeEnumMap, json['InstanceRole']),
    placementStrategy: _$enumDecodeNullable(
        _$PlacementGroupStrategyEnumMap, json['PlacementStrategy']),
  );
}

Map<String, dynamic> _$PlacementGroupConfigToJson(
    PlacementGroupConfig instance) {
  final val = <String, dynamic>{
    'InstanceRole': _$InstanceRoleTypeEnumMap[instance.instanceRole],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PlacementStrategy',
      _$PlacementGroupStrategyEnumMap[instance.placementStrategy]);
  return val;
}

const _$PlacementGroupStrategyEnumMap = {
  PlacementGroupStrategy.spread: 'SPREAD',
  PlacementGroupStrategy.partition: 'PARTITION',
  PlacementGroupStrategy.cluster: 'CLUSTER',
  PlacementGroupStrategy.none: 'NONE',
};

PlacementType _$PlacementTypeFromJson(Map<String, dynamic> json) {
  return PlacementType(
    availabilityZone: json['AvailabilityZone'] as String?,
    availabilityZones: (json['AvailabilityZones'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$PlacementTypeToJson(PlacementType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityZone', instance.availabilityZone);
  writeNotNull('AvailabilityZones', instance.availabilityZones);
  return val;
}

PortRange _$PortRangeFromJson(Map<String, dynamic> json) {
  return PortRange(
    minRange: json['MinRange'] as int,
    maxRange: json['MaxRange'] as int?,
  );
}

Map<String, dynamic> _$PortRangeToJson(PortRange instance) {
  final val = <String, dynamic>{
    'MinRange': instance.minRange,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxRange', instance.maxRange);
  return val;
}

PutAutoScalingPolicyOutput _$PutAutoScalingPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutAutoScalingPolicyOutput(
    autoScalingPolicy: json['AutoScalingPolicy'] == null
        ? null
        : AutoScalingPolicyDescription.fromJson(
            json['AutoScalingPolicy'] as Map<String, dynamic>),
    clusterArn: json['ClusterArn'] as String?,
    clusterId: json['ClusterId'] as String?,
    instanceGroupId: json['InstanceGroupId'] as String?,
  );
}

PutBlockPublicAccessConfigurationOutput
    _$PutBlockPublicAccessConfigurationOutputFromJson(
        Map<String, dynamic> json) {
  return PutBlockPublicAccessConfigurationOutput();
}

PutManagedScalingPolicyOutput _$PutManagedScalingPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutManagedScalingPolicyOutput();
}

RemoveAutoScalingPolicyOutput _$RemoveAutoScalingPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return RemoveAutoScalingPolicyOutput();
}

RemoveManagedScalingPolicyOutput _$RemoveManagedScalingPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return RemoveManagedScalingPolicyOutput();
}

RemoveTagsOutput _$RemoveTagsOutputFromJson(Map<String, dynamic> json) {
  return RemoveTagsOutput();
}

RunJobFlowOutput _$RunJobFlowOutputFromJson(Map<String, dynamic> json) {
  return RunJobFlowOutput(
    clusterArn: json['ClusterArn'] as String?,
    jobFlowId: json['JobFlowId'] as String?,
  );
}

ScalingAction _$ScalingActionFromJson(Map<String, dynamic> json) {
  return ScalingAction(
    simpleScalingPolicyConfiguration: SimpleScalingPolicyConfiguration.fromJson(
        json['SimpleScalingPolicyConfiguration'] as Map<String, dynamic>),
    market: _$enumDecodeNullable(_$MarketTypeEnumMap, json['Market']),
  );
}

Map<String, dynamic> _$ScalingActionToJson(ScalingAction instance) {
  final val = <String, dynamic>{
    'SimpleScalingPolicyConfiguration':
        instance.simpleScalingPolicyConfiguration.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Market', _$MarketTypeEnumMap[instance.market]);
  return val;
}

ScalingConstraints _$ScalingConstraintsFromJson(Map<String, dynamic> json) {
  return ScalingConstraints(
    maxCapacity: json['MaxCapacity'] as int,
    minCapacity: json['MinCapacity'] as int,
  );
}

Map<String, dynamic> _$ScalingConstraintsToJson(ScalingConstraints instance) =>
    <String, dynamic>{
      'MaxCapacity': instance.maxCapacity,
      'MinCapacity': instance.minCapacity,
    };

ScalingRule _$ScalingRuleFromJson(Map<String, dynamic> json) {
  return ScalingRule(
    action: ScalingAction.fromJson(json['Action'] as Map<String, dynamic>),
    name: json['Name'] as String,
    trigger: ScalingTrigger.fromJson(json['Trigger'] as Map<String, dynamic>),
    description: json['Description'] as String?,
  );
}

Map<String, dynamic> _$ScalingRuleToJson(ScalingRule instance) {
  final val = <String, dynamic>{
    'Action': instance.action.toJson(),
    'Name': instance.name,
    'Trigger': instance.trigger.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  return val;
}

ScalingTrigger _$ScalingTriggerFromJson(Map<String, dynamic> json) {
  return ScalingTrigger(
    cloudWatchAlarmDefinition: CloudWatchAlarmDefinition.fromJson(
        json['CloudWatchAlarmDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScalingTriggerToJson(ScalingTrigger instance) =>
    <String, dynamic>{
      'CloudWatchAlarmDefinition': instance.cloudWatchAlarmDefinition.toJson(),
    };

ScriptBootstrapActionConfig _$ScriptBootstrapActionConfigFromJson(
    Map<String, dynamic> json) {
  return ScriptBootstrapActionConfig(
    path: json['Path'] as String,
    args: (json['Args'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ScriptBootstrapActionConfigToJson(
    ScriptBootstrapActionConfig instance) {
  final val = <String, dynamic>{
    'Path': instance.path,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Args', instance.args);
  return val;
}

SecurityConfigurationSummary _$SecurityConfigurationSummaryFromJson(
    Map<String, dynamic> json) {
  return SecurityConfigurationSummary(
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    name: json['Name'] as String?,
  );
}

SessionMappingDetail _$SessionMappingDetailFromJson(Map<String, dynamic> json) {
  return SessionMappingDetail(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    identityId: json['IdentityId'] as String?,
    identityName: json['IdentityName'] as String?,
    identityType:
        _$enumDecodeNullable(_$IdentityTypeEnumMap, json['IdentityType']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    sessionPolicyArn: json['SessionPolicyArn'] as String?,
    studioId: json['StudioId'] as String?,
  );
}

const _$IdentityTypeEnumMap = {
  IdentityType.user: 'USER',
  IdentityType.group: 'GROUP',
};

SessionMappingSummary _$SessionMappingSummaryFromJson(
    Map<String, dynamic> json) {
  return SessionMappingSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    identityId: json['IdentityId'] as String?,
    identityName: json['IdentityName'] as String?,
    identityType:
        _$enumDecodeNullable(_$IdentityTypeEnumMap, json['IdentityType']),
    sessionPolicyArn: json['SessionPolicyArn'] as String?,
    studioId: json['StudioId'] as String?,
  );
}

ShrinkPolicy _$ShrinkPolicyFromJson(Map<String, dynamic> json) {
  return ShrinkPolicy(
    decommissionTimeout: json['DecommissionTimeout'] as int?,
    instanceResizePolicy: json['InstanceResizePolicy'] == null
        ? null
        : InstanceResizePolicy.fromJson(
            json['InstanceResizePolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShrinkPolicyToJson(ShrinkPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DecommissionTimeout', instance.decommissionTimeout);
  writeNotNull('InstanceResizePolicy', instance.instanceResizePolicy?.toJson());
  return val;
}

SimpleScalingPolicyConfiguration _$SimpleScalingPolicyConfigurationFromJson(
    Map<String, dynamic> json) {
  return SimpleScalingPolicyConfiguration(
    scalingAdjustment: json['ScalingAdjustment'] as int,
    adjustmentType:
        _$enumDecodeNullable(_$AdjustmentTypeEnumMap, json['AdjustmentType']),
    coolDown: json['CoolDown'] as int?,
  );
}

Map<String, dynamic> _$SimpleScalingPolicyConfigurationToJson(
    SimpleScalingPolicyConfiguration instance) {
  final val = <String, dynamic>{
    'ScalingAdjustment': instance.scalingAdjustment,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AdjustmentType', _$AdjustmentTypeEnumMap[instance.adjustmentType]);
  writeNotNull('CoolDown', instance.coolDown);
  return val;
}

const _$AdjustmentTypeEnumMap = {
  AdjustmentType.changeInCapacity: 'CHANGE_IN_CAPACITY',
  AdjustmentType.percentChangeInCapacity: 'PERCENT_CHANGE_IN_CAPACITY',
  AdjustmentType.exactCapacity: 'EXACT_CAPACITY',
};

SpotProvisioningSpecification _$SpotProvisioningSpecificationFromJson(
    Map<String, dynamic> json) {
  return SpotProvisioningSpecification(
    timeoutAction: _$enumDecode(
        _$SpotProvisioningTimeoutActionEnumMap, json['TimeoutAction']),
    timeoutDurationMinutes: json['TimeoutDurationMinutes'] as int,
    allocationStrategy: _$enumDecodeNullable(
        _$SpotProvisioningAllocationStrategyEnumMap,
        json['AllocationStrategy']),
    blockDurationMinutes: json['BlockDurationMinutes'] as int?,
  );
}

Map<String, dynamic> _$SpotProvisioningSpecificationToJson(
    SpotProvisioningSpecification instance) {
  final val = <String, dynamic>{
    'TimeoutAction':
        _$SpotProvisioningTimeoutActionEnumMap[instance.timeoutAction],
    'TimeoutDurationMinutes': instance.timeoutDurationMinutes,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllocationStrategy',
      _$SpotProvisioningAllocationStrategyEnumMap[instance.allocationStrategy]);
  writeNotNull('BlockDurationMinutes', instance.blockDurationMinutes);
  return val;
}

const _$SpotProvisioningTimeoutActionEnumMap = {
  SpotProvisioningTimeoutAction.switchToOnDemand: 'SWITCH_TO_ON_DEMAND',
  SpotProvisioningTimeoutAction.terminateCluster: 'TERMINATE_CLUSTER',
};

const _$SpotProvisioningAllocationStrategyEnumMap = {
  SpotProvisioningAllocationStrategy.capacityOptimized: 'capacity-optimized',
};

StartNotebookExecutionOutput _$StartNotebookExecutionOutputFromJson(
    Map<String, dynamic> json) {
  return StartNotebookExecutionOutput(
    notebookExecutionId: json['NotebookExecutionId'] as String?,
  );
}

Step _$StepFromJson(Map<String, dynamic> json) {
  return Step(
    actionOnFailure:
        _$enumDecodeNullable(_$ActionOnFailureEnumMap, json['ActionOnFailure']),
    config: json['Config'] == null
        ? null
        : HadoopStepConfig.fromJson(json['Config'] as Map<String, dynamic>),
    id: json['Id'] as String?,
    name: json['Name'] as String?,
    status: json['Status'] == null
        ? null
        : StepStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

const _$ActionOnFailureEnumMap = {
  ActionOnFailure.terminateJobFlow: 'TERMINATE_JOB_FLOW',
  ActionOnFailure.terminateCluster: 'TERMINATE_CLUSTER',
  ActionOnFailure.cancelAndWait: 'CANCEL_AND_WAIT',
  ActionOnFailure.$continue: 'CONTINUE',
};

StepConfig _$StepConfigFromJson(Map<String, dynamic> json) {
  return StepConfig(
    hadoopJarStep: HadoopJarStepConfig.fromJson(
        json['HadoopJarStep'] as Map<String, dynamic>),
    name: json['Name'] as String,
    actionOnFailure:
        _$enumDecodeNullable(_$ActionOnFailureEnumMap, json['ActionOnFailure']),
  );
}

Map<String, dynamic> _$StepConfigToJson(StepConfig instance) {
  final val = <String, dynamic>{
    'HadoopJarStep': instance.hadoopJarStep.toJson(),
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ActionOnFailure', _$ActionOnFailureEnumMap[instance.actionOnFailure]);
  return val;
}

StepDetail _$StepDetailFromJson(Map<String, dynamic> json) {
  return StepDetail(
    executionStatusDetail: StepExecutionStatusDetail.fromJson(
        json['ExecutionStatusDetail'] as Map<String, dynamic>),
    stepConfig: StepConfig.fromJson(json['StepConfig'] as Map<String, dynamic>),
  );
}

StepExecutionStatusDetail _$StepExecutionStatusDetailFromJson(
    Map<String, dynamic> json) {
  return StepExecutionStatusDetail(
    creationDateTime: DateTime.parse(json['CreationDateTime'] as String),
    state: _$enumDecode(_$StepExecutionStateEnumMap, json['State']),
    endDateTime: const UnixDateTimeConverter().fromJson(json['EndDateTime']),
    lastStateChangeReason: json['LastStateChangeReason'] as String?,
    startDateTime:
        const UnixDateTimeConverter().fromJson(json['StartDateTime']),
  );
}

const _$StepExecutionStateEnumMap = {
  StepExecutionState.pending: 'PENDING',
  StepExecutionState.running: 'RUNNING',
  StepExecutionState.$continue: 'CONTINUE',
  StepExecutionState.completed: 'COMPLETED',
  StepExecutionState.cancelled: 'CANCELLED',
  StepExecutionState.failed: 'FAILED',
  StepExecutionState.interrupted: 'INTERRUPTED',
};

StepStateChangeReason _$StepStateChangeReasonFromJson(
    Map<String, dynamic> json) {
  return StepStateChangeReason(
    code:
        _$enumDecodeNullable(_$StepStateChangeReasonCodeEnumMap, json['Code']),
    message: json['Message'] as String?,
  );
}

const _$StepStateChangeReasonCodeEnumMap = {
  StepStateChangeReasonCode.none: 'NONE',
};

StepStatus _$StepStatusFromJson(Map<String, dynamic> json) {
  return StepStatus(
    failureDetails: json['FailureDetails'] == null
        ? null
        : FailureDetails.fromJson(
            json['FailureDetails'] as Map<String, dynamic>),
    state: _$enumDecodeNullable(_$StepStateEnumMap, json['State']),
    stateChangeReason: json['StateChangeReason'] == null
        ? null
        : StepStateChangeReason.fromJson(
            json['StateChangeReason'] as Map<String, dynamic>),
    timeline: json['Timeline'] == null
        ? null
        : StepTimeline.fromJson(json['Timeline'] as Map<String, dynamic>),
  );
}

const _$StepStateEnumMap = {
  StepState.pending: 'PENDING',
  StepState.cancelPending: 'CANCEL_PENDING',
  StepState.running: 'RUNNING',
  StepState.completed: 'COMPLETED',
  StepState.cancelled: 'CANCELLED',
  StepState.failed: 'FAILED',
  StepState.interrupted: 'INTERRUPTED',
};

StepSummary _$StepSummaryFromJson(Map<String, dynamic> json) {
  return StepSummary(
    actionOnFailure:
        _$enumDecodeNullable(_$ActionOnFailureEnumMap, json['ActionOnFailure']),
    config: json['Config'] == null
        ? null
        : HadoopStepConfig.fromJson(json['Config'] as Map<String, dynamic>),
    id: json['Id'] as String?,
    name: json['Name'] as String?,
    status: json['Status'] == null
        ? null
        : StepStatus.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

StepTimeline _$StepTimelineFromJson(Map<String, dynamic> json) {
  return StepTimeline(
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    endDateTime: const UnixDateTimeConverter().fromJson(json['EndDateTime']),
    startDateTime:
        const UnixDateTimeConverter().fromJson(json['StartDateTime']),
  );
}

Studio _$StudioFromJson(Map<String, dynamic> json) {
  return Studio(
    authMode: _$enumDecodeNullable(_$AuthModeEnumMap, json['AuthMode']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    defaultS3Location: json['DefaultS3Location'] as String?,
    description: json['Description'] as String?,
    engineSecurityGroupId: json['EngineSecurityGroupId'] as String?,
    name: json['Name'] as String?,
    serviceRole: json['ServiceRole'] as String?,
    studioArn: json['StudioArn'] as String?,
    studioId: json['StudioId'] as String?,
    subnetIds:
        (json['SubnetIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    url: json['Url'] as String?,
    userRole: json['UserRole'] as String?,
    vpcId: json['VpcId'] as String?,
    workspaceSecurityGroupId: json['WorkspaceSecurityGroupId'] as String?,
  );
}

const _$AuthModeEnumMap = {
  AuthMode.sso: 'SSO',
  AuthMode.iam: 'IAM',
};

StudioSummary _$StudioSummaryFromJson(Map<String, dynamic> json) {
  return StudioSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String?,
    name: json['Name'] as String?,
    studioId: json['StudioId'] as String?,
    url: json['Url'] as String?,
    vpcId: json['VpcId'] as String?,
  );
}

Map<String, dynamic> _$SupportedProductConfigToJson(
    SupportedProductConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Args', instance.args);
  writeNotNull('Name', instance.name);
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String?,
    value: json['Value'] as String?,
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

VolumeSpecification _$VolumeSpecificationFromJson(Map<String, dynamic> json) {
  return VolumeSpecification(
    sizeInGB: json['SizeInGB'] as int,
    volumeType: json['VolumeType'] as String,
    iops: json['Iops'] as int?,
  );
}

Map<String, dynamic> _$VolumeSpecificationToJson(VolumeSpecification instance) {
  final val = <String, dynamic>{
    'SizeInGB': instance.sizeInGB,
    'VolumeType': instance.volumeType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Iops', instance.iops);
  return val;
}
