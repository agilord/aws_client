// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mq-2017-11-27.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailabilityZone _$AvailabilityZoneFromJson(Map<String, dynamic> json) {
  return AvailabilityZone(
    name: json['name'] as String,
  );
}

BrokerEngineType _$BrokerEngineTypeFromJson(Map<String, dynamic> json) {
  return BrokerEngineType(
    engineType: _$enumDecodeNullable(_$EngineTypeEnumMap, json['engineType']),
    engineVersions: (json['engineVersions'] as List)
        ?.map((e) => e == null
            ? null
            : EngineVersion.fromJson(e as Map<String, dynamic>))
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

const _$EngineTypeEnumMap = {
  EngineType.activemq: 'ACTIVEMQ',
};

BrokerInstance _$BrokerInstanceFromJson(Map<String, dynamic> json) {
  return BrokerInstance(
    consoleURL: json['consoleURL'] as String,
    endpoints: (json['endpoints'] as List)?.map((e) => e as String)?.toList(),
    ipAddress: json['ipAddress'] as String,
  );
}

BrokerInstanceOption _$BrokerInstanceOptionFromJson(Map<String, dynamic> json) {
  return BrokerInstanceOption(
    availabilityZones: (json['availabilityZones'] as List)
        ?.map((e) => e == null
            ? null
            : AvailabilityZone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    engineType: _$enumDecodeNullable(_$EngineTypeEnumMap, json['engineType']),
    hostInstanceType: json['hostInstanceType'] as String,
    storageType:
        _$enumDecodeNullable(_$BrokerStorageTypeEnumMap, json['storageType']),
    supportedDeploymentModes: (json['supportedDeploymentModes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    supportedEngineVersions: (json['supportedEngineVersions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

const _$BrokerStorageTypeEnumMap = {
  BrokerStorageType.ebs: 'EBS',
  BrokerStorageType.efs: 'EFS',
};

BrokerSummary _$BrokerSummaryFromJson(Map<String, dynamic> json) {
  return BrokerSummary(
    brokerArn: json['brokerArn'] as String,
    brokerId: json['brokerId'] as String,
    brokerName: json['brokerName'] as String,
    brokerState:
        _$enumDecodeNullable(_$BrokerStateEnumMap, json['brokerState']),
    created: iso8601FromJson(json['created'] as String),
    deploymentMode:
        _$enumDecodeNullable(_$DeploymentModeEnumMap, json['deploymentMode']),
    hostInstanceType: json['hostInstanceType'] as String,
  );
}

const _$BrokerStateEnumMap = {
  BrokerState.creationInProgress: 'CREATION_IN_PROGRESS',
  BrokerState.creationFailed: 'CREATION_FAILED',
  BrokerState.deletionInProgress: 'DELETION_IN_PROGRESS',
  BrokerState.running: 'RUNNING',
  BrokerState.rebootInProgress: 'REBOOT_IN_PROGRESS',
};

const _$DeploymentModeEnumMap = {
  DeploymentMode.singleInstance: 'SINGLE_INSTANCE',
  DeploymentMode.activeStandbyMultiAz: 'ACTIVE_STANDBY_MULTI_AZ',
};

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return Configuration(
    arn: json['arn'] as String,
    created: iso8601FromJson(json['created'] as String),
    description: json['description'] as String,
    engineType: _$enumDecodeNullable(_$EngineTypeEnumMap, json['engineType']),
    engineVersion: json['engineVersion'] as String,
    id: json['id'] as String,
    latestRevision: json['latestRevision'] == null
        ? null
        : ConfigurationRevision.fromJson(
            json['latestRevision'] as Map<String, dynamic>),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ConfigurationId _$ConfigurationIdFromJson(Map<String, dynamic> json) {
  return ConfigurationId(
    id: json['id'] as String,
    revision: json['revision'] as int,
  );
}

Map<String, dynamic> _$ConfigurationIdToJson(ConfigurationId instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('revision', instance.revision);
  return val;
}

ConfigurationRevision _$ConfigurationRevisionFromJson(
    Map<String, dynamic> json) {
  return ConfigurationRevision(
    created: iso8601FromJson(json['created'] as String),
    description: json['description'] as String,
    revision: json['revision'] as int,
  );
}

Configurations _$ConfigurationsFromJson(Map<String, dynamic> json) {
  return Configurations(
    current: json['current'] == null
        ? null
        : ConfigurationId.fromJson(json['current'] as Map<String, dynamic>),
    history: (json['history'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationId.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pending: json['pending'] == null
        ? null
        : ConfigurationId.fromJson(json['pending'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateBrokerRequestToJson(CreateBrokerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('autoMinorVersionUpgrade', instance.autoMinorVersionUpgrade);
  writeNotNull('brokerName', instance.brokerName);
  writeNotNull('configuration', instance.configuration?.toJson());
  writeNotNull('creatorRequestId', instance.creatorRequestId);
  writeNotNull(
      'deploymentMode', _$DeploymentModeEnumMap[instance.deploymentMode]);
  writeNotNull('encryptionOptions', instance.encryptionOptions?.toJson());
  writeNotNull('engineType', _$EngineTypeEnumMap[instance.engineType]);
  writeNotNull('engineVersion', instance.engineVersion);
  writeNotNull('hostInstanceType', instance.hostInstanceType);
  writeNotNull('logs', instance.logs?.toJson());
  writeNotNull('maintenanceWindowStartTime',
      instance.maintenanceWindowStartTime?.toJson());
  writeNotNull('publiclyAccessible', instance.publiclyAccessible);
  writeNotNull('securityGroups', instance.securityGroups);
  writeNotNull('storageType', _$BrokerStorageTypeEnumMap[instance.storageType]);
  writeNotNull('subnetIds', instance.subnetIds);
  writeNotNull('tags', instance.tags);
  writeNotNull('users', instance.users?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateBrokerResponse _$CreateBrokerResponseFromJson(Map<String, dynamic> json) {
  return CreateBrokerResponse(
    brokerArn: json['brokerArn'] as String,
    brokerId: json['brokerId'] as String,
  );
}

Map<String, dynamic> _$CreateConfigurationRequestToJson(
    CreateConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('engineType', _$EngineTypeEnumMap[instance.engineType]);
  writeNotNull('engineVersion', instance.engineVersion);
  writeNotNull('name', instance.name);
  writeNotNull('tags', instance.tags);
  return val;
}

CreateConfigurationResponse _$CreateConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConfigurationResponse(
    arn: json['arn'] as String,
    created: iso8601FromJson(json['created'] as String),
    id: json['id'] as String,
    latestRevision: json['latestRevision'] == null
        ? null
        : ConfigurationRevision.fromJson(
            json['latestRevision'] as Map<String, dynamic>),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CreateTagsRequestToJson(CreateTagsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', instance.tags);
  return val;
}

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('consoleAccess', instance.consoleAccess);
  writeNotNull('groups', instance.groups);
  writeNotNull('password', instance.password);
  return val;
}

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse();
}

Map<String, dynamic> _$DeleteBrokerRequestToJson(
        DeleteBrokerRequest instance) =>
    <String, dynamic>{};

DeleteBrokerResponse _$DeleteBrokerResponseFromJson(Map<String, dynamic> json) {
  return DeleteBrokerResponse(
    brokerId: json['brokerId'] as String,
  );
}

Map<String, dynamic> _$DeleteTagsRequestToJson(DeleteTagsRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteUserRequestToJson(DeleteUserRequest instance) =>
    <String, dynamic>{};

DeleteUserResponse _$DeleteUserResponseFromJson(Map<String, dynamic> json) {
  return DeleteUserResponse();
}

DescribeBrokerEngineTypesResponse _$DescribeBrokerEngineTypesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeBrokerEngineTypesResponse(
    brokerEngineTypes: (json['brokerEngineTypes'] as List)
        ?.map((e) => e == null
            ? null
            : BrokerEngineType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    maxResults: json['maxResults'] as int,
    nextToken: json['nextToken'] as String,
  );
}

DescribeBrokerInstanceOptionsResponse
    _$DescribeBrokerInstanceOptionsResponseFromJson(Map<String, dynamic> json) {
  return DescribeBrokerInstanceOptionsResponse(
    brokerInstanceOptions: (json['brokerInstanceOptions'] as List)
        ?.map((e) => e == null
            ? null
            : BrokerInstanceOption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    maxResults: json['maxResults'] as int,
    nextToken: json['nextToken'] as String,
  );
}

DescribeBrokerResponse _$DescribeBrokerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeBrokerResponse(
    autoMinorVersionUpgrade: json['autoMinorVersionUpgrade'] as bool,
    brokerArn: json['brokerArn'] as String,
    brokerId: json['brokerId'] as String,
    brokerInstances: (json['brokerInstances'] as List)
        ?.map((e) => e == null
            ? null
            : BrokerInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    brokerName: json['brokerName'] as String,
    brokerState:
        _$enumDecodeNullable(_$BrokerStateEnumMap, json['brokerState']),
    configurations: json['configurations'] == null
        ? null
        : Configurations.fromJson(
            json['configurations'] as Map<String, dynamic>),
    created: iso8601FromJson(json['created'] as String),
    deploymentMode:
        _$enumDecodeNullable(_$DeploymentModeEnumMap, json['deploymentMode']),
    encryptionOptions: json['encryptionOptions'] == null
        ? null
        : EncryptionOptions.fromJson(
            json['encryptionOptions'] as Map<String, dynamic>),
    engineType: _$enumDecodeNullable(_$EngineTypeEnumMap, json['engineType']),
    engineVersion: json['engineVersion'] as String,
    hostInstanceType: json['hostInstanceType'] as String,
    logs: json['logs'] == null
        ? null
        : LogsSummary.fromJson(json['logs'] as Map<String, dynamic>),
    maintenanceWindowStartTime: json['maintenanceWindowStartTime'] == null
        ? null
        : WeeklyStartTime.fromJson(
            json['maintenanceWindowStartTime'] as Map<String, dynamic>),
    pendingEngineVersion: json['pendingEngineVersion'] as String,
    pendingHostInstanceType: json['pendingHostInstanceType'] as String,
    pendingSecurityGroups: (json['pendingSecurityGroups'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    publiclyAccessible: json['publiclyAccessible'] as bool,
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
    storageType:
        _$enumDecodeNullable(_$BrokerStorageTypeEnumMap, json['storageType']),
    subnetIds: (json['subnetIds'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    users: (json['users'] as List)
        ?.map((e) =>
            e == null ? null : UserSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeConfigurationResponse _$DescribeConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeConfigurationResponse(
    arn: json['arn'] as String,
    created: iso8601FromJson(json['created'] as String),
    description: json['description'] as String,
    engineType: _$enumDecodeNullable(_$EngineTypeEnumMap, json['engineType']),
    engineVersion: json['engineVersion'] as String,
    id: json['id'] as String,
    latestRevision: json['latestRevision'] == null
        ? null
        : ConfigurationRevision.fromJson(
            json['latestRevision'] as Map<String, dynamic>),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribeConfigurationRevisionResponse
    _$DescribeConfigurationRevisionResponseFromJson(Map<String, dynamic> json) {
  return DescribeConfigurationRevisionResponse(
    configurationId: json['configurationId'] as String,
    created: iso8601FromJson(json['created'] as String),
    data: json['data'] as String,
    description: json['description'] as String,
  );
}

DescribeUserResponse _$DescribeUserResponseFromJson(Map<String, dynamic> json) {
  return DescribeUserResponse(
    brokerId: json['brokerId'] as String,
    consoleAccess: json['consoleAccess'] as bool,
    groups: (json['groups'] as List)?.map((e) => e as String)?.toList(),
    pending: json['pending'] == null
        ? null
        : UserPendingChanges.fromJson(json['pending'] as Map<String, dynamic>),
    username: json['username'] as String,
  );
}

EncryptionOptions _$EncryptionOptionsFromJson(Map<String, dynamic> json) {
  return EncryptionOptions(
    useAwsOwnedKey: json['useAwsOwnedKey'] as bool,
    kmsKeyId: json['kmsKeyId'] as String,
  );
}

Map<String, dynamic> _$EncryptionOptionsToJson(EncryptionOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('useAwsOwnedKey', instance.useAwsOwnedKey);
  writeNotNull('kmsKeyId', instance.kmsKeyId);
  return val;
}

EngineVersion _$EngineVersionFromJson(Map<String, dynamic> json) {
  return EngineVersion(
    name: json['name'] as String,
  );
}

ListBrokersResponse _$ListBrokersResponseFromJson(Map<String, dynamic> json) {
  return ListBrokersResponse(
    brokerSummaries: (json['brokerSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : BrokerSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListConfigurationRevisionsResponse _$ListConfigurationRevisionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListConfigurationRevisionsResponse(
    configurationId: json['configurationId'] as String,
    maxResults: json['maxResults'] as int,
    nextToken: json['nextToken'] as String,
    revisions: (json['revisions'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationRevision.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListConfigurationsResponse _$ListConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListConfigurationsResponse(
    configurations: (json['configurations'] as List)
        ?.map((e) => e == null
            ? null
            : Configuration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    maxResults: json['maxResults'] as int,
    nextToken: json['nextToken'] as String,
  );
}

ListTagsResponse _$ListTagsResponseFromJson(Map<String, dynamic> json) {
  return ListTagsResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) {
  return ListUsersResponse(
    brokerId: json['brokerId'] as String,
    maxResults: json['maxResults'] as int,
    nextToken: json['nextToken'] as String,
    users: (json['users'] as List)
        ?.map((e) =>
            e == null ? null : UserSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Logs _$LogsFromJson(Map<String, dynamic> json) {
  return Logs(
    audit: json['audit'] as bool,
    general: json['general'] as bool,
  );
}

Map<String, dynamic> _$LogsToJson(Logs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audit', instance.audit);
  writeNotNull('general', instance.general);
  return val;
}

LogsSummary _$LogsSummaryFromJson(Map<String, dynamic> json) {
  return LogsSummary(
    audit: json['audit'] as bool,
    auditLogGroup: json['auditLogGroup'] as String,
    general: json['general'] as bool,
    generalLogGroup: json['generalLogGroup'] as String,
    pending: json['pending'] == null
        ? null
        : PendingLogs.fromJson(json['pending'] as Map<String, dynamic>),
  );
}

PendingLogs _$PendingLogsFromJson(Map<String, dynamic> json) {
  return PendingLogs(
    audit: json['audit'] as bool,
    general: json['general'] as bool,
  );
}

Map<String, dynamic> _$RebootBrokerRequestToJson(
        RebootBrokerRequest instance) =>
    <String, dynamic>{};

RebootBrokerResponse _$RebootBrokerResponseFromJson(Map<String, dynamic> json) {
  return RebootBrokerResponse();
}

SanitizationWarning _$SanitizationWarningFromJson(Map<String, dynamic> json) {
  return SanitizationWarning(
    attributeName: json['attributeName'] as String,
    elementName: json['elementName'] as String,
    reason: _$enumDecodeNullable(
        _$SanitizationWarningReasonEnumMap, json['reason']),
  );
}

const _$SanitizationWarningReasonEnumMap = {
  SanitizationWarningReason.disallowedElementRemoved:
      'DISALLOWED_ELEMENT_REMOVED',
  SanitizationWarningReason.disallowedAttributeRemoved:
      'DISALLOWED_ATTRIBUTE_REMOVED',
  SanitizationWarningReason.invalidAttributeValueRemoved:
      'INVALID_ATTRIBUTE_VALUE_REMOVED',
};

Map<String, dynamic> _$UpdateBrokerRequestToJson(UpdateBrokerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('autoMinorVersionUpgrade', instance.autoMinorVersionUpgrade);
  writeNotNull('configuration', instance.configuration?.toJson());
  writeNotNull('engineVersion', instance.engineVersion);
  writeNotNull('hostInstanceType', instance.hostInstanceType);
  writeNotNull('logs', instance.logs?.toJson());
  writeNotNull('securityGroups', instance.securityGroups);
  return val;
}

UpdateBrokerResponse _$UpdateBrokerResponseFromJson(Map<String, dynamic> json) {
  return UpdateBrokerResponse(
    autoMinorVersionUpgrade: json['autoMinorVersionUpgrade'] as bool,
    brokerId: json['brokerId'] as String,
    configuration: json['configuration'] == null
        ? null
        : ConfigurationId.fromJson(
            json['configuration'] as Map<String, dynamic>),
    engineVersion: json['engineVersion'] as String,
    hostInstanceType: json['hostInstanceType'] as String,
    logs: json['logs'] == null
        ? null
        : Logs.fromJson(json['logs'] as Map<String, dynamic>),
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UpdateConfigurationRequestToJson(
    UpdateConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('description', instance.description);
  return val;
}

UpdateConfigurationResponse _$UpdateConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateConfigurationResponse(
    arn: json['arn'] as String,
    created: iso8601FromJson(json['created'] as String),
    id: json['id'] as String,
    latestRevision: json['latestRevision'] == null
        ? null
        : ConfigurationRevision.fromJson(
            json['latestRevision'] as Map<String, dynamic>),
    name: json['name'] as String,
    warnings: (json['warnings'] as List)
        ?.map((e) => e == null
            ? null
            : SanitizationWarning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('consoleAccess', instance.consoleAccess);
  writeNotNull('groups', instance.groups);
  writeNotNull('password', instance.password);
  return val;
}

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) {
  return UpdateUserResponse();
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('consoleAccess', instance.consoleAccess);
  writeNotNull('groups', instance.groups);
  writeNotNull('password', instance.password);
  writeNotNull('username', instance.username);
  return val;
}

UserPendingChanges _$UserPendingChangesFromJson(Map<String, dynamic> json) {
  return UserPendingChanges(
    consoleAccess: json['consoleAccess'] as bool,
    groups: (json['groups'] as List)?.map((e) => e as String)?.toList(),
    pendingChange:
        _$enumDecodeNullable(_$ChangeTypeEnumMap, json['pendingChange']),
  );
}

const _$ChangeTypeEnumMap = {
  ChangeType.create: 'CREATE',
  ChangeType.update: 'UPDATE',
  ChangeType.delete: 'DELETE',
};

UserSummary _$UserSummaryFromJson(Map<String, dynamic> json) {
  return UserSummary(
    pendingChange:
        _$enumDecodeNullable(_$ChangeTypeEnumMap, json['pendingChange']),
    username: json['username'] as String,
  );
}

WeeklyStartTime _$WeeklyStartTimeFromJson(Map<String, dynamic> json) {
  return WeeklyStartTime(
    dayOfWeek: _$enumDecodeNullable(_$DayOfWeekEnumMap, json['dayOfWeek']),
    timeOfDay: json['timeOfDay'] as String,
    timeZone: json['timeZone'] as String,
  );
}

Map<String, dynamic> _$WeeklyStartTimeToJson(WeeklyStartTime instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dayOfWeek', _$DayOfWeekEnumMap[instance.dayOfWeek]);
  writeNotNull('timeOfDay', instance.timeOfDay);
  writeNotNull('timeZone', instance.timeZone);
  return val;
}

const _$DayOfWeekEnumMap = {
  DayOfWeek.monday: 'MONDAY',
  DayOfWeek.tuesday: 'TUESDAY',
  DayOfWeek.wednesday: 'WEDNESDAY',
  DayOfWeek.thursday: 'THURSDAY',
  DayOfWeek.friday: 'FRIDAY',
  DayOfWeek.saturday: 'SATURDAY',
  DayOfWeek.sunday: 'SUNDAY',
};
