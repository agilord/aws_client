// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mturk-requester-2017-01-17.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AcceptQualificationRequestRequestToJson(
    AcceptQualificationRequestRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QualificationRequestId', instance.qualificationRequestId);
  writeNotNull('IntegerValue', instance.integerValue);
  return val;
}

AcceptQualificationRequestResponse _$AcceptQualificationRequestResponseFromJson(
    Map<String, dynamic> json) {
  return AcceptQualificationRequestResponse();
}

Map<String, dynamic> _$ApproveAssignmentRequestToJson(
    ApproveAssignmentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssignmentId', instance.assignmentId);
  writeNotNull('OverrideRejection', instance.overrideRejection);
  writeNotNull('RequesterFeedback', instance.requesterFeedback);
  return val;
}

ApproveAssignmentResponse _$ApproveAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return ApproveAssignmentResponse();
}

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  return Assignment(
    acceptTime: unixTimestampFromJson(json['AcceptTime']),
    answer: json['Answer'] as String,
    approvalTime: unixTimestampFromJson(json['ApprovalTime']),
    assignmentId: json['AssignmentId'] as String,
    assignmentStatus: _$enumDecodeNullable(
        _$AssignmentStatusEnumMap, json['AssignmentStatus']),
    autoApprovalTime: unixTimestampFromJson(json['AutoApprovalTime']),
    deadline: unixTimestampFromJson(json['Deadline']),
    hITId: json['HITId'] as String,
    rejectionTime: unixTimestampFromJson(json['RejectionTime']),
    requesterFeedback: json['RequesterFeedback'] as String,
    submitTime: unixTimestampFromJson(json['SubmitTime']),
    workerId: json['WorkerId'] as String,
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

const _$AssignmentStatusEnumMap = {
  AssignmentStatus.submitted: 'Submitted',
  AssignmentStatus.approved: 'Approved',
  AssignmentStatus.rejected: 'Rejected',
};

Map<String, dynamic> _$AssociateQualificationWithWorkerRequestToJson(
    AssociateQualificationWithWorkerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QualificationTypeId', instance.qualificationTypeId);
  writeNotNull('WorkerId', instance.workerId);
  writeNotNull('IntegerValue', instance.integerValue);
  writeNotNull('SendNotification', instance.sendNotification);
  return val;
}

AssociateQualificationWithWorkerResponse
    _$AssociateQualificationWithWorkerResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateQualificationWithWorkerResponse();
}

BonusPayment _$BonusPaymentFromJson(Map<String, dynamic> json) {
  return BonusPayment(
    assignmentId: json['AssignmentId'] as String,
    bonusAmount: json['BonusAmount'] as String,
    grantTime: unixTimestampFromJson(json['GrantTime']),
    reason: json['Reason'] as String,
    workerId: json['WorkerId'] as String,
  );
}

Map<String, dynamic> _$CreateAdditionalAssignmentsForHITRequestToJson(
    CreateAdditionalAssignmentsForHITRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HITId', instance.hITId);
  writeNotNull(
      'NumberOfAdditionalAssignments', instance.numberOfAdditionalAssignments);
  writeNotNull('UniqueRequestToken', instance.uniqueRequestToken);
  return val;
}

CreateAdditionalAssignmentsForHITResponse
    _$CreateAdditionalAssignmentsForHITResponseFromJson(
        Map<String, dynamic> json) {
  return CreateAdditionalAssignmentsForHITResponse();
}

Map<String, dynamic> _$CreateHITRequestToJson(CreateHITRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AssignmentDurationInSeconds', instance.assignmentDurationInSeconds);
  writeNotNull('Description', instance.description);
  writeNotNull('LifetimeInSeconds', instance.lifetimeInSeconds);
  writeNotNull('Reward', instance.reward);
  writeNotNull('Title', instance.title);
  writeNotNull(
      'AssignmentReviewPolicy', instance.assignmentReviewPolicy?.toJson());
  writeNotNull(
      'AutoApprovalDelayInSeconds', instance.autoApprovalDelayInSeconds);
  writeNotNull('HITLayoutId', instance.hITLayoutId);
  writeNotNull('HITLayoutParameters',
      instance.hITLayoutParameters?.map((e) => e?.toJson())?.toList());
  writeNotNull('HITReviewPolicy', instance.hITReviewPolicy?.toJson());
  writeNotNull('Keywords', instance.keywords);
  writeNotNull('MaxAssignments', instance.maxAssignments);
  writeNotNull('QualificationRequirements',
      instance.qualificationRequirements?.map((e) => e?.toJson())?.toList());
  writeNotNull('Question', instance.question);
  writeNotNull('RequesterAnnotation', instance.requesterAnnotation);
  writeNotNull('UniqueRequestToken', instance.uniqueRequestToken);
  return val;
}

CreateHITResponse _$CreateHITResponseFromJson(Map<String, dynamic> json) {
  return CreateHITResponse(
    hit: json['HIT'] == null
        ? null
        : HIT.fromJson(json['HIT'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateHITTypeRequestToJson(
    CreateHITTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AssignmentDurationInSeconds', instance.assignmentDurationInSeconds);
  writeNotNull('Description', instance.description);
  writeNotNull('Reward', instance.reward);
  writeNotNull('Title', instance.title);
  writeNotNull(
      'AutoApprovalDelayInSeconds', instance.autoApprovalDelayInSeconds);
  writeNotNull('Keywords', instance.keywords);
  writeNotNull('QualificationRequirements',
      instance.qualificationRequirements?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateHITTypeResponse _$CreateHITTypeResponseFromJson(
    Map<String, dynamic> json) {
  return CreateHITTypeResponse(
    hITTypeId: json['HITTypeId'] as String,
  );
}

Map<String, dynamic> _$CreateHITWithHITTypeRequestToJson(
    CreateHITWithHITTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HITTypeId', instance.hITTypeId);
  writeNotNull('LifetimeInSeconds', instance.lifetimeInSeconds);
  writeNotNull(
      'AssignmentReviewPolicy', instance.assignmentReviewPolicy?.toJson());
  writeNotNull('HITLayoutId', instance.hITLayoutId);
  writeNotNull('HITLayoutParameters',
      instance.hITLayoutParameters?.map((e) => e?.toJson())?.toList());
  writeNotNull('HITReviewPolicy', instance.hITReviewPolicy?.toJson());
  writeNotNull('MaxAssignments', instance.maxAssignments);
  writeNotNull('Question', instance.question);
  writeNotNull('RequesterAnnotation', instance.requesterAnnotation);
  writeNotNull('UniqueRequestToken', instance.uniqueRequestToken);
  return val;
}

CreateHITWithHITTypeResponse _$CreateHITWithHITTypeResponseFromJson(
    Map<String, dynamic> json) {
  return CreateHITWithHITTypeResponse(
    hit: json['HIT'] == null
        ? null
        : HIT.fromJson(json['HIT'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateQualificationTypeRequestToJson(
    CreateQualificationTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  writeNotNull('QualificationTypeStatus',
      _$QualificationTypeStatusEnumMap[instance.qualificationTypeStatus]);
  writeNotNull('AnswerKey', instance.answerKey);
  writeNotNull('AutoGranted', instance.autoGranted);
  writeNotNull('AutoGrantedValue', instance.autoGrantedValue);
  writeNotNull('Keywords', instance.keywords);
  writeNotNull('RetryDelayInSeconds', instance.retryDelayInSeconds);
  writeNotNull('Test', instance.test);
  writeNotNull('TestDurationInSeconds', instance.testDurationInSeconds);
  return val;
}

const _$QualificationTypeStatusEnumMap = {
  QualificationTypeStatus.active: 'Active',
  QualificationTypeStatus.inactive: 'Inactive',
};

CreateQualificationTypeResponse _$CreateQualificationTypeResponseFromJson(
    Map<String, dynamic> json) {
  return CreateQualificationTypeResponse(
    qualificationType: json['QualificationType'] == null
        ? null
        : QualificationType.fromJson(
            json['QualificationType'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateWorkerBlockRequestToJson(
    CreateWorkerBlockRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Reason', instance.reason);
  writeNotNull('WorkerId', instance.workerId);
  return val;
}

CreateWorkerBlockResponse _$CreateWorkerBlockResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWorkerBlockResponse();
}

Map<String, dynamic> _$DeleteHITRequestToJson(DeleteHITRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HITId', instance.hITId);
  return val;
}

DeleteHITResponse _$DeleteHITResponseFromJson(Map<String, dynamic> json) {
  return DeleteHITResponse();
}

Map<String, dynamic> _$DeleteQualificationTypeRequestToJson(
    DeleteQualificationTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QualificationTypeId', instance.qualificationTypeId);
  return val;
}

DeleteQualificationTypeResponse _$DeleteQualificationTypeResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteQualificationTypeResponse();
}

Map<String, dynamic> _$DeleteWorkerBlockRequestToJson(
    DeleteWorkerBlockRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WorkerId', instance.workerId);
  writeNotNull('Reason', instance.reason);
  return val;
}

DeleteWorkerBlockResponse _$DeleteWorkerBlockResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteWorkerBlockResponse();
}

Map<String, dynamic> _$DisassociateQualificationFromWorkerRequestToJson(
    DisassociateQualificationFromWorkerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QualificationTypeId', instance.qualificationTypeId);
  writeNotNull('WorkerId', instance.workerId);
  writeNotNull('Reason', instance.reason);
  return val;
}

DisassociateQualificationFromWorkerResponse
    _$DisassociateQualificationFromWorkerResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateQualificationFromWorkerResponse();
}

GetAccountBalanceResponse _$GetAccountBalanceResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccountBalanceResponse(
    availableBalance: json['AvailableBalance'] as String,
    onHoldBalance: json['OnHoldBalance'] as String,
  );
}

Map<String, dynamic> _$GetAssignmentRequestToJson(
    GetAssignmentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssignmentId', instance.assignmentId);
  return val;
}

GetAssignmentResponse _$GetAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return GetAssignmentResponse(
    assignment: json['Assignment'] == null
        ? null
        : Assignment.fromJson(json['Assignment'] as Map<String, dynamic>),
    hit: json['HIT'] == null
        ? null
        : HIT.fromJson(json['HIT'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetFileUploadURLRequestToJson(
    GetFileUploadURLRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssignmentId', instance.assignmentId);
  writeNotNull('QuestionIdentifier', instance.questionIdentifier);
  return val;
}

GetFileUploadURLResponse _$GetFileUploadURLResponseFromJson(
    Map<String, dynamic> json) {
  return GetFileUploadURLResponse(
    fileUploadURL: json['FileUploadURL'] as String,
  );
}

Map<String, dynamic> _$GetHITRequestToJson(GetHITRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HITId', instance.hITId);
  return val;
}

GetHITResponse _$GetHITResponseFromJson(Map<String, dynamic> json) {
  return GetHITResponse(
    hit: json['HIT'] == null
        ? null
        : HIT.fromJson(json['HIT'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetQualificationScoreRequestToJson(
    GetQualificationScoreRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QualificationTypeId', instance.qualificationTypeId);
  writeNotNull('WorkerId', instance.workerId);
  return val;
}

GetQualificationScoreResponse _$GetQualificationScoreResponseFromJson(
    Map<String, dynamic> json) {
  return GetQualificationScoreResponse(
    qualification: json['Qualification'] == null
        ? null
        : Qualification.fromJson(json['Qualification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetQualificationTypeRequestToJson(
    GetQualificationTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QualificationTypeId', instance.qualificationTypeId);
  return val;
}

GetQualificationTypeResponse _$GetQualificationTypeResponseFromJson(
    Map<String, dynamic> json) {
  return GetQualificationTypeResponse(
    qualificationType: json['QualificationType'] == null
        ? null
        : QualificationType.fromJson(
            json['QualificationType'] as Map<String, dynamic>),
  );
}

HIT _$HITFromJson(Map<String, dynamic> json) {
  return HIT(
    assignmentDurationInSeconds: json['AssignmentDurationInSeconds'] as int,
    autoApprovalDelayInSeconds: json['AutoApprovalDelayInSeconds'] as int,
    creationTime: unixTimestampFromJson(json['CreationTime']),
    description: json['Description'] as String,
    expiration: unixTimestampFromJson(json['Expiration']),
    hITGroupId: json['HITGroupId'] as String,
    hITId: json['HITId'] as String,
    hITLayoutId: json['HITLayoutId'] as String,
    hITReviewStatus:
        _$enumDecodeNullable(_$HITReviewStatusEnumMap, json['HITReviewStatus']),
    hITStatus: _$enumDecodeNullable(_$HITStatusEnumMap, json['HITStatus']),
    hITTypeId: json['HITTypeId'] as String,
    keywords: json['Keywords'] as String,
    maxAssignments: json['MaxAssignments'] as int,
    numberOfAssignmentsAvailable: json['NumberOfAssignmentsAvailable'] as int,
    numberOfAssignmentsCompleted: json['NumberOfAssignmentsCompleted'] as int,
    numberOfAssignmentsPending: json['NumberOfAssignmentsPending'] as int,
    qualificationRequirements: (json['QualificationRequirements'] as List)
        ?.map((e) => e == null
            ? null
            : QualificationRequirement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    question: json['Question'] as String,
    requesterAnnotation: json['RequesterAnnotation'] as String,
    reward: json['Reward'] as String,
    title: json['Title'] as String,
  );
}

const _$HITReviewStatusEnumMap = {
  HITReviewStatus.notReviewed: 'NotReviewed',
  HITReviewStatus.markedForReview: 'MarkedForReview',
  HITReviewStatus.reviewedAppropriate: 'ReviewedAppropriate',
  HITReviewStatus.reviewedInappropriate: 'ReviewedInappropriate',
};

const _$HITStatusEnumMap = {
  HITStatus.assignable: 'Assignable',
  HITStatus.unassignable: 'Unassignable',
  HITStatus.reviewable: 'Reviewable',
  HITStatus.reviewing: 'Reviewing',
  HITStatus.disposed: 'Disposed',
};

Map<String, dynamic> _$HITLayoutParameterToJson(HITLayoutParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$ListAssignmentsForHITRequestToJson(
    ListAssignmentsForHITRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HITId', instance.hITId);
  writeNotNull('AssignmentStatuses', instance.assignmentStatuses);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListAssignmentsForHITResponse _$ListAssignmentsForHITResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssignmentsForHITResponse(
    assignments: (json['Assignments'] as List)
        ?.map((e) =>
            e == null ? null : Assignment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    numResults: json['NumResults'] as int,
  );
}

Map<String, dynamic> _$ListBonusPaymentsRequestToJson(
    ListBonusPaymentsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssignmentId', instance.assignmentId);
  writeNotNull('HITId', instance.hITId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListBonusPaymentsResponse _$ListBonusPaymentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListBonusPaymentsResponse(
    bonusPayments: (json['BonusPayments'] as List)
        ?.map((e) =>
            e == null ? null : BonusPayment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    numResults: json['NumResults'] as int,
  );
}

Map<String, dynamic> _$ListHITsForQualificationTypeRequestToJson(
    ListHITsForQualificationTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QualificationTypeId', instance.qualificationTypeId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListHITsForQualificationTypeResponse
    _$ListHITsForQualificationTypeResponseFromJson(Map<String, dynamic> json) {
  return ListHITsForQualificationTypeResponse(
    hITs: (json['HITs'] as List)
        ?.map((e) => e == null ? null : HIT.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    numResults: json['NumResults'] as int,
  );
}

Map<String, dynamic> _$ListHITsRequestToJson(ListHITsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListHITsResponse _$ListHITsResponseFromJson(Map<String, dynamic> json) {
  return ListHITsResponse(
    hITs: (json['HITs'] as List)
        ?.map((e) => e == null ? null : HIT.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    numResults: json['NumResults'] as int,
  );
}

Map<String, dynamic> _$ListQualificationRequestsRequestToJson(
    ListQualificationRequestsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('QualificationTypeId', instance.qualificationTypeId);
  return val;
}

ListQualificationRequestsResponse _$ListQualificationRequestsResponseFromJson(
    Map<String, dynamic> json) {
  return ListQualificationRequestsResponse(
    nextToken: json['NextToken'] as String,
    numResults: json['NumResults'] as int,
    qualificationRequests: (json['QualificationRequests'] as List)
        ?.map((e) => e == null
            ? null
            : QualificationRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListQualificationTypesRequestToJson(
    ListQualificationTypesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MustBeRequestable', instance.mustBeRequestable);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('MustBeOwnedByCaller', instance.mustBeOwnedByCaller);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Query', instance.query);
  return val;
}

ListQualificationTypesResponse _$ListQualificationTypesResponseFromJson(
    Map<String, dynamic> json) {
  return ListQualificationTypesResponse(
    nextToken: json['NextToken'] as String,
    numResults: json['NumResults'] as int,
    qualificationTypes: (json['QualificationTypes'] as List)
        ?.map((e) => e == null
            ? null
            : QualificationType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListReviewPolicyResultsForHITRequestToJson(
    ListReviewPolicyResultsForHITRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HITId', instance.hITId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('PolicyLevels', instance.policyLevels);
  writeNotNull('RetrieveActions', instance.retrieveActions);
  writeNotNull('RetrieveResults', instance.retrieveResults);
  return val;
}

ListReviewPolicyResultsForHITResponse
    _$ListReviewPolicyResultsForHITResponseFromJson(Map<String, dynamic> json) {
  return ListReviewPolicyResultsForHITResponse(
    assignmentReviewPolicy: json['AssignmentReviewPolicy'] == null
        ? null
        : ReviewPolicy.fromJson(
            json['AssignmentReviewPolicy'] as Map<String, dynamic>),
    assignmentReviewReport: json['AssignmentReviewReport'] == null
        ? null
        : ReviewReport.fromJson(
            json['AssignmentReviewReport'] as Map<String, dynamic>),
    hITId: json['HITId'] as String,
    hITReviewPolicy: json['HITReviewPolicy'] == null
        ? null
        : ReviewPolicy.fromJson(
            json['HITReviewPolicy'] as Map<String, dynamic>),
    hITReviewReport: json['HITReviewReport'] == null
        ? null
        : ReviewReport.fromJson(
            json['HITReviewReport'] as Map<String, dynamic>),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListReviewableHITsRequestToJson(
    ListReviewableHITsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HITTypeId', instance.hITTypeId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Status', _$ReviewableHITStatusEnumMap[instance.status]);
  return val;
}

const _$ReviewableHITStatusEnumMap = {
  ReviewableHITStatus.reviewable: 'Reviewable',
  ReviewableHITStatus.reviewing: 'Reviewing',
};

ListReviewableHITsResponse _$ListReviewableHITsResponseFromJson(
    Map<String, dynamic> json) {
  return ListReviewableHITsResponse(
    hITs: (json['HITs'] as List)
        ?.map((e) => e == null ? null : HIT.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    numResults: json['NumResults'] as int,
  );
}

Map<String, dynamic> _$ListWorkerBlocksRequestToJson(
    ListWorkerBlocksRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListWorkerBlocksResponse _$ListWorkerBlocksResponseFromJson(
    Map<String, dynamic> json) {
  return ListWorkerBlocksResponse(
    nextToken: json['NextToken'] as String,
    numResults: json['NumResults'] as int,
    workerBlocks: (json['WorkerBlocks'] as List)
        ?.map((e) =>
            e == null ? null : WorkerBlock.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListWorkersWithQualificationTypeRequestToJson(
    ListWorkersWithQualificationTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QualificationTypeId', instance.qualificationTypeId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Status', _$QualificationStatusEnumMap[instance.status]);
  return val;
}

const _$QualificationStatusEnumMap = {
  QualificationStatus.granted: 'Granted',
  QualificationStatus.revoked: 'Revoked',
};

ListWorkersWithQualificationTypeResponse
    _$ListWorkersWithQualificationTypeResponseFromJson(
        Map<String, dynamic> json) {
  return ListWorkersWithQualificationTypeResponse(
    nextToken: json['NextToken'] as String,
    numResults: json['NumResults'] as int,
    qualifications: (json['Qualifications'] as List)
        ?.map((e) => e == null
            ? null
            : Qualification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Locale _$LocaleFromJson(Map<String, dynamic> json) {
  return Locale(
    country: json['Country'] as String,
    subdivision: json['Subdivision'] as String,
  );
}

Map<String, dynamic> _$LocaleToJson(Locale instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Country', instance.country);
  writeNotNull('Subdivision', instance.subdivision);
  return val;
}

Map<String, dynamic> _$NotificationSpecificationToJson(
    NotificationSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Destination', instance.destination);
  writeNotNull('EventTypes', instance.eventTypes);
  writeNotNull('Transport', _$NotificationTransportEnumMap[instance.transport]);
  writeNotNull('Version', instance.version);
  return val;
}

const _$NotificationTransportEnumMap = {
  NotificationTransport.email: 'Email',
  NotificationTransport.sqs: 'SQS',
  NotificationTransport.sns: 'SNS',
};

NotifyWorkersFailureStatus _$NotifyWorkersFailureStatusFromJson(
    Map<String, dynamic> json) {
  return NotifyWorkersFailureStatus(
    notifyWorkersFailureCode: _$enumDecodeNullable(
        _$NotifyWorkersFailureCodeEnumMap, json['NotifyWorkersFailureCode']),
    notifyWorkersFailureMessage: json['NotifyWorkersFailureMessage'] as String,
    workerId: json['WorkerId'] as String,
  );
}

const _$NotifyWorkersFailureCodeEnumMap = {
  NotifyWorkersFailureCode.softFailure: 'SoftFailure',
  NotifyWorkersFailureCode.hardFailure: 'HardFailure',
};

Map<String, dynamic> _$NotifyWorkersRequestToJson(
    NotifyWorkersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MessageText', instance.messageText);
  writeNotNull('Subject', instance.subject);
  writeNotNull('WorkerIds', instance.workerIds);
  return val;
}

NotifyWorkersResponse _$NotifyWorkersResponseFromJson(
    Map<String, dynamic> json) {
  return NotifyWorkersResponse(
    notifyWorkersFailureStatuses: (json['NotifyWorkersFailureStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : NotifyWorkersFailureStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ParameterMapEntry _$ParameterMapEntryFromJson(Map<String, dynamic> json) {
  return ParameterMapEntry(
    key: json['Key'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ParameterMapEntryToJson(ParameterMapEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

PolicyParameter _$PolicyParameterFromJson(Map<String, dynamic> json) {
  return PolicyParameter(
    key: json['Key'] as String,
    mapEntries: (json['MapEntries'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterMapEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PolicyParameterToJson(PolicyParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull(
      'MapEntries', instance.mapEntries?.map((e) => e?.toJson())?.toList());
  writeNotNull('Values', instance.values);
  return val;
}

Qualification _$QualificationFromJson(Map<String, dynamic> json) {
  return Qualification(
    grantTime: unixTimestampFromJson(json['GrantTime']),
    integerValue: json['IntegerValue'] as int,
    localeValue: json['LocaleValue'] == null
        ? null
        : Locale.fromJson(json['LocaleValue'] as Map<String, dynamic>),
    qualificationTypeId: json['QualificationTypeId'] as String,
    status: _$enumDecodeNullable(_$QualificationStatusEnumMap, json['Status']),
    workerId: json['WorkerId'] as String,
  );
}

QualificationRequest _$QualificationRequestFromJson(Map<String, dynamic> json) {
  return QualificationRequest(
    answer: json['Answer'] as String,
    qualificationRequestId: json['QualificationRequestId'] as String,
    qualificationTypeId: json['QualificationTypeId'] as String,
    submitTime: unixTimestampFromJson(json['SubmitTime']),
    test: json['Test'] as String,
    workerId: json['WorkerId'] as String,
  );
}

QualificationRequirement _$QualificationRequirementFromJson(
    Map<String, dynamic> json) {
  return QualificationRequirement(
    comparator: _$enumDecodeNullable(_$ComparatorEnumMap, json['Comparator']),
    qualificationTypeId: json['QualificationTypeId'] as String,
    actionsGuarded:
        _$enumDecodeNullable(_$HITAccessActionsEnumMap, json['ActionsGuarded']),
    integerValues:
        (json['IntegerValues'] as List)?.map((e) => e as int)?.toList(),
    localeValues: (json['LocaleValues'] as List)
        ?.map((e) =>
            e == null ? null : Locale.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requiredToPreview: json['RequiredToPreview'] as bool,
  );
}

Map<String, dynamic> _$QualificationRequirementToJson(
    QualificationRequirement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Comparator', _$ComparatorEnumMap[instance.comparator]);
  writeNotNull('QualificationTypeId', instance.qualificationTypeId);
  writeNotNull(
      'ActionsGuarded', _$HITAccessActionsEnumMap[instance.actionsGuarded]);
  writeNotNull('IntegerValues', instance.integerValues);
  writeNotNull(
      'LocaleValues', instance.localeValues?.map((e) => e?.toJson())?.toList());
  writeNotNull('RequiredToPreview', instance.requiredToPreview);
  return val;
}

const _$ComparatorEnumMap = {
  Comparator.lessThan: 'LessThan',
  Comparator.lessThanOrEqualTo: 'LessThanOrEqualTo',
  Comparator.greaterThan: 'GreaterThan',
  Comparator.greaterThanOrEqualTo: 'GreaterThanOrEqualTo',
  Comparator.equalTo: 'EqualTo',
  Comparator.notEqualTo: 'NotEqualTo',
  Comparator.exists: 'Exists',
  Comparator.doesNotExist: 'DoesNotExist',
  Comparator.$in: 'In',
  Comparator.notIn: 'NotIn',
};

const _$HITAccessActionsEnumMap = {
  HITAccessActions.accept: 'Accept',
  HITAccessActions.previewAndAccept: 'PreviewAndAccept',
  HITAccessActions.discoverPreviewAndAccept: 'DiscoverPreviewAndAccept',
};

QualificationType _$QualificationTypeFromJson(Map<String, dynamic> json) {
  return QualificationType(
    answerKey: json['AnswerKey'] as String,
    autoGranted: json['AutoGranted'] as bool,
    autoGrantedValue: json['AutoGrantedValue'] as int,
    creationTime: unixTimestampFromJson(json['CreationTime']),
    description: json['Description'] as String,
    isRequestable: json['IsRequestable'] as bool,
    keywords: json['Keywords'] as String,
    name: json['Name'] as String,
    qualificationTypeId: json['QualificationTypeId'] as String,
    qualificationTypeStatus: _$enumDecodeNullable(
        _$QualificationTypeStatusEnumMap, json['QualificationTypeStatus']),
    retryDelayInSeconds: json['RetryDelayInSeconds'] as int,
    test: json['Test'] as String,
    testDurationInSeconds: json['TestDurationInSeconds'] as int,
  );
}

Map<String, dynamic> _$RejectAssignmentRequestToJson(
    RejectAssignmentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssignmentId', instance.assignmentId);
  writeNotNull('RequesterFeedback', instance.requesterFeedback);
  return val;
}

RejectAssignmentResponse _$RejectAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return RejectAssignmentResponse();
}

Map<String, dynamic> _$RejectQualificationRequestRequestToJson(
    RejectQualificationRequestRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QualificationRequestId', instance.qualificationRequestId);
  writeNotNull('Reason', instance.reason);
  return val;
}

RejectQualificationRequestResponse _$RejectQualificationRequestResponseFromJson(
    Map<String, dynamic> json) {
  return RejectQualificationRequestResponse();
}

RequestError _$RequestErrorFromJson(Map<String, dynamic> json) {
  return RequestError(
    message: json['Message'] as String,
    turkErrorCode: json['TurkErrorCode'] as String,
  );
}

ReviewActionDetail _$ReviewActionDetailFromJson(Map<String, dynamic> json) {
  return ReviewActionDetail(
    actionId: json['ActionId'] as String,
    actionName: json['ActionName'] as String,
    completeTime: unixTimestampFromJson(json['CompleteTime']),
    errorCode: json['ErrorCode'] as String,
    result: json['Result'] as String,
    status: _$enumDecodeNullable(_$ReviewActionStatusEnumMap, json['Status']),
    targetId: json['TargetId'] as String,
    targetType: json['TargetType'] as String,
  );
}

const _$ReviewActionStatusEnumMap = {
  ReviewActionStatus.intended: 'Intended',
  ReviewActionStatus.succeeded: 'Succeeded',
  ReviewActionStatus.failed: 'Failed',
  ReviewActionStatus.cancelled: 'Cancelled',
};

ReviewPolicy _$ReviewPolicyFromJson(Map<String, dynamic> json) {
  return ReviewPolicy(
    policyName: json['PolicyName'] as String,
    parameters: (json['Parameters'] as List)
        ?.map((e) => e == null
            ? null
            : PolicyParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReviewPolicyToJson(ReviewPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyName', instance.policyName);
  writeNotNull(
      'Parameters', instance.parameters?.map((e) => e?.toJson())?.toList());
  return val;
}

ReviewReport _$ReviewReportFromJson(Map<String, dynamic> json) {
  return ReviewReport(
    reviewActions: (json['ReviewActions'] as List)
        ?.map((e) => e == null
            ? null
            : ReviewActionDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reviewResults: (json['ReviewResults'] as List)
        ?.map((e) => e == null
            ? null
            : ReviewResultDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ReviewResultDetail _$ReviewResultDetailFromJson(Map<String, dynamic> json) {
  return ReviewResultDetail(
    actionId: json['ActionId'] as String,
    key: json['Key'] as String,
    questionId: json['QuestionId'] as String,
    subjectId: json['SubjectId'] as String,
    subjectType: json['SubjectType'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$SendBonusRequestToJson(SendBonusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssignmentId', instance.assignmentId);
  writeNotNull('BonusAmount', instance.bonusAmount);
  writeNotNull('Reason', instance.reason);
  writeNotNull('WorkerId', instance.workerId);
  writeNotNull('UniqueRequestToken', instance.uniqueRequestToken);
  return val;
}

SendBonusResponse _$SendBonusResponseFromJson(Map<String, dynamic> json) {
  return SendBonusResponse();
}

Map<String, dynamic> _$SendTestEventNotificationRequestToJson(
    SendTestEventNotificationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Notification', instance.notification?.toJson());
  writeNotNull('TestEventType', _$EventTypeEnumMap[instance.testEventType]);
  return val;
}

const _$EventTypeEnumMap = {
  EventType.assignmentAccepted: 'AssignmentAccepted',
  EventType.assignmentAbandoned: 'AssignmentAbandoned',
  EventType.assignmentReturned: 'AssignmentReturned',
  EventType.assignmentSubmitted: 'AssignmentSubmitted',
  EventType.assignmentRejected: 'AssignmentRejected',
  EventType.assignmentApproved: 'AssignmentApproved',
  EventType.hITCreated: 'HITCreated',
  EventType.hITExpired: 'HITExpired',
  EventType.hITReviewable: 'HITReviewable',
  EventType.hITExtended: 'HITExtended',
  EventType.hITDisposed: 'HITDisposed',
  EventType.ping: 'Ping',
};

SendTestEventNotificationResponse _$SendTestEventNotificationResponseFromJson(
    Map<String, dynamic> json) {
  return SendTestEventNotificationResponse();
}

ServiceFault _$ServiceFaultFromJson(Map<String, dynamic> json) {
  return ServiceFault(
    message: json['Message'] as String,
    turkErrorCode: json['TurkErrorCode'] as String,
  );
}

Map<String, dynamic> _$UpdateExpirationForHITRequestToJson(
    UpdateExpirationForHITRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExpireAt', unixTimestampToJson(instance.expireAt));
  writeNotNull('HITId', instance.hITId);
  return val;
}

UpdateExpirationForHITResponse _$UpdateExpirationForHITResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateExpirationForHITResponse();
}

Map<String, dynamic> _$UpdateHITReviewStatusRequestToJson(
    UpdateHITReviewStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HITId', instance.hITId);
  writeNotNull('Revert', instance.revert);
  return val;
}

UpdateHITReviewStatusResponse _$UpdateHITReviewStatusResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateHITReviewStatusResponse();
}

Map<String, dynamic> _$UpdateHITTypeOfHITRequestToJson(
    UpdateHITTypeOfHITRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HITId', instance.hITId);
  writeNotNull('HITTypeId', instance.hITTypeId);
  return val;
}

UpdateHITTypeOfHITResponse _$UpdateHITTypeOfHITResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateHITTypeOfHITResponse();
}

Map<String, dynamic> _$UpdateNotificationSettingsRequestToJson(
    UpdateNotificationSettingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HITTypeId', instance.hITTypeId);
  writeNotNull('Active', instance.active);
  writeNotNull('Notification', instance.notification?.toJson());
  return val;
}

UpdateNotificationSettingsResponse _$UpdateNotificationSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateNotificationSettingsResponse();
}

Map<String, dynamic> _$UpdateQualificationTypeRequestToJson(
    UpdateQualificationTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QualificationTypeId', instance.qualificationTypeId);
  writeNotNull('AnswerKey', instance.answerKey);
  writeNotNull('AutoGranted', instance.autoGranted);
  writeNotNull('AutoGrantedValue', instance.autoGrantedValue);
  writeNotNull('Description', instance.description);
  writeNotNull('QualificationTypeStatus',
      _$QualificationTypeStatusEnumMap[instance.qualificationTypeStatus]);
  writeNotNull('RetryDelayInSeconds', instance.retryDelayInSeconds);
  writeNotNull('Test', instance.test);
  writeNotNull('TestDurationInSeconds', instance.testDurationInSeconds);
  return val;
}

UpdateQualificationTypeResponse _$UpdateQualificationTypeResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateQualificationTypeResponse(
    qualificationType: json['QualificationType'] == null
        ? null
        : QualificationType.fromJson(
            json['QualificationType'] as Map<String, dynamic>),
  );
}

WorkerBlock _$WorkerBlockFromJson(Map<String, dynamic> json) {
  return WorkerBlock(
    reason: json['Reason'] as String,
    workerId: json['WorkerId'] as String,
  );
}
