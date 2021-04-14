// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mturk-requester-2017-01-17.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptQualificationRequestResponse _$AcceptQualificationRequestResponseFromJson(
    Map<String, dynamic> json) {
  return AcceptQualificationRequestResponse();
}

ApproveAssignmentResponse _$ApproveAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return ApproveAssignmentResponse();
}

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  return Assignment(
    acceptTime: const UnixDateTimeConverter().fromJson(json['AcceptTime']),
    answer: json['Answer'] as String?,
    approvalTime: const UnixDateTimeConverter().fromJson(json['ApprovalTime']),
    assignmentId: json['AssignmentId'] as String?,
    assignmentStatus: _$enumDecodeNullable(
        _$AssignmentStatusEnumMap, json['AssignmentStatus']),
    autoApprovalTime:
        const UnixDateTimeConverter().fromJson(json['AutoApprovalTime']),
    deadline: const UnixDateTimeConverter().fromJson(json['Deadline']),
    hITId: json['HITId'] as String?,
    rejectionTime:
        const UnixDateTimeConverter().fromJson(json['RejectionTime']),
    requesterFeedback: json['RequesterFeedback'] as String?,
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    workerId: json['WorkerId'] as String?,
  );
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$AssignmentStatusEnumMap = {
  AssignmentStatus.submitted: 'Submitted',
  AssignmentStatus.approved: 'Approved',
  AssignmentStatus.rejected: 'Rejected',
};

AssociateQualificationWithWorkerResponse
    _$AssociateQualificationWithWorkerResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateQualificationWithWorkerResponse();
}

BonusPayment _$BonusPaymentFromJson(Map<String, dynamic> json) {
  return BonusPayment(
    assignmentId: json['AssignmentId'] as String?,
    bonusAmount: json['BonusAmount'] as String?,
    grantTime: const UnixDateTimeConverter().fromJson(json['GrantTime']),
    reason: json['Reason'] as String?,
    workerId: json['WorkerId'] as String?,
  );
}

CreateAdditionalAssignmentsForHITResponse
    _$CreateAdditionalAssignmentsForHITResponseFromJson(
        Map<String, dynamic> json) {
  return CreateAdditionalAssignmentsForHITResponse();
}

CreateHITResponse _$CreateHITResponseFromJson(Map<String, dynamic> json) {
  return CreateHITResponse(
    hit: json['HIT'] == null
        ? null
        : HIT.fromJson(json['HIT'] as Map<String, dynamic>),
  );
}

CreateHITTypeResponse _$CreateHITTypeResponseFromJson(
    Map<String, dynamic> json) {
  return CreateHITTypeResponse(
    hITTypeId: json['HITTypeId'] as String?,
  );
}

CreateHITWithHITTypeResponse _$CreateHITWithHITTypeResponseFromJson(
    Map<String, dynamic> json) {
  return CreateHITWithHITTypeResponse(
    hit: json['HIT'] == null
        ? null
        : HIT.fromJson(json['HIT'] as Map<String, dynamic>),
  );
}

CreateQualificationTypeResponse _$CreateQualificationTypeResponseFromJson(
    Map<String, dynamic> json) {
  return CreateQualificationTypeResponse(
    qualificationType: json['QualificationType'] == null
        ? null
        : QualificationType.fromJson(
            json['QualificationType'] as Map<String, dynamic>),
  );
}

CreateWorkerBlockResponse _$CreateWorkerBlockResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWorkerBlockResponse();
}

DeleteHITResponse _$DeleteHITResponseFromJson(Map<String, dynamic> json) {
  return DeleteHITResponse();
}

DeleteQualificationTypeResponse _$DeleteQualificationTypeResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteQualificationTypeResponse();
}

DeleteWorkerBlockResponse _$DeleteWorkerBlockResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteWorkerBlockResponse();
}

DisassociateQualificationFromWorkerResponse
    _$DisassociateQualificationFromWorkerResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateQualificationFromWorkerResponse();
}

GetAccountBalanceResponse _$GetAccountBalanceResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccountBalanceResponse(
    availableBalance: json['AvailableBalance'] as String?,
    onHoldBalance: json['OnHoldBalance'] as String?,
  );
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

GetFileUploadURLResponse _$GetFileUploadURLResponseFromJson(
    Map<String, dynamic> json) {
  return GetFileUploadURLResponse(
    fileUploadURL: json['FileUploadURL'] as String?,
  );
}

GetHITResponse _$GetHITResponseFromJson(Map<String, dynamic> json) {
  return GetHITResponse(
    hit: json['HIT'] == null
        ? null
        : HIT.fromJson(json['HIT'] as Map<String, dynamic>),
  );
}

GetQualificationScoreResponse _$GetQualificationScoreResponseFromJson(
    Map<String, dynamic> json) {
  return GetQualificationScoreResponse(
    qualification: json['Qualification'] == null
        ? null
        : Qualification.fromJson(json['Qualification'] as Map<String, dynamic>),
  );
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
    assignmentDurationInSeconds: json['AssignmentDurationInSeconds'] as int?,
    autoApprovalDelayInSeconds: json['AutoApprovalDelayInSeconds'] as int?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String?,
    expiration: const UnixDateTimeConverter().fromJson(json['Expiration']),
    hITGroupId: json['HITGroupId'] as String?,
    hITId: json['HITId'] as String?,
    hITLayoutId: json['HITLayoutId'] as String?,
    hITReviewStatus:
        _$enumDecodeNullable(_$HITReviewStatusEnumMap, json['HITReviewStatus']),
    hITStatus: _$enumDecodeNullable(_$HITStatusEnumMap, json['HITStatus']),
    hITTypeId: json['HITTypeId'] as String?,
    keywords: json['Keywords'] as String?,
    maxAssignments: json['MaxAssignments'] as int?,
    numberOfAssignmentsAvailable: json['NumberOfAssignmentsAvailable'] as int?,
    numberOfAssignmentsCompleted: json['NumberOfAssignmentsCompleted'] as int?,
    numberOfAssignmentsPending: json['NumberOfAssignmentsPending'] as int?,
    qualificationRequirements: (json['QualificationRequirements']
            as List<dynamic>?)
        ?.map(
            (e) => QualificationRequirement.fromJson(e as Map<String, dynamic>))
        .toList(),
    question: json['Question'] as String?,
    requesterAnnotation: json['RequesterAnnotation'] as String?,
    reward: json['Reward'] as String?,
    title: json['Title'] as String?,
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

Map<String, dynamic> _$HITLayoutParameterToJson(HITLayoutParameter instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Value': instance.value,
    };

ListAssignmentsForHITResponse _$ListAssignmentsForHITResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssignmentsForHITResponse(
    assignments: (json['Assignments'] as List<dynamic>?)
        ?.map((e) => Assignment.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
    numResults: json['NumResults'] as int?,
  );
}

ListBonusPaymentsResponse _$ListBonusPaymentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListBonusPaymentsResponse(
    bonusPayments: (json['BonusPayments'] as List<dynamic>?)
        ?.map((e) => BonusPayment.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
    numResults: json['NumResults'] as int?,
  );
}

ListHITsForQualificationTypeResponse
    _$ListHITsForQualificationTypeResponseFromJson(Map<String, dynamic> json) {
  return ListHITsForQualificationTypeResponse(
    hITs: (json['HITs'] as List<dynamic>?)
        ?.map((e) => HIT.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
    numResults: json['NumResults'] as int?,
  );
}

ListHITsResponse _$ListHITsResponseFromJson(Map<String, dynamic> json) {
  return ListHITsResponse(
    hITs: (json['HITs'] as List<dynamic>?)
        ?.map((e) => HIT.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
    numResults: json['NumResults'] as int?,
  );
}

ListQualificationRequestsResponse _$ListQualificationRequestsResponseFromJson(
    Map<String, dynamic> json) {
  return ListQualificationRequestsResponse(
    nextToken: json['NextToken'] as String?,
    numResults: json['NumResults'] as int?,
    qualificationRequests: (json['QualificationRequests'] as List<dynamic>?)
        ?.map((e) => QualificationRequest.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListQualificationTypesResponse _$ListQualificationTypesResponseFromJson(
    Map<String, dynamic> json) {
  return ListQualificationTypesResponse(
    nextToken: json['NextToken'] as String?,
    numResults: json['NumResults'] as int?,
    qualificationTypes: (json['QualificationTypes'] as List<dynamic>?)
        ?.map((e) => QualificationType.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
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
    hITId: json['HITId'] as String?,
    hITReviewPolicy: json['HITReviewPolicy'] == null
        ? null
        : ReviewPolicy.fromJson(
            json['HITReviewPolicy'] as Map<String, dynamic>),
    hITReviewReport: json['HITReviewReport'] == null
        ? null
        : ReviewReport.fromJson(
            json['HITReviewReport'] as Map<String, dynamic>),
    nextToken: json['NextToken'] as String?,
  );
}

ListReviewableHITsResponse _$ListReviewableHITsResponseFromJson(
    Map<String, dynamic> json) {
  return ListReviewableHITsResponse(
    hITs: (json['HITs'] as List<dynamic>?)
        ?.map((e) => HIT.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
    numResults: json['NumResults'] as int?,
  );
}

ListWorkerBlocksResponse _$ListWorkerBlocksResponseFromJson(
    Map<String, dynamic> json) {
  return ListWorkerBlocksResponse(
    nextToken: json['NextToken'] as String?,
    numResults: json['NumResults'] as int?,
    workerBlocks: (json['WorkerBlocks'] as List<dynamic>?)
        ?.map((e) => WorkerBlock.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListWorkersWithQualificationTypeResponse
    _$ListWorkersWithQualificationTypeResponseFromJson(
        Map<String, dynamic> json) {
  return ListWorkersWithQualificationTypeResponse(
    nextToken: json['NextToken'] as String?,
    numResults: json['NumResults'] as int?,
    qualifications: (json['Qualifications'] as List<dynamic>?)
        ?.map((e) => Qualification.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Locale _$LocaleFromJson(Map<String, dynamic> json) {
  return Locale(
    country: json['Country'] as String,
    subdivision: json['Subdivision'] as String?,
  );
}

Map<String, dynamic> _$LocaleToJson(Locale instance) {
  final val = <String, dynamic>{
    'Country': instance.country,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Subdivision', instance.subdivision);
  return val;
}

Map<String, dynamic> _$NotificationSpecificationToJson(
        NotificationSpecification instance) =>
    <String, dynamic>{
      'Destination': instance.destination,
      'EventTypes':
          instance.eventTypes.map((e) => _$EventTypeEnumMap[e]).toList(),
      'Transport': _$NotificationTransportEnumMap[instance.transport],
      'Version': instance.version,
    };

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
    notifyWorkersFailureMessage: json['NotifyWorkersFailureMessage'] as String?,
    workerId: json['WorkerId'] as String?,
  );
}

const _$NotifyWorkersFailureCodeEnumMap = {
  NotifyWorkersFailureCode.softFailure: 'SoftFailure',
  NotifyWorkersFailureCode.hardFailure: 'HardFailure',
};

NotifyWorkersResponse _$NotifyWorkersResponseFromJson(
    Map<String, dynamic> json) {
  return NotifyWorkersResponse(
    notifyWorkersFailureStatuses:
        (json['NotifyWorkersFailureStatuses'] as List<dynamic>?)
            ?.map((e) =>
                NotifyWorkersFailureStatus.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

ParameterMapEntry _$ParameterMapEntryFromJson(Map<String, dynamic> json) {
  return ParameterMapEntry(
    key: json['Key'] as String?,
    values:
        (json['Values'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
    key: json['Key'] as String?,
    mapEntries: (json['MapEntries'] as List<dynamic>?)
        ?.map((e) => ParameterMapEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
    values:
        (json['Values'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
      'MapEntries', instance.mapEntries?.map((e) => e.toJson()).toList());
  writeNotNull('Values', instance.values);
  return val;
}

Qualification _$QualificationFromJson(Map<String, dynamic> json) {
  return Qualification(
    grantTime: const UnixDateTimeConverter().fromJson(json['GrantTime']),
    integerValue: json['IntegerValue'] as int?,
    localeValue: json['LocaleValue'] == null
        ? null
        : Locale.fromJson(json['LocaleValue'] as Map<String, dynamic>),
    qualificationTypeId: json['QualificationTypeId'] as String?,
    status: _$enumDecodeNullable(_$QualificationStatusEnumMap, json['Status']),
    workerId: json['WorkerId'] as String?,
  );
}

const _$QualificationStatusEnumMap = {
  QualificationStatus.granted: 'Granted',
  QualificationStatus.revoked: 'Revoked',
};

QualificationRequest _$QualificationRequestFromJson(Map<String, dynamic> json) {
  return QualificationRequest(
    answer: json['Answer'] as String?,
    qualificationRequestId: json['QualificationRequestId'] as String?,
    qualificationTypeId: json['QualificationTypeId'] as String?,
    submitTime: const UnixDateTimeConverter().fromJson(json['SubmitTime']),
    test: json['Test'] as String?,
    workerId: json['WorkerId'] as String?,
  );
}

QualificationRequirement _$QualificationRequirementFromJson(
    Map<String, dynamic> json) {
  return QualificationRequirement(
    comparator: _$enumDecode(_$ComparatorEnumMap, json['Comparator']),
    qualificationTypeId: json['QualificationTypeId'] as String,
    actionsGuarded:
        _$enumDecodeNullable(_$HITAccessActionsEnumMap, json['ActionsGuarded']),
    integerValues: (json['IntegerValues'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
    localeValues: (json['LocaleValues'] as List<dynamic>?)
        ?.map((e) => Locale.fromJson(e as Map<String, dynamic>))
        .toList(),
    requiredToPreview: json['RequiredToPreview'] as bool?,
  );
}

Map<String, dynamic> _$QualificationRequirementToJson(
    QualificationRequirement instance) {
  final val = <String, dynamic>{
    'Comparator': _$ComparatorEnumMap[instance.comparator],
    'QualificationTypeId': instance.qualificationTypeId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ActionsGuarded', _$HITAccessActionsEnumMap[instance.actionsGuarded]);
  writeNotNull('IntegerValues', instance.integerValues);
  writeNotNull(
      'LocaleValues', instance.localeValues?.map((e) => e.toJson()).toList());
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
    answerKey: json['AnswerKey'] as String?,
    autoGranted: json['AutoGranted'] as bool?,
    autoGrantedValue: json['AutoGrantedValue'] as int?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String?,
    isRequestable: json['IsRequestable'] as bool?,
    keywords: json['Keywords'] as String?,
    name: json['Name'] as String?,
    qualificationTypeId: json['QualificationTypeId'] as String?,
    qualificationTypeStatus: _$enumDecodeNullable(
        _$QualificationTypeStatusEnumMap, json['QualificationTypeStatus']),
    retryDelayInSeconds: json['RetryDelayInSeconds'] as int?,
    test: json['Test'] as String?,
    testDurationInSeconds: json['TestDurationInSeconds'] as int?,
  );
}

const _$QualificationTypeStatusEnumMap = {
  QualificationTypeStatus.active: 'Active',
  QualificationTypeStatus.inactive: 'Inactive',
};

RejectAssignmentResponse _$RejectAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return RejectAssignmentResponse();
}

RejectQualificationRequestResponse _$RejectQualificationRequestResponseFromJson(
    Map<String, dynamic> json) {
  return RejectQualificationRequestResponse();
}

RequestError _$RequestErrorFromJson(Map<String, dynamic> json) {
  return RequestError(
    message: json['Message'] as String?,
    turkErrorCode: json['TurkErrorCode'] as String?,
  );
}

ReviewActionDetail _$ReviewActionDetailFromJson(Map<String, dynamic> json) {
  return ReviewActionDetail(
    actionId: json['ActionId'] as String?,
    actionName: json['ActionName'] as String?,
    completeTime: const UnixDateTimeConverter().fromJson(json['CompleteTime']),
    errorCode: json['ErrorCode'] as String?,
    result: json['Result'] as String?,
    status: _$enumDecodeNullable(_$ReviewActionStatusEnumMap, json['Status']),
    targetId: json['TargetId'] as String?,
    targetType: json['TargetType'] as String?,
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
    parameters: (json['Parameters'] as List<dynamic>?)
        ?.map((e) => PolicyParameter.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ReviewPolicyToJson(ReviewPolicy instance) {
  final val = <String, dynamic>{
    'PolicyName': instance.policyName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Parameters', instance.parameters?.map((e) => e.toJson()).toList());
  return val;
}

ReviewReport _$ReviewReportFromJson(Map<String, dynamic> json) {
  return ReviewReport(
    reviewActions: (json['ReviewActions'] as List<dynamic>?)
        ?.map((e) => ReviewActionDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    reviewResults: (json['ReviewResults'] as List<dynamic>?)
        ?.map((e) => ReviewResultDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ReviewResultDetail _$ReviewResultDetailFromJson(Map<String, dynamic> json) {
  return ReviewResultDetail(
    actionId: json['ActionId'] as String?,
    key: json['Key'] as String?,
    questionId: json['QuestionId'] as String?,
    subjectId: json['SubjectId'] as String?,
    subjectType: json['SubjectType'] as String?,
    value: json['Value'] as String?,
  );
}

SendBonusResponse _$SendBonusResponseFromJson(Map<String, dynamic> json) {
  return SendBonusResponse();
}

SendTestEventNotificationResponse _$SendTestEventNotificationResponseFromJson(
    Map<String, dynamic> json) {
  return SendTestEventNotificationResponse();
}

ServiceFault _$ServiceFaultFromJson(Map<String, dynamic> json) {
  return ServiceFault(
    message: json['Message'] as String?,
    turkErrorCode: json['TurkErrorCode'] as String?,
  );
}

UpdateExpirationForHITResponse _$UpdateExpirationForHITResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateExpirationForHITResponse();
}

UpdateHITReviewStatusResponse _$UpdateHITReviewStatusResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateHITReviewStatusResponse();
}

UpdateHITTypeOfHITResponse _$UpdateHITTypeOfHITResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateHITTypeOfHITResponse();
}

UpdateNotificationSettingsResponse _$UpdateNotificationSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateNotificationSettingsResponse();
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
    reason: json['Reason'] as String?,
    workerId: json['WorkerId'] as String?,
  );
}
