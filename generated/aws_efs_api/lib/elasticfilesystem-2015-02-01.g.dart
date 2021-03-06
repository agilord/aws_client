// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elasticfilesystem-2015-02-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessPointDescription _$AccessPointDescriptionFromJson(
    Map<String, dynamic> json) {
  return AccessPointDescription(
    accessPointArn: json['AccessPointArn'] as String?,
    accessPointId: json['AccessPointId'] as String?,
    clientToken: json['ClientToken'] as String?,
    fileSystemId: json['FileSystemId'] as String?,
    lifeCycleState:
        _$enumDecodeNullable(_$LifeCycleStateEnumMap, json['LifeCycleState']),
    name: json['Name'] as String?,
    ownerId: json['OwnerId'] as String?,
    posixUser: json['PosixUser'] == null
        ? null
        : PosixUser.fromJson(json['PosixUser'] as Map<String, dynamic>),
    rootDirectory: json['RootDirectory'] == null
        ? null
        : RootDirectory.fromJson(json['RootDirectory'] as Map<String, dynamic>),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
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

const _$LifeCycleStateEnumMap = {
  LifeCycleState.creating: 'creating',
  LifeCycleState.available: 'available',
  LifeCycleState.updating: 'updating',
  LifeCycleState.deleting: 'deleting',
  LifeCycleState.deleted: 'deleted',
};

BackupPolicy _$BackupPolicyFromJson(Map<String, dynamic> json) {
  return BackupPolicy(
    status: _$enumDecode(_$StatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$BackupPolicyToJson(BackupPolicy instance) =>
    <String, dynamic>{
      'Status': _$StatusEnumMap[instance.status],
    };

const _$StatusEnumMap = {
  Status.enabled: 'ENABLED',
  Status.enabling: 'ENABLING',
  Status.disabled: 'DISABLED',
  Status.disabling: 'DISABLING',
};

BackupPolicyDescription _$BackupPolicyDescriptionFromJson(
    Map<String, dynamic> json) {
  return BackupPolicyDescription(
    backupPolicy: json['BackupPolicy'] == null
        ? null
        : BackupPolicy.fromJson(json['BackupPolicy'] as Map<String, dynamic>),
  );
}

CreationInfo _$CreationInfoFromJson(Map<String, dynamic> json) {
  return CreationInfo(
    ownerGid: json['OwnerGid'] as int,
    ownerUid: json['OwnerUid'] as int,
    permissions: json['Permissions'] as String,
  );
}

Map<String, dynamic> _$CreationInfoToJson(CreationInfo instance) =>
    <String, dynamic>{
      'OwnerGid': instance.ownerGid,
      'OwnerUid': instance.ownerUid,
      'Permissions': instance.permissions,
    };

DescribeAccessPointsResponse _$DescribeAccessPointsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAccessPointsResponse(
    accessPoints: (json['AccessPoints'] as List<dynamic>?)
        ?.map((e) => AccessPointDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

DescribeFileSystemsResponse _$DescribeFileSystemsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFileSystemsResponse(
    fileSystems: (json['FileSystems'] as List<dynamic>?)
        ?.map((e) => FileSystemDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    marker: json['Marker'] as String?,
    nextMarker: json['NextMarker'] as String?,
  );
}

DescribeMountTargetSecurityGroupsResponse
    _$DescribeMountTargetSecurityGroupsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeMountTargetSecurityGroupsResponse(
    securityGroups: (json['SecurityGroups'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );
}

DescribeMountTargetsResponse _$DescribeMountTargetsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeMountTargetsResponse(
    marker: json['Marker'] as String?,
    mountTargets: (json['MountTargets'] as List<dynamic>?)
        ?.map((e) => MountTargetDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextMarker: json['NextMarker'] as String?,
  );
}

DescribeTagsResponse _$DescribeTagsResponseFromJson(Map<String, dynamic> json) {
  return DescribeTagsResponse(
    tags: (json['Tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    marker: json['Marker'] as String?,
    nextMarker: json['NextMarker'] as String?,
  );
}

FileSystemDescription _$FileSystemDescriptionFromJson(
    Map<String, dynamic> json) {
  return FileSystemDescription(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    creationToken: json['CreationToken'] as String,
    fileSystemId: json['FileSystemId'] as String,
    lifeCycleState:
        _$enumDecode(_$LifeCycleStateEnumMap, json['LifeCycleState']),
    numberOfMountTargets: json['NumberOfMountTargets'] as int,
    ownerId: json['OwnerId'] as String,
    performanceMode:
        _$enumDecode(_$PerformanceModeEnumMap, json['PerformanceMode']),
    sizeInBytes:
        FileSystemSize.fromJson(json['SizeInBytes'] as Map<String, dynamic>),
    tags: (json['Tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    encrypted: json['Encrypted'] as bool?,
    fileSystemArn: json['FileSystemArn'] as String?,
    kmsKeyId: json['KmsKeyId'] as String?,
    name: json['Name'] as String?,
    provisionedThroughputInMibps:
        (json['ProvisionedThroughputInMibps'] as num?)?.toDouble(),
    throughputMode:
        _$enumDecodeNullable(_$ThroughputModeEnumMap, json['ThroughputMode']),
  );
}

const _$PerformanceModeEnumMap = {
  PerformanceMode.generalPurpose: 'generalPurpose',
  PerformanceMode.maxIO: 'maxIO',
};

const _$ThroughputModeEnumMap = {
  ThroughputMode.bursting: 'bursting',
  ThroughputMode.provisioned: 'provisioned',
};

FileSystemPolicyDescription _$FileSystemPolicyDescriptionFromJson(
    Map<String, dynamic> json) {
  return FileSystemPolicyDescription(
    fileSystemId: json['FileSystemId'] as String?,
    policy: json['Policy'] as String?,
  );
}

FileSystemSize _$FileSystemSizeFromJson(Map<String, dynamic> json) {
  return FileSystemSize(
    value: json['Value'] as int,
    timestamp: const UnixDateTimeConverter().fromJson(json['Timestamp']),
    valueInIA: json['ValueInIA'] as int?,
    valueInStandard: json['ValueInStandard'] as int?,
  );
}

LifecycleConfigurationDescription _$LifecycleConfigurationDescriptionFromJson(
    Map<String, dynamic> json) {
  return LifecycleConfigurationDescription(
    lifecyclePolicies: (json['LifecyclePolicies'] as List<dynamic>?)
        ?.map((e) => LifecyclePolicy.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

LifecyclePolicy _$LifecyclePolicyFromJson(Map<String, dynamic> json) {
  return LifecyclePolicy(
    transitionToIA: _$enumDecodeNullable(
        _$TransitionToIARulesEnumMap, json['TransitionToIA']),
  );
}

Map<String, dynamic> _$LifecyclePolicyToJson(LifecyclePolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'TransitionToIA', _$TransitionToIARulesEnumMap[instance.transitionToIA]);
  return val;
}

const _$TransitionToIARulesEnumMap = {
  TransitionToIARules.after_7Days: 'AFTER_7_DAYS',
  TransitionToIARules.after_14Days: 'AFTER_14_DAYS',
  TransitionToIARules.after_30Days: 'AFTER_30_DAYS',
  TransitionToIARules.after_60Days: 'AFTER_60_DAYS',
  TransitionToIARules.after_90Days: 'AFTER_90_DAYS',
};

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextToken: json['NextToken'] as String?,
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

MountTargetDescription _$MountTargetDescriptionFromJson(
    Map<String, dynamic> json) {
  return MountTargetDescription(
    fileSystemId: json['FileSystemId'] as String,
    lifeCycleState:
        _$enumDecode(_$LifeCycleStateEnumMap, json['LifeCycleState']),
    mountTargetId: json['MountTargetId'] as String,
    subnetId: json['SubnetId'] as String,
    availabilityZoneId: json['AvailabilityZoneId'] as String?,
    availabilityZoneName: json['AvailabilityZoneName'] as String?,
    ipAddress: json['IpAddress'] as String?,
    networkInterfaceId: json['NetworkInterfaceId'] as String?,
    ownerId: json['OwnerId'] as String?,
    vpcId: json['VpcId'] as String?,
  );
}

PosixUser _$PosixUserFromJson(Map<String, dynamic> json) {
  return PosixUser(
    gid: json['Gid'] as int,
    uid: json['Uid'] as int,
    secondaryGids: (json['SecondaryGids'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
  );
}

Map<String, dynamic> _$PosixUserToJson(PosixUser instance) {
  final val = <String, dynamic>{
    'Gid': instance.gid,
    'Uid': instance.uid,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecondaryGids', instance.secondaryGids);
  return val;
}

RootDirectory _$RootDirectoryFromJson(Map<String, dynamic> json) {
  return RootDirectory(
    creationInfo: json['CreationInfo'] == null
        ? null
        : CreationInfo.fromJson(json['CreationInfo'] as Map<String, dynamic>),
    path: json['Path'] as String?,
  );
}

Map<String, dynamic> _$RootDirectoryToJson(RootDirectory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreationInfo', instance.creationInfo?.toJson());
  writeNotNull('Path', instance.path);
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };
