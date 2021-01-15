// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-08-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateWorkspaceResponse _$CreateWorkspaceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWorkspaceResponse(
    arn: json['arn'] as String,
    status: json['status'] == null
        ? null
        : WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
    workspaceId: json['workspaceId'] as String,
  );
}

DescribeWorkspaceResponse _$DescribeWorkspaceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkspaceResponse(
    workspace: json['workspace'] == null
        ? null
        : WorkspaceDescription.fromJson(
            json['workspace'] as Map<String, dynamic>),
  );
}

ListWorkspacesResponse _$ListWorkspacesResponseFromJson(
    Map<String, dynamic> json) {
  return ListWorkspacesResponse(
    workspaces: (json['workspaces'] as List)
        ?.map((e) => e == null
            ? null
            : WorkspaceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

WorkspaceDescription _$WorkspaceDescriptionFromJson(Map<String, dynamic> json) {
  return WorkspaceDescription(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    status: json['status'] == null
        ? null
        : WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
    workspaceId: json['workspaceId'] as String,
    alias: json['alias'] as String,
    prometheusEndpoint: json['prometheusEndpoint'] as String,
  );
}

WorkspaceStatus _$WorkspaceStatusFromJson(Map<String, dynamic> json) {
  return WorkspaceStatus(
    statusCode:
        _$enumDecodeNullable(_$WorkspaceStatusCodeEnumMap, json['statusCode']),
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

const _$WorkspaceStatusCodeEnumMap = {
  WorkspaceStatusCode.creating: 'CREATING',
  WorkspaceStatusCode.active: 'ACTIVE',
  WorkspaceStatusCode.updating: 'UPDATING',
  WorkspaceStatusCode.deleting: 'DELETING',
  WorkspaceStatusCode.creationFailed: 'CREATION_FAILED',
};

WorkspaceSummary _$WorkspaceSummaryFromJson(Map<String, dynamic> json) {
  return WorkspaceSummary(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    status: json['status'] == null
        ? null
        : WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
    workspaceId: json['workspaceId'] as String,
    alias: json['alias'] as String,
  );
}
