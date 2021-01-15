// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-10-26.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentRedaction _$ContentRedactionFromJson(Map<String, dynamic> json) {
  return ContentRedaction(
    redactionOutput:
        _$enumDecodeNullable(_$RedactionOutputEnumMap, json['RedactionOutput']),
    redactionType:
        _$enumDecodeNullable(_$RedactionTypeEnumMap, json['RedactionType']),
  );
}

Map<String, dynamic> _$ContentRedactionToJson(ContentRedaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'RedactionOutput', _$RedactionOutputEnumMap[instance.redactionOutput]);
  writeNotNull('RedactionType', _$RedactionTypeEnumMap[instance.redactionType]);
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

const _$RedactionOutputEnumMap = {
  RedactionOutput.redacted: 'redacted',
  RedactionOutput.redactedAndUnredacted: 'redacted_and_unredacted',
};

const _$RedactionTypeEnumMap = {
  RedactionType.pii: 'PII',
};

CreateLanguageModelResponse _$CreateLanguageModelResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLanguageModelResponse(
    baseModelName:
        _$enumDecodeNullable(_$BaseModelNameEnumMap, json['BaseModelName']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    languageCode:
        _$enumDecodeNullable(_$CLMLanguageCodeEnumMap, json['LanguageCode']),
    modelName: json['ModelName'] as String,
    modelStatus:
        _$enumDecodeNullable(_$ModelStatusEnumMap, json['ModelStatus']),
  );
}

const _$BaseModelNameEnumMap = {
  BaseModelName.narrowBand: 'NarrowBand',
  BaseModelName.wideBand: 'WideBand',
};

const _$CLMLanguageCodeEnumMap = {
  CLMLanguageCode.enUs: 'en-US',
};

const _$ModelStatusEnumMap = {
  ModelStatus.inProgress: 'IN_PROGRESS',
  ModelStatus.failed: 'FAILED',
  ModelStatus.completed: 'COMPLETED',
};

CreateMedicalVocabularyResponse _$CreateMedicalVocabularyResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMedicalVocabularyResponse(
    failureReason: json['FailureReason'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
}

const _$LanguageCodeEnumMap = {
  LanguageCode.afZa: 'af-ZA',
  LanguageCode.arAe: 'ar-AE',
  LanguageCode.arSa: 'ar-SA',
  LanguageCode.cyGb: 'cy-GB',
  LanguageCode.daDk: 'da-DK',
  LanguageCode.deCh: 'de-CH',
  LanguageCode.deDe: 'de-DE',
  LanguageCode.enAb: 'en-AB',
  LanguageCode.enAu: 'en-AU',
  LanguageCode.enGb: 'en-GB',
  LanguageCode.enIe: 'en-IE',
  LanguageCode.enIn: 'en-IN',
  LanguageCode.enUs: 'en-US',
  LanguageCode.enWl: 'en-WL',
  LanguageCode.esEs: 'es-ES',
  LanguageCode.esUs: 'es-US',
  LanguageCode.faIr: 'fa-IR',
  LanguageCode.frCa: 'fr-CA',
  LanguageCode.frFr: 'fr-FR',
  LanguageCode.gaIe: 'ga-IE',
  LanguageCode.gdGb: 'gd-GB',
  LanguageCode.heIl: 'he-IL',
  LanguageCode.hiIn: 'hi-IN',
  LanguageCode.idId: 'id-ID',
  LanguageCode.itIt: 'it-IT',
  LanguageCode.jaJp: 'ja-JP',
  LanguageCode.koKr: 'ko-KR',
  LanguageCode.msMy: 'ms-MY',
  LanguageCode.nlNl: 'nl-NL',
  LanguageCode.ptBr: 'pt-BR',
  LanguageCode.ptPt: 'pt-PT',
  LanguageCode.ruRu: 'ru-RU',
  LanguageCode.taIn: 'ta-IN',
  LanguageCode.teIn: 'te-IN',
  LanguageCode.trTr: 'tr-TR',
  LanguageCode.zhCn: 'zh-CN',
};

const _$VocabularyStateEnumMap = {
  VocabularyState.pending: 'PENDING',
  VocabularyState.ready: 'READY',
  VocabularyState.failed: 'FAILED',
};

CreateVocabularyFilterResponse _$CreateVocabularyFilterResponseFromJson(
    Map<String, dynamic> json) {
  return CreateVocabularyFilterResponse(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyFilterName: json['VocabularyFilterName'] as String,
  );
}

CreateVocabularyResponse _$CreateVocabularyResponseFromJson(
    Map<String, dynamic> json) {
  return CreateVocabularyResponse(
    failureReason: json['FailureReason'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
}

DescribeLanguageModelResponse _$DescribeLanguageModelResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLanguageModelResponse(
    languageModel: json['LanguageModel'] == null
        ? null
        : LanguageModel.fromJson(json['LanguageModel'] as Map<String, dynamic>),
  );
}

GetMedicalTranscriptionJobResponse _$GetMedicalTranscriptionJobResponseFromJson(
    Map<String, dynamic> json) {
  return GetMedicalTranscriptionJobResponse(
    medicalTranscriptionJob: json['MedicalTranscriptionJob'] == null
        ? null
        : MedicalTranscriptionJob.fromJson(
            json['MedicalTranscriptionJob'] as Map<String, dynamic>),
  );
}

GetMedicalVocabularyResponse _$GetMedicalVocabularyResponseFromJson(
    Map<String, dynamic> json) {
  return GetMedicalVocabularyResponse(
    downloadUri: json['DownloadUri'] as String,
    failureReason: json['FailureReason'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
}

GetTranscriptionJobResponse _$GetTranscriptionJobResponseFromJson(
    Map<String, dynamic> json) {
  return GetTranscriptionJobResponse(
    transcriptionJob: json['TranscriptionJob'] == null
        ? null
        : TranscriptionJob.fromJson(
            json['TranscriptionJob'] as Map<String, dynamic>),
  );
}

GetVocabularyFilterResponse _$GetVocabularyFilterResponseFromJson(
    Map<String, dynamic> json) {
  return GetVocabularyFilterResponse(
    downloadUri: json['DownloadUri'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyFilterName: json['VocabularyFilterName'] as String,
  );
}

GetVocabularyResponse _$GetVocabularyResponseFromJson(
    Map<String, dynamic> json) {
  return GetVocabularyResponse(
    downloadUri: json['DownloadUri'] as String,
    failureReason: json['FailureReason'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
}

InputDataConfig _$InputDataConfigFromJson(Map<String, dynamic> json) {
  return InputDataConfig(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    s3Uri: json['S3Uri'] as String,
    tuningDataS3Uri: json['TuningDataS3Uri'] as String,
  );
}

Map<String, dynamic> _$InputDataConfigToJson(InputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataAccessRoleArn', instance.dataAccessRoleArn);
  writeNotNull('S3Uri', instance.s3Uri);
  writeNotNull('TuningDataS3Uri', instance.tuningDataS3Uri);
  return val;
}

JobExecutionSettings _$JobExecutionSettingsFromJson(Map<String, dynamic> json) {
  return JobExecutionSettings(
    allowDeferredExecution: json['AllowDeferredExecution'] as bool,
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
  );
}

Map<String, dynamic> _$JobExecutionSettingsToJson(
    JobExecutionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowDeferredExecution', instance.allowDeferredExecution);
  writeNotNull('DataAccessRoleArn', instance.dataAccessRoleArn);
  return val;
}

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) {
  return LanguageModel(
    baseModelName:
        _$enumDecodeNullable(_$BaseModelNameEnumMap, json['BaseModelName']),
    createTime: const UnixDateTimeConverter().fromJson(json['CreateTime']),
    failureReason: json['FailureReason'] as String,
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    languageCode:
        _$enumDecodeNullable(_$CLMLanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    modelName: json['ModelName'] as String,
    modelStatus:
        _$enumDecodeNullable(_$ModelStatusEnumMap, json['ModelStatus']),
    upgradeAvailability: json['UpgradeAvailability'] as bool,
  );
}

ListLanguageModelsResponse _$ListLanguageModelsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLanguageModelsResponse(
    models: (json['Models'] as List)
        ?.map((e) => e == null
            ? null
            : LanguageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMedicalTranscriptionJobsResponse
    _$ListMedicalTranscriptionJobsResponseFromJson(Map<String, dynamic> json) {
  return ListMedicalTranscriptionJobsResponse(
    medicalTranscriptionJobSummaries:
        (json['MedicalTranscriptionJobSummaries'] as List)
            ?.map((e) => e == null
                ? null
                : MedicalTranscriptionJobSummary.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
    status:
        _$enumDecodeNullable(_$TranscriptionJobStatusEnumMap, json['Status']),
  );
}

const _$TranscriptionJobStatusEnumMap = {
  TranscriptionJobStatus.queued: 'QUEUED',
  TranscriptionJobStatus.inProgress: 'IN_PROGRESS',
  TranscriptionJobStatus.failed: 'FAILED',
  TranscriptionJobStatus.completed: 'COMPLETED',
};

ListMedicalVocabulariesResponse _$ListMedicalVocabulariesResponseFromJson(
    Map<String, dynamic> json) {
  return ListMedicalVocabulariesResponse(
    nextToken: json['NextToken'] as String,
    status: _$enumDecodeNullable(_$VocabularyStateEnumMap, json['Status']),
    vocabularies: (json['Vocabularies'] as List)
        ?.map((e) => e == null
            ? null
            : VocabularyInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTranscriptionJobsResponse _$ListTranscriptionJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTranscriptionJobsResponse(
    nextToken: json['NextToken'] as String,
    status:
        _$enumDecodeNullable(_$TranscriptionJobStatusEnumMap, json['Status']),
    transcriptionJobSummaries: (json['TranscriptionJobSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : TranscriptionJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListVocabulariesResponse _$ListVocabulariesResponseFromJson(
    Map<String, dynamic> json) {
  return ListVocabulariesResponse(
    nextToken: json['NextToken'] as String,
    status: _$enumDecodeNullable(_$VocabularyStateEnumMap, json['Status']),
    vocabularies: (json['Vocabularies'] as List)
        ?.map((e) => e == null
            ? null
            : VocabularyInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListVocabularyFiltersResponse _$ListVocabularyFiltersResponseFromJson(
    Map<String, dynamic> json) {
  return ListVocabularyFiltersResponse(
    nextToken: json['NextToken'] as String,
    vocabularyFilters: (json['VocabularyFilters'] as List)
        ?.map((e) => e == null
            ? null
            : VocabularyFilterInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    mediaFileUri: json['MediaFileUri'] as String,
  );
}

Map<String, dynamic> _$MediaToJson(Media instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MediaFileUri', instance.mediaFileUri);
  return val;
}

MedicalTranscript _$MedicalTranscriptFromJson(Map<String, dynamic> json) {
  return MedicalTranscript(
    transcriptFileUri: json['TranscriptFileUri'] as String,
  );
}

MedicalTranscriptionJob _$MedicalTranscriptionJobFromJson(
    Map<String, dynamic> json) {
  return MedicalTranscriptionJob(
    completionTime:
        const UnixDateTimeConverter().fromJson(json['CompletionTime']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    media: json['Media'] == null
        ? null
        : Media.fromJson(json['Media'] as Map<String, dynamic>),
    mediaFormat:
        _$enumDecodeNullable(_$MediaFormatEnumMap, json['MediaFormat']),
    mediaSampleRateHertz: json['MediaSampleRateHertz'] as int,
    medicalTranscriptionJobName: json['MedicalTranscriptionJobName'] as String,
    settings: json['Settings'] == null
        ? null
        : MedicalTranscriptionSetting.fromJson(
            json['Settings'] as Map<String, dynamic>),
    specialty: _$enumDecodeNullable(_$SpecialtyEnumMap, json['Specialty']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    transcript: json['Transcript'] == null
        ? null
        : MedicalTranscript.fromJson(
            json['Transcript'] as Map<String, dynamic>),
    transcriptionJobStatus: _$enumDecodeNullable(
        _$TranscriptionJobStatusEnumMap, json['TranscriptionJobStatus']),
    type: _$enumDecodeNullable(_$TypeEnumMap, json['Type']),
  );
}

const _$MediaFormatEnumMap = {
  MediaFormat.mp3: 'mp3',
  MediaFormat.mp4: 'mp4',
  MediaFormat.wav: 'wav',
  MediaFormat.flac: 'flac',
  MediaFormat.ogg: 'ogg',
  MediaFormat.amr: 'amr',
  MediaFormat.webm: 'webm',
};

const _$SpecialtyEnumMap = {
  Specialty.primarycare: 'PRIMARYCARE',
};

const _$TypeEnumMap = {
  Type.conversation: 'CONVERSATION',
  Type.dictation: 'DICTATION',
};

MedicalTranscriptionJobSummary _$MedicalTranscriptionJobSummaryFromJson(
    Map<String, dynamic> json) {
  return MedicalTranscriptionJobSummary(
    completionTime:
        const UnixDateTimeConverter().fromJson(json['CompletionTime']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    medicalTranscriptionJobName: json['MedicalTranscriptionJobName'] as String,
    outputLocationType: _$enumDecodeNullable(
        _$OutputLocationTypeEnumMap, json['OutputLocationType']),
    specialty: _$enumDecodeNullable(_$SpecialtyEnumMap, json['Specialty']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    transcriptionJobStatus: _$enumDecodeNullable(
        _$TranscriptionJobStatusEnumMap, json['TranscriptionJobStatus']),
    type: _$enumDecodeNullable(_$TypeEnumMap, json['Type']),
  );
}

const _$OutputLocationTypeEnumMap = {
  OutputLocationType.customerBucket: 'CUSTOMER_BUCKET',
  OutputLocationType.serviceBucket: 'SERVICE_BUCKET',
};

MedicalTranscriptionSetting _$MedicalTranscriptionSettingFromJson(
    Map<String, dynamic> json) {
  return MedicalTranscriptionSetting(
    channelIdentification: json['ChannelIdentification'] as bool,
    maxAlternatives: json['MaxAlternatives'] as int,
    maxSpeakerLabels: json['MaxSpeakerLabels'] as int,
    showAlternatives: json['ShowAlternatives'] as bool,
    showSpeakerLabels: json['ShowSpeakerLabels'] as bool,
    vocabularyName: json['VocabularyName'] as String,
  );
}

Map<String, dynamic> _$MedicalTranscriptionSettingToJson(
    MedicalTranscriptionSetting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelIdentification', instance.channelIdentification);
  writeNotNull('MaxAlternatives', instance.maxAlternatives);
  writeNotNull('MaxSpeakerLabels', instance.maxSpeakerLabels);
  writeNotNull('ShowAlternatives', instance.showAlternatives);
  writeNotNull('ShowSpeakerLabels', instance.showSpeakerLabels);
  writeNotNull('VocabularyName', instance.vocabularyName);
  return val;
}

ModelSettings _$ModelSettingsFromJson(Map<String, dynamic> json) {
  return ModelSettings(
    languageModelName: json['LanguageModelName'] as String,
  );
}

Map<String, dynamic> _$ModelSettingsToJson(ModelSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LanguageModelName', instance.languageModelName);
  return val;
}

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return Settings(
    channelIdentification: json['ChannelIdentification'] as bool,
    maxAlternatives: json['MaxAlternatives'] as int,
    maxSpeakerLabels: json['MaxSpeakerLabels'] as int,
    showAlternatives: json['ShowAlternatives'] as bool,
    showSpeakerLabels: json['ShowSpeakerLabels'] as bool,
    vocabularyFilterMethod: _$enumDecodeNullable(
        _$VocabularyFilterMethodEnumMap, json['VocabularyFilterMethod']),
    vocabularyFilterName: json['VocabularyFilterName'] as String,
    vocabularyName: json['VocabularyName'] as String,
  );
}

Map<String, dynamic> _$SettingsToJson(Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelIdentification', instance.channelIdentification);
  writeNotNull('MaxAlternatives', instance.maxAlternatives);
  writeNotNull('MaxSpeakerLabels', instance.maxSpeakerLabels);
  writeNotNull('ShowAlternatives', instance.showAlternatives);
  writeNotNull('ShowSpeakerLabels', instance.showSpeakerLabels);
  writeNotNull('VocabularyFilterMethod',
      _$VocabularyFilterMethodEnumMap[instance.vocabularyFilterMethod]);
  writeNotNull('VocabularyFilterName', instance.vocabularyFilterName);
  writeNotNull('VocabularyName', instance.vocabularyName);
  return val;
}

const _$VocabularyFilterMethodEnumMap = {
  VocabularyFilterMethod.remove: 'remove',
  VocabularyFilterMethod.mask: 'mask',
};

StartMedicalTranscriptionJobResponse
    _$StartMedicalTranscriptionJobResponseFromJson(Map<String, dynamic> json) {
  return StartMedicalTranscriptionJobResponse(
    medicalTranscriptionJob: json['MedicalTranscriptionJob'] == null
        ? null
        : MedicalTranscriptionJob.fromJson(
            json['MedicalTranscriptionJob'] as Map<String, dynamic>),
  );
}

StartTranscriptionJobResponse _$StartTranscriptionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartTranscriptionJobResponse(
    transcriptionJob: json['TranscriptionJob'] == null
        ? null
        : TranscriptionJob.fromJson(
            json['TranscriptionJob'] as Map<String, dynamic>),
  );
}

Transcript _$TranscriptFromJson(Map<String, dynamic> json) {
  return Transcript(
    redactedTranscriptFileUri: json['RedactedTranscriptFileUri'] as String,
    transcriptFileUri: json['TranscriptFileUri'] as String,
  );
}

TranscriptionJob _$TranscriptionJobFromJson(Map<String, dynamic> json) {
  return TranscriptionJob(
    completionTime:
        const UnixDateTimeConverter().fromJson(json['CompletionTime']),
    contentRedaction: json['ContentRedaction'] == null
        ? null
        : ContentRedaction.fromJson(
            json['ContentRedaction'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String,
    identifiedLanguageScore:
        (json['IdentifiedLanguageScore'] as num)?.toDouble(),
    identifyLanguage: json['IdentifyLanguage'] as bool,
    jobExecutionSettings: json['JobExecutionSettings'] == null
        ? null
        : JobExecutionSettings.fromJson(
            json['JobExecutionSettings'] as Map<String, dynamic>),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    languageOptions: (json['LanguageOptions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$LanguageCodeEnumMap, e))
        ?.toList(),
    media: json['Media'] == null
        ? null
        : Media.fromJson(json['Media'] as Map<String, dynamic>),
    mediaFormat:
        _$enumDecodeNullable(_$MediaFormatEnumMap, json['MediaFormat']),
    mediaSampleRateHertz: json['MediaSampleRateHertz'] as int,
    modelSettings: json['ModelSettings'] == null
        ? null
        : ModelSettings.fromJson(json['ModelSettings'] as Map<String, dynamic>),
    settings: json['Settings'] == null
        ? null
        : Settings.fromJson(json['Settings'] as Map<String, dynamic>),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    transcript: json['Transcript'] == null
        ? null
        : Transcript.fromJson(json['Transcript'] as Map<String, dynamic>),
    transcriptionJobName: json['TranscriptionJobName'] as String,
    transcriptionJobStatus: _$enumDecodeNullable(
        _$TranscriptionJobStatusEnumMap, json['TranscriptionJobStatus']),
  );
}

TranscriptionJobSummary _$TranscriptionJobSummaryFromJson(
    Map<String, dynamic> json) {
  return TranscriptionJobSummary(
    completionTime:
        const UnixDateTimeConverter().fromJson(json['CompletionTime']),
    contentRedaction: json['ContentRedaction'] == null
        ? null
        : ContentRedaction.fromJson(
            json['ContentRedaction'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String,
    identifiedLanguageScore:
        (json['IdentifiedLanguageScore'] as num)?.toDouble(),
    identifyLanguage: json['IdentifyLanguage'] as bool,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    modelSettings: json['ModelSettings'] == null
        ? null
        : ModelSettings.fromJson(json['ModelSettings'] as Map<String, dynamic>),
    outputLocationType: _$enumDecodeNullable(
        _$OutputLocationTypeEnumMap, json['OutputLocationType']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    transcriptionJobName: json['TranscriptionJobName'] as String,
    transcriptionJobStatus: _$enumDecodeNullable(
        _$TranscriptionJobStatusEnumMap, json['TranscriptionJobStatus']),
  );
}

UpdateMedicalVocabularyResponse _$UpdateMedicalVocabularyResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMedicalVocabularyResponse(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
}

UpdateVocabularyFilterResponse _$UpdateVocabularyFilterResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateVocabularyFilterResponse(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyFilterName: json['VocabularyFilterName'] as String,
  );
}

UpdateVocabularyResponse _$UpdateVocabularyResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateVocabularyResponse(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
}

VocabularyFilterInfo _$VocabularyFilterInfoFromJson(Map<String, dynamic> json) {
  return VocabularyFilterInfo(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyFilterName: json['VocabularyFilterName'] as String,
  );
}

VocabularyInfo _$VocabularyInfoFromJson(Map<String, dynamic> json) {
  return VocabularyInfo(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
}
