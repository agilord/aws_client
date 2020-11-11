// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machinelearning-2014-12-12.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AddTagsInputToJson(AddTagsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull(
      'ResourceType', _$TaggableResourceTypeEnumMap[instance.resourceType]);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$TaggableResourceTypeEnumMap = {
  TaggableResourceType.batchPrediction: 'BatchPrediction',
  TaggableResourceType.dataSource: 'DataSource',
  TaggableResourceType.evaluation: 'Evaluation',
  TaggableResourceType.mLModel: 'MLModel',
};

AddTagsOutput _$AddTagsOutputFromJson(Map<String, dynamic> json) {
  return AddTagsOutput(
    resourceId: json['ResourceId'] as String,
    resourceType: _$enumDecodeNullable(
        _$TaggableResourceTypeEnumMap, json['ResourceType']),
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

BatchPrediction _$BatchPredictionFromJson(Map<String, dynamic> json) {
  return BatchPrediction(
    batchPredictionDataSourceId: json['BatchPredictionDataSourceId'] as String,
    batchPredictionId: json['BatchPredictionId'] as String,
    computeTime: json['ComputeTime'] as int,
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String,
    finishedAt: unixTimestampFromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String,
    invalidRecordCount: json['InvalidRecordCount'] as int,
    lastUpdatedAt: unixTimestampFromJson(json['LastUpdatedAt']),
    mLModelId: json['MLModelId'] as String,
    message: json['Message'] as String,
    name: json['Name'] as String,
    outputUri: json['OutputUri'] as String,
    startedAt: unixTimestampFromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
    totalRecordCount: json['TotalRecordCount'] as int,
  );
}

const _$EntityStatusEnumMap = {
  EntityStatus.pending: 'PENDING',
  EntityStatus.inprogress: 'INPROGRESS',
  EntityStatus.failed: 'FAILED',
  EntityStatus.completed: 'COMPLETED',
  EntityStatus.deleted: 'DELETED',
};

Map<String, dynamic> _$CreateBatchPredictionInputToJson(
    CreateBatchPredictionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'BatchPredictionDataSourceId', instance.batchPredictionDataSourceId);
  writeNotNull('BatchPredictionId', instance.batchPredictionId);
  writeNotNull('MLModelId', instance.mLModelId);
  writeNotNull('OutputUri', instance.outputUri);
  writeNotNull('BatchPredictionName', instance.batchPredictionName);
  return val;
}

CreateBatchPredictionOutput _$CreateBatchPredictionOutputFromJson(
    Map<String, dynamic> json) {
  return CreateBatchPredictionOutput(
    batchPredictionId: json['BatchPredictionId'] as String,
  );
}

Map<String, dynamic> _$CreateDataSourceFromRDSInputToJson(
    CreateDataSourceFromRDSInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceId', instance.dataSourceId);
  writeNotNull('RDSData', instance.rDSData?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('ComputeStatistics', instance.computeStatistics);
  writeNotNull('DataSourceName', instance.dataSourceName);
  return val;
}

CreateDataSourceFromRDSOutput _$CreateDataSourceFromRDSOutputFromJson(
    Map<String, dynamic> json) {
  return CreateDataSourceFromRDSOutput(
    dataSourceId: json['DataSourceId'] as String,
  );
}

Map<String, dynamic> _$CreateDataSourceFromRedshiftInputToJson(
    CreateDataSourceFromRedshiftInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceId', instance.dataSourceId);
  writeNotNull('DataSpec', instance.dataSpec?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('ComputeStatistics', instance.computeStatistics);
  writeNotNull('DataSourceName', instance.dataSourceName);
  return val;
}

CreateDataSourceFromRedshiftOutput _$CreateDataSourceFromRedshiftOutputFromJson(
    Map<String, dynamic> json) {
  return CreateDataSourceFromRedshiftOutput(
    dataSourceId: json['DataSourceId'] as String,
  );
}

Map<String, dynamic> _$CreateDataSourceFromS3InputToJson(
    CreateDataSourceFromS3Input instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceId', instance.dataSourceId);
  writeNotNull('DataSpec', instance.dataSpec?.toJson());
  writeNotNull('ComputeStatistics', instance.computeStatistics);
  writeNotNull('DataSourceName', instance.dataSourceName);
  return val;
}

CreateDataSourceFromS3Output _$CreateDataSourceFromS3OutputFromJson(
    Map<String, dynamic> json) {
  return CreateDataSourceFromS3Output(
    dataSourceId: json['DataSourceId'] as String,
  );
}

Map<String, dynamic> _$CreateEvaluationInputToJson(
    CreateEvaluationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EvaluationDataSourceId', instance.evaluationDataSourceId);
  writeNotNull('EvaluationId', instance.evaluationId);
  writeNotNull('MLModelId', instance.mLModelId);
  writeNotNull('EvaluationName', instance.evaluationName);
  return val;
}

CreateEvaluationOutput _$CreateEvaluationOutputFromJson(
    Map<String, dynamic> json) {
  return CreateEvaluationOutput(
    evaluationId: json['EvaluationId'] as String,
  );
}

Map<String, dynamic> _$CreateMLModelInputToJson(CreateMLModelInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MLModelId', instance.mLModelId);
  writeNotNull('MLModelType', _$MLModelTypeEnumMap[instance.mLModelType]);
  writeNotNull('TrainingDataSourceId', instance.trainingDataSourceId);
  writeNotNull('MLModelName', instance.mLModelName);
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('Recipe', instance.recipe);
  writeNotNull('RecipeUri', instance.recipeUri);
  return val;
}

const _$MLModelTypeEnumMap = {
  MLModelType.regression: 'REGRESSION',
  MLModelType.binary: 'BINARY',
  MLModelType.multiclass: 'MULTICLASS',
};

CreateMLModelOutput _$CreateMLModelOutputFromJson(Map<String, dynamic> json) {
  return CreateMLModelOutput(
    mLModelId: json['MLModelId'] as String,
  );
}

Map<String, dynamic> _$CreateRealtimeEndpointInputToJson(
    CreateRealtimeEndpointInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MLModelId', instance.mLModelId);
  return val;
}

CreateRealtimeEndpointOutput _$CreateRealtimeEndpointOutputFromJson(
    Map<String, dynamic> json) {
  return CreateRealtimeEndpointOutput(
    mLModelId: json['MLModelId'] as String,
    realtimeEndpointInfo: json['RealtimeEndpointInfo'] == null
        ? null
        : RealtimeEndpointInfo.fromJson(
            json['RealtimeEndpointInfo'] as Map<String, dynamic>),
  );
}

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return DataSource(
    computeStatistics: json['ComputeStatistics'] as bool,
    computeTime: json['ComputeTime'] as int,
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String,
    dataLocationS3: json['DataLocationS3'] as String,
    dataRearrangement: json['DataRearrangement'] as String,
    dataSizeInBytes: json['DataSizeInBytes'] as int,
    dataSourceId: json['DataSourceId'] as String,
    finishedAt: unixTimestampFromJson(json['FinishedAt']),
    lastUpdatedAt: unixTimestampFromJson(json['LastUpdatedAt']),
    message: json['Message'] as String,
    name: json['Name'] as String,
    numberOfFiles: json['NumberOfFiles'] as int,
    rDSMetadata: json['RDSMetadata'] == null
        ? null
        : RDSMetadata.fromJson(json['RDSMetadata'] as Map<String, dynamic>),
    redshiftMetadata: json['RedshiftMetadata'] == null
        ? null
        : RedshiftMetadata.fromJson(
            json['RedshiftMetadata'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String,
    startedAt: unixTimestampFromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$DeleteBatchPredictionInputToJson(
    DeleteBatchPredictionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BatchPredictionId', instance.batchPredictionId);
  return val;
}

DeleteBatchPredictionOutput _$DeleteBatchPredictionOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteBatchPredictionOutput(
    batchPredictionId: json['BatchPredictionId'] as String,
  );
}

Map<String, dynamic> _$DeleteDataSourceInputToJson(
    DeleteDataSourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceId', instance.dataSourceId);
  return val;
}

DeleteDataSourceOutput _$DeleteDataSourceOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteDataSourceOutput(
    dataSourceId: json['DataSourceId'] as String,
  );
}

Map<String, dynamic> _$DeleteEvaluationInputToJson(
    DeleteEvaluationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EvaluationId', instance.evaluationId);
  return val;
}

DeleteEvaluationOutput _$DeleteEvaluationOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteEvaluationOutput(
    evaluationId: json['EvaluationId'] as String,
  );
}

Map<String, dynamic> _$DeleteMLModelInputToJson(DeleteMLModelInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MLModelId', instance.mLModelId);
  return val;
}

DeleteMLModelOutput _$DeleteMLModelOutputFromJson(Map<String, dynamic> json) {
  return DeleteMLModelOutput(
    mLModelId: json['MLModelId'] as String,
  );
}

Map<String, dynamic> _$DeleteRealtimeEndpointInputToJson(
    DeleteRealtimeEndpointInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MLModelId', instance.mLModelId);
  return val;
}

DeleteRealtimeEndpointOutput _$DeleteRealtimeEndpointOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteRealtimeEndpointOutput(
    mLModelId: json['MLModelId'] as String,
    realtimeEndpointInfo: json['RealtimeEndpointInfo'] == null
        ? null
        : RealtimeEndpointInfo.fromJson(
            json['RealtimeEndpointInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteTagsInputToJson(DeleteTagsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull(
      'ResourceType', _$TaggableResourceTypeEnumMap[instance.resourceType]);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

DeleteTagsOutput _$DeleteTagsOutputFromJson(Map<String, dynamic> json) {
  return DeleteTagsOutput(
    resourceId: json['ResourceId'] as String,
    resourceType: _$enumDecodeNullable(
        _$TaggableResourceTypeEnumMap, json['ResourceType']),
  );
}

Map<String, dynamic> _$DescribeBatchPredictionsInputToJson(
    DescribeBatchPredictionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EQ', instance.eq);
  writeNotNull('FilterVariable',
      _$BatchPredictionFilterVariableEnumMap[instance.filterVariable]);
  writeNotNull('GE', instance.ge);
  writeNotNull('GT', instance.gt);
  writeNotNull('LE', instance.le);
  writeNotNull('LT', instance.lt);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NE', instance.ne);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Prefix', instance.prefix);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$BatchPredictionFilterVariableEnumMap = {
  BatchPredictionFilterVariable.createdAt: 'CreatedAt',
  BatchPredictionFilterVariable.lastUpdatedAt: 'LastUpdatedAt',
  BatchPredictionFilterVariable.status: 'Status',
  BatchPredictionFilterVariable.name: 'Name',
  BatchPredictionFilterVariable.iAMUser: 'IAMUser',
  BatchPredictionFilterVariable.mLModelId: 'MLModelId',
  BatchPredictionFilterVariable.dataSourceId: 'DataSourceId',
  BatchPredictionFilterVariable.dataURI: 'DataURI',
};

const _$SortOrderEnumMap = {
  SortOrder.asc: 'asc',
  SortOrder.dsc: 'dsc',
};

DescribeBatchPredictionsOutput _$DescribeBatchPredictionsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeBatchPredictionsOutput(
    nextToken: json['NextToken'] as String,
    results: (json['Results'] as List)
        ?.map((e) => e == null
            ? null
            : BatchPrediction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeDataSourcesInputToJson(
    DescribeDataSourcesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EQ', instance.eq);
  writeNotNull('FilterVariable',
      _$DataSourceFilterVariableEnumMap[instance.filterVariable]);
  writeNotNull('GE', instance.ge);
  writeNotNull('GT', instance.gt);
  writeNotNull('LE', instance.le);
  writeNotNull('LT', instance.lt);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NE', instance.ne);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Prefix', instance.prefix);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$DataSourceFilterVariableEnumMap = {
  DataSourceFilterVariable.createdAt: 'CreatedAt',
  DataSourceFilterVariable.lastUpdatedAt: 'LastUpdatedAt',
  DataSourceFilterVariable.status: 'Status',
  DataSourceFilterVariable.name: 'Name',
  DataSourceFilterVariable.dataLocationS3: 'DataLocationS3',
  DataSourceFilterVariable.iAMUser: 'IAMUser',
};

DescribeDataSourcesOutput _$DescribeDataSourcesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeDataSourcesOutput(
    nextToken: json['NextToken'] as String,
    results: (json['Results'] as List)
        ?.map((e) =>
            e == null ? null : DataSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeEvaluationsInputToJson(
    DescribeEvaluationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EQ', instance.eq);
  writeNotNull('FilterVariable',
      _$EvaluationFilterVariableEnumMap[instance.filterVariable]);
  writeNotNull('GE', instance.ge);
  writeNotNull('GT', instance.gt);
  writeNotNull('LE', instance.le);
  writeNotNull('LT', instance.lt);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NE', instance.ne);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Prefix', instance.prefix);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$EvaluationFilterVariableEnumMap = {
  EvaluationFilterVariable.createdAt: 'CreatedAt',
  EvaluationFilterVariable.lastUpdatedAt: 'LastUpdatedAt',
  EvaluationFilterVariable.status: 'Status',
  EvaluationFilterVariable.name: 'Name',
  EvaluationFilterVariable.iAMUser: 'IAMUser',
  EvaluationFilterVariable.mLModelId: 'MLModelId',
  EvaluationFilterVariable.dataSourceId: 'DataSourceId',
  EvaluationFilterVariable.dataURI: 'DataURI',
};

DescribeEvaluationsOutput _$DescribeEvaluationsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeEvaluationsOutput(
    nextToken: json['NextToken'] as String,
    results: (json['Results'] as List)
        ?.map((e) =>
            e == null ? null : Evaluation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeMLModelsInputToJson(
    DescribeMLModelsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EQ', instance.eq);
  writeNotNull('FilterVariable',
      _$MLModelFilterVariableEnumMap[instance.filterVariable]);
  writeNotNull('GE', instance.ge);
  writeNotNull('GT', instance.gt);
  writeNotNull('LE', instance.le);
  writeNotNull('LT', instance.lt);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NE', instance.ne);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Prefix', instance.prefix);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$MLModelFilterVariableEnumMap = {
  MLModelFilterVariable.createdAt: 'CreatedAt',
  MLModelFilterVariable.lastUpdatedAt: 'LastUpdatedAt',
  MLModelFilterVariable.status: 'Status',
  MLModelFilterVariable.name: 'Name',
  MLModelFilterVariable.iAMUser: 'IAMUser',
  MLModelFilterVariable.trainingDataSourceId: 'TrainingDataSourceId',
  MLModelFilterVariable.realtimeEndpointStatus: 'RealtimeEndpointStatus',
  MLModelFilterVariable.mLModelType: 'MLModelType',
  MLModelFilterVariable.algorithm: 'Algorithm',
  MLModelFilterVariable.trainingDataURI: 'TrainingDataURI',
};

DescribeMLModelsOutput _$DescribeMLModelsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeMLModelsOutput(
    nextToken: json['NextToken'] as String,
    results: (json['Results'] as List)
        ?.map((e) =>
            e == null ? null : MLModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeTagsInputToJson(DescribeTagsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull(
      'ResourceType', _$TaggableResourceTypeEnumMap[instance.resourceType]);
  return val;
}

DescribeTagsOutput _$DescribeTagsOutputFromJson(Map<String, dynamic> json) {
  return DescribeTagsOutput(
    resourceId: json['ResourceId'] as String,
    resourceType: _$enumDecodeNullable(
        _$TaggableResourceTypeEnumMap, json['ResourceType']),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Evaluation _$EvaluationFromJson(Map<String, dynamic> json) {
  return Evaluation(
    computeTime: json['ComputeTime'] as int,
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String,
    evaluationDataSourceId: json['EvaluationDataSourceId'] as String,
    evaluationId: json['EvaluationId'] as String,
    finishedAt: unixTimestampFromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String,
    lastUpdatedAt: unixTimestampFromJson(json['LastUpdatedAt']),
    mLModelId: json['MLModelId'] as String,
    message: json['Message'] as String,
    name: json['Name'] as String,
    performanceMetrics: json['PerformanceMetrics'] == null
        ? null
        : PerformanceMetrics.fromJson(
            json['PerformanceMetrics'] as Map<String, dynamic>),
    startedAt: unixTimestampFromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$GetBatchPredictionInputToJson(
    GetBatchPredictionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BatchPredictionId', instance.batchPredictionId);
  return val;
}

GetBatchPredictionOutput _$GetBatchPredictionOutputFromJson(
    Map<String, dynamic> json) {
  return GetBatchPredictionOutput(
    batchPredictionDataSourceId: json['BatchPredictionDataSourceId'] as String,
    batchPredictionId: json['BatchPredictionId'] as String,
    computeTime: json['ComputeTime'] as int,
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String,
    finishedAt: unixTimestampFromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String,
    invalidRecordCount: json['InvalidRecordCount'] as int,
    lastUpdatedAt: unixTimestampFromJson(json['LastUpdatedAt']),
    logUri: json['LogUri'] as String,
    mLModelId: json['MLModelId'] as String,
    message: json['Message'] as String,
    name: json['Name'] as String,
    outputUri: json['OutputUri'] as String,
    startedAt: unixTimestampFromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
    totalRecordCount: json['TotalRecordCount'] as int,
  );
}

Map<String, dynamic> _$GetDataSourceInputToJson(GetDataSourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceId', instance.dataSourceId);
  writeNotNull('Verbose', instance.verbose);
  return val;
}

GetDataSourceOutput _$GetDataSourceOutputFromJson(Map<String, dynamic> json) {
  return GetDataSourceOutput(
    computeStatistics: json['ComputeStatistics'] as bool,
    computeTime: json['ComputeTime'] as int,
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String,
    dataLocationS3: json['DataLocationS3'] as String,
    dataRearrangement: json['DataRearrangement'] as String,
    dataSizeInBytes: json['DataSizeInBytes'] as int,
    dataSourceId: json['DataSourceId'] as String,
    dataSourceSchema: json['DataSourceSchema'] as String,
    finishedAt: unixTimestampFromJson(json['FinishedAt']),
    lastUpdatedAt: unixTimestampFromJson(json['LastUpdatedAt']),
    logUri: json['LogUri'] as String,
    message: json['Message'] as String,
    name: json['Name'] as String,
    numberOfFiles: json['NumberOfFiles'] as int,
    rDSMetadata: json['RDSMetadata'] == null
        ? null
        : RDSMetadata.fromJson(json['RDSMetadata'] as Map<String, dynamic>),
    redshiftMetadata: json['RedshiftMetadata'] == null
        ? null
        : RedshiftMetadata.fromJson(
            json['RedshiftMetadata'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String,
    startedAt: unixTimestampFromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$GetEvaluationInputToJson(GetEvaluationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EvaluationId', instance.evaluationId);
  return val;
}

GetEvaluationOutput _$GetEvaluationOutputFromJson(Map<String, dynamic> json) {
  return GetEvaluationOutput(
    computeTime: json['ComputeTime'] as int,
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String,
    evaluationDataSourceId: json['EvaluationDataSourceId'] as String,
    evaluationId: json['EvaluationId'] as String,
    finishedAt: unixTimestampFromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String,
    lastUpdatedAt: unixTimestampFromJson(json['LastUpdatedAt']),
    logUri: json['LogUri'] as String,
    mLModelId: json['MLModelId'] as String,
    message: json['Message'] as String,
    name: json['Name'] as String,
    performanceMetrics: json['PerformanceMetrics'] == null
        ? null
        : PerformanceMetrics.fromJson(
            json['PerformanceMetrics'] as Map<String, dynamic>),
    startedAt: unixTimestampFromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$GetMLModelInputToJson(GetMLModelInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MLModelId', instance.mLModelId);
  writeNotNull('Verbose', instance.verbose);
  return val;
}

GetMLModelOutput _$GetMLModelOutputFromJson(Map<String, dynamic> json) {
  return GetMLModelOutput(
    computeTime: json['ComputeTime'] as int,
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String,
    endpointInfo: json['EndpointInfo'] == null
        ? null
        : RealtimeEndpointInfo.fromJson(
            json['EndpointInfo'] as Map<String, dynamic>),
    finishedAt: unixTimestampFromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String,
    lastUpdatedAt: unixTimestampFromJson(json['LastUpdatedAt']),
    logUri: json['LogUri'] as String,
    mLModelId: json['MLModelId'] as String,
    mLModelType:
        _$enumDecodeNullable(_$MLModelTypeEnumMap, json['MLModelType']),
    message: json['Message'] as String,
    name: json['Name'] as String,
    recipe: json['Recipe'] as String,
    schema: json['Schema'] as String,
    scoreThreshold: (json['ScoreThreshold'] as num)?.toDouble(),
    scoreThresholdLastUpdatedAt:
        unixTimestampFromJson(json['ScoreThresholdLastUpdatedAt']),
    sizeInBytes: json['SizeInBytes'] as int,
    startedAt: unixTimestampFromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
    trainingDataSourceId: json['TrainingDataSourceId'] as String,
    trainingParameters:
        (json['TrainingParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

IdempotentParameterMismatchException
    _$IdempotentParameterMismatchExceptionFromJson(Map<String, dynamic> json) {
  return IdempotentParameterMismatchException(
    code: json['code'] as int,
    message: json['message'] as String,
  );
}

InternalServerException _$InternalServerExceptionFromJson(
    Map<String, dynamic> json) {
  return InternalServerException(
    code: json['code'] as int,
    message: json['message'] as String,
  );
}

InvalidInputException _$InvalidInputExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidInputException(
    code: json['code'] as int,
    message: json['message'] as String,
  );
}

InvalidTagException _$InvalidTagExceptionFromJson(Map<String, dynamic> json) {
  return InvalidTagException(
    message: json['message'] as String,
  );
}

LimitExceededException _$LimitExceededExceptionFromJson(
    Map<String, dynamic> json) {
  return LimitExceededException(
    code: json['code'] as int,
    message: json['message'] as String,
  );
}

MLModel _$MLModelFromJson(Map<String, dynamic> json) {
  return MLModel(
    algorithm: _$enumDecodeNullable(_$AlgorithmEnumMap, json['Algorithm']),
    computeTime: json['ComputeTime'] as int,
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    createdByIamUser: json['CreatedByIamUser'] as String,
    endpointInfo: json['EndpointInfo'] == null
        ? null
        : RealtimeEndpointInfo.fromJson(
            json['EndpointInfo'] as Map<String, dynamic>),
    finishedAt: unixTimestampFromJson(json['FinishedAt']),
    inputDataLocationS3: json['InputDataLocationS3'] as String,
    lastUpdatedAt: unixTimestampFromJson(json['LastUpdatedAt']),
    mLModelId: json['MLModelId'] as String,
    mLModelType:
        _$enumDecodeNullable(_$MLModelTypeEnumMap, json['MLModelType']),
    message: json['Message'] as String,
    name: json['Name'] as String,
    scoreThreshold: (json['ScoreThreshold'] as num)?.toDouble(),
    scoreThresholdLastUpdatedAt:
        unixTimestampFromJson(json['ScoreThresholdLastUpdatedAt']),
    sizeInBytes: json['SizeInBytes'] as int,
    startedAt: unixTimestampFromJson(json['StartedAt']),
    status: _$enumDecodeNullable(_$EntityStatusEnumMap, json['Status']),
    trainingDataSourceId: json['TrainingDataSourceId'] as String,
    trainingParameters:
        (json['TrainingParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$AlgorithmEnumMap = {
  Algorithm.sgd: 'sgd',
};

PerformanceMetrics _$PerformanceMetricsFromJson(Map<String, dynamic> json) {
  return PerformanceMetrics(
    properties: (json['Properties'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$PredictInputToJson(PredictInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MLModelId', instance.mLModelId);
  writeNotNull('PredictEndpoint', instance.predictEndpoint);
  writeNotNull('Record', instance.record);
  return val;
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
    details: (json['details'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    predictedLabel: json['predictedLabel'] as String,
    predictedScores: (json['predictedScores'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
    predictedValue: (json['predictedValue'] as num)?.toDouble(),
  );
}

PredictorNotMountedException _$PredictorNotMountedExceptionFromJson(
    Map<String, dynamic> json) {
  return PredictorNotMountedException(
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$RDSDataSpecToJson(RDSDataSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DatabaseCredentials', instance.databaseCredentials?.toJson());
  writeNotNull('DatabaseInformation', instance.databaseInformation?.toJson());
  writeNotNull('ResourceRole', instance.resourceRole);
  writeNotNull('S3StagingLocation', instance.s3StagingLocation);
  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SelectSqlQuery', instance.selectSqlQuery);
  writeNotNull('ServiceRole', instance.serviceRole);
  writeNotNull('SubnetId', instance.subnetId);
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

Map<String, dynamic> _$RDSDatabaseToJson(RDSDatabase instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('InstanceIdentifier', instance.instanceIdentifier);
  return val;
}

Map<String, dynamic> _$RDSDatabaseCredentialsToJson(
    RDSDatabaseCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Password', instance.password);
  writeNotNull('Username', instance.username);
  return val;
}

RDSMetadata _$RDSMetadataFromJson(Map<String, dynamic> json) {
  return RDSMetadata(
    dataPipelineId: json['DataPipelineId'] as String,
    database: json['Database'] == null
        ? null
        : RDSDatabase.fromJson(json['Database'] as Map<String, dynamic>),
    databaseUserName: json['DatabaseUserName'] as String,
    resourceRole: json['ResourceRole'] as String,
    selectSqlQuery: json['SelectSqlQuery'] as String,
    serviceRole: json['ServiceRole'] as String,
  );
}

RealtimeEndpointInfo _$RealtimeEndpointInfoFromJson(Map<String, dynamic> json) {
  return RealtimeEndpointInfo(
    createdAt: unixTimestampFromJson(json['CreatedAt']),
    endpointStatus: _$enumDecodeNullable(
        _$RealtimeEndpointStatusEnumMap, json['EndpointStatus']),
    endpointUrl: json['EndpointUrl'] as String,
    peakRequestsPerSecond: json['PeakRequestsPerSecond'] as int,
  );
}

const _$RealtimeEndpointStatusEnumMap = {
  RealtimeEndpointStatus.none: 'NONE',
  RealtimeEndpointStatus.ready: 'READY',
  RealtimeEndpointStatus.updating: 'UPDATING',
  RealtimeEndpointStatus.failed: 'FAILED',
};

Map<String, dynamic> _$RedshiftDataSpecToJson(RedshiftDataSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DatabaseCredentials', instance.databaseCredentials?.toJson());
  writeNotNull('DatabaseInformation', instance.databaseInformation?.toJson());
  writeNotNull('S3StagingLocation', instance.s3StagingLocation);
  writeNotNull('SelectSqlQuery', instance.selectSqlQuery);
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

Map<String, dynamic> _$RedshiftDatabaseToJson(RedshiftDatabase instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterIdentifier', instance.clusterIdentifier);
  writeNotNull('DatabaseName', instance.databaseName);
  return val;
}

Map<String, dynamic> _$RedshiftDatabaseCredentialsToJson(
    RedshiftDatabaseCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Password', instance.password);
  writeNotNull('Username', instance.username);
  return val;
}

RedshiftMetadata _$RedshiftMetadataFromJson(Map<String, dynamic> json) {
  return RedshiftMetadata(
    databaseUserName: json['DatabaseUserName'] as String,
    redshiftDatabase: json['RedshiftDatabase'] == null
        ? null
        : RedshiftDatabase.fromJson(
            json['RedshiftDatabase'] as Map<String, dynamic>),
    selectSqlQuery: json['SelectSqlQuery'] as String,
  );
}

ResourceNotFoundException _$ResourceNotFoundExceptionFromJson(
    Map<String, dynamic> json) {
  return ResourceNotFoundException(
    code: json['code'] as int,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$S3DataSpecToJson(S3DataSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataLocationS3', instance.dataLocationS3);
  writeNotNull('DataRearrangement', instance.dataRearrangement);
  writeNotNull('DataSchema', instance.dataSchema);
  writeNotNull('DataSchemaLocationS3', instance.dataSchemaLocationS3);
  return val;
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

TagLimitExceededException _$TagLimitExceededExceptionFromJson(
    Map<String, dynamic> json) {
  return TagLimitExceededException(
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$UpdateBatchPredictionInputToJson(
    UpdateBatchPredictionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BatchPredictionId', instance.batchPredictionId);
  writeNotNull('BatchPredictionName', instance.batchPredictionName);
  return val;
}

UpdateBatchPredictionOutput _$UpdateBatchPredictionOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateBatchPredictionOutput(
    batchPredictionId: json['BatchPredictionId'] as String,
  );
}

Map<String, dynamic> _$UpdateDataSourceInputToJson(
    UpdateDataSourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSourceId', instance.dataSourceId);
  writeNotNull('DataSourceName', instance.dataSourceName);
  return val;
}

UpdateDataSourceOutput _$UpdateDataSourceOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateDataSourceOutput(
    dataSourceId: json['DataSourceId'] as String,
  );
}

Map<String, dynamic> _$UpdateEvaluationInputToJson(
    UpdateEvaluationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EvaluationId', instance.evaluationId);
  writeNotNull('EvaluationName', instance.evaluationName);
  return val;
}

UpdateEvaluationOutput _$UpdateEvaluationOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateEvaluationOutput(
    evaluationId: json['EvaluationId'] as String,
  );
}

Map<String, dynamic> _$UpdateMLModelInputToJson(UpdateMLModelInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MLModelId', instance.mLModelId);
  writeNotNull('MLModelName', instance.mLModelName);
  writeNotNull('ScoreThreshold', instance.scoreThreshold);
  return val;
}

UpdateMLModelOutput _$UpdateMLModelOutputFromJson(Map<String, dynamic> json) {
  return UpdateMLModelOutput(
    mLModelId: json['MLModelId'] as String,
  );
}
