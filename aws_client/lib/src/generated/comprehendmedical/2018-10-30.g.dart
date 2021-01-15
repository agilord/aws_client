// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-10-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    beginOffset: json['BeginOffset'] as int,
    category: _$enumDecodeNullable(_$EntityTypeEnumMap, json['Category']),
    endOffset: json['EndOffset'] as int,
    id: json['Id'] as int,
    relationshipScore: (json['RelationshipScore'] as num)?.toDouble(),
    relationshipType: _$enumDecodeNullable(
        _$RelationshipTypeEnumMap, json['RelationshipType']),
    score: (json['Score'] as num)?.toDouble(),
    text: json['Text'] as String,
    traits: (json['Traits'] as List)
        ?.map(
            (e) => e == null ? null : Trait.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$EntitySubTypeEnumMap, json['Type']),
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

const _$EntityTypeEnumMap = {
  EntityType.medication: 'MEDICATION',
  EntityType.medicalCondition: 'MEDICAL_CONDITION',
  EntityType.protectedHealthInformation: 'PROTECTED_HEALTH_INFORMATION',
  EntityType.testTreatmentProcedure: 'TEST_TREATMENT_PROCEDURE',
  EntityType.anatomy: 'ANATOMY',
  EntityType.timeExpression: 'TIME_EXPRESSION',
};

const _$RelationshipTypeEnumMap = {
  RelationshipType.every: 'EVERY',
  RelationshipType.withDosage: 'WITH_DOSAGE',
  RelationshipType.administeredVia: 'ADMINISTERED_VIA',
  RelationshipType.$for: 'FOR',
  RelationshipType.negative: 'NEGATIVE',
  RelationshipType.overlap: 'OVERLAP',
  RelationshipType.dosage: 'DOSAGE',
  RelationshipType.routeOrMode: 'ROUTE_OR_MODE',
  RelationshipType.form: 'FORM',
  RelationshipType.frequency: 'FREQUENCY',
  RelationshipType.duration: 'DURATION',
  RelationshipType.strength: 'STRENGTH',
  RelationshipType.rate: 'RATE',
  RelationshipType.acuity: 'ACUITY',
  RelationshipType.testValue: 'TEST_VALUE',
  RelationshipType.testUnits: 'TEST_UNITS',
  RelationshipType.direction: 'DIRECTION',
  RelationshipType.systemOrganSite: 'SYSTEM_ORGAN_SITE',
};

const _$EntitySubTypeEnumMap = {
  EntitySubType.name: 'NAME',
  EntitySubType.dosage: 'DOSAGE',
  EntitySubType.routeOrMode: 'ROUTE_OR_MODE',
  EntitySubType.form: 'FORM',
  EntitySubType.frequency: 'FREQUENCY',
  EntitySubType.duration: 'DURATION',
  EntitySubType.genericName: 'GENERIC_NAME',
  EntitySubType.brandName: 'BRAND_NAME',
  EntitySubType.strength: 'STRENGTH',
  EntitySubType.rate: 'RATE',
  EntitySubType.acuity: 'ACUITY',
  EntitySubType.testName: 'TEST_NAME',
  EntitySubType.testValue: 'TEST_VALUE',
  EntitySubType.testUnits: 'TEST_UNITS',
  EntitySubType.procedureName: 'PROCEDURE_NAME',
  EntitySubType.treatmentName: 'TREATMENT_NAME',
  EntitySubType.date: 'DATE',
  EntitySubType.age: 'AGE',
  EntitySubType.contactPoint: 'CONTACT_POINT',
  EntitySubType.email: 'EMAIL',
  EntitySubType.identifier: 'IDENTIFIER',
  EntitySubType.url: 'URL',
  EntitySubType.address: 'ADDRESS',
  EntitySubType.profession: 'PROFESSION',
  EntitySubType.systemOrganSite: 'SYSTEM_ORGAN_SITE',
  EntitySubType.direction: 'DIRECTION',
  EntitySubType.quality: 'QUALITY',
  EntitySubType.quantity: 'QUANTITY',
  EntitySubType.timeExpression: 'TIME_EXPRESSION',
  EntitySubType.timeToMedicationName: 'TIME_TO_MEDICATION_NAME',
  EntitySubType.timeToDxName: 'TIME_TO_DX_NAME',
  EntitySubType.timeToTestName: 'TIME_TO_TEST_NAME',
  EntitySubType.timeToProcedureName: 'TIME_TO_PROCEDURE_NAME',
  EntitySubType.timeToTreatmentName: 'TIME_TO_TREATMENT_NAME',
};

Map<String, dynamic> _$ComprehendMedicalAsyncJobFilterToJson(
    ComprehendMedicalAsyncJobFilter instance) {
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
  JobStatus.partialSuccess: 'PARTIAL_SUCCESS',
  JobStatus.failed: 'FAILED',
  JobStatus.stopRequested: 'STOP_REQUESTED',
  JobStatus.stopped: 'STOPPED',
};

ComprehendMedicalAsyncJobProperties
    _$ComprehendMedicalAsyncJobPropertiesFromJson(Map<String, dynamic> json) {
  return ComprehendMedicalAsyncJobProperties(
    dataAccessRoleArn: json['DataAccessRoleArn'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    expirationTime:
        const UnixDateTimeConverter().fromJson(json['ExpirationTime']),
    inputDataConfig: json['InputDataConfig'] == null
        ? null
        : InputDataConfig.fromJson(
            json['InputDataConfig'] as Map<String, dynamic>),
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    kMSKey: json['KMSKey'] as String,
    languageCode:
        _$enumDecodeNullable(_$LanguageCodeEnumMap, json['LanguageCode']),
    manifestFilePath: json['ManifestFilePath'] as String,
    message: json['Message'] as String,
    modelVersion: json['ModelVersion'] as String,
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
  );
}

const _$LanguageCodeEnumMap = {
  LanguageCode.en: 'en',
};

DescribeEntitiesDetectionV2JobResponse
    _$DescribeEntitiesDetectionV2JobResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeEntitiesDetectionV2JobResponse(
    comprehendMedicalAsyncJobProperties:
        json['ComprehendMedicalAsyncJobProperties'] == null
            ? null
            : ComprehendMedicalAsyncJobProperties.fromJson(
                json['ComprehendMedicalAsyncJobProperties']
                    as Map<String, dynamic>),
  );
}

DescribeICD10CMInferenceJobResponse
    _$DescribeICD10CMInferenceJobResponseFromJson(Map<String, dynamic> json) {
  return DescribeICD10CMInferenceJobResponse(
    comprehendMedicalAsyncJobProperties:
        json['ComprehendMedicalAsyncJobProperties'] == null
            ? null
            : ComprehendMedicalAsyncJobProperties.fromJson(
                json['ComprehendMedicalAsyncJobProperties']
                    as Map<String, dynamic>),
  );
}

DescribePHIDetectionJobResponse _$DescribePHIDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePHIDetectionJobResponse(
    comprehendMedicalAsyncJobProperties:
        json['ComprehendMedicalAsyncJobProperties'] == null
            ? null
            : ComprehendMedicalAsyncJobProperties.fromJson(
                json['ComprehendMedicalAsyncJobProperties']
                    as Map<String, dynamic>),
  );
}

DescribeRxNormInferenceJobResponse _$DescribeRxNormInferenceJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRxNormInferenceJobResponse(
    comprehendMedicalAsyncJobProperties:
        json['ComprehendMedicalAsyncJobProperties'] == null
            ? null
            : ComprehendMedicalAsyncJobProperties.fromJson(
                json['ComprehendMedicalAsyncJobProperties']
                    as Map<String, dynamic>),
  );
}

DetectEntitiesResponse _$DetectEntitiesResponseFromJson(
    Map<String, dynamic> json) {
  return DetectEntitiesResponse(
    entities: (json['Entities'] as List)
        ?.map((e) =>
            e == null ? null : Entity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    modelVersion: json['ModelVersion'] as String,
    paginationToken: json['PaginationToken'] as String,
    unmappedAttributes: (json['UnmappedAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : UnmappedAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DetectEntitiesV2Response _$DetectEntitiesV2ResponseFromJson(
    Map<String, dynamic> json) {
  return DetectEntitiesV2Response(
    entities: (json['Entities'] as List)
        ?.map((e) =>
            e == null ? null : Entity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    modelVersion: json['ModelVersion'] as String,
    paginationToken: json['PaginationToken'] as String,
    unmappedAttributes: (json['UnmappedAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : UnmappedAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DetectPHIResponse _$DetectPHIResponseFromJson(Map<String, dynamic> json) {
  return DetectPHIResponse(
    entities: (json['Entities'] as List)
        ?.map((e) =>
            e == null ? null : Entity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    modelVersion: json['ModelVersion'] as String,
    paginationToken: json['PaginationToken'] as String,
  );
}

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return Entity(
    attributes: (json['Attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    beginOffset: json['BeginOffset'] as int,
    category: _$enumDecodeNullable(_$EntityTypeEnumMap, json['Category']),
    endOffset: json['EndOffset'] as int,
    id: json['Id'] as int,
    score: (json['Score'] as num)?.toDouble(),
    text: json['Text'] as String,
    traits: (json['Traits'] as List)
        ?.map(
            (e) => e == null ? null : Trait.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$EntitySubTypeEnumMap, json['Type']),
  );
}

ICD10CMAttribute _$ICD10CMAttributeFromJson(Map<String, dynamic> json) {
  return ICD10CMAttribute(
    beginOffset: json['BeginOffset'] as int,
    endOffset: json['EndOffset'] as int,
    id: json['Id'] as int,
    relationshipScore: (json['RelationshipScore'] as num)?.toDouble(),
    score: (json['Score'] as num)?.toDouble(),
    text: json['Text'] as String,
    traits: (json['Traits'] as List)
        ?.map((e) =>
            e == null ? null : ICD10CMTrait.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$ICD10CMAttributeTypeEnumMap, json['Type']),
  );
}

const _$ICD10CMAttributeTypeEnumMap = {
  ICD10CMAttributeType.acuity: 'ACUITY',
  ICD10CMAttributeType.direction: 'DIRECTION',
  ICD10CMAttributeType.systemOrganSite: 'SYSTEM_ORGAN_SITE',
  ICD10CMAttributeType.quality: 'QUALITY',
  ICD10CMAttributeType.quantity: 'QUANTITY',
};

ICD10CMConcept _$ICD10CMConceptFromJson(Map<String, dynamic> json) {
  return ICD10CMConcept(
    code: json['Code'] as String,
    description: json['Description'] as String,
    score: (json['Score'] as num)?.toDouble(),
  );
}

ICD10CMEntity _$ICD10CMEntityFromJson(Map<String, dynamic> json) {
  return ICD10CMEntity(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : ICD10CMAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    beginOffset: json['BeginOffset'] as int,
    category:
        _$enumDecodeNullable(_$ICD10CMEntityCategoryEnumMap, json['Category']),
    endOffset: json['EndOffset'] as int,
    iCD10CMConcepts: (json['ICD10CMConcepts'] as List)
        ?.map((e) => e == null
            ? null
            : ICD10CMConcept.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['Id'] as int,
    score: (json['Score'] as num)?.toDouble(),
    text: json['Text'] as String,
    traits: (json['Traits'] as List)
        ?.map((e) =>
            e == null ? null : ICD10CMTrait.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$ICD10CMEntityTypeEnumMap, json['Type']),
  );
}

const _$ICD10CMEntityCategoryEnumMap = {
  ICD10CMEntityCategory.medicalCondition: 'MEDICAL_CONDITION',
};

const _$ICD10CMEntityTypeEnumMap = {
  ICD10CMEntityType.dxName: 'DX_NAME',
};

ICD10CMTrait _$ICD10CMTraitFromJson(Map<String, dynamic> json) {
  return ICD10CMTrait(
    name: _$enumDecodeNullable(_$ICD10CMTraitNameEnumMap, json['Name']),
    score: (json['Score'] as num)?.toDouble(),
  );
}

const _$ICD10CMTraitNameEnumMap = {
  ICD10CMTraitName.negation: 'NEGATION',
  ICD10CMTraitName.diagnosis: 'DIAGNOSIS',
  ICD10CMTraitName.sign: 'SIGN',
  ICD10CMTraitName.symptom: 'SYMPTOM',
};

InferICD10CMResponse _$InferICD10CMResponseFromJson(Map<String, dynamic> json) {
  return InferICD10CMResponse(
    entities: (json['Entities'] as List)
        ?.map((e) => e == null
            ? null
            : ICD10CMEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    modelVersion: json['ModelVersion'] as String,
    paginationToken: json['PaginationToken'] as String,
  );
}

InferRxNormResponse _$InferRxNormResponseFromJson(Map<String, dynamic> json) {
  return InferRxNormResponse(
    entities: (json['Entities'] as List)
        ?.map((e) =>
            e == null ? null : RxNormEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    modelVersion: json['ModelVersion'] as String,
    paginationToken: json['PaginationToken'] as String,
  );
}

InputDataConfig _$InputDataConfigFromJson(Map<String, dynamic> json) {
  return InputDataConfig(
    s3Bucket: json['S3Bucket'] as String,
    s3Key: json['S3Key'] as String,
  );
}

Map<String, dynamic> _$InputDataConfigToJson(InputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Bucket', instance.s3Bucket);
  writeNotNull('S3Key', instance.s3Key);
  return val;
}

ListEntitiesDetectionV2JobsResponse
    _$ListEntitiesDetectionV2JobsResponseFromJson(Map<String, dynamic> json) {
  return ListEntitiesDetectionV2JobsResponse(
    comprehendMedicalAsyncJobPropertiesList:
        (json['ComprehendMedicalAsyncJobPropertiesList'] as List)
            ?.map((e) => e == null
                ? null
                : ComprehendMedicalAsyncJobProperties.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListICD10CMInferenceJobsResponse _$ListICD10CMInferenceJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListICD10CMInferenceJobsResponse(
    comprehendMedicalAsyncJobPropertiesList:
        (json['ComprehendMedicalAsyncJobPropertiesList'] as List)
            ?.map((e) => e == null
                ? null
                : ComprehendMedicalAsyncJobProperties.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPHIDetectionJobsResponse _$ListPHIDetectionJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPHIDetectionJobsResponse(
    comprehendMedicalAsyncJobPropertiesList:
        (json['ComprehendMedicalAsyncJobPropertiesList'] as List)
            ?.map((e) => e == null
                ? null
                : ComprehendMedicalAsyncJobProperties.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListRxNormInferenceJobsResponse _$ListRxNormInferenceJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRxNormInferenceJobsResponse(
    comprehendMedicalAsyncJobPropertiesList:
        (json['ComprehendMedicalAsyncJobPropertiesList'] as List)
            ?.map((e) => e == null
                ? null
                : ComprehendMedicalAsyncJobProperties.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

OutputDataConfig _$OutputDataConfigFromJson(Map<String, dynamic> json) {
  return OutputDataConfig(
    s3Bucket: json['S3Bucket'] as String,
    s3Key: json['S3Key'] as String,
  );
}

Map<String, dynamic> _$OutputDataConfigToJson(OutputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Bucket', instance.s3Bucket);
  writeNotNull('S3Key', instance.s3Key);
  return val;
}

RxNormAttribute _$RxNormAttributeFromJson(Map<String, dynamic> json) {
  return RxNormAttribute(
    beginOffset: json['BeginOffset'] as int,
    endOffset: json['EndOffset'] as int,
    id: json['Id'] as int,
    relationshipScore: (json['RelationshipScore'] as num)?.toDouble(),
    score: (json['Score'] as num)?.toDouble(),
    text: json['Text'] as String,
    traits: (json['Traits'] as List)
        ?.map((e) =>
            e == null ? null : RxNormTrait.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$RxNormAttributeTypeEnumMap, json['Type']),
  );
}

const _$RxNormAttributeTypeEnumMap = {
  RxNormAttributeType.dosage: 'DOSAGE',
  RxNormAttributeType.duration: 'DURATION',
  RxNormAttributeType.form: 'FORM',
  RxNormAttributeType.frequency: 'FREQUENCY',
  RxNormAttributeType.rate: 'RATE',
  RxNormAttributeType.routeOrMode: 'ROUTE_OR_MODE',
  RxNormAttributeType.strength: 'STRENGTH',
};

RxNormConcept _$RxNormConceptFromJson(Map<String, dynamic> json) {
  return RxNormConcept(
    code: json['Code'] as String,
    description: json['Description'] as String,
    score: (json['Score'] as num)?.toDouble(),
  );
}

RxNormEntity _$RxNormEntityFromJson(Map<String, dynamic> json) {
  return RxNormEntity(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : RxNormAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    beginOffset: json['BeginOffset'] as int,
    category:
        _$enumDecodeNullable(_$RxNormEntityCategoryEnumMap, json['Category']),
    endOffset: json['EndOffset'] as int,
    id: json['Id'] as int,
    rxNormConcepts: (json['RxNormConcepts'] as List)
        ?.map((e) => e == null
            ? null
            : RxNormConcept.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    score: (json['Score'] as num)?.toDouble(),
    text: json['Text'] as String,
    traits: (json['Traits'] as List)
        ?.map((e) =>
            e == null ? null : RxNormTrait.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$RxNormEntityTypeEnumMap, json['Type']),
  );
}

const _$RxNormEntityCategoryEnumMap = {
  RxNormEntityCategory.medication: 'MEDICATION',
};

const _$RxNormEntityTypeEnumMap = {
  RxNormEntityType.brandName: 'BRAND_NAME',
  RxNormEntityType.genericName: 'GENERIC_NAME',
};

RxNormTrait _$RxNormTraitFromJson(Map<String, dynamic> json) {
  return RxNormTrait(
    name: _$enumDecodeNullable(_$RxNormTraitNameEnumMap, json['Name']),
    score: (json['Score'] as num)?.toDouble(),
  );
}

const _$RxNormTraitNameEnumMap = {
  RxNormTraitName.negation: 'NEGATION',
};

StartEntitiesDetectionV2JobResponse
    _$StartEntitiesDetectionV2JobResponseFromJson(Map<String, dynamic> json) {
  return StartEntitiesDetectionV2JobResponse(
    jobId: json['JobId'] as String,
  );
}

StartICD10CMInferenceJobResponse _$StartICD10CMInferenceJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartICD10CMInferenceJobResponse(
    jobId: json['JobId'] as String,
  );
}

StartPHIDetectionJobResponse _$StartPHIDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartPHIDetectionJobResponse(
    jobId: json['JobId'] as String,
  );
}

StartRxNormInferenceJobResponse _$StartRxNormInferenceJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartRxNormInferenceJobResponse(
    jobId: json['JobId'] as String,
  );
}

StopEntitiesDetectionV2JobResponse _$StopEntitiesDetectionV2JobResponseFromJson(
    Map<String, dynamic> json) {
  return StopEntitiesDetectionV2JobResponse(
    jobId: json['JobId'] as String,
  );
}

StopICD10CMInferenceJobResponse _$StopICD10CMInferenceJobResponseFromJson(
    Map<String, dynamic> json) {
  return StopICD10CMInferenceJobResponse(
    jobId: json['JobId'] as String,
  );
}

StopPHIDetectionJobResponse _$StopPHIDetectionJobResponseFromJson(
    Map<String, dynamic> json) {
  return StopPHIDetectionJobResponse(
    jobId: json['JobId'] as String,
  );
}

StopRxNormInferenceJobResponse _$StopRxNormInferenceJobResponseFromJson(
    Map<String, dynamic> json) {
  return StopRxNormInferenceJobResponse(
    jobId: json['JobId'] as String,
  );
}

Trait _$TraitFromJson(Map<String, dynamic> json) {
  return Trait(
    name: _$enumDecodeNullable(_$AttributeNameEnumMap, json['Name']),
    score: (json['Score'] as num)?.toDouble(),
  );
}

const _$AttributeNameEnumMap = {
  AttributeName.sign: 'SIGN',
  AttributeName.symptom: 'SYMPTOM',
  AttributeName.diagnosis: 'DIAGNOSIS',
  AttributeName.negation: 'NEGATION',
};

UnmappedAttribute _$UnmappedAttributeFromJson(Map<String, dynamic> json) {
  return UnmappedAttribute(
    attribute: json['Attribute'] == null
        ? null
        : Attribute.fromJson(json['Attribute'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$EntityTypeEnumMap, json['Type']),
  );
}
