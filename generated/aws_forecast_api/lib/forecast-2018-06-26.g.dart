// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast-2018-06-26.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoricalParameterRange _$CategoricalParameterRangeFromJson(
    Map<String, dynamic> json) {
  return CategoricalParameterRange(
    name: json['Name'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CategoricalParameterRangeToJson(
    CategoricalParameterRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Values', instance.values);
  return val;
}

ContinuousParameterRange _$ContinuousParameterRangeFromJson(
    Map<String, dynamic> json) {
  return ContinuousParameterRange(
    maxValue: (json['MaxValue'] as num)?.toDouble(),
    minValue: (json['MinValue'] as num)?.toDouble(),
    name: json['Name'] as String,
    scalingType:
        _$enumDecodeNullable(_$ScalingTypeEnumMap, json['ScalingType']),
  );
}

Map<String, dynamic> _$ContinuousParameterRangeToJson(
    ContinuousParameterRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxValue', instance.maxValue);
  writeNotNull('MinValue', instance.minValue);
  writeNotNull('Name', instance.name);
  writeNotNull('ScalingType', _$ScalingTypeEnumMap[instance.scalingType]);
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

const _$ScalingTypeEnumMap = {
  ScalingType.auto: 'Auto',
  ScalingType.linear: 'Linear',
  ScalingType.logarithmic: 'Logarithmic',
  ScalingType.reverseLogarithmic: 'ReverseLogarithmic',
};

CreateDatasetGroupResponse _$CreateDatasetGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatasetGroupResponse(
    datasetGroupArn: json['DatasetGroupArn'] as String,
  );
}

CreateDatasetImportJobResponse _$CreateDatasetImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatasetImportJobResponse(
    datasetImportJobArn: json['DatasetImportJobArn'] as String,
  );
}

CreateDatasetResponse _$CreateDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatasetResponse(
    datasetArn: json['DatasetArn'] as String,
  );
}

CreateForecastExportJobResponse _$CreateForecastExportJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateForecastExportJobResponse(
    forecastExportJobArn: json['ForecastExportJobArn'] as String,
  );
}

CreateForecastResponse _$CreateForecastResponseFromJson(
    Map<String, dynamic> json) {
  return CreateForecastResponse(
    forecastArn: json['ForecastArn'] as String,
  );
}

CreatePredictorResponse _$CreatePredictorResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePredictorResponse(
    predictorArn: json['PredictorArn'] as String,
  );
}

DataDestination _$DataDestinationFromJson(Map<String, dynamic> json) {
  return DataDestination(
    s3Config: json['S3Config'] == null
        ? null
        : S3Config.fromJson(json['S3Config'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataDestinationToJson(DataDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Config', instance.s3Config?.toJson());
  return val;
}

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return DataSource(
    s3Config: json['S3Config'] == null
        ? null
        : S3Config.fromJson(json['S3Config'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataSourceToJson(DataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Config', instance.s3Config?.toJson());
  return val;
}

DatasetGroupSummary _$DatasetGroupSummaryFromJson(Map<String, dynamic> json) {
  return DatasetGroupSummary(
    creationTime: unixFromJson(json['CreationTime']),
    datasetGroupArn: json['DatasetGroupArn'] as String,
    datasetGroupName: json['DatasetGroupName'] as String,
    lastModificationTime: unixFromJson(json['LastModificationTime']),
  );
}

DatasetImportJobSummary _$DatasetImportJobSummaryFromJson(
    Map<String, dynamic> json) {
  return DatasetImportJobSummary(
    creationTime: unixFromJson(json['CreationTime']),
    dataSource: json['DataSource'] == null
        ? null
        : DataSource.fromJson(json['DataSource'] as Map<String, dynamic>),
    datasetImportJobArn: json['DatasetImportJobArn'] as String,
    datasetImportJobName: json['DatasetImportJobName'] as String,
    lastModificationTime: unixFromJson(json['LastModificationTime']),
    message: json['Message'] as String,
    status: json['Status'] as String,
  );
}

DatasetSummary _$DatasetSummaryFromJson(Map<String, dynamic> json) {
  return DatasetSummary(
    creationTime: unixFromJson(json['CreationTime']),
    datasetArn: json['DatasetArn'] as String,
    datasetName: json['DatasetName'] as String,
    datasetType:
        _$enumDecodeNullable(_$DatasetTypeEnumMap, json['DatasetType']),
    domain: _$enumDecodeNullable(_$DomainEnumMap, json['Domain']),
    lastModificationTime: unixFromJson(json['LastModificationTime']),
  );
}

const _$DatasetTypeEnumMap = {
  DatasetType.targetTimeSeries: 'TARGET_TIME_SERIES',
  DatasetType.relatedTimeSeries: 'RELATED_TIME_SERIES',
  DatasetType.itemMetadata: 'ITEM_METADATA',
};

const _$DomainEnumMap = {
  Domain.retail: 'RETAIL',
  Domain.custom: 'CUSTOM',
  Domain.inventoryPlanning: 'INVENTORY_PLANNING',
  Domain.ec2Capacity: 'EC2_CAPACITY',
  Domain.workForce: 'WORK_FORCE',
  Domain.webTraffic: 'WEB_TRAFFIC',
  Domain.metrics: 'METRICS',
};

DescribeDatasetGroupResponse _$DescribeDatasetGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatasetGroupResponse(
    creationTime: unixFromJson(json['CreationTime']),
    datasetArns:
        (json['DatasetArns'] as List)?.map((e) => e as String)?.toList(),
    datasetGroupArn: json['DatasetGroupArn'] as String,
    datasetGroupName: json['DatasetGroupName'] as String,
    domain: _$enumDecodeNullable(_$DomainEnumMap, json['Domain']),
    lastModificationTime: unixFromJson(json['LastModificationTime']),
    status: json['Status'] as String,
  );
}

DescribeDatasetImportJobResponse _$DescribeDatasetImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatasetImportJobResponse(
    creationTime: unixFromJson(json['CreationTime']),
    dataSize: (json['DataSize'] as num)?.toDouble(),
    dataSource: json['DataSource'] == null
        ? null
        : DataSource.fromJson(json['DataSource'] as Map<String, dynamic>),
    datasetArn: json['DatasetArn'] as String,
    datasetImportJobArn: json['DatasetImportJobArn'] as String,
    datasetImportJobName: json['DatasetImportJobName'] as String,
    fieldStatistics: (json['FieldStatistics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Statistics.fromJson(e as Map<String, dynamic>)),
    ),
    lastModificationTime: unixFromJson(json['LastModificationTime']),
    message: json['Message'] as String,
    status: json['Status'] as String,
    timestampFormat: json['TimestampFormat'] as String,
  );
}

DescribeDatasetResponse _$DescribeDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatasetResponse(
    creationTime: unixFromJson(json['CreationTime']),
    dataFrequency: json['DataFrequency'] as String,
    datasetArn: json['DatasetArn'] as String,
    datasetName: json['DatasetName'] as String,
    datasetType:
        _$enumDecodeNullable(_$DatasetTypeEnumMap, json['DatasetType']),
    domain: _$enumDecodeNullable(_$DomainEnumMap, json['Domain']),
    encryptionConfig: json['EncryptionConfig'] == null
        ? null
        : EncryptionConfig.fromJson(
            json['EncryptionConfig'] as Map<String, dynamic>),
    lastModificationTime: unixFromJson(json['LastModificationTime']),
    schema: json['Schema'] == null
        ? null
        : Schema.fromJson(json['Schema'] as Map<String, dynamic>),
    status: json['Status'] as String,
  );
}

DescribeForecastExportJobResponse _$DescribeForecastExportJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeForecastExportJobResponse(
    creationTime: unixFromJson(json['CreationTime']),
    destination: json['Destination'] == null
        ? null
        : DataDestination.fromJson(json['Destination'] as Map<String, dynamic>),
    forecastArn: json['ForecastArn'] as String,
    forecastExportJobArn: json['ForecastExportJobArn'] as String,
    forecastExportJobName: json['ForecastExportJobName'] as String,
    lastModificationTime: unixFromJson(json['LastModificationTime']),
    message: json['Message'] as String,
    status: json['Status'] as String,
  );
}

DescribeForecastResponse _$DescribeForecastResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeForecastResponse(
    creationTime: unixFromJson(json['CreationTime']),
    datasetGroupArn: json['DatasetGroupArn'] as String,
    forecastArn: json['ForecastArn'] as String,
    forecastName: json['ForecastName'] as String,
    forecastTypes:
        (json['ForecastTypes'] as List)?.map((e) => e as String)?.toList(),
    lastModificationTime: unixFromJson(json['LastModificationTime']),
    message: json['Message'] as String,
    predictorArn: json['PredictorArn'] as String,
    status: json['Status'] as String,
  );
}

DescribePredictorResponse _$DescribePredictorResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePredictorResponse(
    algorithmArn: json['AlgorithmArn'] as String,
    autoMLAlgorithmArns: (json['AutoMLAlgorithmArns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    creationTime: unixFromJson(json['CreationTime']),
    datasetImportJobArns: (json['DatasetImportJobArns'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    encryptionConfig: json['EncryptionConfig'] == null
        ? null
        : EncryptionConfig.fromJson(
            json['EncryptionConfig'] as Map<String, dynamic>),
    evaluationParameters: json['EvaluationParameters'] == null
        ? null
        : EvaluationParameters.fromJson(
            json['EvaluationParameters'] as Map<String, dynamic>),
    featurizationConfig: json['FeaturizationConfig'] == null
        ? null
        : FeaturizationConfig.fromJson(
            json['FeaturizationConfig'] as Map<String, dynamic>),
    forecastHorizon: json['ForecastHorizon'] as int,
    hPOConfig: json['HPOConfig'] == null
        ? null
        : HyperParameterTuningJobConfig.fromJson(
            json['HPOConfig'] as Map<String, dynamic>),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    lastModificationTime: unixFromJson(json['LastModificationTime']),
    message: json['Message'] as String,
    performAutoML: json['PerformAutoML'] as bool,
    performHPO: json['PerformHPO'] as bool,
    predictorArn: json['PredictorArn'] as String,
    predictorExecutionDetails: json['PredictorExecutionDetails'] == null
        ? null
        : PredictorExecutionDetails.fromJson(
            json['PredictorExecutionDetails'] as Map<String, dynamic>),
    predictorName: json['PredictorName'] as String,
    status: json['Status'] as String,
    trainingParameters:
        (json['TrainingParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

EncryptionConfig _$EncryptionConfigFromJson(Map<String, dynamic> json) {
  return EncryptionConfig(
    kMSKeyArn: json['KMSKeyArn'] as String,
    roleArn: json['RoleArn'] as String,
  );
}

Map<String, dynamic> _$EncryptionConfigToJson(EncryptionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KMSKeyArn', instance.kMSKeyArn);
  writeNotNull('RoleArn', instance.roleArn);
  return val;
}

EvaluationParameters _$EvaluationParametersFromJson(Map<String, dynamic> json) {
  return EvaluationParameters(
    backTestWindowOffset: json['BackTestWindowOffset'] as int,
    numberOfBacktestWindows: json['NumberOfBacktestWindows'] as int,
  );
}

Map<String, dynamic> _$EvaluationParametersToJson(
    EvaluationParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BackTestWindowOffset', instance.backTestWindowOffset);
  writeNotNull('NumberOfBacktestWindows', instance.numberOfBacktestWindows);
  return val;
}

EvaluationResult _$EvaluationResultFromJson(Map<String, dynamic> json) {
  return EvaluationResult(
    algorithmArn: json['AlgorithmArn'] as String,
    testWindows: (json['TestWindows'] as List)
        ?.map((e) => e == null
            ? null
            : WindowSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Featurization _$FeaturizationFromJson(Map<String, dynamic> json) {
  return Featurization(
    attributeName: json['AttributeName'] as String,
    featurizationPipeline: (json['FeaturizationPipeline'] as List)
        ?.map((e) => e == null
            ? null
            : FeaturizationMethod.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FeaturizationToJson(Featurization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('FeaturizationPipeline',
      instance.featurizationPipeline?.map((e) => e?.toJson())?.toList());
  return val;
}

FeaturizationConfig _$FeaturizationConfigFromJson(Map<String, dynamic> json) {
  return FeaturizationConfig(
    forecastFrequency: json['ForecastFrequency'] as String,
    featurizations: (json['Featurizations'] as List)
        ?.map((e) => e == null
            ? null
            : Featurization.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    forecastDimensions:
        (json['ForecastDimensions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$FeaturizationConfigToJson(FeaturizationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ForecastFrequency', instance.forecastFrequency);
  writeNotNull('Featurizations',
      instance.featurizations?.map((e) => e?.toJson())?.toList());
  writeNotNull('ForecastDimensions', instance.forecastDimensions);
  return val;
}

FeaturizationMethod _$FeaturizationMethodFromJson(Map<String, dynamic> json) {
  return FeaturizationMethod(
    featurizationMethodName: _$enumDecodeNullable(
        _$FeaturizationMethodNameEnumMap, json['FeaturizationMethodName']),
    featurizationMethodParameters:
        (json['FeaturizationMethodParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$FeaturizationMethodToJson(FeaturizationMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FeaturizationMethodName',
      _$FeaturizationMethodNameEnumMap[instance.featurizationMethodName]);
  writeNotNull(
      'FeaturizationMethodParameters', instance.featurizationMethodParameters);
  return val;
}

const _$FeaturizationMethodNameEnumMap = {
  FeaturizationMethodName.filling: 'filling',
};

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Condition', _$FilterConditionStringEnumMap[instance.condition]);
  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

const _$FilterConditionStringEnumMap = {
  FilterConditionString.$is: 'IS',
  FilterConditionString.isNot: 'IS_NOT',
};

ForecastExportJobSummary _$ForecastExportJobSummaryFromJson(
    Map<String, dynamic> json) {
  return ForecastExportJobSummary(
    creationTime: unixFromJson(json['CreationTime']),
    destination: json['Destination'] == null
        ? null
        : DataDestination.fromJson(json['Destination'] as Map<String, dynamic>),
    forecastExportJobArn: json['ForecastExportJobArn'] as String,
    forecastExportJobName: json['ForecastExportJobName'] as String,
    lastModificationTime: unixFromJson(json['LastModificationTime']),
    message: json['Message'] as String,
    status: json['Status'] as String,
  );
}

ForecastSummary _$ForecastSummaryFromJson(Map<String, dynamic> json) {
  return ForecastSummary(
    creationTime: unixFromJson(json['CreationTime']),
    datasetGroupArn: json['DatasetGroupArn'] as String,
    forecastArn: json['ForecastArn'] as String,
    forecastName: json['ForecastName'] as String,
    lastModificationTime: unixFromJson(json['LastModificationTime']),
    message: json['Message'] as String,
    predictorArn: json['PredictorArn'] as String,
    status: json['Status'] as String,
  );
}

GetAccuracyMetricsResponse _$GetAccuracyMetricsResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccuracyMetricsResponse(
    predictorEvaluationResults: (json['PredictorEvaluationResults'] as List)
        ?.map((e) => e == null
            ? null
            : EvaluationResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

HyperParameterTuningJobConfig _$HyperParameterTuningJobConfigFromJson(
    Map<String, dynamic> json) {
  return HyperParameterTuningJobConfig(
    parameterRanges: json['ParameterRanges'] == null
        ? null
        : ParameterRanges.fromJson(
            json['ParameterRanges'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HyperParameterTuningJobConfigToJson(
    HyperParameterTuningJobConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParameterRanges', instance.parameterRanges?.toJson());
  return val;
}

InputDataConfig _$InputDataConfigFromJson(Map<String, dynamic> json) {
  return InputDataConfig(
    datasetGroupArn: json['DatasetGroupArn'] as String,
    supplementaryFeatures: (json['SupplementaryFeatures'] as List)
        ?.map((e) => e == null
            ? null
            : SupplementaryFeature.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InputDataConfigToJson(InputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DatasetGroupArn', instance.datasetGroupArn);
  writeNotNull('SupplementaryFeatures',
      instance.supplementaryFeatures?.map((e) => e?.toJson())?.toList());
  return val;
}

IntegerParameterRange _$IntegerParameterRangeFromJson(
    Map<String, dynamic> json) {
  return IntegerParameterRange(
    maxValue: json['MaxValue'] as int,
    minValue: json['MinValue'] as int,
    name: json['Name'] as String,
    scalingType:
        _$enumDecodeNullable(_$ScalingTypeEnumMap, json['ScalingType']),
  );
}

Map<String, dynamic> _$IntegerParameterRangeToJson(
    IntegerParameterRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxValue', instance.maxValue);
  writeNotNull('MinValue', instance.minValue);
  writeNotNull('Name', instance.name);
  writeNotNull('ScalingType', _$ScalingTypeEnumMap[instance.scalingType]);
  return val;
}

ListDatasetGroupsResponse _$ListDatasetGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDatasetGroupsResponse(
    datasetGroups: (json['DatasetGroups'] as List)
        ?.map((e) => e == null
            ? null
            : DatasetGroupSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDatasetImportJobsResponse _$ListDatasetImportJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDatasetImportJobsResponse(
    datasetImportJobs: (json['DatasetImportJobs'] as List)
        ?.map((e) => e == null
            ? null
            : DatasetImportJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDatasetsResponse _$ListDatasetsResponseFromJson(Map<String, dynamic> json) {
  return ListDatasetsResponse(
    datasets: (json['Datasets'] as List)
        ?.map((e) => e == null
            ? null
            : DatasetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListForecastExportJobsResponse _$ListForecastExportJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListForecastExportJobsResponse(
    forecastExportJobs: (json['ForecastExportJobs'] as List)
        ?.map((e) => e == null
            ? null
            : ForecastExportJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListForecastsResponse _$ListForecastsResponseFromJson(
    Map<String, dynamic> json) {
  return ListForecastsResponse(
    forecasts: (json['Forecasts'] as List)
        ?.map((e) => e == null
            ? null
            : ForecastSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPredictorsResponse _$ListPredictorsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPredictorsResponse(
    nextToken: json['NextToken'] as String,
    predictors: (json['Predictors'] as List)
        ?.map((e) => e == null
            ? null
            : PredictorSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Metrics _$MetricsFromJson(Map<String, dynamic> json) {
  return Metrics(
    rmse: (json['RMSE'] as num)?.toDouble(),
    weightedQuantileLosses: (json['WeightedQuantileLosses'] as List)
        ?.map((e) => e == null
            ? null
            : WeightedQuantileLoss.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ParameterRanges _$ParameterRangesFromJson(Map<String, dynamic> json) {
  return ParameterRanges(
    categoricalParameterRanges: (json['CategoricalParameterRanges'] as List)
        ?.map((e) => e == null
            ? null
            : CategoricalParameterRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    continuousParameterRanges: (json['ContinuousParameterRanges'] as List)
        ?.map((e) => e == null
            ? null
            : ContinuousParameterRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    integerParameterRanges: (json['IntegerParameterRanges'] as List)
        ?.map((e) => e == null
            ? null
            : IntegerParameterRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ParameterRangesToJson(ParameterRanges instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CategoricalParameterRanges',
      instance.categoricalParameterRanges?.map((e) => e?.toJson())?.toList());
  writeNotNull('ContinuousParameterRanges',
      instance.continuousParameterRanges?.map((e) => e?.toJson())?.toList());
  writeNotNull('IntegerParameterRanges',
      instance.integerParameterRanges?.map((e) => e?.toJson())?.toList());
  return val;
}

PredictorExecution _$PredictorExecutionFromJson(Map<String, dynamic> json) {
  return PredictorExecution(
    algorithmArn: json['AlgorithmArn'] as String,
    testWindows: (json['TestWindows'] as List)
        ?.map((e) => e == null
            ? null
            : TestWindowSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PredictorExecutionDetails _$PredictorExecutionDetailsFromJson(
    Map<String, dynamic> json) {
  return PredictorExecutionDetails(
    predictorExecutions: (json['PredictorExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : PredictorExecution.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PredictorSummary _$PredictorSummaryFromJson(Map<String, dynamic> json) {
  return PredictorSummary(
    creationTime: unixFromJson(json['CreationTime']),
    datasetGroupArn: json['DatasetGroupArn'] as String,
    lastModificationTime: unixFromJson(json['LastModificationTime']),
    message: json['Message'] as String,
    predictorArn: json['PredictorArn'] as String,
    predictorName: json['PredictorName'] as String,
    status: json['Status'] as String,
  );
}

S3Config _$S3ConfigFromJson(Map<String, dynamic> json) {
  return S3Config(
    path: json['Path'] as String,
    roleArn: json['RoleArn'] as String,
    kMSKeyArn: json['KMSKeyArn'] as String,
  );
}

Map<String, dynamic> _$S3ConfigToJson(S3Config instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Path', instance.path);
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('KMSKeyArn', instance.kMSKeyArn);
  return val;
}

Schema _$SchemaFromJson(Map<String, dynamic> json) {
  return Schema(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : SchemaAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SchemaToJson(Schema instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Attributes', instance.attributes?.map((e) => e?.toJson())?.toList());
  return val;
}

SchemaAttribute _$SchemaAttributeFromJson(Map<String, dynamic> json) {
  return SchemaAttribute(
    attributeName: json['AttributeName'] as String,
    attributeType:
        _$enumDecodeNullable(_$AttributeTypeEnumMap, json['AttributeType']),
  );
}

Map<String, dynamic> _$SchemaAttributeToJson(SchemaAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('AttributeType', _$AttributeTypeEnumMap[instance.attributeType]);
  return val;
}

const _$AttributeTypeEnumMap = {
  AttributeType.string: 'string',
  AttributeType.integer: 'integer',
  AttributeType.float: 'float',
  AttributeType.timestamp: 'timestamp',
};

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return Statistics(
    avg: (json['Avg'] as num)?.toDouble(),
    count: json['Count'] as int,
    countDistinct: json['CountDistinct'] as int,
    countNan: json['CountNan'] as int,
    countNull: json['CountNull'] as int,
    max: json['Max'] as String,
    min: json['Min'] as String,
    stddev: (json['Stddev'] as num)?.toDouble(),
  );
}

SupplementaryFeature _$SupplementaryFeatureFromJson(Map<String, dynamic> json) {
  return SupplementaryFeature(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$SupplementaryFeatureToJson(
    SupplementaryFeature instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

TestWindowSummary _$TestWindowSummaryFromJson(Map<String, dynamic> json) {
  return TestWindowSummary(
    message: json['Message'] as String,
    status: json['Status'] as String,
    testWindowEnd: unixFromJson(json['TestWindowEnd']),
    testWindowStart: unixFromJson(json['TestWindowStart']),
  );
}

UpdateDatasetGroupResponse _$UpdateDatasetGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDatasetGroupResponse();
}

WeightedQuantileLoss _$WeightedQuantileLossFromJson(Map<String, dynamic> json) {
  return WeightedQuantileLoss(
    lossValue: (json['LossValue'] as num)?.toDouble(),
    quantile: (json['Quantile'] as num)?.toDouble(),
  );
}

WindowSummary _$WindowSummaryFromJson(Map<String, dynamic> json) {
  return WindowSummary(
    evaluationType:
        _$enumDecodeNullable(_$EvaluationTypeEnumMap, json['EvaluationType']),
    itemCount: json['ItemCount'] as int,
    metrics: json['Metrics'] == null
        ? null
        : Metrics.fromJson(json['Metrics'] as Map<String, dynamic>),
    testWindowEnd: unixFromJson(json['TestWindowEnd']),
    testWindowStart: unixFromJson(json['TestWindowStart']),
  );
}

const _$EvaluationTypeEnumMap = {
  EvaluationType.summary: 'SUMMARY',
  EvaluationType.computed: 'COMPUTED',
};
