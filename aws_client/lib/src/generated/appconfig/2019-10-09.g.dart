// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-10-09.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

Applications _$ApplicationsFromJson(Map<String, dynamic> json) {
  return Applications(
    items: (json['Items'] as List)
        ?.map((e) =>
            e == null ? null : Application.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return Configuration(
    configurationVersion: json['Configuration-Version'] as String,
    content: const Uint8ListConverter().fromJson(json['Content'] as String),
    contentType: json['Content-Type'] as String,
  );
}

ConfigurationProfile _$ConfigurationProfileFromJson(Map<String, dynamic> json) {
  return ConfigurationProfile(
    applicationId: json['ApplicationId'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    locationUri: json['LocationUri'] as String,
    name: json['Name'] as String,
    retrievalRoleArn: json['RetrievalRoleArn'] as String,
    validators: (json['Validators'] as List)
        ?.map((e) =>
            e == null ? null : Validator.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ConfigurationProfileSummary _$ConfigurationProfileSummaryFromJson(
    Map<String, dynamic> json) {
  return ConfigurationProfileSummary(
    applicationId: json['ApplicationId'] as String,
    id: json['Id'] as String,
    locationUri: json['LocationUri'] as String,
    name: json['Name'] as String,
    validatorTypes: (json['ValidatorTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ValidatorTypeEnumMap, e))
        ?.toList(),
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

const _$ValidatorTypeEnumMap = {
  ValidatorType.jsonSchema: 'JSON_SCHEMA',
  ValidatorType.lambda: 'LAMBDA',
};

ConfigurationProfiles _$ConfigurationProfilesFromJson(
    Map<String, dynamic> json) {
  return ConfigurationProfiles(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationProfileSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Deployment _$DeploymentFromJson(Map<String, dynamic> json) {
  return Deployment(
    applicationId: json['ApplicationId'] as String,
    completedAt: const IsoDateTimeConverter().fromJson(json['CompletedAt']),
    configurationLocationUri: json['ConfigurationLocationUri'] as String,
    configurationName: json['ConfigurationName'] as String,
    configurationProfileId: json['ConfigurationProfileId'] as String,
    configurationVersion: json['ConfigurationVersion'] as String,
    deploymentDurationInMinutes: json['DeploymentDurationInMinutes'] as int,
    deploymentNumber: json['DeploymentNumber'] as int,
    deploymentStrategyId: json['DeploymentStrategyId'] as String,
    description: json['Description'] as String,
    environmentId: json['EnvironmentId'] as String,
    eventLog: (json['EventLog'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    finalBakeTimeInMinutes: json['FinalBakeTimeInMinutes'] as int,
    growthFactor: (json['GrowthFactor'] as num)?.toDouble(),
    growthType: _$enumDecodeNullable(_$GrowthTypeEnumMap, json['GrowthType']),
    percentageComplete: (json['PercentageComplete'] as num)?.toDouble(),
    startedAt: const IsoDateTimeConverter().fromJson(json['StartedAt']),
    state: _$enumDecodeNullable(_$DeploymentStateEnumMap, json['State']),
  );
}

const _$GrowthTypeEnumMap = {
  GrowthType.linear: 'LINEAR',
  GrowthType.exponential: 'EXPONENTIAL',
};

const _$DeploymentStateEnumMap = {
  DeploymentState.baking: 'BAKING',
  DeploymentState.validating: 'VALIDATING',
  DeploymentState.deploying: 'DEPLOYING',
  DeploymentState.complete: 'COMPLETE',
  DeploymentState.rollingBack: 'ROLLING_BACK',
  DeploymentState.rolledBack: 'ROLLED_BACK',
};

DeploymentEvent _$DeploymentEventFromJson(Map<String, dynamic> json) {
  return DeploymentEvent(
    description: json['Description'] as String,
    eventType:
        _$enumDecodeNullable(_$DeploymentEventTypeEnumMap, json['EventType']),
    occurredAt: const IsoDateTimeConverter().fromJson(json['OccurredAt']),
    triggeredBy:
        _$enumDecodeNullable(_$TriggeredByEnumMap, json['TriggeredBy']),
  );
}

const _$DeploymentEventTypeEnumMap = {
  DeploymentEventType.percentageUpdated: 'PERCENTAGE_UPDATED',
  DeploymentEventType.rollbackStarted: 'ROLLBACK_STARTED',
  DeploymentEventType.rollbackCompleted: 'ROLLBACK_COMPLETED',
  DeploymentEventType.bakeTimeStarted: 'BAKE_TIME_STARTED',
  DeploymentEventType.deploymentStarted: 'DEPLOYMENT_STARTED',
  DeploymentEventType.deploymentCompleted: 'DEPLOYMENT_COMPLETED',
};

const _$TriggeredByEnumMap = {
  TriggeredBy.user: 'USER',
  TriggeredBy.appconfig: 'APPCONFIG',
  TriggeredBy.cloudwatchAlarm: 'CLOUDWATCH_ALARM',
  TriggeredBy.internalError: 'INTERNAL_ERROR',
};

DeploymentStrategies _$DeploymentStrategiesFromJson(Map<String, dynamic> json) {
  return DeploymentStrategies(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentStrategy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DeploymentStrategy _$DeploymentStrategyFromJson(Map<String, dynamic> json) {
  return DeploymentStrategy(
    deploymentDurationInMinutes: json['DeploymentDurationInMinutes'] as int,
    description: json['Description'] as String,
    finalBakeTimeInMinutes: json['FinalBakeTimeInMinutes'] as int,
    growthFactor: (json['GrowthFactor'] as num)?.toDouble(),
    growthType: _$enumDecodeNullable(_$GrowthTypeEnumMap, json['GrowthType']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    replicateTo:
        _$enumDecodeNullable(_$ReplicateToEnumMap, json['ReplicateTo']),
  );
}

const _$ReplicateToEnumMap = {
  ReplicateTo.none: 'NONE',
  ReplicateTo.ssmDocument: 'SSM_DOCUMENT',
};

DeploymentSummary _$DeploymentSummaryFromJson(Map<String, dynamic> json) {
  return DeploymentSummary(
    completedAt: const IsoDateTimeConverter().fromJson(json['CompletedAt']),
    configurationName: json['ConfigurationName'] as String,
    configurationVersion: json['ConfigurationVersion'] as String,
    deploymentDurationInMinutes: json['DeploymentDurationInMinutes'] as int,
    deploymentNumber: json['DeploymentNumber'] as int,
    finalBakeTimeInMinutes: json['FinalBakeTimeInMinutes'] as int,
    growthFactor: (json['GrowthFactor'] as num)?.toDouble(),
    growthType: _$enumDecodeNullable(_$GrowthTypeEnumMap, json['GrowthType']),
    percentageComplete: (json['PercentageComplete'] as num)?.toDouble(),
    startedAt: const IsoDateTimeConverter().fromJson(json['StartedAt']),
    state: _$enumDecodeNullable(_$DeploymentStateEnumMap, json['State']),
  );
}

Deployments _$DeploymentsFromJson(Map<String, dynamic> json) {
  return Deployments(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : DeploymentSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Environment _$EnvironmentFromJson(Map<String, dynamic> json) {
  return Environment(
    applicationId: json['ApplicationId'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    monitors: (json['Monitors'] as List)
        ?.map((e) =>
            e == null ? null : Monitor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$EnvironmentStateEnumMap, json['State']),
  );
}

const _$EnvironmentStateEnumMap = {
  EnvironmentState.readyForDeployment: 'READY_FOR_DEPLOYMENT',
  EnvironmentState.deploying: 'DEPLOYING',
  EnvironmentState.rollingBack: 'ROLLING_BACK',
  EnvironmentState.rolledBack: 'ROLLED_BACK',
};

Environments _$EnvironmentsFromJson(Map<String, dynamic> json) {
  return Environments(
    items: (json['Items'] as List)
        ?.map((e) =>
            e == null ? null : Environment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

HostedConfigurationVersion _$HostedConfigurationVersionFromJson(
    Map<String, dynamic> json) {
  return HostedConfigurationVersion(
    applicationId: json['Application-Id'] as String,
    configurationProfileId: json['Configuration-Profile-Id'] as String,
    content: const Uint8ListConverter().fromJson(json['Content'] as String),
    contentType: json['Content-Type'] as String,
    description: json['Description'] as String,
    versionNumber: json['Version-Number'] as int,
  );
}

HostedConfigurationVersionSummary _$HostedConfigurationVersionSummaryFromJson(
    Map<String, dynamic> json) {
  return HostedConfigurationVersionSummary(
    applicationId: json['ApplicationId'] as String,
    configurationProfileId: json['ConfigurationProfileId'] as String,
    contentType: json['ContentType'] as String,
    description: json['Description'] as String,
    versionNumber: json['VersionNumber'] as int,
  );
}

HostedConfigurationVersions _$HostedConfigurationVersionsFromJson(
    Map<String, dynamic> json) {
  return HostedConfigurationVersions(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : HostedConfigurationVersionSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Monitor _$MonitorFromJson(Map<String, dynamic> json) {
  return Monitor(
    alarmArn: json['AlarmArn'] as String,
    alarmRoleArn: json['AlarmRoleArn'] as String,
  );
}

Map<String, dynamic> _$MonitorToJson(Monitor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlarmArn', instance.alarmArn);
  writeNotNull('AlarmRoleArn', instance.alarmRoleArn);
  return val;
}

ResourceTags _$ResourceTagsFromJson(Map<String, dynamic> json) {
  return ResourceTags(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Validator _$ValidatorFromJson(Map<String, dynamic> json) {
  return Validator(
    content: json['Content'] as String,
    type: _$enumDecodeNullable(_$ValidatorTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$ValidatorToJson(Validator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Content', instance.content);
  writeNotNull('Type', _$ValidatorTypeEnumMap[instance.type]);
  return val;
}
