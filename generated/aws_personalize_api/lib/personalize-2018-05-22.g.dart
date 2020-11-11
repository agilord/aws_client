// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalize-2018-05-22.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Algorithm _$AlgorithmFromJson(Map<String, dynamic> json) {
  return Algorithm(
    algorithmArn: json['algorithmArn'] as String,
    algorithmImage: json['algorithmImage'] == null
        ? null
        : AlgorithmImage.fromJson(
            json['algorithmImage'] as Map<String, dynamic>),
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    defaultHyperParameterRanges: json['defaultHyperParameterRanges'] == null
        ? null
        : DefaultHyperParameterRanges.fromJson(
            json['defaultHyperParameterRanges'] as Map<String, dynamic>),
    defaultHyperParameters:
        (json['defaultHyperParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    defaultResourceConfig:
        (json['defaultResourceConfig'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    roleArn: json['roleArn'] as String,
    trainingInputMode: json['trainingInputMode'] as String,
  );
}

AlgorithmImage _$AlgorithmImageFromJson(Map<String, dynamic> json) {
  return AlgorithmImage(
    dockerURI: json['dockerURI'] as String,
    name: json['name'] as String,
  );
}

AutoMLConfig _$AutoMLConfigFromJson(Map<String, dynamic> json) {
  return AutoMLConfig(
    metricName: json['metricName'] as String,
    recipeList: (json['recipeList'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AutoMLConfigToJson(AutoMLConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metricName', instance.metricName);
  writeNotNull('recipeList', instance.recipeList);
  return val;
}

AutoMLResult _$AutoMLResultFromJson(Map<String, dynamic> json) {
  return AutoMLResult(
    bestRecipeArn: json['bestRecipeArn'] as String,
  );
}

BatchInferenceJob _$BatchInferenceJobFromJson(Map<String, dynamic> json) {
  return BatchInferenceJob(
    batchInferenceJobArn: json['batchInferenceJobArn'] as String,
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    failureReason: json['failureReason'] as String,
    jobInput: json['jobInput'] == null
        ? null
        : BatchInferenceJobInput.fromJson(
            json['jobInput'] as Map<String, dynamic>),
    jobName: json['jobName'] as String,
    jobOutput: json['jobOutput'] == null
        ? null
        : BatchInferenceJobOutput.fromJson(
            json['jobOutput'] as Map<String, dynamic>),
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    numResults: json['numResults'] as int,
    roleArn: json['roleArn'] as String,
    solutionVersionArn: json['solutionVersionArn'] as String,
    status: json['status'] as String,
  );
}

BatchInferenceJobInput _$BatchInferenceJobInputFromJson(
    Map<String, dynamic> json) {
  return BatchInferenceJobInput(
    s3DataSource: json['s3DataSource'] == null
        ? null
        : S3DataConfig.fromJson(json['s3DataSource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BatchInferenceJobInputToJson(
    BatchInferenceJobInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3DataSource', instance.s3DataSource?.toJson());
  return val;
}

BatchInferenceJobOutput _$BatchInferenceJobOutputFromJson(
    Map<String, dynamic> json) {
  return BatchInferenceJobOutput(
    s3DataDestination: json['s3DataDestination'] == null
        ? null
        : S3DataConfig.fromJson(
            json['s3DataDestination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BatchInferenceJobOutputToJson(
    BatchInferenceJobOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3DataDestination', instance.s3DataDestination?.toJson());
  return val;
}

BatchInferenceJobSummary _$BatchInferenceJobSummaryFromJson(
    Map<String, dynamic> json) {
  return BatchInferenceJobSummary(
    batchInferenceJobArn: json['batchInferenceJobArn'] as String,
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    failureReason: json['failureReason'] as String,
    jobName: json['jobName'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    solutionVersionArn: json['solutionVersionArn'] as String,
    status: json['status'] as String,
  );
}

Campaign _$CampaignFromJson(Map<String, dynamic> json) {
  return Campaign(
    campaignArn: json['campaignArn'] as String,
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    failureReason: json['failureReason'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    latestCampaignUpdate: json['latestCampaignUpdate'] == null
        ? null
        : CampaignUpdateSummary.fromJson(
            json['latestCampaignUpdate'] as Map<String, dynamic>),
    minProvisionedTPS: json['minProvisionedTPS'] as int,
    name: json['name'] as String,
    solutionVersionArn: json['solutionVersionArn'] as String,
    status: json['status'] as String,
  );
}

CampaignSummary _$CampaignSummaryFromJson(Map<String, dynamic> json) {
  return CampaignSummary(
    campaignArn: json['campaignArn'] as String,
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    failureReason: json['failureReason'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    status: json['status'] as String,
  );
}

CampaignUpdateSummary _$CampaignUpdateSummaryFromJson(
    Map<String, dynamic> json) {
  return CampaignUpdateSummary(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    failureReason: json['failureReason'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    minProvisionedTPS: json['minProvisionedTPS'] as int,
    solutionVersionArn: json['solutionVersionArn'] as String,
    status: json['status'] as String,
  );
}

CategoricalHyperParameterRange _$CategoricalHyperParameterRangeFromJson(
    Map<String, dynamic> json) {
  return CategoricalHyperParameterRange(
    name: json['name'] as String,
    values: (json['values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CategoricalHyperParameterRangeToJson(
    CategoricalHyperParameterRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('values', instance.values);
  return val;
}

ContinuousHyperParameterRange _$ContinuousHyperParameterRangeFromJson(
    Map<String, dynamic> json) {
  return ContinuousHyperParameterRange(
    maxValue: (json['maxValue'] as num)?.toDouble(),
    minValue: (json['minValue'] as num)?.toDouble(),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ContinuousHyperParameterRangeToJson(
    ContinuousHyperParameterRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxValue', instance.maxValue);
  writeNotNull('minValue', instance.minValue);
  writeNotNull('name', instance.name);
  return val;
}

Map<String, dynamic> _$CreateBatchInferenceJobRequestToJson(
    CreateBatchInferenceJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jobInput', instance.jobInput?.toJson());
  writeNotNull('jobName', instance.jobName);
  writeNotNull('jobOutput', instance.jobOutput?.toJson());
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('solutionVersionArn', instance.solutionVersionArn);
  writeNotNull('numResults', instance.numResults);
  return val;
}

CreateBatchInferenceJobResponse _$CreateBatchInferenceJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateBatchInferenceJobResponse(
    batchInferenceJobArn: json['batchInferenceJobArn'] as String,
  );
}

Map<String, dynamic> _$CreateCampaignRequestToJson(
    CreateCampaignRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('minProvisionedTPS', instance.minProvisionedTPS);
  writeNotNull('name', instance.name);
  writeNotNull('solutionVersionArn', instance.solutionVersionArn);
  return val;
}

CreateCampaignResponse _$CreateCampaignResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCampaignResponse(
    campaignArn: json['campaignArn'] as String,
  );
}

Map<String, dynamic> _$CreateDatasetGroupRequestToJson(
    CreateDatasetGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('kmsKeyArn', instance.kmsKeyArn);
  writeNotNull('roleArn', instance.roleArn);
  return val;
}

CreateDatasetGroupResponse _$CreateDatasetGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatasetGroupResponse(
    datasetGroupArn: json['datasetGroupArn'] as String,
  );
}

Map<String, dynamic> _$CreateDatasetImportJobRequestToJson(
    CreateDatasetImportJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataSource', instance.dataSource?.toJson());
  writeNotNull('datasetArn', instance.datasetArn);
  writeNotNull('jobName', instance.jobName);
  writeNotNull('roleArn', instance.roleArn);
  return val;
}

CreateDatasetImportJobResponse _$CreateDatasetImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatasetImportJobResponse(
    datasetImportJobArn: json['datasetImportJobArn'] as String,
  );
}

Map<String, dynamic> _$CreateDatasetRequestToJson(
    CreateDatasetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetGroupArn', instance.datasetGroupArn);
  writeNotNull('datasetType', instance.datasetType);
  writeNotNull('name', instance.name);
  writeNotNull('schemaArn', instance.schemaArn);
  return val;
}

CreateDatasetResponse _$CreateDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatasetResponse(
    datasetArn: json['datasetArn'] as String,
  );
}

Map<String, dynamic> _$CreateEventTrackerRequestToJson(
    CreateEventTrackerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetGroupArn', instance.datasetGroupArn);
  writeNotNull('name', instance.name);
  return val;
}

CreateEventTrackerResponse _$CreateEventTrackerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEventTrackerResponse(
    eventTrackerArn: json['eventTrackerArn'] as String,
    trackingId: json['trackingId'] as String,
  );
}

Map<String, dynamic> _$CreateSchemaRequestToJson(CreateSchemaRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('schema', instance.schema);
  return val;
}

CreateSchemaResponse _$CreateSchemaResponseFromJson(Map<String, dynamic> json) {
  return CreateSchemaResponse(
    schemaArn: json['schemaArn'] as String,
  );
}

Map<String, dynamic> _$CreateSolutionRequestToJson(
    CreateSolutionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetGroupArn', instance.datasetGroupArn);
  writeNotNull('name', instance.name);
  writeNotNull('eventType', instance.eventType);
  writeNotNull('performAutoML', instance.performAutoML);
  writeNotNull('performHPO', instance.performHPO);
  writeNotNull('recipeArn', instance.recipeArn);
  writeNotNull('solutionConfig', instance.solutionConfig?.toJson());
  return val;
}

CreateSolutionResponse _$CreateSolutionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSolutionResponse(
    solutionArn: json['solutionArn'] as String,
  );
}

Map<String, dynamic> _$CreateSolutionVersionRequestToJson(
    CreateSolutionVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('solutionArn', instance.solutionArn);
  writeNotNull('trainingMode', _$TrainingModeEnumMap[instance.trainingMode]);
  return val;
}

const _$TrainingModeEnumMap = {
  TrainingMode.full: 'FULL',
  TrainingMode.update: 'UPDATE',
};

CreateSolutionVersionResponse _$CreateSolutionVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSolutionVersionResponse(
    solutionVersionArn: json['solutionVersionArn'] as String,
  );
}

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return DataSource(
    dataLocation: json['dataLocation'] as String,
  );
}

Map<String, dynamic> _$DataSourceToJson(DataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataLocation', instance.dataLocation);
  return val;
}

Dataset _$DatasetFromJson(Map<String, dynamic> json) {
  return Dataset(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    datasetArn: json['datasetArn'] as String,
    datasetGroupArn: json['datasetGroupArn'] as String,
    datasetType: json['datasetType'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    schemaArn: json['schemaArn'] as String,
    status: json['status'] as String,
  );
}

DatasetGroup _$DatasetGroupFromJson(Map<String, dynamic> json) {
  return DatasetGroup(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    datasetGroupArn: json['datasetGroupArn'] as String,
    failureReason: json['failureReason'] as String,
    kmsKeyArn: json['kmsKeyArn'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    roleArn: json['roleArn'] as String,
    status: json['status'] as String,
  );
}

DatasetGroupSummary _$DatasetGroupSummaryFromJson(Map<String, dynamic> json) {
  return DatasetGroupSummary(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    datasetGroupArn: json['datasetGroupArn'] as String,
    failureReason: json['failureReason'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    status: json['status'] as String,
  );
}

DatasetImportJob _$DatasetImportJobFromJson(Map<String, dynamic> json) {
  return DatasetImportJob(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    dataSource: json['dataSource'] == null
        ? null
        : DataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
    datasetArn: json['datasetArn'] as String,
    datasetImportJobArn: json['datasetImportJobArn'] as String,
    failureReason: json['failureReason'] as String,
    jobName: json['jobName'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    roleArn: json['roleArn'] as String,
    status: json['status'] as String,
  );
}

DatasetImportJobSummary _$DatasetImportJobSummaryFromJson(
    Map<String, dynamic> json) {
  return DatasetImportJobSummary(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    datasetImportJobArn: json['datasetImportJobArn'] as String,
    failureReason: json['failureReason'] as String,
    jobName: json['jobName'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    status: json['status'] as String,
  );
}

DatasetSchema _$DatasetSchemaFromJson(Map<String, dynamic> json) {
  return DatasetSchema(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    schema: json['schema'] as String,
    schemaArn: json['schemaArn'] as String,
  );
}

DatasetSchemaSummary _$DatasetSchemaSummaryFromJson(Map<String, dynamic> json) {
  return DatasetSchemaSummary(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    schemaArn: json['schemaArn'] as String,
  );
}

DatasetSummary _$DatasetSummaryFromJson(Map<String, dynamic> json) {
  return DatasetSummary(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    datasetArn: json['datasetArn'] as String,
    datasetType: json['datasetType'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    status: json['status'] as String,
  );
}

DefaultCategoricalHyperParameterRange
    _$DefaultCategoricalHyperParameterRangeFromJson(Map<String, dynamic> json) {
  return DefaultCategoricalHyperParameterRange(
    isTunable: json['isTunable'] as bool,
    name: json['name'] as String,
    values: (json['values'] as List)?.map((e) => e as String)?.toList(),
  );
}

DefaultContinuousHyperParameterRange
    _$DefaultContinuousHyperParameterRangeFromJson(Map<String, dynamic> json) {
  return DefaultContinuousHyperParameterRange(
    isTunable: json['isTunable'] as bool,
    maxValue: (json['maxValue'] as num)?.toDouble(),
    minValue: (json['minValue'] as num)?.toDouble(),
    name: json['name'] as String,
  );
}

DefaultHyperParameterRanges _$DefaultHyperParameterRangesFromJson(
    Map<String, dynamic> json) {
  return DefaultHyperParameterRanges(
    categoricalHyperParameterRanges:
        (json['categoricalHyperParameterRanges'] as List)
            ?.map((e) => e == null
                ? null
                : DefaultCategoricalHyperParameterRange.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    continuousHyperParameterRanges:
        (json['continuousHyperParameterRanges'] as List)
            ?.map((e) => e == null
                ? null
                : DefaultContinuousHyperParameterRange.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    integerHyperParameterRanges: (json['integerHyperParameterRanges'] as List)
        ?.map((e) => e == null
            ? null
            : DefaultIntegerHyperParameterRange.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

DefaultIntegerHyperParameterRange _$DefaultIntegerHyperParameterRangeFromJson(
    Map<String, dynamic> json) {
  return DefaultIntegerHyperParameterRange(
    isTunable: json['isTunable'] as bool,
    maxValue: json['maxValue'] as int,
    minValue: json['minValue'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$DeleteCampaignRequestToJson(
    DeleteCampaignRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('campaignArn', instance.campaignArn);
  return val;
}

Map<String, dynamic> _$DeleteDatasetGroupRequestToJson(
    DeleteDatasetGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetGroupArn', instance.datasetGroupArn);
  return val;
}

Map<String, dynamic> _$DeleteDatasetRequestToJson(
    DeleteDatasetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetArn', instance.datasetArn);
  return val;
}

Map<String, dynamic> _$DeleteEventTrackerRequestToJson(
    DeleteEventTrackerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventTrackerArn', instance.eventTrackerArn);
  return val;
}

Map<String, dynamic> _$DeleteSchemaRequestToJson(DeleteSchemaRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('schemaArn', instance.schemaArn);
  return val;
}

Map<String, dynamic> _$DeleteSolutionRequestToJson(
    DeleteSolutionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('solutionArn', instance.solutionArn);
  return val;
}

Map<String, dynamic> _$DescribeAlgorithmRequestToJson(
    DescribeAlgorithmRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('algorithmArn', instance.algorithmArn);
  return val;
}

DescribeAlgorithmResponse _$DescribeAlgorithmResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAlgorithmResponse(
    algorithm: json['algorithm'] == null
        ? null
        : Algorithm.fromJson(json['algorithm'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeBatchInferenceJobRequestToJson(
    DescribeBatchInferenceJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('batchInferenceJobArn', instance.batchInferenceJobArn);
  return val;
}

DescribeBatchInferenceJobResponse _$DescribeBatchInferenceJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeBatchInferenceJobResponse(
    batchInferenceJob: json['batchInferenceJob'] == null
        ? null
        : BatchInferenceJob.fromJson(
            json['batchInferenceJob'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeCampaignRequestToJson(
    DescribeCampaignRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('campaignArn', instance.campaignArn);
  return val;
}

DescribeCampaignResponse _$DescribeCampaignResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCampaignResponse(
    campaign: json['campaign'] == null
        ? null
        : Campaign.fromJson(json['campaign'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeDatasetGroupRequestToJson(
    DescribeDatasetGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetGroupArn', instance.datasetGroupArn);
  return val;
}

DescribeDatasetGroupResponse _$DescribeDatasetGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatasetGroupResponse(
    datasetGroup: json['datasetGroup'] == null
        ? null
        : DatasetGroup.fromJson(json['datasetGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeDatasetImportJobRequestToJson(
    DescribeDatasetImportJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetImportJobArn', instance.datasetImportJobArn);
  return val;
}

DescribeDatasetImportJobResponse _$DescribeDatasetImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatasetImportJobResponse(
    datasetImportJob: json['datasetImportJob'] == null
        ? null
        : DatasetImportJob.fromJson(
            json['datasetImportJob'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeDatasetRequestToJson(
    DescribeDatasetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetArn', instance.datasetArn);
  return val;
}

DescribeDatasetResponse _$DescribeDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatasetResponse(
    dataset: json['dataset'] == null
        ? null
        : Dataset.fromJson(json['dataset'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeEventTrackerRequestToJson(
    DescribeEventTrackerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventTrackerArn', instance.eventTrackerArn);
  return val;
}

DescribeEventTrackerResponse _$DescribeEventTrackerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventTrackerResponse(
    eventTracker: json['eventTracker'] == null
        ? null
        : EventTracker.fromJson(json['eventTracker'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeFeatureTransformationRequestToJson(
    DescribeFeatureTransformationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('featureTransformationArn', instance.featureTransformationArn);
  return val;
}

DescribeFeatureTransformationResponse
    _$DescribeFeatureTransformationResponseFromJson(Map<String, dynamic> json) {
  return DescribeFeatureTransformationResponse(
    featureTransformation: json['featureTransformation'] == null
        ? null
        : FeatureTransformation.fromJson(
            json['featureTransformation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeRecipeRequestToJson(
    DescribeRecipeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('recipeArn', instance.recipeArn);
  return val;
}

DescribeRecipeResponse _$DescribeRecipeResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRecipeResponse(
    recipe: json['recipe'] == null
        ? null
        : Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeSchemaRequestToJson(
    DescribeSchemaRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('schemaArn', instance.schemaArn);
  return val;
}

DescribeSchemaResponse _$DescribeSchemaResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSchemaResponse(
    schema: json['schema'] == null
        ? null
        : DatasetSchema.fromJson(json['schema'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeSolutionRequestToJson(
    DescribeSolutionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('solutionArn', instance.solutionArn);
  return val;
}

DescribeSolutionResponse _$DescribeSolutionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSolutionResponse(
    solution: json['solution'] == null
        ? null
        : Solution.fromJson(json['solution'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeSolutionVersionRequestToJson(
    DescribeSolutionVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('solutionVersionArn', instance.solutionVersionArn);
  return val;
}

DescribeSolutionVersionResponse _$DescribeSolutionVersionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSolutionVersionResponse(
    solutionVersion: json['solutionVersion'] == null
        ? null
        : SolutionVersion.fromJson(
            json['solutionVersion'] as Map<String, dynamic>),
  );
}

EventTracker _$EventTrackerFromJson(Map<String, dynamic> json) {
  return EventTracker(
    accountId: json['accountId'] as String,
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    datasetGroupArn: json['datasetGroupArn'] as String,
    eventTrackerArn: json['eventTrackerArn'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    status: json['status'] as String,
    trackingId: json['trackingId'] as String,
  );
}

EventTrackerSummary _$EventTrackerSummaryFromJson(Map<String, dynamic> json) {
  return EventTrackerSummary(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    eventTrackerArn: json['eventTrackerArn'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    status: json['status'] as String,
  );
}

FeatureTransformation _$FeatureTransformationFromJson(
    Map<String, dynamic> json) {
  return FeatureTransformation(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    defaultParameters: (json['defaultParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    featureTransformationArn: json['featureTransformationArn'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$GetSolutionMetricsRequestToJson(
    GetSolutionMetricsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('solutionVersionArn', instance.solutionVersionArn);
  return val;
}

GetSolutionMetricsResponse _$GetSolutionMetricsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSolutionMetricsResponse(
    metrics: (json['metrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
    solutionVersionArn: json['solutionVersionArn'] as String,
  );
}

HPOConfig _$HPOConfigFromJson(Map<String, dynamic> json) {
  return HPOConfig(
    algorithmHyperParameterRanges: json['algorithmHyperParameterRanges'] == null
        ? null
        : HyperParameterRanges.fromJson(
            json['algorithmHyperParameterRanges'] as Map<String, dynamic>),
    hpoObjective: json['hpoObjective'] == null
        ? null
        : HPOObjective.fromJson(json['hpoObjective'] as Map<String, dynamic>),
    hpoResourceConfig: json['hpoResourceConfig'] == null
        ? null
        : HPOResourceConfig.fromJson(
            json['hpoResourceConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HPOConfigToJson(HPOConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('algorithmHyperParameterRanges',
      instance.algorithmHyperParameterRanges?.toJson());
  writeNotNull('hpoObjective', instance.hpoObjective?.toJson());
  writeNotNull('hpoResourceConfig', instance.hpoResourceConfig?.toJson());
  return val;
}

HPOObjective _$HPOObjectiveFromJson(Map<String, dynamic> json) {
  return HPOObjective(
    metricName: json['metricName'] as String,
    metricRegex: json['metricRegex'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$HPOObjectiveToJson(HPOObjective instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metricName', instance.metricName);
  writeNotNull('metricRegex', instance.metricRegex);
  writeNotNull('type', instance.type);
  return val;
}

HPOResourceConfig _$HPOResourceConfigFromJson(Map<String, dynamic> json) {
  return HPOResourceConfig(
    maxNumberOfTrainingJobs: json['maxNumberOfTrainingJobs'] as String,
    maxParallelTrainingJobs: json['maxParallelTrainingJobs'] as String,
  );
}

Map<String, dynamic> _$HPOResourceConfigToJson(HPOResourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxNumberOfTrainingJobs', instance.maxNumberOfTrainingJobs);
  writeNotNull('maxParallelTrainingJobs', instance.maxParallelTrainingJobs);
  return val;
}

HyperParameterRanges _$HyperParameterRangesFromJson(Map<String, dynamic> json) {
  return HyperParameterRanges(
    categoricalHyperParameterRanges:
        (json['categoricalHyperParameterRanges'] as List)
            ?.map((e) => e == null
                ? null
                : CategoricalHyperParameterRange.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    continuousHyperParameterRanges: (json['continuousHyperParameterRanges']
            as List)
        ?.map((e) => e == null
            ? null
            : ContinuousHyperParameterRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    integerHyperParameterRanges: (json['integerHyperParameterRanges'] as List)
        ?.map((e) => e == null
            ? null
            : IntegerHyperParameterRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HyperParameterRangesToJson(
    HyperParameterRanges instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'categoricalHyperParameterRanges',
      instance.categoricalHyperParameterRanges
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'continuousHyperParameterRanges',
      instance.continuousHyperParameterRanges
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('integerHyperParameterRanges',
      instance.integerHyperParameterRanges?.map((e) => e?.toJson())?.toList());
  return val;
}

IntegerHyperParameterRange _$IntegerHyperParameterRangeFromJson(
    Map<String, dynamic> json) {
  return IntegerHyperParameterRange(
    maxValue: json['maxValue'] as int,
    minValue: json['minValue'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$IntegerHyperParameterRangeToJson(
    IntegerHyperParameterRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxValue', instance.maxValue);
  writeNotNull('minValue', instance.minValue);
  writeNotNull('name', instance.name);
  return val;
}

Map<String, dynamic> _$ListBatchInferenceJobsRequestToJson(
    ListBatchInferenceJobsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('solutionVersionArn', instance.solutionVersionArn);
  return val;
}

ListBatchInferenceJobsResponse _$ListBatchInferenceJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListBatchInferenceJobsResponse(
    batchInferenceJobs: (json['batchInferenceJobs'] as List)
        ?.map((e) => e == null
            ? null
            : BatchInferenceJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$ListCampaignsRequestToJson(
    ListCampaignsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('solutionArn', instance.solutionArn);
  return val;
}

ListCampaignsResponse _$ListCampaignsResponseFromJson(
    Map<String, dynamic> json) {
  return ListCampaignsResponse(
    campaigns: (json['campaigns'] as List)
        ?.map((e) => e == null
            ? null
            : CampaignSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$ListDatasetGroupsRequestToJson(
    ListDatasetGroupsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

ListDatasetGroupsResponse _$ListDatasetGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDatasetGroupsResponse(
    datasetGroups: (json['datasetGroups'] as List)
        ?.map((e) => e == null
            ? null
            : DatasetGroupSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$ListDatasetImportJobsRequestToJson(
    ListDatasetImportJobsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetArn', instance.datasetArn);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

ListDatasetImportJobsResponse _$ListDatasetImportJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDatasetImportJobsResponse(
    datasetImportJobs: (json['datasetImportJobs'] as List)
        ?.map((e) => e == null
            ? null
            : DatasetImportJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$ListDatasetsRequestToJson(ListDatasetsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetGroupArn', instance.datasetGroupArn);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

ListDatasetsResponse _$ListDatasetsResponseFromJson(Map<String, dynamic> json) {
  return ListDatasetsResponse(
    datasets: (json['datasets'] as List)
        ?.map((e) => e == null
            ? null
            : DatasetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$ListEventTrackersRequestToJson(
    ListEventTrackersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetGroupArn', instance.datasetGroupArn);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

ListEventTrackersResponse _$ListEventTrackersResponseFromJson(
    Map<String, dynamic> json) {
  return ListEventTrackersResponse(
    eventTrackers: (json['eventTrackers'] as List)
        ?.map((e) => e == null
            ? null
            : EventTrackerSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$ListRecipesRequestToJson(ListRecipesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull(
      'recipeProvider', _$RecipeProviderEnumMap[instance.recipeProvider]);
  return val;
}

const _$RecipeProviderEnumMap = {
  RecipeProvider.service: 'SERVICE',
};

ListRecipesResponse _$ListRecipesResponseFromJson(Map<String, dynamic> json) {
  return ListRecipesResponse(
    nextToken: json['nextToken'] as String,
    recipes: (json['recipes'] as List)
        ?.map((e) => e == null
            ? null
            : RecipeSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListSchemasRequestToJson(ListSchemasRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

ListSchemasResponse _$ListSchemasResponseFromJson(Map<String, dynamic> json) {
  return ListSchemasResponse(
    nextToken: json['nextToken'] as String,
    schemas: (json['schemas'] as List)
        ?.map((e) => e == null
            ? null
            : DatasetSchemaSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListSolutionVersionsRequestToJson(
    ListSolutionVersionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('solutionArn', instance.solutionArn);
  return val;
}

ListSolutionVersionsResponse _$ListSolutionVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSolutionVersionsResponse(
    nextToken: json['nextToken'] as String,
    solutionVersions: (json['solutionVersions'] as List)
        ?.map((e) => e == null
            ? null
            : SolutionVersionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListSolutionsRequestToJson(
    ListSolutionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datasetGroupArn', instance.datasetGroupArn);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

ListSolutionsResponse _$ListSolutionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSolutionsResponse(
    nextToken: json['nextToken'] as String,
    solutions: (json['solutions'] as List)
        ?.map((e) => e == null
            ? null
            : SolutionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    algorithmArn: json['algorithmArn'] as String,
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    description: json['description'] as String,
    featureTransformationArn: json['featureTransformationArn'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    recipeArn: json['recipeArn'] as String,
    recipeType: json['recipeType'] as String,
    status: json['status'] as String,
  );
}

RecipeSummary _$RecipeSummaryFromJson(Map<String, dynamic> json) {
  return RecipeSummary(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    recipeArn: json['recipeArn'] as String,
    status: json['status'] as String,
  );
}

S3DataConfig _$S3DataConfigFromJson(Map<String, dynamic> json) {
  return S3DataConfig(
    path: json['path'] as String,
    kmsKeyArn: json['kmsKeyArn'] as String,
  );
}

Map<String, dynamic> _$S3DataConfigToJson(S3DataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('path', instance.path);
  writeNotNull('kmsKeyArn', instance.kmsKeyArn);
  return val;
}

Solution _$SolutionFromJson(Map<String, dynamic> json) {
  return Solution(
    autoMLResult: json['autoMLResult'] == null
        ? null
        : AutoMLResult.fromJson(json['autoMLResult'] as Map<String, dynamic>),
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    datasetGroupArn: json['datasetGroupArn'] as String,
    eventType: json['eventType'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    latestSolutionVersion: json['latestSolutionVersion'] == null
        ? null
        : SolutionVersionSummary.fromJson(
            json['latestSolutionVersion'] as Map<String, dynamic>),
    name: json['name'] as String,
    performAutoML: json['performAutoML'] as bool,
    performHPO: json['performHPO'] as bool,
    recipeArn: json['recipeArn'] as String,
    solutionArn: json['solutionArn'] as String,
    solutionConfig: json['solutionConfig'] == null
        ? null
        : SolutionConfig.fromJson(
            json['solutionConfig'] as Map<String, dynamic>),
    status: json['status'] as String,
  );
}

SolutionConfig _$SolutionConfigFromJson(Map<String, dynamic> json) {
  return SolutionConfig(
    algorithmHyperParameters:
        (json['algorithmHyperParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    autoMLConfig: json['autoMLConfig'] == null
        ? null
        : AutoMLConfig.fromJson(json['autoMLConfig'] as Map<String, dynamic>),
    eventValueThreshold: json['eventValueThreshold'] as String,
    featureTransformationParameters:
        (json['featureTransformationParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    hpoConfig: json['hpoConfig'] == null
        ? null
        : HPOConfig.fromJson(json['hpoConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SolutionConfigToJson(SolutionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('algorithmHyperParameters', instance.algorithmHyperParameters);
  writeNotNull('autoMLConfig', instance.autoMLConfig?.toJson());
  writeNotNull('eventValueThreshold', instance.eventValueThreshold);
  writeNotNull('featureTransformationParameters',
      instance.featureTransformationParameters);
  writeNotNull('hpoConfig', instance.hpoConfig?.toJson());
  return val;
}

SolutionSummary _$SolutionSummaryFromJson(Map<String, dynamic> json) {
  return SolutionSummary(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    name: json['name'] as String,
    solutionArn: json['solutionArn'] as String,
    status: json['status'] as String,
  );
}

SolutionVersion _$SolutionVersionFromJson(Map<String, dynamic> json) {
  return SolutionVersion(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    datasetGroupArn: json['datasetGroupArn'] as String,
    eventType: json['eventType'] as String,
    failureReason: json['failureReason'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    performAutoML: json['performAutoML'] as bool,
    performHPO: json['performHPO'] as bool,
    recipeArn: json['recipeArn'] as String,
    solutionArn: json['solutionArn'] as String,
    solutionConfig: json['solutionConfig'] == null
        ? null
        : SolutionConfig.fromJson(
            json['solutionConfig'] as Map<String, dynamic>),
    solutionVersionArn: json['solutionVersionArn'] as String,
    status: json['status'] as String,
    trainingHours: (json['trainingHours'] as num)?.toDouble(),
    trainingMode:
        _$enumDecodeNullable(_$TrainingModeEnumMap, json['trainingMode']),
    tunedHPOParams: json['tunedHPOParams'] == null
        ? null
        : TunedHPOParams.fromJson(
            json['tunedHPOParams'] as Map<String, dynamic>),
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

SolutionVersionSummary _$SolutionVersionSummaryFromJson(
    Map<String, dynamic> json) {
  return SolutionVersionSummary(
    creationDateTime: unixTimestampFromJson(json['creationDateTime']),
    failureReason: json['failureReason'] as String,
    lastUpdatedDateTime: unixTimestampFromJson(json['lastUpdatedDateTime']),
    solutionVersionArn: json['solutionVersionArn'] as String,
    status: json['status'] as String,
  );
}

TunedHPOParams _$TunedHPOParamsFromJson(Map<String, dynamic> json) {
  return TunedHPOParams(
    algorithmHyperParameters:
        (json['algorithmHyperParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$UpdateCampaignRequestToJson(
    UpdateCampaignRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('campaignArn', instance.campaignArn);
  writeNotNull('minProvisionedTPS', instance.minProvisionedTPS);
  writeNotNull('solutionVersionArn', instance.solutionVersionArn);
  return val;
}

UpdateCampaignResponse _$UpdateCampaignResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateCampaignResponse(
    campaignArn: json['campaignArn'] as String,
  );
}
