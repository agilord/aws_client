// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-10-06.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alarm _$AlarmFromJson(Map<String, dynamic> json) {
  return Alarm(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$AlarmToJson(Alarm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

AlarmConfiguration _$AlarmConfigurationFromJson(Map<String, dynamic> json) {
  return AlarmConfiguration(
    alarms: (json['alarms'] as List)
        ?.map(
            (e) => e == null ? null : Alarm.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    enabled: json['enabled'] as bool,
    ignorePollAlarmFailure: json['ignorePollAlarmFailure'] as bool,
  );
}

Map<String, dynamic> _$AlarmConfigurationToJson(AlarmConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alarms', instance.alarms?.map((e) => e?.toJson())?.toList());
  writeNotNull('enabled', instance.enabled);
  writeNotNull('ignorePollAlarmFailure', instance.ignorePollAlarmFailure);
  return val;
}

AppSpecContent _$AppSpecContentFromJson(Map<String, dynamic> json) {
  return AppSpecContent(
    content: json['content'] as String,
    sha256: json['sha256'] as String,
  );
}

Map<String, dynamic> _$AppSpecContentToJson(AppSpecContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('sha256', instance.sha256);
  return val;
}

ApplicationInfo _$ApplicationInfoFromJson(Map<String, dynamic> json) {
  return ApplicationInfo(
    applicationId: json['applicationId'] as String,
    applicationName: json['applicationName'] as String,
    computePlatform:
        _$enumDecodeNullable(_$ComputePlatformEnumMap, json['computePlatform']),
    createTime: const UnixDateTimeConverter().fromJson(json['createTime']),
    gitHubAccountName: json['gitHubAccountName'] as String,
    linkedToGitHub: json['linkedToGitHub'] as bool,
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

const _$ComputePlatformEnumMap = {
  ComputePlatform.server: 'Server',
  ComputePlatform.lambda: 'Lambda',
  ComputePlatform.ecs: 'ECS',
};

AutoRollbackConfiguration _$AutoRollbackConfigurationFromJson(
    Map<String, dynamic> json) {
  return AutoRollbackConfiguration(
    enabled: json['enabled'] as bool,
    events: (json['events'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AutoRollbackEventEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$AutoRollbackConfigurationToJson(
    AutoRollbackConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  writeNotNull('events',
      instance.events?.map((e) => _$AutoRollbackEventEnumMap[e])?.toList());
  return val;
}

const _$AutoRollbackEventEnumMap = {
  AutoRollbackEvent.deploymentFailure: 'DEPLOYMENT_FAILURE',
  AutoRollbackEvent.deploymentStopOnAlarm: 'DEPLOYMENT_STOP_ON_ALARM',
  AutoRollbackEvent.deploymentStopOnRequest: 'DEPLOYMENT_STOP_ON_REQUEST',
};

AutoScalingGroup _$AutoScalingGroupFromJson(Map<String, dynamic> json) {
  return AutoScalingGroup(
    hook: json['hook'] as String,
    name: json['name'] as String,
  );
}

BatchGetApplicationRevisionsOutput _$BatchGetApplicationRevisionsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetApplicationRevisionsOutput(
    applicationName: json['applicationName'] as String,
    errorMessage: json['errorMessage'] as String,
    revisions: (json['revisions'] as List)
        ?.map((e) =>
            e == null ? null : RevisionInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetApplicationsOutput _$BatchGetApplicationsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetApplicationsOutput(
    applicationsInfo: (json['applicationsInfo'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetDeploymentGroupsOutput _$BatchGetDeploymentGroupsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetDeploymentGroupsOutput(
    deploymentGroupsInfo: (json['deploymentGroupsInfo'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentGroupInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errorMessage: json['errorMessage'] as String,
  );
}

BatchGetDeploymentInstancesOutput _$BatchGetDeploymentInstancesOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetDeploymentInstancesOutput(
    errorMessage: json['errorMessage'] as String,
    instancesSummary: (json['instancesSummary'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetDeploymentTargetsOutput _$BatchGetDeploymentTargetsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetDeploymentTargetsOutput(
    deploymentTargets: (json['deploymentTargets'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetDeploymentsOutput _$BatchGetDeploymentsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetDeploymentsOutput(
    deploymentsInfo: (json['deploymentsInfo'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetOnPremisesInstancesOutput _$BatchGetOnPremisesInstancesOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetOnPremisesInstancesOutput(
    instanceInfos: (json['instanceInfos'] as List)
        ?.map((e) =>
            e == null ? null : InstanceInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BlueGreenDeploymentConfiguration _$BlueGreenDeploymentConfigurationFromJson(
    Map<String, dynamic> json) {
  return BlueGreenDeploymentConfiguration(
    deploymentReadyOption: json['deploymentReadyOption'] == null
        ? null
        : DeploymentReadyOption.fromJson(
            json['deploymentReadyOption'] as Map<String, dynamic>),
    greenFleetProvisioningOption: json['greenFleetProvisioningOption'] == null
        ? null
        : GreenFleetProvisioningOption.fromJson(
            json['greenFleetProvisioningOption'] as Map<String, dynamic>),
    terminateBlueInstancesOnDeploymentSuccess:
        json['terminateBlueInstancesOnDeploymentSuccess'] == null
            ? null
            : BlueInstanceTerminationOption.fromJson(
                json['terminateBlueInstancesOnDeploymentSuccess']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BlueGreenDeploymentConfigurationToJson(
    BlueGreenDeploymentConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'deploymentReadyOption', instance.deploymentReadyOption?.toJson());
  writeNotNull('greenFleetProvisioningOption',
      instance.greenFleetProvisioningOption?.toJson());
  writeNotNull('terminateBlueInstancesOnDeploymentSuccess',
      instance.terminateBlueInstancesOnDeploymentSuccess?.toJson());
  return val;
}

BlueInstanceTerminationOption _$BlueInstanceTerminationOptionFromJson(
    Map<String, dynamic> json) {
  return BlueInstanceTerminationOption(
    action: _$enumDecodeNullable(_$InstanceActionEnumMap, json['action']),
    terminationWaitTimeInMinutes: json['terminationWaitTimeInMinutes'] as int,
  );
}

Map<String, dynamic> _$BlueInstanceTerminationOptionToJson(
    BlueInstanceTerminationOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('action', _$InstanceActionEnumMap[instance.action]);
  writeNotNull(
      'terminationWaitTimeInMinutes', instance.terminationWaitTimeInMinutes);
  return val;
}

const _$InstanceActionEnumMap = {
  InstanceAction.terminate: 'TERMINATE',
  InstanceAction.keepAlive: 'KEEP_ALIVE',
};

CloudFormationTarget _$CloudFormationTargetFromJson(Map<String, dynamic> json) {
  return CloudFormationTarget(
    deploymentId: json['deploymentId'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    lifecycleEvents: (json['lifecycleEvents'] as List)
        ?.map((e) => e == null
            ? null
            : LifecycleEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceType: json['resourceType'] as String,
    status: _$enumDecodeNullable(_$TargetStatusEnumMap, json['status']),
    targetId: json['targetId'] as String,
    targetVersionWeight: (json['targetVersionWeight'] as num)?.toDouble(),
  );
}

const _$TargetStatusEnumMap = {
  TargetStatus.pending: 'Pending',
  TargetStatus.inProgress: 'InProgress',
  TargetStatus.succeeded: 'Succeeded',
  TargetStatus.failed: 'Failed',
  TargetStatus.skipped: 'Skipped',
  TargetStatus.unknown: 'Unknown',
  TargetStatus.ready: 'Ready',
};

CreateApplicationOutput _$CreateApplicationOutputFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationOutput(
    applicationId: json['applicationId'] as String,
  );
}

CreateDeploymentConfigOutput _$CreateDeploymentConfigOutputFromJson(
    Map<String, dynamic> json) {
  return CreateDeploymentConfigOutput(
    deploymentConfigId: json['deploymentConfigId'] as String,
  );
}

CreateDeploymentGroupOutput _$CreateDeploymentGroupOutputFromJson(
    Map<String, dynamic> json) {
  return CreateDeploymentGroupOutput(
    deploymentGroupId: json['deploymentGroupId'] as String,
  );
}

CreateDeploymentOutput _$CreateDeploymentOutputFromJson(
    Map<String, dynamic> json) {
  return CreateDeploymentOutput(
    deploymentId: json['deploymentId'] as String,
  );
}

DeleteDeploymentGroupOutput _$DeleteDeploymentGroupOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteDeploymentGroupOutput(
    hooksNotCleanedUp: (json['hooksNotCleanedUp'] as List)
        ?.map((e) => e == null
            ? null
            : AutoScalingGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteGitHubAccountTokenOutput _$DeleteGitHubAccountTokenOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteGitHubAccountTokenOutput(
    tokenName: json['tokenName'] as String,
  );
}

DeleteResourcesByExternalIdOutput _$DeleteResourcesByExternalIdOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteResourcesByExternalIdOutput();
}

DeploymentConfigInfo _$DeploymentConfigInfoFromJson(Map<String, dynamic> json) {
  return DeploymentConfigInfo(
    computePlatform:
        _$enumDecodeNullable(_$ComputePlatformEnumMap, json['computePlatform']),
    createTime: const UnixDateTimeConverter().fromJson(json['createTime']),
    deploymentConfigId: json['deploymentConfigId'] as String,
    deploymentConfigName: json['deploymentConfigName'] as String,
    minimumHealthyHosts: json['minimumHealthyHosts'] == null
        ? null
        : MinimumHealthyHosts.fromJson(
            json['minimumHealthyHosts'] as Map<String, dynamic>),
    trafficRoutingConfig: json['trafficRoutingConfig'] == null
        ? null
        : TrafficRoutingConfig.fromJson(
            json['trafficRoutingConfig'] as Map<String, dynamic>),
  );
}

DeploymentGroupInfo _$DeploymentGroupInfoFromJson(Map<String, dynamic> json) {
  return DeploymentGroupInfo(
    alarmConfiguration: json['alarmConfiguration'] == null
        ? null
        : AlarmConfiguration.fromJson(
            json['alarmConfiguration'] as Map<String, dynamic>),
    applicationName: json['applicationName'] as String,
    autoRollbackConfiguration: json['autoRollbackConfiguration'] == null
        ? null
        : AutoRollbackConfiguration.fromJson(
            json['autoRollbackConfiguration'] as Map<String, dynamic>),
    autoScalingGroups: (json['autoScalingGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AutoScalingGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    blueGreenDeploymentConfiguration:
        json['blueGreenDeploymentConfiguration'] == null
            ? null
            : BlueGreenDeploymentConfiguration.fromJson(
                json['blueGreenDeploymentConfiguration']
                    as Map<String, dynamic>),
    computePlatform:
        _$enumDecodeNullable(_$ComputePlatformEnumMap, json['computePlatform']),
    deploymentConfigName: json['deploymentConfigName'] as String,
    deploymentGroupId: json['deploymentGroupId'] as String,
    deploymentGroupName: json['deploymentGroupName'] as String,
    deploymentStyle: json['deploymentStyle'] == null
        ? null
        : DeploymentStyle.fromJson(
            json['deploymentStyle'] as Map<String, dynamic>),
    ec2TagFilters: (json['ec2TagFilters'] as List)
        ?.map((e) =>
            e == null ? null : EC2TagFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ec2TagSet: json['ec2TagSet'] == null
        ? null
        : EC2TagSet.fromJson(json['ec2TagSet'] as Map<String, dynamic>),
    ecsServices: (json['ecsServices'] as List)
        ?.map((e) =>
            e == null ? null : ECSService.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastAttemptedDeployment: json['lastAttemptedDeployment'] == null
        ? null
        : LastDeploymentInfo.fromJson(
            json['lastAttemptedDeployment'] as Map<String, dynamic>),
    lastSuccessfulDeployment: json['lastSuccessfulDeployment'] == null
        ? null
        : LastDeploymentInfo.fromJson(
            json['lastSuccessfulDeployment'] as Map<String, dynamic>),
    loadBalancerInfo: json['loadBalancerInfo'] == null
        ? null
        : LoadBalancerInfo.fromJson(
            json['loadBalancerInfo'] as Map<String, dynamic>),
    onPremisesInstanceTagFilters: (json['onPremisesInstanceTagFilters'] as List)
        ?.map((e) =>
            e == null ? null : TagFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    onPremisesTagSet: json['onPremisesTagSet'] == null
        ? null
        : OnPremisesTagSet.fromJson(
            json['onPremisesTagSet'] as Map<String, dynamic>),
    serviceRoleArn: json['serviceRoleArn'] as String,
    targetRevision: json['targetRevision'] == null
        ? null
        : RevisionLocation.fromJson(
            json['targetRevision'] as Map<String, dynamic>),
    triggerConfigurations: (json['triggerConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : TriggerConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeploymentInfo _$DeploymentInfoFromJson(Map<String, dynamic> json) {
  return DeploymentInfo(
    additionalDeploymentStatusInfo:
        json['additionalDeploymentStatusInfo'] as String,
    applicationName: json['applicationName'] as String,
    autoRollbackConfiguration: json['autoRollbackConfiguration'] == null
        ? null
        : AutoRollbackConfiguration.fromJson(
            json['autoRollbackConfiguration'] as Map<String, dynamic>),
    blueGreenDeploymentConfiguration:
        json['blueGreenDeploymentConfiguration'] == null
            ? null
            : BlueGreenDeploymentConfiguration.fromJson(
                json['blueGreenDeploymentConfiguration']
                    as Map<String, dynamic>),
    completeTime: const UnixDateTimeConverter().fromJson(json['completeTime']),
    computePlatform:
        _$enumDecodeNullable(_$ComputePlatformEnumMap, json['computePlatform']),
    createTime: const UnixDateTimeConverter().fromJson(json['createTime']),
    creator: _$enumDecodeNullable(_$DeploymentCreatorEnumMap, json['creator']),
    deploymentConfigName: json['deploymentConfigName'] as String,
    deploymentGroupName: json['deploymentGroupName'] as String,
    deploymentId: json['deploymentId'] as String,
    deploymentOverview: json['deploymentOverview'] == null
        ? null
        : DeploymentOverview.fromJson(
            json['deploymentOverview'] as Map<String, dynamic>),
    deploymentStatusMessages: (json['deploymentStatusMessages'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    deploymentStyle: json['deploymentStyle'] == null
        ? null
        : DeploymentStyle.fromJson(
            json['deploymentStyle'] as Map<String, dynamic>),
    description: json['description'] as String,
    errorInformation: json['errorInformation'] == null
        ? null
        : ErrorInformation.fromJson(
            json['errorInformation'] as Map<String, dynamic>),
    externalId: json['externalId'] as String,
    fileExistsBehavior: _$enumDecodeNullable(
        _$FileExistsBehaviorEnumMap, json['fileExistsBehavior']),
    ignoreApplicationStopFailures:
        json['ignoreApplicationStopFailures'] as bool,
    instanceTerminationWaitTimeStarted:
        json['instanceTerminationWaitTimeStarted'] as bool,
    loadBalancerInfo: json['loadBalancerInfo'] == null
        ? null
        : LoadBalancerInfo.fromJson(
            json['loadBalancerInfo'] as Map<String, dynamic>),
    previousRevision: json['previousRevision'] == null
        ? null
        : RevisionLocation.fromJson(
            json['previousRevision'] as Map<String, dynamic>),
    revision: json['revision'] == null
        ? null
        : RevisionLocation.fromJson(json['revision'] as Map<String, dynamic>),
    rollbackInfo: json['rollbackInfo'] == null
        ? null
        : RollbackInfo.fromJson(json['rollbackInfo'] as Map<String, dynamic>),
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    status: _$enumDecodeNullable(_$DeploymentStatusEnumMap, json['status']),
    targetInstances: json['targetInstances'] == null
        ? null
        : TargetInstances.fromJson(
            json['targetInstances'] as Map<String, dynamic>),
    updateOutdatedInstancesOnly: json['updateOutdatedInstancesOnly'] as bool,
  );
}

const _$DeploymentCreatorEnumMap = {
  DeploymentCreator.user: 'user',
  DeploymentCreator.autoscaling: 'autoscaling',
  DeploymentCreator.codeDeployRollback: 'codeDeployRollback',
  DeploymentCreator.codeDeploy: 'CodeDeploy',
  DeploymentCreator.cloudFormation: 'CloudFormation',
  DeploymentCreator.cloudFormationRollback: 'CloudFormationRollback',
};

const _$FileExistsBehaviorEnumMap = {
  FileExistsBehavior.disallow: 'DISALLOW',
  FileExistsBehavior.overwrite: 'OVERWRITE',
  FileExistsBehavior.retain: 'RETAIN',
};

const _$DeploymentStatusEnumMap = {
  DeploymentStatus.created: 'Created',
  DeploymentStatus.queued: 'Queued',
  DeploymentStatus.inProgress: 'InProgress',
  DeploymentStatus.baking: 'Baking',
  DeploymentStatus.succeeded: 'Succeeded',
  DeploymentStatus.failed: 'Failed',
  DeploymentStatus.stopped: 'Stopped',
  DeploymentStatus.ready: 'Ready',
};

DeploymentOverview _$DeploymentOverviewFromJson(Map<String, dynamic> json) {
  return DeploymentOverview(
    failed: json['Failed'] as int,
    inProgress: json['InProgress'] as int,
    pending: json['Pending'] as int,
    ready: json['Ready'] as int,
    skipped: json['Skipped'] as int,
    succeeded: json['Succeeded'] as int,
  );
}

DeploymentReadyOption _$DeploymentReadyOptionFromJson(
    Map<String, dynamic> json) {
  return DeploymentReadyOption(
    actionOnTimeout: _$enumDecodeNullable(
        _$DeploymentReadyActionEnumMap, json['actionOnTimeout']),
    waitTimeInMinutes: json['waitTimeInMinutes'] as int,
  );
}

Map<String, dynamic> _$DeploymentReadyOptionToJson(
    DeploymentReadyOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('actionOnTimeout',
      _$DeploymentReadyActionEnumMap[instance.actionOnTimeout]);
  writeNotNull('waitTimeInMinutes', instance.waitTimeInMinutes);
  return val;
}

const _$DeploymentReadyActionEnumMap = {
  DeploymentReadyAction.continueDeployment: 'CONTINUE_DEPLOYMENT',
  DeploymentReadyAction.stopDeployment: 'STOP_DEPLOYMENT',
};

DeploymentStyle _$DeploymentStyleFromJson(Map<String, dynamic> json) {
  return DeploymentStyle(
    deploymentOption: _$enumDecodeNullable(
        _$DeploymentOptionEnumMap, json['deploymentOption']),
    deploymentType:
        _$enumDecodeNullable(_$DeploymentTypeEnumMap, json['deploymentType']),
  );
}

Map<String, dynamic> _$DeploymentStyleToJson(DeploymentStyle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'deploymentOption', _$DeploymentOptionEnumMap[instance.deploymentOption]);
  writeNotNull(
      'deploymentType', _$DeploymentTypeEnumMap[instance.deploymentType]);
  return val;
}

const _$DeploymentOptionEnumMap = {
  DeploymentOption.withTrafficControl: 'WITH_TRAFFIC_CONTROL',
  DeploymentOption.withoutTrafficControl: 'WITHOUT_TRAFFIC_CONTROL',
};

const _$DeploymentTypeEnumMap = {
  DeploymentType.inPlace: 'IN_PLACE',
  DeploymentType.blueGreen: 'BLUE_GREEN',
};

DeploymentTarget _$DeploymentTargetFromJson(Map<String, dynamic> json) {
  return DeploymentTarget(
    cloudFormationTarget: json['cloudFormationTarget'] == null
        ? null
        : CloudFormationTarget.fromJson(
            json['cloudFormationTarget'] as Map<String, dynamic>),
    deploymentTargetType: _$enumDecodeNullable(
        _$DeploymentTargetTypeEnumMap, json['deploymentTargetType']),
    ecsTarget: json['ecsTarget'] == null
        ? null
        : ECSTarget.fromJson(json['ecsTarget'] as Map<String, dynamic>),
    instanceTarget: json['instanceTarget'] == null
        ? null
        : InstanceTarget.fromJson(
            json['instanceTarget'] as Map<String, dynamic>),
    lambdaTarget: json['lambdaTarget'] == null
        ? null
        : LambdaTarget.fromJson(json['lambdaTarget'] as Map<String, dynamic>),
  );
}

const _$DeploymentTargetTypeEnumMap = {
  DeploymentTargetType.instanceTarget: 'InstanceTarget',
  DeploymentTargetType.lambdaTarget: 'LambdaTarget',
  DeploymentTargetType.eCSTarget: 'ECSTarget',
  DeploymentTargetType.cloudFormationTarget: 'CloudFormationTarget',
};

Diagnostics _$DiagnosticsFromJson(Map<String, dynamic> json) {
  return Diagnostics(
    errorCode:
        _$enumDecodeNullable(_$LifecycleErrorCodeEnumMap, json['errorCode']),
    logTail: json['logTail'] as String,
    message: json['message'] as String,
    scriptName: json['scriptName'] as String,
  );
}

const _$LifecycleErrorCodeEnumMap = {
  LifecycleErrorCode.success: 'Success',
  LifecycleErrorCode.scriptMissing: 'ScriptMissing',
  LifecycleErrorCode.scriptNotExecutable: 'ScriptNotExecutable',
  LifecycleErrorCode.scriptTimedOut: 'ScriptTimedOut',
  LifecycleErrorCode.scriptFailed: 'ScriptFailed',
  LifecycleErrorCode.unknownError: 'UnknownError',
};

EC2TagFilter _$EC2TagFilterFromJson(Map<String, dynamic> json) {
  return EC2TagFilter(
    key: json['Key'] as String,
    type: _$enumDecodeNullable(_$EC2TagFilterTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$EC2TagFilterToJson(EC2TagFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Type', _$EC2TagFilterTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$EC2TagFilterTypeEnumMap = {
  EC2TagFilterType.keyOnly: 'KEY_ONLY',
  EC2TagFilterType.valueOnly: 'VALUE_ONLY',
  EC2TagFilterType.keyAndValue: 'KEY_AND_VALUE',
};

EC2TagSet _$EC2TagSetFromJson(Map<String, dynamic> json) {
  return EC2TagSet(
    ec2TagSetList: (json['ec2TagSetList'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : EC2TagFilter.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$EC2TagSetToJson(EC2TagSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ec2TagSetList',
      instance.ec2TagSetList
          ?.map((e) => e?.map((e) => e?.toJson())?.toList())
          ?.toList());
  return val;
}

ECSService _$ECSServiceFromJson(Map<String, dynamic> json) {
  return ECSService(
    clusterName: json['clusterName'] as String,
    serviceName: json['serviceName'] as String,
  );
}

Map<String, dynamic> _$ECSServiceToJson(ECSService instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clusterName', instance.clusterName);
  writeNotNull('serviceName', instance.serviceName);
  return val;
}

ECSTarget _$ECSTargetFromJson(Map<String, dynamic> json) {
  return ECSTarget(
    deploymentId: json['deploymentId'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    lifecycleEvents: (json['lifecycleEvents'] as List)
        ?.map((e) => e == null
            ? null
            : LifecycleEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$TargetStatusEnumMap, json['status']),
    targetArn: json['targetArn'] as String,
    targetId: json['targetId'] as String,
    taskSetsInfo: (json['taskSetsInfo'] as List)
        ?.map((e) =>
            e == null ? null : ECSTaskSet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ECSTaskSet _$ECSTaskSetFromJson(Map<String, dynamic> json) {
  return ECSTaskSet(
    desiredCount: json['desiredCount'] as int,
    identifer: json['identifer'] as String,
    pendingCount: json['pendingCount'] as int,
    runningCount: json['runningCount'] as int,
    status: json['status'] as String,
    targetGroup: json['targetGroup'] == null
        ? null
        : TargetGroupInfo.fromJson(json['targetGroup'] as Map<String, dynamic>),
    taskSetLabel:
        _$enumDecodeNullable(_$TargetLabelEnumMap, json['taskSetLabel']),
    trafficWeight: (json['trafficWeight'] as num)?.toDouble(),
  );
}

const _$TargetLabelEnumMap = {
  TargetLabel.blue: 'Blue',
  TargetLabel.green: 'Green',
};

ELBInfo _$ELBInfoFromJson(Map<String, dynamic> json) {
  return ELBInfo(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ELBInfoToJson(ELBInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

ErrorInformation _$ErrorInformationFromJson(Map<String, dynamic> json) {
  return ErrorInformation(
    code: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['code']),
    message: json['message'] as String,
  );
}

const _$ErrorCodeEnumMap = {
  ErrorCode.agentIssue: 'AGENT_ISSUE',
  ErrorCode.alarmActive: 'ALARM_ACTIVE',
  ErrorCode.applicationMissing: 'APPLICATION_MISSING',
  ErrorCode.autoscalingValidationError: 'AUTOSCALING_VALIDATION_ERROR',
  ErrorCode.autoScalingConfiguration: 'AUTO_SCALING_CONFIGURATION',
  ErrorCode.autoScalingIamRolePermissions: 'AUTO_SCALING_IAM_ROLE_PERMISSIONS',
  ErrorCode.codedeployResourceCannotBeFound:
      'CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND',
  ErrorCode.customerApplicationUnhealthy: 'CUSTOMER_APPLICATION_UNHEALTHY',
  ErrorCode.deploymentGroupMissing: 'DEPLOYMENT_GROUP_MISSING',
  ErrorCode.ecsUpdateError: 'ECS_UPDATE_ERROR',
  ErrorCode.elasticLoadBalancingInvalid: 'ELASTIC_LOAD_BALANCING_INVALID',
  ErrorCode.elbInvalidInstance: 'ELB_INVALID_INSTANCE',
  ErrorCode.healthConstraints: 'HEALTH_CONSTRAINTS',
  ErrorCode.healthConstraintsInvalid: 'HEALTH_CONSTRAINTS_INVALID',
  ErrorCode.hookExecutionFailure: 'HOOK_EXECUTION_FAILURE',
  ErrorCode.iamRoleMissing: 'IAM_ROLE_MISSING',
  ErrorCode.iamRolePermissions: 'IAM_ROLE_PERMISSIONS',
  ErrorCode.internalError: 'INTERNAL_ERROR',
  ErrorCode.invalidEcsService: 'INVALID_ECS_SERVICE',
  ErrorCode.invalidLambdaConfiguration: 'INVALID_LAMBDA_CONFIGURATION',
  ErrorCode.invalidLambdaFunction: 'INVALID_LAMBDA_FUNCTION',
  ErrorCode.invalidRevision: 'INVALID_REVISION',
  ErrorCode.manualStop: 'MANUAL_STOP',
  ErrorCode.missingBlueGreenDeploymentConfiguration:
      'MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION',
  ErrorCode.missingElbInformation: 'MISSING_ELB_INFORMATION',
  ErrorCode.missingGithubToken: 'MISSING_GITHUB_TOKEN',
  ErrorCode.noEc2Subscription: 'NO_EC2_SUBSCRIPTION',
  ErrorCode.noInstances: 'NO_INSTANCES',
  ErrorCode.overMaxInstances: 'OVER_MAX_INSTANCES',
  ErrorCode.resourceLimitExceeded: 'RESOURCE_LIMIT_EXCEEDED',
  ErrorCode.revisionMissing: 'REVISION_MISSING',
  ErrorCode.throttled: 'THROTTLED',
  ErrorCode.timeout: 'TIMEOUT',
  ErrorCode.cloudformationStackFailure: 'CLOUDFORMATION_STACK_FAILURE',
};

GenericRevisionInfo _$GenericRevisionInfoFromJson(Map<String, dynamic> json) {
  return GenericRevisionInfo(
    deploymentGroups:
        (json['deploymentGroups'] as List)?.map((e) => e as String)?.toList(),
    description: json['description'] as String,
    firstUsedTime:
        const UnixDateTimeConverter().fromJson(json['firstUsedTime']),
    lastUsedTime: const UnixDateTimeConverter().fromJson(json['lastUsedTime']),
    registerTime: const UnixDateTimeConverter().fromJson(json['registerTime']),
  );
}

GetApplicationOutput _$GetApplicationOutputFromJson(Map<String, dynamic> json) {
  return GetApplicationOutput(
    application: json['application'] == null
        ? null
        : ApplicationInfo.fromJson(json['application'] as Map<String, dynamic>),
  );
}

GetApplicationRevisionOutput _$GetApplicationRevisionOutputFromJson(
    Map<String, dynamic> json) {
  return GetApplicationRevisionOutput(
    applicationName: json['applicationName'] as String,
    revision: json['revision'] == null
        ? null
        : RevisionLocation.fromJson(json['revision'] as Map<String, dynamic>),
    revisionInfo: json['revisionInfo'] == null
        ? null
        : GenericRevisionInfo.fromJson(
            json['revisionInfo'] as Map<String, dynamic>),
  );
}

GetDeploymentConfigOutput _$GetDeploymentConfigOutputFromJson(
    Map<String, dynamic> json) {
  return GetDeploymentConfigOutput(
    deploymentConfigInfo: json['deploymentConfigInfo'] == null
        ? null
        : DeploymentConfigInfo.fromJson(
            json['deploymentConfigInfo'] as Map<String, dynamic>),
  );
}

GetDeploymentGroupOutput _$GetDeploymentGroupOutputFromJson(
    Map<String, dynamic> json) {
  return GetDeploymentGroupOutput(
    deploymentGroupInfo: json['deploymentGroupInfo'] == null
        ? null
        : DeploymentGroupInfo.fromJson(
            json['deploymentGroupInfo'] as Map<String, dynamic>),
  );
}

GetDeploymentInstanceOutput _$GetDeploymentInstanceOutputFromJson(
    Map<String, dynamic> json) {
  return GetDeploymentInstanceOutput(
    instanceSummary: json['instanceSummary'] == null
        ? null
        : InstanceSummary.fromJson(
            json['instanceSummary'] as Map<String, dynamic>),
  );
}

GetDeploymentOutput _$GetDeploymentOutputFromJson(Map<String, dynamic> json) {
  return GetDeploymentOutput(
    deploymentInfo: json['deploymentInfo'] == null
        ? null
        : DeploymentInfo.fromJson(
            json['deploymentInfo'] as Map<String, dynamic>),
  );
}

GetDeploymentTargetOutput _$GetDeploymentTargetOutputFromJson(
    Map<String, dynamic> json) {
  return GetDeploymentTargetOutput(
    deploymentTarget: json['deploymentTarget'] == null
        ? null
        : DeploymentTarget.fromJson(
            json['deploymentTarget'] as Map<String, dynamic>),
  );
}

GetOnPremisesInstanceOutput _$GetOnPremisesInstanceOutputFromJson(
    Map<String, dynamic> json) {
  return GetOnPremisesInstanceOutput(
    instanceInfo: json['instanceInfo'] == null
        ? null
        : InstanceInfo.fromJson(json['instanceInfo'] as Map<String, dynamic>),
  );
}

GitHubLocation _$GitHubLocationFromJson(Map<String, dynamic> json) {
  return GitHubLocation(
    commitId: json['commitId'] as String,
    repository: json['repository'] as String,
  );
}

Map<String, dynamic> _$GitHubLocationToJson(GitHubLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('commitId', instance.commitId);
  writeNotNull('repository', instance.repository);
  return val;
}

GreenFleetProvisioningOption _$GreenFleetProvisioningOptionFromJson(
    Map<String, dynamic> json) {
  return GreenFleetProvisioningOption(
    action: _$enumDecodeNullable(
        _$GreenFleetProvisioningActionEnumMap, json['action']),
  );
}

Map<String, dynamic> _$GreenFleetProvisioningOptionToJson(
    GreenFleetProvisioningOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'action', _$GreenFleetProvisioningActionEnumMap[instance.action]);
  return val;
}

const _$GreenFleetProvisioningActionEnumMap = {
  GreenFleetProvisioningAction.discoverExisting: 'DISCOVER_EXISTING',
  GreenFleetProvisioningAction.copyAutoScalingGroup: 'COPY_AUTO_SCALING_GROUP',
};

InstanceInfo _$InstanceInfoFromJson(Map<String, dynamic> json) {
  return InstanceInfo(
    deregisterTime:
        const UnixDateTimeConverter().fromJson(json['deregisterTime']),
    iamSessionArn: json['iamSessionArn'] as String,
    iamUserArn: json['iamUserArn'] as String,
    instanceArn: json['instanceArn'] as String,
    instanceName: json['instanceName'] as String,
    registerTime: const UnixDateTimeConverter().fromJson(json['registerTime']),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

InstanceSummary _$InstanceSummaryFromJson(Map<String, dynamic> json) {
  return InstanceSummary(
    deploymentId: json['deploymentId'] as String,
    instanceId: json['instanceId'] as String,
    instanceType:
        _$enumDecodeNullable(_$InstanceTypeEnumMap, json['instanceType']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    lifecycleEvents: (json['lifecycleEvents'] as List)
        ?.map((e) => e == null
            ? null
            : LifecycleEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$InstanceStatusEnumMap, json['status']),
  );
}

const _$InstanceTypeEnumMap = {
  InstanceType.blue: 'Blue',
  InstanceType.green: 'Green',
};

const _$InstanceStatusEnumMap = {
  InstanceStatus.pending: 'Pending',
  InstanceStatus.inProgress: 'InProgress',
  InstanceStatus.succeeded: 'Succeeded',
  InstanceStatus.failed: 'Failed',
  InstanceStatus.skipped: 'Skipped',
  InstanceStatus.unknown: 'Unknown',
  InstanceStatus.ready: 'Ready',
};

InstanceTarget _$InstanceTargetFromJson(Map<String, dynamic> json) {
  return InstanceTarget(
    deploymentId: json['deploymentId'] as String,
    instanceLabel:
        _$enumDecodeNullable(_$TargetLabelEnumMap, json['instanceLabel']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    lifecycleEvents: (json['lifecycleEvents'] as List)
        ?.map((e) => e == null
            ? null
            : LifecycleEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$TargetStatusEnumMap, json['status']),
    targetArn: json['targetArn'] as String,
    targetId: json['targetId'] as String,
  );
}

LambdaFunctionInfo _$LambdaFunctionInfoFromJson(Map<String, dynamic> json) {
  return LambdaFunctionInfo(
    currentVersion: json['currentVersion'] as String,
    functionAlias: json['functionAlias'] as String,
    functionName: json['functionName'] as String,
    targetVersion: json['targetVersion'] as String,
    targetVersionWeight: (json['targetVersionWeight'] as num)?.toDouble(),
  );
}

LambdaTarget _$LambdaTargetFromJson(Map<String, dynamic> json) {
  return LambdaTarget(
    deploymentId: json['deploymentId'] as String,
    lambdaFunctionInfo: json['lambdaFunctionInfo'] == null
        ? null
        : LambdaFunctionInfo.fromJson(
            json['lambdaFunctionInfo'] as Map<String, dynamic>),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    lifecycleEvents: (json['lifecycleEvents'] as List)
        ?.map((e) => e == null
            ? null
            : LifecycleEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$TargetStatusEnumMap, json['status']),
    targetArn: json['targetArn'] as String,
    targetId: json['targetId'] as String,
  );
}

LastDeploymentInfo _$LastDeploymentInfoFromJson(Map<String, dynamic> json) {
  return LastDeploymentInfo(
    createTime: const UnixDateTimeConverter().fromJson(json['createTime']),
    deploymentId: json['deploymentId'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    status: _$enumDecodeNullable(_$DeploymentStatusEnumMap, json['status']),
  );
}

LifecycleEvent _$LifecycleEventFromJson(Map<String, dynamic> json) {
  return LifecycleEvent(
    diagnostics: json['diagnostics'] == null
        ? null
        : Diagnostics.fromJson(json['diagnostics'] as Map<String, dynamic>),
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    lifecycleEventName: json['lifecycleEventName'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    status: _$enumDecodeNullable(_$LifecycleEventStatusEnumMap, json['status']),
  );
}

const _$LifecycleEventStatusEnumMap = {
  LifecycleEventStatus.pending: 'Pending',
  LifecycleEventStatus.inProgress: 'InProgress',
  LifecycleEventStatus.succeeded: 'Succeeded',
  LifecycleEventStatus.failed: 'Failed',
  LifecycleEventStatus.skipped: 'Skipped',
  LifecycleEventStatus.unknown: 'Unknown',
};

ListApplicationRevisionsOutput _$ListApplicationRevisionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListApplicationRevisionsOutput(
    nextToken: json['nextToken'] as String,
    revisions: (json['revisions'] as List)
        ?.map((e) => e == null
            ? null
            : RevisionLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListApplicationsOutput _$ListApplicationsOutputFromJson(
    Map<String, dynamic> json) {
  return ListApplicationsOutput(
    applications:
        (json['applications'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDeploymentConfigsOutput _$ListDeploymentConfigsOutputFromJson(
    Map<String, dynamic> json) {
  return ListDeploymentConfigsOutput(
    deploymentConfigsList: (json['deploymentConfigsList'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDeploymentGroupsOutput _$ListDeploymentGroupsOutputFromJson(
    Map<String, dynamic> json) {
  return ListDeploymentGroupsOutput(
    applicationName: json['applicationName'] as String,
    deploymentGroups:
        (json['deploymentGroups'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDeploymentInstancesOutput _$ListDeploymentInstancesOutputFromJson(
    Map<String, dynamic> json) {
  return ListDeploymentInstancesOutput(
    instancesList:
        (json['instancesList'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDeploymentTargetsOutput _$ListDeploymentTargetsOutputFromJson(
    Map<String, dynamic> json) {
  return ListDeploymentTargetsOutput(
    nextToken: json['nextToken'] as String,
    targetIds: (json['targetIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListDeploymentsOutput _$ListDeploymentsOutputFromJson(
    Map<String, dynamic> json) {
  return ListDeploymentsOutput(
    deployments:
        (json['deployments'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListGitHubAccountTokenNamesOutput _$ListGitHubAccountTokenNamesOutputFromJson(
    Map<String, dynamic> json) {
  return ListGitHubAccountTokenNamesOutput(
    nextToken: json['nextToken'] as String,
    tokenNameList:
        (json['tokenNameList'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListOnPremisesInstancesOutput _$ListOnPremisesInstancesOutputFromJson(
    Map<String, dynamic> json) {
  return ListOnPremisesInstancesOutput(
    instanceNames:
        (json['instanceNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LoadBalancerInfo _$LoadBalancerInfoFromJson(Map<String, dynamic> json) {
  return LoadBalancerInfo(
    elbInfoList: (json['elbInfoList'] as List)
        ?.map((e) =>
            e == null ? null : ELBInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    targetGroupInfoList: (json['targetGroupInfoList'] as List)
        ?.map((e) => e == null
            ? null
            : TargetGroupInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    targetGroupPairInfoList: (json['targetGroupPairInfoList'] as List)
        ?.map((e) => e == null
            ? null
            : TargetGroupPairInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LoadBalancerInfoToJson(LoadBalancerInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'elbInfoList', instance.elbInfoList?.map((e) => e?.toJson())?.toList());
  writeNotNull('targetGroupInfoList',
      instance.targetGroupInfoList?.map((e) => e?.toJson())?.toList());
  writeNotNull('targetGroupPairInfoList',
      instance.targetGroupPairInfoList?.map((e) => e?.toJson())?.toList());
  return val;
}

MinimumHealthyHosts _$MinimumHealthyHostsFromJson(Map<String, dynamic> json) {
  return MinimumHealthyHosts(
    type: _$enumDecodeNullable(_$MinimumHealthyHostsTypeEnumMap, json['type']),
    value: json['value'] as int,
  );
}

Map<String, dynamic> _$MinimumHealthyHostsToJson(MinimumHealthyHosts instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$MinimumHealthyHostsTypeEnumMap[instance.type]);
  writeNotNull('value', instance.value);
  return val;
}

const _$MinimumHealthyHostsTypeEnumMap = {
  MinimumHealthyHostsType.hostCount: 'HOST_COUNT',
  MinimumHealthyHostsType.fleetPercent: 'FLEET_PERCENT',
};

OnPremisesTagSet _$OnPremisesTagSetFromJson(Map<String, dynamic> json) {
  return OnPremisesTagSet(
    onPremisesTagSetList: (json['onPremisesTagSetList'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : TagFilter.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$OnPremisesTagSetToJson(OnPremisesTagSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'onPremisesTagSetList',
      instance.onPremisesTagSetList
          ?.map((e) => e?.map((e) => e?.toJson())?.toList())
          ?.toList());
  return val;
}

PutLifecycleEventHookExecutionStatusOutput
    _$PutLifecycleEventHookExecutionStatusOutputFromJson(
        Map<String, dynamic> json) {
  return PutLifecycleEventHookExecutionStatusOutput(
    lifecycleEventHookExecutionId:
        json['lifecycleEventHookExecutionId'] as String,
  );
}

RawString _$RawStringFromJson(Map<String, dynamic> json) {
  return RawString(
    content: json['content'] as String,
    sha256: json['sha256'] as String,
  );
}

Map<String, dynamic> _$RawStringToJson(RawString instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('sha256', instance.sha256);
  return val;
}

RevisionInfo _$RevisionInfoFromJson(Map<String, dynamic> json) {
  return RevisionInfo(
    genericRevisionInfo: json['genericRevisionInfo'] == null
        ? null
        : GenericRevisionInfo.fromJson(
            json['genericRevisionInfo'] as Map<String, dynamic>),
    revisionLocation: json['revisionLocation'] == null
        ? null
        : RevisionLocation.fromJson(
            json['revisionLocation'] as Map<String, dynamic>),
  );
}

RevisionLocation _$RevisionLocationFromJson(Map<String, dynamic> json) {
  return RevisionLocation(
    appSpecContent: json['appSpecContent'] == null
        ? null
        : AppSpecContent.fromJson(
            json['appSpecContent'] as Map<String, dynamic>),
    gitHubLocation: json['gitHubLocation'] == null
        ? null
        : GitHubLocation.fromJson(
            json['gitHubLocation'] as Map<String, dynamic>),
    revisionType: _$enumDecodeNullable(
        _$RevisionLocationTypeEnumMap, json['revisionType']),
    s3Location: json['s3Location'] == null
        ? null
        : S3Location.fromJson(json['s3Location'] as Map<String, dynamic>),
    string: json['string'] == null
        ? null
        : RawString.fromJson(json['string'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RevisionLocationToJson(RevisionLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appSpecContent', instance.appSpecContent?.toJson());
  writeNotNull('gitHubLocation', instance.gitHubLocation?.toJson());
  writeNotNull(
      'revisionType', _$RevisionLocationTypeEnumMap[instance.revisionType]);
  writeNotNull('s3Location', instance.s3Location?.toJson());
  writeNotNull('string', instance.string?.toJson());
  return val;
}

const _$RevisionLocationTypeEnumMap = {
  RevisionLocationType.s3: 'S3',
  RevisionLocationType.gitHub: 'GitHub',
  RevisionLocationType.string: 'String',
  RevisionLocationType.appSpecContent: 'AppSpecContent',
};

RollbackInfo _$RollbackInfoFromJson(Map<String, dynamic> json) {
  return RollbackInfo(
    rollbackDeploymentId: json['rollbackDeploymentId'] as String,
    rollbackMessage: json['rollbackMessage'] as String,
    rollbackTriggeringDeploymentId:
        json['rollbackTriggeringDeploymentId'] as String,
  );
}

S3Location _$S3LocationFromJson(Map<String, dynamic> json) {
  return S3Location(
    bucket: json['bucket'] as String,
    bundleType: _$enumDecodeNullable(_$BundleTypeEnumMap, json['bundleType']),
    eTag: json['eTag'] as String,
    key: json['key'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$S3LocationToJson(S3Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucket', instance.bucket);
  writeNotNull('bundleType', _$BundleTypeEnumMap[instance.bundleType]);
  writeNotNull('eTag', instance.eTag);
  writeNotNull('key', instance.key);
  writeNotNull('version', instance.version);
  return val;
}

const _$BundleTypeEnumMap = {
  BundleType.tar: 'tar',
  BundleType.tgz: 'tgz',
  BundleType.zip: 'zip',
  BundleType.yaml: 'YAML',
  BundleType.json: 'JSON',
};

StopDeploymentOutput _$StopDeploymentOutputFromJson(Map<String, dynamic> json) {
  return StopDeploymentOutput(
    status: _$enumDecodeNullable(_$StopStatusEnumMap, json['status']),
    statusMessage: json['statusMessage'] as String,
  );
}

const _$StopStatusEnumMap = {
  StopStatus.pending: 'Pending',
  StopStatus.succeeded: 'Succeeded',
};

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

TagFilter _$TagFilterFromJson(Map<String, dynamic> json) {
  return TagFilter(
    key: json['Key'] as String,
    type: _$enumDecodeNullable(_$TagFilterTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagFilterToJson(TagFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Type', _$TagFilterTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$TagFilterTypeEnumMap = {
  TagFilterType.keyOnly: 'KEY_ONLY',
  TagFilterType.valueOnly: 'VALUE_ONLY',
  TagFilterType.keyAndValue: 'KEY_AND_VALUE',
};

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

TargetGroupInfo _$TargetGroupInfoFromJson(Map<String, dynamic> json) {
  return TargetGroupInfo(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TargetGroupInfoToJson(TargetGroupInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

TargetGroupPairInfo _$TargetGroupPairInfoFromJson(Map<String, dynamic> json) {
  return TargetGroupPairInfo(
    prodTrafficRoute: json['prodTrafficRoute'] == null
        ? null
        : TrafficRoute.fromJson(
            json['prodTrafficRoute'] as Map<String, dynamic>),
    targetGroups: (json['targetGroups'] as List)
        ?.map((e) => e == null
            ? null
            : TargetGroupInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    testTrafficRoute: json['testTrafficRoute'] == null
        ? null
        : TrafficRoute.fromJson(
            json['testTrafficRoute'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TargetGroupPairInfoToJson(TargetGroupPairInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prodTrafficRoute', instance.prodTrafficRoute?.toJson());
  writeNotNull(
      'targetGroups', instance.targetGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('testTrafficRoute', instance.testTrafficRoute?.toJson());
  return val;
}

TargetInstances _$TargetInstancesFromJson(Map<String, dynamic> json) {
  return TargetInstances(
    autoScalingGroups:
        (json['autoScalingGroups'] as List)?.map((e) => e as String)?.toList(),
    ec2TagSet: json['ec2TagSet'] == null
        ? null
        : EC2TagSet.fromJson(json['ec2TagSet'] as Map<String, dynamic>),
    tagFilters: (json['tagFilters'] as List)
        ?.map((e) =>
            e == null ? null : EC2TagFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TargetInstancesToJson(TargetInstances instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('autoScalingGroups', instance.autoScalingGroups);
  writeNotNull('ec2TagSet', instance.ec2TagSet?.toJson());
  writeNotNull(
      'tagFilters', instance.tagFilters?.map((e) => e?.toJson())?.toList());
  return val;
}

TimeBasedCanary _$TimeBasedCanaryFromJson(Map<String, dynamic> json) {
  return TimeBasedCanary(
    canaryInterval: json['canaryInterval'] as int,
    canaryPercentage: json['canaryPercentage'] as int,
  );
}

Map<String, dynamic> _$TimeBasedCanaryToJson(TimeBasedCanary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('canaryInterval', instance.canaryInterval);
  writeNotNull('canaryPercentage', instance.canaryPercentage);
  return val;
}

TimeBasedLinear _$TimeBasedLinearFromJson(Map<String, dynamic> json) {
  return TimeBasedLinear(
    linearInterval: json['linearInterval'] as int,
    linearPercentage: json['linearPercentage'] as int,
  );
}

Map<String, dynamic> _$TimeBasedLinearToJson(TimeBasedLinear instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('linearInterval', instance.linearInterval);
  writeNotNull('linearPercentage', instance.linearPercentage);
  return val;
}

Map<String, dynamic> _$TimeRangeToJson(TimeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('end', const UnixDateTimeConverter().toJson(instance.end));
  writeNotNull('start', const UnixDateTimeConverter().toJson(instance.start));
  return val;
}

TrafficRoute _$TrafficRouteFromJson(Map<String, dynamic> json) {
  return TrafficRoute(
    listenerArns:
        (json['listenerArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TrafficRouteToJson(TrafficRoute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('listenerArns', instance.listenerArns);
  return val;
}

TrafficRoutingConfig _$TrafficRoutingConfigFromJson(Map<String, dynamic> json) {
  return TrafficRoutingConfig(
    timeBasedCanary: json['timeBasedCanary'] == null
        ? null
        : TimeBasedCanary.fromJson(
            json['timeBasedCanary'] as Map<String, dynamic>),
    timeBasedLinear: json['timeBasedLinear'] == null
        ? null
        : TimeBasedLinear.fromJson(
            json['timeBasedLinear'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$TrafficRoutingTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$TrafficRoutingConfigToJson(
    TrafficRoutingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timeBasedCanary', instance.timeBasedCanary?.toJson());
  writeNotNull('timeBasedLinear', instance.timeBasedLinear?.toJson());
  writeNotNull('type', _$TrafficRoutingTypeEnumMap[instance.type]);
  return val;
}

const _$TrafficRoutingTypeEnumMap = {
  TrafficRoutingType.timeBasedCanary: 'TimeBasedCanary',
  TrafficRoutingType.timeBasedLinear: 'TimeBasedLinear',
  TrafficRoutingType.allAtOnce: 'AllAtOnce',
};

TriggerConfig _$TriggerConfigFromJson(Map<String, dynamic> json) {
  return TriggerConfig(
    triggerEvents: (json['triggerEvents'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TriggerEventTypeEnumMap, e))
        ?.toList(),
    triggerName: json['triggerName'] as String,
    triggerTargetArn: json['triggerTargetArn'] as String,
  );
}

Map<String, dynamic> _$TriggerConfigToJson(TriggerConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'triggerEvents',
      instance.triggerEvents
          ?.map((e) => _$TriggerEventTypeEnumMap[e])
          ?.toList());
  writeNotNull('triggerName', instance.triggerName);
  writeNotNull('triggerTargetArn', instance.triggerTargetArn);
  return val;
}

const _$TriggerEventTypeEnumMap = {
  TriggerEventType.deploymentStart: 'DeploymentStart',
  TriggerEventType.deploymentSuccess: 'DeploymentSuccess',
  TriggerEventType.deploymentFailure: 'DeploymentFailure',
  TriggerEventType.deploymentStop: 'DeploymentStop',
  TriggerEventType.deploymentRollback: 'DeploymentRollback',
  TriggerEventType.deploymentReady: 'DeploymentReady',
  TriggerEventType.instanceStart: 'InstanceStart',
  TriggerEventType.instanceSuccess: 'InstanceSuccess',
  TriggerEventType.instanceFailure: 'InstanceFailure',
  TriggerEventType.instanceReady: 'InstanceReady',
};

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
}

UpdateDeploymentGroupOutput _$UpdateDeploymentGroupOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateDeploymentGroupOutput(
    hooksNotCleanedUp: (json['hooksNotCleanedUp'] as List)
        ?.map((e) => e == null
            ? null
            : AutoScalingGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
