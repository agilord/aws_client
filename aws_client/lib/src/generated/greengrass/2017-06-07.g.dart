// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-06-07.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociateRoleToGroupResponse _$AssociateRoleToGroupResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateRoleToGroupResponse(
    associatedAt: json['AssociatedAt'] as String,
  );
}

AssociateServiceRoleToAccountResponse
    _$AssociateServiceRoleToAccountResponseFromJson(Map<String, dynamic> json) {
  return AssociateServiceRoleToAccountResponse(
    associatedAt: json['AssociatedAt'] as String,
  );
}

BulkDeployment _$BulkDeploymentFromJson(Map<String, dynamic> json) {
  return BulkDeployment(
    bulkDeploymentArn: json['BulkDeploymentArn'] as String,
    bulkDeploymentId: json['BulkDeploymentId'] as String,
    createdAt: json['CreatedAt'] as String,
  );
}

BulkDeploymentMetrics _$BulkDeploymentMetricsFromJson(
    Map<String, dynamic> json) {
  return BulkDeploymentMetrics(
    invalidInputRecords: json['InvalidInputRecords'] as int,
    recordsProcessed: json['RecordsProcessed'] as int,
    retryAttempts: json['RetryAttempts'] as int,
  );
}

BulkDeploymentResult _$BulkDeploymentResultFromJson(Map<String, dynamic> json) {
  return BulkDeploymentResult(
    createdAt: json['CreatedAt'] as String,
    deploymentArn: json['DeploymentArn'] as String,
    deploymentId: json['DeploymentId'] as String,
    deploymentStatus: json['DeploymentStatus'] as String,
    deploymentType:
        _$enumDecodeNullable(_$DeploymentTypeEnumMap, json['DeploymentType']),
    errorDetails: (json['ErrorDetails'] as List)
        ?.map((e) =>
            e == null ? null : ErrorDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errorMessage: json['ErrorMessage'] as String,
    groupArn: json['GroupArn'] as String,
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

const _$DeploymentTypeEnumMap = {
  DeploymentType.newDeployment: 'NewDeployment',
  DeploymentType.redeployment: 'Redeployment',
  DeploymentType.resetDeployment: 'ResetDeployment',
  DeploymentType.forceResetDeployment: 'ForceResetDeployment',
};

ConnectivityInfo _$ConnectivityInfoFromJson(Map<String, dynamic> json) {
  return ConnectivityInfo(
    hostAddress: json['HostAddress'] as String,
    id: json['Id'] as String,
    metadata: json['Metadata'] as String,
    portNumber: json['PortNumber'] as int,
  );
}

Map<String, dynamic> _$ConnectivityInfoToJson(ConnectivityInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HostAddress', instance.hostAddress);
  writeNotNull('Id', instance.id);
  writeNotNull('Metadata', instance.metadata);
  writeNotNull('PortNumber', instance.portNumber);
  return val;
}

Connector _$ConnectorFromJson(Map<String, dynamic> json) {
  return Connector(
    connectorArn: json['ConnectorArn'] as String,
    id: json['Id'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ConnectorToJson(Connector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectorArn', instance.connectorArn);
  writeNotNull('Id', instance.id);
  writeNotNull('Parameters', instance.parameters);
  return val;
}

ConnectorDefinitionVersion _$ConnectorDefinitionVersionFromJson(
    Map<String, dynamic> json) {
  return ConnectorDefinitionVersion(
    connectors: (json['Connectors'] as List)
        ?.map((e) =>
            e == null ? null : Connector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConnectorDefinitionVersionToJson(
    ConnectorDefinitionVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Connectors', instance.connectors?.map((e) => e?.toJson())?.toList());
  return val;
}

Core _$CoreFromJson(Map<String, dynamic> json) {
  return Core(
    certificateArn: json['CertificateArn'] as String,
    id: json['Id'] as String,
    thingArn: json['ThingArn'] as String,
    syncShadow: json['SyncShadow'] as bool,
  );
}

Map<String, dynamic> _$CoreToJson(Core instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CertificateArn', instance.certificateArn);
  writeNotNull('Id', instance.id);
  writeNotNull('ThingArn', instance.thingArn);
  writeNotNull('SyncShadow', instance.syncShadow);
  return val;
}

CoreDefinitionVersion _$CoreDefinitionVersionFromJson(
    Map<String, dynamic> json) {
  return CoreDefinitionVersion(
    cores: (json['Cores'] as List)
        ?.map(
            (e) => e == null ? null : Core.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CoreDefinitionVersionToJson(
    CoreDefinitionVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cores', instance.cores?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateConnectorDefinitionResponse _$CreateConnectorDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConnectorDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
  );
}

CreateConnectorDefinitionVersionResponse
    _$CreateConnectorDefinitionVersionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateConnectorDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

CreateCoreDefinitionResponse _$CreateCoreDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCoreDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
  );
}

CreateCoreDefinitionVersionResponse
    _$CreateCoreDefinitionVersionResponseFromJson(Map<String, dynamic> json) {
  return CreateCoreDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

CreateDeploymentResponse _$CreateDeploymentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDeploymentResponse(
    deploymentArn: json['DeploymentArn'] as String,
    deploymentId: json['DeploymentId'] as String,
  );
}

CreateDeviceDefinitionResponse _$CreateDeviceDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDeviceDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
  );
}

CreateDeviceDefinitionVersionResponse
    _$CreateDeviceDefinitionVersionResponseFromJson(Map<String, dynamic> json) {
  return CreateDeviceDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

CreateFunctionDefinitionResponse _$CreateFunctionDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateFunctionDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
  );
}

CreateFunctionDefinitionVersionResponse
    _$CreateFunctionDefinitionVersionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateFunctionDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

CreateGroupCertificateAuthorityResponse
    _$CreateGroupCertificateAuthorityResponseFromJson(
        Map<String, dynamic> json) {
  return CreateGroupCertificateAuthorityResponse(
    groupCertificateAuthorityArn:
        json['GroupCertificateAuthorityArn'] as String,
  );
}

CreateGroupResponse _$CreateGroupResponseFromJson(Map<String, dynamic> json) {
  return CreateGroupResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
  );
}

CreateGroupVersionResponse _$CreateGroupVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateGroupVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

CreateLoggerDefinitionResponse _$CreateLoggerDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLoggerDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
  );
}

CreateLoggerDefinitionVersionResponse
    _$CreateLoggerDefinitionVersionResponseFromJson(Map<String, dynamic> json) {
  return CreateLoggerDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

CreateResourceDefinitionResponse _$CreateResourceDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateResourceDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
  );
}

CreateResourceDefinitionVersionResponse
    _$CreateResourceDefinitionVersionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateResourceDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

CreateSoftwareUpdateJobResponse _$CreateSoftwareUpdateJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSoftwareUpdateJobResponse(
    iotJobArn: json['IotJobArn'] as String,
    iotJobId: json['IotJobId'] as String,
    platformSoftwareVersion: json['PlatformSoftwareVersion'] as String,
  );
}

CreateSubscriptionDefinitionResponse
    _$CreateSubscriptionDefinitionResponseFromJson(Map<String, dynamic> json) {
  return CreateSubscriptionDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
  );
}

CreateSubscriptionDefinitionVersionResponse
    _$CreateSubscriptionDefinitionVersionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateSubscriptionDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

DefinitionInformation _$DefinitionInformationFromJson(
    Map<String, dynamic> json) {
  return DefinitionInformation(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DeleteConnectorDefinitionResponse _$DeleteConnectorDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteConnectorDefinitionResponse();
}

DeleteCoreDefinitionResponse _$DeleteCoreDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCoreDefinitionResponse();
}

DeleteDeviceDefinitionResponse _$DeleteDeviceDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDeviceDefinitionResponse();
}

DeleteFunctionDefinitionResponse _$DeleteFunctionDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFunctionDefinitionResponse();
}

DeleteGroupResponse _$DeleteGroupResponseFromJson(Map<String, dynamic> json) {
  return DeleteGroupResponse();
}

DeleteLoggerDefinitionResponse _$DeleteLoggerDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLoggerDefinitionResponse();
}

DeleteResourceDefinitionResponse _$DeleteResourceDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResourceDefinitionResponse();
}

DeleteSubscriptionDefinitionResponse
    _$DeleteSubscriptionDefinitionResponseFromJson(Map<String, dynamic> json) {
  return DeleteSubscriptionDefinitionResponse();
}

Deployment _$DeploymentFromJson(Map<String, dynamic> json) {
  return Deployment(
    createdAt: json['CreatedAt'] as String,
    deploymentArn: json['DeploymentArn'] as String,
    deploymentId: json['DeploymentId'] as String,
    deploymentType:
        _$enumDecodeNullable(_$DeploymentTypeEnumMap, json['DeploymentType']),
    groupArn: json['GroupArn'] as String,
  );
}

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    certificateArn: json['CertificateArn'] as String,
    id: json['Id'] as String,
    thingArn: json['ThingArn'] as String,
    syncShadow: json['SyncShadow'] as bool,
  );
}

Map<String, dynamic> _$DeviceToJson(Device instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CertificateArn', instance.certificateArn);
  writeNotNull('Id', instance.id);
  writeNotNull('ThingArn', instance.thingArn);
  writeNotNull('SyncShadow', instance.syncShadow);
  return val;
}

DeviceDefinitionVersion _$DeviceDefinitionVersionFromJson(
    Map<String, dynamic> json) {
  return DeviceDefinitionVersion(
    devices: (json['Devices'] as List)
        ?.map((e) =>
            e == null ? null : Device.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DeviceDefinitionVersionToJson(
    DeviceDefinitionVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Devices', instance.devices?.map((e) => e?.toJson())?.toList());
  return val;
}

DisassociateRoleFromGroupResponse _$DisassociateRoleFromGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateRoleFromGroupResponse(
    disassociatedAt: json['DisassociatedAt'] as String,
  );
}

DisassociateServiceRoleFromAccountResponse
    _$DisassociateServiceRoleFromAccountResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateServiceRoleFromAccountResponse(
    disassociatedAt: json['DisassociatedAt'] as String,
  );
}

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) {
  return ErrorDetail(
    detailedErrorCode: json['DetailedErrorCode'] as String,
    detailedErrorMessage: json['DetailedErrorMessage'] as String,
  );
}

$Function _$$FunctionFromJson(Map<String, dynamic> json) {
  return $Function(
    id: json['Id'] as String,
    functionArn: json['FunctionArn'] as String,
    functionConfiguration: json['FunctionConfiguration'] == null
        ? null
        : FunctionConfiguration.fromJson(
            json['FunctionConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$$FunctionToJson($Function instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('FunctionArn', instance.functionArn);
  writeNotNull(
      'FunctionConfiguration', instance.functionConfiguration?.toJson());
  return val;
}

FunctionConfiguration _$FunctionConfigurationFromJson(
    Map<String, dynamic> json) {
  return FunctionConfiguration(
    encodingType:
        _$enumDecodeNullable(_$EncodingTypeEnumMap, json['EncodingType']),
    environment: json['Environment'] == null
        ? null
        : FunctionConfigurationEnvironment.fromJson(
            json['Environment'] as Map<String, dynamic>),
    execArgs: json['ExecArgs'] as String,
    executable: json['Executable'] as String,
    memorySize: json['MemorySize'] as int,
    pinned: json['Pinned'] as bool,
    timeout: json['Timeout'] as int,
  );
}

Map<String, dynamic> _$FunctionConfigurationToJson(
    FunctionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EncodingType', _$EncodingTypeEnumMap[instance.encodingType]);
  writeNotNull('Environment', instance.environment?.toJson());
  writeNotNull('ExecArgs', instance.execArgs);
  writeNotNull('Executable', instance.executable);
  writeNotNull('MemorySize', instance.memorySize);
  writeNotNull('Pinned', instance.pinned);
  writeNotNull('Timeout', instance.timeout);
  return val;
}

const _$EncodingTypeEnumMap = {
  EncodingType.binary: 'binary',
  EncodingType.json: 'json',
};

FunctionConfigurationEnvironment _$FunctionConfigurationEnvironmentFromJson(
    Map<String, dynamic> json) {
  return FunctionConfigurationEnvironment(
    accessSysfs: json['AccessSysfs'] as bool,
    execution: json['Execution'] == null
        ? null
        : FunctionExecutionConfig.fromJson(
            json['Execution'] as Map<String, dynamic>),
    resourceAccessPolicies: (json['ResourceAccessPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceAccessPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    variables: (json['Variables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$FunctionConfigurationEnvironmentToJson(
    FunctionConfigurationEnvironment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessSysfs', instance.accessSysfs);
  writeNotNull('Execution', instance.execution?.toJson());
  writeNotNull('ResourceAccessPolicies',
      instance.resourceAccessPolicies?.map((e) => e?.toJson())?.toList());
  writeNotNull('Variables', instance.variables);
  return val;
}

FunctionDefaultConfig _$FunctionDefaultConfigFromJson(
    Map<String, dynamic> json) {
  return FunctionDefaultConfig(
    execution: json['Execution'] == null
        ? null
        : FunctionDefaultExecutionConfig.fromJson(
            json['Execution'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FunctionDefaultConfigToJson(
    FunctionDefaultConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Execution', instance.execution?.toJson());
  return val;
}

FunctionDefaultExecutionConfig _$FunctionDefaultExecutionConfigFromJson(
    Map<String, dynamic> json) {
  return FunctionDefaultExecutionConfig(
    isolationMode: _$enumDecodeNullable(
        _$FunctionIsolationModeEnumMap, json['IsolationMode']),
    runAs: json['RunAs'] == null
        ? null
        : FunctionRunAsConfig.fromJson(json['RunAs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FunctionDefaultExecutionConfigToJson(
    FunctionDefaultExecutionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'IsolationMode', _$FunctionIsolationModeEnumMap[instance.isolationMode]);
  writeNotNull('RunAs', instance.runAs?.toJson());
  return val;
}

const _$FunctionIsolationModeEnumMap = {
  FunctionIsolationMode.greengrassContainer: 'GreengrassContainer',
  FunctionIsolationMode.noContainer: 'NoContainer',
};

FunctionDefinitionVersion _$FunctionDefinitionVersionFromJson(
    Map<String, dynamic> json) {
  return FunctionDefinitionVersion(
    defaultConfig: json['DefaultConfig'] == null
        ? null
        : FunctionDefaultConfig.fromJson(
            json['DefaultConfig'] as Map<String, dynamic>),
    functions: (json['Functions'] as List)
        ?.map((e) =>
            e == null ? null : $Function.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FunctionDefinitionVersionToJson(
    FunctionDefinitionVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultConfig', instance.defaultConfig?.toJson());
  writeNotNull(
      'Functions', instance.functions?.map((e) => e?.toJson())?.toList());
  return val;
}

FunctionExecutionConfig _$FunctionExecutionConfigFromJson(
    Map<String, dynamic> json) {
  return FunctionExecutionConfig(
    isolationMode: _$enumDecodeNullable(
        _$FunctionIsolationModeEnumMap, json['IsolationMode']),
    runAs: json['RunAs'] == null
        ? null
        : FunctionRunAsConfig.fromJson(json['RunAs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FunctionExecutionConfigToJson(
    FunctionExecutionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'IsolationMode', _$FunctionIsolationModeEnumMap[instance.isolationMode]);
  writeNotNull('RunAs', instance.runAs?.toJson());
  return val;
}

FunctionRunAsConfig _$FunctionRunAsConfigFromJson(Map<String, dynamic> json) {
  return FunctionRunAsConfig(
    gid: json['Gid'] as int,
    uid: json['Uid'] as int,
  );
}

Map<String, dynamic> _$FunctionRunAsConfigToJson(FunctionRunAsConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Gid', instance.gid);
  writeNotNull('Uid', instance.uid);
  return val;
}

GetAssociatedRoleResponse _$GetAssociatedRoleResponseFromJson(
    Map<String, dynamic> json) {
  return GetAssociatedRoleResponse(
    associatedAt: json['AssociatedAt'] as String,
    roleArn: json['RoleArn'] as String,
  );
}

GetBulkDeploymentStatusResponse _$GetBulkDeploymentStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetBulkDeploymentStatusResponse(
    bulkDeploymentMetrics: json['BulkDeploymentMetrics'] == null
        ? null
        : BulkDeploymentMetrics.fromJson(
            json['BulkDeploymentMetrics'] as Map<String, dynamic>),
    bulkDeploymentStatus: _$enumDecodeNullable(
        _$BulkDeploymentStatusEnumMap, json['BulkDeploymentStatus']),
    createdAt: json['CreatedAt'] as String,
    errorDetails: (json['ErrorDetails'] as List)
        ?.map((e) =>
            e == null ? null : ErrorDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errorMessage: json['ErrorMessage'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$BulkDeploymentStatusEnumMap = {
  BulkDeploymentStatus.initializing: 'Initializing',
  BulkDeploymentStatus.running: 'Running',
  BulkDeploymentStatus.completed: 'Completed',
  BulkDeploymentStatus.stopping: 'Stopping',
  BulkDeploymentStatus.stopped: 'Stopped',
  BulkDeploymentStatus.failed: 'Failed',
};

GetConnectivityInfoResponse _$GetConnectivityInfoResponseFromJson(
    Map<String, dynamic> json) {
  return GetConnectivityInfoResponse(
    connectivityInfo: (json['ConnectivityInfo'] as List)
        ?.map((e) => e == null
            ? null
            : ConnectivityInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    message: json['message'] as String,
  );
}

GetConnectorDefinitionResponse _$GetConnectorDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return GetConnectorDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetConnectorDefinitionVersionResponse
    _$GetConnectorDefinitionVersionResponseFromJson(Map<String, dynamic> json) {
  return GetConnectorDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    definition: json['Definition'] == null
        ? null
        : ConnectorDefinitionVersion.fromJson(
            json['Definition'] as Map<String, dynamic>),
    id: json['Id'] as String,
    nextToken: json['NextToken'] as String,
    version: json['Version'] as String,
  );
}

GetCoreDefinitionResponse _$GetCoreDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return GetCoreDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetCoreDefinitionVersionResponse _$GetCoreDefinitionVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetCoreDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    definition: json['Definition'] == null
        ? null
        : CoreDefinitionVersion.fromJson(
            json['Definition'] as Map<String, dynamic>),
    id: json['Id'] as String,
    nextToken: json['NextToken'] as String,
    version: json['Version'] as String,
  );
}

GetDeploymentStatusResponse _$GetDeploymentStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetDeploymentStatusResponse(
    deploymentStatus: json['DeploymentStatus'] as String,
    deploymentType:
        _$enumDecodeNullable(_$DeploymentTypeEnumMap, json['DeploymentType']),
    errorDetails: (json['ErrorDetails'] as List)
        ?.map((e) =>
            e == null ? null : ErrorDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errorMessage: json['ErrorMessage'] as String,
    updatedAt: json['UpdatedAt'] as String,
  );
}

GetDeviceDefinitionResponse _$GetDeviceDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return GetDeviceDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetDeviceDefinitionVersionResponse _$GetDeviceDefinitionVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetDeviceDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    definition: json['Definition'] == null
        ? null
        : DeviceDefinitionVersion.fromJson(
            json['Definition'] as Map<String, dynamic>),
    id: json['Id'] as String,
    nextToken: json['NextToken'] as String,
    version: json['Version'] as String,
  );
}

GetFunctionDefinitionResponse _$GetFunctionDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return GetFunctionDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetFunctionDefinitionVersionResponse
    _$GetFunctionDefinitionVersionResponseFromJson(Map<String, dynamic> json) {
  return GetFunctionDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    definition: json['Definition'] == null
        ? null
        : FunctionDefinitionVersion.fromJson(
            json['Definition'] as Map<String, dynamic>),
    id: json['Id'] as String,
    nextToken: json['NextToken'] as String,
    version: json['Version'] as String,
  );
}

GetGroupCertificateAuthorityResponse
    _$GetGroupCertificateAuthorityResponseFromJson(Map<String, dynamic> json) {
  return GetGroupCertificateAuthorityResponse(
    groupCertificateAuthorityArn:
        json['GroupCertificateAuthorityArn'] as String,
    groupCertificateAuthorityId: json['GroupCertificateAuthorityId'] as String,
    pemEncodedCertificate: json['PemEncodedCertificate'] as String,
  );
}

GetGroupCertificateConfigurationResponse
    _$GetGroupCertificateConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return GetGroupCertificateConfigurationResponse(
    certificateAuthorityExpiryInMilliseconds:
        json['CertificateAuthorityExpiryInMilliseconds'] as String,
    certificateExpiryInMilliseconds:
        json['CertificateExpiryInMilliseconds'] as String,
    groupId: json['GroupId'] as String,
  );
}

GetGroupResponse _$GetGroupResponseFromJson(Map<String, dynamic> json) {
  return GetGroupResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetGroupVersionResponse _$GetGroupVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetGroupVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    definition: json['Definition'] == null
        ? null
        : GroupVersion.fromJson(json['Definition'] as Map<String, dynamic>),
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

GetLoggerDefinitionResponse _$GetLoggerDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return GetLoggerDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetLoggerDefinitionVersionResponse _$GetLoggerDefinitionVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetLoggerDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    definition: json['Definition'] == null
        ? null
        : LoggerDefinitionVersion.fromJson(
            json['Definition'] as Map<String, dynamic>),
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

GetResourceDefinitionResponse _$GetResourceDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourceDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetResourceDefinitionVersionResponse
    _$GetResourceDefinitionVersionResponseFromJson(Map<String, dynamic> json) {
  return GetResourceDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    definition: json['Definition'] == null
        ? null
        : ResourceDefinitionVersion.fromJson(
            json['Definition'] as Map<String, dynamic>),
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}

GetServiceRoleForAccountResponse _$GetServiceRoleForAccountResponseFromJson(
    Map<String, dynamic> json) {
  return GetServiceRoleForAccountResponse(
    associatedAt: json['AssociatedAt'] as String,
    roleArn: json['RoleArn'] as String,
  );
}

GetSubscriptionDefinitionResponse _$GetSubscriptionDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return GetSubscriptionDefinitionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetSubscriptionDefinitionVersionResponse
    _$GetSubscriptionDefinitionVersionResponseFromJson(
        Map<String, dynamic> json) {
  return GetSubscriptionDefinitionVersionResponse(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    definition: json['Definition'] == null
        ? null
        : SubscriptionDefinitionVersion.fromJson(
            json['Definition'] as Map<String, dynamic>),
    id: json['Id'] as String,
    nextToken: json['NextToken'] as String,
    version: json['Version'] as String,
  );
}

GetThingRuntimeConfigurationResponse
    _$GetThingRuntimeConfigurationResponseFromJson(Map<String, dynamic> json) {
  return GetThingRuntimeConfigurationResponse(
    runtimeConfiguration: json['RuntimeConfiguration'] == null
        ? null
        : RuntimeConfiguration.fromJson(
            json['RuntimeConfiguration'] as Map<String, dynamic>),
  );
}

GroupCertificateAuthorityProperties
    _$GroupCertificateAuthorityPropertiesFromJson(Map<String, dynamic> json) {
  return GroupCertificateAuthorityProperties(
    groupCertificateAuthorityArn:
        json['GroupCertificateAuthorityArn'] as String,
    groupCertificateAuthorityId: json['GroupCertificateAuthorityId'] as String,
  );
}

GroupInformation _$GroupInformationFromJson(Map<String, dynamic> json) {
  return GroupInformation(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String,
    latestVersion: json['LatestVersion'] as String,
    latestVersionArn: json['LatestVersionArn'] as String,
    name: json['Name'] as String,
  );
}

GroupOwnerSetting _$GroupOwnerSettingFromJson(Map<String, dynamic> json) {
  return GroupOwnerSetting(
    autoAddGroupOwner: json['AutoAddGroupOwner'] as bool,
    groupOwner: json['GroupOwner'] as String,
  );
}

Map<String, dynamic> _$GroupOwnerSettingToJson(GroupOwnerSetting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AutoAddGroupOwner', instance.autoAddGroupOwner);
  writeNotNull('GroupOwner', instance.groupOwner);
  return val;
}

GroupVersion _$GroupVersionFromJson(Map<String, dynamic> json) {
  return GroupVersion(
    connectorDefinitionVersionArn:
        json['ConnectorDefinitionVersionArn'] as String,
    coreDefinitionVersionArn: json['CoreDefinitionVersionArn'] as String,
    deviceDefinitionVersionArn: json['DeviceDefinitionVersionArn'] as String,
    functionDefinitionVersionArn:
        json['FunctionDefinitionVersionArn'] as String,
    loggerDefinitionVersionArn: json['LoggerDefinitionVersionArn'] as String,
    resourceDefinitionVersionArn:
        json['ResourceDefinitionVersionArn'] as String,
    subscriptionDefinitionVersionArn:
        json['SubscriptionDefinitionVersionArn'] as String,
  );
}

Map<String, dynamic> _$GroupVersionToJson(GroupVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ConnectorDefinitionVersionArn', instance.connectorDefinitionVersionArn);
  writeNotNull('CoreDefinitionVersionArn', instance.coreDefinitionVersionArn);
  writeNotNull(
      'DeviceDefinitionVersionArn', instance.deviceDefinitionVersionArn);
  writeNotNull(
      'FunctionDefinitionVersionArn', instance.functionDefinitionVersionArn);
  writeNotNull(
      'LoggerDefinitionVersionArn', instance.loggerDefinitionVersionArn);
  writeNotNull(
      'ResourceDefinitionVersionArn', instance.resourceDefinitionVersionArn);
  writeNotNull('SubscriptionDefinitionVersionArn',
      instance.subscriptionDefinitionVersionArn);
  return val;
}

ListBulkDeploymentDetailedReportsResponse
    _$ListBulkDeploymentDetailedReportsResponseFromJson(
        Map<String, dynamic> json) {
  return ListBulkDeploymentDetailedReportsResponse(
    deployments: (json['Deployments'] as List)
        ?.map((e) => e == null
            ? null
            : BulkDeploymentResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListBulkDeploymentsResponse _$ListBulkDeploymentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListBulkDeploymentsResponse(
    bulkDeployments: (json['BulkDeployments'] as List)
        ?.map((e) => e == null
            ? null
            : BulkDeployment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListConnectorDefinitionVersionsResponse
    _$ListConnectorDefinitionVersionsResponseFromJson(
        Map<String, dynamic> json) {
  return ListConnectorDefinitionVersionsResponse(
    nextToken: json['NextToken'] as String,
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : VersionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListConnectorDefinitionsResponse _$ListConnectorDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListConnectorDefinitionsResponse(
    definitions: (json['Definitions'] as List)
        ?.map((e) => e == null
            ? null
            : DefinitionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListCoreDefinitionVersionsResponse _$ListCoreDefinitionVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListCoreDefinitionVersionsResponse(
    nextToken: json['NextToken'] as String,
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : VersionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListCoreDefinitionsResponse _$ListCoreDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListCoreDefinitionsResponse(
    definitions: (json['Definitions'] as List)
        ?.map((e) => e == null
            ? null
            : DefinitionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDeploymentsResponse _$ListDeploymentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDeploymentsResponse(
    deployments: (json['Deployments'] as List)
        ?.map((e) =>
            e == null ? null : Deployment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDeviceDefinitionVersionsResponse
    _$ListDeviceDefinitionVersionsResponseFromJson(Map<String, dynamic> json) {
  return ListDeviceDefinitionVersionsResponse(
    nextToken: json['NextToken'] as String,
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : VersionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListDeviceDefinitionsResponse _$ListDeviceDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDeviceDefinitionsResponse(
    definitions: (json['Definitions'] as List)
        ?.map((e) => e == null
            ? null
            : DefinitionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListFunctionDefinitionVersionsResponse
    _$ListFunctionDefinitionVersionsResponseFromJson(
        Map<String, dynamic> json) {
  return ListFunctionDefinitionVersionsResponse(
    nextToken: json['NextToken'] as String,
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : VersionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListFunctionDefinitionsResponse _$ListFunctionDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListFunctionDefinitionsResponse(
    definitions: (json['Definitions'] as List)
        ?.map((e) => e == null
            ? null
            : DefinitionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListGroupCertificateAuthoritiesResponse
    _$ListGroupCertificateAuthoritiesResponseFromJson(
        Map<String, dynamic> json) {
  return ListGroupCertificateAuthoritiesResponse(
    groupCertificateAuthorities: (json['GroupCertificateAuthorities'] as List)
        ?.map((e) => e == null
            ? null
            : GroupCertificateAuthorityProperties.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListGroupVersionsResponse _$ListGroupVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListGroupVersionsResponse(
    nextToken: json['NextToken'] as String,
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : VersionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListGroupsResponse _$ListGroupsResponseFromJson(Map<String, dynamic> json) {
  return ListGroupsResponse(
    groups: (json['Groups'] as List)
        ?.map((e) => e == null
            ? null
            : GroupInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLoggerDefinitionVersionsResponse
    _$ListLoggerDefinitionVersionsResponseFromJson(Map<String, dynamic> json) {
  return ListLoggerDefinitionVersionsResponse(
    nextToken: json['NextToken'] as String,
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : VersionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListLoggerDefinitionsResponse _$ListLoggerDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLoggerDefinitionsResponse(
    definitions: (json['Definitions'] as List)
        ?.map((e) => e == null
            ? null
            : DefinitionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListResourceDefinitionVersionsResponse
    _$ListResourceDefinitionVersionsResponseFromJson(
        Map<String, dynamic> json) {
  return ListResourceDefinitionVersionsResponse(
    nextToken: json['NextToken'] as String,
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : VersionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListResourceDefinitionsResponse _$ListResourceDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourceDefinitionsResponse(
    definitions: (json['Definitions'] as List)
        ?.map((e) => e == null
            ? null
            : DefinitionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListSubscriptionDefinitionVersionsResponse
    _$ListSubscriptionDefinitionVersionsResponseFromJson(
        Map<String, dynamic> json) {
  return ListSubscriptionDefinitionVersionsResponse(
    nextToken: json['NextToken'] as String,
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : VersionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSubscriptionDefinitionsResponse
    _$ListSubscriptionDefinitionsResponseFromJson(Map<String, dynamic> json) {
  return ListSubscriptionDefinitionsResponse(
    definitions: (json['Definitions'] as List)
        ?.map((e) => e == null
            ? null
            : DefinitionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
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

LocalDeviceResourceData _$LocalDeviceResourceDataFromJson(
    Map<String, dynamic> json) {
  return LocalDeviceResourceData(
    groupOwnerSetting: json['GroupOwnerSetting'] == null
        ? null
        : GroupOwnerSetting.fromJson(
            json['GroupOwnerSetting'] as Map<String, dynamic>),
    sourcePath: json['SourcePath'] as String,
  );
}

Map<String, dynamic> _$LocalDeviceResourceDataToJson(
    LocalDeviceResourceData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupOwnerSetting', instance.groupOwnerSetting?.toJson());
  writeNotNull('SourcePath', instance.sourcePath);
  return val;
}

LocalVolumeResourceData _$LocalVolumeResourceDataFromJson(
    Map<String, dynamic> json) {
  return LocalVolumeResourceData(
    destinationPath: json['DestinationPath'] as String,
    groupOwnerSetting: json['GroupOwnerSetting'] == null
        ? null
        : GroupOwnerSetting.fromJson(
            json['GroupOwnerSetting'] as Map<String, dynamic>),
    sourcePath: json['SourcePath'] as String,
  );
}

Map<String, dynamic> _$LocalVolumeResourceDataToJson(
    LocalVolumeResourceData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationPath', instance.destinationPath);
  writeNotNull('GroupOwnerSetting', instance.groupOwnerSetting?.toJson());
  writeNotNull('SourcePath', instance.sourcePath);
  return val;
}

Logger _$LoggerFromJson(Map<String, dynamic> json) {
  return Logger(
    component:
        _$enumDecodeNullable(_$LoggerComponentEnumMap, json['Component']),
    id: json['Id'] as String,
    level: _$enumDecodeNullable(_$LoggerLevelEnumMap, json['Level']),
    type: _$enumDecodeNullable(_$LoggerTypeEnumMap, json['Type']),
    space: json['Space'] as int,
  );
}

Map<String, dynamic> _$LoggerToJson(Logger instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Component', _$LoggerComponentEnumMap[instance.component]);
  writeNotNull('Id', instance.id);
  writeNotNull('Level', _$LoggerLevelEnumMap[instance.level]);
  writeNotNull('Type', _$LoggerTypeEnumMap[instance.type]);
  writeNotNull('Space', instance.space);
  return val;
}

const _$LoggerComponentEnumMap = {
  LoggerComponent.greengrassSystem: 'GreengrassSystem',
  LoggerComponent.lambda: 'Lambda',
};

const _$LoggerLevelEnumMap = {
  LoggerLevel.debug: 'DEBUG',
  LoggerLevel.info: 'INFO',
  LoggerLevel.warn: 'WARN',
  LoggerLevel.error: 'ERROR',
  LoggerLevel.fatal: 'FATAL',
};

const _$LoggerTypeEnumMap = {
  LoggerType.fileSystem: 'FileSystem',
  LoggerType.awsCloudWatch: 'AWSCloudWatch',
};

LoggerDefinitionVersion _$LoggerDefinitionVersionFromJson(
    Map<String, dynamic> json) {
  return LoggerDefinitionVersion(
    loggers: (json['Loggers'] as List)
        ?.map((e) =>
            e == null ? null : Logger.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LoggerDefinitionVersionToJson(
    LoggerDefinitionVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Loggers', instance.loggers?.map((e) => e?.toJson())?.toList());
  return val;
}

ResetDeploymentsResponse _$ResetDeploymentsResponseFromJson(
    Map<String, dynamic> json) {
  return ResetDeploymentsResponse(
    deploymentArn: json['DeploymentArn'] as String,
    deploymentId: json['DeploymentId'] as String,
  );
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    id: json['Id'] as String,
    name: json['Name'] as String,
    resourceDataContainer: json['ResourceDataContainer'] == null
        ? null
        : ResourceDataContainer.fromJson(
            json['ResourceDataContainer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull(
      'ResourceDataContainer', instance.resourceDataContainer?.toJson());
  return val;
}

ResourceAccessPolicy _$ResourceAccessPolicyFromJson(Map<String, dynamic> json) {
  return ResourceAccessPolicy(
    resourceId: json['ResourceId'] as String,
    permission: _$enumDecodeNullable(_$PermissionEnumMap, json['Permission']),
  );
}

Map<String, dynamic> _$ResourceAccessPolicyToJson(
    ResourceAccessPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('Permission', _$PermissionEnumMap[instance.permission]);
  return val;
}

const _$PermissionEnumMap = {
  Permission.ro: 'ro',
  Permission.rw: 'rw',
};

ResourceDataContainer _$ResourceDataContainerFromJson(
    Map<String, dynamic> json) {
  return ResourceDataContainer(
    localDeviceResourceData: json['LocalDeviceResourceData'] == null
        ? null
        : LocalDeviceResourceData.fromJson(
            json['LocalDeviceResourceData'] as Map<String, dynamic>),
    localVolumeResourceData: json['LocalVolumeResourceData'] == null
        ? null
        : LocalVolumeResourceData.fromJson(
            json['LocalVolumeResourceData'] as Map<String, dynamic>),
    s3MachineLearningModelResourceData:
        json['S3MachineLearningModelResourceData'] == null
            ? null
            : S3MachineLearningModelResourceData.fromJson(
                json['S3MachineLearningModelResourceData']
                    as Map<String, dynamic>),
    sageMakerMachineLearningModelResourceData:
        json['SageMakerMachineLearningModelResourceData'] == null
            ? null
            : SageMakerMachineLearningModelResourceData.fromJson(
                json['SageMakerMachineLearningModelResourceData']
                    as Map<String, dynamic>),
    secretsManagerSecretResourceData:
        json['SecretsManagerSecretResourceData'] == null
            ? null
            : SecretsManagerSecretResourceData.fromJson(
                json['SecretsManagerSecretResourceData']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResourceDataContainerToJson(
    ResourceDataContainer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'LocalDeviceResourceData', instance.localDeviceResourceData?.toJson());
  writeNotNull(
      'LocalVolumeResourceData', instance.localVolumeResourceData?.toJson());
  writeNotNull('S3MachineLearningModelResourceData',
      instance.s3MachineLearningModelResourceData?.toJson());
  writeNotNull('SageMakerMachineLearningModelResourceData',
      instance.sageMakerMachineLearningModelResourceData?.toJson());
  writeNotNull('SecretsManagerSecretResourceData',
      instance.secretsManagerSecretResourceData?.toJson());
  return val;
}

ResourceDefinitionVersion _$ResourceDefinitionVersionFromJson(
    Map<String, dynamic> json) {
  return ResourceDefinitionVersion(
    resources: (json['Resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResourceDefinitionVersionToJson(
    ResourceDefinitionVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Resources', instance.resources?.map((e) => e?.toJson())?.toList());
  return val;
}

ResourceDownloadOwnerSetting _$ResourceDownloadOwnerSettingFromJson(
    Map<String, dynamic> json) {
  return ResourceDownloadOwnerSetting(
    groupOwner: json['GroupOwner'] as String,
    groupPermission:
        _$enumDecodeNullable(_$PermissionEnumMap, json['GroupPermission']),
  );
}

Map<String, dynamic> _$ResourceDownloadOwnerSettingToJson(
    ResourceDownloadOwnerSetting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupOwner', instance.groupOwner);
  writeNotNull(
      'GroupPermission', _$PermissionEnumMap[instance.groupPermission]);
  return val;
}

RuntimeConfiguration _$RuntimeConfigurationFromJson(Map<String, dynamic> json) {
  return RuntimeConfiguration(
    telemetryConfiguration: json['TelemetryConfiguration'] == null
        ? null
        : TelemetryConfiguration.fromJson(
            json['TelemetryConfiguration'] as Map<String, dynamic>),
  );
}

S3MachineLearningModelResourceData _$S3MachineLearningModelResourceDataFromJson(
    Map<String, dynamic> json) {
  return S3MachineLearningModelResourceData(
    destinationPath: json['DestinationPath'] as String,
    ownerSetting: json['OwnerSetting'] == null
        ? null
        : ResourceDownloadOwnerSetting.fromJson(
            json['OwnerSetting'] as Map<String, dynamic>),
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$S3MachineLearningModelResourceDataToJson(
    S3MachineLearningModelResourceData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationPath', instance.destinationPath);
  writeNotNull('OwnerSetting', instance.ownerSetting?.toJson());
  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

SageMakerMachineLearningModelResourceData
    _$SageMakerMachineLearningModelResourceDataFromJson(
        Map<String, dynamic> json) {
  return SageMakerMachineLearningModelResourceData(
    destinationPath: json['DestinationPath'] as String,
    ownerSetting: json['OwnerSetting'] == null
        ? null
        : ResourceDownloadOwnerSetting.fromJson(
            json['OwnerSetting'] as Map<String, dynamic>),
    sageMakerJobArn: json['SageMakerJobArn'] as String,
  );
}

Map<String, dynamic> _$SageMakerMachineLearningModelResourceDataToJson(
    SageMakerMachineLearningModelResourceData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationPath', instance.destinationPath);
  writeNotNull('OwnerSetting', instance.ownerSetting?.toJson());
  writeNotNull('SageMakerJobArn', instance.sageMakerJobArn);
  return val;
}

SecretsManagerSecretResourceData _$SecretsManagerSecretResourceDataFromJson(
    Map<String, dynamic> json) {
  return SecretsManagerSecretResourceData(
    arn: json['ARN'] as String,
    additionalStagingLabelsToDownload:
        (json['AdditionalStagingLabelsToDownload'] as List)
            ?.map((e) => e as String)
            ?.toList(),
  );
}

Map<String, dynamic> _$SecretsManagerSecretResourceDataToJson(
    SecretsManagerSecretResourceData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ARN', instance.arn);
  writeNotNull('AdditionalStagingLabelsToDownload',
      instance.additionalStagingLabelsToDownload);
  return val;
}

StartBulkDeploymentResponse _$StartBulkDeploymentResponseFromJson(
    Map<String, dynamic> json) {
  return StartBulkDeploymentResponse(
    bulkDeploymentArn: json['BulkDeploymentArn'] as String,
    bulkDeploymentId: json['BulkDeploymentId'] as String,
  );
}

StopBulkDeploymentResponse _$StopBulkDeploymentResponseFromJson(
    Map<String, dynamic> json) {
  return StopBulkDeploymentResponse();
}

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
    id: json['Id'] as String,
    source: json['Source'] as String,
    subject: json['Subject'] as String,
    target: json['Target'] as String,
  );
}

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Source', instance.source);
  writeNotNull('Subject', instance.subject);
  writeNotNull('Target', instance.target);
  return val;
}

SubscriptionDefinitionVersion _$SubscriptionDefinitionVersionFromJson(
    Map<String, dynamic> json) {
  return SubscriptionDefinitionVersion(
    subscriptions: (json['Subscriptions'] as List)
        ?.map((e) =>
            e == null ? null : Subscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SubscriptionDefinitionVersionToJson(
    SubscriptionDefinitionVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Subscriptions',
      instance.subscriptions?.map((e) => e?.toJson())?.toList());
  return val;
}

TelemetryConfiguration _$TelemetryConfigurationFromJson(
    Map<String, dynamic> json) {
  return TelemetryConfiguration(
    telemetry: _$enumDecodeNullable(_$TelemetryEnumMap, json['Telemetry']),
    configurationSyncStatus: _$enumDecodeNullable(
        _$ConfigurationSyncStatusEnumMap, json['ConfigurationSyncStatus']),
  );
}

const _$TelemetryEnumMap = {
  Telemetry.on: 'On',
  Telemetry.off: 'Off',
};

const _$ConfigurationSyncStatusEnumMap = {
  ConfigurationSyncStatus.inSync: 'InSync',
  ConfigurationSyncStatus.outOfSync: 'OutOfSync',
};

Map<String, dynamic> _$TelemetryConfigurationUpdateToJson(
    TelemetryConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Telemetry', _$TelemetryEnumMap[instance.telemetry]);
  return val;
}

UpdateConnectivityInfoResponse _$UpdateConnectivityInfoResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateConnectivityInfoResponse(
    message: json['message'] as String,
    version: json['Version'] as String,
  );
}

UpdateConnectorDefinitionResponse _$UpdateConnectorDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateConnectorDefinitionResponse();
}

UpdateCoreDefinitionResponse _$UpdateCoreDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateCoreDefinitionResponse();
}

UpdateDeviceDefinitionResponse _$UpdateDeviceDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDeviceDefinitionResponse();
}

UpdateFunctionDefinitionResponse _$UpdateFunctionDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFunctionDefinitionResponse();
}

UpdateGroupCertificateConfigurationResponse
    _$UpdateGroupCertificateConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateGroupCertificateConfigurationResponse(
    certificateAuthorityExpiryInMilliseconds:
        json['CertificateAuthorityExpiryInMilliseconds'] as String,
    certificateExpiryInMilliseconds:
        json['CertificateExpiryInMilliseconds'] as String,
    groupId: json['GroupId'] as String,
  );
}

UpdateGroupResponse _$UpdateGroupResponseFromJson(Map<String, dynamic> json) {
  return UpdateGroupResponse();
}

UpdateLoggerDefinitionResponse _$UpdateLoggerDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateLoggerDefinitionResponse();
}

UpdateResourceDefinitionResponse _$UpdateResourceDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResourceDefinitionResponse();
}

UpdateSubscriptionDefinitionResponse
    _$UpdateSubscriptionDefinitionResponseFromJson(Map<String, dynamic> json) {
  return UpdateSubscriptionDefinitionResponse();
}

UpdateThingRuntimeConfigurationResponse
    _$UpdateThingRuntimeConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateThingRuntimeConfigurationResponse();
}

VersionInformation _$VersionInformationFromJson(Map<String, dynamic> json) {
  return VersionInformation(
    arn: json['Arn'] as String,
    creationTimestamp: json['CreationTimestamp'] as String,
    id: json['Id'] as String,
    version: json['Version'] as String,
  );
}
