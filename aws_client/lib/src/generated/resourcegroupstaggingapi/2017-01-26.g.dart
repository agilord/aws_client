// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-01-26.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplianceDetails _$ComplianceDetailsFromJson(Map<String, dynamic> json) {
  return ComplianceDetails(
    complianceStatus: json['ComplianceStatus'] as bool,
    keysWithNoncompliantValues: (json['KeysWithNoncompliantValues'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    noncompliantKeys:
        (json['NoncompliantKeys'] as List)?.map((e) => e as String)?.toList(),
  );
}

DescribeReportCreationOutput _$DescribeReportCreationOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeReportCreationOutput(
    errorMessage: json['ErrorMessage'] as String,
    s3Location: json['S3Location'] as String,
    status: json['Status'] as String,
  );
}

FailureInfo _$FailureInfoFromJson(Map<String, dynamic> json) {
  return FailureInfo(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    statusCode: json['StatusCode'] as int,
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

const _$ErrorCodeEnumMap = {
  ErrorCode.internalServiceException: 'InternalServiceException',
  ErrorCode.invalidParameterException: 'InvalidParameterException',
};

GetComplianceSummaryOutput _$GetComplianceSummaryOutputFromJson(
    Map<String, dynamic> json) {
  return GetComplianceSummaryOutput(
    paginationToken: json['PaginationToken'] as String,
    summaryList: (json['SummaryList'] as List)
        ?.map((e) =>
            e == null ? null : Summary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetResourcesOutput _$GetResourcesOutputFromJson(Map<String, dynamic> json) {
  return GetResourcesOutput(
    paginationToken: json['PaginationToken'] as String,
    resourceTagMappingList: (json['ResourceTagMappingList'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceTagMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetTagKeysOutput _$GetTagKeysOutputFromJson(Map<String, dynamic> json) {
  return GetTagKeysOutput(
    paginationToken: json['PaginationToken'] as String,
    tagKeys: (json['TagKeys'] as List)?.map((e) => e as String)?.toList(),
  );
}

GetTagValuesOutput _$GetTagValuesOutputFromJson(Map<String, dynamic> json) {
  return GetTagValuesOutput(
    paginationToken: json['PaginationToken'] as String,
    tagValues: (json['TagValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

ResourceTagMapping _$ResourceTagMappingFromJson(Map<String, dynamic> json) {
  return ResourceTagMapping(
    complianceDetails: json['ComplianceDetails'] == null
        ? null
        : ComplianceDetails.fromJson(
            json['ComplianceDetails'] as Map<String, dynamic>),
    resourceARN: json['ResourceARN'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StartReportCreationOutput _$StartReportCreationOutputFromJson(
    Map<String, dynamic> json) {
  return StartReportCreationOutput();
}

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return Summary(
    lastUpdated: json['LastUpdated'] as String,
    nonCompliantResources: json['NonCompliantResources'] as int,
    region: json['Region'] as String,
    resourceType: json['ResourceType'] as String,
    targetId: json['TargetId'] as String,
    targetIdType:
        _$enumDecodeNullable(_$TargetIdTypeEnumMap, json['TargetIdType']),
  );
}

const _$TargetIdTypeEnumMap = {
  TargetIdType.account: 'ACCOUNT',
  TargetIdType.ou: 'OU',
  TargetIdType.root: 'ROOT',
};

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagFilterToJson(TagFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

TagResourcesOutput _$TagResourcesOutputFromJson(Map<String, dynamic> json) {
  return TagResourcesOutput(
    failedResourcesMap:
        (json['FailedResourcesMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : FailureInfo.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

UntagResourcesOutput _$UntagResourcesOutputFromJson(Map<String, dynamic> json) {
  return UntagResourcesOutput(
    failedResourcesMap:
        (json['FailedResourcesMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : FailureInfo.fromJson(e as Map<String, dynamic>)),
    ),
  );
}
