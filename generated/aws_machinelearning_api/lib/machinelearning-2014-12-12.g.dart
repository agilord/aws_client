// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machinelearning-2014-12-12.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTagsOutput _$AddTagsOutputFromJson(Map<String, dynamic> json) {
  return AddTagsOutput(
    resourceId: json['ResourceId'] as String?,
    resourceType: _$enumDecodeNullable(
        _$TaggableResourceTypeEnumMap, json['ResourceType']),
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

const _$TaggableResourceTypeEnumMap = {
  TaggableResourceType.batchPrediction: 'BatchPrediction',
  TaggableResourceType.dataSource: 'DataSource',
  TaggableResourceType.evaluation: 'Evaluation',
  TaggableResourceType.mLModel: 'MLModel',
};

BatchPrediction _$BatchPredictionFromJson(Map<String, dynamic> json) {
  return BatchPrediction(
    batchPredictionDataSourceId: json['BatchPredictionDataSourceId'] as String?,
    batchPredictionId: json['BatchPredictionId'] as String?,
    computeTime: json['ComputeTime'] as int?,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String?,
    finishedAt: const UnixDateTimeConverter().fromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String?,
    invalidRecordCount: json['InvalidRecordCount'] as int?,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    mLModelId: json['MLModelId'] as String?,
    message: json['Message'] as String?,
    name: json['Name'] as String?,
    outputUri: json['OutputUri'] as String?,
    startedAt: const UnixDateTimeConverter().fromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
    totalRecordCount: json['TotalRecordCount'] as int?,
  );
}

const _$EntityStatusEnumMap = {
  EntityStatus.pending: 'PENDING',
  EntityStatus.inprogress: 'INPROGRESS',
  EntityStatus.failed: 'FAILED',
  EntityStatus.completed: 'COMPLETED',
  EntityStatus.deleted: 'DELETED',
};

CreateBatchPredictionOutput _$CreateBatchPredictionOutputFromJson(
    Map<String, dynamic> json) {
  return CreateBatchPredictionOutput(
    batchPredictionId: json['BatchPredictionId'] as String?,
  );
}

CreateDataSourceFromRDSOutput _$CreateDataSourceFromRDSOutputFromJson(
    Map<String, dynamic> json) {
  return CreateDataSourceFromRDSOutput(
    dataSourceId: json['DataSourceId'] as String?,
  );
}

CreateDataSourceFromRedshiftOutput _$CreateDataSourceFromRedshiftOutputFromJson(
    Map<String, dynamic> json) {
  return CreateDataSourceFromRedshiftOutput(
    dataSourceId: json['DataSourceId'] as String?,
  );
}

CreateDataSourceFromS3Output _$CreateDataSourceFromS3OutputFromJson(
    Map<String, dynamic> json) {
  return CreateDataSourceFromS3Output(
    dataSourceId: json['DataSourceId'] as String?,
  );
}

CreateEvaluationOutput _$CreateEvaluationOutputFromJson(
    Map<String, dynamic> json) {
  return CreateEvaluationOutput(
    evaluationId: json['EvaluationId'] as String?,
  );
}

CreateMLModelOutput _$CreateMLModelOutputFromJson(Map<String, dynamic> json) {
  return CreateMLModelOutput(
    mLModelId: json['MLModelId'] as String?,
  );
}

CreateRealtimeEndpointOutput _$CreateRealtimeEndpointOutputFromJson(
    Map<String, dynamic> json) {
  return CreateRealtimeEndpointOutput(
    mLModelId: json['MLModelId'] as String?,
    realtimeEndpointInfo: json['RealtimeEndpointInfo'] == null
        ? null
        : RealtimeEndpointInfo.fromJson(
            json['RealtimeEndpointInfo'] as Map<String, dynamic>),
  );
}

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return DataSource(
    computeStatistics: json['ComputeStatistics'] as bool?,
    computeTime: json['ComputeTime'] as int?,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String?,
    dataLocationS3: json['DataLocationS3'] as String?,
    dataRearrangement: json['DataRearrangement'] as String?,
    dataSizeInBytes: json['DataSizeInBytes'] as int?,
    dataSourceId: json['DataSourceId'] as String?,
    finishedAt: const UnixDateTimeConverter().fromJson(json['FinishedAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    message: json['Message'] as String?,
    name: json['Name'] as String?,
    numberOfFiles: json['NumberOfFiles'] as int?,
    rDSMetadata: json['RDSMetadata'] == null
        ? null
        : RDSMetadata.fromJson(json['RDSMetadata'] as Map<String, dynamic>),
    redshiftMetadata: json['RedshiftMetadata'] == null
        ? null
        : RedshiftMetadata.fromJson(
            json['RedshiftMetadata'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String?,
    startedAt: const UnixDateTimeConverter().fromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
  );
}

DeleteBatchPredictionOutput _$DeleteBatchPredictionOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteBatchPredictionOutput(
    batchPredictionId: json['BatchPredictionId'] as String?,
  );
}

DeleteDataSourceOutput _$DeleteDataSourceOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteDataSourceOutput(
    dataSourceId: json['DataSourceId'] as String?,
  );
}

DeleteEvaluationOutput _$DeleteEvaluationOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteEvaluationOutput(
    evaluationId: json['EvaluationId'] as String?,
  );
}

DeleteMLModelOutput _$DeleteMLModelOutputFromJson(Map<String, dynamic> json) {
  return DeleteMLModelOutput(
    mLModelId: json['MLModelId'] as String?,
  );
}

DeleteRealtimeEndpointOutput _$DeleteRealtimeEndpointOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteRealtimeEndpointOutput(
    mLModelId: json['MLModelId'] as String?,
    realtimeEndpointInfo: json['RealtimeEndpointInfo'] == null
        ? null
        : RealtimeEndpointInfo.fromJson(
            json['RealtimeEndpointInfo'] as Map<String, dynamic>),
  );
}

DeleteTagsOutput _$DeleteTagsOutputFromJson(Map<String, dynamic> json) {
  return DeleteTagsOutput(
    resourceId: json['ResourceId'] as String?,
    resourceType: _$enumDecodeNullable(
        _$TaggableResourceTypeEnumMap, json['ResourceType']),
  );
}

DescribeBatchPredictionsOutput _$DescribeBatchPredictionsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeBatchPredictionsOutput(
    nextToken: json['NextToken'] as String?,
    results: (json['Results'] as List<dynamic>?)
        ?.map((e) => BatchPrediction.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DescribeDataSourcesOutput _$DescribeDataSourcesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeDataSourcesOutput(
    nextToken: json['NextToken'] as String?,
    results: (json['Results'] as List<dynamic>?)
        ?.map((e) => DataSource.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DescribeEvaluationsOutput _$DescribeEvaluationsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeEvaluationsOutput(
    nextToken: json['NextToken'] as String?,
    results: (json['Results'] as List<dynamic>?)
        ?.map((e) => Evaluation.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DescribeMLModelsOutput _$DescribeMLModelsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeMLModelsOutput(
    nextToken: json['NextToken'] as String?,
    results: (json['Results'] as List<dynamic>?)
        ?.map((e) => MLModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DescribeTagsOutput _$DescribeTagsOutputFromJson(Map<String, dynamic> json) {
  return DescribeTagsOutput(
    resourceId: json['ResourceId'] as String?,
    resourceType: _$enumDecodeNullable(
        _$TaggableResourceTypeEnumMap, json['ResourceType']),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Evaluation _$EvaluationFromJson(Map<String, dynamic> json) {
  return Evaluation(
    computeTime: json['ComputeTime'] as int?,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String?,
    evaluationDataSourceId: json['EvaluationDataSourceId'] as String?,
    evaluationId: json['EvaluationId'] as String?,
    finishedAt: const UnixDateTimeConverter().fromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String?,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    mLModelId: json['MLModelId'] as String?,
    message: json['Message'] as String?,
    name: json['Name'] as String?,
    performanceMetrics: json['PerformanceMetrics'] == null
        ? null
        : PerformanceMetrics.fromJson(
            json['PerformanceMetrics'] as Map<String, dynamic>),
    startedAt: const UnixDateTimeConverter().fromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
  );
}

GetBatchPredictionOutput _$GetBatchPredictionOutputFromJson(
    Map<String, dynamic> json) {
  return GetBatchPredictionOutput(
    batchPredictionDataSourceId: json['BatchPredictionDataSourceId'] as String?,
    batchPredictionId: json['BatchPredictionId'] as String?,
    computeTime: json['ComputeTime'] as int?,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String?,
    finishedAt: const UnixDateTimeConverter().fromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String?,
    invalidRecordCount: json['InvalidRecordCount'] as int?,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    logUri: json['LogUri'] as String?,
    mLModelId: json['MLModelId'] as String?,
    message: json['Message'] as String?,
    name: json['Name'] as String?,
    outputUri: json['OutputUri'] as String?,
    startedAt: const UnixDateTimeConverter().fromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
    totalRecordCount: json['TotalRecordCount'] as int?,
  );
}

GetDataSourceOutput _$GetDataSourceOutputFromJson(Map<String, dynamic> json) {
  return GetDataSourceOutput(
    computeStatistics: json['ComputeStatistics'] as bool?,
    computeTime: json['ComputeTime'] as int?,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String?,
    dataLocationS3: json['DataLocationS3'] as String?,
    dataRearrangement: json['DataRearrangement'] as String?,
    dataSizeInBytes: json['DataSizeInBytes'] as int?,
    dataSourceId: json['DataSourceId'] as String?,
    dataSourceSchema: json['DataSourceSchema'] as String?,
    finishedAt: const UnixDateTimeConverter().fromJson(json['FinishedAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    logUri: json['LogUri'] as String?,
    message: json['Message'] as String?,
    name: json['Name'] as String?,
    numberOfFiles: json['NumberOfFiles'] as int?,
    rDSMetadata: json['RDSMetadata'] == null
        ? null
        : RDSMetadata.fromJson(json['RDSMetadata'] as Map<String, dynamic>),
    redshiftMetadata: json['RedshiftMetadata'] == null
        ? null
        : RedshiftMetadata.fromJson(
            json['RedshiftMetadata'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String?,
    startedAt: const UnixDateTimeConverter().fromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
  );
}

GetEvaluationOutput _$GetEvaluationOutputFromJson(Map<String, dynamic> json) {
  return GetEvaluationOutput(
    computeTime: json['ComputeTime'] as int?,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String?,
    evaluationDataSourceId: json['EvaluationDataSourceId'] as String?,
    evaluationId: json['EvaluationId'] as String?,
    finishedAt: const UnixDateTimeConverter().fromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String?,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    logUri: json['LogUri'] as String?,
    mLModelId: json['MLModelId'] as String?,
    message: json['Message'] as String?,
    name: json['Name'] as String?,
    performanceMetrics: json['PerformanceMetrics'] == null
        ? null
        : PerformanceMetrics.fromJson(
            json['PerformanceMetrics'] as Map<String, dynamic>),
    startedAt: const UnixDateTimeConverter().fromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
  );
}

GetMLModelOutput _$GetMLModelOutputFromJson(Map<String, dynamic> json) {
  return GetMLModelOutput(
    computeTime: json['ComputeTime'] as int?,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String?,
    endpointInfo: json['EndpointInfo'] == null
        ? null
        : RealtimeEndpointInfo.fromJson(
            json['EndpointInfo'] as Map<String, dynamic>),
    finishedAt: const UnixDateTimeConverter().fromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String?,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    logUri: json['LogUri'] as String?,
    mLModelId: json['MLModelId'] as String?,
    mLModelType:
        _$enumDecodeNullable(_$MLModelTypeEnumMap, json['MLModelType']),
    message: json['Message'] as String?,
    name: json['Name'] as String?,
    recipe: json['Recipe'] as String?,
    schema: json['Schema'] as String?,
    scoreThreshold: (json['ScoreThreshold'] as num?)?.toDouble(),
    scoreThresholdLastUpdatedAt: const UnixDateTimeConverter()
        .fromJson(json['ScoreThresholdLastUpdatedAt']),
    sizeInBytes: json['SizeInBytes'] as int?,
    startedAt: const UnixDateTimeConverter().fromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
    trainingDataSourceId: json['TrainingDataSourceId'] as String?,
    trainingParameters:
        (json['TrainingParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$MLModelTypeEnumMap = {
  MLModelType.regression: 'REGRESSION',
  MLModelType.binary: 'BINARY',
  MLModelType.multiclass: 'MULTICLASS',
};

IdempotentParameterMismatchException
    _$IdempotentParameterMismatchExceptionFromJson(Map<String, dynamic> json) {
  return IdempotentParameterMismatchException(
    code: json['code'] as int?,
    message: json['message'] as String?,
  );
}

InternalServerException _$InternalServerExceptionFromJson(
    Map<String, dynamic> json) {
  return InternalServerException(
    code: json['code'] as int?,
    message: json['message'] as String?,
  );
}

InvalidInputException _$InvalidInputExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidInputException(
    code: json['code'] as int?,
    message: json['message'] as String?,
  );
}

InvalidTagException _$InvalidTagExceptionFromJson(Map<String, dynamic> json) {
  return InvalidTagException(
    message: json['message'] as String?,
  );
}

LimitExceededException _$LimitExceededExceptionFromJson(
    Map<String, dynamic> json) {
  return LimitExceededException(
    code: json['code'] as int?,
    message: json['message'] as String?,
  );
}

MLModel _$MLModelFromJson(Map<String, dynamic> json) {
  return MLModel(
    algorithm: _$enumDecodeNullable(_$AlgorithmEnumMap, json['Algorithm']),
    computeTime: json['ComputeTime'] as int?,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String?,
    endpointInfo: json['EndpointInfo'] == null
        ? null
        : RealtimeEndpointInfo.fromJson(
            json['EndpointInfo'] as Map<String, dynamic>),
    finishedAt: const UnixDateTimeConverter().fromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String?,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    mLModelId: json['MLModelId'] as String?,
    mLModelType:
        _$enumDecodeNullable(_$MLModelTypeEnumMap, json['MLModelType']),
    message: json['Message'] as String?,
    name: json['Name'] as String?,
    scoreThreshold: (json['ScoreThreshold'] as num?)?.toDouble(),
    scoreThresholdLastUpdatedAt: const UnixDateTimeConverter()
        .fromJson(json['ScoreThresholdLastUpdatedAt']),
    sizeInBytes: json['SizeInBytes'] as int?,
    startedAt: const UnixDateTimeConverter().fromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
    trainingDataSourceId: json['TrainingDataSourceId'] as String?,
    trainingParameters:
        (json['TrainingParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$AlgorithmEnumMap = {
  Algorithm.sgd: 'sgd',
};

PerformanceMetrics _$PerformanceMetricsFromJson(Map<String, dynamic> json) {
  return PerformanceMetrics(
    properties: (json['Properties'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

PredictOutput _$PredictOutputFromJson(Map<String, dynamic> json) {
  return PredictOutput(
    prediction: json['Prediction'] == null
        ? null
        : Prediction.fromJson(json['Prediction'] as Map<String, dynamic>),
  );
}

Prediction _$PredictionFromJson(Map<String, dynamic> json) {
  return Prediction(
    details: (json['details'] as Map<String, dynamic>?)?.map(
      (k, e) =>
          MapEntry(_$enumDecode(_$DetailsAttributesEnumMap, k), e as String),
    ),
    predictedLabel: json['predictedLabel'] as String?,
    predictedScores: (json['predictedScores'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, (e as num).toDouble()),
    ),
    predictedValue: (json['predictedValue'] as num?)?.toDouble(),
  );
}

const _$DetailsAttributesEnumMap = {
  DetailsAttributes.predictiveModelType: 'PredictiveModelType',
  DetailsAttributes.algorithm: 'Algorithm',
};

PredictorNotMountedException _$PredictorNotMountedExceptionFromJson(
    Map<String, dynamic> json) {
  return PredictorNotMountedException(
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$RDSDataSpecToJson(RDSDataSpec instance) {
  final val = <String, dynamic>{
    'DatabaseCredentials': instance.databaseCredentials.toJson(),
    'DatabaseInformation': instance.databaseInformation.toJson(),
    'ResourceRole': instance.resourceRole,
    'S3StagingLocation': instance.s3StagingLocation,
    'SecurityGroupIds': instance.securityGroupIds,
    'SelectSqlQuery': instance.selectSqlQuery,
    'ServiceRole': instance.serviceRole,
    'SubnetId': instance.subnetId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataRearrangement', instance.dataRearrangement);
  writeNotNull('DataSchema', instance.dataSchema);
  writeNotNull('DataSchemaUri', instance.dataSchemaUri);
  return val;
}

RDSDatabase _$RDSDatabaseFromJson(Map<String, dynamic> json) {
  return RDSDatabase(
    databaseName: json['DatabaseName'] as String,
    instanceIdentifier: json['InstanceIdentifier'] as String,
  );
}

Map<String, dynamic> _$RDSDatabaseToJson(RDSDatabase instance) =>
    <String, dynamic>{
      'DatabaseName': instance.databaseName,
      'InstanceIdentifier': instance.instanceIdentifier,
    };

Map<String, dynamic> _$RDSDatabaseCredentialsToJson(
        RDSDatabaseCredentials instance) =>
    <String, dynamic>{
      'Password': instance.password,
      'Username': instance.username,
    };

RDSMetadata _$RDSMetadataFromJson(Map<String, dynamic> json) {
  return RDSMetadata(
    dataPipelineId: json['DataPipelineId'] as String?,
    database: json['Database'] == null
        ? null
        : RDSDatabase.fromJson(json['Database'] as Map<String, dynamic>),
    databaseUserName: json['DatabaseUserName'] as String?,
    resourceRole: json['ResourceRole'] as String?,
    selectSqlQuery: json['SelectSqlQuery'] as String?,
    serviceRole: json['ServiceRole'] as String?,
  );
}

RealtimeEndpointInfo _$RealtimeEndpointInfoFromJson(Map<String, dynamic> json) {
  return RealtimeEndpointInfo(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    endpointStatus: _$enumDecodeNullable(
        _$RealtimeEndpointStatusEnumMap, json['EndpointStatus']),
    endpointUrl: json['EndpointUrl'] as String?,
    peakRequestsPerSecond: json['PeakRequestsPerSecond'] as int?,
  );
}

const _$RealtimeEndpointStatusEnumMap = {
  RealtimeEndpointStatus.none: 'NONE',
  RealtimeEndpointStatus.ready: 'READY',
  RealtimeEndpointStatus.updating: 'UPDATING',
  RealtimeEndpointStatus.failed: 'FAILED',
};

Map<String, dynamic> _$RedshiftDataSpecToJson(RedshiftDataSpec instance) {
  final val = <String, dynamic>{
    'DatabaseCredentials': instance.databaseCredentials.toJson(),
    'DatabaseInformation': instance.databaseInformation.toJson(),
    'S3StagingLocation': instance.s3StagingLocation,
    'SelectSqlQuery': instance.selectSqlQuery,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataRearrangement', instance.dataRearrangement);
  writeNotNull('DataSchema', instance.dataSchema);
  writeNotNull('DataSchemaUri', instance.dataSchemaUri);
  return val;
}

RedshiftDatabase _$RedshiftDatabaseFromJson(Map<String, dynamic> json) {
  return RedshiftDatabase(
    clusterIdentifier: json['ClusterIdentifier'] as String,
    databaseName: json['DatabaseName'] as String,
  );
}

Map<String, dynamic> _$RedshiftDatabaseToJson(RedshiftDatabase instance) =>
    <String, dynamic>{
      'ClusterIdentifier': instance.clusterIdentifier,
      'DatabaseName': instance.databaseName,
    };

Map<String, dynamic> _$RedshiftDatabaseCredentialsToJson(
        RedshiftDatabaseCredentials instance) =>
    <String, dynamic>{
      'Password': instance.password,
      'Username': instance.username,
    };

RedshiftMetadata _$RedshiftMetadataFromJson(Map<String, dynamic> json) {
  return RedshiftMetadata(
    databaseUserName: json['DatabaseUserName'] as String?,
    redshiftDatabase: json['RedshiftDatabase'] == null
        ? null
        : RedshiftDatabase.fromJson(
            json['RedshiftDatabase'] as Map<String, dynamic>),
    selectSqlQuery: json['SelectSqlQuery'] as String?,
  );
}

ResourceNotFoundException _$ResourceNotFoundExceptionFromJson(
    Map<String, dynamic> json) {
  return ResourceNotFoundException(
    code: json['code'] as int?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$S3DataSpecToJson(S3DataSpec instance) {
  final val = <String, dynamic>{
    'DataLocationS3': instance.dataLocationS3,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataRearrangement', instance.dataRearrangement);
  writeNotNull('DataSchema', instance.dataSchema);
  writeNotNull('DataSchemaLocationS3', instance.dataSchemaLocationS3);
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String?,
    value: json['Value'] as String?,
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

TagLimitExceededException _$TagLimitExceededExceptionFromJson(
    Map<String, dynamic> json) {
  return TagLimitExceededException(
    message: json['message'] as String?,
  );
}

UpdateBatchPredictionOutput _$UpdateBatchPredictionOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateBatchPredictionOutput(
    batchPredictionId: json['BatchPredictionId'] as String?,
  );
}

UpdateDataSourceOutput _$UpdateDataSourceOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateDataSourceOutput(
    dataSourceId: json['DataSourceId'] as String?,
  );
}

UpdateEvaluationOutput _$UpdateEvaluationOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateEvaluationOutput(
    evaluationId: json['EvaluationId'] as String?,
  );
}

UpdateMLModelOutput _$UpdateMLModelOutputFromJson(Map<String, dynamic> json) {
  return UpdateMLModelOutput(
    mLModelId: json['MLModelId'] as String?,
  );
}
