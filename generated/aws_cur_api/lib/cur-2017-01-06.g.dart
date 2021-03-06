// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cur-2017-01-06.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteReportDefinitionResponse _$DeleteReportDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteReportDefinitionResponse(
    responseMessage: json['ResponseMessage'] as String?,
  );
}

DescribeReportDefinitionsResponse _$DescribeReportDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeReportDefinitionsResponse(
    nextToken: json['NextToken'] as String?,
    reportDefinitions: (json['ReportDefinitions'] as List<dynamic>?)
        ?.map((e) => ReportDefinition.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ModifyReportDefinitionResponse _$ModifyReportDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return ModifyReportDefinitionResponse();
}

PutReportDefinitionResponse _$PutReportDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return PutReportDefinitionResponse();
}

ReportDefinition _$ReportDefinitionFromJson(Map<String, dynamic> json) {
  return ReportDefinition(
    additionalSchemaElements:
        (json['AdditionalSchemaElements'] as List<dynamic>)
            .map((e) => _$enumDecode(_$SchemaElementEnumMap, e))
            .toList(),
    compression: _$enumDecode(_$CompressionFormatEnumMap, json['Compression']),
    format: _$enumDecode(_$ReportFormatEnumMap, json['Format']),
    reportName: json['ReportName'] as String,
    s3Bucket: json['S3Bucket'] as String,
    s3Prefix: json['S3Prefix'] as String,
    s3Region: _$enumDecode(_$AWSRegionEnumMap, json['S3Region']),
    timeUnit: _$enumDecode(_$TimeUnitEnumMap, json['TimeUnit']),
    additionalArtifacts: (json['AdditionalArtifacts'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$AdditionalArtifactEnumMap, e))
        .toList(),
    refreshClosedReports: json['RefreshClosedReports'] as bool?,
    reportVersioning: _$enumDecodeNullable(
        _$ReportVersioningEnumMap, json['ReportVersioning']),
  );
}

Map<String, dynamic> _$ReportDefinitionToJson(ReportDefinition instance) {
  final val = <String, dynamic>{
    'AdditionalSchemaElements': instance.additionalSchemaElements
        .map((e) => _$SchemaElementEnumMap[e])
        .toList(),
    'Compression': _$CompressionFormatEnumMap[instance.compression],
    'Format': _$ReportFormatEnumMap[instance.format],
    'ReportName': instance.reportName,
    'S3Bucket': instance.s3Bucket,
    'S3Prefix': instance.s3Prefix,
    'S3Region': _$AWSRegionEnumMap[instance.s3Region],
    'TimeUnit': _$TimeUnitEnumMap[instance.timeUnit],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AdditionalArtifacts',
      instance.additionalArtifacts
          ?.map((e) => _$AdditionalArtifactEnumMap[e])
          .toList());
  writeNotNull('RefreshClosedReports', instance.refreshClosedReports);
  writeNotNull(
      'ReportVersioning', _$ReportVersioningEnumMap[instance.reportVersioning]);
  return val;
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

const _$SchemaElementEnumMap = {
  SchemaElement.resources: 'RESOURCES',
};

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
  AWSRegion.afSouth_1: 'af-south-1',
  AWSRegion.apEast_1: 'ap-east-1',
  AWSRegion.apSouth_1: 'ap-south-1',
  AWSRegion.apSoutheast_1: 'ap-southeast-1',
  AWSRegion.apSoutheast_2: 'ap-southeast-2',
  AWSRegion.apNortheast_1: 'ap-northeast-1',
  AWSRegion.apNortheast_2: 'ap-northeast-2',
  AWSRegion.apNortheast_3: 'ap-northeast-3',
  AWSRegion.caCentral_1: 'ca-central-1',
  AWSRegion.euCentral_1: 'eu-central-1',
  AWSRegion.euWest_1: 'eu-west-1',
  AWSRegion.euWest_2: 'eu-west-2',
  AWSRegion.euWest_3: 'eu-west-3',
  AWSRegion.euNorth_1: 'eu-north-1',
  AWSRegion.euSouth_1: 'eu-south-1',
  AWSRegion.meSouth_1: 'me-south-1',
  AWSRegion.saEast_1: 'sa-east-1',
  AWSRegion.usEast_1: 'us-east-1',
  AWSRegion.usEast_2: 'us-east-2',
  AWSRegion.usWest_1: 'us-west-1',
  AWSRegion.usWest_2: 'us-west-2',
  AWSRegion.cnNorth_1: 'cn-north-1',
  AWSRegion.cnNorthwest_1: 'cn-northwest-1',
};

const _$TimeUnitEnumMap = {
  TimeUnit.hourly: 'HOURLY',
  TimeUnit.daily: 'DAILY',
  TimeUnit.monthly: 'MONTHLY',
};

const _$AdditionalArtifactEnumMap = {
  AdditionalArtifact.redshift: 'REDSHIFT',
  AdditionalArtifact.quicksight: 'QUICKSIGHT',
  AdditionalArtifact.athena: 'ATHENA',
};

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

const _$ReportVersioningEnumMap = {
  ReportVersioning.createNewReport: 'CREATE_NEW_REPORT',
  ReportVersioning.overwriteReport: 'OVERWRITE_REPORT',
};
