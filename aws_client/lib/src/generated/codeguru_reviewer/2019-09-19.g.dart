// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-09-19.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociateRepositoryResponse _$AssociateRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateRepositoryResponse(
    repositoryAssociation: json['RepositoryAssociation'] == null
        ? null
        : RepositoryAssociation.fromJson(
            json['RepositoryAssociation'] as Map<String, dynamic>),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$CodeCommitRepositoryToJson(
    CodeCommitRepository instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

CodeReview _$CodeReviewFromJson(Map<String, dynamic> json) {
  return CodeReview(
    associationArn: json['AssociationArn'] as String,
    codeReviewArn: json['CodeReviewArn'] as String,
    createdTimeStamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimeStamp']),
    lastUpdatedTimeStamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimeStamp']),
    metrics: json['Metrics'] == null
        ? null
        : Metrics.fromJson(json['Metrics'] as Map<String, dynamic>),
    name: json['Name'] as String,
    owner: json['Owner'] as String,
    providerType:
        _$enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
    pullRequestId: json['PullRequestId'] as String,
    repositoryName: json['RepositoryName'] as String,
    sourceCodeType: json['SourceCodeType'] == null
        ? null
        : SourceCodeType.fromJson(
            json['SourceCodeType'] as Map<String, dynamic>),
    state: _$enumDecodeNullable(_$JobStateEnumMap, json['State']),
    stateReason: json['StateReason'] as String,
    type: _$enumDecodeNullable(_$TypeEnumMap, json['Type']),
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

const _$ProviderTypeEnumMap = {
  ProviderType.codeCommit: 'CodeCommit',
  ProviderType.gitHub: 'GitHub',
  ProviderType.bitbucket: 'Bitbucket',
  ProviderType.gitHubEnterpriseServer: 'GitHubEnterpriseServer',
};

const _$JobStateEnumMap = {
  JobState.completed: 'Completed',
  JobState.pending: 'Pending',
  JobState.failed: 'Failed',
  JobState.deleting: 'Deleting',
};

const _$TypeEnumMap = {
  Type.pullRequest: 'PullRequest',
  Type.repositoryAnalysis: 'RepositoryAnalysis',
};

CodeReviewSummary _$CodeReviewSummaryFromJson(Map<String, dynamic> json) {
  return CodeReviewSummary(
    codeReviewArn: json['CodeReviewArn'] as String,
    createdTimeStamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimeStamp']),
    lastUpdatedTimeStamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimeStamp']),
    metricsSummary: json['MetricsSummary'] == null
        ? null
        : MetricsSummary.fromJson(
            json['MetricsSummary'] as Map<String, dynamic>),
    name: json['Name'] as String,
    owner: json['Owner'] as String,
    providerType:
        _$enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
    pullRequestId: json['PullRequestId'] as String,
    repositoryName: json['RepositoryName'] as String,
    state: _$enumDecodeNullable(_$JobStateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$TypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$CodeReviewTypeToJson(CodeReviewType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RepositoryAnalysis', instance.repositoryAnalysis?.toJson());
  return val;
}

CommitDiffSourceCodeType _$CommitDiffSourceCodeTypeFromJson(
    Map<String, dynamic> json) {
  return CommitDiffSourceCodeType(
    destinationCommit: json['DestinationCommit'] as String,
    sourceCommit: json['SourceCommit'] as String,
  );
}

CreateCodeReviewResponse _$CreateCodeReviewResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCodeReviewResponse(
    codeReview: json['CodeReview'] == null
        ? null
        : CodeReview.fromJson(json['CodeReview'] as Map<String, dynamic>),
  );
}

DescribeCodeReviewResponse _$DescribeCodeReviewResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCodeReviewResponse(
    codeReview: json['CodeReview'] == null
        ? null
        : CodeReview.fromJson(json['CodeReview'] as Map<String, dynamic>),
  );
}

DescribeRecommendationFeedbackResponse
    _$DescribeRecommendationFeedbackResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeRecommendationFeedbackResponse(
    recommendationFeedback: json['RecommendationFeedback'] == null
        ? null
        : RecommendationFeedback.fromJson(
            json['RecommendationFeedback'] as Map<String, dynamic>),
  );
}

DescribeRepositoryAssociationResponse
    _$DescribeRepositoryAssociationResponseFromJson(Map<String, dynamic> json) {
  return DescribeRepositoryAssociationResponse(
    repositoryAssociation: json['RepositoryAssociation'] == null
        ? null
        : RepositoryAssociation.fromJson(
            json['RepositoryAssociation'] as Map<String, dynamic>),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DisassociateRepositoryResponse _$DisassociateRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateRepositoryResponse(
    repositoryAssociation: json['RepositoryAssociation'] == null
        ? null
        : RepositoryAssociation.fromJson(
            json['RepositoryAssociation'] as Map<String, dynamic>),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListCodeReviewsResponse _$ListCodeReviewsResponseFromJson(
    Map<String, dynamic> json) {
  return ListCodeReviewsResponse(
    codeReviewSummaries: (json['CodeReviewSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : CodeReviewSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListRecommendationFeedbackResponse _$ListRecommendationFeedbackResponseFromJson(
    Map<String, dynamic> json) {
  return ListRecommendationFeedbackResponse(
    nextToken: json['NextToken'] as String,
    recommendationFeedbackSummaries: (json['RecommendationFeedbackSummaries']
            as List)
        ?.map((e) => e == null
            ? null
            : RecommendationFeedbackSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRecommendationsResponse _$ListRecommendationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRecommendationsResponse(
    nextToken: json['NextToken'] as String,
    recommendationSummaries: (json['RecommendationSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRepositoryAssociationsResponse _$ListRepositoryAssociationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRepositoryAssociationsResponse(
    nextToken: json['NextToken'] as String,
    repositoryAssociationSummaries: (json['RepositoryAssociationSummaries']
            as List)
        ?.map((e) => e == null
            ? null
            : RepositoryAssociationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Metrics _$MetricsFromJson(Map<String, dynamic> json) {
  return Metrics(
    findingsCount: json['FindingsCount'] as int,
    meteredLinesOfCodeCount: json['MeteredLinesOfCodeCount'] as int,
  );
}

MetricsSummary _$MetricsSummaryFromJson(Map<String, dynamic> json) {
  return MetricsSummary(
    findingsCount: json['FindingsCount'] as int,
    meteredLinesOfCodeCount: json['MeteredLinesOfCodeCount'] as int,
  );
}

PutRecommendationFeedbackResponse _$PutRecommendationFeedbackResponseFromJson(
    Map<String, dynamic> json) {
  return PutRecommendationFeedbackResponse();
}

RecommendationFeedback _$RecommendationFeedbackFromJson(
    Map<String, dynamic> json) {
  return RecommendationFeedback(
    codeReviewArn: json['CodeReviewArn'] as String,
    createdTimeStamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimeStamp']),
    lastUpdatedTimeStamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimeStamp']),
    reactions: (json['Reactions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ReactionEnumMap, e))
        ?.toList(),
    recommendationId: json['RecommendationId'] as String,
    userId: json['UserId'] as String,
  );
}

const _$ReactionEnumMap = {
  Reaction.thumbsUp: 'ThumbsUp',
  Reaction.thumbsDown: 'ThumbsDown',
};

RecommendationFeedbackSummary _$RecommendationFeedbackSummaryFromJson(
    Map<String, dynamic> json) {
  return RecommendationFeedbackSummary(
    reactions: (json['Reactions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ReactionEnumMap, e))
        ?.toList(),
    recommendationId: json['RecommendationId'] as String,
    userId: json['UserId'] as String,
  );
}

RecommendationSummary _$RecommendationSummaryFromJson(
    Map<String, dynamic> json) {
  return RecommendationSummary(
    description: json['Description'] as String,
    endLine: json['EndLine'] as int,
    filePath: json['FilePath'] as String,
    recommendationId: json['RecommendationId'] as String,
    startLine: json['StartLine'] as int,
  );
}

Map<String, dynamic> _$RepositoryToJson(Repository instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bitbucket', instance.bitbucket?.toJson());
  writeNotNull('CodeCommit', instance.codeCommit?.toJson());
  writeNotNull(
      'GitHubEnterpriseServer', instance.gitHubEnterpriseServer?.toJson());
  return val;
}

Map<String, dynamic> _$RepositoryAnalysisToJson(RepositoryAnalysis instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RepositoryHead', instance.repositoryHead?.toJson());
  return val;
}

RepositoryAssociation _$RepositoryAssociationFromJson(
    Map<String, dynamic> json) {
  return RepositoryAssociation(
    associationArn: json['AssociationArn'] as String,
    associationId: json['AssociationId'] as String,
    connectionArn: json['ConnectionArn'] as String,
    createdTimeStamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimeStamp']),
    lastUpdatedTimeStamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimeStamp']),
    name: json['Name'] as String,
    owner: json['Owner'] as String,
    providerType:
        _$enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
    state: _$enumDecodeNullable(
        _$RepositoryAssociationStateEnumMap, json['State']),
    stateReason: json['StateReason'] as String,
  );
}

const _$RepositoryAssociationStateEnumMap = {
  RepositoryAssociationState.associated: 'Associated',
  RepositoryAssociationState.associating: 'Associating',
  RepositoryAssociationState.failed: 'Failed',
  RepositoryAssociationState.disassociating: 'Disassociating',
  RepositoryAssociationState.disassociated: 'Disassociated',
};

RepositoryAssociationSummary _$RepositoryAssociationSummaryFromJson(
    Map<String, dynamic> json) {
  return RepositoryAssociationSummary(
    associationArn: json['AssociationArn'] as String,
    associationId: json['AssociationId'] as String,
    connectionArn: json['ConnectionArn'] as String,
    lastUpdatedTimeStamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimeStamp']),
    name: json['Name'] as String,
    owner: json['Owner'] as String,
    providerType:
        _$enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
    state: _$enumDecodeNullable(
        _$RepositoryAssociationStateEnumMap, json['State']),
  );
}

RepositoryHeadSourceCodeType _$RepositoryHeadSourceCodeTypeFromJson(
    Map<String, dynamic> json) {
  return RepositoryHeadSourceCodeType(
    branchName: json['BranchName'] as String,
  );
}

Map<String, dynamic> _$RepositoryHeadSourceCodeTypeToJson(
    RepositoryHeadSourceCodeType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BranchName', instance.branchName);
  return val;
}

SourceCodeType _$SourceCodeTypeFromJson(Map<String, dynamic> json) {
  return SourceCodeType(
    commitDiff: json['CommitDiff'] == null
        ? null
        : CommitDiffSourceCodeType.fromJson(
            json['CommitDiff'] as Map<String, dynamic>),
    repositoryHead: json['RepositoryHead'] == null
        ? null
        : RepositoryHeadSourceCodeType.fromJson(
            json['RepositoryHead'] as Map<String, dynamic>),
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$ThirdPartySourceRepositoryToJson(
    ThirdPartySourceRepository instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectionArn', instance.connectionArn);
  writeNotNull('Name', instance.name);
  writeNotNull('Owner', instance.owner);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}
