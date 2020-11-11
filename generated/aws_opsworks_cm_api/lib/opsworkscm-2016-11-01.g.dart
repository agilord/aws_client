// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opsworkscm-2016-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountAttribute _$AccountAttributeFromJson(Map<String, dynamic> json) {
  return AccountAttribute(
    maximum: json['Maximum'] as int,
    name: json['Name'] as String,
    used: json['Used'] as int,
  );
}

Map<String, dynamic> _$AssociateNodeRequestToJson(
    AssociateNodeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EngineAttributes',
      instance.engineAttributes?.map((e) => e?.toJson())?.toList());
  writeNotNull('NodeName', instance.nodeName);
  writeNotNull('ServerName', instance.serverName);
  return val;
}

AssociateNodeResponse _$AssociateNodeResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateNodeResponse(
    nodeAssociationStatusToken: json['NodeAssociationStatusToken'] as String,
  );
}

Backup _$BackupFromJson(Map<String, dynamic> json) {
  return Backup(
    backupArn: json['BackupArn'] as String,
    backupId: json['BackupId'] as String,
    backupType: _$enumDecodeNullable(_$BackupTypeEnumMap, json['BackupType']),
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    description: json['Description'] as String,
    engine: json['Engine'] as String,
    engineModel: json['EngineModel'] as String,
    engineVersion: json['EngineVersion'] as String,
    instanceProfileArn: json['InstanceProfileArn'] as String,
    instanceType: json['InstanceType'] as String,
    keyPair: json['KeyPair'] as String,
    preferredBackupWindow: json['PreferredBackupWindow'] as String,
    preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String,
    s3DataSize: json['S3DataSize'] as int,
    s3DataUrl: json['S3DataUrl'] as String,
    s3LogUrl: json['S3LogUrl'] as String,
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    serverName: json['ServerName'] as String,
    serviceRoleArn: json['ServiceRoleArn'] as String,
    status: _$enumDecodeNullable(_$BackupStatusEnumMap, json['Status']),
    statusDescription: json['StatusDescription'] as String,
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    toolsVersion: json['ToolsVersion'] as String,
    userArn: json['UserArn'] as String,
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

const _$BackupTypeEnumMap = {
  BackupType.automated: 'AUTOMATED',
  BackupType.manual: 'MANUAL',
};

const _$BackupStatusEnumMap = {
  BackupStatus.inProgress: 'IN_PROGRESS',
  BackupStatus.ok: 'OK',
  BackupStatus.failed: 'FAILED',
  BackupStatus.deleting: 'DELETING',
};

Map<String, dynamic> _$CreateBackupRequestToJson(CreateBackupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerName', instance.serverName);
  writeNotNull('Description', instance.description);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateBackupResponse _$CreateBackupResponseFromJson(Map<String, dynamic> json) {
  return CreateBackupResponse(
    backup: json['Backup'] == null
        ? null
        : Backup.fromJson(json['Backup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateServerRequestToJson(CreateServerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceProfileArn', instance.instanceProfileArn);
  writeNotNull('InstanceType', instance.instanceType);
  writeNotNull('ServerName', instance.serverName);
  writeNotNull('ServiceRoleArn', instance.serviceRoleArn);
  writeNotNull('AssociatePublicIpAddress', instance.associatePublicIpAddress);
  writeNotNull('BackupId', instance.backupId);
  writeNotNull('BackupRetentionCount', instance.backupRetentionCount);
  writeNotNull('CustomCertificate', instance.customCertificate);
  writeNotNull('CustomDomain', instance.customDomain);
  writeNotNull('CustomPrivateKey', instance.customPrivateKey);
  writeNotNull('DisableAutomatedBackup', instance.disableAutomatedBackup);
  writeNotNull('Engine', instance.engine);
  writeNotNull('EngineAttributes',
      instance.engineAttributes?.map((e) => e?.toJson())?.toList());
  writeNotNull('EngineModel', instance.engineModel);
  writeNotNull('EngineVersion', instance.engineVersion);
  writeNotNull('KeyPair', instance.keyPair);
  writeNotNull('PreferredBackupWindow', instance.preferredBackupWindow);
  writeNotNull(
      'PreferredMaintenanceWindow', instance.preferredMaintenanceWindow);
  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateServerResponse _$CreateServerResponseFromJson(Map<String, dynamic> json) {
  return CreateServerResponse(
    server: json['Server'] == null
        ? null
        : Server.fromJson(json['Server'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteBackupRequestToJson(DeleteBackupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupId', instance.backupId);
  return val;
}

DeleteBackupResponse _$DeleteBackupResponseFromJson(Map<String, dynamic> json) {
  return DeleteBackupResponse();
}

Map<String, dynamic> _$DeleteServerRequestToJson(DeleteServerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerName', instance.serverName);
  return val;
}

DeleteServerResponse _$DeleteServerResponseFromJson(Map<String, dynamic> json) {
  return DeleteServerResponse();
}

DescribeAccountAttributesResponse _$DescribeAccountAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAccountAttributesResponse(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : AccountAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeBackupsRequestToJson(
    DescribeBackupsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupId', instance.backupId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('ServerName', instance.serverName);
  return val;
}

DescribeBackupsResponse _$DescribeBackupsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeBackupsResponse(
    backups: (json['Backups'] as List)
        ?.map((e) =>
            e == null ? null : Backup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeEventsRequestToJson(
    DescribeEventsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerName', instance.serverName);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeEventsResponse _$DescribeEventsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventsResponse(
    nextToken: json['NextToken'] as String,
    serverEvents: (json['ServerEvents'] as List)
        ?.map((e) =>
            e == null ? null : ServerEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeNodeAssociationStatusRequestToJson(
    DescribeNodeAssociationStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'NodeAssociationStatusToken', instance.nodeAssociationStatusToken);
  writeNotNull('ServerName', instance.serverName);
  return val;
}

DescribeNodeAssociationStatusResponse
    _$DescribeNodeAssociationStatusResponseFromJson(Map<String, dynamic> json) {
  return DescribeNodeAssociationStatusResponse(
    engineAttributes: (json['EngineAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : EngineAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nodeAssociationStatus: _$enumDecodeNullable(
        _$NodeAssociationStatusEnumMap, json['NodeAssociationStatus']),
  );
}

const _$NodeAssociationStatusEnumMap = {
  NodeAssociationStatus.success: 'SUCCESS',
  NodeAssociationStatus.failed: 'FAILED',
  NodeAssociationStatus.inProgress: 'IN_PROGRESS',
};

Map<String, dynamic> _$DescribeServersRequestToJson(
    DescribeServersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('ServerName', instance.serverName);
  return val;
}

DescribeServersResponse _$DescribeServersResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeServersResponse(
    nextToken: json['NextToken'] as String,
    servers: (json['Servers'] as List)
        ?.map((e) =>
            e == null ? null : Server.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DisassociateNodeRequestToJson(
    DisassociateNodeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NodeName', instance.nodeName);
  writeNotNull('ServerName', instance.serverName);
  writeNotNull('EngineAttributes',
      instance.engineAttributes?.map((e) => e?.toJson())?.toList());
  return val;
}

DisassociateNodeResponse _$DisassociateNodeResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateNodeResponse(
    nodeAssociationStatusToken: json['NodeAssociationStatusToken'] as String,
  );
}

EngineAttribute _$EngineAttributeFromJson(Map<String, dynamic> json) {
  return EngineAttribute(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$EngineAttributeToJson(EngineAttribute instance) {
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

Map<String, dynamic> _$ExportServerEngineAttributeRequestToJson(
    ExportServerEngineAttributeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExportAttributeName', instance.exportAttributeName);
  writeNotNull('ServerName', instance.serverName);
  writeNotNull('InputAttributes',
      instance.inputAttributes?.map((e) => e?.toJson())?.toList());
  return val;
}

ExportServerEngineAttributeResponse
    _$ExportServerEngineAttributeResponseFromJson(Map<String, dynamic> json) {
  return ExportServerEngineAttributeResponse(
    engineAttribute: json['EngineAttribute'] == null
        ? null
        : EngineAttribute.fromJson(
            json['EngineAttribute'] as Map<String, dynamic>),
    serverName: json['ServerName'] as String,
  );
}

Map<String, dynamic> _$ListTagsForResourceRequestToJson(
    ListTagsForResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RestoreServerRequestToJson(
    RestoreServerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackupId', instance.backupId);
  writeNotNull('ServerName', instance.serverName);
  writeNotNull('InstanceType', instance.instanceType);
  writeNotNull('KeyPair', instance.keyPair);
  return val;
}

RestoreServerResponse _$RestoreServerResponseFromJson(
    Map<String, dynamic> json) {
  return RestoreServerResponse();
}

Server _$ServerFromJson(Map<String, dynamic> json) {
  return Server(
    associatePublicIpAddress: json['AssociatePublicIpAddress'] as bool,
    backupRetentionCount: json['BackupRetentionCount'] as int,
    cloudFormationStackArn: json['CloudFormationStackArn'] as String,
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    customDomain: json['CustomDomain'] as String,
    disableAutomatedBackup: json['DisableAutomatedBackup'] as bool,
    endpoint: json['Endpoint'] as String,
    engine: json['Engine'] as String,
    engineAttributes: (json['EngineAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : EngineAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    engineModel: json['EngineModel'] as String,
    engineVersion: json['EngineVersion'] as String,
    instanceProfileArn: json['InstanceProfileArn'] as String,
    instanceType: json['InstanceType'] as String,
    keyPair: json['KeyPair'] as String,
    maintenanceStatus: _$enumDecodeNullable(
        _$MaintenanceStatusEnumMap, json['MaintenanceStatus']),
    preferredBackupWindow: json['PreferredBackupWindow'] as String,
    preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String,
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    serverArn: json['ServerArn'] as String,
    serverName: json['ServerName'] as String,
    serviceRoleArn: json['ServiceRoleArn'] as String,
    status: _$enumDecodeNullable(_$ServerStatusEnumMap, json['Status']),
    statusReason: json['StatusReason'] as String,
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$MaintenanceStatusEnumMap = {
  MaintenanceStatus.success: 'SUCCESS',
  MaintenanceStatus.failed: 'FAILED',
};

const _$ServerStatusEnumMap = {
  ServerStatus.backingUp: 'BACKING_UP',
  ServerStatus.connectionLost: 'CONNECTION_LOST',
  ServerStatus.creating: 'CREATING',
  ServerStatus.deleting: 'DELETING',
  ServerStatus.modifying: 'MODIFYING',
  ServerStatus.failed: 'FAILED',
  ServerStatus.healthy: 'HEALTHY',
  ServerStatus.running: 'RUNNING',
  ServerStatus.restoring: 'RESTORING',
  ServerStatus.setup: 'SETUP',
  ServerStatus.underMaintenance: 'UNDER_MAINTENANCE',
  ServerStatus.unhealthy: 'UNHEALTHY',
  ServerStatus.terminated: 'TERMINATED',
};

ServerEvent _$ServerEventFromJson(Map<String, dynamic> json) {
  return ServerEvent(
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    logUrl: json['LogUrl'] as String,
    message: json['Message'] as String,
    serverName: json['ServerName'] as String,
  );
}

Map<String, dynamic> _$StartMaintenanceRequestToJson(
    StartMaintenanceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerName', instance.serverName);
  writeNotNull('EngineAttributes',
      instance.engineAttributes?.map((e) => e?.toJson())?.toList());
  return val;
}

StartMaintenanceResponse _$StartMaintenanceResponseFromJson(
    Map<String, dynamic> json) {
  return StartMaintenanceResponse(
    server: json['Server'] == null
        ? null
        : Server.fromJson(json['Server'] as Map<String, dynamic>),
  );
}

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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UpdateServerEngineAttributesRequestToJson(
    UpdateServerEngineAttributesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('ServerName', instance.serverName);
  writeNotNull('AttributeValue', instance.attributeValue);
  return val;
}

UpdateServerEngineAttributesResponse
    _$UpdateServerEngineAttributesResponseFromJson(Map<String, dynamic> json) {
  return UpdateServerEngineAttributesResponse(
    server: json['Server'] == null
        ? null
        : Server.fromJson(json['Server'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateServerRequestToJson(UpdateServerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerName', instance.serverName);
  writeNotNull('BackupRetentionCount', instance.backupRetentionCount);
  writeNotNull('DisableAutomatedBackup', instance.disableAutomatedBackup);
  writeNotNull('PreferredBackupWindow', instance.preferredBackupWindow);
  writeNotNull(
      'PreferredMaintenanceWindow', instance.preferredMaintenanceWindow);
  return val;
}

UpdateServerResponse _$UpdateServerResponseFromJson(Map<String, dynamic> json) {
  return UpdateServerResponse(
    server: json['Server'] == null
        ? null
        : Server.fromJson(json['Server'] as Map<String, dynamic>),
  );
}
