// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-11-27.dart';

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
  EngineType.rabbitmq: 'RABBITMQ',
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
        ?.map((e) => _$enumDecodeNullable(_$DeploymentModeEnumMap, e))
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

const _$DeploymentModeEnumMap = {
  DeploymentMode.singleInstance: 'SINGLE_INSTANCE',
  DeploymentMode.activeStandbyMultiAz: 'ACTIVE_STANDBY_MULTI_AZ',
  DeploymentMode.clusterMultiAz: 'CLUSTER_MULTI_AZ',
};

BrokerSummary _$BrokerSummaryFromJson(Map<String, dynamic> json) {
  return BrokerSummary(
    brokerArn: json['brokerArn'] as String,
    brokerId: json['brokerId'] as String,
    brokerName: json['brokerName'] as String,
    brokerState:
        _$enumDecodeNullable(_$BrokerStateEnumMap, json['brokerState']),
    created: const IsoDateTimeConverter().fromJson(json['created']),
    deploymentMode:
        _$enumDecodeNullable(_$DeploymentModeEnumMap, json['deploymentMode']),
    engineType: _$enumDecodeNullable(_$EngineTypeEnumMap, json['engineType']),
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

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return Configuration(
    arn: json['arn'] as String,
    authenticationStrategy: _$enumDecodeNullable(
        _$AuthenticationStrategyEnumMap, json['authenticationStrategy']),
    created: const IsoDateTimeConverter().fromJson(json['created']),
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

const _$AuthenticationStrategyEnumMap = {
  AuthenticationStrategy.simple: 'SIMPLE',
  AuthenticationStrategy.ldap: 'LDAP',
};

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
    created: const IsoDateTimeConverter().fromJson(json['created']),
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

CreateBrokerResponse _$CreateBrokerResponseFromJson(Map<String, dynamic> json) {
  return CreateBrokerResponse(
    brokerArn: json['brokerArn'] as String,
    brokerId: json['brokerId'] as String,
  );
}

CreateConfigurationResponse _$CreateConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConfigurationResponse(
    arn: json['arn'] as String,
    authenticationStrategy: _$enumDecodeNullable(
        _$AuthenticationStrategyEnumMap, json['authenticationStrategy']),
    created: const IsoDateTimeConverter().fromJson(json['created']),
    id: json['id'] as String,
    latestRevision: json['latestRevision'] == null
        ? null
        : ConfigurationRevision.fromJson(
            json['latestRevision'] as Map<String, dynamic>),
    name: json['name'] as String,
  );
}

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse();
}

DeleteBrokerResponse _$DeleteBrokerResponseFromJson(Map<String, dynamic> json) {
  return DeleteBrokerResponse(
    brokerId: json['brokerId'] as String,
  );
}

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
    authenticationStrategy: _$enumDecodeNullable(
        _$AuthenticationStrategyEnumMap, json['authenticationStrategy']),
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
    created: const IsoDateTimeConverter().fromJson(json['created']),
    deploymentMode:
        _$enumDecodeNullable(_$DeploymentModeEnumMap, json['deploymentMode']),
    encryptionOptions: json['encryptionOptions'] == null
        ? null
        : EncryptionOptions.fromJson(
            json['encryptionOptions'] as Map<String, dynamic>),
    engineType: _$enumDecodeNullable(_$EngineTypeEnumMap, json['engineType']),
    engineVersion: json['engineVersion'] as String,
    hostInstanceType: json['hostInstanceType'] as String,
    ldapServerMetadata: json['ldapServerMetadata'] == null
        ? null
        : LdapServerMetadataOutput.fromJson(
            json['ldapServerMetadata'] as Map<String, dynamic>),
    logs: json['logs'] == null
        ? null
        : LogsSummary.fromJson(json['logs'] as Map<String, dynamic>),
    maintenanceWindowStartTime: json['maintenanceWindowStartTime'] == null
        ? null
        : WeeklyStartTime.fromJson(
            json['maintenanceWindowStartTime'] as Map<String, dynamic>),
    pendingAuthenticationStrategy: _$enumDecodeNullable(
        _$AuthenticationStrategyEnumMap, json['pendingAuthenticationStrategy']),
    pendingEngineVersion: json['pendingEngineVersion'] as String,
    pendingHostInstanceType: json['pendingHostInstanceType'] as String,
    pendingLdapServerMetadata: json['pendingLdapServerMetadata'] == null
        ? null
        : LdapServerMetadataOutput.fromJson(
            json['pendingLdapServerMetadata'] as Map<String, dynamic>),
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
    authenticationStrategy: _$enumDecodeNullable(
        _$AuthenticationStrategyEnumMap, json['authenticationStrategy']),
    created: const IsoDateTimeConverter().fromJson(json['created']),
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
    created: const IsoDateTimeConverter().fromJson(json['created']),
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

Map<String, dynamic> _$LdapServerMetadataInputToJson(
    LdapServerMetadataInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hosts', instance.hosts);
  writeNotNull('roleBase', instance.roleBase);
  writeNotNull('roleName', instance.roleName);
  writeNotNull('roleSearchMatching', instance.roleSearchMatching);
  writeNotNull('roleSearchSubtree', instance.roleSearchSubtree);
  writeNotNull('serviceAccountPassword', instance.serviceAccountPassword);
  writeNotNull('serviceAccountUsername', instance.serviceAccountUsername);
  writeNotNull('userBase', instance.userBase);
  writeNotNull('userRoleName', instance.userRoleName);
  writeNotNull('userSearchMatching', instance.userSearchMatching);
  writeNotNull('userSearchSubtree', instance.userSearchSubtree);
  return val;
}

LdapServerMetadataOutput _$LdapServerMetadataOutputFromJson(
    Map<String, dynamic> json) {
  return LdapServerMetadataOutput(
    hosts: (json['hosts'] as List)?.map((e) => e as String)?.toList(),
    roleBase: json['roleBase'] as String,
    roleName: json['roleName'] as String,
    roleSearchMatching: json['roleSearchMatching'] as String,
    roleSearchSubtree: json['roleSearchSubtree'] as bool,
    serviceAccountUsername: json['serviceAccountUsername'] as String,
    userBase: json['userBase'] as String,
    userRoleName: json['userRoleName'] as String,
    userSearchMatching: json['userSearchMatching'] as String,
    userSearchSubtree: json['userSearchSubtree'] as bool,
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

UpdateBrokerResponse _$UpdateBrokerResponseFromJson(Map<String, dynamic> json) {
  return UpdateBrokerResponse(
    authenticationStrategy: _$enumDecodeNullable(
        _$AuthenticationStrategyEnumMap, json['authenticationStrategy']),
    autoMinorVersionUpgrade: json['autoMinorVersionUpgrade'] as bool,
    brokerId: json['brokerId'] as String,
    configuration: json['configuration'] == null
        ? null
        : ConfigurationId.fromJson(
            json['configuration'] as Map<String, dynamic>),
    engineVersion: json['engineVersion'] as String,
    hostInstanceType: json['hostInstanceType'] as String,
    ldapServerMetadata: json['ldapServerMetadata'] == null
        ? null
        : LdapServerMetadataOutput.fromJson(
            json['ldapServerMetadata'] as Map<String, dynamic>),
    logs: json['logs'] == null
        ? null
        : Logs.fromJson(json['logs'] as Map<String, dynamic>),
    securityGroups:
        (json['securityGroups'] as List)?.map((e) => e as String)?.toList(),
  );
}

UpdateConfigurationResponse _$UpdateConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateConfigurationResponse(
    arn: json['arn'] as String,
    created: const IsoDateTimeConverter().fromJson(json['created']),
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
