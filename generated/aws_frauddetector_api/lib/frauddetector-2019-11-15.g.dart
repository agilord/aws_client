// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frauddetector-2019-11-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchCreateVariableError _$BatchCreateVariableErrorFromJson(
    Map<String, dynamic> json) {
  return BatchCreateVariableError(
    code: json['code'] as int,
    message: json['message'] as String,
    name: json['name'] as String,
  );
}

BatchCreateVariableResult _$BatchCreateVariableResultFromJson(
    Map<String, dynamic> json) {
  return BatchCreateVariableResult(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchCreateVariableError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetVariableError _$BatchGetVariableErrorFromJson(
    Map<String, dynamic> json) {
  return BatchGetVariableError(
    code: json['code'] as int,
    message: json['message'] as String,
    name: json['name'] as String,
  );
}

BatchGetVariableResult _$BatchGetVariableResultFromJson(
    Map<String, dynamic> json) {
  return BatchGetVariableResult(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchGetVariableError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    variables: (json['variables'] as List)
        ?.map((e) =>
            e == null ? null : Variable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateDetectorVersionResult _$CreateDetectorVersionResultFromJson(
    Map<String, dynamic> json) {
  return CreateDetectorVersionResult(
    detectorId: json['detectorId'] as String,
    detectorVersionId: json['detectorVersionId'] as String,
    status:
        _$enumDecodeNullable(_$DetectorVersionStatusEnumMap, json['status']),
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

const _$DetectorVersionStatusEnumMap = {
  DetectorVersionStatus.draft: 'DRAFT',
  DetectorVersionStatus.active: 'ACTIVE',
  DetectorVersionStatus.inactive: 'INACTIVE',
};

CreateModelVersionResult _$CreateModelVersionResultFromJson(
    Map<String, dynamic> json) {
  return CreateModelVersionResult(
    modelId: json['modelId'] as String,
    modelType: _$enumDecodeNullable(_$ModelTypeEnumEnumMap, json['modelType']),
    modelVersionNumber: json['modelVersionNumber'] as String,
    status: json['status'] as String,
  );
}

const _$ModelTypeEnumEnumMap = {
  ModelTypeEnum.onlineFraudInsights: 'ONLINE_FRAUD_INSIGHTS',
};

CreateRuleResult _$CreateRuleResultFromJson(Map<String, dynamic> json) {
  return CreateRuleResult(
    rule: json['rule'] == null
        ? null
        : Rule.fromJson(json['rule'] as Map<String, dynamic>),
  );
}

CreateVariableResult _$CreateVariableResultFromJson(Map<String, dynamic> json) {
  return CreateVariableResult();
}

DeleteDetectorResult _$DeleteDetectorResultFromJson(Map<String, dynamic> json) {
  return DeleteDetectorResult();
}

DeleteDetectorVersionResult _$DeleteDetectorVersionResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDetectorVersionResult();
}

DeleteEventResult _$DeleteEventResultFromJson(Map<String, dynamic> json) {
  return DeleteEventResult();
}

DeleteRuleVersionResult _$DeleteRuleVersionResultFromJson(
    Map<String, dynamic> json) {
  return DeleteRuleVersionResult();
}

DescribeDetectorResult _$DescribeDetectorResultFromJson(
    Map<String, dynamic> json) {
  return DescribeDetectorResult(
    detectorId: json['detectorId'] as String,
    detectorVersionSummaries: (json['detectorVersionSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : DetectorVersionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeModelVersionsResult _$DescribeModelVersionsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeModelVersionsResult(
    modelVersionDetails: (json['modelVersionDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ModelVersionDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Detector _$DetectorFromJson(Map<String, dynamic> json) {
  return Detector(
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    detectorId: json['detectorId'] as String,
    lastUpdatedTime: json['lastUpdatedTime'] as String,
  );
}

DetectorVersionSummary _$DetectorVersionSummaryFromJson(
    Map<String, dynamic> json) {
  return DetectorVersionSummary(
    description: json['description'] as String,
    detectorVersionId: json['detectorVersionId'] as String,
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    status:
        _$enumDecodeNullable(_$DetectorVersionStatusEnumMap, json['status']),
  );
}

ExternalModel _$ExternalModelFromJson(Map<String, dynamic> json) {
  return ExternalModel(
    createdTime: json['createdTime'] as String,
    inputConfiguration: json['inputConfiguration'] == null
        ? null
        : ModelInputConfiguration.fromJson(
            json['inputConfiguration'] as Map<String, dynamic>),
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    modelEndpoint: json['modelEndpoint'] as String,
    modelEndpointStatus: _$enumDecodeNullable(
        _$ModelEndpointStatusEnumMap, json['modelEndpointStatus']),
    modelSource:
        _$enumDecodeNullable(_$ModelSourceEnumMap, json['modelSource']),
    outputConfiguration: json['outputConfiguration'] == null
        ? null
        : ModelOutputConfiguration.fromJson(
            json['outputConfiguration'] as Map<String, dynamic>),
    role: json['role'] == null
        ? null
        : Role.fromJson(json['role'] as Map<String, dynamic>),
  );
}

const _$ModelEndpointStatusEnumMap = {
  ModelEndpointStatus.associated: 'ASSOCIATED',
  ModelEndpointStatus.dissociated: 'DISSOCIATED',
};

const _$ModelSourceEnumMap = {
  ModelSource.sagemaker: 'SAGEMAKER',
};

GetDetectorVersionResult _$GetDetectorVersionResultFromJson(
    Map<String, dynamic> json) {
  return GetDetectorVersionResult(
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    detectorId: json['detectorId'] as String,
    detectorVersionId: json['detectorVersionId'] as String,
    externalModelEndpoints: (json['externalModelEndpoints'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    modelVersions: (json['modelVersions'] as List)
        ?.map((e) =>
            e == null ? null : ModelVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ruleExecutionMode: _$enumDecodeNullable(
        _$RuleExecutionModeEnumMap, json['ruleExecutionMode']),
    rules: (json['rules'] as List)
        ?.map(
            (e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status:
        _$enumDecodeNullable(_$DetectorVersionStatusEnumMap, json['status']),
  );
}

const _$RuleExecutionModeEnumMap = {
  RuleExecutionMode.allMatched: 'ALL_MATCHED',
  RuleExecutionMode.firstMatched: 'FIRST_MATCHED',
};

GetDetectorsResult _$GetDetectorsResultFromJson(Map<String, dynamic> json) {
  return GetDetectorsResult(
    detectors: (json['detectors'] as List)
        ?.map((e) =>
            e == null ? null : Detector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetExternalModelsResult _$GetExternalModelsResultFromJson(
    Map<String, dynamic> json) {
  return GetExternalModelsResult(
    externalModels: (json['externalModels'] as List)
        ?.map((e) => e == null
            ? null
            : ExternalModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetModelVersionResult _$GetModelVersionResultFromJson(
    Map<String, dynamic> json) {
  return GetModelVersionResult(
    description: json['description'] as String,
    modelId: json['modelId'] as String,
    modelType: _$enumDecodeNullable(_$ModelTypeEnumEnumMap, json['modelType']),
    modelVersionNumber: json['modelVersionNumber'] as String,
    status: json['status'] as String,
  );
}

GetModelsResult _$GetModelsResultFromJson(Map<String, dynamic> json) {
  return GetModelsResult(
    models: (json['models'] as List)
        ?.map(
            (e) => e == null ? null : Model.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetOutcomesResult _$GetOutcomesResultFromJson(Map<String, dynamic> json) {
  return GetOutcomesResult(
    nextToken: json['nextToken'] as String,
    outcomes: (json['outcomes'] as List)
        ?.map((e) =>
            e == null ? null : Outcome.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetPredictionResult _$GetPredictionResultFromJson(Map<String, dynamic> json) {
  return GetPredictionResult(
    modelScores: (json['modelScores'] as List)
        ?.map((e) =>
            e == null ? null : ModelScores.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outcomes: (json['outcomes'] as List)?.map((e) => e as String)?.toList(),
    ruleResults: (json['ruleResults'] as List)
        ?.map((e) =>
            e == null ? null : RuleResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetRulesResult _$GetRulesResultFromJson(Map<String, dynamic> json) {
  return GetRulesResult(
    nextToken: json['nextToken'] as String,
    ruleDetails: (json['ruleDetails'] as List)
        ?.map((e) =>
            e == null ? null : RuleDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetVariablesResult _$GetVariablesResultFromJson(Map<String, dynamic> json) {
  return GetVariablesResult(
    nextToken: json['nextToken'] as String,
    variables: (json['variables'] as List)
        ?.map((e) =>
            e == null ? null : Variable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LabelSchema _$LabelSchemaFromJson(Map<String, dynamic> json) {
  return LabelSchema(
    labelKey: json['labelKey'] as String,
    labelMapper: (json['labelMapper'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
  );
}

Map<String, dynamic> _$LabelSchemaToJson(LabelSchema instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('labelKey', instance.labelKey);
  writeNotNull('labelMapper', instance.labelMapper);
  return val;
}

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    labelSchema: json['labelSchema'] == null
        ? null
        : LabelSchema.fromJson(json['labelSchema'] as Map<String, dynamic>),
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    modelId: json['modelId'] as String,
    modelType: _$enumDecodeNullable(_$ModelTypeEnumEnumMap, json['modelType']),
    modelVariables: (json['modelVariables'] as List)
        ?.map((e) => e == null
            ? null
            : ModelVariable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trainingDataSource: json['trainingDataSource'] == null
        ? null
        : TrainingDataSource.fromJson(
            json['trainingDataSource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelEndpointDataBlobToJson(
    ModelEndpointDataBlob instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'byteBuffer', const Uint8ListConverter().toJson(instance.byteBuffer));
  writeNotNull('contentType', instance.contentType);
  return val;
}

ModelInputConfiguration _$ModelInputConfigurationFromJson(
    Map<String, dynamic> json) {
  return ModelInputConfiguration(
    isOpaque: json['isOpaque'] as bool,
    csvInputTemplate: json['csvInputTemplate'] as String,
    format: _$enumDecodeNullable(_$ModelInputDataFormatEnumMap, json['format']),
    jsonInputTemplate: json['jsonInputTemplate'] as String,
  );
}

Map<String, dynamic> _$ModelInputConfigurationToJson(
    ModelInputConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isOpaque', instance.isOpaque);
  writeNotNull('csvInputTemplate', instance.csvInputTemplate);
  writeNotNull('format', _$ModelInputDataFormatEnumMap[instance.format]);
  writeNotNull('jsonInputTemplate', instance.jsonInputTemplate);
  return val;
}

const _$ModelInputDataFormatEnumMap = {
  ModelInputDataFormat.textCsv: 'TEXT_CSV',
  ModelInputDataFormat.applicationJson: 'APPLICATION_JSON',
};

ModelOutputConfiguration _$ModelOutputConfigurationFromJson(
    Map<String, dynamic> json) {
  return ModelOutputConfiguration(
    format:
        _$enumDecodeNullable(_$ModelOutputDataFormatEnumMap, json['format']),
    csvIndexToVariableMap:
        (json['csvIndexToVariableMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    jsonKeyToVariableMap:
        (json['jsonKeyToVariableMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ModelOutputConfigurationToJson(
    ModelOutputConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('format', _$ModelOutputDataFormatEnumMap[instance.format]);
  writeNotNull('csvIndexToVariableMap', instance.csvIndexToVariableMap);
  writeNotNull('jsonKeyToVariableMap', instance.jsonKeyToVariableMap);
  return val;
}

const _$ModelOutputDataFormatEnumMap = {
  ModelOutputDataFormat.textCsv: 'TEXT_CSV',
  ModelOutputDataFormat.applicationJsonlines: 'APPLICATION_JSONLINES',
};

ModelScores _$ModelScoresFromJson(Map<String, dynamic> json) {
  return ModelScores(
    modelVersion: json['modelVersion'] == null
        ? null
        : ModelVersion.fromJson(json['modelVersion'] as Map<String, dynamic>),
    scores: (json['scores'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
  );
}

ModelVariable _$ModelVariableFromJson(Map<String, dynamic> json) {
  return ModelVariable(
    name: json['name'] as String,
    index: json['index'] as int,
  );
}

Map<String, dynamic> _$ModelVariableToJson(ModelVariable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('index', instance.index);
  return val;
}

ModelVersion _$ModelVersionFromJson(Map<String, dynamic> json) {
  return ModelVersion(
    modelId: json['modelId'] as String,
    modelType: _$enumDecodeNullable(_$ModelTypeEnumEnumMap, json['modelType']),
    modelVersionNumber: json['modelVersionNumber'] as String,
  );
}

Map<String, dynamic> _$ModelVersionToJson(ModelVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modelId', instance.modelId);
  writeNotNull('modelType', _$ModelTypeEnumEnumMap[instance.modelType]);
  writeNotNull('modelVersionNumber', instance.modelVersionNumber);
  return val;
}

ModelVersionDetail _$ModelVersionDetailFromJson(Map<String, dynamic> json) {
  return ModelVersionDetail(
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    labelSchema: json['labelSchema'] == null
        ? null
        : LabelSchema.fromJson(json['labelSchema'] as Map<String, dynamic>),
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    modelId: json['modelId'] as String,
    modelType: _$enumDecodeNullable(_$ModelTypeEnumEnumMap, json['modelType']),
    modelVariables: (json['modelVariables'] as List)
        ?.map((e) => e == null
            ? null
            : ModelVariable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    modelVersionNumber: json['modelVersionNumber'] as String,
    status: json['status'] as String,
    trainingDataSource: json['trainingDataSource'] == null
        ? null
        : TrainingDataSource.fromJson(
            json['trainingDataSource'] as Map<String, dynamic>),
    trainingMetrics: (json['trainingMetrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    validationMetrics: (json['validationMetrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Outcome _$OutcomeFromJson(Map<String, dynamic> json) {
  return Outcome(
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    name: json['name'] as String,
  );
}

PutDetectorResult _$PutDetectorResultFromJson(Map<String, dynamic> json) {
  return PutDetectorResult();
}

PutExternalModelResult _$PutExternalModelResultFromJson(
    Map<String, dynamic> json) {
  return PutExternalModelResult();
}

PutModelResult _$PutModelResultFromJson(Map<String, dynamic> json) {
  return PutModelResult();
}

PutOutcomeResult _$PutOutcomeResultFromJson(Map<String, dynamic> json) {
  return PutOutcomeResult();
}

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role(
    arn: json['arn'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arn', instance.arn);
  writeNotNull('name', instance.name);
  return val;
}

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
    detectorId: json['detectorId'] as String,
    ruleId: json['ruleId'] as String,
    ruleVersion: json['ruleVersion'] as String,
  );
}

Map<String, dynamic> _$RuleToJson(Rule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('ruleId', instance.ruleId);
  writeNotNull('ruleVersion', instance.ruleVersion);
  return val;
}

RuleDetail _$RuleDetailFromJson(Map<String, dynamic> json) {
  return RuleDetail(
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    detectorId: json['detectorId'] as String,
    expression: json['expression'] as String,
    language: _$enumDecodeNullable(_$LanguageEnumMap, json['language']),
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    outcomes: (json['outcomes'] as List)?.map((e) => e as String)?.toList(),
    ruleId: json['ruleId'] as String,
    ruleVersion: json['ruleVersion'] as String,
  );
}

const _$LanguageEnumMap = {
  Language.detectorpl: 'DETECTORPL',
};

RuleResult _$RuleResultFromJson(Map<String, dynamic> json) {
  return RuleResult(
    outcomes: (json['outcomes'] as List)?.map((e) => e as String)?.toList(),
    ruleId: json['ruleId'] as String,
  );
}

TrainingDataSource _$TrainingDataSourceFromJson(Map<String, dynamic> json) {
  return TrainingDataSource(
    dataAccessRoleArn: json['dataAccessRoleArn'] as String,
    dataLocation: json['dataLocation'] as String,
  );
}

Map<String, dynamic> _$TrainingDataSourceToJson(TrainingDataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataAccessRoleArn', instance.dataAccessRoleArn);
  writeNotNull('dataLocation', instance.dataLocation);
  return val;
}

UpdateDetectorVersionMetadataResult
    _$UpdateDetectorVersionMetadataResultFromJson(Map<String, dynamic> json) {
  return UpdateDetectorVersionMetadataResult();
}

UpdateDetectorVersionResult _$UpdateDetectorVersionResultFromJson(
    Map<String, dynamic> json) {
  return UpdateDetectorVersionResult();
}

UpdateDetectorVersionStatusResult _$UpdateDetectorVersionStatusResultFromJson(
    Map<String, dynamic> json) {
  return UpdateDetectorVersionStatusResult();
}

UpdateModelVersionResult _$UpdateModelVersionResultFromJson(
    Map<String, dynamic> json) {
  return UpdateModelVersionResult();
}

UpdateRuleMetadataResult _$UpdateRuleMetadataResultFromJson(
    Map<String, dynamic> json) {
  return UpdateRuleMetadataResult();
}

UpdateRuleVersionResult _$UpdateRuleVersionResultFromJson(
    Map<String, dynamic> json) {
  return UpdateRuleVersionResult(
    rule: json['rule'] == null
        ? null
        : Rule.fromJson(json['rule'] as Map<String, dynamic>),
  );
}

UpdateVariableResult _$UpdateVariableResultFromJson(Map<String, dynamic> json) {
  return UpdateVariableResult();
}

Variable _$VariableFromJson(Map<String, dynamic> json) {
  return Variable(
    createdTime: json['createdTime'] as String,
    dataSource: _$enumDecodeNullable(_$DataSourceEnumMap, json['dataSource']),
    dataType: _$enumDecodeNullable(_$DataTypeEnumMap, json['dataType']),
    defaultValue: json['defaultValue'] as String,
    description: json['description'] as String,
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    name: json['name'] as String,
    variableType: json['variableType'] as String,
  );
}

const _$DataSourceEnumMap = {
  DataSource.event: 'EVENT',
  DataSource.modelScore: 'MODEL_SCORE',
  DataSource.externalModelScore: 'EXTERNAL_MODEL_SCORE',
};

const _$DataTypeEnumMap = {
  DataType.string: 'STRING',
  DataType.integer: 'INTEGER',
  DataType.float: 'FLOAT',
  DataType.boolean: 'BOOLEAN',
};

Map<String, dynamic> _$VariableEntryToJson(VariableEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataSource', instance.dataSource);
  writeNotNull('dataType', instance.dataType);
  writeNotNull('defaultValue', instance.defaultValue);
  writeNotNull('description', instance.description);
  writeNotNull('name', instance.name);
  writeNotNull('variableType', instance.variableType);
  return val;
}
