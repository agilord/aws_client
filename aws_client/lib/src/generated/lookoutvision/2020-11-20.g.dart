// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-11-20.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDatasetResponse _$CreateDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatasetResponse(
    datasetMetadata: json['DatasetMetadata'] == null
        ? null
        : DatasetMetadata.fromJson(
            json['DatasetMetadata'] as Map<String, dynamic>),
  );
}

CreateModelResponse _$CreateModelResponseFromJson(Map<String, dynamic> json) {
  return CreateModelResponse(
    modelMetadata: json['ModelMetadata'] == null
        ? null
        : ModelMetadata.fromJson(json['ModelMetadata'] as Map<String, dynamic>),
  );
}

CreateProjectResponse _$CreateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProjectResponse(
    projectMetadata: json['ProjectMetadata'] == null
        ? null
        : ProjectMetadata.fromJson(
            json['ProjectMetadata'] as Map<String, dynamic>),
  );
}

DatasetDescription _$DatasetDescriptionFromJson(Map<String, dynamic> json) {
  return DatasetDescription(
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreationTimestamp']),
    datasetType: json['DatasetType'] as String,
    imageStats: json['ImageStats'] == null
        ? null
        : DatasetImageStats.fromJson(
            json['ImageStats'] as Map<String, dynamic>),
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
    projectName: json['ProjectName'] as String,
    status: _$enumDecodeNullable(_$DatasetStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
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

const _$DatasetStatusEnumMap = {
  DatasetStatus.createInProgress: 'CREATE_IN_PROGRESS',
  DatasetStatus.createComplete: 'CREATE_COMPLETE',
  DatasetStatus.createFailed: 'CREATE_FAILED',
  DatasetStatus.updateInProgress: 'UPDATE_IN_PROGRESS',
  DatasetStatus.updateComplete: 'UPDATE_COMPLETE',
  DatasetStatus.updateFailedRollbackInProgress:
      'UPDATE_FAILED_ROLLBACK_IN_PROGRESS',
  DatasetStatus.updateFailedRollbackComplete: 'UPDATE_FAILED_ROLLBACK_COMPLETE',
  DatasetStatus.deleteInProgress: 'DELETE_IN_PROGRESS',
  DatasetStatus.deleteComplete: 'DELETE_COMPLETE',
  DatasetStatus.deleteFailed: 'DELETE_FAILED',
};

Map<String, dynamic> _$DatasetGroundTruthManifestToJson(
    DatasetGroundTruthManifest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Object', instance.s3Object?.toJson());
  return val;
}

DatasetImageStats _$DatasetImageStatsFromJson(Map<String, dynamic> json) {
  return DatasetImageStats(
    anomaly: json['Anomaly'] as int,
    labeled: json['Labeled'] as int,
    normal: json['Normal'] as int,
    total: json['Total'] as int,
  );
}

DatasetMetadata _$DatasetMetadataFromJson(Map<String, dynamic> json) {
  return DatasetMetadata(
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreationTimestamp']),
    datasetType: json['DatasetType'] as String,
    status: _$enumDecodeNullable(_$DatasetStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
  );
}

Map<String, dynamic> _$DatasetSourceToJson(DatasetSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroundTruthManifest', instance.groundTruthManifest?.toJson());
  return val;
}

DeleteDatasetResponse _$DeleteDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDatasetResponse();
}

DeleteModelResponse _$DeleteModelResponseFromJson(Map<String, dynamic> json) {
  return DeleteModelResponse(
    modelArn: json['ModelArn'] as String,
  );
}

DeleteProjectResponse _$DeleteProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProjectResponse(
    projectArn: json['ProjectArn'] as String,
  );
}

DescribeDatasetResponse _$DescribeDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatasetResponse(
    datasetDescription: json['DatasetDescription'] == null
        ? null
        : DatasetDescription.fromJson(
            json['DatasetDescription'] as Map<String, dynamic>),
  );
}

DescribeModelResponse _$DescribeModelResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeModelResponse(
    modelDescription: json['ModelDescription'] == null
        ? null
        : ModelDescription.fromJson(
            json['ModelDescription'] as Map<String, dynamic>),
  );
}

DescribeProjectResponse _$DescribeProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProjectResponse(
    projectDescription: json['ProjectDescription'] == null
        ? null
        : ProjectDescription.fromJson(
            json['ProjectDescription'] as Map<String, dynamic>),
  );
}

DetectAnomaliesResponse _$DetectAnomaliesResponseFromJson(
    Map<String, dynamic> json) {
  return DetectAnomaliesResponse(
    detectAnomalyResult: json['DetectAnomalyResult'] == null
        ? null
        : DetectAnomalyResult.fromJson(
            json['DetectAnomalyResult'] as Map<String, dynamic>),
  );
}

DetectAnomalyResult _$DetectAnomalyResultFromJson(Map<String, dynamic> json) {
  return DetectAnomalyResult(
    confidence: (json['Confidence'] as num)?.toDouble(),
    isAnomalous: json['IsAnomalous'] as bool,
    source: json['Source'] == null
        ? null
        : ImageSource.fromJson(json['Source'] as Map<String, dynamic>),
  );
}

ImageSource _$ImageSourceFromJson(Map<String, dynamic> json) {
  return ImageSource(
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$InputS3ObjectToJson(InputS3Object instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Key', instance.key);
  writeNotNull('VersionId', instance.versionId);
  return val;
}

ListDatasetEntriesResponse _$ListDatasetEntriesResponseFromJson(
    Map<String, dynamic> json) {
  return ListDatasetEntriesResponse(
    datasetEntries:
        (json['DatasetEntries'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListModelsResponse _$ListModelsResponseFromJson(Map<String, dynamic> json) {
  return ListModelsResponse(
    models: (json['Models'] as List)
        ?.map((e) => e == null
            ? null
            : ModelMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListProjectsResponse _$ListProjectsResponseFromJson(Map<String, dynamic> json) {
  return ListProjectsResponse(
    nextToken: json['NextToken'] as String,
    projects: (json['Projects'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ModelDescription _$ModelDescriptionFromJson(Map<String, dynamic> json) {
  return ModelDescription(
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreationTimestamp']),
    description: json['Description'] as String,
    evaluationEndTimestamp:
        const UnixDateTimeConverter().fromJson(json['EvaluationEndTimestamp']),
    evaluationManifest: json['EvaluationManifest'] == null
        ? null
        : OutputS3Object.fromJson(
            json['EvaluationManifest'] as Map<String, dynamic>),
    evaluationResult: json['EvaluationResult'] == null
        ? null
        : OutputS3Object.fromJson(
            json['EvaluationResult'] as Map<String, dynamic>),
    kmsKeyId: json['KmsKeyId'] as String,
    modelArn: json['ModelArn'] as String,
    modelVersion: json['ModelVersion'] as String,
    outputConfig: json['OutputConfig'] == null
        ? null
        : OutputConfig.fromJson(json['OutputConfig'] as Map<String, dynamic>),
    performance: json['Performance'] == null
        ? null
        : ModelPerformance.fromJson(
            json['Performance'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ModelStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
  );
}

Map<String, dynamic> _$ModelDescriptionToJson(ModelDescription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreationTimestamp',
      const UnixDateTimeConverter().toJson(instance.creationTimestamp));
  writeNotNull('Description', instance.description);
  writeNotNull('EvaluationEndTimestamp',
      const UnixDateTimeConverter().toJson(instance.evaluationEndTimestamp));
  writeNotNull('EvaluationManifest', instance.evaluationManifest?.toJson());
  writeNotNull('EvaluationResult', instance.evaluationResult?.toJson());
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('ModelArn', instance.modelArn);
  writeNotNull('ModelVersion', instance.modelVersion);
  writeNotNull('OutputConfig', instance.outputConfig?.toJson());
  writeNotNull('Performance', instance.performance?.toJson());
  writeNotNull('Status', _$ModelStatusEnumMap[instance.status]);
  writeNotNull('StatusMessage', instance.statusMessage);
  return val;
}

const _$ModelStatusEnumMap = {
  ModelStatus.training: 'TRAINING',
  ModelStatus.trained: 'TRAINED',
  ModelStatus.trainingFailed: 'TRAINING_FAILED',
  ModelStatus.startingHosting: 'STARTING_HOSTING',
  ModelStatus.hosted: 'HOSTED',
  ModelStatus.hostingFailed: 'HOSTING_FAILED',
  ModelStatus.stoppingHosting: 'STOPPING_HOSTING',
  ModelStatus.systemUpdating: 'SYSTEM_UPDATING',
  ModelStatus.deleting: 'DELETING',
};

ModelMetadata _$ModelMetadataFromJson(Map<String, dynamic> json) {
  return ModelMetadata(
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreationTimestamp']),
    description: json['Description'] as String,
    modelArn: json['ModelArn'] as String,
    modelVersion: json['ModelVersion'] as String,
    performance: json['Performance'] == null
        ? null
        : ModelPerformance.fromJson(
            json['Performance'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ModelStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
  );
}

ModelPerformance _$ModelPerformanceFromJson(Map<String, dynamic> json) {
  return ModelPerformance(
    f1Score: (json['F1Score'] as num)?.toDouble(),
    precision: (json['Precision'] as num)?.toDouble(),
    recall: (json['Recall'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ModelPerformanceToJson(ModelPerformance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('F1Score', instance.f1Score);
  writeNotNull('Precision', instance.precision);
  writeNotNull('Recall', instance.recall);
  return val;
}

OutputConfig _$OutputConfigFromJson(Map<String, dynamic> json) {
  return OutputConfig(
    s3Location: json['S3Location'] == null
        ? null
        : S3Location.fromJson(json['S3Location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OutputConfigToJson(OutputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Location', instance.s3Location?.toJson());
  return val;
}

OutputS3Object _$OutputS3ObjectFromJson(Map<String, dynamic> json) {
  return OutputS3Object(
    bucket: json['Bucket'] as String,
    key: json['Key'] as String,
  );
}

Map<String, dynamic> _$OutputS3ObjectToJson(OutputS3Object instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Key', instance.key);
  return val;
}

ProjectDescription _$ProjectDescriptionFromJson(Map<String, dynamic> json) {
  return ProjectDescription(
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreationTimestamp']),
    datasets: (json['Datasets'] as List)
        ?.map((e) => e == null
            ? null
            : DatasetMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projectArn: json['ProjectArn'] as String,
    projectName: json['ProjectName'] as String,
  );
}

ProjectMetadata _$ProjectMetadataFromJson(Map<String, dynamic> json) {
  return ProjectMetadata(
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreationTimestamp']),
    projectArn: json['ProjectArn'] as String,
    projectName: json['ProjectName'] as String,
  );
}

S3Location _$S3LocationFromJson(Map<String, dynamic> json) {
  return S3Location(
    bucket: json['Bucket'] as String,
    prefix: json['Prefix'] as String,
  );
}

Map<String, dynamic> _$S3LocationToJson(S3Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Prefix', instance.prefix);
  return val;
}

StartModelResponse _$StartModelResponseFromJson(Map<String, dynamic> json) {
  return StartModelResponse(
    status: _$enumDecodeNullable(_$ModelHostingStatusEnumMap, json['Status']),
  );
}

const _$ModelHostingStatusEnumMap = {
  ModelHostingStatus.running: 'RUNNING',
  ModelHostingStatus.starting: 'STARTING',
  ModelHostingStatus.stopped: 'STOPPED',
  ModelHostingStatus.failed: 'FAILED',
};

StopModelResponse _$StopModelResponseFromJson(Map<String, dynamic> json) {
  return StopModelResponse(
    status: _$enumDecodeNullable(_$ModelHostingStatusEnumMap, json['Status']),
  );
}

UpdateDatasetEntriesResponse _$UpdateDatasetEntriesResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDatasetEntriesResponse(
    status: _$enumDecodeNullable(_$DatasetStatusEnumMap, json['Status']),
  );
}
