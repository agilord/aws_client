// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-11-09.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentListEntry _$AgentListEntryFromJson(Map<String, dynamic> json) {
  return AgentListEntry(
    agentArn: json['AgentArn'] as String,
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$AgentStatusEnumMap, json['Status']),
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

const _$AgentStatusEnumMap = {
  AgentStatus.online: 'ONLINE',
  AgentStatus.offline: 'OFFLINE',
};

CancelTaskExecutionResponse _$CancelTaskExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return CancelTaskExecutionResponse();
}

CreateAgentResponse _$CreateAgentResponseFromJson(Map<String, dynamic> json) {
  return CreateAgentResponse(
    agentArn: json['AgentArn'] as String,
  );
}

CreateLocationEfsResponse _$CreateLocationEfsResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLocationEfsResponse(
    locationArn: json['LocationArn'] as String,
  );
}

CreateLocationFsxWindowsResponse _$CreateLocationFsxWindowsResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLocationFsxWindowsResponse(
    locationArn: json['LocationArn'] as String,
  );
}

CreateLocationNfsResponse _$CreateLocationNfsResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLocationNfsResponse(
    locationArn: json['LocationArn'] as String,
  );
}

CreateLocationObjectStorageResponse
    _$CreateLocationObjectStorageResponseFromJson(Map<String, dynamic> json) {
  return CreateLocationObjectStorageResponse(
    locationArn: json['LocationArn'] as String,
  );
}

CreateLocationS3Response _$CreateLocationS3ResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLocationS3Response(
    locationArn: json['LocationArn'] as String,
  );
}

CreateLocationSmbResponse _$CreateLocationSmbResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLocationSmbResponse(
    locationArn: json['LocationArn'] as String,
  );
}

CreateTaskResponse _$CreateTaskResponseFromJson(Map<String, dynamic> json) {
  return CreateTaskResponse(
    taskArn: json['TaskArn'] as String,
  );
}

DeleteAgentResponse _$DeleteAgentResponseFromJson(Map<String, dynamic> json) {
  return DeleteAgentResponse();
}

DeleteLocationResponse _$DeleteLocationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLocationResponse();
}

DeleteTaskResponse _$DeleteTaskResponseFromJson(Map<String, dynamic> json) {
  return DeleteTaskResponse();
}

DescribeAgentResponse _$DescribeAgentResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAgentResponse(
    agentArn: json['AgentArn'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    endpointType:
        _$enumDecodeNullable(_$EndpointTypeEnumMap, json['EndpointType']),
    lastConnectionTime:
        const UnixDateTimeConverter().fromJson(json['LastConnectionTime']),
    name: json['Name'] as String,
    privateLinkConfig: json['PrivateLinkConfig'] == null
        ? null
        : PrivateLinkConfig.fromJson(
            json['PrivateLinkConfig'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$AgentStatusEnumMap, json['Status']),
  );
}

const _$EndpointTypeEnumMap = {
  EndpointType.public: 'PUBLIC',
  EndpointType.privateLink: 'PRIVATE_LINK',
  EndpointType.fips: 'FIPS',
};

DescribeLocationEfsResponse _$DescribeLocationEfsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLocationEfsResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    ec2Config: json['Ec2Config'] == null
        ? null
        : Ec2Config.fromJson(json['Ec2Config'] as Map<String, dynamic>),
    locationArn: json['LocationArn'] as String,
    locationUri: json['LocationUri'] as String,
  );
}

DescribeLocationFsxWindowsResponse _$DescribeLocationFsxWindowsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLocationFsxWindowsResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domain: json['Domain'] as String,
    locationArn: json['LocationArn'] as String,
    locationUri: json['LocationUri'] as String,
    securityGroupArns:
        (json['SecurityGroupArns'] as List)?.map((e) => e as String)?.toList(),
    user: json['User'] as String,
  );
}

DescribeLocationNfsResponse _$DescribeLocationNfsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLocationNfsResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    locationArn: json['LocationArn'] as String,
    locationUri: json['LocationUri'] as String,
    mountOptions: json['MountOptions'] == null
        ? null
        : NfsMountOptions.fromJson(
            json['MountOptions'] as Map<String, dynamic>),
    onPremConfig: json['OnPremConfig'] == null
        ? null
        : OnPremConfig.fromJson(json['OnPremConfig'] as Map<String, dynamic>),
  );
}

DescribeLocationObjectStorageResponse
    _$DescribeLocationObjectStorageResponseFromJson(Map<String, dynamic> json) {
  return DescribeLocationObjectStorageResponse(
    accessKey: json['AccessKey'] as String,
    agentArns: (json['AgentArns'] as List)?.map((e) => e as String)?.toList(),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    locationArn: json['LocationArn'] as String,
    locationUri: json['LocationUri'] as String,
    serverPort: json['ServerPort'] as int,
    serverProtocol: _$enumDecodeNullable(
        _$ObjectStorageServerProtocolEnumMap, json['ServerProtocol']),
  );
}

const _$ObjectStorageServerProtocolEnumMap = {
  ObjectStorageServerProtocol.https: 'HTTPS',
  ObjectStorageServerProtocol.http: 'HTTP',
};

DescribeLocationS3Response _$DescribeLocationS3ResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLocationS3Response(
    agentArns: (json['AgentArns'] as List)?.map((e) => e as String)?.toList(),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    locationArn: json['LocationArn'] as String,
    locationUri: json['LocationUri'] as String,
    s3Config: json['S3Config'] == null
        ? null
        : S3Config.fromJson(json['S3Config'] as Map<String, dynamic>),
    s3StorageClass:
        _$enumDecodeNullable(_$S3StorageClassEnumMap, json['S3StorageClass']),
  );
}

const _$S3StorageClassEnumMap = {
  S3StorageClass.standard: 'STANDARD',
  S3StorageClass.standardIa: 'STANDARD_IA',
  S3StorageClass.onezoneIa: 'ONEZONE_IA',
  S3StorageClass.intelligentTiering: 'INTELLIGENT_TIERING',
  S3StorageClass.glacier: 'GLACIER',
  S3StorageClass.deepArchive: 'DEEP_ARCHIVE',
  S3StorageClass.outposts: 'OUTPOSTS',
};

DescribeLocationSmbResponse _$DescribeLocationSmbResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLocationSmbResponse(
    agentArns: (json['AgentArns'] as List)?.map((e) => e as String)?.toList(),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domain: json['Domain'] as String,
    locationArn: json['LocationArn'] as String,
    locationUri: json['LocationUri'] as String,
    mountOptions: json['MountOptions'] == null
        ? null
        : SmbMountOptions.fromJson(
            json['MountOptions'] as Map<String, dynamic>),
    user: json['User'] as String,
  );
}

DescribeTaskExecutionResponse _$DescribeTaskExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTaskExecutionResponse(
    bytesTransferred: json['BytesTransferred'] as int,
    bytesWritten: json['BytesWritten'] as int,
    estimatedBytesToTransfer: json['EstimatedBytesToTransfer'] as int,
    estimatedFilesToTransfer: json['EstimatedFilesToTransfer'] as int,
    excludes: (json['Excludes'] as List)
        ?.map((e) =>
            e == null ? null : FilterRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    filesTransferred: json['FilesTransferred'] as int,
    includes: (json['Includes'] as List)
        ?.map((e) =>
            e == null ? null : FilterRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    options: json['Options'] == null
        ? null
        : Options.fromJson(json['Options'] as Map<String, dynamic>),
    result: json['Result'] == null
        ? null
        : TaskExecutionResultDetail.fromJson(
            json['Result'] as Map<String, dynamic>),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(_$TaskExecutionStatusEnumMap, json['Status']),
    taskExecutionArn: json['TaskExecutionArn'] as String,
  );
}

const _$TaskExecutionStatusEnumMap = {
  TaskExecutionStatus.queued: 'QUEUED',
  TaskExecutionStatus.launching: 'LAUNCHING',
  TaskExecutionStatus.preparing: 'PREPARING',
  TaskExecutionStatus.transferring: 'TRANSFERRING',
  TaskExecutionStatus.verifying: 'VERIFYING',
  TaskExecutionStatus.success: 'SUCCESS',
  TaskExecutionStatus.error: 'ERROR',
};

DescribeTaskResponse _$DescribeTaskResponseFromJson(Map<String, dynamic> json) {
  return DescribeTaskResponse(
    cloudWatchLogGroupArn: json['CloudWatchLogGroupArn'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    currentTaskExecutionArn: json['CurrentTaskExecutionArn'] as String,
    destinationLocationArn: json['DestinationLocationArn'] as String,
    destinationNetworkInterfaceArns:
        (json['DestinationNetworkInterfaceArns'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    errorCode: json['ErrorCode'] as String,
    errorDetail: json['ErrorDetail'] as String,
    excludes: (json['Excludes'] as List)
        ?.map((e) =>
            e == null ? null : FilterRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    options: json['Options'] == null
        ? null
        : Options.fromJson(json['Options'] as Map<String, dynamic>),
    schedule: json['Schedule'] == null
        ? null
        : TaskSchedule.fromJson(json['Schedule'] as Map<String, dynamic>),
    sourceLocationArn: json['SourceLocationArn'] as String,
    sourceNetworkInterfaceArns: (json['SourceNetworkInterfaceArns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    status: _$enumDecodeNullable(_$TaskStatusEnumMap, json['Status']),
    taskArn: json['TaskArn'] as String,
  );
}

const _$TaskStatusEnumMap = {
  TaskStatus.available: 'AVAILABLE',
  TaskStatus.creating: 'CREATING',
  TaskStatus.queued: 'QUEUED',
  TaskStatus.running: 'RUNNING',
  TaskStatus.unavailable: 'UNAVAILABLE',
};

Ec2Config _$Ec2ConfigFromJson(Map<String, dynamic> json) {
  return Ec2Config(
    securityGroupArns:
        (json['SecurityGroupArns'] as List)?.map((e) => e as String)?.toList(),
    subnetArn: json['SubnetArn'] as String,
  );
}

Map<String, dynamic> _$Ec2ConfigToJson(Ec2Config instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupArns', instance.securityGroupArns);
  writeNotNull('SubnetArn', instance.subnetArn);
  return val;
}

FilterRule _$FilterRuleFromJson(Map<String, dynamic> json) {
  return FilterRule(
    filterType: _$enumDecodeNullable(_$FilterTypeEnumMap, json['FilterType']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$FilterRuleToJson(FilterRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FilterType', _$FilterTypeEnumMap[instance.filterType]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$FilterTypeEnumMap = {
  FilterType.simplePattern: 'SIMPLE_PATTERN',
};

ListAgentsResponse _$ListAgentsResponseFromJson(Map<String, dynamic> json) {
  return ListAgentsResponse(
    agents: (json['Agents'] as List)
        ?.map((e) => e == null
            ? null
            : AgentListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLocationsResponse _$ListLocationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLocationsResponse(
    locations: (json['Locations'] as List)
        ?.map((e) => e == null
            ? null
            : LocationListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) =>
            e == null ? null : TagListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTaskExecutionsResponse _$ListTaskExecutionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTaskExecutionsResponse(
    nextToken: json['NextToken'] as String,
    taskExecutions: (json['TaskExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : TaskExecutionListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTasksResponse _$ListTasksResponseFromJson(Map<String, dynamic> json) {
  return ListTasksResponse(
    nextToken: json['NextToken'] as String,
    tasks: (json['Tasks'] as List)
        ?.map((e) => e == null
            ? null
            : TaskListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LocationFilterToJson(LocationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$LocationFilterNameEnumMap[instance.name]);
  writeNotNull('Operator', _$OperatorEnumMap[instance.operator]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$LocationFilterNameEnumMap = {
  LocationFilterName.locationUri: 'LocationUri',
  LocationFilterName.locationType: 'LocationType',
  LocationFilterName.creationTime: 'CreationTime',
};

const _$OperatorEnumMap = {
  Operator.equals: 'Equals',
  Operator.notEquals: 'NotEquals',
  Operator.$in: 'In',
  Operator.lessThanOrEqual: 'LessThanOrEqual',
  Operator.lessThan: 'LessThan',
  Operator.greaterThanOrEqual: 'GreaterThanOrEqual',
  Operator.greaterThan: 'GreaterThan',
  Operator.contains: 'Contains',
  Operator.notContains: 'NotContains',
  Operator.beginsWith: 'BeginsWith',
};

LocationListEntry _$LocationListEntryFromJson(Map<String, dynamic> json) {
  return LocationListEntry(
    locationArn: json['LocationArn'] as String,
    locationUri: json['LocationUri'] as String,
  );
}

NfsMountOptions _$NfsMountOptionsFromJson(Map<String, dynamic> json) {
  return NfsMountOptions(
    version: _$enumDecodeNullable(_$NfsVersionEnumMap, json['Version']),
  );
}

Map<String, dynamic> _$NfsMountOptionsToJson(NfsMountOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Version', _$NfsVersionEnumMap[instance.version]);
  return val;
}

const _$NfsVersionEnumMap = {
  NfsVersion.automatic: 'AUTOMATIC',
  NfsVersion.nfs3: 'NFS3',
  NfsVersion.nfs4_0: 'NFS4_0',
  NfsVersion.nfs4_1: 'NFS4_1',
};

OnPremConfig _$OnPremConfigFromJson(Map<String, dynamic> json) {
  return OnPremConfig(
    agentArns: (json['AgentArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$OnPremConfigToJson(OnPremConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AgentArns', instance.agentArns);
  return val;
}

Options _$OptionsFromJson(Map<String, dynamic> json) {
  return Options(
    atime: _$enumDecodeNullable(_$AtimeEnumMap, json['Atime']),
    bytesPerSecond: json['BytesPerSecond'] as int,
    gid: _$enumDecodeNullable(_$GidEnumMap, json['Gid']),
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['LogLevel']),
    mtime: _$enumDecodeNullable(_$MtimeEnumMap, json['Mtime']),
    overwriteMode:
        _$enumDecodeNullable(_$OverwriteModeEnumMap, json['OverwriteMode']),
    posixPermissions: _$enumDecodeNullable(
        _$PosixPermissionsEnumMap, json['PosixPermissions']),
    preserveDeletedFiles: _$enumDecodeNullable(
        _$PreserveDeletedFilesEnumMap, json['PreserveDeletedFiles']),
    preserveDevices:
        _$enumDecodeNullable(_$PreserveDevicesEnumMap, json['PreserveDevices']),
    taskQueueing:
        _$enumDecodeNullable(_$TaskQueueingEnumMap, json['TaskQueueing']),
    transferMode:
        _$enumDecodeNullable(_$TransferModeEnumMap, json['TransferMode']),
    uid: _$enumDecodeNullable(_$UidEnumMap, json['Uid']),
    verifyMode: _$enumDecodeNullable(_$VerifyModeEnumMap, json['VerifyMode']),
  );
}

Map<String, dynamic> _$OptionsToJson(Options instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Atime', _$AtimeEnumMap[instance.atime]);
  writeNotNull('BytesPerSecond', instance.bytesPerSecond);
  writeNotNull('Gid', _$GidEnumMap[instance.gid]);
  writeNotNull('LogLevel', _$LogLevelEnumMap[instance.logLevel]);
  writeNotNull('Mtime', _$MtimeEnumMap[instance.mtime]);
  writeNotNull('OverwriteMode', _$OverwriteModeEnumMap[instance.overwriteMode]);
  writeNotNull(
      'PosixPermissions', _$PosixPermissionsEnumMap[instance.posixPermissions]);
  writeNotNull('PreserveDeletedFiles',
      _$PreserveDeletedFilesEnumMap[instance.preserveDeletedFiles]);
  writeNotNull(
      'PreserveDevices', _$PreserveDevicesEnumMap[instance.preserveDevices]);
  writeNotNull('TaskQueueing', _$TaskQueueingEnumMap[instance.taskQueueing]);
  writeNotNull('TransferMode', _$TransferModeEnumMap[instance.transferMode]);
  writeNotNull('Uid', _$UidEnumMap[instance.uid]);
  writeNotNull('VerifyMode', _$VerifyModeEnumMap[instance.verifyMode]);
  return val;
}

const _$AtimeEnumMap = {
  Atime.none: 'NONE',
  Atime.bestEffort: 'BEST_EFFORT',
};

const _$GidEnumMap = {
  Gid.none: 'NONE',
  Gid.intValue: 'INT_VALUE',
  Gid.name: 'NAME',
  Gid.both: 'BOTH',
};

const _$LogLevelEnumMap = {
  LogLevel.off: 'OFF',
  LogLevel.basic: 'BASIC',
  LogLevel.transfer: 'TRANSFER',
};

const _$MtimeEnumMap = {
  Mtime.none: 'NONE',
  Mtime.preserve: 'PRESERVE',
};

const _$OverwriteModeEnumMap = {
  OverwriteMode.always: 'ALWAYS',
  OverwriteMode.never: 'NEVER',
};

const _$PosixPermissionsEnumMap = {
  PosixPermissions.none: 'NONE',
  PosixPermissions.preserve: 'PRESERVE',
};

const _$PreserveDeletedFilesEnumMap = {
  PreserveDeletedFiles.preserve: 'PRESERVE',
  PreserveDeletedFiles.remove: 'REMOVE',
};

const _$PreserveDevicesEnumMap = {
  PreserveDevices.none: 'NONE',
  PreserveDevices.preserve: 'PRESERVE',
};

const _$TaskQueueingEnumMap = {
  TaskQueueing.enabled: 'ENABLED',
  TaskQueueing.disabled: 'DISABLED',
};

const _$TransferModeEnumMap = {
  TransferMode.changed: 'CHANGED',
  TransferMode.all: 'ALL',
};

const _$UidEnumMap = {
  Uid.none: 'NONE',
  Uid.intValue: 'INT_VALUE',
  Uid.name: 'NAME',
  Uid.both: 'BOTH',
};

const _$VerifyModeEnumMap = {
  VerifyMode.pointInTimeConsistent: 'POINT_IN_TIME_CONSISTENT',
  VerifyMode.onlyFilesTransferred: 'ONLY_FILES_TRANSFERRED',
  VerifyMode.none: 'NONE',
};

PrivateLinkConfig _$PrivateLinkConfigFromJson(Map<String, dynamic> json) {
  return PrivateLinkConfig(
    privateLinkEndpoint: json['PrivateLinkEndpoint'] as String,
    securityGroupArns:
        (json['SecurityGroupArns'] as List)?.map((e) => e as String)?.toList(),
    subnetArns: (json['SubnetArns'] as List)?.map((e) => e as String)?.toList(),
    vpcEndpointId: json['VpcEndpointId'] as String,
  );
}

S3Config _$S3ConfigFromJson(Map<String, dynamic> json) {
  return S3Config(
    bucketAccessRoleArn: json['BucketAccessRoleArn'] as String,
  );
}

Map<String, dynamic> _$S3ConfigToJson(S3Config instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketAccessRoleArn', instance.bucketAccessRoleArn);
  return val;
}

SmbMountOptions _$SmbMountOptionsFromJson(Map<String, dynamic> json) {
  return SmbMountOptions(
    version: _$enumDecodeNullable(_$SmbVersionEnumMap, json['Version']),
  );
}

Map<String, dynamic> _$SmbMountOptionsToJson(SmbMountOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Version', _$SmbVersionEnumMap[instance.version]);
  return val;
}

const _$SmbVersionEnumMap = {
  SmbVersion.automatic: 'AUTOMATIC',
  SmbVersion.smb2: 'SMB2',
  SmbVersion.smb3: 'SMB3',
};

StartTaskExecutionResponse _$StartTaskExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return StartTaskExecutionResponse(
    taskExecutionArn: json['TaskExecutionArn'] as String,
  );
}

TagListEntry _$TagListEntryFromJson(Map<String, dynamic> json) {
  return TagListEntry(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagListEntryToJson(TagListEntry instance) {
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TaskExecutionListEntry _$TaskExecutionListEntryFromJson(
    Map<String, dynamic> json) {
  return TaskExecutionListEntry(
    status: _$enumDecodeNullable(_$TaskExecutionStatusEnumMap, json['Status']),
    taskExecutionArn: json['TaskExecutionArn'] as String,
  );
}

TaskExecutionResultDetail _$TaskExecutionResultDetailFromJson(
    Map<String, dynamic> json) {
  return TaskExecutionResultDetail(
    errorCode: json['ErrorCode'] as String,
    errorDetail: json['ErrorDetail'] as String,
    prepareDuration: json['PrepareDuration'] as int,
    prepareStatus:
        _$enumDecodeNullable(_$PhaseStatusEnumMap, json['PrepareStatus']),
    totalDuration: json['TotalDuration'] as int,
    transferDuration: json['TransferDuration'] as int,
    transferStatus:
        _$enumDecodeNullable(_$PhaseStatusEnumMap, json['TransferStatus']),
    verifyDuration: json['VerifyDuration'] as int,
    verifyStatus:
        _$enumDecodeNullable(_$PhaseStatusEnumMap, json['VerifyStatus']),
  );
}

const _$PhaseStatusEnumMap = {
  PhaseStatus.pending: 'PENDING',
  PhaseStatus.success: 'SUCCESS',
  PhaseStatus.error: 'ERROR',
};

Map<String, dynamic> _$TaskFilterToJson(TaskFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$TaskFilterNameEnumMap[instance.name]);
  writeNotNull('Operator', _$OperatorEnumMap[instance.operator]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$TaskFilterNameEnumMap = {
  TaskFilterName.locationId: 'LocationId',
  TaskFilterName.creationTime: 'CreationTime',
};

TaskListEntry _$TaskListEntryFromJson(Map<String, dynamic> json) {
  return TaskListEntry(
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$TaskStatusEnumMap, json['Status']),
    taskArn: json['TaskArn'] as String,
  );
}

TaskSchedule _$TaskScheduleFromJson(Map<String, dynamic> json) {
  return TaskSchedule(
    scheduleExpression: json['ScheduleExpression'] as String,
  );
}

Map<String, dynamic> _$TaskScheduleToJson(TaskSchedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScheduleExpression', instance.scheduleExpression);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateAgentResponse _$UpdateAgentResponseFromJson(Map<String, dynamic> json) {
  return UpdateAgentResponse();
}

UpdateTaskExecutionResponse _$UpdateTaskExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTaskExecutionResponse();
}

UpdateTaskResponse _$UpdateTaskResponseFromJson(Map<String, dynamic> json) {
  return UpdateTaskResponse();
}
