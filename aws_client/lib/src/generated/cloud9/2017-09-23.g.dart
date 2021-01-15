// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-09-23.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEnvironmentEC2Result _$CreateEnvironmentEC2ResultFromJson(
    Map<String, dynamic> json) {
  return CreateEnvironmentEC2Result(
    environmentId: json['environmentId'] as String,
  );
}

CreateEnvironmentMembershipResult _$CreateEnvironmentMembershipResultFromJson(
    Map<String, dynamic> json) {
  return CreateEnvironmentMembershipResult(
    membership: json['membership'] == null
        ? null
        : EnvironmentMember.fromJson(
            json['membership'] as Map<String, dynamic>),
  );
}

DeleteEnvironmentMembershipResult _$DeleteEnvironmentMembershipResultFromJson(
    Map<String, dynamic> json) {
  return DeleteEnvironmentMembershipResult();
}

DeleteEnvironmentResult _$DeleteEnvironmentResultFromJson(
    Map<String, dynamic> json) {
  return DeleteEnvironmentResult();
}

DescribeEnvironmentMembershipsResult
    _$DescribeEnvironmentMembershipsResultFromJson(Map<String, dynamic> json) {
  return DescribeEnvironmentMembershipsResult(
    memberships: (json['memberships'] as List)
        ?.map((e) => e == null
            ? null
            : EnvironmentMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeEnvironmentStatusResult _$DescribeEnvironmentStatusResultFromJson(
    Map<String, dynamic> json) {
  return DescribeEnvironmentStatusResult(
    message: json['message'] as String,
    status: _$enumDecodeNullable(_$EnvironmentStatusEnumMap, json['status']),
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
  EnvironmentStatus.error: 'error',
  EnvironmentStatus.creating: 'creating',
  EnvironmentStatus.connecting: 'connecting',
  EnvironmentStatus.ready: 'ready',
  EnvironmentStatus.stopping: 'stopping',
  EnvironmentStatus.stopped: 'stopped',
  EnvironmentStatus.deleting: 'deleting',
};

DescribeEnvironmentsResult _$DescribeEnvironmentsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeEnvironmentsResult(
    environments: (json['environments'] as List)
        ?.map((e) =>
            e == null ? null : Environment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Environment _$EnvironmentFromJson(Map<String, dynamic> json) {
  return Environment(
    arn: json['arn'] as String,
    connectionType:
        _$enumDecodeNullable(_$ConnectionTypeEnumMap, json['connectionType']),
    description: json['description'] as String,
    id: json['id'] as String,
    lifecycle: json['lifecycle'] == null
        ? null
        : EnvironmentLifecycle.fromJson(
            json['lifecycle'] as Map<String, dynamic>),
    name: json['name'] as String,
    ownerArn: json['ownerArn'] as String,
    type: _$enumDecodeNullable(_$EnvironmentTypeEnumMap, json['type']),
  );
}

const _$ConnectionTypeEnumMap = {
  ConnectionType.connectSsh: 'CONNECT_SSH',
  ConnectionType.connectSsm: 'CONNECT_SSM',
};

const _$EnvironmentTypeEnumMap = {
  EnvironmentType.ssh: 'ssh',
  EnvironmentType.ec2: 'ec2',
};

EnvironmentLifecycle _$EnvironmentLifecycleFromJson(Map<String, dynamic> json) {
  return EnvironmentLifecycle(
    failureResource: json['failureResource'] as String,
    reason: json['reason'] as String,
    status: _$enumDecodeNullable(
        _$EnvironmentLifecycleStatusEnumMap, json['status']),
  );
}

const _$EnvironmentLifecycleStatusEnumMap = {
  EnvironmentLifecycleStatus.creating: 'CREATING',
  EnvironmentLifecycleStatus.created: 'CREATED',
  EnvironmentLifecycleStatus.createFailed: 'CREATE_FAILED',
  EnvironmentLifecycleStatus.deleting: 'DELETING',
  EnvironmentLifecycleStatus.deleteFailed: 'DELETE_FAILED',
};

EnvironmentMember _$EnvironmentMemberFromJson(Map<String, dynamic> json) {
  return EnvironmentMember(
    environmentId: json['environmentId'] as String,
    lastAccess: const UnixDateTimeConverter().fromJson(json['lastAccess']),
    permissions:
        _$enumDecodeNullable(_$PermissionsEnumMap, json['permissions']),
    userArn: json['userArn'] as String,
    userId: json['userId'] as String,
  );
}

const _$PermissionsEnumMap = {
  Permissions.owner: 'owner',
  Permissions.readWrite: 'read-write',
  Permissions.readOnly: 'read-only',
};

ListEnvironmentsResult _$ListEnvironmentsResultFromJson(
    Map<String, dynamic> json) {
  return ListEnvironmentsResult(
    environmentIds:
        (json['environmentIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateEnvironmentMembershipResult _$UpdateEnvironmentMembershipResultFromJson(
    Map<String, dynamic> json) {
  return UpdateEnvironmentMembershipResult(
    membership: json['membership'] == null
        ? null
        : EnvironmentMember.fromJson(
            json['membership'] as Map<String, dynamic>),
  );
}

UpdateEnvironmentResult _$UpdateEnvironmentResultFromJson(
    Map<String, dynamic> json) {
  return UpdateEnvironmentResult();
}
