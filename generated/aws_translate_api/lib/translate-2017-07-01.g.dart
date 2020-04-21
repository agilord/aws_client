// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate-2017-07-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedTerminology _$AppliedTerminologyFromJson(Map<String, dynamic> json) {
  return AppliedTerminology(
    name: json['Name'] as String,
    terms: (json['Terms'] as List)
        ?.map(
            (e) => e == null ? null : Term.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeTextTranslationJobResponse _$DescribeTextTranslationJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTextTranslationJobResponse(
    textTranslationJobProperties: json['TextTranslationJobProperties'] == null
        ? null
        : TextTranslationJobProperties.fromJson(
            json['TextTranslationJobProperties'] as Map<String, dynamic>),
  );
}

EncryptionKey _$EncryptionKeyFromJson(Map<String, dynamic> json) {
  return EncryptionKey(
    id: json['Id'] as String,
    type: _$enumDecodeNullable(_$EncryptionKeyTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$EncryptionKeyToJson(EncryptionKey instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Type', _$EncryptionKeyTypeEnumMap[instance.type]);
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

const _$EncryptionKeyTypeEnumMap = {
  EncryptionKeyType.kms: 'KMS',
};

GetTerminologyResponse _$GetTerminologyResponseFromJson(
    Map<String, dynamic> json) {
  return GetTerminologyResponse(
    terminologyDataLocation: json['TerminologyDataLocation'] == null
        ? null
        : TerminologyDataLocation.fromJson(
            json['TerminologyDataLocation'] as Map<String, dynamic>),
    terminologyProperties: json['TerminologyProperties'] == null
        ? null
        : TerminologyProperties.fromJson(
            json['TerminologyProperties'] as Map<String, dynamic>),
  );
}

ImportTerminologyResponse _$ImportTerminologyResponseFromJson(
    Map<String, dynamic> json) {
  return ImportTerminologyResponse(
    terminologyProperties: json['TerminologyProperties'] == null
        ? null
        : TerminologyProperties.fromJson(
            json['TerminologyProperties'] as Map<String, dynamic>),
  );
}

InputDataConfig _$InputDataConfigFromJson(Map<String, dynamic> json) {
  return InputDataConfig(
    contentType: json['ContentType'] as String,
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$InputDataConfigToJson(InputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContentType', instance.contentType);
  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

JobDetails _$JobDetailsFromJson(Map<String, dynamic> json) {
  return JobDetails(
    documentsWithErrorsCount: json['DocumentsWithErrorsCount'] as int,
    inputDocumentsCount: json['InputDocumentsCount'] as int,
    translatedDocumentsCount: json['TranslatedDocumentsCount'] as int,
  );
}

ListTerminologiesResponse _$ListTerminologiesResponseFromJson(
    Map<String, dynamic> json) {
  return ListTerminologiesResponse(
    nextToken: json['NextToken'] as String,
    terminologyPropertiesList: (json['TerminologyPropertiesList'] as List)
        ?.map((e) => e == null
            ? null
            : TerminologyProperties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTextTranslationJobsResponse _$ListTextTranslationJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTextTranslationJobsResponse(
    nextToken: json['NextToken'] as String,
    textTranslationJobPropertiesList: (json['TextTranslationJobPropertiesList']
            as List)
        ?.map((e) => e == null
            ? null
            : TextTranslationJobProperties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OutputDataConfig _$OutputDataConfigFromJson(Map<String, dynamic> json) {
  return OutputDataConfig(
    s3Uri: json['S3Uri'] as String,
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
  return val;
}

StartTextTranslationJobResponse _$StartTextTranslationJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartTextTranslationJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

const _$JobStatusEnumMap = {
  JobStatus.submitted: 'SUBMITTED',
  JobStatus.inProgress: 'IN_PROGRESS',
  JobStatus.completed: 'COMPLETED',
  JobStatus.completedWithError: 'COMPLETED_WITH_ERROR',
  JobStatus.failed: 'FAILED',
  JobStatus.stopRequested: 'STOP_REQUESTED',
  JobStatus.stopped: 'STOPPED',
};

StopTextTranslationJobResponse _$StopTextTranslationJobResponseFromJson(
    Map<String, dynamic> json) {
  return StopTextTranslationJobResponse(
    jobId: json['JobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
  );
}

Term _$TermFromJson(Map<String, dynamic> json) {
  return Term(
    sourceText: json['SourceText'] as String,
    targetText: json['TargetText'] as String,
  );
}

Map<String, dynamic> _$TerminologyDataToJson(TerminologyData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('File', const Uint8ListConverter().toJson(instance.file));
  writeNotNull('Format', _$TerminologyDataFormatEnumMap[instance.format]);
  return val;
}

const _$TerminologyDataFormatEnumMap = {
  TerminologyDataFormat.csv: 'CSV',
  TerminologyDataFormat.tmx: 'TMX',
};

TerminologyDataLocation _$TerminologyDataLocationFromJson(
    Map<String, dynamic> json) {
  return TerminologyDataLocation(
    location: json['Location'] as String,
    repositoryType: json['RepositoryType'] as String,
  );
}

TerminologyProperties _$TerminologyPropertiesFromJson(
    Map<String, dynamic> json) {
  return TerminologyProperties(
    arn: json['Arn'] as String,
    createdAt: unixFromJson(json['CreatedAt']),
    description: json['Description'] as String,
    encryptionKey: json['EncryptionKey'] == null
        ? null
        : EncryptionKey.fromJson(json['EncryptionKey'] as Map<String, dynamic>),
    lastUpdatedAt: unixFromJson(json['LastUpdatedAt']),
    name: json['Name'] as String,
    sizeBytes: json['SizeBytes'] as int,
    sourceLanguageCode: json['SourceLanguageCode'] as String,
    targetLanguageCodes: (json['TargetLanguageCodes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    termCount: json['TermCount'] as int,
  );
}

Map<String, dynamic> _$TextTranslationJobFilterToJson(
    TextTranslationJobFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('JobName', instance.jobName);
  writeNotNull('JobStatus', _$JobStatusEnumMap[instance.jobStatus]);
  writeNotNull('SubmittedAfterTime', unixToJson(instance.submittedAfterTime));
  writeNotNull('SubmittedBeforeTime', unixToJson(instance.submittedBeforeTime));
  return val;
}

TextTranslationJobProperties _$TextTranslationJobPropertiesFromJson(
    Map<String, dynamic> json) {
  return TextTranslationJobProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: unixFromJson(json['EndTime']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobDetails: json['JobDetails'] == null
        ? null
        : JobDetails.fromJson(json['JobDetails'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    message: json['Message'] as String,
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    sourceLanguageCode: json['SourceLanguageCode'] as String,
    submittedTime: unixFromJson(json['SubmittedTime']),
    targetLanguageCodes: (json['TargetLanguageCodes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    terminologyNames:
        (json['TerminologyNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

TranslateTextResponse _$TranslateTextResponseFromJson(
    Map<String, dynamic> json) {
  return TranslateTextResponse(
    sourceLanguageCode: json['SourceLanguageCode'] as String,
    targetLanguageCode: json['TargetLanguageCode'] as String,
    translatedText: json['TranslatedText'] as String,
    appliedTerminologies: (json['AppliedTerminologies'] as List)
        ?.map((e) => e == null
            ? null
            : AppliedTerminology.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
