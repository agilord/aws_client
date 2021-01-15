// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-03-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    choices: (json['Choices'] as List)
        ?.map((e) =>
            e == null ? null : Choice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    helpfulResourceUrl: json['HelpfulResourceUrl'] as String,
    improvementPlanUrl: json['ImprovementPlanUrl'] as String,
    isApplicable: json['IsApplicable'] as bool,
    notes: json['Notes'] as String,
    pillarId: json['PillarId'] as String,
    questionDescription: json['QuestionDescription'] as String,
    questionId: json['QuestionId'] as String,
    questionTitle: json['QuestionTitle'] as String,
    risk: _$enumDecodeNullable(_$RiskEnumMap, json['Risk']),
    selectedChoices:
        (json['SelectedChoices'] as List)?.map((e) => e as String)?.toList(),
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

const _$RiskEnumMap = {
  Risk.unanswered: 'UNANSWERED',
  Risk.high: 'HIGH',
  Risk.medium: 'MEDIUM',
  Risk.none: 'NONE',
  Risk.notApplicable: 'NOT_APPLICABLE',
};

AnswerSummary _$AnswerSummaryFromJson(Map<String, dynamic> json) {
  return AnswerSummary(
    choices: (json['Choices'] as List)
        ?.map((e) =>
            e == null ? null : Choice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isApplicable: json['IsApplicable'] as bool,
    pillarId: json['PillarId'] as String,
    questionId: json['QuestionId'] as String,
    questionTitle: json['QuestionTitle'] as String,
    risk: _$enumDecodeNullable(_$RiskEnumMap, json['Risk']),
    selectedChoices:
        (json['SelectedChoices'] as List)?.map((e) => e as String)?.toList(),
  );
}

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return Choice(
    choiceId: json['ChoiceId'] as String,
    description: json['Description'] as String,
    title: json['Title'] as String,
  );
}

CreateMilestoneOutput _$CreateMilestoneOutputFromJson(
    Map<String, dynamic> json) {
  return CreateMilestoneOutput(
    milestoneNumber: json['MilestoneNumber'] as int,
    workloadId: json['WorkloadId'] as String,
  );
}

CreateWorkloadOutput _$CreateWorkloadOutputFromJson(Map<String, dynamic> json) {
  return CreateWorkloadOutput(
    workloadArn: json['WorkloadArn'] as String,
    workloadId: json['WorkloadId'] as String,
  );
}

CreateWorkloadShareOutput _$CreateWorkloadShareOutputFromJson(
    Map<String, dynamic> json) {
  return CreateWorkloadShareOutput(
    shareId: json['ShareId'] as String,
    workloadId: json['WorkloadId'] as String,
  );
}

GetAnswerOutput _$GetAnswerOutputFromJson(Map<String, dynamic> json) {
  return GetAnswerOutput(
    answer: json['Answer'] == null
        ? null
        : Answer.fromJson(json['Answer'] as Map<String, dynamic>),
    lensAlias: json['LensAlias'] as String,
    milestoneNumber: json['MilestoneNumber'] as int,
    workloadId: json['WorkloadId'] as String,
  );
}

GetLensReviewOutput _$GetLensReviewOutputFromJson(Map<String, dynamic> json) {
  return GetLensReviewOutput(
    lensReview: json['LensReview'] == null
        ? null
        : LensReview.fromJson(json['LensReview'] as Map<String, dynamic>),
    milestoneNumber: json['MilestoneNumber'] as int,
    workloadId: json['WorkloadId'] as String,
  );
}

GetLensReviewReportOutput _$GetLensReviewReportOutputFromJson(
    Map<String, dynamic> json) {
  return GetLensReviewReportOutput(
    lensReviewReport: json['LensReviewReport'] == null
        ? null
        : LensReviewReport.fromJson(
            json['LensReviewReport'] as Map<String, dynamic>),
    milestoneNumber: json['MilestoneNumber'] as int,
    workloadId: json['WorkloadId'] as String,
  );
}

GetLensVersionDifferenceOutput _$GetLensVersionDifferenceOutputFromJson(
    Map<String, dynamic> json) {
  return GetLensVersionDifferenceOutput(
    baseLensVersion: json['BaseLensVersion'] as String,
    latestLensVersion: json['LatestLensVersion'] as String,
    lensAlias: json['LensAlias'] as String,
    versionDifferences: json['VersionDifferences'] == null
        ? null
        : VersionDifferences.fromJson(
            json['VersionDifferences'] as Map<String, dynamic>),
  );
}

GetMilestoneOutput _$GetMilestoneOutputFromJson(Map<String, dynamic> json) {
  return GetMilestoneOutput(
    milestone: json['Milestone'] == null
        ? null
        : Milestone.fromJson(json['Milestone'] as Map<String, dynamic>),
    workloadId: json['WorkloadId'] as String,
  );
}

GetWorkloadOutput _$GetWorkloadOutputFromJson(Map<String, dynamic> json) {
  return GetWorkloadOutput(
    workload: json['Workload'] == null
        ? null
        : Workload.fromJson(json['Workload'] as Map<String, dynamic>),
  );
}

ImprovementSummary _$ImprovementSummaryFromJson(Map<String, dynamic> json) {
  return ImprovementSummary(
    improvementPlanUrl: json['ImprovementPlanUrl'] as String,
    pillarId: json['PillarId'] as String,
    questionId: json['QuestionId'] as String,
    questionTitle: json['QuestionTitle'] as String,
    risk: _$enumDecodeNullable(_$RiskEnumMap, json['Risk']),
  );
}

LensReview _$LensReviewFromJson(Map<String, dynamic> json) {
  return LensReview(
    lensAlias: json['LensAlias'] as String,
    lensName: json['LensName'] as String,
    lensStatus: _$enumDecodeNullable(_$LensStatusEnumMap, json['LensStatus']),
    lensVersion: json['LensVersion'] as String,
    nextToken: json['NextToken'] as String,
    notes: json['Notes'] as String,
    pillarReviewSummaries: (json['PillarReviewSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : PillarReviewSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    riskCounts: (json['RiskCounts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$RiskEnumMap, k), e as int),
    ),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

const _$LensStatusEnumMap = {
  LensStatus.current: 'CURRENT',
  LensStatus.notCurrent: 'NOT_CURRENT',
  LensStatus.deprecated: 'DEPRECATED',
};

LensReviewReport _$LensReviewReportFromJson(Map<String, dynamic> json) {
  return LensReviewReport(
    base64String: json['Base64String'] as String,
    lensAlias: json['LensAlias'] as String,
  );
}

LensReviewSummary _$LensReviewSummaryFromJson(Map<String, dynamic> json) {
  return LensReviewSummary(
    lensAlias: json['LensAlias'] as String,
    lensName: json['LensName'] as String,
    lensStatus: _$enumDecodeNullable(_$LensStatusEnumMap, json['LensStatus']),
    lensVersion: json['LensVersion'] as String,
    riskCounts: (json['RiskCounts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$RiskEnumMap, k), e as int),
    ),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

LensSummary _$LensSummaryFromJson(Map<String, dynamic> json) {
  return LensSummary(
    description: json['Description'] as String,
    lensAlias: json['LensAlias'] as String,
    lensName: json['LensName'] as String,
    lensVersion: json['LensVersion'] as String,
  );
}

LensUpgradeSummary _$LensUpgradeSummaryFromJson(Map<String, dynamic> json) {
  return LensUpgradeSummary(
    currentLensVersion: json['CurrentLensVersion'] as String,
    latestLensVersion: json['LatestLensVersion'] as String,
    lensAlias: json['LensAlias'] as String,
    workloadId: json['WorkloadId'] as String,
    workloadName: json['WorkloadName'] as String,
  );
}

ListAnswersOutput _$ListAnswersOutputFromJson(Map<String, dynamic> json) {
  return ListAnswersOutput(
    answerSummaries: (json['AnswerSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : AnswerSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lensAlias: json['LensAlias'] as String,
    milestoneNumber: json['MilestoneNumber'] as int,
    nextToken: json['NextToken'] as String,
    workloadId: json['WorkloadId'] as String,
  );
}

ListLensReviewImprovementsOutput _$ListLensReviewImprovementsOutputFromJson(
    Map<String, dynamic> json) {
  return ListLensReviewImprovementsOutput(
    improvementSummaries: (json['ImprovementSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ImprovementSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lensAlias: json['LensAlias'] as String,
    milestoneNumber: json['MilestoneNumber'] as int,
    nextToken: json['NextToken'] as String,
    workloadId: json['WorkloadId'] as String,
  );
}

ListLensReviewsOutput _$ListLensReviewsOutputFromJson(
    Map<String, dynamic> json) {
  return ListLensReviewsOutput(
    lensReviewSummaries: (json['LensReviewSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : LensReviewSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    milestoneNumber: json['MilestoneNumber'] as int,
    nextToken: json['NextToken'] as String,
    workloadId: json['WorkloadId'] as String,
  );
}

ListLensesOutput _$ListLensesOutputFromJson(Map<String, dynamic> json) {
  return ListLensesOutput(
    lensSummaries: (json['LensSummaries'] as List)
        ?.map((e) =>
            e == null ? null : LensSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMilestonesOutput _$ListMilestonesOutputFromJson(Map<String, dynamic> json) {
  return ListMilestonesOutput(
    milestoneSummaries: (json['MilestoneSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : MilestoneSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    workloadId: json['WorkloadId'] as String,
  );
}

ListNotificationsOutput _$ListNotificationsOutputFromJson(
    Map<String, dynamic> json) {
  return ListNotificationsOutput(
    nextToken: json['NextToken'] as String,
    notificationSummaries: (json['NotificationSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : NotificationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListShareInvitationsOutput _$ListShareInvitationsOutputFromJson(
    Map<String, dynamic> json) {
  return ListShareInvitationsOutput(
    nextToken: json['NextToken'] as String,
    shareInvitationSummaries: (json['ShareInvitationSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ShareInvitationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListWorkloadSharesOutput _$ListWorkloadSharesOutputFromJson(
    Map<String, dynamic> json) {
  return ListWorkloadSharesOutput(
    nextToken: json['NextToken'] as String,
    workloadId: json['WorkloadId'] as String,
    workloadShareSummaries: (json['WorkloadShareSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : WorkloadShareSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListWorkloadsOutput _$ListWorkloadsOutputFromJson(Map<String, dynamic> json) {
  return ListWorkloadsOutput(
    nextToken: json['NextToken'] as String,
    workloadSummaries: (json['WorkloadSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : WorkloadSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Milestone _$MilestoneFromJson(Map<String, dynamic> json) {
  return Milestone(
    milestoneName: json['MilestoneName'] as String,
    milestoneNumber: json['MilestoneNumber'] as int,
    recordedAt: const UnixDateTimeConverter().fromJson(json['RecordedAt']),
    workload: json['Workload'] == null
        ? null
        : Workload.fromJson(json['Workload'] as Map<String, dynamic>),
  );
}

MilestoneSummary _$MilestoneSummaryFromJson(Map<String, dynamic> json) {
  return MilestoneSummary(
    milestoneName: json['MilestoneName'] as String,
    milestoneNumber: json['MilestoneNumber'] as int,
    recordedAt: const UnixDateTimeConverter().fromJson(json['RecordedAt']),
    workloadSummary: json['WorkloadSummary'] == null
        ? null
        : WorkloadSummary.fromJson(
            json['WorkloadSummary'] as Map<String, dynamic>),
  );
}

NotificationSummary _$NotificationSummaryFromJson(Map<String, dynamic> json) {
  return NotificationSummary(
    lensUpgradeSummary: json['LensUpgradeSummary'] == null
        ? null
        : LensUpgradeSummary.fromJson(
            json['LensUpgradeSummary'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$NotificationTypeEnumMap, json['Type']),
  );
}

const _$NotificationTypeEnumMap = {
  NotificationType.lensVersionUpgraded: 'LENS_VERSION_UPGRADED',
  NotificationType.lensVersionDeprecated: 'LENS_VERSION_DEPRECATED',
};

PillarDifference _$PillarDifferenceFromJson(Map<String, dynamic> json) {
  return PillarDifference(
    differenceStatus: _$enumDecodeNullable(
        _$DifferenceStatusEnumMap, json['DifferenceStatus']),
    pillarId: json['PillarId'] as String,
    questionDifferences: (json['QuestionDifferences'] as List)
        ?.map((e) => e == null
            ? null
            : QuestionDifference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$DifferenceStatusEnumMap = {
  DifferenceStatus.updated: 'UPDATED',
  DifferenceStatus.$new: 'NEW',
  DifferenceStatus.deleted: 'DELETED',
};

PillarReviewSummary _$PillarReviewSummaryFromJson(Map<String, dynamic> json) {
  return PillarReviewSummary(
    notes: json['Notes'] as String,
    pillarId: json['PillarId'] as String,
    pillarName: json['PillarName'] as String,
    riskCounts: (json['RiskCounts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$RiskEnumMap, k), e as int),
    ),
  );
}

QuestionDifference _$QuestionDifferenceFromJson(Map<String, dynamic> json) {
  return QuestionDifference(
    differenceStatus: _$enumDecodeNullable(
        _$DifferenceStatusEnumMap, json['DifferenceStatus']),
    questionId: json['QuestionId'] as String,
    questionTitle: json['QuestionTitle'] as String,
  );
}

ShareInvitation _$ShareInvitationFromJson(Map<String, dynamic> json) {
  return ShareInvitation(
    shareInvitationId: json['ShareInvitationId'] as String,
    workloadId: json['WorkloadId'] as String,
  );
}

ShareInvitationSummary _$ShareInvitationSummaryFromJson(
    Map<String, dynamic> json) {
  return ShareInvitationSummary(
    permissionType:
        _$enumDecodeNullable(_$PermissionTypeEnumMap, json['PermissionType']),
    shareInvitationId: json['ShareInvitationId'] as String,
    sharedBy: json['SharedBy'] as String,
    sharedWith: json['SharedWith'] as String,
    workloadId: json['WorkloadId'] as String,
    workloadName: json['WorkloadName'] as String,
  );
}

const _$PermissionTypeEnumMap = {
  PermissionType.readonly: 'READONLY',
  PermissionType.contributor: 'CONTRIBUTOR',
};

UpdateAnswerOutput _$UpdateAnswerOutputFromJson(Map<String, dynamic> json) {
  return UpdateAnswerOutput(
    answer: json['Answer'] == null
        ? null
        : Answer.fromJson(json['Answer'] as Map<String, dynamic>),
    lensAlias: json['LensAlias'] as String,
    workloadId: json['WorkloadId'] as String,
  );
}

UpdateLensReviewOutput _$UpdateLensReviewOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateLensReviewOutput(
    lensReview: json['LensReview'] == null
        ? null
        : LensReview.fromJson(json['LensReview'] as Map<String, dynamic>),
    workloadId: json['WorkloadId'] as String,
  );
}

UpdateShareInvitationOutput _$UpdateShareInvitationOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateShareInvitationOutput(
    shareInvitation: json['ShareInvitation'] == null
        ? null
        : ShareInvitation.fromJson(
            json['ShareInvitation'] as Map<String, dynamic>),
  );
}

UpdateWorkloadOutput _$UpdateWorkloadOutputFromJson(Map<String, dynamic> json) {
  return UpdateWorkloadOutput(
    workload: json['Workload'] == null
        ? null
        : Workload.fromJson(json['Workload'] as Map<String, dynamic>),
  );
}

UpdateWorkloadShareOutput _$UpdateWorkloadShareOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateWorkloadShareOutput(
    workloadId: json['WorkloadId'] as String,
    workloadShare: json['WorkloadShare'] == null
        ? null
        : WorkloadShare.fromJson(json['WorkloadShare'] as Map<String, dynamic>),
  );
}

VersionDifferences _$VersionDifferencesFromJson(Map<String, dynamic> json) {
  return VersionDifferences(
    pillarDifferences: (json['PillarDifferences'] as List)
        ?.map((e) => e == null
            ? null
            : PillarDifference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Workload _$WorkloadFromJson(Map<String, dynamic> json) {
  return Workload(
    accountIds: (json['AccountIds'] as List)?.map((e) => e as String)?.toList(),
    architecturalDesign: json['ArchitecturalDesign'] as String,
    awsRegions: (json['AwsRegions'] as List)?.map((e) => e as String)?.toList(),
    description: json['Description'] as String,
    environment:
        _$enumDecodeNullable(_$WorkloadEnvironmentEnumMap, json['Environment']),
    improvementStatus: _$enumDecodeNullable(
        _$WorkloadImprovementStatusEnumMap, json['ImprovementStatus']),
    industry: json['Industry'] as String,
    industryType: json['IndustryType'] as String,
    isReviewOwnerUpdateAcknowledged:
        json['IsReviewOwnerUpdateAcknowledged'] as bool,
    lenses: (json['Lenses'] as List)?.map((e) => e as String)?.toList(),
    nonAwsRegions:
        (json['NonAwsRegions'] as List)?.map((e) => e as String)?.toList(),
    notes: json['Notes'] as String,
    owner: json['Owner'] as String,
    pillarPriorities:
        (json['PillarPriorities'] as List)?.map((e) => e as String)?.toList(),
    reviewOwner: json['ReviewOwner'] as String,
    reviewRestrictionDate:
        const UnixDateTimeConverter().fromJson(json['ReviewRestrictionDate']),
    riskCounts: (json['RiskCounts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$RiskEnumMap, k), e as int),
    ),
    shareInvitationId: json['ShareInvitationId'] as String,
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
    workloadArn: json['WorkloadArn'] as String,
    workloadId: json['WorkloadId'] as String,
    workloadName: json['WorkloadName'] as String,
  );
}

const _$WorkloadEnvironmentEnumMap = {
  WorkloadEnvironment.production: 'PRODUCTION',
  WorkloadEnvironment.preproduction: 'PREPRODUCTION',
};

const _$WorkloadImprovementStatusEnumMap = {
  WorkloadImprovementStatus.notApplicable: 'NOT_APPLICABLE',
  WorkloadImprovementStatus.notStarted: 'NOT_STARTED',
  WorkloadImprovementStatus.inProgress: 'IN_PROGRESS',
  WorkloadImprovementStatus.complete: 'COMPLETE',
  WorkloadImprovementStatus.riskAcknowledged: 'RISK_ACKNOWLEDGED',
};

WorkloadShare _$WorkloadShareFromJson(Map<String, dynamic> json) {
  return WorkloadShare(
    permissionType:
        _$enumDecodeNullable(_$PermissionTypeEnumMap, json['PermissionType']),
    shareId: json['ShareId'] as String,
    sharedBy: json['SharedBy'] as String,
    sharedWith: json['SharedWith'] as String,
    status: _$enumDecodeNullable(_$ShareStatusEnumMap, json['Status']),
    workloadId: json['WorkloadId'] as String,
    workloadName: json['WorkloadName'] as String,
  );
}

const _$ShareStatusEnumMap = {
  ShareStatus.accepted: 'ACCEPTED',
  ShareStatus.rejected: 'REJECTED',
  ShareStatus.pending: 'PENDING',
  ShareStatus.revoked: 'REVOKED',
  ShareStatus.expired: 'EXPIRED',
};

WorkloadShareSummary _$WorkloadShareSummaryFromJson(Map<String, dynamic> json) {
  return WorkloadShareSummary(
    permissionType:
        _$enumDecodeNullable(_$PermissionTypeEnumMap, json['PermissionType']),
    shareId: json['ShareId'] as String,
    sharedWith: json['SharedWith'] as String,
    status: _$enumDecodeNullable(_$ShareStatusEnumMap, json['Status']),
  );
}

WorkloadSummary _$WorkloadSummaryFromJson(Map<String, dynamic> json) {
  return WorkloadSummary(
    improvementStatus: _$enumDecodeNullable(
        _$WorkloadImprovementStatusEnumMap, json['ImprovementStatus']),
    lenses: (json['Lenses'] as List)?.map((e) => e as String)?.toList(),
    owner: json['Owner'] as String,
    riskCounts: (json['RiskCounts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$RiskEnumMap, k), e as int),
    ),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
    workloadArn: json['WorkloadArn'] as String,
    workloadId: json['WorkloadId'] as String,
    workloadName: json['WorkloadName'] as String,
  );
}
