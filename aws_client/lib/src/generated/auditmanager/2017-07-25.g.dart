// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-07-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AWSAccount _$AWSAccountFromJson(Map<String, dynamic> json) {
  return AWSAccount(
    emailAddress: json['emailAddress'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$AWSAccountToJson(AWSAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('emailAddress', instance.emailAddress);
  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

AWSService _$AWSServiceFromJson(Map<String, dynamic> json) {
  return AWSService(
    serviceName: json['serviceName'] as String,
  );
}

Map<String, dynamic> _$AWSServiceToJson(AWSService instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('serviceName', instance.serviceName);
  return val;
}

Assessment _$AssessmentFromJson(Map<String, dynamic> json) {
  return Assessment(
    arn: json['arn'] as String,
    awsAccount: json['awsAccount'] == null
        ? null
        : AWSAccount.fromJson(json['awsAccount'] as Map<String, dynamic>),
    framework: json['framework'] == null
        ? null
        : AssessmentFramework.fromJson(
            json['framework'] as Map<String, dynamic>),
    metadata: json['metadata'] == null
        ? null
        : AssessmentMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

AssessmentControl _$AssessmentControlFromJson(Map<String, dynamic> json) {
  return AssessmentControl(
    assessmentReportEvidenceCount: json['assessmentReportEvidenceCount'] as int,
    comments: (json['comments'] as List)
        ?.map((e) => e == null
            ? null
            : ControlComment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
    evidenceCount: json['evidenceCount'] as int,
    evidenceSources:
        (json['evidenceSources'] as List)?.map((e) => e as String)?.toList(),
    id: json['id'] as String,
    name: json['name'] as String,
    response: _$enumDecodeNullable(_$ControlResponseEnumMap, json['response']),
    status: _$enumDecodeNullable(_$ControlStatusEnumMap, json['status']),
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

const _$ControlResponseEnumMap = {
  ControlResponse.manual: 'MANUAL',
  ControlResponse.automate: 'AUTOMATE',
  ControlResponse.defer: 'DEFER',
  ControlResponse.ignore: 'IGNORE',
};

const _$ControlStatusEnumMap = {
  ControlStatus.underReview: 'UNDER_REVIEW',
  ControlStatus.reviewed: 'REVIEWED',
  ControlStatus.inactive: 'INACTIVE',
};

AssessmentControlSet _$AssessmentControlSetFromJson(Map<String, dynamic> json) {
  return AssessmentControlSet(
    controls: (json['controls'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentControl.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    delegations: (json['delegations'] as List)
        ?.map((e) =>
            e == null ? null : Delegation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
    id: json['id'] as String,
    manualEvidenceCount: json['manualEvidenceCount'] as int,
    roles: (json['roles'] as List)
        ?.map(
            (e) => e == null ? null : Role.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$ControlSetStatusEnumMap, json['status']),
    systemEvidenceCount: json['systemEvidenceCount'] as int,
  );
}

const _$ControlSetStatusEnumMap = {
  ControlSetStatus.active: 'ACTIVE',
  ControlSetStatus.underReview: 'UNDER_REVIEW',
  ControlSetStatus.reviewed: 'REVIEWED',
};

AssessmentEvidenceFolder _$AssessmentEvidenceFolderFromJson(
    Map<String, dynamic> json) {
  return AssessmentEvidenceFolder(
    assessmentId: json['assessmentId'] as String,
    assessmentReportSelectionCount:
        json['assessmentReportSelectionCount'] as int,
    author: json['author'] as String,
    controlId: json['controlId'] as String,
    controlName: json['controlName'] as String,
    controlSetId: json['controlSetId'] as String,
    dataSource: json['dataSource'] as String,
    date: const UnixDateTimeConverter().fromJson(json['date']),
    evidenceAwsServiceSourceCount: json['evidenceAwsServiceSourceCount'] as int,
    evidenceByTypeComplianceCheckCount:
        json['evidenceByTypeComplianceCheckCount'] as int,
    evidenceByTypeComplianceCheckIssuesCount:
        json['evidenceByTypeComplianceCheckIssuesCount'] as int,
    evidenceByTypeConfigurationDataCount:
        json['evidenceByTypeConfigurationDataCount'] as int,
    evidenceByTypeManualCount: json['evidenceByTypeManualCount'] as int,
    evidenceByTypeUserActivityCount:
        json['evidenceByTypeUserActivityCount'] as int,
    evidenceResourcesIncludedCount:
        json['evidenceResourcesIncludedCount'] as int,
    id: json['id'] as String,
    name: json['name'] as String,
    totalEvidence: json['totalEvidence'] as int,
  );
}

AssessmentFramework _$AssessmentFrameworkFromJson(Map<String, dynamic> json) {
  return AssessmentFramework(
    arn: json['arn'] as String,
    controlSets: (json['controlSets'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentControlSet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    metadata: json['metadata'] == null
        ? null
        : FrameworkMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  );
}

AssessmentFrameworkMetadata _$AssessmentFrameworkMetadataFromJson(
    Map<String, dynamic> json) {
  return AssessmentFrameworkMetadata(
    complianceType: json['complianceType'] as String,
    controlSetsCount: json['controlSetsCount'] as int,
    controlsCount: json['controlsCount'] as int,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    logo: json['logo'] as String,
    name: json['name'] as String,
    type: _$enumDecodeNullable(_$FrameworkTypeEnumMap, json['type']),
  );
}

const _$FrameworkTypeEnumMap = {
  FrameworkType.standard: 'Standard',
  FrameworkType.custom: 'Custom',
};

AssessmentMetadata _$AssessmentMetadataFromJson(Map<String, dynamic> json) {
  return AssessmentMetadata(
    assessmentReportsDestination: json['assessmentReportsDestination'] == null
        ? null
        : AssessmentReportsDestination.fromJson(
            json['assessmentReportsDestination'] as Map<String, dynamic>),
    complianceType: json['complianceType'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    delegations: (json['delegations'] as List)
        ?.map((e) =>
            e == null ? null : Delegation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdated: const UnixDateTimeConverter().fromJson(json['lastUpdated']),
    name: json['name'] as String,
    roles: (json['roles'] as List)
        ?.map(
            (e) => e == null ? null : Role.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    scope: json['scope'] == null
        ? null
        : Scope.fromJson(json['scope'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$AssessmentStatusEnumMap, json['status']),
  );
}

const _$AssessmentStatusEnumMap = {
  AssessmentStatus.active: 'ACTIVE',
  AssessmentStatus.inactive: 'INACTIVE',
};

AssessmentMetadataItem _$AssessmentMetadataItemFromJson(
    Map<String, dynamic> json) {
  return AssessmentMetadataItem(
    complianceType: json['complianceType'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    delegations: (json['delegations'] as List)
        ?.map((e) =>
            e == null ? null : Delegation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    lastUpdated: const UnixDateTimeConverter().fromJson(json['lastUpdated']),
    name: json['name'] as String,
    roles: (json['roles'] as List)
        ?.map(
            (e) => e == null ? null : Role.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$AssessmentStatusEnumMap, json['status']),
  );
}

AssessmentReport _$AssessmentReportFromJson(Map<String, dynamic> json) {
  return AssessmentReport(
    assessmentId: json['assessmentId'] as String,
    assessmentName: json['assessmentName'] as String,
    author: json['author'] as String,
    awsAccountId: json['awsAccountId'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    status:
        _$enumDecodeNullable(_$AssessmentReportStatusEnumMap, json['status']),
  );
}

const _$AssessmentReportStatusEnumMap = {
  AssessmentReportStatus.complete: 'COMPLETE',
  AssessmentReportStatus.inProgress: 'IN_PROGRESS',
  AssessmentReportStatus.failed: 'FAILED',
};

AssessmentReportEvidenceError _$AssessmentReportEvidenceErrorFromJson(
    Map<String, dynamic> json) {
  return AssessmentReportEvidenceError(
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
    evidenceId: json['evidenceId'] as String,
  );
}

AssessmentReportMetadata _$AssessmentReportMetadataFromJson(
    Map<String, dynamic> json) {
  return AssessmentReportMetadata(
    assessmentId: json['assessmentId'] as String,
    assessmentName: json['assessmentName'] as String,
    author: json['author'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    description: json['description'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    status:
        _$enumDecodeNullable(_$AssessmentReportStatusEnumMap, json['status']),
  );
}

AssessmentReportsDestination _$AssessmentReportsDestinationFromJson(
    Map<String, dynamic> json) {
  return AssessmentReportsDestination(
    destination: json['destination'] as String,
    destinationType: _$enumDecodeNullable(
        _$AssessmentReportDestinationTypeEnumMap, json['destinationType']),
  );
}

Map<String, dynamic> _$AssessmentReportsDestinationToJson(
    AssessmentReportsDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination);
  writeNotNull('destinationType',
      _$AssessmentReportDestinationTypeEnumMap[instance.destinationType]);
  return val;
}

const _$AssessmentReportDestinationTypeEnumMap = {
  AssessmentReportDestinationType.s3: 'S3',
};

AssociateAssessmentReportEvidenceFolderResponse
    _$AssociateAssessmentReportEvidenceFolderResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateAssessmentReportEvidenceFolderResponse();
}

BatchAssociateAssessmentReportEvidenceResponse
    _$BatchAssociateAssessmentReportEvidenceResponseFromJson(
        Map<String, dynamic> json) {
  return BatchAssociateAssessmentReportEvidenceResponse(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentReportEvidenceError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    evidenceIds:
        (json['evidenceIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchCreateDelegationByAssessmentError
    _$BatchCreateDelegationByAssessmentErrorFromJson(
        Map<String, dynamic> json) {
  return BatchCreateDelegationByAssessmentError(
    createDelegationRequest: json['createDelegationRequest'] == null
        ? null
        : CreateDelegationRequest.fromJson(
            json['createDelegationRequest'] as Map<String, dynamic>),
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
  );
}

BatchCreateDelegationByAssessmentResponse
    _$BatchCreateDelegationByAssessmentResponseFromJson(
        Map<String, dynamic> json) {
  return BatchCreateDelegationByAssessmentResponse(
    delegations: (json['delegations'] as List)
        ?.map((e) =>
            e == null ? null : Delegation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchCreateDelegationByAssessmentError.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDeleteDelegationByAssessmentError
    _$BatchDeleteDelegationByAssessmentErrorFromJson(
        Map<String, dynamic> json) {
  return BatchDeleteDelegationByAssessmentError(
    delegationId: json['delegationId'] as String,
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
  );
}

BatchDeleteDelegationByAssessmentResponse
    _$BatchDeleteDelegationByAssessmentResponseFromJson(
        Map<String, dynamic> json) {
  return BatchDeleteDelegationByAssessmentResponse(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDeleteDelegationByAssessmentError.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDisassociateAssessmentReportEvidenceResponse
    _$BatchDisassociateAssessmentReportEvidenceResponseFromJson(
        Map<String, dynamic> json) {
  return BatchDisassociateAssessmentReportEvidenceResponse(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentReportEvidenceError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    evidenceIds:
        (json['evidenceIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

BatchImportEvidenceToAssessmentControlError
    _$BatchImportEvidenceToAssessmentControlErrorFromJson(
        Map<String, dynamic> json) {
  return BatchImportEvidenceToAssessmentControlError(
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
    manualEvidence: json['manualEvidence'] == null
        ? null
        : ManualEvidence.fromJson(
            json['manualEvidence'] as Map<String, dynamic>),
  );
}

BatchImportEvidenceToAssessmentControlResponse
    _$BatchImportEvidenceToAssessmentControlResponseFromJson(
        Map<String, dynamic> json) {
  return BatchImportEvidenceToAssessmentControlResponse(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchImportEvidenceToAssessmentControlError.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

ChangeLog _$ChangeLogFromJson(Map<String, dynamic> json) {
  return ChangeLog(
    action: _$enumDecodeNullable(_$ActionEnumEnumMap, json['action']),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    createdBy: json['createdBy'] as String,
    objectName: json['objectName'] as String,
    objectType:
        _$enumDecodeNullable(_$ObjectTypeEnumEnumMap, json['objectType']),
  );
}

const _$ActionEnumEnumMap = {
  ActionEnum.create: 'CREATE',
  ActionEnum.updateMetadata: 'UPDATE_METADATA',
  ActionEnum.active: 'ACTIVE',
  ActionEnum.inactive: 'INACTIVE',
  ActionEnum.delete: 'DELETE',
  ActionEnum.underReview: 'UNDER_REVIEW',
  ActionEnum.reviewed: 'REVIEWED',
  ActionEnum.importEvidence: 'IMPORT_EVIDENCE',
};

const _$ObjectTypeEnumEnumMap = {
  ObjectTypeEnum.assessment: 'ASSESSMENT',
  ObjectTypeEnum.controlSet: 'CONTROL_SET',
  ObjectTypeEnum.control: 'CONTROL',
  ObjectTypeEnum.delegation: 'DELEGATION',
  ObjectTypeEnum.assessmentReport: 'ASSESSMENT_REPORT',
};

Control _$ControlFromJson(Map<String, dynamic> json) {
  return Control(
    actionPlanInstructions: json['actionPlanInstructions'] as String,
    actionPlanTitle: json['actionPlanTitle'] as String,
    arn: json['arn'] as String,
    controlMappingSources: (json['controlMappingSources'] as List)
        ?.map((e) => e == null
            ? null
            : ControlMappingSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    controlSources: json['controlSources'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    createdBy: json['createdBy'] as String,
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    lastUpdatedBy: json['lastUpdatedBy'] as String,
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    testingInformation: json['testingInformation'] as String,
    type: _$enumDecodeNullable(_$ControlTypeEnumMap, json['type']),
  );
}

const _$ControlTypeEnumMap = {
  ControlType.standard: 'Standard',
  ControlType.custom: 'Custom',
};

ControlComment _$ControlCommentFromJson(Map<String, dynamic> json) {
  return ControlComment(
    authorName: json['authorName'] as String,
    commentBody: json['commentBody'] as String,
    postedDate: const UnixDateTimeConverter().fromJson(json['postedDate']),
  );
}

ControlMappingSource _$ControlMappingSourceFromJson(Map<String, dynamic> json) {
  return ControlMappingSource(
    sourceDescription: json['sourceDescription'] as String,
    sourceFrequency:
        _$enumDecodeNullable(_$SourceFrequencyEnumMap, json['sourceFrequency']),
    sourceId: json['sourceId'] as String,
    sourceKeyword: json['sourceKeyword'] == null
        ? null
        : SourceKeyword.fromJson(json['sourceKeyword'] as Map<String, dynamic>),
    sourceName: json['sourceName'] as String,
    sourceSetUpOption: _$enumDecodeNullable(
        _$SourceSetUpOptionEnumMap, json['sourceSetUpOption']),
    sourceType: _$enumDecodeNullable(_$SourceTypeEnumMap, json['sourceType']),
    troubleshootingText: json['troubleshootingText'] as String,
  );
}

Map<String, dynamic> _$ControlMappingSourceToJson(
    ControlMappingSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sourceDescription', instance.sourceDescription);
  writeNotNull(
      'sourceFrequency', _$SourceFrequencyEnumMap[instance.sourceFrequency]);
  writeNotNull('sourceId', instance.sourceId);
  writeNotNull('sourceKeyword', instance.sourceKeyword?.toJson());
  writeNotNull('sourceName', instance.sourceName);
  writeNotNull('sourceSetUpOption',
      _$SourceSetUpOptionEnumMap[instance.sourceSetUpOption]);
  writeNotNull('sourceType', _$SourceTypeEnumMap[instance.sourceType]);
  writeNotNull('troubleshootingText', instance.troubleshootingText);
  return val;
}

const _$SourceFrequencyEnumMap = {
  SourceFrequency.daily: 'DAILY',
  SourceFrequency.weekly: 'WEEKLY',
  SourceFrequency.monthly: 'MONTHLY',
};

const _$SourceSetUpOptionEnumMap = {
  SourceSetUpOption.systemControlsMapping: 'System_Controls_Mapping',
  SourceSetUpOption.proceduralControlsMapping: 'Procedural_Controls_Mapping',
};

const _$SourceTypeEnumMap = {
  SourceType.awsCloudtrail: 'AWS_Cloudtrail',
  SourceType.awsConfig: 'AWS_Config',
  SourceType.awsSecurityHub: 'AWS_Security_Hub',
  SourceType.awsApiCall: 'AWS_API_Call',
  SourceType.manual: 'MANUAL',
};

ControlMetadata _$ControlMetadataFromJson(Map<String, dynamic> json) {
  return ControlMetadata(
    arn: json['arn'] as String,
    controlSources: json['controlSources'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    id: json['id'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    name: json['name'] as String,
  );
}

ControlSet _$ControlSetFromJson(Map<String, dynamic> json) {
  return ControlSet(
    controls: (json['controls'] as List)
        ?.map((e) =>
            e == null ? null : Control.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CreateAssessmentFrameworkControlToJson(
    CreateAssessmentFrameworkControl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

Map<String, dynamic> _$CreateAssessmentFrameworkControlSetToJson(
    CreateAssessmentFrameworkControlSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'controls', instance.controls?.map((e) => e?.toJson())?.toList());
  writeNotNull('name', instance.name);
  return val;
}

CreateAssessmentFrameworkResponse _$CreateAssessmentFrameworkResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAssessmentFrameworkResponse(
    framework: json['framework'] == null
        ? null
        : Framework.fromJson(json['framework'] as Map<String, dynamic>),
  );
}

CreateAssessmentReportResponse _$CreateAssessmentReportResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAssessmentReportResponse(
    assessmentReport: json['assessmentReport'] == null
        ? null
        : AssessmentReport.fromJson(
            json['assessmentReport'] as Map<String, dynamic>),
  );
}

CreateAssessmentResponse _$CreateAssessmentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAssessmentResponse(
    assessment: json['assessment'] == null
        ? null
        : Assessment.fromJson(json['assessment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateControlMappingSourceToJson(
    CreateControlMappingSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sourceDescription', instance.sourceDescription);
  writeNotNull(
      'sourceFrequency', _$SourceFrequencyEnumMap[instance.sourceFrequency]);
  writeNotNull('sourceKeyword', instance.sourceKeyword?.toJson());
  writeNotNull('sourceName', instance.sourceName);
  writeNotNull('sourceSetUpOption',
      _$SourceSetUpOptionEnumMap[instance.sourceSetUpOption]);
  writeNotNull('sourceType', _$SourceTypeEnumMap[instance.sourceType]);
  writeNotNull('troubleshootingText', instance.troubleshootingText);
  return val;
}

CreateControlResponse _$CreateControlResponseFromJson(
    Map<String, dynamic> json) {
  return CreateControlResponse(
    control: json['control'] == null
        ? null
        : Control.fromJson(json['control'] as Map<String, dynamic>),
  );
}

CreateDelegationRequest _$CreateDelegationRequestFromJson(
    Map<String, dynamic> json) {
  return CreateDelegationRequest(
    comment: json['comment'] as String,
    controlSetId: json['controlSetId'] as String,
    roleArn: json['roleArn'] as String,
    roleType: _$enumDecodeNullable(_$RoleTypeEnumMap, json['roleType']),
  );
}

Map<String, dynamic> _$CreateDelegationRequestToJson(
    CreateDelegationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comment', instance.comment);
  writeNotNull('controlSetId', instance.controlSetId);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('roleType', _$RoleTypeEnumMap[instance.roleType]);
  return val;
}

const _$RoleTypeEnumMap = {
  RoleType.processOwner: 'PROCESS_OWNER',
  RoleType.resourceOwner: 'RESOURCE_OWNER',
};

Delegation _$DelegationFromJson(Map<String, dynamic> json) {
  return Delegation(
    assessmentId: json['assessmentId'] as String,
    assessmentName: json['assessmentName'] as String,
    comment: json['comment'] as String,
    controlSetId: json['controlSetId'] as String,
    createdBy: json['createdBy'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    id: json['id'] as String,
    lastUpdated: const UnixDateTimeConverter().fromJson(json['lastUpdated']),
    roleArn: json['roleArn'] as String,
    roleType: _$enumDecodeNullable(_$RoleTypeEnumMap, json['roleType']),
    status: _$enumDecodeNullable(_$DelegationStatusEnumMap, json['status']),
  );
}

const _$DelegationStatusEnumMap = {
  DelegationStatus.inProgress: 'IN_PROGRESS',
  DelegationStatus.underReview: 'UNDER_REVIEW',
  DelegationStatus.complete: 'COMPLETE',
};

DelegationMetadata _$DelegationMetadataFromJson(Map<String, dynamic> json) {
  return DelegationMetadata(
    assessmentId: json['assessmentId'] as String,
    assessmentName: json['assessmentName'] as String,
    controlSetName: json['controlSetName'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    id: json['id'] as String,
    roleArn: json['roleArn'] as String,
    status: _$enumDecodeNullable(_$DelegationStatusEnumMap, json['status']),
  );
}

DeleteAssessmentFrameworkResponse _$DeleteAssessmentFrameworkResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAssessmentFrameworkResponse();
}

DeleteAssessmentReportResponse _$DeleteAssessmentReportResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAssessmentReportResponse();
}

DeleteAssessmentResponse _$DeleteAssessmentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAssessmentResponse();
}

DeleteControlResponse _$DeleteControlResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteControlResponse();
}

DeregisterAccountResponse _$DeregisterAccountResponseFromJson(
    Map<String, dynamic> json) {
  return DeregisterAccountResponse(
    status: _$enumDecodeNullable(_$AccountStatusEnumMap, json['status']),
  );
}

const _$AccountStatusEnumMap = {
  AccountStatus.active: 'ACTIVE',
  AccountStatus.inactive: 'INACTIVE',
  AccountStatus.pendingActivation: 'PENDING_ACTIVATION',
};

DeregisterOrganizationAdminAccountResponse
    _$DeregisterOrganizationAdminAccountResponseFromJson(
        Map<String, dynamic> json) {
  return DeregisterOrganizationAdminAccountResponse();
}

DisassociateAssessmentReportEvidenceFolderResponse
    _$DisassociateAssessmentReportEvidenceFolderResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateAssessmentReportEvidenceFolderResponse();
}

Evidence _$EvidenceFromJson(Map<String, dynamic> json) {
  return Evidence(
    assessmentReportSelection: json['assessmentReportSelection'] as String,
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    awsAccountId: json['awsAccountId'] as String,
    awsOrganization: json['awsOrganization'] as String,
    complianceCheck: json['complianceCheck'] as String,
    dataSource: json['dataSource'] as String,
    eventName: json['eventName'] as String,
    eventSource: json['eventSource'] as String,
    evidenceAwsAccountId: json['evidenceAwsAccountId'] as String,
    evidenceByType: json['evidenceByType'] as String,
    evidenceFolderId: json['evidenceFolderId'] as String,
    iamId: json['iamId'] as String,
    id: json['id'] as String,
    resourcesIncluded: (json['resourcesIncluded'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    time: const UnixDateTimeConverter().fromJson(json['time']),
  );
}

Framework _$FrameworkFromJson(Map<String, dynamic> json) {
  return Framework(
    arn: json['arn'] as String,
    complianceType: json['complianceType'] as String,
    controlSets: (json['controlSets'] as List)
        ?.map((e) =>
            e == null ? null : ControlSet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    controlSources: json['controlSources'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    createdBy: json['createdBy'] as String,
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    lastUpdatedBy: json['lastUpdatedBy'] as String,
    logo: json['logo'] as String,
    name: json['name'] as String,
    type: _$enumDecodeNullable(_$FrameworkTypeEnumMap, json['type']),
  );
}

FrameworkMetadata _$FrameworkMetadataFromJson(Map<String, dynamic> json) {
  return FrameworkMetadata(
    complianceType: json['complianceType'] as String,
    description: json['description'] as String,
    logo: json['logo'] as String,
    name: json['name'] as String,
  );
}

GetAccountStatusResponse _$GetAccountStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccountStatusResponse(
    status: _$enumDecodeNullable(_$AccountStatusEnumMap, json['status']),
  );
}

GetAssessmentFrameworkResponse _$GetAssessmentFrameworkResponseFromJson(
    Map<String, dynamic> json) {
  return GetAssessmentFrameworkResponse(
    framework: json['framework'] == null
        ? null
        : Framework.fromJson(json['framework'] as Map<String, dynamic>),
  );
}

GetAssessmentReportUrlResponse _$GetAssessmentReportUrlResponseFromJson(
    Map<String, dynamic> json) {
  return GetAssessmentReportUrlResponse(
    preSignedUrl: json['preSignedUrl'] == null
        ? null
        : URL.fromJson(json['preSignedUrl'] as Map<String, dynamic>),
  );
}

GetAssessmentResponse _$GetAssessmentResponseFromJson(
    Map<String, dynamic> json) {
  return GetAssessmentResponse(
    assessment: json['assessment'] == null
        ? null
        : Assessment.fromJson(json['assessment'] as Map<String, dynamic>),
  );
}

GetChangeLogsResponse _$GetChangeLogsResponseFromJson(
    Map<String, dynamic> json) {
  return GetChangeLogsResponse(
    changeLogs: (json['changeLogs'] as List)
        ?.map((e) =>
            e == null ? null : ChangeLog.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetControlResponse _$GetControlResponseFromJson(Map<String, dynamic> json) {
  return GetControlResponse(
    control: json['control'] == null
        ? null
        : Control.fromJson(json['control'] as Map<String, dynamic>),
  );
}

GetDelegationsResponse _$GetDelegationsResponseFromJson(
    Map<String, dynamic> json) {
  return GetDelegationsResponse(
    delegations: (json['delegations'] as List)
        ?.map((e) => e == null
            ? null
            : DelegationMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetEvidenceByEvidenceFolderResponse
    _$GetEvidenceByEvidenceFolderResponseFromJson(Map<String, dynamic> json) {
  return GetEvidenceByEvidenceFolderResponse(
    evidence: (json['evidence'] as List)
        ?.map((e) =>
            e == null ? null : Evidence.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetEvidenceFolderResponse _$GetEvidenceFolderResponseFromJson(
    Map<String, dynamic> json) {
  return GetEvidenceFolderResponse(
    evidenceFolder: json['evidenceFolder'] == null
        ? null
        : AssessmentEvidenceFolder.fromJson(
            json['evidenceFolder'] as Map<String, dynamic>),
  );
}

GetEvidenceFoldersByAssessmentControlResponse
    _$GetEvidenceFoldersByAssessmentControlResponseFromJson(
        Map<String, dynamic> json) {
  return GetEvidenceFoldersByAssessmentControlResponse(
    evidenceFolders: (json['evidenceFolders'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentEvidenceFolder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetEvidenceFoldersByAssessmentResponse
    _$GetEvidenceFoldersByAssessmentResponseFromJson(
        Map<String, dynamic> json) {
  return GetEvidenceFoldersByAssessmentResponse(
    evidenceFolders: (json['evidenceFolders'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentEvidenceFolder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetEvidenceResponse _$GetEvidenceResponseFromJson(Map<String, dynamic> json) {
  return GetEvidenceResponse(
    evidence: json['evidence'] == null
        ? null
        : Evidence.fromJson(json['evidence'] as Map<String, dynamic>),
  );
}

GetOrganizationAdminAccountResponse
    _$GetOrganizationAdminAccountResponseFromJson(Map<String, dynamic> json) {
  return GetOrganizationAdminAccountResponse(
    adminAccountId: json['adminAccountId'] as String,
    organizationId: json['organizationId'] as String,
  );
}

GetServicesInScopeResponse _$GetServicesInScopeResponseFromJson(
    Map<String, dynamic> json) {
  return GetServicesInScopeResponse(
    serviceMetadata: (json['serviceMetadata'] as List)
        ?.map((e) => e == null
            ? null
            : ServiceMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetSettingsResponse _$GetSettingsResponseFromJson(Map<String, dynamic> json) {
  return GetSettingsResponse(
    settings: json['settings'] == null
        ? null
        : Settings.fromJson(json['settings'] as Map<String, dynamic>),
  );
}

ListAssessmentFrameworksResponse _$ListAssessmentFrameworksResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssessmentFrameworksResponse(
    frameworkMetadataList: (json['frameworkMetadataList'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentFrameworkMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssessmentReportsResponse _$ListAssessmentReportsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssessmentReportsResponse(
    assessmentReports: (json['assessmentReports'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentReportMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssessmentsResponse _$ListAssessmentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssessmentsResponse(
    assessmentMetadata: (json['assessmentMetadata'] as List)
        ?.map((e) => e == null
            ? null
            : AssessmentMetadataItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListControlsResponse _$ListControlsResponseFromJson(Map<String, dynamic> json) {
  return ListControlsResponse(
    controlMetadataList: (json['controlMetadataList'] as List)
        ?.map((e) => e == null
            ? null
            : ControlMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListKeywordsForDataSourceResponse _$ListKeywordsForDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListKeywordsForDataSourceResponse(
    keywords: (json['keywords'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListNotificationsResponse _$ListNotificationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListNotificationsResponse(
    nextToken: json['nextToken'] as String,
    notifications: (json['notifications'] as List)
        ?.map((e) =>
            e == null ? null : Notification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ManualEvidence _$ManualEvidenceFromJson(Map<String, dynamic> json) {
  return ManualEvidence(
    s3ResourcePath: json['s3ResourcePath'] as String,
  );
}

Map<String, dynamic> _$ManualEvidenceToJson(ManualEvidence instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3ResourcePath', instance.s3ResourcePath);
  return val;
}

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    assessmentId: json['assessmentId'] as String,
    assessmentName: json['assessmentName'] as String,
    controlSetId: json['controlSetId'] as String,
    controlSetName: json['controlSetName'] as String,
    description: json['description'] as String,
    eventTime: const UnixDateTimeConverter().fromJson(json['eventTime']),
    id: json['id'] as String,
    source: json['source'] as String,
  );
}

RegisterAccountResponse _$RegisterAccountResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterAccountResponse(
    status: _$enumDecodeNullable(_$AccountStatusEnumMap, json['status']),
  );
}

RegisterOrganizationAdminAccountResponse
    _$RegisterOrganizationAdminAccountResponseFromJson(
        Map<String, dynamic> json) {
  return RegisterOrganizationAdminAccountResponse(
    adminAccountId: json['adminAccountId'] as String,
    organizationId: json['organizationId'] as String,
  );
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    arn: json['arn'] as String,
    value: json['value'] as String,
  );
}

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role(
    roleArn: json['roleArn'] as String,
    roleType: _$enumDecodeNullable(_$RoleTypeEnumMap, json['roleType']),
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('roleType', _$RoleTypeEnumMap[instance.roleType]);
  return val;
}

Scope _$ScopeFromJson(Map<String, dynamic> json) {
  return Scope(
    awsAccounts: (json['awsAccounts'] as List)
        ?.map((e) =>
            e == null ? null : AWSAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    awsServices: (json['awsServices'] as List)
        ?.map((e) =>
            e == null ? null : AWSService.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ScopeToJson(Scope instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'awsAccounts', instance.awsAccounts?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'awsServices', instance.awsServices?.map((e) => e?.toJson())?.toList());
  return val;
}

ServiceMetadata _$ServiceMetadataFromJson(Map<String, dynamic> json) {
  return ServiceMetadata(
    category: json['category'] as String,
    description: json['description'] as String,
    displayName: json['displayName'] as String,
    name: json['name'] as String,
  );
}

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return Settings(
    defaultAssessmentReportsDestination:
        json['defaultAssessmentReportsDestination'] == null
            ? null
            : AssessmentReportsDestination.fromJson(
                json['defaultAssessmentReportsDestination']
                    as Map<String, dynamic>),
    defaultProcessOwners: (json['defaultProcessOwners'] as List)
        ?.map(
            (e) => e == null ? null : Role.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isAwsOrgEnabled: json['isAwsOrgEnabled'] as bool,
    kmsKey: json['kmsKey'] as String,
    snsTopic: json['snsTopic'] as String,
  );
}

SourceKeyword _$SourceKeywordFromJson(Map<String, dynamic> json) {
  return SourceKeyword(
    keywordInputType: _$enumDecodeNullable(
        _$KeywordInputTypeEnumMap, json['keywordInputType']),
    keywordValue: json['keywordValue'] as String,
  );
}

Map<String, dynamic> _$SourceKeywordToJson(SourceKeyword instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'keywordInputType', _$KeywordInputTypeEnumMap[instance.keywordInputType]);
  writeNotNull('keywordValue', instance.keywordValue);
  return val;
}

const _$KeywordInputTypeEnumMap = {
  KeywordInputType.selectFromList: 'SELECT_FROM_LIST',
};

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

URL _$URLFromJson(Map<String, dynamic> json) {
  return URL(
    hyperlinkName: json['hyperlinkName'] as String,
    link: json['link'] as String,
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateAssessmentControlResponse _$UpdateAssessmentControlResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAssessmentControlResponse(
    control: json['control'] == null
        ? null
        : AssessmentControl.fromJson(json['control'] as Map<String, dynamic>),
  );
}

UpdateAssessmentControlSetStatusResponse
    _$UpdateAssessmentControlSetStatusResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateAssessmentControlSetStatusResponse(
    controlSet: json['controlSet'] == null
        ? null
        : AssessmentControlSet.fromJson(
            json['controlSet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateAssessmentFrameworkControlSetToJson(
    UpdateAssessmentFrameworkControlSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'controls', instance.controls?.map((e) => e?.toJson())?.toList());
  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

UpdateAssessmentFrameworkResponse _$UpdateAssessmentFrameworkResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAssessmentFrameworkResponse(
    framework: json['framework'] == null
        ? null
        : Framework.fromJson(json['framework'] as Map<String, dynamic>),
  );
}

UpdateAssessmentResponse _$UpdateAssessmentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAssessmentResponse(
    assessment: json['assessment'] == null
        ? null
        : Assessment.fromJson(json['assessment'] as Map<String, dynamic>),
  );
}

UpdateAssessmentStatusResponse _$UpdateAssessmentStatusResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAssessmentStatusResponse(
    assessment: json['assessment'] == null
        ? null
        : Assessment.fromJson(json['assessment'] as Map<String, dynamic>),
  );
}

UpdateControlResponse _$UpdateControlResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateControlResponse(
    control: json['control'] == null
        ? null
        : Control.fromJson(json['control'] as Map<String, dynamic>),
  );
}

UpdateSettingsResponse _$UpdateSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSettingsResponse(
    settings: json['settings'] == null
        ? null
        : Settings.fromJson(json['settings'] as Map<String, dynamic>),
  );
}

ValidateAssessmentReportIntegrityResponse
    _$ValidateAssessmentReportIntegrityResponseFromJson(
        Map<String, dynamic> json) {
  return ValidateAssessmentReportIntegrityResponse(
    signatureAlgorithm: json['signatureAlgorithm'] as String,
    signatureDateTime: json['signatureDateTime'] as String,
    signatureKeyId: json['signatureKeyId'] as String,
    signatureValid: json['signatureValid'] as bool,
    validationErrors:
        (json['validationErrors'] as List)?.map((e) => e as String)?.toList(),
  );
}
