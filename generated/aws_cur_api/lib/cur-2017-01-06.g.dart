// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cur-2017-01-06.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DeleteReportDefinitionRequestToJson(
    DeleteReportDefinitionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReportName', instance.reportName);
  return val;
}

DeleteReportDefinitionResponse _$DeleteReportDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteReportDefinitionResponse(
    responseMessage: json['ResponseMessage'] as String,
  );
}

Map<String, dynamic> _$DescribeReportDefinitionsRequestToJson(
    DescribeReportDefinitionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeReportDefinitionsResponse _$DescribeReportDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeReportDefinitionsResponse(
    nextToken: json['NextToken'] as String,
    reportDefinitions: (json['ReportDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : ReportDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ModifyReportDefinitionRequestToJson(
    ModifyReportDefinitionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReportDefinition', instance.reportDefinition?.toJson());
  writeNotNull('ReportName', instance.reportName);
  return val;
}

ModifyReportDefinitionResponse _$ModifyReportDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return ModifyReportDefinitionResponse();
}

Map<String, dynamic> _$PutReportDefinitionRequestToJson(
    PutReportDefinitionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReportDefinition', instance.reportDefinition?.toJson());
  return val;
}

PutReportDefinitionResponse _$PutReportDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return PutReportDefinitionResponse();
}

ReportDefinition _$ReportDefinitionFromJson(Map<String, dynamic> json) {
  return ReportDefinition(
    additionalSchemaElements: (json['AdditionalSchemaElements'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    compression:
        _$enumDecodeNullable(_$CompressionFormatEnumMap, json['Compression']),
    format: _$enumDecodeNullable(_$ReportFormatEnumMap, json['Format']),
    reportName: json['ReportName'] as String,
    s3Bucket: json['S3Bucket'] as String,
    s3Prefix: json['S3Prefix'] as String,
    s3Region: _$enumDecodeNullable(_$AWSRegionEnumMap, json['S3Region']),
    timeUnit: _$enumDecodeNullable(_$TimeUnitEnumMap, json['TimeUnit']),
    additionalArtifacts: (json['AdditionalArtifacts'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    refreshClosedReports: json['RefreshClosedReports'] as bool,
    reportVersioning: _$enumDecodeNullable(
        _$ReportVersioningEnumMap, json['ReportVersioning']),
  );
}

Map<String, dynamic> _$ReportDefinitionToJson(ReportDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdditionalSchemaElements', instance.additionalSchemaElements);
  writeNotNull('Compression', _$CompressionFormatEnumMap[instance.compression]);
  writeNotNull('Format', _$ReportFormatEnumMap[instance.format]);
  writeNotNull('ReportName', instance.reportName);
  writeNotNull('S3Bucket', instance.s3Bucket);
  writeNotNull('S3Prefix', instance.s3Prefix);
  writeNotNull('S3Region', _$AWSRegionEnumMap[instance.s3Region]);
  writeNotNull('TimeUnit', _$TimeUnitEnumMap[instance.timeUnit]);
  writeNotNull('AdditionalArtifacts', instance.additionalArtifacts);
  writeNotNull('RefreshClosedReports', instance.refreshClosedReports);
  writeNotNull(
      'ReportVersioning', _$ReportVersioningEnumMap[instance.reportVersioning]);
  return val;
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

const _$CompressionFormatEnumMap = {
  CompressionFormat.zip: 'ZIP',
  CompressionFormat.gzip: 'GZIP',
  CompressionFormat.parquet: 'Parquet',
};

const _$ReportFormatEnumMap = {
  ReportFormat.textORcsv: 'textORcsv',
  ReportFormat.parquet: 'Parquet',
};

const _$AWSRegionEnumMap = {
  AWSRegion.usEast_1: 'us-east-1',
  AWSRegion.usWest_1: 'us-west-1',
  AWSRegion.usWest_2: 'us-west-2',
  AWSRegion.euCentral_1: 'eu-central-1',
  AWSRegion.euWest_1: 'eu-west-1',
  AWSRegion.apSoutheast_1: 'ap-southeast-1',
  AWSRegion.apSoutheast_2: 'ap-southeast-2',
  AWSRegion.apNortheast_1: 'ap-northeast-1',
  AWSRegion.euNorth_1: 'eu-north-1',
  AWSRegion.apNortheast_3: 'ap-northeast-3',
  AWSRegion.apEast_1: 'ap-east-1',
};

const _$TimeUnitEnumMap = {
  TimeUnit.hourly: 'HOURLY',
  TimeUnit.daily: 'DAILY',
};

const _$ReportVersioningEnumMap = {
  ReportVersioning.createNewReport: 'CREATE_NEW_REPORT',
  ReportVersioning.overwriteReport: 'OVERWRITE_REPORT',
};
