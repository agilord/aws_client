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

Map<String, dynamic> _$BatchCreateVariableRequestToJson(
    BatchCreateVariableRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('variableEntries',
      instance.variableEntries?.map((e) => e?.toJson())?.toList());
  return val;
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

Map<String, dynamic> _$BatchGetVariableRequestToJson(
    BatchGetVariableRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('names', instance.names);
  return val;
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

Map<String, dynamic> _$CreateDetectorVersionRequestToJson(
    CreateDetectorVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('rules', instance.rules?.map((e) => e?.toJson())?.toList());
  writeNotNull('description', instance.description);
  writeNotNull('externalModelEndpoints', instance.externalModelEndpoints);
  writeNotNull('modelVersions',
      instance.modelVersions?.map((e) => e?.toJson())?.toList());
  writeNotNull('ruleExecutionMode',
      _$RuleExecutionModeEnumMap[instance.ruleExecutionMode]);
  return val;
}

const _$RuleExecutionModeEnumMap = {
  RuleExecutionMode.allMatched: 'ALL_MATCHED',
  RuleExecutionMode.firstMatched: 'FIRST_MATCHED',
};

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

Map<String, dynamic> _$CreateModelVersionRequestToJson(
    CreateModelVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modelId', instance.modelId);
  writeNotNull('modelType', _$ModelTypeEnumEnumMap[instance.modelType]);
  writeNotNull('description', instance.description);
  return val;
}

const _$ModelTypeEnumEnumMap = {
  ModelTypeEnum.onlineFraudInsights: 'ONLINE_FRAUD_INSIGHTS',
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

Map<String, dynamic> _$CreateRuleRequestToJson(CreateRuleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('expression', instance.expression);
  writeNotNull('language', _$LanguageEnumMap[instance.language]);
  writeNotNull('outcomes', instance.outcomes);
  writeNotNull('ruleId', instance.ruleId);
  writeNotNull('description', instance.description);
  return val;
}

const _$LanguageEnumMap = {
  Language.detectorpl: 'DETECTORPL',
};

CreateRuleResult _$CreateRuleResultFromJson(Map<String, dynamic> json) {
  return CreateRuleResult(
    rule: json['rule'] == null
        ? null
        : Rule.fromJson(json['rule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateVariableRequestToJson(
    CreateVariableRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataSource', _$DataSourceEnumMap[instance.dataSource]);
  writeNotNull('dataType', _$DataTypeEnumMap[instance.dataType]);
  writeNotNull('defaultValue', instance.defaultValue);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('variableType', instance.variableType);
  return val;
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

CreateVariableResult _$CreateVariableResultFromJson(Map<String, dynamic> json) {
  return CreateVariableResult();
}

Map<String, dynamic> _$DeleteDetectorRequestToJson(
    DeleteDetectorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  return val;
}

DeleteDetectorResult _$DeleteDetectorResultFromJson(Map<String, dynamic> json) {
  return DeleteDetectorResult();
}

Map<String, dynamic> _$DeleteDetectorVersionRequestToJson(
    DeleteDetectorVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('detectorVersionId', instance.detectorVersionId);
  return val;
}

DeleteDetectorVersionResult _$DeleteDetectorVersionResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDetectorVersionResult();
}

Map<String, dynamic> _$DeleteEventRequestToJson(DeleteEventRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventId', instance.eventId);
  return val;
}

DeleteEventResult _$DeleteEventResultFromJson(Map<String, dynamic> json) {
  return DeleteEventResult();
}

Map<String, dynamic> _$DeleteRuleVersionRequestToJson(
    DeleteRuleVersionRequest instance) {
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

DeleteRuleVersionResult _$DeleteRuleVersionResultFromJson(
    Map<String, dynamic> json) {
  return DeleteRuleVersionResult();
}

Map<String, dynamic> _$DescribeDetectorRequestToJson(
    DescribeDetectorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$DescribeModelVersionsRequestToJson(
    DescribeModelVersionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('modelId', instance.modelId);
  writeNotNull('modelType', _$ModelTypeEnumEnumMap[instance.modelType]);
  writeNotNull('modelVersionNumber', instance.modelVersionNumber);
  writeNotNull('nextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$GetDetectorVersionRequestToJson(
    GetDetectorVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('detectorVersionId', instance.detectorVersionId);
  return val;
}

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

Map<String, dynamic> _$GetDetectorsRequestToJson(GetDetectorsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

GetDetectorsResult _$GetDetectorsResultFromJson(Map<String, dynamic> json) {
  return GetDetectorsResult(
    detectors: (json['detectors'] as List)
        ?.map((e) =>
            e == null ? null : Detector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$GetExternalModelsRequestToJson(
    GetExternalModelsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('modelEndpoint', instance.modelEndpoint);
  writeNotNull('nextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$GetModelVersionRequestToJson(
    GetModelVersionRequest instance) {
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

Map<String, dynamic> _$GetModelsRequestToJson(GetModelsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('modelId', instance.modelId);
  writeNotNull('modelType', _$ModelTypeEnumEnumMap[instance.modelType]);
  writeNotNull('nextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$GetOutcomesRequestToJson(GetOutcomesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('name', instance.name);
  writeNotNull('nextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$GetPredictionRequestToJson(
    GetPredictionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('eventId', instance.eventId);
  writeNotNull('detectorVersionId', instance.detectorVersionId);
  writeNotNull('eventAttributes', instance.eventAttributes);
  writeNotNull(
      'externalModelEndpointDataBlobs',
      instance.externalModelEndpointDataBlobs
          ?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
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

Map<String, dynamic> _$GetRulesRequestToJson(GetRulesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('ruleId', instance.ruleId);
  writeNotNull('ruleVersion', instance.ruleVersion);
  return val;
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

Map<String, dynamic> _$GetVariablesRequestToJson(GetVariablesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('name', instance.name);
  writeNotNull('nextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$PutDetectorRequestToJson(PutDetectorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('description', instance.description);
  return val;
}

PutDetectorResult _$PutDetectorResultFromJson(Map<String, dynamic> json) {
  return PutDetectorResult();
}

Map<String, dynamic> _$PutExternalModelRequestToJson(
    PutExternalModelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inputConfiguration', instance.inputConfiguration?.toJson());
  writeNotNull('modelEndpoint', instance.modelEndpoint);
  writeNotNull('modelEndpointStatus',
      _$ModelEndpointStatusEnumMap[instance.modelEndpointStatus]);
  writeNotNull('modelSource', _$ModelSourceEnumMap[instance.modelSource]);
  writeNotNull('outputConfiguration', instance.outputConfiguration?.toJson());
  writeNotNull('role', instance.role?.toJson());
  return val;
}

PutExternalModelResult _$PutExternalModelResultFromJson(
    Map<String, dynamic> json) {
  return PutExternalModelResult();
}

Map<String, dynamic> _$PutModelRequestToJson(PutModelRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('labelSchema', instance.labelSchema?.toJson());
  writeNotNull('modelId', instance.modelId);
  writeNotNull('modelType', _$ModelTypeEnumEnumMap[instance.modelType]);
  writeNotNull('modelVariables',
      instance.modelVariables?.map((e) => e?.toJson())?.toList());
  writeNotNull('trainingDataSource', instance.trainingDataSource?.toJson());
  writeNotNull('description', instance.description);
  return val;
}

PutModelResult _$PutModelResultFromJson(Map<String, dynamic> json) {
  return PutModelResult();
}

Map<String, dynamic> _$PutOutcomeRequestToJson(PutOutcomeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  return val;
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

Map<String, dynamic> _$UpdateDetectorVersionMetadataRequestToJson(
    UpdateDetectorVersionMetadataRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('detectorVersionId', instance.detectorVersionId);
  return val;
}

UpdateDetectorVersionMetadataResult
    _$UpdateDetectorVersionMetadataResultFromJson(Map<String, dynamic> json) {
  return UpdateDetectorVersionMetadataResult();
}

Map<String, dynamic> _$UpdateDetectorVersionRequestToJson(
    UpdateDetectorVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('detectorVersionId', instance.detectorVersionId);
  writeNotNull('externalModelEndpoints', instance.externalModelEndpoints);
  writeNotNull('rules', instance.rules?.map((e) => e?.toJson())?.toList());
  writeNotNull('description', instance.description);
  writeNotNull('modelVersions',
      instance.modelVersions?.map((e) => e?.toJson())?.toList());
  writeNotNull('ruleExecutionMode',
      _$RuleExecutionModeEnumMap[instance.ruleExecutionMode]);
  return val;
}

UpdateDetectorVersionResult _$UpdateDetectorVersionResultFromJson(
    Map<String, dynamic> json) {
  return UpdateDetectorVersionResult();
}

Map<String, dynamic> _$UpdateDetectorVersionStatusRequestToJson(
    UpdateDetectorVersionStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorId', instance.detectorId);
  writeNotNull('detectorVersionId', instance.detectorVersionId);
  writeNotNull('status', _$DetectorVersionStatusEnumMap[instance.status]);
  return val;
}

UpdateDetectorVersionStatusResult _$UpdateDetectorVersionStatusResultFromJson(
    Map<String, dynamic> json) {
  return UpdateDetectorVersionStatusResult();
}

Map<String, dynamic> _$UpdateModelVersionRequestToJson(
    UpdateModelVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('modelId', instance.modelId);
  writeNotNull('modelType', _$ModelTypeEnumEnumMap[instance.modelType]);
  writeNotNull('modelVersionNumber', instance.modelVersionNumber);
  writeNotNull('status', _$ModelVersionStatusEnumMap[instance.status]);
  return val;
}

const _$ModelVersionStatusEnumMap = {
  ModelVersionStatus.trainingInProgress: 'TRAINING_IN_PROGRESS',
  ModelVersionStatus.trainingComplete: 'TRAINING_COMPLETE',
  ModelVersionStatus.activateRequested: 'ACTIVATE_REQUESTED',
  ModelVersionStatus.activateInProgress: 'ACTIVATE_IN_PROGRESS',
  ModelVersionStatus.active: 'ACTIVE',
  ModelVersionStatus.inactivateInProgress: 'INACTIVATE_IN_PROGRESS',
  ModelVersionStatus.inactive: 'INACTIVE',
  ModelVersionStatus.error: 'ERROR',
};

UpdateModelVersionResult _$UpdateModelVersionResultFromJson(
    Map<String, dynamic> json) {
  return UpdateModelVersionResult();
}

Map<String, dynamic> _$UpdateRuleMetadataRequestToJson(
    UpdateRuleMetadataRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('rule', instance.rule?.toJson());
  return val;
}

UpdateRuleMetadataResult _$UpdateRuleMetadataResultFromJson(
    Map<String, dynamic> json) {
  return UpdateRuleMetadataResult();
}

Map<String, dynamic> _$UpdateRuleVersionRequestToJson(
    UpdateRuleVersionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expression', instance.expression);
  writeNotNull('language', _$LanguageEnumMap[instance.language]);
  writeNotNull('outcomes', instance.outcomes);
  writeNotNull('rule', instance.rule?.toJson());
  writeNotNull('description', instance.description);
  return val;
}

UpdateRuleVersionResult _$UpdateRuleVersionResultFromJson(
    Map<String, dynamic> json) {
  return UpdateRuleVersionResult(
    rule: json['rule'] == null
        ? null
        : Rule.fromJson(json['rule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateVariableRequestToJson(
    UpdateVariableRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('defaultValue', instance.defaultValue);
  writeNotNull('description', instance.description);
  writeNotNull('variableType', instance.variableType);
  return val;
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
