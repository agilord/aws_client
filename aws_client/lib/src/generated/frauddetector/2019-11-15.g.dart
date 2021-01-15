// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-11-15.dart';

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

CreateModelResult _$CreateModelResultFromJson(Map<String, dynamic> json) {
  return CreateModelResult();
}

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

DataValidationMetrics _$DataValidationMetricsFromJson(
    Map<String, dynamic> json) {
  return DataValidationMetrics(
    fieldLevelMessages: (json['fieldLevelMessages'] as List)
        ?.map((e) => e == null
            ? null
            : FieldValidationMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    fileLevelMessages: (json['fileLevelMessages'] as List)
        ?.map((e) => e == null
            ? null
            : FileValidationMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteDetectorResult _$DeleteDetectorResultFromJson(Map<String, dynamic> json) {
  return DeleteDetectorResult();
}

DeleteDetectorVersionResult _$DeleteDetectorVersionResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDetectorVersionResult();
}

DeleteEntityTypeResult _$DeleteEntityTypeResultFromJson(
    Map<String, dynamic> json) {
  return DeleteEntityTypeResult();
}

DeleteEventResult _$DeleteEventResultFromJson(Map<String, dynamic> json) {
  return DeleteEventResult();
}

DeleteEventTypeResult _$DeleteEventTypeResultFromJson(
    Map<String, dynamic> json) {
  return DeleteEventTypeResult();
}

DeleteExternalModelResult _$DeleteExternalModelResultFromJson(
    Map<String, dynamic> json) {
  return DeleteExternalModelResult();
}

DeleteLabelResult _$DeleteLabelResultFromJson(Map<String, dynamic> json) {
  return DeleteLabelResult();
}

DeleteModelResult _$DeleteModelResultFromJson(Map<String, dynamic> json) {
  return DeleteModelResult();
}

DeleteModelVersionResult _$DeleteModelVersionResultFromJson(
    Map<String, dynamic> json) {
  return DeleteModelVersionResult();
}

DeleteOutcomeResult _$DeleteOutcomeResultFromJson(Map<String, dynamic> json) {
  return DeleteOutcomeResult();
}

DeleteRuleResult _$DeleteRuleResultFromJson(Map<String, dynamic> json) {
  return DeleteRuleResult();
}

DeleteVariableResult _$DeleteVariableResultFromJson(Map<String, dynamic> json) {
  return DeleteVariableResult();
}

DescribeDetectorResult _$DescribeDetectorResultFromJson(
    Map<String, dynamic> json) {
  return DescribeDetectorResult(
    arn: json['arn'] as String,
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
    arn: json['arn'] as String,
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    detectorId: json['detectorId'] as String,
    eventTypeName: json['eventTypeName'] as String,
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

Map<String, dynamic> _$EntityToJson(Entity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('entityId', instance.entityId);
  writeNotNull('entityType', instance.entityType);
  return val;
}

EntityType _$EntityTypeFromJson(Map<String, dynamic> json) {
  return EntityType(
    arn: json['arn'] as String,
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    name: json['name'] as String,
  );
}

EventType _$EventTypeFromJson(Map<String, dynamic> json) {
  return EventType(
    arn: json['arn'] as String,
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    entityTypes:
        (json['entityTypes'] as List)?.map((e) => e as String)?.toList(),
    eventVariables:
        (json['eventVariables'] as List)?.map((e) => e as String)?.toList(),
    labels: (json['labels'] as List)?.map((e) => e as String)?.toList(),
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    name: json['name'] as String,
  );
}

ExternalEventsDetail _$ExternalEventsDetailFromJson(Map<String, dynamic> json) {
  return ExternalEventsDetail(
    dataAccessRoleArn: json['dataAccessRoleArn'] as String,
    dataLocation: json['dataLocation'] as String,
  );
}

Map<String, dynamic> _$ExternalEventsDetailToJson(
    ExternalEventsDetail instance) {
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

ExternalModel _$ExternalModelFromJson(Map<String, dynamic> json) {
  return ExternalModel(
    arn: json['arn'] as String,
    createdTime: json['createdTime'] as String,
    inputConfiguration: json['inputConfiguration'] == null
        ? null
        : ModelInputConfiguration.fromJson(
            json['inputConfiguration'] as Map<String, dynamic>),
    invokeModelEndpointRoleArn: json['invokeModelEndpointRoleArn'] as String,
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
  );
}

const _$ModelEndpointStatusEnumMap = {
  ModelEndpointStatus.associated: 'ASSOCIATED',
  ModelEndpointStatus.dissociated: 'DISSOCIATED',
};

const _$ModelSourceEnumMap = {
  ModelSource.sagemaker: 'SAGEMAKER',
};

FieldValidationMessage _$FieldValidationMessageFromJson(
    Map<String, dynamic> json) {
  return FieldValidationMessage(
    content: json['content'] as String,
    fieldName: json['fieldName'] as String,
    identifier: json['identifier'] as String,
    title: json['title'] as String,
    type: json['type'] as String,
  );
}

FileValidationMessage _$FileValidationMessageFromJson(
    Map<String, dynamic> json) {
  return FileValidationMessage(
    content: json['content'] as String,
    title: json['title'] as String,
    type: json['type'] as String,
  );
}

GetDetectorVersionResult _$GetDetectorVersionResultFromJson(
    Map<String, dynamic> json) {
  return GetDetectorVersionResult(
    arn: json['arn'] as String,
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

GetEntityTypesResult _$GetEntityTypesResultFromJson(Map<String, dynamic> json) {
  return GetEntityTypesResult(
    entityTypes: (json['entityTypes'] as List)
        ?.map((e) =>
            e == null ? null : EntityType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetEventPredictionResult _$GetEventPredictionResultFromJson(
    Map<String, dynamic> json) {
  return GetEventPredictionResult(
    modelScores: (json['modelScores'] as List)
        ?.map((e) =>
            e == null ? null : ModelScores.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ruleResults: (json['ruleResults'] as List)
        ?.map((e) =>
            e == null ? null : RuleResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetEventTypesResult _$GetEventTypesResultFromJson(Map<String, dynamic> json) {
  return GetEventTypesResult(
    eventTypes: (json['eventTypes'] as List)
        ?.map((e) =>
            e == null ? null : EventType.fromJson(e as Map<String, dynamic>))
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

GetKMSEncryptionKeyResult _$GetKMSEncryptionKeyResultFromJson(
    Map<String, dynamic> json) {
  return GetKMSEncryptionKeyResult(
    kmsKey: json['kmsKey'] == null
        ? null
        : KMSKey.fromJson(json['kmsKey'] as Map<String, dynamic>),
  );
}

GetLabelsResult _$GetLabelsResultFromJson(Map<String, dynamic> json) {
  return GetLabelsResult(
    labels: (json['labels'] as List)
        ?.map(
            (e) => e == null ? null : Label.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetModelVersionResult _$GetModelVersionResultFromJson(
    Map<String, dynamic> json) {
  return GetModelVersionResult(
    arn: json['arn'] as String,
    externalEventsDetail: json['externalEventsDetail'] == null
        ? null
        : ExternalEventsDetail.fromJson(
            json['externalEventsDetail'] as Map<String, dynamic>),
    modelId: json['modelId'] as String,
    modelType: _$enumDecodeNullable(_$ModelTypeEnumEnumMap, json['modelType']),
    modelVersionNumber: json['modelVersionNumber'] as String,
    status: json['status'] as String,
    trainingDataSchema: json['trainingDataSchema'] == null
        ? null
        : TrainingDataSchema.fromJson(
            json['trainingDataSchema'] as Map<String, dynamic>),
    trainingDataSource: _$enumDecodeNullable(
        _$TrainingDataSourceEnumEnumMap, json['trainingDataSource']),
  );
}

const _$TrainingDataSourceEnumEnumMap = {
  TrainingDataSourceEnum.externalEvents: 'EXTERNAL_EVENTS',
};

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

KMSKey _$KMSKeyFromJson(Map<String, dynamic> json) {
  return KMSKey(
    kmsEncryptionKeyArn: json['kmsEncryptionKeyArn'] as String,
  );
}

Label _$LabelFromJson(Map<String, dynamic> json) {
  return Label(
    arn: json['arn'] as String,
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    name: json['name'] as String,
  );
}

LabelSchema _$LabelSchemaFromJson(Map<String, dynamic> json) {
  return LabelSchema(
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

  writeNotNull('labelMapper', instance.labelMapper);
  return val;
}

ListTagsForResourceResult _$ListTagsForResourceResultFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResult(
    nextToken: json['nextToken'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MetricDataPoint _$MetricDataPointFromJson(Map<String, dynamic> json) {
  return MetricDataPoint(
    fpr: (json['fpr'] as num)?.toDouble(),
    precision: (json['precision'] as num)?.toDouble(),
    threshold: (json['threshold'] as num)?.toDouble(),
    tpr: (json['tpr'] as num)?.toDouble(),
  );
}

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
    arn: json['arn'] as String,
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    eventTypeName: json['eventTypeName'] as String,
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    modelId: json['modelId'] as String,
    modelType: _$enumDecodeNullable(_$ModelTypeEnumEnumMap, json['modelType']),
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
    useEventVariables: json['useEventVariables'] as bool,
    csvInputTemplate: json['csvInputTemplate'] as String,
    eventTypeName: json['eventTypeName'] as String,
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

  writeNotNull('useEventVariables', instance.useEventVariables);
  writeNotNull('csvInputTemplate', instance.csvInputTemplate);
  writeNotNull('eventTypeName', instance.eventTypeName);
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

ModelVersion _$ModelVersionFromJson(Map<String, dynamic> json) {
  return ModelVersion(
    modelId: json['modelId'] as String,
    modelType: _$enumDecodeNullable(_$ModelTypeEnumEnumMap, json['modelType']),
    modelVersionNumber: json['modelVersionNumber'] as String,
    arn: json['arn'] as String,
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
  writeNotNull('arn', instance.arn);
  return val;
}

ModelVersionDetail _$ModelVersionDetailFromJson(Map<String, dynamic> json) {
  return ModelVersionDetail(
    arn: json['arn'] as String,
    createdTime: json['createdTime'] as String,
    externalEventsDetail: json['externalEventsDetail'] == null
        ? null
        : ExternalEventsDetail.fromJson(
            json['externalEventsDetail'] as Map<String, dynamic>),
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    modelId: json['modelId'] as String,
    modelType: _$enumDecodeNullable(_$ModelTypeEnumEnumMap, json['modelType']),
    modelVersionNumber: json['modelVersionNumber'] as String,
    status: json['status'] as String,
    trainingDataSchema: json['trainingDataSchema'] == null
        ? null
        : TrainingDataSchema.fromJson(
            json['trainingDataSchema'] as Map<String, dynamic>),
    trainingDataSource: _$enumDecodeNullable(
        _$TrainingDataSourceEnumEnumMap, json['trainingDataSource']),
    trainingResult: json['trainingResult'] == null
        ? null
        : TrainingResult.fromJson(
            json['trainingResult'] as Map<String, dynamic>),
  );
}

Outcome _$OutcomeFromJson(Map<String, dynamic> json) {
  return Outcome(
    arn: json['arn'] as String,
    createdTime: json['createdTime'] as String,
    description: json['description'] as String,
    lastUpdatedTime: json['lastUpdatedTime'] as String,
    name: json['name'] as String,
  );
}

PutDetectorResult _$PutDetectorResultFromJson(Map<String, dynamic> json) {
  return PutDetectorResult();
}

PutEntityTypeResult _$PutEntityTypeResultFromJson(Map<String, dynamic> json) {
  return PutEntityTypeResult();
}

PutEventTypeResult _$PutEventTypeResultFromJson(Map<String, dynamic> json) {
  return PutEventTypeResult();
}

PutExternalModelResult _$PutExternalModelResultFromJson(
    Map<String, dynamic> json) {
  return PutExternalModelResult();
}

PutKMSEncryptionKeyResult _$PutKMSEncryptionKeyResultFromJson(
    Map<String, dynamic> json) {
  return PutKMSEncryptionKeyResult();
}

PutLabelResult _$PutLabelResultFromJson(Map<String, dynamic> json) {
  return PutLabelResult();
}

PutOutcomeResult _$PutOutcomeResultFromJson(Map<String, dynamic> json) {
  return PutOutcomeResult();
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
    arn: json['arn'] as String,
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

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

TagResourceResult _$TagResourceResultFromJson(Map<String, dynamic> json) {
  return TagResourceResult();
}

TrainingDataSchema _$TrainingDataSchemaFromJson(Map<String, dynamic> json) {
  return TrainingDataSchema(
    labelSchema: json['labelSchema'] == null
        ? null
        : LabelSchema.fromJson(json['labelSchema'] as Map<String, dynamic>),
    modelVariables:
        (json['modelVariables'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TrainingDataSchemaToJson(TrainingDataSchema instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('labelSchema', instance.labelSchema?.toJson());
  writeNotNull('modelVariables', instance.modelVariables);
  return val;
}

TrainingMetrics _$TrainingMetricsFromJson(Map<String, dynamic> json) {
  return TrainingMetrics(
    auc: (json['auc'] as num)?.toDouble(),
    metricDataPoints: (json['metricDataPoints'] as List)
        ?.map((e) => e == null
            ? null
            : MetricDataPoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

TrainingResult _$TrainingResultFromJson(Map<String, dynamic> json) {
  return TrainingResult(
    dataValidationMetrics: json['dataValidationMetrics'] == null
        ? null
        : DataValidationMetrics.fromJson(
            json['dataValidationMetrics'] as Map<String, dynamic>),
    trainingMetrics: json['trainingMetrics'] == null
        ? null
        : TrainingMetrics.fromJson(
            json['trainingMetrics'] as Map<String, dynamic>),
  );
}

UntagResourceResult _$UntagResourceResultFromJson(Map<String, dynamic> json) {
  return UntagResourceResult();
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

UpdateModelResult _$UpdateModelResultFromJson(Map<String, dynamic> json) {
  return UpdateModelResult();
}

UpdateModelVersionResult _$UpdateModelVersionResultFromJson(
    Map<String, dynamic> json) {
  return UpdateModelVersionResult(
    modelId: json['modelId'] as String,
    modelType: _$enumDecodeNullable(_$ModelTypeEnumEnumMap, json['modelType']),
    modelVersionNumber: json['modelVersionNumber'] as String,
    status: json['status'] as String,
  );
}

UpdateModelVersionStatusResult _$UpdateModelVersionStatusResultFromJson(
    Map<String, dynamic> json) {
  return UpdateModelVersionStatusResult();
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
    arn: json['arn'] as String,
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
