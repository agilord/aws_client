// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-11-03.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationSummary _$ApplicationSummaryFromJson(Map<String, dynamic> json) {
  return ApplicationSummary(
    applicationId: json['applicationId'] as String,
    applicationName: json['applicationName'] as String,
    applicationUrl: json['applicationUrl'] as String,
    applicationCreationDate: json['applicationCreationDate'] as int,
    applicationDescription: json['applicationDescription'] as String,
    applicationLastUpdateDate: json['applicationLastUpdateDate'] as int,
    applicationState: _$enumDecodeNullable(
        _$ApplicationStateEnumMap, json['applicationState']),
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

const _$ApplicationStateEnumMap = {
  ApplicationState.creating: 'CREATING',
  ApplicationState.deleting: 'DELETING',
  ApplicationState.active: 'ACTIVE',
  ApplicationState.createFailed: 'CREATE_FAILED',
  ApplicationState.deleteFailed: 'DELETE_FAILED',
};

CreateApplicationResponse _$CreateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationResponse(
    applicationArn: json['applicationArn'] as String,
    applicationId: json['applicationId'] as String,
  );
}

DeleteApplicationResponse _$DeleteApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApplicationResponse();
}

DescribeApplicationResponse _$DescribeApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeApplicationResponse(
    applicationArn: json['applicationArn'] as String,
    applicationCreationDate: json['applicationCreationDate'] as int,
    applicationId: json['applicationId'] as String,
    applicationLastUpdateDate: json['applicationLastUpdateDate'] as int,
    applicationName: json['applicationName'] as String,
    applicationState: _$enumDecodeNullable(
        _$ApplicationStateEnumMap, json['applicationState']),
    applicationUrl: json['applicationUrl'] as String,
    roleArn: json['roleArn'] as String,
    applicationDescription: json['applicationDescription'] as String,
    errorMessage: json['errorMessage'] as String,
    ssoClientId: json['ssoClientId'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListApplicationsResponse _$ListApplicationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListApplicationsResponse(
    applicationSummaries: (json['applicationSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateApplicationResponse _$UpdateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApplicationResponse();
}
