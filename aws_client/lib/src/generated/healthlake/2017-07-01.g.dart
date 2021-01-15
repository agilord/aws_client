// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-07-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFHIRDatastoreResponse _$CreateFHIRDatastoreResponseFromJson(
    Map<String, dynamic> json) {
  return CreateFHIRDatastoreResponse(
    datastoreArn: json['DatastoreArn'] as String,
    datastoreEndpoint: json['DatastoreEndpoint'] as String,
    datastoreId: json['DatastoreId'] as String,
    datastoreStatus:
        _$enumDecodeNullable(_$DatastoreStatusEnumMap, json['DatastoreStatus']),
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

const _$DatastoreStatusEnumMap = {
  DatastoreStatus.creating: 'CREATING',
  DatastoreStatus.active: 'ACTIVE',
  DatastoreStatus.deleting: 'DELETING',
  DatastoreStatus.deleted: 'DELETED',
};

Map<String, dynamic> _$DatastoreFilterToJson(DatastoreFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatedAfter',
      const UnixDateTimeConverter().toJson(instance.createdAfter));
  writeNotNull('CreatedBefore',
      const UnixDateTimeConverter().toJson(instance.createdBefore));
  writeNotNull('DatastoreName', instance.datastoreName);
  writeNotNull(
      'DatastoreStatus', _$DatastoreStatusEnumMap[instance.datastoreStatus]);
  return val;
}

DatastoreProperties _$DatastorePropertiesFromJson(Map<String, dynamic> json) {
  return DatastoreProperties(
    datastoreArn: json['DatastoreArn'] as String,
    datastoreEndpoint: json['DatastoreEndpoint'] as String,
    datastoreId: json['DatastoreId'] as String,
    datastoreStatus:
        _$enumDecodeNullable(_$DatastoreStatusEnumMap, json['DatastoreStatus']),
    datastoreTypeVersion: _$enumDecodeNullable(
        _$FHIRVersionEnumMap, json['DatastoreTypeVersion']),
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    datastoreName: json['DatastoreName'] as String,
    preloadDataConfig: json['PreloadDataConfig'] == null
        ? null
        : PreloadDataConfig.fromJson(
            json['PreloadDataConfig'] as Map<String, dynamic>),
  );
}

const _$FHIRVersionEnumMap = {
  FHIRVersion.r4: 'R4',
};

DeleteFHIRDatastoreResponse _$DeleteFHIRDatastoreResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFHIRDatastoreResponse(
    datastoreArn: json['DatastoreArn'] as String,
    datastoreEndpoint: json['DatastoreEndpoint'] as String,
    datastoreId: json['DatastoreId'] as String,
    datastoreStatus:
        _$enumDecodeNullable(_$DatastoreStatusEnumMap, json['DatastoreStatus']),
  );
}

DescribeFHIRDatastoreResponse _$DescribeFHIRDatastoreResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFHIRDatastoreResponse(
    datastoreProperties: json['DatastoreProperties'] == null
        ? null
        : DatastoreProperties.fromJson(
            json['DatastoreProperties'] as Map<String, dynamic>),
  );
}

DescribeFHIRExportJobResponse _$DescribeFHIRExportJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFHIRExportJobResponse(
    exportJobProperties: json['ExportJobProperties'] == null
        ? null
        : ExportJobProperties.fromJson(
            json['ExportJobProperties'] as Map<String, dynamic>),
  );
}

DescribeFHIRImportJobResponse _$DescribeFHIRImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFHIRImportJobResponse(
    importJobProperties: json['ImportJobProperties'] == null
        ? null
        : ImportJobProperties.fromJson(
            json['ImportJobProperties'] as Map<String, dynamic>),
  );
}

ExportJobProperties _$ExportJobPropertiesFromJson(Map<String, dynamic> json) {
  return ExportJobProperties(
    datastoreId: json['DatastoreId'] as String,
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    jobName: json['JobName'] as String,
    message: json['Message'] as String,
  );
}

const _$JobStatusEnumMap = {
  JobStatus.submitted: 'SUBMITTED',
  JobStatus.inProgress: 'IN_PROGRESS',
  JobStatus.completed: 'COMPLETED',
  JobStatus.failed: 'FAILED',
};

ImportJobProperties _$ImportJobPropertiesFromJson(Map<String, dynamic> json) {
  return ImportJobProperties(
    datastoreId: json['DatastoreId'] as String,
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    jobName: json['JobName'] as String,
    message: json['Message'] as String,
  );
}

InputDataConfig _$InputDataConfigFromJson(Map<String, dynamic> json) {
  return InputDataConfig(
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$InputDataConfigToJson(InputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

ListFHIRDatastoresResponse _$ListFHIRDatastoresResponseFromJson(
    Map<String, dynamic> json) {
  return ListFHIRDatastoresResponse(
    datastorePropertiesList: (json['DatastorePropertiesList'] as List)
        ?.map((e) => e == null
            ? null
            : DatastoreProperties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

OutputDataConfig _$OutputDataConfigFromJson(Map<String, dynamic> json) {
  return OutputDataConfig(
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$OutputDataConfigToJson(OutputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

PreloadDataConfig _$PreloadDataConfigFromJson(Map<String, dynamic> json) {
  return PreloadDataConfig(
    preloadDataType:
        _$enumDecodeNullable(_$PreloadDataTypeEnumMap, json['PreloadDataType']),
  );
}

Map<String, dynamic> _$PreloadDataConfigToJson(PreloadDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'PreloadDataType', _$PreloadDataTypeEnumMap[instance.preloadDataType]);
  return val;
}

const _$PreloadDataTypeEnumMap = {
  PreloadDataType.synthea: 'SYNTHEA',
};

StartFHIRExportJobResponse _$StartFHIRExportJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartFHIRExportJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    datastoreId: json['DatastoreId'] as String,
  );
}

StartFHIRImportJobResponse _$StartFHIRImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartFHIRImportJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    datastoreId: json['DatastoreId'] as String,
  );
}
