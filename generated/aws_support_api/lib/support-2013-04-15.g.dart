// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support-2013-04-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AddAttachmentsToSetRequestToJson(
    AddAttachmentsToSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'attachments', instance.attachments?.map((e) => e?.toJson())?.toList());
  writeNotNull('attachmentSetId', instance.attachmentSetId);
  return val;
}

AddAttachmentsToSetResponse _$AddAttachmentsToSetResponseFromJson(
    Map<String, dynamic> json) {
  return AddAttachmentsToSetResponse(
    attachmentSetId: json['attachmentSetId'] as String,
    expiryTime: json['expiryTime'] as String,
  );
}

Map<String, dynamic> _$AddCommunicationToCaseRequestToJson(
    AddCommunicationToCaseRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('communicationBody', instance.communicationBody);
  writeNotNull('attachmentSetId', instance.attachmentSetId);
  writeNotNull('caseId', instance.caseId);
  writeNotNull('ccEmailAddresses', instance.ccEmailAddresses);
  return val;
}

AddCommunicationToCaseResponse _$AddCommunicationToCaseResponseFromJson(
    Map<String, dynamic> json) {
  return AddCommunicationToCaseResponse(
    result: json['result'] as bool,
  );
}

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return Attachment(
    data: const Uint8ListConverter().fromJson(json['data'] as String),
    fileName: json['fileName'] as String,
  );
}

Map<String, dynamic> _$AttachmentToJson(Attachment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', const Uint8ListConverter().toJson(instance.data));
  writeNotNull('fileName', instance.fileName);
  return val;
}

AttachmentDetails _$AttachmentDetailsFromJson(Map<String, dynamic> json) {
  return AttachmentDetails(
    attachmentId: json['attachmentId'] as String,
    fileName: json['fileName'] as String,
  );
}

CaseDetails _$CaseDetailsFromJson(Map<String, dynamic> json) {
  return CaseDetails(
    caseId: json['caseId'] as String,
    categoryCode: json['categoryCode'] as String,
    ccEmailAddresses:
        (json['ccEmailAddresses'] as List)?.map((e) => e as String)?.toList(),
    displayId: json['displayId'] as String,
    language: json['language'] as String,
    recentCommunications: json['recentCommunications'] == null
        ? null
        : RecentCaseCommunications.fromJson(
            json['recentCommunications'] as Map<String, dynamic>),
    serviceCode: json['serviceCode'] as String,
    severityCode: json['severityCode'] as String,
    status: json['status'] as String,
    subject: json['subject'] as String,
    submittedBy: json['submittedBy'] as String,
    timeCreated: json['timeCreated'] as String,
  );
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Communication _$CommunicationFromJson(Map<String, dynamic> json) {
  return Communication(
    attachmentSet: (json['attachmentSet'] as List)
        ?.map((e) => e == null
            ? null
            : AttachmentDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    body: json['body'] as String,
    caseId: json['caseId'] as String,
    submittedBy: json['submittedBy'] as String,
    timeCreated: json['timeCreated'] as String,
  );
}

Map<String, dynamic> _$CreateCaseRequestToJson(CreateCaseRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('communicationBody', instance.communicationBody);
  writeNotNull('subject', instance.subject);
  writeNotNull('attachmentSetId', instance.attachmentSetId);
  writeNotNull('categoryCode', instance.categoryCode);
  writeNotNull('ccEmailAddresses', instance.ccEmailAddresses);
  writeNotNull('issueType', instance.issueType);
  writeNotNull('language', instance.language);
  writeNotNull('serviceCode', instance.serviceCode);
  writeNotNull('severityCode', instance.severityCode);
  return val;
}

CreateCaseResponse _$CreateCaseResponseFromJson(Map<String, dynamic> json) {
  return CreateCaseResponse(
    caseId: json['caseId'] as String,
  );
}

Map<String, dynamic> _$DescribeAttachmentRequestToJson(
    DescribeAttachmentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attachmentId', instance.attachmentId);
  return val;
}

DescribeAttachmentResponse _$DescribeAttachmentResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAttachmentResponse(
    attachment: json['attachment'] == null
        ? null
        : Attachment.fromJson(json['attachment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeCasesRequestToJson(
    DescribeCasesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('afterTime', instance.afterTime);
  writeNotNull('beforeTime', instance.beforeTime);
  writeNotNull('caseIdList', instance.caseIdList);
  writeNotNull('displayId', instance.displayId);
  writeNotNull('includeCommunications', instance.includeCommunications);
  writeNotNull('includeResolvedCases', instance.includeResolvedCases);
  writeNotNull('language', instance.language);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeCasesResponse _$DescribeCasesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCasesResponse(
    cases: (json['cases'] as List)
        ?.map((e) =>
            e == null ? null : CaseDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeCommunicationsRequestToJson(
    DescribeCommunicationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caseId', instance.caseId);
  writeNotNull('afterTime', instance.afterTime);
  writeNotNull('beforeTime', instance.beforeTime);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeCommunicationsResponse _$DescribeCommunicationsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCommunicationsResponse(
    communications: (json['communications'] as List)
        ?.map((e) => e == null
            ? null
            : Communication.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeServicesRequestToJson(
    DescribeServicesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language);
  writeNotNull('serviceCodeList', instance.serviceCodeList);
  return val;
}

DescribeServicesResponse _$DescribeServicesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeServicesResponse(
    services: (json['services'] as List)
        ?.map((e) =>
            e == null ? null : Service.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeSeverityLevelsRequestToJson(
    DescribeSeverityLevelsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language);
  return val;
}

DescribeSeverityLevelsResponse _$DescribeSeverityLevelsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSeverityLevelsResponse(
    severityLevels: (json['severityLevels'] as List)
        ?.map((e) => e == null
            ? null
            : SeverityLevel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeTrustedAdvisorCheckRefreshStatusesRequestToJson(
    DescribeTrustedAdvisorCheckRefreshStatusesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('checkIds', instance.checkIds);
  return val;
}

DescribeTrustedAdvisorCheckRefreshStatusesResponse
    _$DescribeTrustedAdvisorCheckRefreshStatusesResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeTrustedAdvisorCheckRefreshStatusesResponse(
    statuses: (json['statuses'] as List)
        ?.map((e) => e == null
            ? null
            : TrustedAdvisorCheckRefreshStatus.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeTrustedAdvisorCheckResultRequestToJson(
    DescribeTrustedAdvisorCheckResultRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('checkId', instance.checkId);
  writeNotNull('language', instance.language);
  return val;
}

DescribeTrustedAdvisorCheckResultResponse
    _$DescribeTrustedAdvisorCheckResultResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeTrustedAdvisorCheckResultResponse(
    result: json['result'] == null
        ? null
        : TrustedAdvisorCheckResult.fromJson(
            json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeTrustedAdvisorCheckSummariesRequestToJson(
    DescribeTrustedAdvisorCheckSummariesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('checkIds', instance.checkIds);
  return val;
}

DescribeTrustedAdvisorCheckSummariesResponse
    _$DescribeTrustedAdvisorCheckSummariesResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeTrustedAdvisorCheckSummariesResponse(
    summaries: (json['summaries'] as List)
        ?.map((e) => e == null
            ? null
            : TrustedAdvisorCheckSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeTrustedAdvisorChecksRequestToJson(
    DescribeTrustedAdvisorChecksRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language);
  return val;
}

DescribeTrustedAdvisorChecksResponse
    _$DescribeTrustedAdvisorChecksResponseFromJson(Map<String, dynamic> json) {
  return DescribeTrustedAdvisorChecksResponse(
    checks: (json['checks'] as List)
        ?.map((e) => e == null
            ? null
            : TrustedAdvisorCheckDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

RecentCaseCommunications _$RecentCaseCommunicationsFromJson(
    Map<String, dynamic> json) {
  return RecentCaseCommunications(
    communications: (json['communications'] as List)
        ?.map((e) => e == null
            ? null
            : Communication.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$RefreshTrustedAdvisorCheckRequestToJson(
    RefreshTrustedAdvisorCheckRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('checkId', instance.checkId);
  return val;
}

RefreshTrustedAdvisorCheckResponse _$RefreshTrustedAdvisorCheckResponseFromJson(
    Map<String, dynamic> json) {
  return RefreshTrustedAdvisorCheckResponse(
    status: json['status'] == null
        ? null
        : TrustedAdvisorCheckRefreshStatus.fromJson(
            json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResolveCaseRequestToJson(ResolveCaseRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caseId', instance.caseId);
  return val;
}

ResolveCaseResponse _$ResolveCaseResponseFromJson(Map<String, dynamic> json) {
  return ResolveCaseResponse(
    finalCaseStatus: json['finalCaseStatus'] as String,
    initialCaseStatus: json['initialCaseStatus'] as String,
  );
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    categories: (json['categories'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

SeverityLevel _$SeverityLevelFromJson(Map<String, dynamic> json) {
  return SeverityLevel(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

TrustedAdvisorCategorySpecificSummary
    _$TrustedAdvisorCategorySpecificSummaryFromJson(Map<String, dynamic> json) {
  return TrustedAdvisorCategorySpecificSummary(
    costOptimizing: json['costOptimizing'] == null
        ? null
        : TrustedAdvisorCostOptimizingSummary.fromJson(
            json['costOptimizing'] as Map<String, dynamic>),
  );
}

TrustedAdvisorCheckDescription _$TrustedAdvisorCheckDescriptionFromJson(
    Map<String, dynamic> json) {
  return TrustedAdvisorCheckDescription(
    category: json['category'] as String,
    description: json['description'] as String,
    id: json['id'] as String,
    metadata: (json['metadata'] as List)?.map((e) => e as String)?.toList(),
    name: json['name'] as String,
  );
}

TrustedAdvisorCheckRefreshStatus _$TrustedAdvisorCheckRefreshStatusFromJson(
    Map<String, dynamic> json) {
  return TrustedAdvisorCheckRefreshStatus(
    checkId: json['checkId'] as String,
    millisUntilNextRefreshable: json['millisUntilNextRefreshable'] as int,
    status: json['status'] as String,
  );
}

TrustedAdvisorCheckResult _$TrustedAdvisorCheckResultFromJson(
    Map<String, dynamic> json) {
  return TrustedAdvisorCheckResult(
    categorySpecificSummary: json['categorySpecificSummary'] == null
        ? null
        : TrustedAdvisorCategorySpecificSummary.fromJson(
            json['categorySpecificSummary'] as Map<String, dynamic>),
    checkId: json['checkId'] as String,
    flaggedResources: (json['flaggedResources'] as List)
        ?.map((e) => e == null
            ? null
            : TrustedAdvisorResourceDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourcesSummary: json['resourcesSummary'] == null
        ? null
        : TrustedAdvisorResourcesSummary.fromJson(
            json['resourcesSummary'] as Map<String, dynamic>),
    status: json['status'] as String,
    timestamp: json['timestamp'] as String,
  );
}

TrustedAdvisorCheckSummary _$TrustedAdvisorCheckSummaryFromJson(
    Map<String, dynamic> json) {
  return TrustedAdvisorCheckSummary(
    categorySpecificSummary: json['categorySpecificSummary'] == null
        ? null
        : TrustedAdvisorCategorySpecificSummary.fromJson(
            json['categorySpecificSummary'] as Map<String, dynamic>),
    checkId: json['checkId'] as String,
    resourcesSummary: json['resourcesSummary'] == null
        ? null
        : TrustedAdvisorResourcesSummary.fromJson(
            json['resourcesSummary'] as Map<String, dynamic>),
    status: json['status'] as String,
    timestamp: json['timestamp'] as String,
    hasFlaggedResources: json['hasFlaggedResources'] as bool,
  );
}

TrustedAdvisorCostOptimizingSummary
    _$TrustedAdvisorCostOptimizingSummaryFromJson(Map<String, dynamic> json) {
  return TrustedAdvisorCostOptimizingSummary(
    estimatedMonthlySavings:
        (json['estimatedMonthlySavings'] as num)?.toDouble(),
    estimatedPercentMonthlySavings:
        (json['estimatedPercentMonthlySavings'] as num)?.toDouble(),
  );
}

TrustedAdvisorResourceDetail _$TrustedAdvisorResourceDetailFromJson(
    Map<String, dynamic> json) {
  return TrustedAdvisorResourceDetail(
    metadata: (json['metadata'] as List)?.map((e) => e as String)?.toList(),
    resourceId: json['resourceId'] as String,
    status: json['status'] as String,
    isSuppressed: json['isSuppressed'] as bool,
    region: json['region'] as String,
  );
}

TrustedAdvisorResourcesSummary _$TrustedAdvisorResourcesSummaryFromJson(
    Map<String, dynamic> json) {
  return TrustedAdvisorResourcesSummary(
    resourcesFlagged: json['resourcesFlagged'] as int,
    resourcesIgnored: json['resourcesIgnored'] as int,
    resourcesProcessed: json['resourcesProcessed'] as int,
    resourcesSuppressed: json['resourcesSuppressed'] as int,
  );
}
