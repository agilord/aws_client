// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-07-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCliTokenResponse _$CreateCliTokenResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCliTokenResponse(
    cliToken: json['CliToken'] as String,
    webServerHostname: json['WebServerHostname'] as String,
  );
}

CreateEnvironmentOutput _$CreateEnvironmentOutputFromJson(
    Map<String, dynamic> json) {
  return CreateEnvironmentOutput(
    arn: json['Arn'] as String,
  );
}

CreateWebLoginTokenResponse _$CreateWebLoginTokenResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWebLoginTokenResponse(
    webServerHostname: json['WebServerHostname'] as String,
    webToken: json['WebToken'] as String,
  );
}

DeleteEnvironmentOutput _$DeleteEnvironmentOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteEnvironmentOutput();
}

Map<String, dynamic> _$DimensionToJson(Dimension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

Environment _$EnvironmentFromJson(Map<String, dynamic> json) {
  return Environment(
    airflowConfigurationOptions:
        (json['AirflowConfigurationOptions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    airflowVersion: json['AirflowVersion'] as String,
    arn: json['Arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    dagS3Path: json['DagS3Path'] as String,
    environmentClass: json['EnvironmentClass'] as String,
    executionRoleArn: json['ExecutionRoleArn'] as String,
    kmsKey: json['KmsKey'] as String,
    lastUpdate: json['LastUpdate'] == null
        ? null
        : LastUpdate.fromJson(json['LastUpdate'] as Map<String, dynamic>),
    loggingConfiguration: json['LoggingConfiguration'] == null
        ? null
        : LoggingConfiguration.fromJson(
            json['LoggingConfiguration'] as Map<String, dynamic>),
    maxWorkers: json['MaxWorkers'] as int,
    name: json['Name'] as String,
    networkConfiguration: json['NetworkConfiguration'] == null
        ? null
        : NetworkConfiguration.fromJson(
            json['NetworkConfiguration'] as Map<String, dynamic>),
    pluginsS3ObjectVersion: json['PluginsS3ObjectVersion'] as String,
    pluginsS3Path: json['PluginsS3Path'] as String,
    requirementsS3ObjectVersion: json['RequirementsS3ObjectVersion'] as String,
    requirementsS3Path: json['RequirementsS3Path'] as String,
    serviceRoleArn: json['ServiceRoleArn'] as String,
    sourceBucketArn: json['SourceBucketArn'] as String,
    status: _$enumDecodeNullable(_$EnvironmentStatusEnumMap, json['Status']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    webserverAccessMode: _$enumDecodeNullable(
        _$WebserverAccessModeEnumMap, json['WebserverAccessMode']),
    webserverUrl: json['WebserverUrl'] as String,
    weeklyMaintenanceWindowStart:
        json['WeeklyMaintenanceWindowStart'] as String,
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

const _$EnvironmentStatusEnumMap = {
  EnvironmentStatus.creating: 'CREATING',
  EnvironmentStatus.createFailed: 'CREATE_FAILED',
  EnvironmentStatus.available: 'AVAILABLE',
  EnvironmentStatus.updating: 'UPDATING',
  EnvironmentStatus.deleting: 'DELETING',
  EnvironmentStatus.deleted: 'DELETED',
};

const _$WebserverAccessModeEnumMap = {
  WebserverAccessMode.privateOnly: 'PRIVATE_ONLY',
  WebserverAccessMode.publicOnly: 'PUBLIC_ONLY',
};

GetEnvironmentOutput _$GetEnvironmentOutputFromJson(Map<String, dynamic> json) {
  return GetEnvironmentOutput(
    environment: json['Environment'] == null
        ? null
        : Environment.fromJson(json['Environment'] as Map<String, dynamic>),
  );
}

LastUpdate _$LastUpdateFromJson(Map<String, dynamic> json) {
  return LastUpdate(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    error: json['Error'] == null
        ? null
        : UpdateError.fromJson(json['Error'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$UpdateStatusEnumMap, json['Status']),
  );
}

const _$UpdateStatusEnumMap = {
  UpdateStatus.success: 'SUCCESS',
  UpdateStatus.pending: 'PENDING',
  UpdateStatus.failed: 'FAILED',
};

ListEnvironmentsOutput _$ListEnvironmentsOutputFromJson(
    Map<String, dynamic> json) {
  return ListEnvironmentsOutput(
    environments:
        (json['Environments'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

LoggingConfiguration _$LoggingConfigurationFromJson(Map<String, dynamic> json) {
  return LoggingConfiguration(
    dagProcessingLogs: json['DagProcessingLogs'] == null
        ? null
        : ModuleLoggingConfiguration.fromJson(
            json['DagProcessingLogs'] as Map<String, dynamic>),
    schedulerLogs: json['SchedulerLogs'] == null
        ? null
        : ModuleLoggingConfiguration.fromJson(
            json['SchedulerLogs'] as Map<String, dynamic>),
    taskLogs: json['TaskLogs'] == null
        ? null
        : ModuleLoggingConfiguration.fromJson(
            json['TaskLogs'] as Map<String, dynamic>),
    webserverLogs: json['WebserverLogs'] == null
        ? null
        : ModuleLoggingConfiguration.fromJson(
            json['WebserverLogs'] as Map<String, dynamic>),
    workerLogs: json['WorkerLogs'] == null
        ? null
        : ModuleLoggingConfiguration.fromJson(
            json['WorkerLogs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoggingConfigurationInputToJson(
    LoggingConfigurationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DagProcessingLogs', instance.dagProcessingLogs?.toJson());
  writeNotNull('SchedulerLogs', instance.schedulerLogs?.toJson());
  writeNotNull('TaskLogs', instance.taskLogs?.toJson());
  writeNotNull('WebserverLogs', instance.webserverLogs?.toJson());
  writeNotNull('WorkerLogs', instance.workerLogs?.toJson());
  return val;
}

Map<String, dynamic> _$MetricDatumToJson(MetricDatum instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MetricName', instance.metricName);
  writeNotNull(
      'Timestamp', const UnixDateTimeConverter().toJson(instance.timestamp));
  writeNotNull(
      'Dimensions', instance.dimensions?.map((e) => e?.toJson())?.toList());
  writeNotNull('StatisticValues', instance.statisticValues?.toJson());
  writeNotNull('Unit', _$UnitEnumMap[instance.unit]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$UnitEnumMap = {
  Unit.seconds: 'Seconds',
  Unit.microseconds: 'Microseconds',
  Unit.milliseconds: 'Milliseconds',
  Unit.bytes: 'Bytes',
  Unit.kilobytes: 'Kilobytes',
  Unit.megabytes: 'Megabytes',
  Unit.gigabytes: 'Gigabytes',
  Unit.terabytes: 'Terabytes',
  Unit.bits: 'Bits',
  Unit.kilobits: 'Kilobits',
  Unit.megabits: 'Megabits',
  Unit.gigabits: 'Gigabits',
  Unit.terabits: 'Terabits',
  Unit.percent: 'Percent',
  Unit.count: 'Count',
  Unit.bytesSecond: 'Bytes/Second',
  Unit.kilobytesSecond: 'Kilobytes/Second',
  Unit.megabytesSecond: 'Megabytes/Second',
  Unit.gigabytesSecond: 'Gigabytes/Second',
  Unit.terabytesSecond: 'Terabytes/Second',
  Unit.bitsSecond: 'Bits/Second',
  Unit.kilobitsSecond: 'Kilobits/Second',
  Unit.megabitsSecond: 'Megabits/Second',
  Unit.gigabitsSecond: 'Gigabits/Second',
  Unit.terabitsSecond: 'Terabits/Second',
  Unit.countSecond: 'Count/Second',
  Unit.none: 'None',
};

ModuleLoggingConfiguration _$ModuleLoggingConfigurationFromJson(
    Map<String, dynamic> json) {
  return ModuleLoggingConfiguration(
    cloudWatchLogGroupArn: json['CloudWatchLogGroupArn'] as String,
    enabled: json['Enabled'] as bool,
    logLevel: _$enumDecodeNullable(_$LoggingLevelEnumMap, json['LogLevel']),
  );
}

const _$LoggingLevelEnumMap = {
  LoggingLevel.critical: 'CRITICAL',
  LoggingLevel.error: 'ERROR',
  LoggingLevel.warning: 'WARNING',
  LoggingLevel.info: 'INFO',
  LoggingLevel.debug: 'DEBUG',
};

Map<String, dynamic> _$ModuleLoggingConfigurationInputToJson(
    ModuleLoggingConfigurationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('LogLevel', _$LoggingLevelEnumMap[instance.logLevel]);
  return val;
}

NetworkConfiguration _$NetworkConfigurationFromJson(Map<String, dynamic> json) {
  return NetworkConfiguration(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
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

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  return val;
}

PublishMetricsOutput _$PublishMetricsOutputFromJson(Map<String, dynamic> json) {
  return PublishMetricsOutput();
}

Map<String, dynamic> _$StatisticSetToJson(StatisticSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Maximum', instance.maximum);
  writeNotNull('Minimum', instance.minimum);
  writeNotNull('SampleCount', instance.sampleCount);
  writeNotNull('Sum', instance.sum);
  return val;
}

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
}

UpdateEnvironmentOutput _$UpdateEnvironmentOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateEnvironmentOutput(
    arn: json['Arn'] as String,
  );
}

UpdateError _$UpdateErrorFromJson(Map<String, dynamic> json) {
  return UpdateError(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
  );
}

Map<String, dynamic> _$UpdateNetworkConfigurationInputToJson(
    UpdateNetworkConfigurationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  return val;
}
