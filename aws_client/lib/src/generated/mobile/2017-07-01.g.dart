// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-07-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountActionRequiredException _$AccountActionRequiredExceptionFromJson(
    Map<String, dynamic> json) {
  return AccountActionRequiredException(
    message: json['message'] as String,
  );
}

BadRequestException _$BadRequestExceptionFromJson(Map<String, dynamic> json) {
  return BadRequestException(
    message: json['message'] as String,
  );
}

BundleDetails _$BundleDetailsFromJson(Map<String, dynamic> json) {
  return BundleDetails(
    availablePlatforms: (json['availablePlatforms'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PlatformEnumMap, e))
        ?.toList(),
    bundleId: json['bundleId'] as String,
    description: json['description'] as String,
    iconUrl: json['iconUrl'] as String,
    title: json['title'] as String,
    version: json['version'] as String,
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

const _$PlatformEnumMap = {
  Platform.osx: 'OSX',
  Platform.windows: 'WINDOWS',
  Platform.linux: 'LINUX',
  Platform.objc: 'OBJC',
  Platform.swift: 'SWIFT',
  Platform.android: 'ANDROID',
  Platform.javascript: 'JAVASCRIPT',
};

CreateProjectResult _$CreateProjectResultFromJson(Map<String, dynamic> json) {
  return CreateProjectResult(
    details: json['details'] == null
        ? null
        : ProjectDetails.fromJson(json['details'] as Map<String, dynamic>),
  );
}

DeleteProjectResult _$DeleteProjectResultFromJson(Map<String, dynamic> json) {
  return DeleteProjectResult(
    deletedResources: (json['deletedResources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    orphanedResources: (json['orphanedResources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeBundleResult _$DescribeBundleResultFromJson(Map<String, dynamic> json) {
  return DescribeBundleResult(
    details: json['details'] == null
        ? null
        : BundleDetails.fromJson(json['details'] as Map<String, dynamic>),
  );
}

DescribeProjectResult _$DescribeProjectResultFromJson(
    Map<String, dynamic> json) {
  return DescribeProjectResult(
    details: json['details'] == null
        ? null
        : ProjectDetails.fromJson(json['details'] as Map<String, dynamic>),
  );
}

ExportBundleResult _$ExportBundleResultFromJson(Map<String, dynamic> json) {
  return ExportBundleResult(
    downloadUrl: json['downloadUrl'] as String,
  );
}

ExportProjectResult _$ExportProjectResultFromJson(Map<String, dynamic> json) {
  return ExportProjectResult(
    downloadUrl: json['downloadUrl'] as String,
    shareUrl: json['shareUrl'] as String,
    snapshotId: json['snapshotId'] as String,
  );
}

InternalFailureException _$InternalFailureExceptionFromJson(
    Map<String, dynamic> json) {
  return InternalFailureException(
    message: json['message'] as String,
  );
}

LimitExceededException _$LimitExceededExceptionFromJson(
    Map<String, dynamic> json) {
  return LimitExceededException(
    message: json['message'] as String,
    retryAfterSeconds: json['Retry-After'] as String,
  );
}

ListBundlesResult _$ListBundlesResultFromJson(Map<String, dynamic> json) {
  return ListBundlesResult(
    bundleList: (json['bundleList'] as List)
        ?.map((e) => e == null
            ? null
            : BundleDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListProjectsResult _$ListProjectsResultFromJson(Map<String, dynamic> json) {
  return ListProjectsResult(
    nextToken: json['nextToken'] as String,
    projects: (json['projects'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

NotFoundException _$NotFoundExceptionFromJson(Map<String, dynamic> json) {
  return NotFoundException(
    message: json['message'] as String,
  );
}

ProjectDetails _$ProjectDetailsFromJson(Map<String, dynamic> json) {
  return ProjectDetails(
    consoleUrl: json['consoleUrl'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    projectId: json['projectId'] as String,
    region: json['region'] as String,
    resources: (json['resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    state: _$enumDecodeNullable(_$ProjectStateEnumMap, json['state']),
  );
}

const _$ProjectStateEnumMap = {
  ProjectState.normal: 'NORMAL',
  ProjectState.syncing: 'SYNCING',
  ProjectState.importing: 'IMPORTING',
};

ProjectSummary _$ProjectSummaryFromJson(Map<String, dynamic> json) {
  return ProjectSummary(
    name: json['name'] as String,
    projectId: json['projectId'] as String,
  );
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    arn: json['arn'] as String,
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    feature: json['feature'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
  );
}

ServiceUnavailableException _$ServiceUnavailableExceptionFromJson(
    Map<String, dynamic> json) {
  return ServiceUnavailableException(
    message: json['message'] as String,
    retryAfterSeconds: json['Retry-After'] as String,
  );
}

TooManyRequestsException _$TooManyRequestsExceptionFromJson(
    Map<String, dynamic> json) {
  return TooManyRequestsException(
    message: json['message'] as String,
    retryAfterSeconds: json['Retry-After'] as String,
  );
}

UnauthorizedException _$UnauthorizedExceptionFromJson(
    Map<String, dynamic> json) {
  return UnauthorizedException(
    message: json['message'] as String,
  );
}

UpdateProjectResult _$UpdateProjectResultFromJson(Map<String, dynamic> json) {
  return UpdateProjectResult(
    details: json['details'] == null
        ? null
        : ProjectDetails.fromJson(json['details'] as Map<String, dynamic>),
  );
}
