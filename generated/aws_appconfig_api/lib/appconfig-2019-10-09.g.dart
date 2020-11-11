// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appconfig-2019-10-09.dart';

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
    validatorTypes:
        (json['ValidatorTypes'] as List)?.map((e) => e as String)?.toList(),
  );
}

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

Map<String, dynamic> _$CreateApplicationRequestToJson(
    CreateApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Description', instance.description);
  writeNotNull('Tags', instance.tags);
  return val;
}

Map<String, dynamic> _$CreateConfigurationProfileRequestToJson(
    CreateConfigurationProfileRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LocationUri', instance.locationUri);
  writeNotNull('Name', instance.name);
  writeNotNull('RetrievalRoleArn', instance.retrievalRoleArn);
  writeNotNull('Description', instance.description);
  writeNotNull('Tags', instance.tags);
  writeNotNull(
      'Validators', instance.validators?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$CreateDeploymentStrategyRequestToJson(
    CreateDeploymentStrategyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DeploymentDurationInMinutes', instance.deploymentDurationInMinutes);
  writeNotNull('GrowthFactor', instance.growthFactor);
  writeNotNull('Name', instance.name);
  writeNotNull('ReplicateTo', _$ReplicateToEnumMap[instance.replicateTo]);
  writeNotNull('Description', instance.description);
  writeNotNull('FinalBakeTimeInMinutes', instance.finalBakeTimeInMinutes);
  writeNotNull('GrowthType', _$GrowthTypeEnumMap[instance.growthType]);
  writeNotNull('Tags', instance.tags);
  return val;
}

const _$ReplicateToEnumMap = {
  ReplicateTo.none: 'NONE',
  ReplicateTo.ssmDocument: 'SSM_DOCUMENT',
};

const _$GrowthTypeEnumMap = {
  GrowthType.linear: 'LINEAR',
  GrowthType.exponential: 'EXPONENTIAL',
};

Map<String, dynamic> _$CreateEnvironmentRequestToJson(
    CreateEnvironmentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Description', instance.description);
  writeNotNull(
      'Monitors', instance.monitors?.map((e) => e?.toJson())?.toList());
  writeNotNull('Tags', instance.tags);
  return val;
}

Map<String, dynamic> _$DeleteApplicationRequestToJson(
        DeleteApplicationRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteConfigurationProfileRequestToJson(
        DeleteConfigurationProfileRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteDeploymentStrategyRequestToJson(
        DeleteDeploymentStrategyRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteEnvironmentRequestToJson(
        DeleteEnvironmentRequest instance) =>
    <String, dynamic>{};

Deployment _$DeploymentFromJson(Map<String, dynamic> json) {
  return Deployment(
    applicationId: json['ApplicationId'] as String,
    completedAt: iso8601FromJson(json['CompletedAt'] as String),
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
    startedAt: iso8601FromJson(json['StartedAt'] as String),
    state: _$enumDecodeNullable(_$DeploymentStateEnumMap, json['State']),
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
    occurredAt: iso8601FromJson(json['OccurredAt'] as String),
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

DeploymentSummary _$DeploymentSummaryFromJson(Map<String, dynamic> json) {
  return DeploymentSummary(
    completedAt: iso8601FromJson(json['CompletedAt'] as String),
    configurationName: json['ConfigurationName'] as String,
    configurationVersion: json['ConfigurationVersion'] as String,
    deploymentDurationInMinutes: json['DeploymentDurationInMinutes'] as int,
    deploymentNumber: json['DeploymentNumber'] as int,
    finalBakeTimeInMinutes: json['FinalBakeTimeInMinutes'] as int,
    growthFactor: (json['GrowthFactor'] as num)?.toDouble(),
    growthType: _$enumDecodeNullable(_$GrowthTypeEnumMap, json['GrowthType']),
    percentageComplete: (json['PercentageComplete'] as num)?.toDouble(),
    startedAt: iso8601FromJson(json['StartedAt'] as String),
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

Map<String, dynamic> _$StartDeploymentRequestToJson(
    StartDeploymentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationProfileId', instance.configurationProfileId);
  writeNotNull('ConfigurationVersion', instance.configurationVersion);
  writeNotNull('DeploymentStrategyId', instance.deploymentStrategyId);
  writeNotNull('Description', instance.description);
  writeNotNull('Tags', instance.tags);
  return val;
}

Map<String, dynamic> _$StopDeploymentRequestToJson(
        StopDeploymentRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tags', instance.tags);
  return val;
}

Map<String, dynamic> _$UntagResourceRequestToJson(
        UntagResourceRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$UpdateApplicationRequestToJson(
    UpdateApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$UpdateConfigurationProfileRequestToJson(
    UpdateConfigurationProfileRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  writeNotNull('RetrievalRoleArn', instance.retrievalRoleArn);
  writeNotNull(
      'Validators', instance.validators?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$UpdateDeploymentStrategyRequestToJson(
    UpdateDeploymentStrategyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DeploymentDurationInMinutes', instance.deploymentDurationInMinutes);
  writeNotNull('Description', instance.description);
  writeNotNull('FinalBakeTimeInMinutes', instance.finalBakeTimeInMinutes);
  writeNotNull('GrowthFactor', instance.growthFactor);
  writeNotNull('GrowthType', _$GrowthTypeEnumMap[instance.growthType]);
  return val;
}

Map<String, dynamic> _$UpdateEnvironmentRequestToJson(
    UpdateEnvironmentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  writeNotNull(
      'Monitors', instance.monitors?.map((e) => e?.toJson())?.toList());
  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$ValidateConfigurationRequestToJson(
        ValidateConfigurationRequest instance) =>
    <String, dynamic>{};

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

const _$ValidatorTypeEnumMap = {
  ValidatorType.jsonSchema: 'JSON_SCHEMA',
  ValidatorType.lambda: 'LAMBDA',
};
