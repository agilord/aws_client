// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-04-13.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Approval _$ApprovalFromJson(Map<String, dynamic> json) {
  return Approval(
    approvalState:
        _$enumDecodeNullable(_$ApprovalStateEnumMap, json['approvalState']),
    userArn: json['userArn'] as String,
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

const _$ApprovalStateEnumMap = {
  ApprovalState.approve: 'APPROVE',
  ApprovalState.revoke: 'REVOKE',
};

ApprovalRule _$ApprovalRuleFromJson(Map<String, dynamic> json) {
  return ApprovalRule(
    approvalRuleContent: json['approvalRuleContent'] as String,
    approvalRuleId: json['approvalRuleId'] as String,
    approvalRuleName: json['approvalRuleName'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    lastModifiedUser: json['lastModifiedUser'] as String,
    originApprovalRuleTemplate: json['originApprovalRuleTemplate'] == null
        ? null
        : OriginApprovalRuleTemplate.fromJson(
            json['originApprovalRuleTemplate'] as Map<String, dynamic>),
    ruleContentSha256: json['ruleContentSha256'] as String,
  );
}

ApprovalRuleEventMetadata _$ApprovalRuleEventMetadataFromJson(
    Map<String, dynamic> json) {
  return ApprovalRuleEventMetadata(
    approvalRuleContent: json['approvalRuleContent'] as String,
    approvalRuleId: json['approvalRuleId'] as String,
    approvalRuleName: json['approvalRuleName'] as String,
  );
}

ApprovalRuleOverriddenEventMetadata
    _$ApprovalRuleOverriddenEventMetadataFromJson(Map<String, dynamic> json) {
  return ApprovalRuleOverriddenEventMetadata(
    overrideStatus:
        _$enumDecodeNullable(_$OverrideStatusEnumMap, json['overrideStatus']),
    revisionId: json['revisionId'] as String,
  );
}

const _$OverrideStatusEnumMap = {
  OverrideStatus.override: 'OVERRIDE',
  OverrideStatus.revoke: 'REVOKE',
};

ApprovalRuleTemplate _$ApprovalRuleTemplateFromJson(Map<String, dynamic> json) {
  return ApprovalRuleTemplate(
    approvalRuleTemplateContent: json['approvalRuleTemplateContent'] as String,
    approvalRuleTemplateDescription:
        json['approvalRuleTemplateDescription'] as String,
    approvalRuleTemplateId: json['approvalRuleTemplateId'] as String,
    approvalRuleTemplateName: json['approvalRuleTemplateName'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    lastModifiedUser: json['lastModifiedUser'] as String,
    ruleContentSha256: json['ruleContentSha256'] as String,
  );
}

ApprovalStateChangedEventMetadata _$ApprovalStateChangedEventMetadataFromJson(
    Map<String, dynamic> json) {
  return ApprovalStateChangedEventMetadata(
    approvalStatus:
        _$enumDecodeNullable(_$ApprovalStateEnumMap, json['approvalStatus']),
    revisionId: json['revisionId'] as String,
  );
}

BatchAssociateApprovalRuleTemplateWithRepositoriesError
    _$BatchAssociateApprovalRuleTemplateWithRepositoriesErrorFromJson(
        Map<String, dynamic> json) {
  return BatchAssociateApprovalRuleTemplateWithRepositoriesError(
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

BatchAssociateApprovalRuleTemplateWithRepositoriesOutput
    _$BatchAssociateApprovalRuleTemplateWithRepositoriesOutputFromJson(
        Map<String, dynamic> json) {
  return BatchAssociateApprovalRuleTemplateWithRepositoriesOutput(
    associatedRepositoryNames: (json['associatedRepositoryNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchAssociateApprovalRuleTemplateWithRepositoriesError.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDescribeMergeConflictsError _$BatchDescribeMergeConflictsErrorFromJson(
    Map<String, dynamic> json) {
  return BatchDescribeMergeConflictsError(
    exceptionName: json['exceptionName'] as String,
    filePath: json['filePath'] as String,
    message: json['message'] as String,
  );
}

BatchDescribeMergeConflictsOutput _$BatchDescribeMergeConflictsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchDescribeMergeConflictsOutput(
    conflicts: (json['conflicts'] as List)
        ?.map((e) =>
            e == null ? null : Conflict.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    destinationCommitId: json['destinationCommitId'] as String,
    sourceCommitId: json['sourceCommitId'] as String,
    baseCommitId: json['baseCommitId'] as String,
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDescribeMergeConflictsError.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

BatchDisassociateApprovalRuleTemplateFromRepositoriesError
    _$BatchDisassociateApprovalRuleTemplateFromRepositoriesErrorFromJson(
        Map<String, dynamic> json) {
  return BatchDisassociateApprovalRuleTemplateFromRepositoriesError(
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput
    _$BatchDisassociateApprovalRuleTemplateFromRepositoriesOutputFromJson(
        Map<String, dynamic> json) {
  return BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput(
    disassociatedRepositoryNames: (json['disassociatedRepositoryNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDisassociateApprovalRuleTemplateFromRepositoriesError
                .fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetCommitsError _$BatchGetCommitsErrorFromJson(Map<String, dynamic> json) {
  return BatchGetCommitsError(
    commitId: json['commitId'] as String,
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
  );
}

BatchGetCommitsOutput _$BatchGetCommitsOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetCommitsOutput(
    commits: (json['commits'] as List)
        ?.map((e) =>
            e == null ? null : Commit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchGetCommitsError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetRepositoriesOutput _$BatchGetRepositoriesOutputFromJson(
    Map<String, dynamic> json) {
  return BatchGetRepositoriesOutput(
    repositories: (json['repositories'] as List)
        ?.map((e) => e == null
            ? null
            : RepositoryMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    repositoriesNotFound: (json['repositoriesNotFound'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

BlobMetadata _$BlobMetadataFromJson(Map<String, dynamic> json) {
  return BlobMetadata(
    blobId: json['blobId'] as String,
    mode: json['mode'] as String,
    path: json['path'] as String,
  );
}

BranchInfo _$BranchInfoFromJson(Map<String, dynamic> json) {
  return BranchInfo(
    branchName: json['branchName'] as String,
    commitId: json['commitId'] as String,
  );
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    authorArn: json['authorArn'] as String,
    callerReactions:
        (json['callerReactions'] as List)?.map((e) => e as String)?.toList(),
    clientRequestToken: json['clientRequestToken'] as String,
    commentId: json['commentId'] as String,
    content: json['content'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    deleted: json['deleted'] as bool,
    inReplyTo: json['inReplyTo'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    reactionCounts: (json['reactionCounts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
  );
}

CommentsForComparedCommit _$CommentsForComparedCommitFromJson(
    Map<String, dynamic> json) {
  return CommentsForComparedCommit(
    afterBlobId: json['afterBlobId'] as String,
    afterCommitId: json['afterCommitId'] as String,
    beforeBlobId: json['beforeBlobId'] as String,
    beforeCommitId: json['beforeCommitId'] as String,
    comments: (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    repositoryName: json['repositoryName'] as String,
  );
}

CommentsForPullRequest _$CommentsForPullRequestFromJson(
    Map<String, dynamic> json) {
  return CommentsForPullRequest(
    afterBlobId: json['afterBlobId'] as String,
    afterCommitId: json['afterCommitId'] as String,
    beforeBlobId: json['beforeBlobId'] as String,
    beforeCommitId: json['beforeCommitId'] as String,
    comments: (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    pullRequestId: json['pullRequestId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

Commit _$CommitFromJson(Map<String, dynamic> json) {
  return Commit(
    additionalData: json['additionalData'] as String,
    author: json['author'] == null
        ? null
        : UserInfo.fromJson(json['author'] as Map<String, dynamic>),
    commitId: json['commitId'] as String,
    committer: json['committer'] == null
        ? null
        : UserInfo.fromJson(json['committer'] as Map<String, dynamic>),
    message: json['message'] as String,
    parents: (json['parents'] as List)?.map((e) => e as String)?.toList(),
    treeId: json['treeId'] as String,
  );
}

Conflict _$ConflictFromJson(Map<String, dynamic> json) {
  return Conflict(
    conflictMetadata: json['conflictMetadata'] == null
        ? null
        : ConflictMetadata.fromJson(
            json['conflictMetadata'] as Map<String, dynamic>),
    mergeHunks: (json['mergeHunks'] as List)
        ?.map((e) =>
            e == null ? null : MergeHunk.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ConflictMetadata _$ConflictMetadataFromJson(Map<String, dynamic> json) {
  return ConflictMetadata(
    contentConflict: json['contentConflict'] as bool,
    fileModeConflict: json['fileModeConflict'] as bool,
    fileModes: json['fileModes'] == null
        ? null
        : FileModes.fromJson(json['fileModes'] as Map<String, dynamic>),
    filePath: json['filePath'] as String,
    fileSizes: json['fileSizes'] == null
        ? null
        : FileSizes.fromJson(json['fileSizes'] as Map<String, dynamic>),
    isBinaryFile: json['isBinaryFile'] == null
        ? null
        : IsBinaryFile.fromJson(json['isBinaryFile'] as Map<String, dynamic>),
    mergeOperations: json['mergeOperations'] == null
        ? null
        : MergeOperations.fromJson(
            json['mergeOperations'] as Map<String, dynamic>),
    numberOfConflicts: json['numberOfConflicts'] as int,
    objectTypeConflict: json['objectTypeConflict'] as bool,
    objectTypes: json['objectTypes'] == null
        ? null
        : ObjectTypes.fromJson(json['objectTypes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConflictResolutionToJson(ConflictResolution instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'deleteFiles', instance.deleteFiles?.map((e) => e?.toJson())?.toList());
  writeNotNull('replaceContents',
      instance.replaceContents?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'setFileModes', instance.setFileModes?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateApprovalRuleTemplateOutput _$CreateApprovalRuleTemplateOutputFromJson(
    Map<String, dynamic> json) {
  return CreateApprovalRuleTemplateOutput(
    approvalRuleTemplate: json['approvalRuleTemplate'] == null
        ? null
        : ApprovalRuleTemplate.fromJson(
            json['approvalRuleTemplate'] as Map<String, dynamic>),
  );
}

CreateCommitOutput _$CreateCommitOutputFromJson(Map<String, dynamic> json) {
  return CreateCommitOutput(
    commitId: json['commitId'] as String,
    filesAdded: (json['filesAdded'] as List)
        ?.map((e) =>
            e == null ? null : FileMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    filesDeleted: (json['filesDeleted'] as List)
        ?.map((e) =>
            e == null ? null : FileMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    filesUpdated: (json['filesUpdated'] as List)
        ?.map((e) =>
            e == null ? null : FileMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    treeId: json['treeId'] as String,
  );
}

CreatePullRequestApprovalRuleOutput
    _$CreatePullRequestApprovalRuleOutputFromJson(Map<String, dynamic> json) {
  return CreatePullRequestApprovalRuleOutput(
    approvalRule: json['approvalRule'] == null
        ? null
        : ApprovalRule.fromJson(json['approvalRule'] as Map<String, dynamic>),
  );
}

CreatePullRequestOutput _$CreatePullRequestOutputFromJson(
    Map<String, dynamic> json) {
  return CreatePullRequestOutput(
    pullRequest: json['pullRequest'] == null
        ? null
        : PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
  );
}

CreateRepositoryOutput _$CreateRepositoryOutputFromJson(
    Map<String, dynamic> json) {
  return CreateRepositoryOutput(
    repositoryMetadata: json['repositoryMetadata'] == null
        ? null
        : RepositoryMetadata.fromJson(
            json['repositoryMetadata'] as Map<String, dynamic>),
  );
}

CreateUnreferencedMergeCommitOutput
    _$CreateUnreferencedMergeCommitOutputFromJson(Map<String, dynamic> json) {
  return CreateUnreferencedMergeCommitOutput(
    commitId: json['commitId'] as String,
    treeId: json['treeId'] as String,
  );
}

DeleteApprovalRuleTemplateOutput _$DeleteApprovalRuleTemplateOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteApprovalRuleTemplateOutput(
    approvalRuleTemplateId: json['approvalRuleTemplateId'] as String,
  );
}

DeleteBranchOutput _$DeleteBranchOutputFromJson(Map<String, dynamic> json) {
  return DeleteBranchOutput(
    deletedBranch: json['deletedBranch'] == null
        ? null
        : BranchInfo.fromJson(json['deletedBranch'] as Map<String, dynamic>),
  );
}

DeleteCommentContentOutput _$DeleteCommentContentOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteCommentContentOutput(
    comment: json['comment'] == null
        ? null
        : Comment.fromJson(json['comment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteFileEntryToJson(DeleteFileEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filePath', instance.filePath);
  return val;
}

DeleteFileOutput _$DeleteFileOutputFromJson(Map<String, dynamic> json) {
  return DeleteFileOutput(
    blobId: json['blobId'] as String,
    commitId: json['commitId'] as String,
    filePath: json['filePath'] as String,
    treeId: json['treeId'] as String,
  );
}

DeletePullRequestApprovalRuleOutput
    _$DeletePullRequestApprovalRuleOutputFromJson(Map<String, dynamic> json) {
  return DeletePullRequestApprovalRuleOutput(
    approvalRuleId: json['approvalRuleId'] as String,
  );
}

DeleteRepositoryOutput _$DeleteRepositoryOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteRepositoryOutput(
    repositoryId: json['repositoryId'] as String,
  );
}

DescribeMergeConflictsOutput _$DescribeMergeConflictsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeMergeConflictsOutput(
    conflictMetadata: json['conflictMetadata'] == null
        ? null
        : ConflictMetadata.fromJson(
            json['conflictMetadata'] as Map<String, dynamic>),
    destinationCommitId: json['destinationCommitId'] as String,
    mergeHunks: (json['mergeHunks'] as List)
        ?.map((e) =>
            e == null ? null : MergeHunk.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceCommitId: json['sourceCommitId'] as String,
    baseCommitId: json['baseCommitId'] as String,
    nextToken: json['nextToken'] as String,
  );
}

DescribePullRequestEventsOutput _$DescribePullRequestEventsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribePullRequestEventsOutput(
    pullRequestEvents: (json['pullRequestEvents'] as List)
        ?.map((e) => e == null
            ? null
            : PullRequestEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Difference _$DifferenceFromJson(Map<String, dynamic> json) {
  return Difference(
    afterBlob: json['afterBlob'] == null
        ? null
        : BlobMetadata.fromJson(json['afterBlob'] as Map<String, dynamic>),
    beforeBlob: json['beforeBlob'] == null
        ? null
        : BlobMetadata.fromJson(json['beforeBlob'] as Map<String, dynamic>),
    changeType:
        _$enumDecodeNullable(_$ChangeTypeEnumEnumMap, json['changeType']),
  );
}

const _$ChangeTypeEnumEnumMap = {
  ChangeTypeEnum.a: 'A',
  ChangeTypeEnum.m: 'M',
  ChangeTypeEnum.d: 'D',
};

EvaluatePullRequestApprovalRulesOutput
    _$EvaluatePullRequestApprovalRulesOutputFromJson(
        Map<String, dynamic> json) {
  return EvaluatePullRequestApprovalRulesOutput(
    evaluation: json['evaluation'] == null
        ? null
        : Evaluation.fromJson(json['evaluation'] as Map<String, dynamic>),
  );
}

Evaluation _$EvaluationFromJson(Map<String, dynamic> json) {
  return Evaluation(
    approvalRulesNotSatisfied: (json['approvalRulesNotSatisfied'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    approvalRulesSatisfied: (json['approvalRulesSatisfied'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    approved: json['approved'] as bool,
    overridden: json['overridden'] as bool,
  );
}

File _$FileFromJson(Map<String, dynamic> json) {
  return File(
    absolutePath: json['absolutePath'] as String,
    blobId: json['blobId'] as String,
    fileMode: _$enumDecodeNullable(_$FileModeTypeEnumEnumMap, json['fileMode']),
    relativePath: json['relativePath'] as String,
  );
}

const _$FileModeTypeEnumEnumMap = {
  FileModeTypeEnum.executable: 'EXECUTABLE',
  FileModeTypeEnum.normal: 'NORMAL',
  FileModeTypeEnum.symlink: 'SYMLINK',
};

FileMetadata _$FileMetadataFromJson(Map<String, dynamic> json) {
  return FileMetadata(
    absolutePath: json['absolutePath'] as String,
    blobId: json['blobId'] as String,
    fileMode: _$enumDecodeNullable(_$FileModeTypeEnumEnumMap, json['fileMode']),
  );
}

FileModes _$FileModesFromJson(Map<String, dynamic> json) {
  return FileModes(
    base: _$enumDecodeNullable(_$FileModeTypeEnumEnumMap, json['base']),
    destination:
        _$enumDecodeNullable(_$FileModeTypeEnumEnumMap, json['destination']),
    source: _$enumDecodeNullable(_$FileModeTypeEnumEnumMap, json['source']),
  );
}

FileSizes _$FileSizesFromJson(Map<String, dynamic> json) {
  return FileSizes(
    base: json['base'] as int,
    destination: json['destination'] as int,
    source: json['source'] as int,
  );
}

Folder _$FolderFromJson(Map<String, dynamic> json) {
  return Folder(
    absolutePath: json['absolutePath'] as String,
    relativePath: json['relativePath'] as String,
    treeId: json['treeId'] as String,
  );
}

GetApprovalRuleTemplateOutput _$GetApprovalRuleTemplateOutputFromJson(
    Map<String, dynamic> json) {
  return GetApprovalRuleTemplateOutput(
    approvalRuleTemplate: json['approvalRuleTemplate'] == null
        ? null
        : ApprovalRuleTemplate.fromJson(
            json['approvalRuleTemplate'] as Map<String, dynamic>),
  );
}

GetBlobOutput _$GetBlobOutputFromJson(Map<String, dynamic> json) {
  return GetBlobOutput(
    content: const Uint8ListConverter().fromJson(json['content'] as String),
  );
}

GetBranchOutput _$GetBranchOutputFromJson(Map<String, dynamic> json) {
  return GetBranchOutput(
    branch: json['branch'] == null
        ? null
        : BranchInfo.fromJson(json['branch'] as Map<String, dynamic>),
  );
}

GetCommentOutput _$GetCommentOutputFromJson(Map<String, dynamic> json) {
  return GetCommentOutput(
    comment: json['comment'] == null
        ? null
        : Comment.fromJson(json['comment'] as Map<String, dynamic>),
  );
}

GetCommentReactionsOutput _$GetCommentReactionsOutputFromJson(
    Map<String, dynamic> json) {
  return GetCommentReactionsOutput(
    reactionsForComment: (json['reactionsForComment'] as List)
        ?.map((e) => e == null
            ? null
            : ReactionForComment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetCommentsForComparedCommitOutput _$GetCommentsForComparedCommitOutputFromJson(
    Map<String, dynamic> json) {
  return GetCommentsForComparedCommitOutput(
    commentsForComparedCommitData:
        (json['commentsForComparedCommitData'] as List)
            ?.map((e) => e == null
                ? null
                : CommentsForComparedCommit.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetCommentsForPullRequestOutput _$GetCommentsForPullRequestOutputFromJson(
    Map<String, dynamic> json) {
  return GetCommentsForPullRequestOutput(
    commentsForPullRequestData: (json['commentsForPullRequestData'] as List)
        ?.map((e) => e == null
            ? null
            : CommentsForPullRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetCommitOutput _$GetCommitOutputFromJson(Map<String, dynamic> json) {
  return GetCommitOutput(
    commit: json['commit'] == null
        ? null
        : Commit.fromJson(json['commit'] as Map<String, dynamic>),
  );
}

GetDifferencesOutput _$GetDifferencesOutputFromJson(Map<String, dynamic> json) {
  return GetDifferencesOutput(
    nextToken: json['NextToken'] as String,
    differences: (json['differences'] as List)
        ?.map((e) =>
            e == null ? null : Difference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetFileOutput _$GetFileOutputFromJson(Map<String, dynamic> json) {
  return GetFileOutput(
    blobId: json['blobId'] as String,
    commitId: json['commitId'] as String,
    fileContent:
        const Uint8ListConverter().fromJson(json['fileContent'] as String),
    fileMode: _$enumDecodeNullable(_$FileModeTypeEnumEnumMap, json['fileMode']),
    filePath: json['filePath'] as String,
    fileSize: json['fileSize'] as int,
  );
}

GetFolderOutput _$GetFolderOutputFromJson(Map<String, dynamic> json) {
  return GetFolderOutput(
    commitId: json['commitId'] as String,
    folderPath: json['folderPath'] as String,
    files: (json['files'] as List)
        ?.map(
            (e) => e == null ? null : File.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subFolders: (json['subFolders'] as List)
        ?.map((e) =>
            e == null ? null : Folder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subModules: (json['subModules'] as List)
        ?.map((e) =>
            e == null ? null : SubModule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    symbolicLinks: (json['symbolicLinks'] as List)
        ?.map((e) =>
            e == null ? null : SymbolicLink.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    treeId: json['treeId'] as String,
  );
}

GetMergeCommitOutput _$GetMergeCommitOutputFromJson(Map<String, dynamic> json) {
  return GetMergeCommitOutput(
    baseCommitId: json['baseCommitId'] as String,
    destinationCommitId: json['destinationCommitId'] as String,
    mergedCommitId: json['mergedCommitId'] as String,
    sourceCommitId: json['sourceCommitId'] as String,
  );
}

GetMergeConflictsOutput _$GetMergeConflictsOutputFromJson(
    Map<String, dynamic> json) {
  return GetMergeConflictsOutput(
    conflictMetadataList: (json['conflictMetadataList'] as List)
        ?.map((e) => e == null
            ? null
            : ConflictMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    destinationCommitId: json['destinationCommitId'] as String,
    mergeable: json['mergeable'] as bool,
    sourceCommitId: json['sourceCommitId'] as String,
    baseCommitId: json['baseCommitId'] as String,
    nextToken: json['nextToken'] as String,
  );
}

GetMergeOptionsOutput _$GetMergeOptionsOutputFromJson(
    Map<String, dynamic> json) {
  return GetMergeOptionsOutput(
    baseCommitId: json['baseCommitId'] as String,
    destinationCommitId: json['destinationCommitId'] as String,
    mergeOptions: (json['mergeOptions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$MergeOptionTypeEnumEnumMap, e))
        ?.toList(),
    sourceCommitId: json['sourceCommitId'] as String,
  );
}

const _$MergeOptionTypeEnumEnumMap = {
  MergeOptionTypeEnum.fastForwardMerge: 'FAST_FORWARD_MERGE',
  MergeOptionTypeEnum.squashMerge: 'SQUASH_MERGE',
  MergeOptionTypeEnum.threeWayMerge: 'THREE_WAY_MERGE',
};

GetPullRequestApprovalStatesOutput _$GetPullRequestApprovalStatesOutputFromJson(
    Map<String, dynamic> json) {
  return GetPullRequestApprovalStatesOutput(
    approvals: (json['approvals'] as List)
        ?.map((e) =>
            e == null ? null : Approval.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetPullRequestOutput _$GetPullRequestOutputFromJson(Map<String, dynamic> json) {
  return GetPullRequestOutput(
    pullRequest: json['pullRequest'] == null
        ? null
        : PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
  );
}

GetPullRequestOverrideStateOutput _$GetPullRequestOverrideStateOutputFromJson(
    Map<String, dynamic> json) {
  return GetPullRequestOverrideStateOutput(
    overridden: json['overridden'] as bool,
    overrider: json['overrider'] as String,
  );
}

GetRepositoryOutput _$GetRepositoryOutputFromJson(Map<String, dynamic> json) {
  return GetRepositoryOutput(
    repositoryMetadata: json['repositoryMetadata'] == null
        ? null
        : RepositoryMetadata.fromJson(
            json['repositoryMetadata'] as Map<String, dynamic>),
  );
}

GetRepositoryTriggersOutput _$GetRepositoryTriggersOutputFromJson(
    Map<String, dynamic> json) {
  return GetRepositoryTriggersOutput(
    configurationId: json['configurationId'] as String,
    triggers: (json['triggers'] as List)
        ?.map((e) => e == null
            ? null
            : RepositoryTrigger.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

IsBinaryFile _$IsBinaryFileFromJson(Map<String, dynamic> json) {
  return IsBinaryFile(
    base: json['base'] as bool,
    destination: json['destination'] as bool,
    source: json['source'] as bool,
  );
}

ListApprovalRuleTemplatesOutput _$ListApprovalRuleTemplatesOutputFromJson(
    Map<String, dynamic> json) {
  return ListApprovalRuleTemplatesOutput(
    approvalRuleTemplateNames: (json['approvalRuleTemplateNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssociatedApprovalRuleTemplatesForRepositoryOutput
    _$ListAssociatedApprovalRuleTemplatesForRepositoryOutputFromJson(
        Map<String, dynamic> json) {
  return ListAssociatedApprovalRuleTemplatesForRepositoryOutput(
    approvalRuleTemplateNames: (json['approvalRuleTemplateNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListBranchesOutput _$ListBranchesOutputFromJson(Map<String, dynamic> json) {
  return ListBranchesOutput(
    branches: (json['branches'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListPullRequestsOutput _$ListPullRequestsOutputFromJson(
    Map<String, dynamic> json) {
  return ListPullRequestsOutput(
    pullRequestIds:
        (json['pullRequestIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListRepositoriesForApprovalRuleTemplateOutput
    _$ListRepositoriesForApprovalRuleTemplateOutputFromJson(
        Map<String, dynamic> json) {
  return ListRepositoriesForApprovalRuleTemplateOutput(
    nextToken: json['nextToken'] as String,
    repositoryNames:
        (json['repositoryNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListRepositoriesOutput _$ListRepositoriesOutputFromJson(
    Map<String, dynamic> json) {
  return ListRepositoriesOutput(
    nextToken: json['nextToken'] as String,
    repositories: (json['repositories'] as List)
        ?.map((e) => e == null
            ? null
            : RepositoryNameIdPair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    nextToken: json['nextToken'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    filePath: json['filePath'] as String,
    filePosition: json['filePosition'] as int,
    relativeFileVersion: _$enumDecodeNullable(
        _$RelativeFileVersionEnumEnumMap, json['relativeFileVersion']),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filePath', instance.filePath);
  writeNotNull('filePosition', instance.filePosition);
  writeNotNull('relativeFileVersion',
      _$RelativeFileVersionEnumEnumMap[instance.relativeFileVersion]);
  return val;
}

const _$RelativeFileVersionEnumEnumMap = {
  RelativeFileVersionEnum.before: 'BEFORE',
  RelativeFileVersionEnum.after: 'AFTER',
};

MergeBranchesByFastForwardOutput _$MergeBranchesByFastForwardOutputFromJson(
    Map<String, dynamic> json) {
  return MergeBranchesByFastForwardOutput(
    commitId: json['commitId'] as String,
    treeId: json['treeId'] as String,
  );
}

MergeBranchesBySquashOutput _$MergeBranchesBySquashOutputFromJson(
    Map<String, dynamic> json) {
  return MergeBranchesBySquashOutput(
    commitId: json['commitId'] as String,
    treeId: json['treeId'] as String,
  );
}

MergeBranchesByThreeWayOutput _$MergeBranchesByThreeWayOutputFromJson(
    Map<String, dynamic> json) {
  return MergeBranchesByThreeWayOutput(
    commitId: json['commitId'] as String,
    treeId: json['treeId'] as String,
  );
}

MergeHunk _$MergeHunkFromJson(Map<String, dynamic> json) {
  return MergeHunk(
    base: json['base'] == null
        ? null
        : MergeHunkDetail.fromJson(json['base'] as Map<String, dynamic>),
    destination: json['destination'] == null
        ? null
        : MergeHunkDetail.fromJson(json['destination'] as Map<String, dynamic>),
    isConflict: json['isConflict'] as bool,
    source: json['source'] == null
        ? null
        : MergeHunkDetail.fromJson(json['source'] as Map<String, dynamic>),
  );
}

MergeHunkDetail _$MergeHunkDetailFromJson(Map<String, dynamic> json) {
  return MergeHunkDetail(
    endLine: json['endLine'] as int,
    hunkContent: json['hunkContent'] as String,
    startLine: json['startLine'] as int,
  );
}

MergeMetadata _$MergeMetadataFromJson(Map<String, dynamic> json) {
  return MergeMetadata(
    isMerged: json['isMerged'] as bool,
    mergeCommitId: json['mergeCommitId'] as String,
    mergeOption:
        _$enumDecodeNullable(_$MergeOptionTypeEnumEnumMap, json['mergeOption']),
    mergedBy: json['mergedBy'] as String,
  );
}

MergeOperations _$MergeOperationsFromJson(Map<String, dynamic> json) {
  return MergeOperations(
    destination:
        _$enumDecodeNullable(_$ChangeTypeEnumEnumMap, json['destination']),
    source: _$enumDecodeNullable(_$ChangeTypeEnumEnumMap, json['source']),
  );
}

MergePullRequestByFastForwardOutput
    _$MergePullRequestByFastForwardOutputFromJson(Map<String, dynamic> json) {
  return MergePullRequestByFastForwardOutput(
    pullRequest: json['pullRequest'] == null
        ? null
        : PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
  );
}

MergePullRequestBySquashOutput _$MergePullRequestBySquashOutputFromJson(
    Map<String, dynamic> json) {
  return MergePullRequestBySquashOutput(
    pullRequest: json['pullRequest'] == null
        ? null
        : PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
  );
}

MergePullRequestByThreeWayOutput _$MergePullRequestByThreeWayOutputFromJson(
    Map<String, dynamic> json) {
  return MergePullRequestByThreeWayOutput(
    pullRequest: json['pullRequest'] == null
        ? null
        : PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
  );
}

ObjectTypes _$ObjectTypesFromJson(Map<String, dynamic> json) {
  return ObjectTypes(
    base: _$enumDecodeNullable(_$ObjectTypeEnumEnumMap, json['base']),
    destination:
        _$enumDecodeNullable(_$ObjectTypeEnumEnumMap, json['destination']),
    source: _$enumDecodeNullable(_$ObjectTypeEnumEnumMap, json['source']),
  );
}

const _$ObjectTypeEnumEnumMap = {
  ObjectTypeEnum.file: 'FILE',
  ObjectTypeEnum.directory: 'DIRECTORY',
  ObjectTypeEnum.gitLink: 'GIT_LINK',
  ObjectTypeEnum.symbolicLink: 'SYMBOLIC_LINK',
};

OriginApprovalRuleTemplate _$OriginApprovalRuleTemplateFromJson(
    Map<String, dynamic> json) {
  return OriginApprovalRuleTemplate(
    approvalRuleTemplateId: json['approvalRuleTemplateId'] as String,
    approvalRuleTemplateName: json['approvalRuleTemplateName'] as String,
  );
}

PostCommentForComparedCommitOutput _$PostCommentForComparedCommitOutputFromJson(
    Map<String, dynamic> json) {
  return PostCommentForComparedCommitOutput(
    afterBlobId: json['afterBlobId'] as String,
    afterCommitId: json['afterCommitId'] as String,
    beforeBlobId: json['beforeBlobId'] as String,
    beforeCommitId: json['beforeCommitId'] as String,
    comment: json['comment'] == null
        ? null
        : Comment.fromJson(json['comment'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    repositoryName: json['repositoryName'] as String,
  );
}

PostCommentForPullRequestOutput _$PostCommentForPullRequestOutputFromJson(
    Map<String, dynamic> json) {
  return PostCommentForPullRequestOutput(
    afterBlobId: json['afterBlobId'] as String,
    afterCommitId: json['afterCommitId'] as String,
    beforeBlobId: json['beforeBlobId'] as String,
    beforeCommitId: json['beforeCommitId'] as String,
    comment: json['comment'] == null
        ? null
        : Comment.fromJson(json['comment'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    pullRequestId: json['pullRequestId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

PostCommentReplyOutput _$PostCommentReplyOutputFromJson(
    Map<String, dynamic> json) {
  return PostCommentReplyOutput(
    comment: json['comment'] == null
        ? null
        : Comment.fromJson(json['comment'] as Map<String, dynamic>),
  );
}

PullRequest _$PullRequestFromJson(Map<String, dynamic> json) {
  return PullRequest(
    approvalRules: (json['approvalRules'] as List)
        ?.map((e) =>
            e == null ? null : ApprovalRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    authorArn: json['authorArn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    description: json['description'] as String,
    lastActivityDate:
        const UnixDateTimeConverter().fromJson(json['lastActivityDate']),
    pullRequestId: json['pullRequestId'] as String,
    pullRequestStatus: _$enumDecodeNullable(
        _$PullRequestStatusEnumEnumMap, json['pullRequestStatus']),
    pullRequestTargets: (json['pullRequestTargets'] as List)
        ?.map((e) => e == null
            ? null
            : PullRequestTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    revisionId: json['revisionId'] as String,
    title: json['title'] as String,
  );
}

const _$PullRequestStatusEnumEnumMap = {
  PullRequestStatusEnum.open: 'OPEN',
  PullRequestStatusEnum.closed: 'CLOSED',
};

PullRequestCreatedEventMetadata _$PullRequestCreatedEventMetadataFromJson(
    Map<String, dynamic> json) {
  return PullRequestCreatedEventMetadata(
    destinationCommitId: json['destinationCommitId'] as String,
    mergeBase: json['mergeBase'] as String,
    repositoryName: json['repositoryName'] as String,
    sourceCommitId: json['sourceCommitId'] as String,
  );
}

PullRequestEvent _$PullRequestEventFromJson(Map<String, dynamic> json) {
  return PullRequestEvent(
    actorArn: json['actorArn'] as String,
    approvalRuleEventMetadata: json['approvalRuleEventMetadata'] == null
        ? null
        : ApprovalRuleEventMetadata.fromJson(
            json['approvalRuleEventMetadata'] as Map<String, dynamic>),
    approvalRuleOverriddenEventMetadata:
        json['approvalRuleOverriddenEventMetadata'] == null
            ? null
            : ApprovalRuleOverriddenEventMetadata.fromJson(
                json['approvalRuleOverriddenEventMetadata']
                    as Map<String, dynamic>),
    approvalStateChangedEventMetadata:
        json['approvalStateChangedEventMetadata'] == null
            ? null
            : ApprovalStateChangedEventMetadata.fromJson(
                json['approvalStateChangedEventMetadata']
                    as Map<String, dynamic>),
    eventDate: const UnixDateTimeConverter().fromJson(json['eventDate']),
    pullRequestCreatedEventMetadata: json['pullRequestCreatedEventMetadata'] ==
            null
        ? null
        : PullRequestCreatedEventMetadata.fromJson(
            json['pullRequestCreatedEventMetadata'] as Map<String, dynamic>),
    pullRequestEventType: _$enumDecodeNullable(
        _$PullRequestEventTypeEnumMap, json['pullRequestEventType']),
    pullRequestId: json['pullRequestId'] as String,
    pullRequestMergedStateChangedEventMetadata:
        json['pullRequestMergedStateChangedEventMetadata'] == null
            ? null
            : PullRequestMergedStateChangedEventMetadata.fromJson(
                json['pullRequestMergedStateChangedEventMetadata']
                    as Map<String, dynamic>),
    pullRequestSourceReferenceUpdatedEventMetadata:
        json['pullRequestSourceReferenceUpdatedEventMetadata'] == null
            ? null
            : PullRequestSourceReferenceUpdatedEventMetadata.fromJson(
                json['pullRequestSourceReferenceUpdatedEventMetadata']
                    as Map<String, dynamic>),
    pullRequestStatusChangedEventMetadata:
        json['pullRequestStatusChangedEventMetadata'] == null
            ? null
            : PullRequestStatusChangedEventMetadata.fromJson(
                json['pullRequestStatusChangedEventMetadata']
                    as Map<String, dynamic>),
  );
}

const _$PullRequestEventTypeEnumMap = {
  PullRequestEventType.pullRequestCreated: 'PULL_REQUEST_CREATED',
  PullRequestEventType.pullRequestStatusChanged: 'PULL_REQUEST_STATUS_CHANGED',
  PullRequestEventType.pullRequestSourceReferenceUpdated:
      'PULL_REQUEST_SOURCE_REFERENCE_UPDATED',
  PullRequestEventType.pullRequestMergeStateChanged:
      'PULL_REQUEST_MERGE_STATE_CHANGED',
  PullRequestEventType.pullRequestApprovalRuleCreated:
      'PULL_REQUEST_APPROVAL_RULE_CREATED',
  PullRequestEventType.pullRequestApprovalRuleUpdated:
      'PULL_REQUEST_APPROVAL_RULE_UPDATED',
  PullRequestEventType.pullRequestApprovalRuleDeleted:
      'PULL_REQUEST_APPROVAL_RULE_DELETED',
  PullRequestEventType.pullRequestApprovalRuleOverridden:
      'PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN',
  PullRequestEventType.pullRequestApprovalStateChanged:
      'PULL_REQUEST_APPROVAL_STATE_CHANGED',
};

PullRequestMergedStateChangedEventMetadata
    _$PullRequestMergedStateChangedEventMetadataFromJson(
        Map<String, dynamic> json) {
  return PullRequestMergedStateChangedEventMetadata(
    destinationReference: json['destinationReference'] as String,
    mergeMetadata: json['mergeMetadata'] == null
        ? null
        : MergeMetadata.fromJson(json['mergeMetadata'] as Map<String, dynamic>),
    repositoryName: json['repositoryName'] as String,
  );
}

PullRequestSourceReferenceUpdatedEventMetadata
    _$PullRequestSourceReferenceUpdatedEventMetadataFromJson(
        Map<String, dynamic> json) {
  return PullRequestSourceReferenceUpdatedEventMetadata(
    afterCommitId: json['afterCommitId'] as String,
    beforeCommitId: json['beforeCommitId'] as String,
    mergeBase: json['mergeBase'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

PullRequestStatusChangedEventMetadata
    _$PullRequestStatusChangedEventMetadataFromJson(Map<String, dynamic> json) {
  return PullRequestStatusChangedEventMetadata(
    pullRequestStatus: _$enumDecodeNullable(
        _$PullRequestStatusEnumEnumMap, json['pullRequestStatus']),
  );
}

PullRequestTarget _$PullRequestTargetFromJson(Map<String, dynamic> json) {
  return PullRequestTarget(
    destinationCommit: json['destinationCommit'] as String,
    destinationReference: json['destinationReference'] as String,
    mergeBase: json['mergeBase'] as String,
    mergeMetadata: json['mergeMetadata'] == null
        ? null
        : MergeMetadata.fromJson(json['mergeMetadata'] as Map<String, dynamic>),
    repositoryName: json['repositoryName'] as String,
    sourceCommit: json['sourceCommit'] as String,
    sourceReference: json['sourceReference'] as String,
  );
}

Map<String, dynamic> _$PutFileEntryToJson(PutFileEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filePath', instance.filePath);
  writeNotNull(
      'fileContent', const Uint8ListConverter().toJson(instance.fileContent));
  writeNotNull('fileMode', _$FileModeTypeEnumEnumMap[instance.fileMode]);
  writeNotNull('sourceFile', instance.sourceFile?.toJson());
  return val;
}

PutFileOutput _$PutFileOutputFromJson(Map<String, dynamic> json) {
  return PutFileOutput(
    blobId: json['blobId'] as String,
    commitId: json['commitId'] as String,
    treeId: json['treeId'] as String,
  );
}

PutRepositoryTriggersOutput _$PutRepositoryTriggersOutputFromJson(
    Map<String, dynamic> json) {
  return PutRepositoryTriggersOutput(
    configurationId: json['configurationId'] as String,
  );
}

ReactionForComment _$ReactionForCommentFromJson(Map<String, dynamic> json) {
  return ReactionForComment(
    reaction: json['reaction'] == null
        ? null
        : ReactionValueFormats.fromJson(
            json['reaction'] as Map<String, dynamic>),
    reactionUsers:
        (json['reactionUsers'] as List)?.map((e) => e as String)?.toList(),
    reactionsFromDeletedUsersCount:
        json['reactionsFromDeletedUsersCount'] as int,
  );
}

ReactionValueFormats _$ReactionValueFormatsFromJson(Map<String, dynamic> json) {
  return ReactionValueFormats(
    emoji: json['emoji'] as String,
    shortCode: json['shortCode'] as String,
    unicode: json['unicode'] as String,
  );
}

Map<String, dynamic> _$ReplaceContentEntryToJson(ReplaceContentEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filePath', instance.filePath);
  writeNotNull('replacementType',
      _$ReplacementTypeEnumEnumMap[instance.replacementType]);
  writeNotNull('content', const Uint8ListConverter().toJson(instance.content));
  writeNotNull('fileMode', _$FileModeTypeEnumEnumMap[instance.fileMode]);
  return val;
}

const _$ReplacementTypeEnumEnumMap = {
  ReplacementTypeEnum.keepBase: 'KEEP_BASE',
  ReplacementTypeEnum.keepSource: 'KEEP_SOURCE',
  ReplacementTypeEnum.keepDestination: 'KEEP_DESTINATION',
  ReplacementTypeEnum.useNewContent: 'USE_NEW_CONTENT',
};

RepositoryMetadata _$RepositoryMetadataFromJson(Map<String, dynamic> json) {
  return RepositoryMetadata(
    arn: json['Arn'] as String,
    accountId: json['accountId'] as String,
    cloneUrlHttp: json['cloneUrlHttp'] as String,
    cloneUrlSsh: json['cloneUrlSsh'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    defaultBranch: json['defaultBranch'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['lastModifiedDate']),
    repositoryDescription: json['repositoryDescription'] as String,
    repositoryId: json['repositoryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

RepositoryNameIdPair _$RepositoryNameIdPairFromJson(Map<String, dynamic> json) {
  return RepositoryNameIdPair(
    repositoryId: json['repositoryId'] as String,
    repositoryName: json['repositoryName'] as String,
  );
}

RepositoryTrigger _$RepositoryTriggerFromJson(Map<String, dynamic> json) {
  return RepositoryTrigger(
    destinationArn: json['destinationArn'] as String,
    events: (json['events'] as List)
        ?.map(
            (e) => _$enumDecodeNullable(_$RepositoryTriggerEventEnumEnumMap, e))
        ?.toList(),
    name: json['name'] as String,
    branches: (json['branches'] as List)?.map((e) => e as String)?.toList(),
    customData: json['customData'] as String,
  );
}

Map<String, dynamic> _$RepositoryTriggerToJson(RepositoryTrigger instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destinationArn', instance.destinationArn);
  writeNotNull(
      'events',
      instance.events
          ?.map((e) => _$RepositoryTriggerEventEnumEnumMap[e])
          ?.toList());
  writeNotNull('name', instance.name);
  writeNotNull('branches', instance.branches);
  writeNotNull('customData', instance.customData);
  return val;
}

const _$RepositoryTriggerEventEnumEnumMap = {
  RepositoryTriggerEventEnum.all: 'all',
  RepositoryTriggerEventEnum.updateReference: 'updateReference',
  RepositoryTriggerEventEnum.createReference: 'createReference',
  RepositoryTriggerEventEnum.deleteReference: 'deleteReference',
};

RepositoryTriggerExecutionFailure _$RepositoryTriggerExecutionFailureFromJson(
    Map<String, dynamic> json) {
  return RepositoryTriggerExecutionFailure(
    failureMessage: json['failureMessage'] as String,
    trigger: json['trigger'] as String,
  );
}

Map<String, dynamic> _$SetFileModeEntryToJson(SetFileModeEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fileMode', _$FileModeTypeEnumEnumMap[instance.fileMode]);
  writeNotNull('filePath', instance.filePath);
  return val;
}

Map<String, dynamic> _$SourceFileSpecifierToJson(SourceFileSpecifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filePath', instance.filePath);
  writeNotNull('isMove', instance.isMove);
  return val;
}

SubModule _$SubModuleFromJson(Map<String, dynamic> json) {
  return SubModule(
    absolutePath: json['absolutePath'] as String,
    commitId: json['commitId'] as String,
    relativePath: json['relativePath'] as String,
  );
}

SymbolicLink _$SymbolicLinkFromJson(Map<String, dynamic> json) {
  return SymbolicLink(
    absolutePath: json['absolutePath'] as String,
    blobId: json['blobId'] as String,
    fileMode: _$enumDecodeNullable(_$FileModeTypeEnumEnumMap, json['fileMode']),
    relativePath: json['relativePath'] as String,
  );
}

Map<String, dynamic> _$TargetToJson(Target instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('repositoryName', instance.repositoryName);
  writeNotNull('sourceReference', instance.sourceReference);
  writeNotNull('destinationReference', instance.destinationReference);
  return val;
}

TestRepositoryTriggersOutput _$TestRepositoryTriggersOutputFromJson(
    Map<String, dynamic> json) {
  return TestRepositoryTriggersOutput(
    failedExecutions: (json['failedExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : RepositoryTriggerExecutionFailure.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    successfulExecutions: (json['successfulExecutions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

UpdateApprovalRuleTemplateContentOutput
    _$UpdateApprovalRuleTemplateContentOutputFromJson(
        Map<String, dynamic> json) {
  return UpdateApprovalRuleTemplateContentOutput(
    approvalRuleTemplate: json['approvalRuleTemplate'] == null
        ? null
        : ApprovalRuleTemplate.fromJson(
            json['approvalRuleTemplate'] as Map<String, dynamic>),
  );
}

UpdateApprovalRuleTemplateDescriptionOutput
    _$UpdateApprovalRuleTemplateDescriptionOutputFromJson(
        Map<String, dynamic> json) {
  return UpdateApprovalRuleTemplateDescriptionOutput(
    approvalRuleTemplate: json['approvalRuleTemplate'] == null
        ? null
        : ApprovalRuleTemplate.fromJson(
            json['approvalRuleTemplate'] as Map<String, dynamic>),
  );
}

UpdateApprovalRuleTemplateNameOutput
    _$UpdateApprovalRuleTemplateNameOutputFromJson(Map<String, dynamic> json) {
  return UpdateApprovalRuleTemplateNameOutput(
    approvalRuleTemplate: json['approvalRuleTemplate'] == null
        ? null
        : ApprovalRuleTemplate.fromJson(
            json['approvalRuleTemplate'] as Map<String, dynamic>),
  );
}

UpdateCommentOutput _$UpdateCommentOutputFromJson(Map<String, dynamic> json) {
  return UpdateCommentOutput(
    comment: json['comment'] == null
        ? null
        : Comment.fromJson(json['comment'] as Map<String, dynamic>),
  );
}

UpdatePullRequestApprovalRuleContentOutput
    _$UpdatePullRequestApprovalRuleContentOutputFromJson(
        Map<String, dynamic> json) {
  return UpdatePullRequestApprovalRuleContentOutput(
    approvalRule: json['approvalRule'] == null
        ? null
        : ApprovalRule.fromJson(json['approvalRule'] as Map<String, dynamic>),
  );
}

UpdatePullRequestDescriptionOutput _$UpdatePullRequestDescriptionOutputFromJson(
    Map<String, dynamic> json) {
  return UpdatePullRequestDescriptionOutput(
    pullRequest: json['pullRequest'] == null
        ? null
        : PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
  );
}

UpdatePullRequestStatusOutput _$UpdatePullRequestStatusOutputFromJson(
    Map<String, dynamic> json) {
  return UpdatePullRequestStatusOutput(
    pullRequest: json['pullRequest'] == null
        ? null
        : PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
  );
}

UpdatePullRequestTitleOutput _$UpdatePullRequestTitleOutputFromJson(
    Map<String, dynamic> json) {
  return UpdatePullRequestTitleOutput(
    pullRequest: json['pullRequest'] == null
        ? null
        : PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
  );
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    date: json['date'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
  );
}
