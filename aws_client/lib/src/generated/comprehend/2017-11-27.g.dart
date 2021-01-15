// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-11-27.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AugmentedManifestsListItem _$AugmentedManifestsListItemFromJson(
    Map<String, dynamic> json) {
  return AugmentedManifestsListItem(
    attributeNames:
        (json['AttributeNames'] as List)?.map((e) => e as String)?.toList(),
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$AugmentedManifestsListItemToJson(
    AugmentedManifestsListItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeNames', instance.attributeNames);
  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

BatchDetectDominantLanguageItemResult
    _$BatchDetectDominantLanguageItemResultFromJson(Map<String, dynamic> json) {
  return BatchDetectDominantLanguageItemResult(
    index: json['Index'] as int,
    languages: (json['Languages'] as List)
        ?.map((e) => e == null
            ? null
            : DominantLanguage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDetectDominantLanguageResponse
    _$BatchDetectDominantLanguageResponseFromJson(Map<String, dynamic> json) {
  return BatchDetectDominantLanguageResponse(
    errorList: (json['ErrorList'] as List)
        ?.map((e) => e == null
            ? null
            : BatchItemError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resultList: (json['ResultList'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDetectDominantLanguageItemResult.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDetectEntitiesItemResult _$BatchDetectEntitiesItemResultFromJson(
    Map<String, dynamic> json) {
  return BatchDetectEntitiesItemResult(
    entities: (json['Entities'] as List)
        ?.map((e) =>
            e == null ? null : Entity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    index: json['Index'] as int,
  );
}

BatchDetectEntitiesResponse _$BatchDetectEntitiesResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDetectEntitiesResponse(
    errorList: (json['ErrorList'] as List)
        ?.map((e) => e == null
            ? null
            : BatchItemError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resultList: (json['ResultList'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDetectEntitiesItemResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDetectKeyPhrasesItemResult _$BatchDetectKeyPhrasesItemResultFromJson(
    Map<String, dynamic> json) {
  return BatchDetectKeyPhrasesItemResult(
    index: json['Index'] as int,
    keyPhrases: (json['KeyPhrases'] as List)
        ?.map((e) =>
            e == null ? null : KeyPhrase.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDetectKeyPhrasesResponse _$BatchDetectKeyPhrasesResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDetectKeyPhrasesResponse(
    errorList: (json['ErrorList'] as List)
        ?.map((e) => e == null
            ? null
            : BatchItemError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resultList: (json['ResultList'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDetectKeyPhrasesItemResult.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDetectSentimentItemResult _$BatchDetectSentimentItemResultFromJson(
    Map<String, dynamic> json) {
  return BatchDetectSentimentItemResult(
    index: json['Index'] as int,
    sentiment: _$enumDecodeNullable(_$SentimentTypeEnumMap, json['Sentiment']),
    sentimentScore: json['SentimentScore'] == null
        ? null
        : SentimentScore.fromJson(
            json['SentimentScore'] as Map<String, dynamic>),
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

const _$SentimentTypeEnumMap = {
  SentimentType.positive: 'POSITIVE',
  SentimentType.negative: 'NEGATIVE',
  SentimentType.neutral: 'NEUTRAL',
  SentimentType.mixed: 'MIXED',
};

BatchDetectSentimentResponse _$BatchDetectSentimentResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDetectSentimentResponse(
    errorList: (json['ErrorList'] as List)
        ?.map((e) => e == null
            ? null
            : BatchItemError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resultList: (json['ResultList'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDetectSentimentItemResult.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDetectSyntaxItemResult _$BatchDetectSyntaxItemResultFromJson(
    Map<String, dynamic> json) {
  return BatchDetectSyntaxItemResult(
    index: json['Index'] as int,
    syntaxTokens: (json['SyntaxTokens'] as List)
        ?.map((e) =>
            e == null ? null : SyntaxToken.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDetectSyntaxResponse _$BatchDetectSyntaxResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDetectSyntaxResponse(
    errorList: (json['ErrorList'] as List)
        ?.map((e) => e == null
            ? null
            : BatchItemError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resultList: (json['ResultList'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDetectSyntaxItemResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchItemError _$BatchItemErrorFromJson(Map<String, dynamic> json) {
  return BatchItemError(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    index: json['Index'] as int,
  );
}

ClassifierEvaluationMetrics _$ClassifierEvaluationMetricsFromJson(
    Map<String, dynamic> json) {
  return ClassifierEvaluationMetrics(
    accuracy: (json['Accuracy'] as num)?.toDouble(),
    f1Score: (json['F1Score'] as num)?.toDouble(),
    hammingLoss: (json['HammingLoss'] as num)?.toDouble(),
    microF1Score: (json['MicroF1Score'] as num)?.toDouble(),
    microPrecision: (json['MicroPrecision'] as num)?.toDouble(),
    microRecall: (json['MicroRecall'] as num)?.toDouble(),
    precision: (json['Precision'] as num)?.toDouble(),
    recall: (json['Recall'] as num)?.toDouble(),
  );
}

ClassifierMetadata _$ClassifierMetadataFromJson(Map<String, dynamic> json) {
  return ClassifierMetadata(
    evaluationMetrics: json['EvaluationMetrics'] == null
        ? null
        : ClassifierEvaluationMetrics.fromJson(
            json['EvaluationMetrics'] as Map<String, dynamic>),
    numberOfLabels: json['NumberOfLabels'] as int,
    numberOfTestDocuments: json['NumberOfTestDocuments'] as int,
    numberOfTrainedDocuments: json['NumberOfTrainedDocuments'] as int,
  );
}

ClassifyDocumentResponse _$ClassifyDocumentResponseFromJson(
    Map<String, dynamic> json) {
  return ClassifyDocumentResponse(
    classes: (json['Classes'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentClass.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    labels: (json['Labels'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentLabel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateDocumentClassifierResponse _$CreateDocumentClassifierResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDocumentClassifierResponse(
    documentClassifierArn: json['DocumentClassifierArn'] as String,
  );
}

CreateEndpointResponse _$CreateEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEndpointResponse(
    endpointArn: json['EndpointArn'] as String,
  );
}

CreateEntityRecognizerResponse _$CreateEntityRecognizerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEntityRecognizerResponse(
    entityRecognizerArn: json['EntityRecognizerArn'] as String,
  );
}

DeleteDocumentClassifierResponse _$DeleteDocumentClassifierResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDocumentClassifierResponse();
}

DeleteEndpointResponse _$DeleteEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEndpointResponse();
}

DeleteEntityRecognizerResponse _$DeleteEntityRecognizerResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEntityRecognizerResponse();
}

DescribeDocumentClassificationJobResponse
    _$DescribeDocumentClassificationJobResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeDocumentClassificationJobResponse(
    documentClassificationJobProperties:
        json['DocumentClassificationJobProperties'] == null
            ? null
            : DocumentClassificationJobProperties.fromJson(
                json['DocumentClassificationJobProperties']
                    as Map<String, dynamic>),
  );
}

DescribeDocumentClassifierResponse _$DescribeDocumentClassifierResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDocumentClassifierResponse(
    documentClassifierProperties: json['DocumentClassifierProperties'] == null
        ? null
        : DocumentClassifierProperties.fromJson(
            json['DocumentClassifierProperties'] as Map<String, dynamic>),
  );
}

DescribeDominantLanguageDetectionJobResponse
    _$DescribeDominantLanguageDetectionJobResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeDominantLanguageDetectionJobResponse(
    dominantLanguageDetectionJobProperties:
        json['DominantLanguageDetectionJobProperties'] == null
            ? null
            : DominantLanguageDetectionJobProperties.fromJson(
                json['DominantLanguageDetectionJobProperties']
                    as Map<String, dynamic>),
  );
}

DescribeEndpointResponse _$DescribeEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointResponse(
    endpointProperties: json['EndpointProperties'] == null
        ? null
        : EndpointProperties.fromJson(
            json['EndpointProperties'] as Map<String, dynamic>),
  );
}

DescribeEntitiesDetectionJobResponse
    _$DescribeEntitiesDetectionJobResponseFromJson(Map<String, dynamic> json) {
  return DescribeEntitiesDetectionJobResponse(
    entitiesDetectionJobProperties:
        json['EntitiesDetectionJobProperties'] == null
            ? null
            : EntitiesDetectionJobProperties.fromJson(
                json['EntitiesDetectionJobProperties'] as Map<String, dynamic>),
  );
}

DescribeEntityRecognizerResponse _$DescribeEntityRecognizerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEntityRecognizerResponse(
    entityRecognizerProperties: json['EntityRecognizerProperties'] == null
        ? null
        : EntityRecognizerProperties.fromJson(
            json['EntityRecognizerProperties'] as Map<String, dynamic>),
  );
}

DescribeEventsDetectionJobResponse _$DescribeEventsDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventsDetectionJobResponse(
    eventsDetectionJobProperties: json['EventsDetectionJobProperties'] == null
        ? null
        : EventsDetectionJobProperties.fromJson(
            json['EventsDetectionJobProperties'] as Map<String, dynamic>),
  );
}

DescribeKeyPhrasesDetectionJobResponse
    _$DescribeKeyPhrasesDetectionJobResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeKeyPhrasesDetectionJobResponse(
    keyPhrasesDetectionJobProperties:
        json['KeyPhrasesDetectionJobProperties'] == null
            ? null
            : KeyPhrasesDetectionJobProperties.fromJson(
                json['KeyPhrasesDetectionJobProperties']
                    as Map<String, dynamic>),
  );
}

DescribePiiEntitiesDetectionJobResponse
    _$DescribePiiEntitiesDetectionJobResponseFromJson(
        Map<String, dynamic> json) {
  return DescribePiiEntitiesDetectionJobResponse(
    piiEntitiesDetectionJobProperties:
        json['PiiEntitiesDetectionJobProperties'] == null
            ? null
            : PiiEntitiesDetectionJobProperties.fromJson(
                json['PiiEntitiesDetectionJobProperties']
                    as Map<String, dynamic>),
  );
}

DescribeSentimentDetectionJobResponse
    _$DescribeSentimentDetectionJobResponseFromJson(Map<String, dynamic> json) {
  return DescribeSentimentDetectionJobResponse(
    sentimentDetectionJobProperties: json['SentimentDetectionJobProperties'] ==
            null
        ? null
        : SentimentDetectionJobProperties.fromJson(
            json['SentimentDetectionJobProperties'] as Map<String, dynamic>),
  );
}

DescribeTopicsDetectionJobResponse _$DescribeTopicsDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTopicsDetectionJobResponse(
    topicsDetectionJobProperties: json['TopicsDetectionJobProperties'] == null
        ? null
        : TopicsDetectionJobProperties.fromJson(
            json['TopicsDetectionJobProperties'] as Map<String, dynamic>),
  );
}

DetectDominantLanguageResponse _$DetectDominantLanguageResponseFromJson(
    Map<String, dynamic> json) {
  return DetectDominantLanguageResponse(
    languages: (json['Languages'] as List)
        ?.map((e) => e == null
            ? null
            : DominantLanguage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DetectEntitiesResponse _$DetectEntitiesResponseFromJson(
    Map<String, dynamic> json) {
  return DetectEntitiesResponse(
    entities: (json['Entities'] as List)
        ?.map((e) =>
            e == null ? null : Entity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DetectKeyPhrasesResponse _$DetectKeyPhrasesResponseFromJson(
    Map<String, dynamic> json) {
  return DetectKeyPhrasesResponse(
    keyPhrases: (json['KeyPhrases'] as List)
        ?.map((e) =>
            e == null ? null : KeyPhrase.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DetectPiiEntitiesResponse _$DetectPiiEntitiesResponseFromJson(
    Map<String, dynamic> json) {
  return DetectPiiEntitiesResponse(
    entities: (json['Entities'] as List)
        ?.map((e) =>
            e == null ? null : PiiEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DetectSentimentResponse _$DetectSentimentResponseFromJson(
    Map<String, dynamic> json) {
  return DetectSentimentResponse(
    sentiment: _$enumDecodeNullable(_$SentimentTypeEnumMap, json['Sentiment']),
    sentimentScore: json['SentimentScore'] == null
        ? null
        : SentimentScore.fromJson(
            json['SentimentScore'] as Map<String, dynamic>),
  );
}

DetectSyntaxResponse _$DetectSyntaxResponseFromJson(Map<String, dynamic> json) {
  return DetectSyntaxResponse(
    syntaxTokens: (json['SyntaxTokens'] as List)
        ?.map((e) =>
            e == null ? null : SyntaxToken.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DocumentClass _$DocumentClassFromJson(Map<String, dynamic> json) {
  return DocumentClass(
    name: json['Name'] as String,
    score: (json['Score'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DocumentClassificationJobFilterToJson(
    DocumentClassificationJobFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobName', instance.jobName);
  writeNotNull('JobStatus', _$JobStatusEnumMap[instance.jobStatus]);
  writeNotNull('SubmitTimeAfter',
      const UnixDateTimeConverter().toJson(instance.submitTimeAfter));
  writeNotNull('SubmitTimeBefore',
      const UnixDateTimeConverter().toJson(instance.submitTimeBefore));
  return val;
}

const _$JobStatusEnumMap = {
  JobStatus.submitted: 'SUBMITTED',
  JobStatus.inProgress: 'IN_PROGRESS',
  JobStatus.completed: 'COMPLETED',
  JobStatus.failed: 'FAILED',
  JobStatus.stopRequested: 'STOP_REQUESTED',
  JobStatus.stopped: 'STOPPED',
};

DocumentClassificationJobProperties
    _$DocumentClassificationJobPropertiesFromJson(Map<String, dynamic> json) {
  return DocumentClassificationJobProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    documentClassifierArn: json['DocumentClassifierArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    message: json['Message'] as String,
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DocumentClassifierFilterToJson(
    DocumentClassifierFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', _$ModelStatusEnumMap[instance.status]);
  writeNotNull('SubmitTimeAfter',
      const UnixDateTimeConverter().toJson(instance.submitTimeAfter));
  writeNotNull('SubmitTimeBefore',
      const UnixDateTimeConverter().toJson(instance.submitTimeBefore));
  return val;
}

const _$ModelStatusEnumMap = {
  ModelStatus.submitted: 'SUBMITTED',
  ModelStatus.training: 'TRAINING',
  ModelStatus.deleting: 'DELETING',
  ModelStatus.stopRequested: 'STOP_REQUESTED',
  ModelStatus.stopped: 'STOPPED',
  ModelStatus.inError: 'IN_ERROR',
  ModelStatus.trained: 'TRAINED',
};

DocumentClassifierInputDataConfig _$DocumentClassifierInputDataConfigFromJson(
    Map<String, dynamic> json) {
  return DocumentClassifierInputDataConfig(
    augmentedManifests: (json['AugmentedManifests'] as List)
        ?.map((e) => e == null
            ? null
            : AugmentedManifestsListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dataFormat: _$enumDecodeNullable(
        _$DocumentClassifierDataFormatEnumMap, json['DataFormat']),
    labelDelimiter: json['LabelDelimiter'] as String,
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$DocumentClassifierInputDataConfigToJson(
    DocumentClassifierInputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AugmentedManifests',
      instance.augmentedManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'DataFormat', _$DocumentClassifierDataFormatEnumMap[instance.dataFormat]);
  writeNotNull('LabelDelimiter', instance.labelDelimiter);
  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

const _$DocumentClassifierDataFormatEnumMap = {
  DocumentClassifierDataFormat.comprehendCsv: 'COMPREHEND_CSV',
  DocumentClassifierDataFormat.augmentedManifest: 'AUGMENTED_MANIFEST',
};

DocumentClassifierOutputDataConfig _$DocumentClassifierOutputDataConfigFromJson(
    Map<String, dynamic> json) {
  return DocumentClassifierOutputDataConfig(
    kmsKeyId: json['KmsKeyId'] as String,
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$DocumentClassifierOutputDataConfigToJson(
    DocumentClassifierOutputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

DocumentClassifierProperties _$DocumentClassifierPropertiesFromJson(
    Map<String, dynamic> json) {
  return DocumentClassifierProperties(
    classifierMetadata: json['ClassifierMetadata'] == null
        ? null
        : ClassifierMetadata.fromJson(
            json['ClassifierMetadata'] as Map<String, dynamic>),
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    documentClassifierArn: json['DocumentClassifierArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : DocumentClassifierInputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    message: json['Message'] as String,
    mode: _$enumDecodeNullable(_$DocumentClassifierModeEnumMap, json['Mode']),
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : DocumentClassifierOutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ModelStatusEnumMap, json['Status']),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    trainingEndTime:
        const UnixDateTimeConverter().fromJson(json['TrainingEndTime']),
    trainingStartTime:
        const UnixDateTimeConverter().fromJson(json['TrainingStartTime']),
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

const _$LanguageCodeEnumMap = {
  LanguageCode.en: 'en',
  LanguageCode.es: 'es',
  LanguageCode.fr: 'fr',
  LanguageCode.de: 'de',
  LanguageCode.it: 'it',
  LanguageCode.pt: 'pt',
  LanguageCode.ar: 'ar',
  LanguageCode.hi: 'hi',
  LanguageCode.ja: 'ja',
  LanguageCode.ko: 'ko',
  LanguageCode.zh: 'zh',
  LanguageCode.zhTw: 'zh-TW',
};

const _$DocumentClassifierModeEnumMap = {
  DocumentClassifierMode.multiClass: 'MULTI_CLASS',
  DocumentClassifierMode.multiLabel: 'MULTI_LABEL',
};

DocumentLabel _$DocumentLabelFromJson(Map<String, dynamic> json) {
  return DocumentLabel(
    name: json['Name'] as String,
    score: (json['Score'] as num)?.toDouble(),
  );
}

DominantLanguage _$DominantLanguageFromJson(Map<String, dynamic> json) {
  return DominantLanguage(
    languageCode: json['LanguageCode'] as String,
    score: (json['Score'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DominantLanguageDetectionJobFilterToJson(
    DominantLanguageDetectionJobFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobName', instance.jobName);
  writeNotNull('JobStatus', _$JobStatusEnumMap[instance.jobStatus]);
  writeNotNull('SubmitTimeAfter',
      const UnixDateTimeConverter().toJson(instance.submitTimeAfter));
  writeNotNull('SubmitTimeBefore',
      const UnixDateTimeConverter().toJson(instance.submitTimeBefore));
  return val;
}

DominantLanguageDetectionJobProperties
    _$DominantLanguageDetectionJobPropertiesFromJson(
        Map<String, dynamic> json) {
  return DominantLanguageDetectionJobProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    message: json['Message'] as String,
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EndpointFilterToJson(EndpointFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreationTimeAfter',
      const UnixDateTimeConverter().toJson(instance.creationTimeAfter));
  writeNotNull('CreationTimeBefore',
      const UnixDateTimeConverter().toJson(instance.creationTimeBefore));
  writeNotNull('ModelArn', instance.modelArn);
  writeNotNull('Status', _$EndpointStatusEnumMap[instance.status]);
  return val;
}

const _$EndpointStatusEnumMap = {
  EndpointStatus.creating: 'CREATING',
  EndpointStatus.deleting: 'DELETING',
  EndpointStatus.failed: 'FAILED',
  EndpointStatus.inService: 'IN_SERVICE',
  EndpointStatus.updating: 'UPDATING',
};

EndpointProperties _$EndpointPropertiesFromJson(Map<String, dynamic> json) {
  return EndpointProperties(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    currentInferenceUnits: json['CurrentInferenceUnits'] as int,
    desiredInferenceUnits: json['DesiredInferenceUnits'] as int,
    endpointArn: json['EndpointArn'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    message: json['Message'] as String,
    modelArn: json['ModelArn'] as String,
    status: _$enumDecodeNullable(_$EndpointStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$EntitiesDetectionJobFilterToJson(
    EntitiesDetectionJobFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobName', instance.jobName);
  writeNotNull('JobStatus', _$JobStatusEnumMap[instance.jobStatus]);
  writeNotNull('SubmitTimeAfter',
      const UnixDateTimeConverter().toJson(instance.submitTimeAfter));
  writeNotNull('SubmitTimeBefore',
      const UnixDateTimeConverter().toJson(instance.submitTimeBefore));
  return val;
}

EntitiesDetectionJobProperties _$EntitiesDetectionJobPropertiesFromJson(
    Map<String, dynamic> json) {
  return EntitiesDetectionJobProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    entityRecognizerArn: json['EntityRecognizerArn'] as String,
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    message: json['Message'] as String,
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return Entity(
    beginOffset: json['BeginOffset'] as int,
    endOffset: json['EndOffset'] as int,
    score: (json['Score'] as num)?.toDouble(),
    text: json['Text'] as String,
    type: _$enumDecodeNullable(_$EntityTypeEnumMap, json['Type']),
  );
}

const _$EntityTypeEnumMap = {
  EntityType.person: 'PERSON',
  EntityType.location: 'LOCATION',
  EntityType.organization: 'ORGANIZATION',
  EntityType.commercialItem: 'COMMERCIAL_ITEM',
  EntityType.event: 'EVENT',
  EntityType.date: 'DATE',
  EntityType.quantity: 'QUANTITY',
  EntityType.title: 'TITLE',
  EntityType.other: 'OTHER',
};

EntityRecognizerAnnotations _$EntityRecognizerAnnotationsFromJson(
    Map<String, dynamic> json) {
  return EntityRecognizerAnnotations(
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$EntityRecognizerAnnotationsToJson(
    EntityRecognizerAnnotations instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

EntityRecognizerDocuments _$EntityRecognizerDocumentsFromJson(
    Map<String, dynamic> json) {
  return EntityRecognizerDocuments(
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$EntityRecognizerDocumentsToJson(
    EntityRecognizerDocuments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

EntityRecognizerEntityList _$EntityRecognizerEntityListFromJson(
    Map<String, dynamic> json) {
  return EntityRecognizerEntityList(
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$EntityRecognizerEntityListToJson(
    EntityRecognizerEntityList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

EntityRecognizerEvaluationMetrics _$EntityRecognizerEvaluationMetricsFromJson(
    Map<String, dynamic> json) {
  return EntityRecognizerEvaluationMetrics(
    f1Score: (json['F1Score'] as num)?.toDouble(),
    precision: (json['Precision'] as num)?.toDouble(),
    recall: (json['Recall'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$EntityRecognizerFilterToJson(
    EntityRecognizerFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', _$ModelStatusEnumMap[instance.status]);
  writeNotNull('SubmitTimeAfter',
      const UnixDateTimeConverter().toJson(instance.submitTimeAfter));
  writeNotNull('SubmitTimeBefore',
      const UnixDateTimeConverter().toJson(instance.submitTimeBefore));
  return val;
}

EntityRecognizerInputDataConfig _$EntityRecognizerInputDataConfigFromJson(
    Map<String, dynamic> json) {
  return EntityRecognizerInputDataConfig(
    entityTypes: (json['EntityTypes'] as List)
        ?.map((e) => e == null
            ? null
            : EntityTypesListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    annotations: json['Annotations'] == null
        ? null
        : EntityRecognizerAnnotations.fromJson(
            json['Annotations'] as Map<String, dynamic>),
    augmentedManifests: (json['AugmentedManifests'] as List)
        ?.map((e) => e == null
            ? null
            : AugmentedManifestsListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dataFormat: _$enumDecodeNullable(
        _$EntityRecognizerDataFormatEnumMap, json['DataFormat']),
    documents: json['Documents'] == null
        ? null
        : EntityRecognizerDocuments.fromJson(
            json['Documents'] as Map<String, dynamic>),
    entityList: json['EntityList'] == null
        ? null
        : EntityRecognizerEntityList.fromJson(
            json['EntityList'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EntityRecognizerInputDataConfigToJson(
    EntityRecognizerInputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EntityTypes', instance.entityTypes?.map((e) => e?.toJson())?.toList());
  writeNotNull('Annotations', instance.annotations?.toJson());
  writeNotNull('AugmentedManifests',
      instance.augmentedManifests?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'DataFormat', _$EntityRecognizerDataFormatEnumMap[instance.dataFormat]);
  writeNotNull('Documents', instance.documents?.toJson());
  writeNotNull('EntityList', instance.entityList?.toJson());
  return val;
}

const _$EntityRecognizerDataFormatEnumMap = {
  EntityRecognizerDataFormat.comprehendCsv: 'COMPREHEND_CSV',
  EntityRecognizerDataFormat.augmentedManifest: 'AUGMENTED_MANIFEST',
};

EntityRecognizerMetadata _$EntityRecognizerMetadataFromJson(
    Map<String, dynamic> json) {
  return EntityRecognizerMetadata(
    entityTypes: (json['EntityTypes'] as List)
        ?.map((e) => e == null
            ? null
            : EntityRecognizerMetadataEntityTypesListItem.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    evaluationMetrics: json['EvaluationMetrics'] == null
        ? null
        : EntityRecognizerEvaluationMetrics.fromJson(
            json['EvaluationMetrics'] as Map<String, dynamic>),
    numberOfTestDocuments: json['NumberOfTestDocuments'] as int,
    numberOfTrainedDocuments: json['NumberOfTrainedDocuments'] as int,
  );
}

EntityRecognizerMetadataEntityTypesListItem
    _$EntityRecognizerMetadataEntityTypesListItemFromJson(
        Map<String, dynamic> json) {
  return EntityRecognizerMetadataEntityTypesListItem(
    evaluationMetrics: json['EvaluationMetrics'] == null
        ? null
        : EntityTypesEvaluationMetrics.fromJson(
            json['EvaluationMetrics'] as Map<String, dynamic>),
    numberOfTrainMentions: json['NumberOfTrainMentions'] as int,
    type: json['Type'] as String,
  );
}

EntityRecognizerProperties _$EntityRecognizerPropertiesFromJson(
    Map<String, dynamic> json) {
  return EntityRecognizerProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    entityRecognizerArn: json['EntityRecognizerArn'] as String,
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : EntityRecognizerInputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    message: json['Message'] as String,
    recognizerMetadata: json['RecognizerMetadata'] == null
        ? null
        : EntityRecognizerMetadata.fromJson(
            json['RecognizerMetadata'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ModelStatusEnumMap, json['Status']),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    trainingEndTime:
        const UnixDateTimeConverter().fromJson(json['TrainingEndTime']),
    trainingStartTime:
        const UnixDateTimeConverter().fromJson(json['TrainingStartTime']),
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

EntityTypesEvaluationMetrics _$EntityTypesEvaluationMetricsFromJson(
    Map<String, dynamic> json) {
  return EntityTypesEvaluationMetrics(
    f1Score: (json['F1Score'] as num)?.toDouble(),
    precision: (json['Precision'] as num)?.toDouble(),
    recall: (json['Recall'] as num)?.toDouble(),
  );
}

EntityTypesListItem _$EntityTypesListItemFromJson(Map<String, dynamic> json) {
  return EntityTypesListItem(
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$EntityTypesListItemToJson(EntityTypesListItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', instance.type);
  return val;
}

Map<String, dynamic> _$EventsDetectionJobFilterToJson(
    EventsDetectionJobFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobName', instance.jobName);
  writeNotNull('JobStatus', _$JobStatusEnumMap[instance.jobStatus]);
  writeNotNull('SubmitTimeAfter',
      const UnixDateTimeConverter().toJson(instance.submitTimeAfter));
  writeNotNull('SubmitTimeBefore',
      const UnixDateTimeConverter().toJson(instance.submitTimeBefore));
  return val;
}

EventsDetectionJobProperties _$EventsDetectionJobPropertiesFromJson(
    Map<String, dynamic> json) {
  return EventsDetectionJobProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    message: json['Message'] as String,
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    targetEventTypes:
        (json['TargetEventTypes'] as List)?.map((e) => e as String)?.toList(),
  );
}

InputDataConfig _$InputDataConfigFromJson(Map<String, dynamic> json) {
  return InputDataConfig(
    s3Uri: json['S3Uri'] as String,
    inputFormat:
        _$enumDecodeNullable(_$InputFormatEnumMap, json['InputFormat']),
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
  writeNotNull('InputFormat', _$InputFormatEnumMap[instance.inputFormat]);
  return val;
}

const _$InputFormatEnumMap = {
  InputFormat.oneDocPerFile: 'ONE_DOC_PER_FILE',
  InputFormat.oneDocPerLine: 'ONE_DOC_PER_LINE',
};

KeyPhrase _$KeyPhraseFromJson(Map<String, dynamic> json) {
  return KeyPhrase(
    beginOffset: json['BeginOffset'] as int,
    endOffset: json['EndOffset'] as int,
    score: (json['Score'] as num)?.toDouble(),
    text: json['Text'] as String,
  );
}

Map<String, dynamic> _$KeyPhrasesDetectionJobFilterToJson(
    KeyPhrasesDetectionJobFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobName', instance.jobName);
  writeNotNull('JobStatus', _$JobStatusEnumMap[instance.jobStatus]);
  writeNotNull('SubmitTimeAfter',
      const UnixDateTimeConverter().toJson(instance.submitTimeAfter));
  writeNotNull('SubmitTimeBefore',
      const UnixDateTimeConverter().toJson(instance.submitTimeBefore));
  return val;
}

KeyPhrasesDetectionJobProperties _$KeyPhrasesDetectionJobPropertiesFromJson(
    Map<String, dynamic> json) {
  return KeyPhrasesDetectionJobProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    message: json['Message'] as String,
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

ListDocumentClassificationJobsResponse
    _$ListDocumentClassificationJobsResponseFromJson(
        Map<String, dynamic> json) {
  return ListDocumentClassificationJobsResponse(
    documentClassificationJobPropertiesList:
        (json['DocumentClassificationJobPropertiesList'] as List)
            ?.map((e) => e == null
                ? null
                : DocumentClassificationJobProperties.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDocumentClassifiersResponse _$ListDocumentClassifiersResponseFromJson(
    Map<String, dynamic> json) {
  return ListDocumentClassifiersResponse(
    documentClassifierPropertiesList: (json['DocumentClassifierPropertiesList']
            as List)
        ?.map((e) => e == null
            ? null
            : DocumentClassifierProperties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDominantLanguageDetectionJobsResponse
    _$ListDominantLanguageDetectionJobsResponseFromJson(
        Map<String, dynamic> json) {
  return ListDominantLanguageDetectionJobsResponse(
    dominantLanguageDetectionJobPropertiesList:
        (json['DominantLanguageDetectionJobPropertiesList'] as List)
            ?.map((e) => e == null
                ? null
                : DominantLanguageDetectionJobProperties.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEndpointsResponse _$ListEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEndpointsResponse(
    endpointPropertiesList: (json['EndpointPropertiesList'] as List)
        ?.map((e) => e == null
            ? null
            : EndpointProperties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEntitiesDetectionJobsResponse _$ListEntitiesDetectionJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEntitiesDetectionJobsResponse(
    entitiesDetectionJobPropertiesList:
        (json['EntitiesDetectionJobPropertiesList'] as List)
            ?.map((e) => e == null
                ? null
                : EntitiesDetectionJobProperties.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEntityRecognizersResponse _$ListEntityRecognizersResponseFromJson(
    Map<String, dynamic> json) {
  return ListEntityRecognizersResponse(
    entityRecognizerPropertiesList: (json['EntityRecognizerPropertiesList']
            as List)
        ?.map((e) => e == null
            ? null
            : EntityRecognizerProperties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEventsDetectionJobsResponse _$ListEventsDetectionJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEventsDetectionJobsResponse(
    eventsDetectionJobPropertiesList: (json['EventsDetectionJobPropertiesList']
            as List)
        ?.map((e) => e == null
            ? null
            : EventsDetectionJobProperties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListKeyPhrasesDetectionJobsResponse
    _$ListKeyPhrasesDetectionJobsResponseFromJson(Map<String, dynamic> json) {
  return ListKeyPhrasesDetectionJobsResponse(
    keyPhrasesDetectionJobPropertiesList:
        (json['KeyPhrasesDetectionJobPropertiesList'] as List)
            ?.map((e) => e == null
                ? null
                : KeyPhrasesDetectionJobProperties.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPiiEntitiesDetectionJobsResponse
    _$ListPiiEntitiesDetectionJobsResponseFromJson(Map<String, dynamic> json) {
  return ListPiiEntitiesDetectionJobsResponse(
    nextToken: json['NextToken'] as String,
    piiEntitiesDetectionJobPropertiesList:
        (json['PiiEntitiesDetectionJobPropertiesList'] as List)
            ?.map((e) => e == null
                ? null
                : PiiEntitiesDetectionJobProperties.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

ListSentimentDetectionJobsResponse _$ListSentimentDetectionJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSentimentDetectionJobsResponse(
    nextToken: json['NextToken'] as String,
    sentimentDetectionJobPropertiesList:
        (json['SentimentDetectionJobPropertiesList'] as List)
            ?.map((e) => e == null
                ? null
                : SentimentDetectionJobProperties.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    resourceArn: json['ResourceArn'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTopicsDetectionJobsResponse _$ListTopicsDetectionJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTopicsDetectionJobsResponse(
    nextToken: json['NextToken'] as String,
    topicsDetectionJobPropertiesList: (json['TopicsDetectionJobPropertiesList']
            as List)
        ?.map((e) => e == null
            ? null
            : TopicsDetectionJobProperties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OutputDataConfig _$OutputDataConfigFromJson(Map<String, dynamic> json) {
  return OutputDataConfig(
    s3Uri: json['S3Uri'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
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
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

PartOfSpeechTag _$PartOfSpeechTagFromJson(Map<String, dynamic> json) {
  return PartOfSpeechTag(
    score: (json['Score'] as num)?.toDouble(),
    tag: _$enumDecodeNullable(_$PartOfSpeechTagTypeEnumMap, json['Tag']),
  );
}

const _$PartOfSpeechTagTypeEnumMap = {
  PartOfSpeechTagType.adj: 'ADJ',
  PartOfSpeechTagType.adp: 'ADP',
  PartOfSpeechTagType.adv: 'ADV',
  PartOfSpeechTagType.aux: 'AUX',
  PartOfSpeechTagType.conj: 'CONJ',
  PartOfSpeechTagType.cconj: 'CCONJ',
  PartOfSpeechTagType.det: 'DET',
  PartOfSpeechTagType.intj: 'INTJ',
  PartOfSpeechTagType.noun: 'NOUN',
  PartOfSpeechTagType.num: 'NUM',
  PartOfSpeechTagType.o: 'O',
  PartOfSpeechTagType.part: 'PART',
  PartOfSpeechTagType.pron: 'PRON',
  PartOfSpeechTagType.propn: 'PROPN',
  PartOfSpeechTagType.punct: 'PUNCT',
  PartOfSpeechTagType.sconj: 'SCONJ',
  PartOfSpeechTagType.sym: 'SYM',
  PartOfSpeechTagType.verb: 'VERB',
};

Map<String, dynamic> _$PiiEntitiesDetectionJobFilterToJson(
    PiiEntitiesDetectionJobFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobName', instance.jobName);
  writeNotNull('JobStatus', _$JobStatusEnumMap[instance.jobStatus]);
  writeNotNull('SubmitTimeAfter',
      const UnixDateTimeConverter().toJson(instance.submitTimeAfter));
  writeNotNull('SubmitTimeBefore',
      const UnixDateTimeConverter().toJson(instance.submitTimeBefore));
  return val;
}

PiiEntitiesDetectionJobProperties _$PiiEntitiesDetectionJobPropertiesFromJson(
    Map<String, dynamic> json) {
  return PiiEntitiesDetectionJobProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    message: json['Message'] as String,
    mode: _$enumDecodeNullable(_$PiiEntitiesDetectionModeEnumMap, json['Mode']),
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : PiiOutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    redactionConfig: json['RedactionConfig'] == null
        ? null
        : RedactionConfig.fromJson(
            json['RedactionConfig'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
  );
}

const _$PiiEntitiesDetectionModeEnumMap = {
  PiiEntitiesDetectionMode.onlyRedaction: 'ONLY_REDACTION',
  PiiEntitiesDetectionMode.onlyOffsets: 'ONLY_OFFSETS',
};

PiiEntity _$PiiEntityFromJson(Map<String, dynamic> json) {
  return PiiEntity(
    beginOffset: json['BeginOffset'] as int,
    endOffset: json['EndOffset'] as int,
    score: (json['Score'] as num)?.toDouble(),
    type: _$enumDecodeNullable(_$PiiEntityTypeEnumMap, json['Type']),
  );
}

const _$PiiEntityTypeEnumMap = {
  PiiEntityType.bankAccountNumber: 'BANK_ACCOUNT_NUMBER',
  PiiEntityType.bankRouting: 'BANK_ROUTING',
  PiiEntityType.creditDebitNumber: 'CREDIT_DEBIT_NUMBER',
  PiiEntityType.creditDebitCvv: 'CREDIT_DEBIT_CVV',
  PiiEntityType.creditDebitExpiry: 'CREDIT_DEBIT_EXPIRY',
  PiiEntityType.pin: 'PIN',
  PiiEntityType.email: 'EMAIL',
  PiiEntityType.address: 'ADDRESS',
  PiiEntityType.name: 'NAME',
  PiiEntityType.phone: 'PHONE',
  PiiEntityType.ssn: 'SSN',
  PiiEntityType.dateTime: 'DATE_TIME',
  PiiEntityType.passportNumber: 'PASSPORT_NUMBER',
  PiiEntityType.driverId: 'DRIVER_ID',
  PiiEntityType.url: 'URL',
  PiiEntityType.age: 'AGE',
  PiiEntityType.username: 'USERNAME',
  PiiEntityType.password: 'PASSWORD',
  PiiEntityType.awsAccessKey: 'AWS_ACCESS_KEY',
  PiiEntityType.awsSecretKey: 'AWS_SECRET_KEY',
  PiiEntityType.ipAddress: 'IP_ADDRESS',
  PiiEntityType.macAddress: 'MAC_ADDRESS',
  PiiEntityType.all: 'ALL',
};

PiiOutputDataConfig _$PiiOutputDataConfigFromJson(Map<String, dynamic> json) {
  return PiiOutputDataConfig(
    s3Uri: json['S3Uri'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

RedactionConfig _$RedactionConfigFromJson(Map<String, dynamic> json) {
  return RedactionConfig(
    maskCharacter: json['MaskCharacter'] as String,
    maskMode: _$enumDecodeNullable(
        _$PiiEntitiesDetectionMaskModeEnumMap, json['MaskMode']),
    piiEntityTypes: (json['PiiEntityTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PiiEntityTypeEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$RedactionConfigToJson(RedactionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaskCharacter', instance.maskCharacter);
  writeNotNull(
      'MaskMode', _$PiiEntitiesDetectionMaskModeEnumMap[instance.maskMode]);
  writeNotNull('PiiEntityTypes',
      instance.piiEntityTypes?.map((e) => _$PiiEntityTypeEnumMap[e])?.toList());
  return val;
}

const _$PiiEntitiesDetectionMaskModeEnumMap = {
  PiiEntitiesDetectionMaskMode.mask: 'MASK',
  PiiEntitiesDetectionMaskMode.replaceWithPiiEntityType:
      'REPLACE_WITH_PII_ENTITY_TYPE',
};

Map<String, dynamic> _$SentimentDetectionJobFilterToJson(
    SentimentDetectionJobFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobName', instance.jobName);
  writeNotNull('JobStatus', _$JobStatusEnumMap[instance.jobStatus]);
  writeNotNull('SubmitTimeAfter',
      const UnixDateTimeConverter().toJson(instance.submitTimeAfter));
  writeNotNull('SubmitTimeBefore',
      const UnixDateTimeConverter().toJson(instance.submitTimeBefore));
  return val;
}

SentimentDetectionJobProperties _$SentimentDetectionJobPropertiesFromJson(
    Map<String, dynamic> json) {
  return SentimentDetectionJobProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    message: json['Message'] as String,
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

SentimentScore _$SentimentScoreFromJson(Map<String, dynamic> json) {
  return SentimentScore(
    mixed: (json['Mixed'] as num)?.toDouble(),
    negative: (json['Negative'] as num)?.toDouble(),
    neutral: (json['Neutral'] as num)?.toDouble(),
    positive: (json['Positive'] as num)?.toDouble(),
  );
}

StartDocumentClassificationJobResponse
    _$StartDocumentClassificationJobResponseFromJson(
        Map<String, dynamic> json) {
  return StartDocumentClassificationJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StartDominantLanguageDetectionJobResponse
    _$StartDominantLanguageDetectionJobResponseFromJson(
        Map<String, dynamic> json) {
  return StartDominantLanguageDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StartEntitiesDetectionJobResponse _$StartEntitiesDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartEntitiesDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StartEventsDetectionJobResponse _$StartEventsDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartEventsDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StartKeyPhrasesDetectionJobResponse
    _$StartKeyPhrasesDetectionJobResponseFromJson(Map<String, dynamic> json) {
  return StartKeyPhrasesDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StartPiiEntitiesDetectionJobResponse
    _$StartPiiEntitiesDetectionJobResponseFromJson(Map<String, dynamic> json) {
  return StartPiiEntitiesDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StartSentimentDetectionJobResponse _$StartSentimentDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartSentimentDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StartTopicsDetectionJobResponse _$StartTopicsDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartTopicsDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StopDominantLanguageDetectionJobResponse
    _$StopDominantLanguageDetectionJobResponseFromJson(
        Map<String, dynamic> json) {
  return StopDominantLanguageDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StopEntitiesDetectionJobResponse _$StopEntitiesDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StopEntitiesDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StopEventsDetectionJobResponse _$StopEventsDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StopEventsDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StopKeyPhrasesDetectionJobResponse _$StopKeyPhrasesDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StopKeyPhrasesDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StopPiiEntitiesDetectionJobResponse
    _$StopPiiEntitiesDetectionJobResponseFromJson(Map<String, dynamic> json) {
  return StopPiiEntitiesDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StopSentimentDetectionJobResponse _$StopSentimentDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StopSentimentDetectionJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

StopTrainingDocumentClassifierResponse
    _$StopTrainingDocumentClassifierResponseFromJson(
        Map<String, dynamic> json) {
  return StopTrainingDocumentClassifierResponse();
}

StopTrainingEntityRecognizerResponse
    _$StopTrainingEntityRecognizerResponseFromJson(Map<String, dynamic> json) {
  return StopTrainingEntityRecognizerResponse();
}

SyntaxToken _$SyntaxTokenFromJson(Map<String, dynamic> json) {
  return SyntaxToken(
    beginOffset: json['BeginOffset'] as int,
    endOffset: json['EndOffset'] as int,
    partOfSpeech: json['PartOfSpeech'] == null
        ? null
        : PartOfSpeechTag.fromJson(
            json['PartOfSpeech'] as Map<String, dynamic>),
    text: json['Text'] as String,
    tokenId: json['TokenId'] as int,
  );
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$TopicsDetectionJobFilterToJson(
    TopicsDetectionJobFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobName', instance.jobName);
  writeNotNull('JobStatus', _$JobStatusEnumMap[instance.jobStatus]);
  writeNotNull('SubmitTimeAfter',
      const UnixDateTimeConverter().toJson(instance.submitTimeAfter));
  writeNotNull('SubmitTimeBefore',
      const UnixDateTimeConverter().toJson(instance.submitTimeBefore));
  return val;
}

TopicsDetectionJobProperties _$TopicsDetectionJobPropertiesFromJson(
    Map<String, dynamic> json) {
  return TopicsDetectionJobProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    message: json['Message'] as String,
    numberOfTopics: json['NumberOfTopics'] as int,
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateEndpointResponse _$UpdateEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEndpointResponse();
}

VpcConfig _$VpcConfigFromJson(Map<String, dynamic> json) {
  return VpcConfig(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnets: (json['Subnets'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$VpcConfigToJson(VpcConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('Subnets', instance.subnets);
  return val;
}
