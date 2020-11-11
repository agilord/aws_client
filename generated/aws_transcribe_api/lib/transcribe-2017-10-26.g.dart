// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcribe-2017-10-26.dart';

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

Map<String, dynamic> _$CreateVocabularyFilterRequestToJson(
    CreateVocabularyFilterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LanguageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('VocabularyFilterName', instance.vocabularyFilterName);
  writeNotNull('VocabularyFilterFileUri', instance.vocabularyFilterFileUri);
  writeNotNull('Words', instance.words);
  return val;
}

const _$LanguageCodeEnumMap = {
  LanguageCode.enUs: 'en-US',
  LanguageCode.esUs: 'es-US',
  LanguageCode.enAu: 'en-AU',
  LanguageCode.frCa: 'fr-CA',
  LanguageCode.enGb: 'en-GB',
  LanguageCode.deDe: 'de-DE',
  LanguageCode.ptBr: 'pt-BR',
  LanguageCode.frFr: 'fr-FR',
  LanguageCode.itIt: 'it-IT',
  LanguageCode.koKr: 'ko-KR',
  LanguageCode.esEs: 'es-ES',
  LanguageCode.enIn: 'en-IN',
  LanguageCode.hiIn: 'hi-IN',
  LanguageCode.arSa: 'ar-SA',
  LanguageCode.ruRu: 'ru-RU',
  LanguageCode.zhCn: 'zh-CN',
  LanguageCode.nlNl: 'nl-NL',
  LanguageCode.idId: 'id-ID',
  LanguageCode.taIn: 'ta-IN',
  LanguageCode.faIr: 'fa-IR',
  LanguageCode.enIe: 'en-IE',
  LanguageCode.enAb: 'en-AB',
  LanguageCode.enWl: 'en-WL',
  LanguageCode.ptPt: 'pt-PT',
  LanguageCode.teIn: 'te-IN',
  LanguageCode.trTr: 'tr-TR',
  LanguageCode.deCh: 'de-CH',
  LanguageCode.heIl: 'he-IL',
  LanguageCode.msMy: 'ms-MY',
  LanguageCode.jaJp: 'ja-JP',
  LanguageCode.arAe: 'ar-AE',
};

CreateVocabularyFilterResponse _$CreateVocabularyFilterResponseFromJson(
    Map<String, dynamic> json) {
  return CreateVocabularyFilterResponse(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime: unixTimestampFromJson(json['LastModifiedTime']),
    vocabularyFilterName: json['VocabularyFilterName'] as String,
  );
}

Map<String, dynamic> _$CreateVocabularyRequestToJson(
    CreateVocabularyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LanguageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('VocabularyName', instance.vocabularyName);
  writeNotNull('Phrases', instance.phrases);
  writeNotNull('VocabularyFileUri', instance.vocabularyFileUri);
  return val;
}

CreateVocabularyResponse _$CreateVocabularyResponseFromJson(
    Map<String, dynamic> json) {
  return CreateVocabularyResponse(
    failureReason: json['FailureReason'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime: unixTimestampFromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
}

const _$VocabularyStateEnumMap = {
  VocabularyState.pending: 'PENDING',
  VocabularyState.ready: 'READY',
  VocabularyState.failed: 'FAILED',
};

Map<String, dynamic> _$DeleteMedicalTranscriptionJobRequestToJson(
    DeleteMedicalTranscriptionJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'MedicalTranscriptionJobName', instance.medicalTranscriptionJobName);
  return val;
}

Map<String, dynamic> _$DeleteTranscriptionJobRequestToJson(
    DeleteTranscriptionJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TranscriptionJobName', instance.transcriptionJobName);
  return val;
}

Map<String, dynamic> _$DeleteVocabularyFilterRequestToJson(
    DeleteVocabularyFilterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VocabularyFilterName', instance.vocabularyFilterName);
  return val;
}

Map<String, dynamic> _$DeleteVocabularyRequestToJson(
    DeleteVocabularyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VocabularyName', instance.vocabularyName);
  return val;
}

Map<String, dynamic> _$GetMedicalTranscriptionJobRequestToJson(
    GetMedicalTranscriptionJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'MedicalTranscriptionJobName', instance.medicalTranscriptionJobName);
  return val;
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

Map<String, dynamic> _$GetTranscriptionJobRequestToJson(
    GetTranscriptionJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TranscriptionJobName', instance.transcriptionJobName);
  return val;
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

Map<String, dynamic> _$GetVocabularyFilterRequestToJson(
    GetVocabularyFilterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VocabularyFilterName', instance.vocabularyFilterName);
  return val;
}

GetVocabularyFilterResponse _$GetVocabularyFilterResponseFromJson(
    Map<String, dynamic> json) {
  return GetVocabularyFilterResponse(
    downloadUri: json['DownloadUri'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime: unixTimestampFromJson(json['LastModifiedTime']),
    vocabularyFilterName: json['VocabularyFilterName'] as String,
  );
}

Map<String, dynamic> _$GetVocabularyRequestToJson(
    GetVocabularyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VocabularyName', instance.vocabularyName);
  return val;
}

GetVocabularyResponse _$GetVocabularyResponseFromJson(
    Map<String, dynamic> json) {
  return GetVocabularyResponse(
    downloadUri: json['DownloadUri'] as String,
    failureReason: json['FailureReason'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime: unixTimestampFromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
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

Map<String, dynamic> _$ListMedicalTranscriptionJobsRequestToJson(
    ListMedicalTranscriptionJobsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobNameContains', instance.jobNameContains);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Status', _$TranscriptionJobStatusEnumMap[instance.status]);
  return val;
}

const _$TranscriptionJobStatusEnumMap = {
  TranscriptionJobStatus.queued: 'QUEUED',
  TranscriptionJobStatus.inProgress: 'IN_PROGRESS',
  TranscriptionJobStatus.failed: 'FAILED',
  TranscriptionJobStatus.completed: 'COMPLETED',
};

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

Map<String, dynamic> _$ListTranscriptionJobsRequestToJson(
    ListTranscriptionJobsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobNameContains', instance.jobNameContains);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Status', _$TranscriptionJobStatusEnumMap[instance.status]);
  return val;
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

Map<String, dynamic> _$ListVocabulariesRequestToJson(
    ListVocabulariesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NameContains', instance.nameContains);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StateEquals', _$VocabularyStateEnumMap[instance.stateEquals]);
  return val;
}

ListVocabulariesResponse _$ListVocabulariesResponseFromJson(
    Map<String, dynamic> json) {
  return ListVocabulariesResponse(
    nextToken: json['NextToken'] as String,
    status:
        _$enumDecodeNullable(_$TranscriptionJobStatusEnumMap, json['Status']),
    vocabularies: (json['Vocabularies'] as List)
        ?.map((e) => e == null
            ? null
            : VocabularyInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListVocabularyFiltersRequestToJson(
    ListVocabularyFiltersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NameContains', instance.nameContains);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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
    completionTime: unixTimestampFromJson(json['CompletionTime']),
    creationTime: unixTimestampFromJson(json['CreationTime']),
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
    startTime: unixTimestampFromJson(json['StartTime']),
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
    completionTime: unixTimestampFromJson(json['CompletionTime']),
    creationTime: unixTimestampFromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    medicalTranscriptionJobName: json['MedicalTranscriptionJobName'] as String,
    outputLocationType: _$enumDecodeNullable(
        _$OutputLocationTypeEnumMap, json['OutputLocationType']),
    specialty: _$enumDecodeNullable(_$SpecialtyEnumMap, json['Specialty']),
    startTime: unixTimestampFromJson(json['StartTime']),
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

Map<String, dynamic> _$StartMedicalTranscriptionJobRequestToJson(
    StartMedicalTranscriptionJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LanguageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('Media', instance.media?.toJson());
  writeNotNull(
      'MedicalTranscriptionJobName', instance.medicalTranscriptionJobName);
  writeNotNull('OutputBucketName', instance.outputBucketName);
  writeNotNull('Specialty', _$SpecialtyEnumMap[instance.specialty]);
  writeNotNull('Type', _$TypeEnumMap[instance.type]);
  writeNotNull('MediaFormat', _$MediaFormatEnumMap[instance.mediaFormat]);
  writeNotNull('MediaSampleRateHertz', instance.mediaSampleRateHertz);
  writeNotNull('OutputEncryptionKMSKeyId', instance.outputEncryptionKMSKeyId);
  writeNotNull('Settings', instance.settings?.toJson());
  return val;
}

StartMedicalTranscriptionJobResponse
    _$StartMedicalTranscriptionJobResponseFromJson(Map<String, dynamic> json) {
  return StartMedicalTranscriptionJobResponse(
    medicalTranscriptionJob: json['MedicalTranscriptionJob'] == null
        ? null
        : MedicalTranscriptionJob.fromJson(
            json['MedicalTranscriptionJob'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StartTranscriptionJobRequestToJson(
    StartTranscriptionJobRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LanguageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('Media', instance.media?.toJson());
  writeNotNull('TranscriptionJobName', instance.transcriptionJobName);
  writeNotNull('ContentRedaction', instance.contentRedaction?.toJson());
  writeNotNull('JobExecutionSettings', instance.jobExecutionSettings?.toJson());
  writeNotNull('MediaFormat', _$MediaFormatEnumMap[instance.mediaFormat]);
  writeNotNull('MediaSampleRateHertz', instance.mediaSampleRateHertz);
  writeNotNull('OutputBucketName', instance.outputBucketName);
  writeNotNull('OutputEncryptionKMSKeyId', instance.outputEncryptionKMSKeyId);
  writeNotNull('Settings', instance.settings?.toJson());
  return val;
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
    completionTime: unixTimestampFromJson(json['CompletionTime']),
    contentRedaction: json['ContentRedaction'] == null
        ? null
        : ContentRedaction.fromJson(
            json['ContentRedaction'] as Map<String, dynamic>),
    creationTime: unixTimestampFromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String,
    jobExecutionSettings: json['JobExecutionSettings'] == null
        ? null
        : JobExecutionSettings.fromJson(
            json['JobExecutionSettings'] as Map<String, dynamic>),
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    media: json['Media'] == null
        ? null
        : Media.fromJson(json['Media'] as Map<String, dynamic>),
    mediaFormat:
        _$enumDecodeNullable(_$MediaFormatEnumMap, json['MediaFormat']),
    mediaSampleRateHertz: json['MediaSampleRateHertz'] as int,
    settings: json['Settings'] == null
        ? null
        : Settings.fromJson(json['Settings'] as Map<String, dynamic>),
    startTime: unixTimestampFromJson(json['StartTime']),
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
    completionTime: unixTimestampFromJson(json['CompletionTime']),
    contentRedaction: json['ContentRedaction'] == null
        ? null
        : ContentRedaction.fromJson(
            json['ContentRedaction'] as Map<String, dynamic>),
    creationTime: unixTimestampFromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    outputLocationType: _$enumDecodeNullable(
        _$OutputLocationTypeEnumMap, json['OutputLocationType']),
    startTime: unixTimestampFromJson(json['StartTime']),
    transcriptionJobName: json['TranscriptionJobName'] as String,
    transcriptionJobStatus: _$enumDecodeNullable(
        _$TranscriptionJobStatusEnumMap, json['TranscriptionJobStatus']),
  );
}

Map<String, dynamic> _$UpdateVocabularyFilterRequestToJson(
    UpdateVocabularyFilterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VocabularyFilterName', instance.vocabularyFilterName);
  writeNotNull('VocabularyFilterFileUri', instance.vocabularyFilterFileUri);
  writeNotNull('Words', instance.words);
  return val;
}

UpdateVocabularyFilterResponse _$UpdateVocabularyFilterResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateVocabularyFilterResponse(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime: unixTimestampFromJson(json['LastModifiedTime']),
    vocabularyFilterName: json['VocabularyFilterName'] as String,
  );
}

Map<String, dynamic> _$UpdateVocabularyRequestToJson(
    UpdateVocabularyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LanguageCode', _$LanguageCodeEnumMap[instance.languageCode]);
  writeNotNull('VocabularyName', instance.vocabularyName);
  writeNotNull('Phrases', instance.phrases);
  writeNotNull('VocabularyFileUri', instance.vocabularyFileUri);
  return val;
}

UpdateVocabularyResponse _$UpdateVocabularyResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateVocabularyResponse(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime: unixTimestampFromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
}

VocabularyFilterInfo _$VocabularyFilterInfoFromJson(Map<String, dynamic> json) {
  return VocabularyFilterInfo(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime: unixTimestampFromJson(json['LastModifiedTime']),
    vocabularyFilterName: json['VocabularyFilterName'] as String,
  );
}

VocabularyInfo _$VocabularyInfoFromJson(Map<String, dynamic> json) {
  return VocabularyInfo(
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    lastModifiedTime: unixTimestampFromJson(json['LastModifiedTime']),
    vocabularyName: json['VocabularyName'] as String,
    vocabularyState:
        _$enumDecodeNullable(_$VocabularyStateEnumMap, json['VocabularyState']),
  );
}
