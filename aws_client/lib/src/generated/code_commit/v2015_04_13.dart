// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// This is the <i>CodeCommit API Reference</i>. This reference provides
/// descriptions of the operations and data types for CodeCommit API along with
/// usage examples.
class CodeCommit {
  final _s.JsonProtocol _protocol;
  CodeCommit({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codecommit',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates an association between an approval rule template and a specified
  /// repository. Then, the next time a pull request is created in the
  /// repository where the destination reference (if specified) matches the
  /// destination reference (branch) for the pull request, an approval rule that
  /// matches the template conditions is automatically created for that pull
  /// request. If no destination references are specified in the template, an
  /// approval rule that matches the template contents is created for all pull
  /// requests in that repository.
  ///
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateDoesNotExistException].
  /// May throw [MaximumRuleTemplatesAssociatedWithRepositoryException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [approvalRuleTemplateName] :
  /// The name for the approval rule template.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that you want to associate with the template.
  Future<void> associateApprovalRuleTemplateWithRepository({
    required String approvalRuleTemplateName,
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'CodeCommit_20150413.AssociateApprovalRuleTemplateWithRepository'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleTemplateName': approvalRuleTemplateName,
        'repositoryName': repositoryName,
      },
    );
  }

  /// Creates an association between an approval rule template and one or more
  /// specified repositories.
  ///
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateDoesNotExistException].
  /// May throw [RepositoryNamesRequiredException].
  /// May throw [MaximumRepositoryNamesExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [approvalRuleTemplateName] :
  /// The name of the template you want to associate with one or more
  /// repositories.
  ///
  /// Parameter [repositoryNames] :
  /// The names of the repositories you want to associate with the template.
  /// <note>
  /// The length constraint limit is for each string in the array. The array
  /// itself can be empty.
  /// </note>
  Future<BatchAssociateApprovalRuleTemplateWithRepositoriesOutput>
      batchAssociateApprovalRuleTemplateWithRepositories({
    required String approvalRuleTemplateName,
    required List<String> repositoryNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'CodeCommit_20150413.BatchAssociateApprovalRuleTemplateWithRepositories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleTemplateName': approvalRuleTemplateName,
        'repositoryNames': repositoryNames,
      },
    );

    return BatchAssociateApprovalRuleTemplateWithRepositoriesOutput.fromJson(
        jsonResponse.body);
  }

  /// Returns information about one or more merge conflicts in the attempted
  /// merge of two commit specifiers using the squash or three-way merge
  /// strategy.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [MergeOptionRequiredException].
  /// May throw [InvalidMergeOptionException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [CommitRequiredException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidCommitException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [InvalidMaxConflictFilesException].
  /// May throw [InvalidMaxMergeHunksException].
  /// May throw [InvalidConflictDetailLevelException].
  /// May throw [InvalidConflictResolutionStrategyException].
  /// May throw [MaximumFileContentToLoadExceededException].
  /// May throw [MaximumItemsToCompareExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [destinationCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [mergeOption] :
  /// The merge option or strategy you want to use to merge the code.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the merge conflicts you want to
  /// review.
  ///
  /// Parameter [sourceCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [conflictDetailLevel] :
  /// The level of conflict detail to use. If unspecified, the default
  /// FILE_LEVEL is used, which returns a not-mergeable result if the same file
  /// has differences in both branches. If LINE_LEVEL is specified, a conflict
  /// is considered not mergeable if the same file in both branches has
  /// differences on the same line.
  ///
  /// Parameter [conflictResolutionStrategy] :
  /// Specifies which branch to use when resolving conflicts, or whether to
  /// attempt automatically merging two versions of a file. The default is NONE,
  /// which requires any conflicts to be resolved manually before the merge
  /// operation is successful.
  ///
  /// Parameter [filePaths] :
  /// The path of the target files used to describe the conflicts. If not
  /// specified, the default is all conflict files.
  ///
  /// Parameter [maxConflictFiles] :
  /// The maximum number of files to include in the output.
  ///
  /// Parameter [maxMergeHunks] :
  /// The maximum number of merge hunks to include in the output.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<BatchDescribeMergeConflictsOutput> batchDescribeMergeConflicts({
    required String destinationCommitSpecifier,
    required MergeOptionTypeEnum mergeOption,
    required String repositoryName,
    required String sourceCommitSpecifier,
    ConflictDetailLevelTypeEnum? conflictDetailLevel,
    ConflictResolutionStrategyTypeEnum? conflictResolutionStrategy,
    List<String>? filePaths,
    int? maxConflictFiles,
    int? maxMergeHunks,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.BatchDescribeMergeConflicts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationCommitSpecifier': destinationCommitSpecifier,
        'mergeOption': mergeOption.toValue(),
        'repositoryName': repositoryName,
        'sourceCommitSpecifier': sourceCommitSpecifier,
        if (conflictDetailLevel != null)
          'conflictDetailLevel': conflictDetailLevel.toValue(),
        if (conflictResolutionStrategy != null)
          'conflictResolutionStrategy': conflictResolutionStrategy.toValue(),
        if (filePaths != null) 'filePaths': filePaths,
        if (maxConflictFiles != null) 'maxConflictFiles': maxConflictFiles,
        if (maxMergeHunks != null) 'maxMergeHunks': maxMergeHunks,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return BatchDescribeMergeConflictsOutput.fromJson(jsonResponse.body);
  }

  /// Removes the association between an approval rule template and one or more
  /// specified repositories.
  ///
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateDoesNotExistException].
  /// May throw [RepositoryNamesRequiredException].
  /// May throw [MaximumRepositoryNamesExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [approvalRuleTemplateName] :
  /// The name of the template that you want to disassociate from one or more
  /// repositories.
  ///
  /// Parameter [repositoryNames] :
  /// The repository names that you want to disassociate from the approval rule
  /// template.
  /// <note>
  /// The length constraint limit is for each string in the array. The array
  /// itself can be empty.
  /// </note>
  Future<BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput>
      batchDisassociateApprovalRuleTemplateFromRepositories({
    required String approvalRuleTemplateName,
    required List<String> repositoryNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'CodeCommit_20150413.BatchDisassociateApprovalRuleTemplateFromRepositories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleTemplateName': approvalRuleTemplateName,
        'repositoryNames': repositoryNames,
      },
    );

    return BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput.fromJson(
        jsonResponse.body);
  }

  /// Returns information about the contents of one or more commits in a
  /// repository.
  ///
  /// May throw [CommitIdsListRequiredException].
  /// May throw [CommitIdsLimitExceededException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [commitIds] :
  /// The full commit IDs of the commits to get information about.
  /// <note>
  /// You must supply the full SHA IDs of each commit. You cannot use shortened
  /// SHA IDs.
  /// </note>
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the commits.
  Future<BatchGetCommitsOutput> batchGetCommits({
    required List<String> commitIds,
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.BatchGetCommits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'commitIds': commitIds,
        'repositoryName': repositoryName,
      },
    );

    return BatchGetCommitsOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about one or more repositories.
  /// <note>
  /// The description field for a repository accepts all HTML characters and all
  /// valid Unicode characters. Applications that do not HTML-encode the
  /// description and display it in a webpage can expose users to potentially
  /// malicious code. Make sure that you HTML-encode the description field in
  /// any application that uses this API to display the repository description
  /// on a webpage.
  /// </note>
  ///
  /// May throw [RepositoryNamesRequiredException].
  /// May throw [MaximumRepositoryNamesExceededException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [repositoryNames] :
  /// The names of the repositories to get information about.
  /// <note>
  /// The length constraint limit is for each string in the array. The array
  /// itself can be empty.
  /// </note>
  Future<BatchGetRepositoriesOutput> batchGetRepositories({
    required List<String> repositoryNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.BatchGetRepositories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryNames': repositoryNames,
      },
    );

    return BatchGetRepositoriesOutput.fromJson(jsonResponse.body);
  }

  /// Creates a template for approval rules that can then be associated with one
  /// or more repositories in your Amazon Web Services account. When you
  /// associate a template with a repository, CodeCommit creates an approval
  /// rule that matches the conditions of the template for all pull requests
  /// that meet the conditions of the template. For more information, see
  /// <a>AssociateApprovalRuleTemplateWithRepository</a>.
  ///
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateNameAlreadyExistsException].
  /// May throw [ApprovalRuleTemplateContentRequiredException].
  /// May throw [InvalidApprovalRuleTemplateContentException].
  /// May throw [InvalidApprovalRuleTemplateDescriptionException].
  /// May throw [NumberOfRuleTemplatesExceededException].
  ///
  /// Parameter [approvalRuleTemplateContent] :
  /// The content of the approval rule that is created on pull requests in
  /// associated repositories. If you specify one or more destination references
  /// (branches), approval rules are created in an associated repository only if
  /// their destination references (branches) match those specified in the
  /// template.
  /// <note>
  /// When you create the content of the approval rule template, you can specify
  /// approvers in an approval pool in one of two ways:
  ///
  /// <ul>
  /// <li>
  /// <b>CodeCommitApprovers</b>: This option only requires an Amazon Web
  /// Services account and a resource. It can be used for both IAM users and
  /// federated access users whose name matches the provided resource name. This
  /// is a very powerful option that offers a great deal of flexibility. For
  /// example, if you specify the Amazon Web Services account
  /// <i>123456789012</i> and <i>Mary_Major</i>, all of the following are
  /// counted as approvals coming from that user:
  ///
  /// <ul>
  /// <li>
  /// An IAM user in the account
  /// (arn:aws:iam::<i>123456789012</i>:user/<i>Mary_Major</i>)
  /// </li>
  /// <li>
  /// A federated user identified in IAM as Mary_Major
  /// (arn:aws:sts::<i>123456789012</i>:federated-user/<i>Mary_Major</i>)
  /// </li>
  /// </ul>
  /// This option does not recognize an active session of someone assuming the
  /// role of CodeCommitReview with a role session name of <i>Mary_Major</i>
  /// (arn:aws:sts::<i>123456789012</i>:assumed-role/CodeCommitReview/<i>Mary_Major</i>)
  /// unless you include a wildcard (*Mary_Major).
  /// </li>
  /// <li>
  /// <b>Fully qualified ARN</b>: This option allows you to specify the fully
  /// qualified Amazon Resource Name (ARN) of the IAM user or role.
  /// </li>
  /// </ul>
  /// For more information about IAM ARNs, wildcards, and formats, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// Parameter [approvalRuleTemplateName] :
  /// The name of the approval rule template. Provide descriptive names, because
  /// this name is applied to the approval rules created automatically in
  /// associated repositories.
  ///
  /// Parameter [approvalRuleTemplateDescription] :
  /// The description of the approval rule template. Consider providing a
  /// description that explains what this template does and when it might be
  /// appropriate to associate it with repositories.
  Future<CreateApprovalRuleTemplateOutput> createApprovalRuleTemplate({
    required String approvalRuleTemplateContent,
    required String approvalRuleTemplateName,
    String? approvalRuleTemplateDescription,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.CreateApprovalRuleTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleTemplateContent': approvalRuleTemplateContent,
        'approvalRuleTemplateName': approvalRuleTemplateName,
        if (approvalRuleTemplateDescription != null)
          'approvalRuleTemplateDescription': approvalRuleTemplateDescription,
      },
    );

    return CreateApprovalRuleTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Creates a branch in a repository and points the branch to a commit.
  /// <note>
  /// Calling the create branch operation does not set a repository's default
  /// branch. To do this, call the update default branch operation.
  /// </note>
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [BranchNameRequiredException].
  /// May throw [BranchNameExistsException].
  /// May throw [InvalidBranchNameException].
  /// May throw [CommitIdRequiredException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidCommitIdException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [branchName] :
  /// The name of the new branch to create.
  ///
  /// Parameter [commitId] :
  /// The ID of the commit to point the new branch to.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository in which you want to create the new branch.
  Future<void> createBranch({
    required String branchName,
    required String commitId,
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.CreateBranch'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'branchName': branchName,
        'commitId': commitId,
        'repositoryName': repositoryName,
      },
    );
  }

  /// Creates a commit for a repository on the tip of a specified branch.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [ParentCommitIdRequiredException].
  /// May throw [InvalidParentCommitIdException].
  /// May throw [ParentCommitDoesNotExistException].
  /// May throw [ParentCommitIdOutdatedException].
  /// May throw [BranchNameRequiredException].
  /// May throw [InvalidBranchNameException].
  /// May throw [BranchDoesNotExistException].
  /// May throw [BranchNameIsTagNameException].
  /// May throw [FileEntryRequiredException].
  /// May throw [MaximumFileEntriesExceededException].
  /// May throw [PutFileEntryConflictException].
  /// May throw [SourceFileOrContentRequiredException].
  /// May throw [FileContentAndSourceFileSpecifiedException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [SamePathRequestException].
  /// May throw [FileDoesNotExistException].
  /// May throw [FileContentSizeLimitExceededException].
  /// May throw [FolderContentSizeLimitExceededException].
  /// May throw [InvalidDeletionParameterException].
  /// May throw [RestrictedSourceFileException].
  /// May throw [FileModeRequiredException].
  /// May throw [InvalidFileModeException].
  /// May throw [NameLengthExceededException].
  /// May throw [InvalidEmailException].
  /// May throw [CommitMessageLengthExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  /// May throw [NoChangeException].
  /// May throw [FileNameConflictsWithDirectoryNameException].
  /// May throw [DirectoryNameConflictsWithFileNameException].
  /// May throw [FilePathConflictsWithSubmodulePathException].
  ///
  /// Parameter [branchName] :
  /// The name of the branch where you create the commit.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you create the commit.
  ///
  /// Parameter [authorName] :
  /// The name of the author who created the commit. This information is used as
  /// both the author and committer for the commit.
  ///
  /// Parameter [commitMessage] :
  /// The commit message you want to include in the commit. Commit messages are
  /// limited to 256 KB. If no message is specified, a default message is used.
  ///
  /// Parameter [deleteFiles] :
  /// The files to delete in this commit. These files still exist in earlier
  /// commits.
  ///
  /// Parameter [email] :
  /// The email address of the person who created the commit.
  ///
  /// Parameter [keepEmptyFolders] :
  /// If the commit contains deletions, whether to keep a folder or folder
  /// structure if the changes leave the folders empty. If true, a ..gitkeep
  /// file is created for empty folders. The default is false.
  ///
  /// Parameter [parentCommitId] :
  /// The ID of the commit that is the parent of the commit you create. Not
  /// required if this is an empty repository.
  ///
  /// Parameter [putFiles] :
  /// The files to add or update in this commit.
  ///
  /// Parameter [setFileModes] :
  /// The file modes to update for files in this commit.
  Future<CreateCommitOutput> createCommit({
    required String branchName,
    required String repositoryName,
    String? authorName,
    String? commitMessage,
    List<DeleteFileEntry>? deleteFiles,
    String? email,
    bool? keepEmptyFolders,
    String? parentCommitId,
    List<PutFileEntry>? putFiles,
    List<SetFileModeEntry>? setFileModes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.CreateCommit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'branchName': branchName,
        'repositoryName': repositoryName,
        if (authorName != null) 'authorName': authorName,
        if (commitMessage != null) 'commitMessage': commitMessage,
        if (deleteFiles != null) 'deleteFiles': deleteFiles,
        if (email != null) 'email': email,
        if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
        if (parentCommitId != null) 'parentCommitId': parentCommitId,
        if (putFiles != null) 'putFiles': putFiles,
        if (setFileModes != null) 'setFileModes': setFileModes,
      },
    );

    return CreateCommitOutput.fromJson(jsonResponse.body);
  }

  /// Creates a pull request in the specified repository.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  /// May throw [ClientRequestTokenRequiredException].
  /// May throw [InvalidClientRequestTokenException].
  /// May throw [IdempotencyParameterMismatchException].
  /// May throw [ReferenceNameRequiredException].
  /// May throw [InvalidReferenceNameException].
  /// May throw [ReferenceDoesNotExistException].
  /// May throw [ReferenceTypeNotSupportedException].
  /// May throw [TitleRequiredException].
  /// May throw [InvalidTitleException].
  /// May throw [InvalidDescriptionException].
  /// May throw [TargetsRequiredException].
  /// May throw [InvalidTargetsException].
  /// May throw [TargetRequiredException].
  /// May throw [InvalidTargetException].
  /// May throw [MultipleRepositoriesInPullRequestException].
  /// May throw [MaximumOpenPullRequestsExceededException].
  /// May throw [SourceAndDestinationAreSameException].
  ///
  /// Parameter [targets] :
  /// The targets for the pull request, including the source of the code to be
  /// reviewed (the source branch) and the destination where the creator of the
  /// pull request intends the code to be merged after the pull request is
  /// closed (the destination branch).
  ///
  /// Parameter [title] :
  /// The title of the pull request. This title is used to identify the pull
  /// request to other users in the repository.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, client-generated idempotency token that, when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter.
  /// If a request is received with the same parameters and a token is included,
  /// the request returns information about the initial request that used that
  /// token.
  /// <note>
  /// The Amazon Web ServicesSDKs prepopulate client request tokens. If you are
  /// using an Amazon Web ServicesSDK, an idempotency token is created for you.
  /// </note>
  ///
  /// Parameter [description] :
  /// A description of the pull request.
  Future<CreatePullRequestOutput> createPullRequest({
    required List<Target> targets,
    required String title,
    String? clientRequestToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.CreatePullRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'targets': targets,
        'title': title,
        'clientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
      },
    );

    return CreatePullRequestOutput.fromJson(jsonResponse.body);
  }

  /// Creates an approval rule for a pull request.
  ///
  /// May throw [ApprovalRuleNameRequiredException].
  /// May throw [InvalidApprovalRuleNameException].
  /// May throw [ApprovalRuleNameAlreadyExistsException].
  /// May throw [ApprovalRuleContentRequiredException].
  /// May throw [InvalidApprovalRuleContentException].
  /// May throw [NumberOfRulesExceededException].
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [PullRequestAlreadyClosedException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [approvalRuleContent] :
  /// The content of the approval rule, including the number of approvals needed
  /// and the structure of an approval pool defined for approvals, if any. For
  /// more information about approval pools, see the CodeCommit User Guide.
  /// <note>
  /// When you create the content of the approval rule, you can specify
  /// approvers in an approval pool in one of two ways:
  ///
  /// <ul>
  /// <li>
  /// <b>CodeCommitApprovers</b>: This option only requires an Amazon Web
  /// Services account and a resource. It can be used for both IAM users and
  /// federated access users whose name matches the provided resource name. This
  /// is a very powerful option that offers a great deal of flexibility. For
  /// example, if you specify the Amazon Web Services account
  /// <i>123456789012</i> and <i>Mary_Major</i>, all of the following would be
  /// counted as approvals coming from that user:
  ///
  /// <ul>
  /// <li>
  /// An IAM user in the account
  /// (arn:aws:iam::<i>123456789012</i>:user/<i>Mary_Major</i>)
  /// </li>
  /// <li>
  /// A federated user identified in IAM as Mary_Major
  /// (arn:aws:sts::<i>123456789012</i>:federated-user/<i>Mary_Major</i>)
  /// </li>
  /// </ul>
  /// This option does not recognize an active session of someone assuming the
  /// role of CodeCommitReview with a role session name of <i>Mary_Major</i>
  /// (arn:aws:sts::<i>123456789012</i>:assumed-role/CodeCommitReview/<i>Mary_Major</i>)
  /// unless you include a wildcard (*Mary_Major).
  /// </li>
  /// <li>
  /// <b>Fully qualified ARN</b>: This option allows you to specify the fully
  /// qualified Amazon Resource Name (ARN) of the IAM user or role.
  /// </li>
  /// </ul>
  /// For more information about IAM ARNs, wildcards, and formats, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// Parameter [approvalRuleName] :
  /// The name for the approval rule.
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request for which you want to create
  /// the approval rule.
  Future<CreatePullRequestApprovalRuleOutput> createPullRequestApprovalRule({
    required String approvalRuleContent,
    required String approvalRuleName,
    required String pullRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.CreatePullRequestApprovalRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleContent': approvalRuleContent,
        'approvalRuleName': approvalRuleName,
        'pullRequestId': pullRequestId,
      },
    );

    return CreatePullRequestApprovalRuleOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new, empty repository.
  ///
  /// May throw [RepositoryNameExistsException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [InvalidRepositoryDescriptionException].
  /// May throw [RepositoryLimitExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  /// May throw [EncryptionKeyInvalidIdException].
  /// May throw [EncryptionKeyInvalidUsageException].
  /// May throw [InvalidTagsMapException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidSystemTagUsageException].
  /// May throw [TagPolicyException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the new repository to be created.
  /// <note>
  /// The repository name must be unique across the calling Amazon Web Services
  /// account. Repository names are limited to 100 alphanumeric, dash, and
  /// underscore characters, and cannot include certain characters. For more
  /// information about the limits on repository names, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html">Quotas</a>
  /// in the <i>CodeCommit User Guide</i>. The suffix .git is prohibited.
  /// </note>
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the encryption key. You can view the ID of an encryption key in
  /// the KMS console, or use the KMS APIs to programmatically retrieve a key
  /// ID. For more information about acceptable values for kmsKeyID, see <a
  /// href="https://docs.aws.amazon.com/APIReference/API_Decrypt.html#KMS-Decrypt-request-KeyId">KeyId</a>
  /// in the Decrypt API description in the <i>Key Management Service API
  /// Reference</i>.
  ///
  /// If no key is specified, the default <code>aws/codecommit</code> Amazon Web
  /// Services managed key is used.
  ///
  /// Parameter [repositoryDescription] :
  /// A comment or description about the new repository.
  /// <note>
  /// The description field for a repository accepts all HTML characters and all
  /// valid Unicode characters. Applications that do not HTML-encode the
  /// description and display it in a webpage can expose users to potentially
  /// malicious code. Make sure that you HTML-encode the description field in
  /// any application that uses this API to display the repository description
  /// on a webpage.
  /// </note>
  ///
  /// Parameter [tags] :
  /// One or more tag key-value pairs to use when tagging this repository.
  Future<CreateRepositoryOutput> createRepository({
    required String repositoryName,
    String? kmsKeyId,
    String? repositoryDescription,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.CreateRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
        if (repositoryDescription != null)
          'repositoryDescription': repositoryDescription,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateRepositoryOutput.fromJson(jsonResponse.body);
  }

  /// Creates an unreferenced commit that represents the result of merging two
  /// branches using a specified merge strategy. This can help you determine the
  /// outcome of a potential merge. This API cannot be used with the
  /// fast-forward merge strategy because that strategy does not create a merge
  /// commit.
  /// <note>
  /// This unreferenced merge commit can only be accessed using the GetCommit
  /// API or through git commands such as git fetch. To retrieve this commit,
  /// you must specify its commit ID or otherwise reference it.
  /// </note>
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [CommitRequiredException].
  /// May throw [InvalidCommitException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [MergeOptionRequiredException].
  /// May throw [InvalidMergeOptionException].
  /// May throw [InvalidConflictDetailLevelException].
  /// May throw [InvalidConflictResolutionStrategyException].
  /// May throw [InvalidConflictResolutionException].
  /// May throw [ManualMergeRequiredException].
  /// May throw [MaximumConflictResolutionEntriesExceededException].
  /// May throw [MultipleConflictResolutionEntriesException].
  /// May throw [ReplacementTypeRequiredException].
  /// May throw [InvalidReplacementTypeException].
  /// May throw [ReplacementContentRequiredException].
  /// May throw [InvalidReplacementContentException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [FileContentSizeLimitExceededException].
  /// May throw [FolderContentSizeLimitExceededException].
  /// May throw [MaximumFileContentToLoadExceededException].
  /// May throw [MaximumItemsToCompareExceededException].
  /// May throw [ConcurrentReferenceUpdateException].
  /// May throw [FileModeRequiredException].
  /// May throw [InvalidFileModeException].
  /// May throw [NameLengthExceededException].
  /// May throw [InvalidEmailException].
  /// May throw [CommitMessageLengthExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [destinationCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [mergeOption] :
  /// The merge option or strategy you want to use to merge the code.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to create the unreferenced merge
  /// commit.
  ///
  /// Parameter [sourceCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [authorName] :
  /// The name of the author who created the unreferenced commit. This
  /// information is used as both the author and committer for the commit.
  ///
  /// Parameter [commitMessage] :
  /// The commit message for the unreferenced commit.
  ///
  /// Parameter [conflictDetailLevel] :
  /// The level of conflict detail to use. If unspecified, the default
  /// FILE_LEVEL is used, which returns a not-mergeable result if the same file
  /// has differences in both branches. If LINE_LEVEL is specified, a conflict
  /// is considered not mergeable if the same file in both branches has
  /// differences on the same line.
  ///
  /// Parameter [conflictResolution] :
  /// If AUTOMERGE is the conflict resolution strategy, a list of inputs to use
  /// when resolving conflicts during a merge.
  ///
  /// Parameter [conflictResolutionStrategy] :
  /// Specifies which branch to use when resolving conflicts, or whether to
  /// attempt automatically merging two versions of a file. The default is NONE,
  /// which requires any conflicts to be resolved manually before the merge
  /// operation is successful.
  ///
  /// Parameter [email] :
  /// The email address for the person who created the unreferenced commit.
  ///
  /// Parameter [keepEmptyFolders] :
  /// If the commit contains deletions, whether to keep a folder or folder
  /// structure if the changes leave the folders empty. If this is specified as
  /// true, a .gitkeep file is created for empty folders. The default is false.
  Future<CreateUnreferencedMergeCommitOutput> createUnreferencedMergeCommit({
    required String destinationCommitSpecifier,
    required MergeOptionTypeEnum mergeOption,
    required String repositoryName,
    required String sourceCommitSpecifier,
    String? authorName,
    String? commitMessage,
    ConflictDetailLevelTypeEnum? conflictDetailLevel,
    ConflictResolution? conflictResolution,
    ConflictResolutionStrategyTypeEnum? conflictResolutionStrategy,
    String? email,
    bool? keepEmptyFolders,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.CreateUnreferencedMergeCommit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationCommitSpecifier': destinationCommitSpecifier,
        'mergeOption': mergeOption.toValue(),
        'repositoryName': repositoryName,
        'sourceCommitSpecifier': sourceCommitSpecifier,
        if (authorName != null) 'authorName': authorName,
        if (commitMessage != null) 'commitMessage': commitMessage,
        if (conflictDetailLevel != null)
          'conflictDetailLevel': conflictDetailLevel.toValue(),
        if (conflictResolution != null)
          'conflictResolution': conflictResolution,
        if (conflictResolutionStrategy != null)
          'conflictResolutionStrategy': conflictResolutionStrategy.toValue(),
        if (email != null) 'email': email,
        if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
      },
    );

    return CreateUnreferencedMergeCommitOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a specified approval rule template. Deleting a template does not
  /// remove approval rules on pull requests already created with the template.
  ///
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateInUseException].
  ///
  /// Parameter [approvalRuleTemplateName] :
  /// The name of the approval rule template to delete.
  Future<DeleteApprovalRuleTemplateOutput> deleteApprovalRuleTemplate({
    required String approvalRuleTemplateName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.DeleteApprovalRuleTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleTemplateName': approvalRuleTemplateName,
      },
    );

    return DeleteApprovalRuleTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a branch from a repository, unless that branch is the default
  /// branch for the repository.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [BranchNameRequiredException].
  /// May throw [InvalidBranchNameException].
  /// May throw [DefaultBranchCannotBeDeletedException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [branchName] :
  /// The name of the branch to delete.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the branch to be deleted.
  Future<DeleteBranchOutput> deleteBranch({
    required String branchName,
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.DeleteBranch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'branchName': branchName,
        'repositoryName': repositoryName,
      },
    );

    return DeleteBranchOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the content of a comment made on a change, file, or commit in a
  /// repository.
  ///
  /// May throw [CommentDoesNotExistException].
  /// May throw [CommentIdRequiredException].
  /// May throw [InvalidCommentIdException].
  /// May throw [CommentDeletedException].
  ///
  /// Parameter [commentId] :
  /// The unique, system-generated ID of the comment. To get this ID, use
  /// <a>GetCommentsForComparedCommit</a> or <a>GetCommentsForPullRequest</a>.
  Future<DeleteCommentContentOutput> deleteCommentContent({
    required String commentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.DeleteCommentContent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'commentId': commentId,
      },
    );

    return DeleteCommentContentOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a specified file from a specified branch. A commit is created on
  /// the branch that contains the revision. The file still exists in the
  /// commits earlier to the commit that contains the deletion.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [ParentCommitIdRequiredException].
  /// May throw [InvalidParentCommitIdException].
  /// May throw [ParentCommitDoesNotExistException].
  /// May throw [ParentCommitIdOutdatedException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [FileDoesNotExistException].
  /// May throw [BranchNameRequiredException].
  /// May throw [InvalidBranchNameException].
  /// May throw [BranchDoesNotExistException].
  /// May throw [BranchNameIsTagNameException].
  /// May throw [NameLengthExceededException].
  /// May throw [InvalidEmailException].
  /// May throw [CommitMessageLengthExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [branchName] :
  /// The name of the branch where the commit that deletes the file is made.
  ///
  /// Parameter [filePath] :
  /// The fully qualified path to the file that to be deleted, including the
  /// full name and extension of that file. For example, /examples/file.md is a
  /// fully qualified path to a file named file.md in a folder named examples.
  ///
  /// Parameter [parentCommitId] :
  /// The ID of the commit that is the tip of the branch where you want to
  /// create the commit that deletes the file. This must be the HEAD commit for
  /// the branch. The commit that deletes the file is created from this commit
  /// ID.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the file to delete.
  ///
  /// Parameter [commitMessage] :
  /// The commit message you want to include as part of deleting the file.
  /// Commit messages are limited to 256 KB. If no message is specified, a
  /// default message is used.
  ///
  /// Parameter [email] :
  /// The email address for the commit that deletes the file. If no email
  /// address is specified, the email address is left blank.
  ///
  /// Parameter [keepEmptyFolders] :
  /// If a file is the only object in the folder or directory, specifies whether
  /// to delete the folder or directory that contains the file. By default,
  /// empty folders are deleted. This includes empty folders that are part of
  /// the directory structure. For example, if the path to a file is
  /// dir1/dir2/dir3/dir4, and dir2 and dir3 are empty, deleting the last file
  /// in dir4 also deletes the empty folders dir4, dir3, and dir2.
  ///
  /// Parameter [name] :
  /// The name of the author of the commit that deletes the file. If no name is
  /// specified, the user's ARN is used as the author name and committer name.
  Future<DeleteFileOutput> deleteFile({
    required String branchName,
    required String filePath,
    required String parentCommitId,
    required String repositoryName,
    String? commitMessage,
    String? email,
    bool? keepEmptyFolders,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.DeleteFile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'branchName': branchName,
        'filePath': filePath,
        'parentCommitId': parentCommitId,
        'repositoryName': repositoryName,
        if (commitMessage != null) 'commitMessage': commitMessage,
        if (email != null) 'email': email,
        if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
        if (name != null) 'name': name,
      },
    );

    return DeleteFileOutput.fromJson(jsonResponse.body);
  }

  /// Deletes an approval rule from a specified pull request. Approval rules can
  /// be deleted from a pull request only if the pull request is open, and if
  /// the approval rule was created specifically for a pull request and not
  /// generated from an approval rule template associated with the repository
  /// where the pull request was created. You cannot delete an approval rule
  /// from a merged or closed pull request.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [PullRequestAlreadyClosedException].
  /// May throw [ApprovalRuleNameRequiredException].
  /// May throw [InvalidApprovalRuleNameException].
  /// May throw [CannotDeleteApprovalRuleFromTemplateException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [approvalRuleName] :
  /// The name of the approval rule you want to delete.
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request that contains the approval
  /// rule you want to delete.
  Future<DeletePullRequestApprovalRuleOutput> deletePullRequestApprovalRule({
    required String approvalRuleName,
    required String pullRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.DeletePullRequestApprovalRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleName': approvalRuleName,
        'pullRequestId': pullRequestId,
      },
    );

    return DeletePullRequestApprovalRuleOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a repository. If a specified repository was already deleted, a
  /// null repository ID is returned.
  /// <important>
  /// Deleting a repository also deletes all associated objects and metadata.
  /// After a repository is deleted, all future push calls to the deleted
  /// repository fail.
  /// </important>
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to delete.
  Future<DeleteRepositoryOutput> deleteRepository({
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.DeleteRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
      },
    );

    return DeleteRepositoryOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about one or more merge conflicts in the attempted
  /// merge of two commit specifiers using the squash or three-way merge
  /// strategy. If the merge option for the attempted merge is specified as
  /// FAST_FORWARD_MERGE, an exception is thrown.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [MergeOptionRequiredException].
  /// May throw [InvalidMergeOptionException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [CommitRequiredException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidCommitException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [FileDoesNotExistException].
  /// May throw [InvalidMaxMergeHunksException].
  /// May throw [InvalidConflictDetailLevelException].
  /// May throw [InvalidConflictResolutionStrategyException].
  /// May throw [MaximumFileContentToLoadExceededException].
  /// May throw [MaximumItemsToCompareExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [destinationCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [filePath] :
  /// The path of the target files used to describe the conflicts.
  ///
  /// Parameter [mergeOption] :
  /// The merge option or strategy you want to use to merge the code.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to get information about a merge
  /// conflict.
  ///
  /// Parameter [sourceCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [conflictDetailLevel] :
  /// The level of conflict detail to use. If unspecified, the default
  /// FILE_LEVEL is used, which returns a not-mergeable result if the same file
  /// has differences in both branches. If LINE_LEVEL is specified, a conflict
  /// is considered not mergeable if the same file in both branches has
  /// differences on the same line.
  ///
  /// Parameter [conflictResolutionStrategy] :
  /// Specifies which branch to use when resolving conflicts, or whether to
  /// attempt automatically merging two versions of a file. The default is NONE,
  /// which requires any conflicts to be resolved manually before the merge
  /// operation is successful.
  ///
  /// Parameter [maxMergeHunks] :
  /// The maximum number of merge hunks to include in the output.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<DescribeMergeConflictsOutput> describeMergeConflicts({
    required String destinationCommitSpecifier,
    required String filePath,
    required MergeOptionTypeEnum mergeOption,
    required String repositoryName,
    required String sourceCommitSpecifier,
    ConflictDetailLevelTypeEnum? conflictDetailLevel,
    ConflictResolutionStrategyTypeEnum? conflictResolutionStrategy,
    int? maxMergeHunks,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.DescribeMergeConflicts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationCommitSpecifier': destinationCommitSpecifier,
        'filePath': filePath,
        'mergeOption': mergeOption.toValue(),
        'repositoryName': repositoryName,
        'sourceCommitSpecifier': sourceCommitSpecifier,
        if (conflictDetailLevel != null)
          'conflictDetailLevel': conflictDetailLevel.toValue(),
        if (conflictResolutionStrategy != null)
          'conflictResolutionStrategy': conflictResolutionStrategy.toValue(),
        if (maxMergeHunks != null) 'maxMergeHunks': maxMergeHunks,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeMergeConflictsOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about one or more pull request events.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [InvalidPullRequestEventTypeException].
  /// May throw [InvalidActorArnException].
  /// May throw [ActorDoesNotExistException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request. To get this ID, use
  /// <a>ListPullRequests</a>.
  ///
  /// Parameter [actorArn] :
  /// The Amazon Resource Name (ARN) of the user whose actions resulted in the
  /// event. Examples include updating the pull request with more commits or
  /// changing the status of a pull request.
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results. The default is 100 events, which is also the maximum number of
  /// events that can be returned in a result.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  ///
  /// Parameter [pullRequestEventType] :
  /// Optional. The pull request event type about which you want to return
  /// information.
  Future<DescribePullRequestEventsOutput> describePullRequestEvents({
    required String pullRequestId,
    String? actorArn,
    int? maxResults,
    String? nextToken,
    PullRequestEventType? pullRequestEventType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.DescribePullRequestEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
        if (actorArn != null) 'actorArn': actorArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (pullRequestEventType != null)
          'pullRequestEventType': pullRequestEventType.toValue(),
      },
    );

    return DescribePullRequestEventsOutput.fromJson(jsonResponse.body);
  }

  /// Removes the association between a template and a repository so that
  /// approval rules based on the template are not automatically created when
  /// pull requests are created in the specified repository. This does not
  /// delete any approval rules previously created for pull requests through the
  /// template association.
  ///
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateDoesNotExistException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [approvalRuleTemplateName] :
  /// The name of the approval rule template to disassociate from a specified
  /// repository.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository you want to disassociate from the template.
  Future<void> disassociateApprovalRuleTemplateFromRepository({
    required String approvalRuleTemplateName,
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'CodeCommit_20150413.DisassociateApprovalRuleTemplateFromRepository'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleTemplateName': approvalRuleTemplateName,
        'repositoryName': repositoryName,
      },
    );
  }

  /// Evaluates whether a pull request has met all the conditions specified in
  /// its associated approval rules.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [InvalidRevisionIdException].
  /// May throw [RevisionIdRequiredException].
  /// May throw [RevisionNotCurrentException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request you want to evaluate.
  ///
  /// Parameter [revisionId] :
  /// The system-generated ID for the pull request revision. To retrieve the
  /// most recent revision ID for a pull request, use <a>GetPullRequest</a>.
  Future<EvaluatePullRequestApprovalRulesOutput>
      evaluatePullRequestApprovalRules({
    required String pullRequestId,
    required String revisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.EvaluatePullRequestApprovalRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
        'revisionId': revisionId,
      },
    );

    return EvaluatePullRequestApprovalRulesOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about a specified approval rule template.
  ///
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateDoesNotExistException].
  ///
  /// Parameter [approvalRuleTemplateName] :
  /// The name of the approval rule template for which you want to get
  /// information.
  Future<GetApprovalRuleTemplateOutput> getApprovalRuleTemplate({
    required String approvalRuleTemplateName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetApprovalRuleTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleTemplateName': approvalRuleTemplateName,
      },
    );

    return GetApprovalRuleTemplateOutput.fromJson(jsonResponse.body);
  }

  /// Returns the base-64 encoded content of an individual blob in a repository.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [BlobIdRequiredException].
  /// May throw [InvalidBlobIdException].
  /// May throw [BlobIdDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  /// May throw [FileTooLargeException].
  ///
  /// Parameter [blobId] :
  /// The ID of the blob, which is its SHA-1 pointer.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the blob.
  Future<GetBlobOutput> getBlob({
    required String blobId,
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetBlob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'blobId': blobId,
        'repositoryName': repositoryName,
      },
    );

    return GetBlobOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about a repository branch, including its name and the
  /// last commit ID.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [BranchNameRequiredException].
  /// May throw [InvalidBranchNameException].
  /// May throw [BranchDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [branchName] :
  /// The name of the branch for which you want to retrieve information.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the branch for which you want to
  /// retrieve information.
  Future<GetBranchOutput> getBranch({
    String? branchName,
    String? repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetBranch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (branchName != null) 'branchName': branchName,
        if (repositoryName != null) 'repositoryName': repositoryName,
      },
    );

    return GetBranchOutput.fromJson(jsonResponse.body);
  }

  /// Returns the content of a comment made on a change, file, or commit in a
  /// repository.
  /// <note>
  /// Reaction counts might include numbers from user identities who were
  /// deleted after the reaction was made. For a count of reactions from active
  /// identities, use GetCommentReactions.
  /// </note>
  ///
  /// May throw [CommentDoesNotExistException].
  /// May throw [CommentDeletedException].
  /// May throw [CommentIdRequiredException].
  /// May throw [InvalidCommentIdException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [commentId] :
  /// The unique, system-generated ID of the comment. To get this ID, use
  /// <a>GetCommentsForComparedCommit</a> or <a>GetCommentsForPullRequest</a>.
  Future<GetCommentOutput> getComment({
    required String commentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetComment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'commentId': commentId,
      },
    );

    return GetCommentOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about reactions to a specified comment ID. Reactions
  /// from users who have been deleted will not be included in the count.
  ///
  /// May throw [CommentDoesNotExistException].
  /// May throw [CommentIdRequiredException].
  /// May throw [InvalidCommentIdException].
  /// May throw [InvalidReactionUserArnException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [CommentDeletedException].
  ///
  /// Parameter [commentId] :
  /// The ID of the comment for which you want to get reactions information.
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results. The default is the same as the allowed maximum, 1,000.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  ///
  /// Parameter [reactionUserArn] :
  /// Optional. The Amazon Resource Name (ARN) of the user or identity for which
  /// you want to get reaction information.
  Future<GetCommentReactionsOutput> getCommentReactions({
    required String commentId,
    int? maxResults,
    String? nextToken,
    String? reactionUserArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetCommentReactions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'commentId': commentId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (reactionUserArn != null) 'reactionUserArn': reactionUserArn,
      },
    );

    return GetCommentReactionsOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about comments made on the comparison between two
  /// commits.
  /// <note>
  /// Reaction counts might include numbers from user identities who were
  /// deleted after the reaction was made. For a count of reactions from active
  /// identities, use GetCommentReactions.
  /// </note>
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [CommitIdRequiredException].
  /// May throw [InvalidCommitIdException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [afterCommitId] :
  /// To establish the directionality of the comparison, the full commit ID of
  /// the after commit.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to compare commits.
  ///
  /// Parameter [beforeCommitId] :
  /// To establish the directionality of the comparison, the full commit ID of
  /// the before commit.
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results. The default is 100 comments, but you can configure up to 500.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that when provided in a request, returns the next
  /// batch of the results.
  Future<GetCommentsForComparedCommitOutput> getCommentsForComparedCommit({
    required String afterCommitId,
    required String repositoryName,
    String? beforeCommitId,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetCommentsForComparedCommit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'afterCommitId': afterCommitId,
        'repositoryName': repositoryName,
        if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetCommentsForComparedCommitOutput.fromJson(jsonResponse.body);
  }

  /// Returns comments made on a pull request.
  /// <note>
  /// Reaction counts might include numbers from user identities who were
  /// deleted after the reaction was made. For a count of reactions from active
  /// identities, use GetCommentReactions.
  /// </note>
  ///
  /// May throw [PullRequestIdRequiredException].
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [CommitIdRequiredException].
  /// May throw [InvalidCommitIdException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [RepositoryNotAssociatedWithPullRequestException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request. To get this ID, use
  /// <a>ListPullRequests</a>.
  ///
  /// Parameter [afterCommitId] :
  /// The full commit ID of the commit in the source branch that was the tip of
  /// the branch at the time the comment was made. Requirement is conditional:
  /// <code>afterCommitId</code> must be specified when
  /// <code>repositoryName</code> is included.
  ///
  /// Parameter [beforeCommitId] :
  /// The full commit ID of the commit in the destination branch that was the
  /// tip of the branch at the time the pull request was created. Requirement is
  /// conditional: <code>beforeCommitId</code> must be specified when
  /// <code>repositoryName</code> is included.
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results. The default is 100 comments. You can return up to 500 comments
  /// with a single request.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the pull request. Requirement is
  /// conditional: <code>repositoryName</code> must be specified when
  /// <code>beforeCommitId</code> and <code>afterCommitId</code> are included.
  Future<GetCommentsForPullRequestOutput> getCommentsForPullRequest({
    required String pullRequestId,
    String? afterCommitId,
    String? beforeCommitId,
    int? maxResults,
    String? nextToken,
    String? repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetCommentsForPullRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
        if (afterCommitId != null) 'afterCommitId': afterCommitId,
        if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (repositoryName != null) 'repositoryName': repositoryName,
      },
    );

    return GetCommentsForPullRequestOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about a commit, including commit message and committer
  /// information.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [CommitIdRequiredException].
  /// May throw [InvalidCommitIdException].
  /// May throw [CommitIdDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [commitId] :
  /// The commit ID. Commit IDs are the full SHA ID of the commit.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to which the commit was made.
  Future<GetCommitOutput> getCommit({
    required String commitId,
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetCommit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'commitId': commitId,
        'repositoryName': repositoryName,
      },
    );

    return GetCommitOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the differences in a valid commit specifier
  /// (such as a branch, tag, HEAD, commit ID, or other fully qualified
  /// reference). Results can be limited to a specified path.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidCommitIdException].
  /// May throw [CommitRequiredException].
  /// May throw [InvalidCommitException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidPathException].
  /// May throw [PathDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [afterCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to get differences.
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  ///
  /// Parameter [afterPath] :
  /// The file path in which to check differences. Limits the results to this
  /// path. Can also be used to specify the changed name of a directory or
  /// folder, if it has changed. If not specified, differences are shown for all
  /// paths.
  ///
  /// Parameter [beforeCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, the full commit ID). Optional. If not specified,
  /// all changes before the <code>afterCommitSpecifier</code> value are shown.
  /// If you do not use <code>beforeCommitSpecifier</code> in your request,
  /// consider limiting the results with <code>maxResults</code>.
  ///
  /// Parameter [beforePath] :
  /// The file path in which to check for differences. Limits the results to
  /// this path. Can also be used to specify the previous name of a directory or
  /// folder. If <code>beforePath</code> and <code>afterPath</code> are not
  /// specified, differences are shown for all paths.
  Future<GetDifferencesOutput> getDifferences({
    required String afterCommitSpecifier,
    required String repositoryName,
    int? maxResults,
    String? nextToken,
    String? afterPath,
    String? beforeCommitSpecifier,
    String? beforePath,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetDifferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'afterCommitSpecifier': afterCommitSpecifier,
        'repositoryName': repositoryName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (afterPath != null) 'afterPath': afterPath,
        if (beforeCommitSpecifier != null)
          'beforeCommitSpecifier': beforeCommitSpecifier,
        if (beforePath != null) 'beforePath': beforePath,
      },
    );

    return GetDifferencesOutput.fromJson(jsonResponse.body);
  }

  /// Returns the base-64 encoded contents of a specified file and its metadata.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidCommitException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [FileDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  /// May throw [FileTooLargeException].
  ///
  /// Parameter [filePath] :
  /// The fully qualified path to the file, including the full name and
  /// extension of the file. For example, /examples/file.md is the fully
  /// qualified path to a file named file.md in a folder named examples.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the file.
  ///
  /// Parameter [commitSpecifier] :
  /// The fully quaified reference that identifies the commit that contains the
  /// file. For example, you can specify a full commit ID, a tag, a branch name,
  /// or a reference such as refs/heads/main. If none is provided, the head
  /// commit is used.
  Future<GetFileOutput> getFile({
    required String filePath,
    required String repositoryName,
    String? commitSpecifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetFile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'filePath': filePath,
        'repositoryName': repositoryName,
        if (commitSpecifier != null) 'commitSpecifier': commitSpecifier,
      },
    );

    return GetFileOutput.fromJson(jsonResponse.body);
  }

  /// Returns the contents of a specified folder in a repository.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidCommitException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [FolderDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [folderPath] :
  /// The fully qualified path to the folder whose contents are returned,
  /// including the folder name. For example, /examples is a fully-qualified
  /// path to a folder named examples that was created off of the root directory
  /// (/) of a repository.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository.
  ///
  /// Parameter [commitSpecifier] :
  /// A fully qualified reference used to identify a commit that contains the
  /// version of the folder's content to return. A fully qualified reference can
  /// be a commit ID, branch name, tag, or reference such as HEAD. If no
  /// specifier is provided, the folder content is returned as it exists in the
  /// HEAD commit.
  Future<GetFolderOutput> getFolder({
    required String folderPath,
    required String repositoryName,
    String? commitSpecifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetFolder'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'folderPath': folderPath,
        'repositoryName': repositoryName,
        if (commitSpecifier != null) 'commitSpecifier': commitSpecifier,
      },
    );

    return GetFolderOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about a specified merge commit.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [CommitRequiredException].
  /// May throw [InvalidCommitException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidConflictDetailLevelException].
  /// May throw [InvalidConflictResolutionStrategyException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [destinationCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the merge commit about which you
  /// want to get information.
  ///
  /// Parameter [sourceCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [conflictDetailLevel] :
  /// The level of conflict detail to use. If unspecified, the default
  /// FILE_LEVEL is used, which returns a not-mergeable result if the same file
  /// has differences in both branches. If LINE_LEVEL is specified, a conflict
  /// is considered not mergeable if the same file in both branches has
  /// differences on the same line.
  ///
  /// Parameter [conflictResolutionStrategy] :
  /// Specifies which branch to use when resolving conflicts, or whether to
  /// attempt automatically merging two versions of a file. The default is NONE,
  /// which requires any conflicts to be resolved manually before the merge
  /// operation is successful.
  Future<GetMergeCommitOutput> getMergeCommit({
    required String destinationCommitSpecifier,
    required String repositoryName,
    required String sourceCommitSpecifier,
    ConflictDetailLevelTypeEnum? conflictDetailLevel,
    ConflictResolutionStrategyTypeEnum? conflictResolutionStrategy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetMergeCommit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationCommitSpecifier': destinationCommitSpecifier,
        'repositoryName': repositoryName,
        'sourceCommitSpecifier': sourceCommitSpecifier,
        if (conflictDetailLevel != null)
          'conflictDetailLevel': conflictDetailLevel.toValue(),
        if (conflictResolutionStrategy != null)
          'conflictResolutionStrategy': conflictResolutionStrategy.toValue(),
      },
    );

    return GetMergeCommitOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about merge conflicts between the before and after
  /// commit IDs for a pull request in a repository.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [MergeOptionRequiredException].
  /// May throw [InvalidMergeOptionException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [CommitRequiredException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidCommitException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [InvalidMaxConflictFilesException].
  /// May throw [InvalidConflictDetailLevelException].
  /// May throw [InvalidDestinationCommitSpecifierException].
  /// May throw [InvalidSourceCommitSpecifierException].
  /// May throw [InvalidConflictResolutionStrategyException].
  /// May throw [MaximumFileContentToLoadExceededException].
  /// May throw [MaximumItemsToCompareExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [destinationCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [mergeOption] :
  /// The merge option or strategy you want to use to merge the code.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where the pull request was created.
  ///
  /// Parameter [sourceCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [conflictDetailLevel] :
  /// The level of conflict detail to use. If unspecified, the default
  /// FILE_LEVEL is used, which returns a not-mergeable result if the same file
  /// has differences in both branches. If LINE_LEVEL is specified, a conflict
  /// is considered not mergeable if the same file in both branches has
  /// differences on the same line.
  ///
  /// Parameter [conflictResolutionStrategy] :
  /// Specifies which branch to use when resolving conflicts, or whether to
  /// attempt automatically merging two versions of a file. The default is NONE,
  /// which requires any conflicts to be resolved manually before the merge
  /// operation is successful.
  ///
  /// Parameter [maxConflictFiles] :
  /// The maximum number of files to include in the output.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<GetMergeConflictsOutput> getMergeConflicts({
    required String destinationCommitSpecifier,
    required MergeOptionTypeEnum mergeOption,
    required String repositoryName,
    required String sourceCommitSpecifier,
    ConflictDetailLevelTypeEnum? conflictDetailLevel,
    ConflictResolutionStrategyTypeEnum? conflictResolutionStrategy,
    int? maxConflictFiles,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetMergeConflicts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationCommitSpecifier': destinationCommitSpecifier,
        'mergeOption': mergeOption.toValue(),
        'repositoryName': repositoryName,
        'sourceCommitSpecifier': sourceCommitSpecifier,
        if (conflictDetailLevel != null)
          'conflictDetailLevel': conflictDetailLevel.toValue(),
        if (conflictResolutionStrategy != null)
          'conflictResolutionStrategy': conflictResolutionStrategy.toValue(),
        if (maxConflictFiles != null) 'maxConflictFiles': maxConflictFiles,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetMergeConflictsOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the merge options available for merging two
  /// specified branches. For details about why a merge option is not available,
  /// use GetMergeConflicts or DescribeMergeConflicts.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [CommitRequiredException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidCommitException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [InvalidConflictDetailLevelException].
  /// May throw [InvalidConflictResolutionStrategyException].
  /// May throw [MaximumFileContentToLoadExceededException].
  /// May throw [MaximumItemsToCompareExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [destinationCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the commits about which you want
  /// to get merge options.
  ///
  /// Parameter [sourceCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [conflictDetailLevel] :
  /// The level of conflict detail to use. If unspecified, the default
  /// FILE_LEVEL is used, which returns a not-mergeable result if the same file
  /// has differences in both branches. If LINE_LEVEL is specified, a conflict
  /// is considered not mergeable if the same file in both branches has
  /// differences on the same line.
  ///
  /// Parameter [conflictResolutionStrategy] :
  /// Specifies which branch to use when resolving conflicts, or whether to
  /// attempt automatically merging two versions of a file. The default is NONE,
  /// which requires any conflicts to be resolved manually before the merge
  /// operation is successful.
  Future<GetMergeOptionsOutput> getMergeOptions({
    required String destinationCommitSpecifier,
    required String repositoryName,
    required String sourceCommitSpecifier,
    ConflictDetailLevelTypeEnum? conflictDetailLevel,
    ConflictResolutionStrategyTypeEnum? conflictResolutionStrategy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetMergeOptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationCommitSpecifier': destinationCommitSpecifier,
        'repositoryName': repositoryName,
        'sourceCommitSpecifier': sourceCommitSpecifier,
        if (conflictDetailLevel != null)
          'conflictDetailLevel': conflictDetailLevel.toValue(),
        if (conflictResolutionStrategy != null)
          'conflictResolutionStrategy': conflictResolutionStrategy.toValue(),
      },
    );

    return GetMergeOptionsOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about a pull request in a specified repository.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request. To get this ID, use
  /// <a>ListPullRequests</a>.
  Future<GetPullRequestOutput> getPullRequest({
    required String pullRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetPullRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
      },
    );

    return GetPullRequestOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about the approval states for a specified pull request.
  /// Approval states only apply to pull requests that have one or more approval
  /// rules applied to them.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [InvalidRevisionIdException].
  /// May throw [RevisionIdRequiredException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID for the pull request.
  ///
  /// Parameter [revisionId] :
  /// The system-generated ID for the pull request revision.
  Future<GetPullRequestApprovalStatesOutput> getPullRequestApprovalStates({
    required String pullRequestId,
    required String revisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetPullRequestApprovalStates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
        'revisionId': revisionId,
      },
    );

    return GetPullRequestApprovalStatesOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about whether approval rules have been set aside
  /// (overridden) for a pull request, and if so, the Amazon Resource Name (ARN)
  /// of the user or identity that overrode the rules and their requirements for
  /// the pull request.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [InvalidRevisionIdException].
  /// May throw [RevisionIdRequiredException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [pullRequestId] :
  /// The ID of the pull request for which you want to get information about
  /// whether approval rules have been set aside (overridden).
  ///
  /// Parameter [revisionId] :
  /// The system-generated ID of the revision for the pull request. To retrieve
  /// the most recent revision ID, use <a>GetPullRequest</a>.
  Future<GetPullRequestOverrideStateOutput> getPullRequestOverrideState({
    required String pullRequestId,
    required String revisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetPullRequestOverrideState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
        'revisionId': revisionId,
      },
    );

    return GetPullRequestOverrideStateOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about a repository.
  /// <note>
  /// The description field for a repository accepts all HTML characters and all
  /// valid Unicode characters. Applications that do not HTML-encode the
  /// description and display it in a webpage can expose users to potentially
  /// malicious code. Make sure that you HTML-encode the description field in
  /// any application that uses this API to display the repository description
  /// on a webpage.
  /// </note>
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to get information about.
  Future<GetRepositoryOutput> getRepository({
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
      },
    );

    return GetRepositoryOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about triggers configured for a repository.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository for which the trigger is configured.
  Future<GetRepositoryTriggersOutput> getRepositoryTriggers({
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.GetRepositoryTriggers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
      },
    );

    return GetRepositoryTriggersOutput.fromJson(jsonResponse.body);
  }

  /// Lists all approval rule templates in the specified Amazon Web Services
  /// Region in your Amazon Web Services account. If an Amazon Web Services
  /// Region is not specified, the Amazon Web Services Region where you are
  /// signed in is used.
  ///
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidContinuationTokenException].
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<ListApprovalRuleTemplatesOutput> listApprovalRuleTemplates({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.ListApprovalRuleTemplates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListApprovalRuleTemplatesOutput.fromJson(jsonResponse.body);
  }

  /// Lists all approval rule templates that are associated with a specified
  /// repository.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository for which you want to list all associated
  /// approval rule templates.
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<ListAssociatedApprovalRuleTemplatesForRepositoryOutput>
      listAssociatedApprovalRuleTemplatesForRepository({
    required String repositoryName,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'CodeCommit_20150413.ListAssociatedApprovalRuleTemplatesForRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListAssociatedApprovalRuleTemplatesForRepositoryOutput.fromJson(
        jsonResponse.body);
  }

  /// Gets information about one or more branches in a repository.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  /// May throw [InvalidContinuationTokenException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the branches.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that allows the operation to batch the results.
  Future<ListBranchesOutput> listBranches({
    required String repositoryName,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.ListBranches'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListBranchesOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of commits and changes to a specified file.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [CommitRequiredException].
  /// May throw [InvalidCommitException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [filePath] :
  /// The full path of the file whose history you want to retrieve, including
  /// the name of the file.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the file.
  ///
  /// Parameter [commitSpecifier] :
  /// The fully quaified reference that identifies the commit that contains the
  /// file. For example, you can specify a full commit ID, a tag, a branch name,
  /// or a reference such as <code>refs/heads/main</code>. If none is provided,
  /// the head commit is used.
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that allows the operation to batch the results.
  Future<ListFileCommitHistoryResponse> listFileCommitHistory({
    required String filePath,
    required String repositoryName,
    String? commitSpecifier,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.ListFileCommitHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'filePath': filePath,
        'repositoryName': repositoryName,
        if (commitSpecifier != null) 'commitSpecifier': commitSpecifier,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListFileCommitHistoryResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of pull requests for a specified repository. The return
  /// list can be refined by pull request status or pull request author ARN.
  ///
  /// May throw [InvalidPullRequestStatusException].
  /// May throw [InvalidAuthorArnException].
  /// May throw [AuthorDoesNotExistException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository for which you want to list pull requests.
  ///
  /// Parameter [authorArn] :
  /// Optional. The Amazon Resource Name (ARN) of the user who created the pull
  /// request. If used, this filters the results to pull requests created by
  /// that user.
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  ///
  /// Parameter [pullRequestStatus] :
  /// Optional. The status of the pull request. If used, this refines the
  /// results to the pull requests that match the specified status.
  Future<ListPullRequestsOutput> listPullRequests({
    required String repositoryName,
    String? authorArn,
    int? maxResults,
    String? nextToken,
    PullRequestStatusEnum? pullRequestStatus,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.ListPullRequests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (authorArn != null) 'authorArn': authorArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (pullRequestStatus != null)
          'pullRequestStatus': pullRequestStatus.toValue(),
      },
    );

    return ListPullRequestsOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about one or more repositories.
  ///
  /// May throw [InvalidSortByException].
  /// May throw [InvalidOrderException].
  /// May throw [InvalidContinuationTokenException].
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that allows the operation to batch the results of the
  /// operation. Batch sizes are 1,000 for list repository operations. When the
  /// client sends the token back to CodeCommit, another page of 1,000 records
  /// is retrieved.
  ///
  /// Parameter [order] :
  /// The order in which to sort the results of a list repositories operation.
  ///
  /// Parameter [sortBy] :
  /// The criteria used to sort the results of a list repositories operation.
  Future<ListRepositoriesOutput> listRepositories({
    String? nextToken,
    OrderEnum? order,
    SortByEnum? sortBy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.ListRepositories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
        if (order != null) 'order': order.toValue(),
        if (sortBy != null) 'sortBy': sortBy.toValue(),
      },
    );

    return ListRepositoriesOutput.fromJson(jsonResponse.body);
  }

  /// Lists all repositories associated with the specified approval rule
  /// template.
  ///
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateDoesNotExistException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidContinuationTokenException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [approvalRuleTemplateName] :
  /// The name of the approval rule template for which you want to list
  /// repositories that are associated with that template.
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<ListRepositoriesForApprovalRuleTemplateOutput>
      listRepositoriesForApprovalRuleTemplate({
    required String approvalRuleTemplateName,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'CodeCommit_20150413.ListRepositoriesForApprovalRuleTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleTemplateName': approvalRuleTemplateName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListRepositoriesForApprovalRuleTemplateOutput.fromJson(
        jsonResponse.body);
  }

  /// Gets information about Amazon Web Servicestags for a specified Amazon
  /// Resource Name (ARN) in CodeCommit. For a list of valid resources in
  /// CodeCommit, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit
  /// Resources and Operations</a> in the<i> CodeCommit User Guide</i>.
  ///
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [ResourceArnRequiredException].
  /// May throw [InvalidResourceArnException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which you want to get
  /// information about tags, if any.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Merges two branches using the fast-forward merge strategy.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [CommitRequiredException].
  /// May throw [InvalidCommitException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidTargetBranchException].
  /// May throw [InvalidBranchNameException].
  /// May throw [BranchNameRequiredException].
  /// May throw [BranchNameIsTagNameException].
  /// May throw [BranchDoesNotExistException].
  /// May throw [ManualMergeRequiredException].
  /// May throw [ConcurrentReferenceUpdateException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [destinationCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to merge two branches.
  ///
  /// Parameter [sourceCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [targetBranch] :
  /// The branch where the merge is applied.
  Future<MergeBranchesByFastForwardOutput> mergeBranchesByFastForward({
    required String destinationCommitSpecifier,
    required String repositoryName,
    required String sourceCommitSpecifier,
    String? targetBranch,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.MergeBranchesByFastForward'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationCommitSpecifier': destinationCommitSpecifier,
        'repositoryName': repositoryName,
        'sourceCommitSpecifier': sourceCommitSpecifier,
        if (targetBranch != null) 'targetBranch': targetBranch,
      },
    );

    return MergeBranchesByFastForwardOutput.fromJson(jsonResponse.body);
  }

  /// Merges two branches using the squash merge strategy.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [CommitRequiredException].
  /// May throw [InvalidCommitException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidTargetBranchException].
  /// May throw [InvalidBranchNameException].
  /// May throw [BranchNameRequiredException].
  /// May throw [BranchNameIsTagNameException].
  /// May throw [BranchDoesNotExistException].
  /// May throw [ManualMergeRequiredException].
  /// May throw [InvalidConflictDetailLevelException].
  /// May throw [InvalidConflictResolutionStrategyException].
  /// May throw [InvalidConflictResolutionException].
  /// May throw [MaximumConflictResolutionEntriesExceededException].
  /// May throw [MultipleConflictResolutionEntriesException].
  /// May throw [ReplacementTypeRequiredException].
  /// May throw [InvalidReplacementTypeException].
  /// May throw [ReplacementContentRequiredException].
  /// May throw [InvalidReplacementContentException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [FileContentSizeLimitExceededException].
  /// May throw [FolderContentSizeLimitExceededException].
  /// May throw [MaximumFileContentToLoadExceededException].
  /// May throw [MaximumItemsToCompareExceededException].
  /// May throw [FileModeRequiredException].
  /// May throw [InvalidFileModeException].
  /// May throw [NameLengthExceededException].
  /// May throw [InvalidEmailException].
  /// May throw [CommitMessageLengthExceededException].
  /// May throw [ConcurrentReferenceUpdateException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [destinationCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to merge two branches.
  ///
  /// Parameter [sourceCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [authorName] :
  /// The name of the author who created the commit. This information is used as
  /// both the author and committer for the commit.
  ///
  /// Parameter [commitMessage] :
  /// The commit message for the merge.
  ///
  /// Parameter [conflictDetailLevel] :
  /// The level of conflict detail to use. If unspecified, the default
  /// FILE_LEVEL is used, which returns a not-mergeable result if the same file
  /// has differences in both branches. If LINE_LEVEL is specified, a conflict
  /// is considered not mergeable if the same file in both branches has
  /// differences on the same line.
  ///
  /// Parameter [conflictResolution] :
  /// If AUTOMERGE is the conflict resolution strategy, a list of inputs to use
  /// when resolving conflicts during a merge.
  ///
  /// Parameter [conflictResolutionStrategy] :
  /// Specifies which branch to use when resolving conflicts, or whether to
  /// attempt automatically merging two versions of a file. The default is NONE,
  /// which requires any conflicts to be resolved manually before the merge
  /// operation is successful.
  ///
  /// Parameter [email] :
  /// The email address of the person merging the branches. This information is
  /// used in the commit information for the merge.
  ///
  /// Parameter [keepEmptyFolders] :
  /// If the commit contains deletions, whether to keep a folder or folder
  /// structure if the changes leave the folders empty. If this is specified as
  /// true, a .gitkeep file is created for empty folders. The default is false.
  ///
  /// Parameter [targetBranch] :
  /// The branch where the merge is applied.
  Future<MergeBranchesBySquashOutput> mergeBranchesBySquash({
    required String destinationCommitSpecifier,
    required String repositoryName,
    required String sourceCommitSpecifier,
    String? authorName,
    String? commitMessage,
    ConflictDetailLevelTypeEnum? conflictDetailLevel,
    ConflictResolution? conflictResolution,
    ConflictResolutionStrategyTypeEnum? conflictResolutionStrategy,
    String? email,
    bool? keepEmptyFolders,
    String? targetBranch,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.MergeBranchesBySquash'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationCommitSpecifier': destinationCommitSpecifier,
        'repositoryName': repositoryName,
        'sourceCommitSpecifier': sourceCommitSpecifier,
        if (authorName != null) 'authorName': authorName,
        if (commitMessage != null) 'commitMessage': commitMessage,
        if (conflictDetailLevel != null)
          'conflictDetailLevel': conflictDetailLevel.toValue(),
        if (conflictResolution != null)
          'conflictResolution': conflictResolution,
        if (conflictResolutionStrategy != null)
          'conflictResolutionStrategy': conflictResolutionStrategy.toValue(),
        if (email != null) 'email': email,
        if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
        if (targetBranch != null) 'targetBranch': targetBranch,
      },
    );

    return MergeBranchesBySquashOutput.fromJson(jsonResponse.body);
  }

  /// Merges two specified branches using the three-way merge strategy.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [CommitRequiredException].
  /// May throw [InvalidCommitException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidTargetBranchException].
  /// May throw [InvalidBranchNameException].
  /// May throw [BranchNameRequiredException].
  /// May throw [BranchNameIsTagNameException].
  /// May throw [BranchDoesNotExistException].
  /// May throw [ManualMergeRequiredException].
  /// May throw [ConcurrentReferenceUpdateException].
  /// May throw [InvalidConflictDetailLevelException].
  /// May throw [InvalidConflictResolutionStrategyException].
  /// May throw [InvalidConflictResolutionException].
  /// May throw [MaximumConflictResolutionEntriesExceededException].
  /// May throw [MultipleConflictResolutionEntriesException].
  /// May throw [ReplacementTypeRequiredException].
  /// May throw [InvalidReplacementTypeException].
  /// May throw [ReplacementContentRequiredException].
  /// May throw [InvalidReplacementContentException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [FileContentSizeLimitExceededException].
  /// May throw [FolderContentSizeLimitExceededException].
  /// May throw [MaximumFileContentToLoadExceededException].
  /// May throw [MaximumItemsToCompareExceededException].
  /// May throw [FileModeRequiredException].
  /// May throw [InvalidFileModeException].
  /// May throw [NameLengthExceededException].
  /// May throw [InvalidEmailException].
  /// May throw [CommitMessageLengthExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [destinationCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to merge two branches.
  ///
  /// Parameter [sourceCommitSpecifier] :
  /// The branch, tag, HEAD, or other fully qualified reference used to identify
  /// a commit (for example, a branch name or a full commit ID).
  ///
  /// Parameter [authorName] :
  /// The name of the author who created the commit. This information is used as
  /// both the author and committer for the commit.
  ///
  /// Parameter [commitMessage] :
  /// The commit message to include in the commit information for the merge.
  ///
  /// Parameter [conflictDetailLevel] :
  /// The level of conflict detail to use. If unspecified, the default
  /// FILE_LEVEL is used, which returns a not-mergeable result if the same file
  /// has differences in both branches. If LINE_LEVEL is specified, a conflict
  /// is considered not mergeable if the same file in both branches has
  /// differences on the same line.
  ///
  /// Parameter [conflictResolution] :
  /// If AUTOMERGE is the conflict resolution strategy, a list of inputs to use
  /// when resolving conflicts during a merge.
  ///
  /// Parameter [conflictResolutionStrategy] :
  /// Specifies which branch to use when resolving conflicts, or whether to
  /// attempt automatically merging two versions of a file. The default is NONE,
  /// which requires any conflicts to be resolved manually before the merge
  /// operation is successful.
  ///
  /// Parameter [email] :
  /// The email address of the person merging the branches. This information is
  /// used in the commit information for the merge.
  ///
  /// Parameter [keepEmptyFolders] :
  /// If the commit contains deletions, whether to keep a folder or folder
  /// structure if the changes leave the folders empty. If true, a .gitkeep file
  /// is created for empty folders. The default is false.
  ///
  /// Parameter [targetBranch] :
  /// The branch where the merge is applied.
  Future<MergeBranchesByThreeWayOutput> mergeBranchesByThreeWay({
    required String destinationCommitSpecifier,
    required String repositoryName,
    required String sourceCommitSpecifier,
    String? authorName,
    String? commitMessage,
    ConflictDetailLevelTypeEnum? conflictDetailLevel,
    ConflictResolution? conflictResolution,
    ConflictResolutionStrategyTypeEnum? conflictResolutionStrategy,
    String? email,
    bool? keepEmptyFolders,
    String? targetBranch,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.MergeBranchesByThreeWay'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationCommitSpecifier': destinationCommitSpecifier,
        'repositoryName': repositoryName,
        'sourceCommitSpecifier': sourceCommitSpecifier,
        if (authorName != null) 'authorName': authorName,
        if (commitMessage != null) 'commitMessage': commitMessage,
        if (conflictDetailLevel != null)
          'conflictDetailLevel': conflictDetailLevel.toValue(),
        if (conflictResolution != null)
          'conflictResolution': conflictResolution,
        if (conflictResolutionStrategy != null)
          'conflictResolutionStrategy': conflictResolutionStrategy.toValue(),
        if (email != null) 'email': email,
        if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
        if (targetBranch != null) 'targetBranch': targetBranch,
      },
    );

    return MergeBranchesByThreeWayOutput.fromJson(jsonResponse.body);
  }

  /// Attempts to merge the source commit of a pull request into the specified
  /// destination branch for that pull request at the specified commit using the
  /// fast-forward merge strategy. If the merge is successful, it closes the
  /// pull request.
  ///
  /// May throw [ManualMergeRequiredException].
  /// May throw [PullRequestAlreadyClosedException].
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [TipOfSourceReferenceIsDifferentException].
  /// May throw [ReferenceDoesNotExistException].
  /// May throw [InvalidCommitIdException].
  /// May throw [RepositoryNotAssociatedWithPullRequestException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [ConcurrentReferenceUpdateException].
  /// May throw [PullRequestApprovalRulesNotSatisfiedException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request. To get this ID, use
  /// <a>ListPullRequests</a>.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where the pull request was created.
  ///
  /// Parameter [sourceCommitId] :
  /// The full commit ID of the original or updated commit in the pull request
  /// source branch. Pass this value if you want an exception thrown if the
  /// current commit ID of the tip of the source branch does not match this
  /// commit ID.
  Future<MergePullRequestByFastForwardOutput> mergePullRequestByFastForward({
    required String pullRequestId,
    required String repositoryName,
    String? sourceCommitId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.MergePullRequestByFastForward'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
        'repositoryName': repositoryName,
        if (sourceCommitId != null) 'sourceCommitId': sourceCommitId,
      },
    );

    return MergePullRequestByFastForwardOutput.fromJson(jsonResponse.body);
  }

  /// Attempts to merge the source commit of a pull request into the specified
  /// destination branch for that pull request at the specified commit using the
  /// squash merge strategy. If the merge is successful, it closes the pull
  /// request.
  ///
  /// May throw [PullRequestAlreadyClosedException].
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [InvalidCommitIdException].
  /// May throw [ManualMergeRequiredException].
  /// May throw [TipOfSourceReferenceIsDifferentException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [NameLengthExceededException].
  /// May throw [InvalidEmailException].
  /// May throw [CommitMessageLengthExceededException].
  /// May throw [InvalidConflictDetailLevelException].
  /// May throw [InvalidConflictResolutionStrategyException].
  /// May throw [InvalidConflictResolutionException].
  /// May throw [ReplacementTypeRequiredException].
  /// May throw [InvalidReplacementTypeException].
  /// May throw [MultipleConflictResolutionEntriesException].
  /// May throw [ReplacementContentRequiredException].
  /// May throw [MaximumConflictResolutionEntriesExceededException].
  /// May throw [ConcurrentReferenceUpdateException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [InvalidFileModeException].
  /// May throw [InvalidReplacementContentException].
  /// May throw [FileContentSizeLimitExceededException].
  /// May throw [FolderContentSizeLimitExceededException].
  /// May throw [MaximumFileContentToLoadExceededException].
  /// May throw [MaximumItemsToCompareExceededException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [RepositoryNotAssociatedWithPullRequestException].
  /// May throw [PullRequestApprovalRulesNotSatisfiedException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request. To get this ID, use
  /// <a>ListPullRequests</a>.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where the pull request was created.
  ///
  /// Parameter [authorName] :
  /// The name of the author who created the commit. This information is used as
  /// both the author and committer for the commit.
  ///
  /// Parameter [commitMessage] :
  /// The commit message to include in the commit information for the merge.
  ///
  /// Parameter [conflictDetailLevel] :
  /// The level of conflict detail to use. If unspecified, the default
  /// FILE_LEVEL is used, which returns a not-mergeable result if the same file
  /// has differences in both branches. If LINE_LEVEL is specified, a conflict
  /// is considered not mergeable if the same file in both branches has
  /// differences on the same line.
  ///
  /// Parameter [conflictResolution] :
  /// If AUTOMERGE is the conflict resolution strategy, a list of inputs to use
  /// when resolving conflicts during a merge.
  ///
  /// Parameter [conflictResolutionStrategy] :
  /// Specifies which branch to use when resolving conflicts, or whether to
  /// attempt automatically merging two versions of a file. The default is NONE,
  /// which requires any conflicts to be resolved manually before the merge
  /// operation is successful.
  ///
  /// Parameter [email] :
  /// The email address of the person merging the branches. This information is
  /// used in the commit information for the merge.
  ///
  /// Parameter [keepEmptyFolders] :
  /// If the commit contains deletions, whether to keep a folder or folder
  /// structure if the changes leave the folders empty. If true, a .gitkeep file
  /// is created for empty folders. The default is false.
  ///
  /// Parameter [sourceCommitId] :
  /// The full commit ID of the original or updated commit in the pull request
  /// source branch. Pass this value if you want an exception thrown if the
  /// current commit ID of the tip of the source branch does not match this
  /// commit ID.
  Future<MergePullRequestBySquashOutput> mergePullRequestBySquash({
    required String pullRequestId,
    required String repositoryName,
    String? authorName,
    String? commitMessage,
    ConflictDetailLevelTypeEnum? conflictDetailLevel,
    ConflictResolution? conflictResolution,
    ConflictResolutionStrategyTypeEnum? conflictResolutionStrategy,
    String? email,
    bool? keepEmptyFolders,
    String? sourceCommitId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.MergePullRequestBySquash'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
        'repositoryName': repositoryName,
        if (authorName != null) 'authorName': authorName,
        if (commitMessage != null) 'commitMessage': commitMessage,
        if (conflictDetailLevel != null)
          'conflictDetailLevel': conflictDetailLevel.toValue(),
        if (conflictResolution != null)
          'conflictResolution': conflictResolution,
        if (conflictResolutionStrategy != null)
          'conflictResolutionStrategy': conflictResolutionStrategy.toValue(),
        if (email != null) 'email': email,
        if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
        if (sourceCommitId != null) 'sourceCommitId': sourceCommitId,
      },
    );

    return MergePullRequestBySquashOutput.fromJson(jsonResponse.body);
  }

  /// Attempts to merge the source commit of a pull request into the specified
  /// destination branch for that pull request at the specified commit using the
  /// three-way merge strategy. If the merge is successful, it closes the pull
  /// request.
  ///
  /// May throw [PullRequestAlreadyClosedException].
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [InvalidCommitIdException].
  /// May throw [ManualMergeRequiredException].
  /// May throw [TipOfSourceReferenceIsDifferentException].
  /// May throw [TipsDivergenceExceededException].
  /// May throw [NameLengthExceededException].
  /// May throw [InvalidEmailException].
  /// May throw [CommitMessageLengthExceededException].
  /// May throw [InvalidConflictDetailLevelException].
  /// May throw [InvalidConflictResolutionStrategyException].
  /// May throw [InvalidConflictResolutionException].
  /// May throw [ReplacementTypeRequiredException].
  /// May throw [InvalidReplacementTypeException].
  /// May throw [MultipleConflictResolutionEntriesException].
  /// May throw [ReplacementContentRequiredException].
  /// May throw [MaximumConflictResolutionEntriesExceededException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [InvalidFileModeException].
  /// May throw [InvalidReplacementContentException].
  /// May throw [FileContentSizeLimitExceededException].
  /// May throw [FolderContentSizeLimitExceededException].
  /// May throw [MaximumFileContentToLoadExceededException].
  /// May throw [MaximumItemsToCompareExceededException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [RepositoryNotAssociatedWithPullRequestException].
  /// May throw [ConcurrentReferenceUpdateException].
  /// May throw [PullRequestApprovalRulesNotSatisfiedException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request. To get this ID, use
  /// <a>ListPullRequests</a>.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where the pull request was created.
  ///
  /// Parameter [authorName] :
  /// The name of the author who created the commit. This information is used as
  /// both the author and committer for the commit.
  ///
  /// Parameter [commitMessage] :
  /// The commit message to include in the commit information for the merge.
  ///
  /// Parameter [conflictDetailLevel] :
  /// The level of conflict detail to use. If unspecified, the default
  /// FILE_LEVEL is used, which returns a not-mergeable result if the same file
  /// has differences in both branches. If LINE_LEVEL is specified, a conflict
  /// is considered not mergeable if the same file in both branches has
  /// differences on the same line.
  ///
  /// Parameter [conflictResolution] :
  /// If AUTOMERGE is the conflict resolution strategy, a list of inputs to use
  /// when resolving conflicts during a merge.
  ///
  /// Parameter [conflictResolutionStrategy] :
  /// Specifies which branch to use when resolving conflicts, or whether to
  /// attempt automatically merging two versions of a file. The default is NONE,
  /// which requires any conflicts to be resolved manually before the merge
  /// operation is successful.
  ///
  /// Parameter [email] :
  /// The email address of the person merging the branches. This information is
  /// used in the commit information for the merge.
  ///
  /// Parameter [keepEmptyFolders] :
  /// If the commit contains deletions, whether to keep a folder or folder
  /// structure if the changes leave the folders empty. If true, a .gitkeep file
  /// is created for empty folders. The default is false.
  ///
  /// Parameter [sourceCommitId] :
  /// The full commit ID of the original or updated commit in the pull request
  /// source branch. Pass this value if you want an exception thrown if the
  /// current commit ID of the tip of the source branch does not match this
  /// commit ID.
  Future<MergePullRequestByThreeWayOutput> mergePullRequestByThreeWay({
    required String pullRequestId,
    required String repositoryName,
    String? authorName,
    String? commitMessage,
    ConflictDetailLevelTypeEnum? conflictDetailLevel,
    ConflictResolution? conflictResolution,
    ConflictResolutionStrategyTypeEnum? conflictResolutionStrategy,
    String? email,
    bool? keepEmptyFolders,
    String? sourceCommitId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.MergePullRequestByThreeWay'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
        'repositoryName': repositoryName,
        if (authorName != null) 'authorName': authorName,
        if (commitMessage != null) 'commitMessage': commitMessage,
        if (conflictDetailLevel != null)
          'conflictDetailLevel': conflictDetailLevel.toValue(),
        if (conflictResolution != null)
          'conflictResolution': conflictResolution,
        if (conflictResolutionStrategy != null)
          'conflictResolutionStrategy': conflictResolutionStrategy.toValue(),
        if (email != null) 'email': email,
        if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
        if (sourceCommitId != null) 'sourceCommitId': sourceCommitId,
      },
    );

    return MergePullRequestByThreeWayOutput.fromJson(jsonResponse.body);
  }

  /// Sets aside (overrides) all approval rule requirements for a specified pull
  /// request.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [InvalidRevisionIdException].
  /// May throw [RevisionIdRequiredException].
  /// May throw [InvalidOverrideStatusException].
  /// May throw [OverrideStatusRequiredException].
  /// May throw [OverrideAlreadySetException].
  /// May throw [RevisionNotCurrentException].
  /// May throw [PullRequestAlreadyClosedException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [overrideStatus] :
  /// Whether you want to set aside approval rule requirements for the pull
  /// request (OVERRIDE) or revoke a previous override and apply approval rule
  /// requirements (REVOKE). REVOKE status is not stored.
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request for which you want to override
  /// all approval rule requirements. To get this information, use
  /// <a>GetPullRequest</a>.
  ///
  /// Parameter [revisionId] :
  /// The system-generated ID of the most recent revision of the pull request.
  /// You cannot override approval rules for anything but the most recent
  /// revision of a pull request. To get the revision ID, use GetPullRequest.
  Future<void> overridePullRequestApprovalRules({
    required OverrideStatus overrideStatus,
    required String pullRequestId,
    required String revisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.OverridePullRequestApprovalRules'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'overrideStatus': overrideStatus.toValue(),
        'pullRequestId': pullRequestId,
        'revisionId': revisionId,
      },
    );
  }

  /// Posts a comment on the comparison between two commits.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [ClientRequestTokenRequiredException].
  /// May throw [InvalidClientRequestTokenException].
  /// May throw [IdempotencyParameterMismatchException].
  /// May throw [CommentContentRequiredException].
  /// May throw [CommentContentSizeLimitExceededException].
  /// May throw [InvalidFileLocationException].
  /// May throw [InvalidRelativeFileVersionEnumException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidFilePositionException].
  /// May throw [CommitIdRequiredException].
  /// May throw [InvalidCommitIdException].
  /// May throw [BeforeCommitIdAndAfterCommitIdAreSameException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidPathException].
  /// May throw [PathDoesNotExistException].
  /// May throw [PathRequiredException].
  ///
  /// Parameter [afterCommitId] :
  /// To establish the directionality of the comparison, the full commit ID of
  /// the after commit.
  ///
  /// Parameter [content] :
  /// The content of the comment you want to make.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to post a comment on the
  /// comparison between commits.
  ///
  /// Parameter [beforeCommitId] :
  /// To establish the directionality of the comparison, the full commit ID of
  /// the before commit. Required for commenting on any commit unless that
  /// commit is the initial commit.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, client-generated idempotency token that, when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter.
  /// If a request is received with the same parameters and a token is included,
  /// the request returns information about the initial request that used that
  /// token.
  ///
  /// Parameter [location] :
  /// The location of the comparison where you want to comment.
  Future<PostCommentForComparedCommitOutput> postCommentForComparedCommit({
    required String afterCommitId,
    required String content,
    required String repositoryName,
    String? beforeCommitId,
    String? clientRequestToken,
    Location? location,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.PostCommentForComparedCommit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'afterCommitId': afterCommitId,
        'content': content,
        'repositoryName': repositoryName,
        if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
        'clientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (location != null) 'location': location,
      },
    );

    return PostCommentForComparedCommitOutput.fromJson(jsonResponse.body);
  }

  /// Posts a comment on a pull request.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [RepositoryNotAssociatedWithPullRequestException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [ClientRequestTokenRequiredException].
  /// May throw [InvalidClientRequestTokenException].
  /// May throw [IdempotencyParameterMismatchException].
  /// May throw [CommentContentRequiredException].
  /// May throw [CommentContentSizeLimitExceededException].
  /// May throw [InvalidFileLocationException].
  /// May throw [InvalidRelativeFileVersionEnumException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidFilePositionException].
  /// May throw [CommitIdRequiredException].
  /// May throw [InvalidCommitIdException].
  /// May throw [BeforeCommitIdAndAfterCommitIdAreSameException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  /// May throw [CommitDoesNotExistException].
  /// May throw [InvalidPathException].
  /// May throw [PathDoesNotExistException].
  /// May throw [PathRequiredException].
  ///
  /// Parameter [afterCommitId] :
  /// The full commit ID of the commit in the source branch that is the current
  /// tip of the branch for the pull request when you post the comment.
  ///
  /// Parameter [beforeCommitId] :
  /// The full commit ID of the commit in the destination branch that was the
  /// tip of the branch at the time the pull request was created.
  ///
  /// Parameter [content] :
  /// The content of your comment on the change.
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request. To get this ID, use
  /// <a>ListPullRequests</a>.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to post a comment on a pull
  /// request.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, client-generated idempotency token that, when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter.
  /// If a request is received with the same parameters and a token is included,
  /// the request returns information about the initial request that used that
  /// token.
  ///
  /// Parameter [location] :
  /// The location of the change where you want to post your comment. If no
  /// location is provided, the comment is posted as a general comment on the
  /// pull request difference between the before commit ID and the after commit
  /// ID.
  Future<PostCommentForPullRequestOutput> postCommentForPullRequest({
    required String afterCommitId,
    required String beforeCommitId,
    required String content,
    required String pullRequestId,
    required String repositoryName,
    String? clientRequestToken,
    Location? location,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.PostCommentForPullRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'afterCommitId': afterCommitId,
        'beforeCommitId': beforeCommitId,
        'content': content,
        'pullRequestId': pullRequestId,
        'repositoryName': repositoryName,
        'clientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (location != null) 'location': location,
      },
    );

    return PostCommentForPullRequestOutput.fromJson(jsonResponse.body);
  }

  /// Posts a comment in reply to an existing comment on a comparison between
  /// commits or a pull request.
  ///
  /// May throw [ClientRequestTokenRequiredException].
  /// May throw [InvalidClientRequestTokenException].
  /// May throw [IdempotencyParameterMismatchException].
  /// May throw [CommentContentRequiredException].
  /// May throw [CommentContentSizeLimitExceededException].
  /// May throw [CommentDoesNotExistException].
  /// May throw [CommentIdRequiredException].
  /// May throw [InvalidCommentIdException].
  ///
  /// Parameter [content] :
  /// The contents of your reply to a comment.
  ///
  /// Parameter [inReplyTo] :
  /// The system-generated ID of the comment to which you want to reply. To get
  /// this ID, use <a>GetCommentsForComparedCommit</a> or
  /// <a>GetCommentsForPullRequest</a>.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, client-generated idempotency token that, when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter.
  /// If a request is received with the same parameters and a token is included,
  /// the request returns information about the initial request that used that
  /// token.
  Future<PostCommentReplyOutput> postCommentReply({
    required String content,
    required String inReplyTo,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.PostCommentReply'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'content': content,
        'inReplyTo': inReplyTo,
        'clientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return PostCommentReplyOutput.fromJson(jsonResponse.body);
  }

  /// Adds or updates a reaction to a specified comment for the user whose
  /// identity is used to make the request. You can only add or update a
  /// reaction for yourself. You cannot add, modify, or delete a reaction for
  /// another user.
  ///
  /// May throw [CommentDoesNotExistException].
  /// May throw [CommentIdRequiredException].
  /// May throw [InvalidCommentIdException].
  /// May throw [InvalidReactionValueException].
  /// May throw [ReactionValueRequiredException].
  /// May throw [ReactionLimitExceededException].
  /// May throw [CommentDeletedException].
  ///
  /// Parameter [commentId] :
  /// The ID of the comment to which you want to add or update a reaction.
  ///
  /// Parameter [reactionValue] :
  /// The emoji reaction you want to add or update. To remove a reaction,
  /// provide a value of blank or null. You can also provide the value of none.
  /// For information about emoji reaction values supported in CodeCommit, see
  /// the <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-commit-comment.html#emoji-reaction-table">CodeCommit
  /// User Guide</a>.
  Future<void> putCommentReaction({
    required String commentId,
    required String reactionValue,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.PutCommentReaction'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'commentId': commentId,
        'reactionValue': reactionValue,
      },
    );
  }

  /// Adds or updates a file in a branch in an CodeCommit repository, and
  /// generates a commit for the addition in the specified branch.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [ParentCommitIdRequiredException].
  /// May throw [InvalidParentCommitIdException].
  /// May throw [ParentCommitDoesNotExistException].
  /// May throw [ParentCommitIdOutdatedException].
  /// May throw [FileContentRequiredException].
  /// May throw [FileContentSizeLimitExceededException].
  /// May throw [FolderContentSizeLimitExceededException].
  /// May throw [PathRequiredException].
  /// May throw [InvalidPathException].
  /// May throw [BranchNameRequiredException].
  /// May throw [InvalidBranchNameException].
  /// May throw [BranchDoesNotExistException].
  /// May throw [BranchNameIsTagNameException].
  /// May throw [InvalidFileModeException].
  /// May throw [NameLengthExceededException].
  /// May throw [InvalidEmailException].
  /// May throw [CommitMessageLengthExceededException].
  /// May throw [InvalidDeletionParameterException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  /// May throw [SameFileContentException].
  /// May throw [FileNameConflictsWithDirectoryNameException].
  /// May throw [DirectoryNameConflictsWithFileNameException].
  /// May throw [FilePathConflictsWithSubmodulePathException].
  ///
  /// Parameter [branchName] :
  /// The name of the branch where you want to add or update the file. If this
  /// is an empty repository, this branch is created.
  ///
  /// Parameter [fileContent] :
  /// The content of the file, in binary object format.
  ///
  /// Parameter [filePath] :
  /// The name of the file you want to add or update, including the relative
  /// path to the file in the repository.
  /// <note>
  /// If the path does not currently exist in the repository, the path is
  /// created as part of adding the file.
  /// </note>
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to add or update the file.
  ///
  /// Parameter [commitMessage] :
  /// A message about why this file was added or updated. Although it is
  /// optional, a message makes the commit history for your repository more
  /// useful.
  ///
  /// Parameter [email] :
  /// An email address for the person adding or updating the file.
  ///
  /// Parameter [fileMode] :
  /// The file mode permissions of the blob. Valid file mode permissions are
  /// listed here.
  ///
  /// Parameter [name] :
  /// The name of the person adding or updating the file. Although it is
  /// optional, a name makes the commit history for your repository more useful.
  ///
  /// Parameter [parentCommitId] :
  /// The full commit ID of the head commit in the branch where you want to add
  /// or update the file. If this is an empty repository, no commit ID is
  /// required. If this is not an empty repository, a commit ID is required.
  ///
  /// The commit ID must match the ID of the head commit at the time of the
  /// operation. Otherwise, an error occurs, and the file is not added or
  /// updated.
  Future<PutFileOutput> putFile({
    required String branchName,
    required Uint8List fileContent,
    required String filePath,
    required String repositoryName,
    String? commitMessage,
    String? email,
    FileModeTypeEnum? fileMode,
    String? name,
    String? parentCommitId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.PutFile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'branchName': branchName,
        'fileContent': base64Encode(fileContent),
        'filePath': filePath,
        'repositoryName': repositoryName,
        if (commitMessage != null) 'commitMessage': commitMessage,
        if (email != null) 'email': email,
        if (fileMode != null) 'fileMode': fileMode.toValue(),
        if (name != null) 'name': name,
        if (parentCommitId != null) 'parentCommitId': parentCommitId,
      },
    );

    return PutFileOutput.fromJson(jsonResponse.body);
  }

  /// Replaces all triggers for a repository. Used to create or delete triggers.
  ///
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryTriggersListRequiredException].
  /// May throw [MaximumRepositoryTriggersExceededException].
  /// May throw [InvalidRepositoryTriggerNameException].
  /// May throw [InvalidRepositoryTriggerDestinationArnException].
  /// May throw [InvalidRepositoryTriggerRegionException].
  /// May throw [InvalidRepositoryTriggerCustomDataException].
  /// May throw [MaximumBranchesExceededException].
  /// May throw [InvalidRepositoryTriggerBranchNameException].
  /// May throw [InvalidRepositoryTriggerEventsException].
  /// May throw [RepositoryTriggerNameRequiredException].
  /// May throw [RepositoryTriggerDestinationArnRequiredException].
  /// May throw [RepositoryTriggerBranchNameListRequiredException].
  /// May throw [RepositoryTriggerEventsListRequiredException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where you want to create or update the trigger.
  ///
  /// Parameter [triggers] :
  /// The JSON block of configuration information for each trigger.
  Future<PutRepositoryTriggersOutput> putRepositoryTriggers({
    required String repositoryName,
    required List<RepositoryTrigger> triggers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.PutRepositoryTriggers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        'triggers': triggers,
      },
    );

    return PutRepositoryTriggersOutput.fromJson(jsonResponse.body);
  }

  /// Adds or updates tags for a resource in CodeCommit. For a list of valid
  /// resources in CodeCommit, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit
  /// Resources and Operations</a> in the <i>CodeCommit User Guide</i>.
  ///
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [ResourceArnRequiredException].
  /// May throw [InvalidResourceArnException].
  /// May throw [TagsMapRequiredException].
  /// May throw [InvalidTagsMapException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidSystemTagUsageException].
  /// May throw [TagPolicyException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which you want to add or
  /// update tags.
  ///
  /// Parameter [tags] :
  /// The key-value pair to use when tagging this repository.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Tests the functionality of repository triggers by sending information to
  /// the trigger target. If real data is available in the repository, the test
  /// sends data from the last commit. If no data is available, sample data is
  /// generated.
  ///
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [RepositoryTriggersListRequiredException].
  /// May throw [MaximumRepositoryTriggersExceededException].
  /// May throw [InvalidRepositoryTriggerNameException].
  /// May throw [InvalidRepositoryTriggerDestinationArnException].
  /// May throw [InvalidRepositoryTriggerRegionException].
  /// May throw [InvalidRepositoryTriggerCustomDataException].
  /// May throw [MaximumBranchesExceededException].
  /// May throw [InvalidRepositoryTriggerBranchNameException].
  /// May throw [InvalidRepositoryTriggerEventsException].
  /// May throw [RepositoryTriggerNameRequiredException].
  /// May throw [RepositoryTriggerDestinationArnRequiredException].
  /// May throw [RepositoryTriggerBranchNameListRequiredException].
  /// May throw [RepositoryTriggerEventsListRequiredException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository in which to test the triggers.
  ///
  /// Parameter [triggers] :
  /// The list of triggers to test.
  Future<TestRepositoryTriggersOutput> testRepositoryTriggers({
    required String repositoryName,
    required List<RepositoryTrigger> triggers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.TestRepositoryTriggers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        'triggers': triggers,
      },
    );

    return TestRepositoryTriggersOutput.fromJson(jsonResponse.body);
  }

  /// Removes tags for a resource in CodeCommit. For a list of valid resources
  /// in CodeCommit, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit
  /// Resources and Operations</a> in the <i>CodeCommit User Guide</i>.
  ///
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [ResourceArnRequiredException].
  /// May throw [InvalidResourceArnException].
  /// May throw [TagKeysListRequiredException].
  /// May throw [InvalidTagKeysListException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidSystemTagUsageException].
  /// May throw [TagPolicyException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which you want to remove
  /// tags.
  ///
  /// Parameter [tagKeys] :
  /// The tag key for each tag that you want to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Updates the content of an approval rule template. You can change the
  /// number of required approvals, the membership of the approval rule, and
  /// whether an approval pool is defined.
  ///
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [ApprovalRuleTemplateDoesNotExistException].
  /// May throw [InvalidApprovalRuleTemplateContentException].
  /// May throw [InvalidRuleContentSha256Exception].
  /// May throw [ApprovalRuleTemplateContentRequiredException].
  ///
  /// Parameter [approvalRuleTemplateName] :
  /// The name of the approval rule template where you want to update the
  /// content of the rule.
  ///
  /// Parameter [newRuleContent] :
  /// The content that replaces the existing content of the rule. Content
  /// statements must be complete. You cannot provide only the changes.
  ///
  /// Parameter [existingRuleContentSha256] :
  /// The SHA-256 hash signature for the content of the approval rule. You can
  /// retrieve this information by using <a>GetPullRequest</a>.
  Future<UpdateApprovalRuleTemplateContentOutput>
      updateApprovalRuleTemplateContent({
    required String approvalRuleTemplateName,
    required String newRuleContent,
    String? existingRuleContentSha256,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdateApprovalRuleTemplateContent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleTemplateName': approvalRuleTemplateName,
        'newRuleContent': newRuleContent,
        if (existingRuleContentSha256 != null)
          'existingRuleContentSha256': existingRuleContentSha256,
      },
    );

    return UpdateApprovalRuleTemplateContentOutput.fromJson(jsonResponse.body);
  }

  /// Updates the description for a specified approval rule template.
  ///
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [ApprovalRuleTemplateDoesNotExistException].
  /// May throw [InvalidApprovalRuleTemplateDescriptionException].
  ///
  /// Parameter [approvalRuleTemplateDescription] :
  /// The updated description of the approval rule template.
  ///
  /// Parameter [approvalRuleTemplateName] :
  /// The name of the template for which you want to update the description.
  Future<UpdateApprovalRuleTemplateDescriptionOutput>
      updateApprovalRuleTemplateDescription({
    required String approvalRuleTemplateDescription,
    required String approvalRuleTemplateName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'CodeCommit_20150413.UpdateApprovalRuleTemplateDescription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleTemplateDescription': approvalRuleTemplateDescription,
        'approvalRuleTemplateName': approvalRuleTemplateName,
      },
    );

    return UpdateApprovalRuleTemplateDescriptionOutput.fromJson(
        jsonResponse.body);
  }

  /// Updates the name of a specified approval rule template.
  ///
  /// May throw [InvalidApprovalRuleTemplateNameException].
  /// May throw [ApprovalRuleTemplateNameRequiredException].
  /// May throw [ApprovalRuleTemplateDoesNotExistException].
  /// May throw [ApprovalRuleTemplateNameAlreadyExistsException].
  ///
  /// Parameter [newApprovalRuleTemplateName] :
  /// The new name you want to apply to the approval rule template.
  ///
  /// Parameter [oldApprovalRuleTemplateName] :
  /// The current name of the approval rule template.
  Future<UpdateApprovalRuleTemplateNameOutput> updateApprovalRuleTemplateName({
    required String newApprovalRuleTemplateName,
    required String oldApprovalRuleTemplateName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdateApprovalRuleTemplateName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'newApprovalRuleTemplateName': newApprovalRuleTemplateName,
        'oldApprovalRuleTemplateName': oldApprovalRuleTemplateName,
      },
    );

    return UpdateApprovalRuleTemplateNameOutput.fromJson(jsonResponse.body);
  }

  /// Replaces the contents of a comment.
  ///
  /// May throw [CommentContentRequiredException].
  /// May throw [CommentContentSizeLimitExceededException].
  /// May throw [CommentDoesNotExistException].
  /// May throw [CommentIdRequiredException].
  /// May throw [InvalidCommentIdException].
  /// May throw [CommentNotCreatedByCallerException].
  /// May throw [CommentDeletedException].
  ///
  /// Parameter [commentId] :
  /// The system-generated ID of the comment you want to update. To get this ID,
  /// use <a>GetCommentsForComparedCommit</a> or
  /// <a>GetCommentsForPullRequest</a>.
  ///
  /// Parameter [content] :
  /// The updated content to replace the existing content of the comment.
  Future<UpdateCommentOutput> updateComment({
    required String commentId,
    required String content,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdateComment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'commentId': commentId,
        'content': content,
      },
    );

    return UpdateCommentOutput.fromJson(jsonResponse.body);
  }

  /// Sets or changes the default branch name for the specified repository.
  /// <note>
  /// If you use this operation to change the default branch name to the current
  /// default branch name, a success message is returned even though the default
  /// branch did not change.
  /// </note>
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [BranchNameRequiredException].
  /// May throw [InvalidBranchNameException].
  /// May throw [BranchDoesNotExistException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [defaultBranchName] :
  /// The name of the branch to set as the default branch.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository for which you want to set or change the default
  /// branch.
  Future<void> updateDefaultBranch({
    required String defaultBranchName,
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdateDefaultBranch'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'defaultBranchName': defaultBranchName,
        'repositoryName': repositoryName,
      },
    );
  }

  /// Updates the structure of an approval rule created specifically for a pull
  /// request. For example, you can change the number of required approvers and
  /// the approval pool for approvers.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [PullRequestAlreadyClosedException].
  /// May throw [ApprovalRuleNameRequiredException].
  /// May throw [InvalidApprovalRuleNameException].
  /// May throw [ApprovalRuleDoesNotExistException].
  /// May throw [InvalidRuleContentSha256Exception].
  /// May throw [ApprovalRuleContentRequiredException].
  /// May throw [InvalidApprovalRuleContentException].
  /// May throw [CannotModifyApprovalRuleFromTemplateException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [approvalRuleName] :
  /// The name of the approval rule you want to update.
  ///
  /// Parameter [newRuleContent] :
  /// The updated content for the approval rule.
  /// <note>
  /// When you update the content of the approval rule, you can specify
  /// approvers in an approval pool in one of two ways:
  ///
  /// <ul>
  /// <li>
  /// <b>CodeCommitApprovers</b>: This option only requires an Amazon Web
  /// Services account and a resource. It can be used for both IAM users and
  /// federated access users whose name matches the provided resource name. This
  /// is a very powerful option that offers a great deal of flexibility. For
  /// example, if you specify the Amazon Web Services account
  /// <i>123456789012</i> and <i>Mary_Major</i>, all of the following are
  /// counted as approvals coming from that user:
  ///
  /// <ul>
  /// <li>
  /// An IAM user in the account
  /// (arn:aws:iam::<i>123456789012</i>:user/<i>Mary_Major</i>)
  /// </li>
  /// <li>
  /// A federated user identified in IAM as Mary_Major
  /// (arn:aws:sts::<i>123456789012</i>:federated-user/<i>Mary_Major</i>)
  /// </li>
  /// </ul>
  /// This option does not recognize an active session of someone assuming the
  /// role of CodeCommitReview with a role session name of <i>Mary_Major</i>
  /// (arn:aws:sts::<i>123456789012</i>:assumed-role/CodeCommitReview/<i>Mary_Major</i>)
  /// unless you include a wildcard (*Mary_Major).
  /// </li>
  /// <li>
  /// <b>Fully qualified ARN</b>: This option allows you to specify the fully
  /// qualified Amazon Resource Name (ARN) of the IAM user or role.
  /// </li>
  /// </ul>
  /// For more information about IAM ARNs, wildcards, and formats, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request.
  ///
  /// Parameter [existingRuleContentSha256] :
  /// The SHA-256 hash signature for the content of the approval rule. You can
  /// retrieve this information by using <a>GetPullRequest</a>.
  Future<UpdatePullRequestApprovalRuleContentOutput>
      updatePullRequestApprovalRuleContent({
    required String approvalRuleName,
    required String newRuleContent,
    required String pullRequestId,
    String? existingRuleContentSha256,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdatePullRequestApprovalRuleContent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalRuleName': approvalRuleName,
        'newRuleContent': newRuleContent,
        'pullRequestId': pullRequestId,
        if (existingRuleContentSha256 != null)
          'existingRuleContentSha256': existingRuleContentSha256,
      },
    );

    return UpdatePullRequestApprovalRuleContentOutput.fromJson(
        jsonResponse.body);
  }

  /// Updates the state of a user's approval on a pull request. The user is
  /// derived from the signed-in account when the request is made.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [InvalidRevisionIdException].
  /// May throw [RevisionIdRequiredException].
  /// May throw [InvalidApprovalStateException].
  /// May throw [ApprovalStateRequiredException].
  /// May throw [PullRequestCannotBeApprovedByAuthorException].
  /// May throw [RevisionNotCurrentException].
  /// May throw [PullRequestAlreadyClosedException].
  /// May throw [MaximumNumberOfApprovalsExceededException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [approvalState] :
  /// The approval state to associate with the user on the pull request.
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request.
  ///
  /// Parameter [revisionId] :
  /// The system-generated ID of the revision.
  Future<void> updatePullRequestApprovalState({
    required ApprovalState approvalState,
    required String pullRequestId,
    required String revisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdatePullRequestApprovalState'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalState': approvalState.toValue(),
        'pullRequestId': pullRequestId,
        'revisionId': revisionId,
      },
    );
  }

  /// Replaces the contents of the description of a pull request.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [InvalidDescriptionException].
  /// May throw [PullRequestAlreadyClosedException].
  ///
  /// Parameter [description] :
  /// The updated content of the description for the pull request. This content
  /// replaces the existing description.
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request. To get this ID, use
  /// <a>ListPullRequests</a>.
  Future<UpdatePullRequestDescriptionOutput> updatePullRequestDescription({
    required String description,
    required String pullRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdatePullRequestDescription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'description': description,
        'pullRequestId': pullRequestId,
      },
    );

    return UpdatePullRequestDescriptionOutput.fromJson(jsonResponse.body);
  }

  /// Updates the status of a pull request.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [InvalidPullRequestStatusUpdateException].
  /// May throw [InvalidPullRequestStatusException].
  /// May throw [PullRequestStatusRequiredException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request. To get this ID, use
  /// <a>ListPullRequests</a>.
  ///
  /// Parameter [pullRequestStatus] :
  /// The status of the pull request. The only valid operations are to update
  /// the status from <code>OPEN</code> to <code>OPEN</code>, <code>OPEN</code>
  /// to <code>CLOSED</code> or from <code>CLOSED</code> to <code>CLOSED</code>.
  Future<UpdatePullRequestStatusOutput> updatePullRequestStatus({
    required String pullRequestId,
    required PullRequestStatusEnum pullRequestStatus,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdatePullRequestStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
        'pullRequestStatus': pullRequestStatus.toValue(),
      },
    );

    return UpdatePullRequestStatusOutput.fromJson(jsonResponse.body);
  }

  /// Replaces the title of a pull request.
  ///
  /// May throw [PullRequestDoesNotExistException].
  /// May throw [InvalidPullRequestIdException].
  /// May throw [PullRequestIdRequiredException].
  /// May throw [TitleRequiredException].
  /// May throw [InvalidTitleException].
  /// May throw [PullRequestAlreadyClosedException].
  ///
  /// Parameter [pullRequestId] :
  /// The system-generated ID of the pull request. To get this ID, use
  /// <a>ListPullRequests</a>.
  ///
  /// Parameter [title] :
  /// The updated title of the pull request. This replaces the existing title.
  Future<UpdatePullRequestTitleOutput> updatePullRequestTitle({
    required String pullRequestId,
    required String title,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdatePullRequestTitle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pullRequestId': pullRequestId,
        'title': title,
      },
    );

    return UpdatePullRequestTitleOutput.fromJson(jsonResponse.body);
  }

  /// Sets or changes the comment or description for a repository.
  /// <note>
  /// The description field for a repository accepts all HTML characters and all
  /// valid Unicode characters. Applications that do not HTML-encode the
  /// description and display it in a webpage can expose users to potentially
  /// malicious code. Make sure that you HTML-encode the description field in
  /// any application that uses this API to display the repository description
  /// on a webpage.
  /// </note>
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [InvalidRepositoryDescriptionException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to set or change the comment or description
  /// for.
  ///
  /// Parameter [repositoryDescription] :
  /// The new comment or description for the specified repository. Repository
  /// descriptions are limited to 1,000 characters.
  Future<void> updateRepositoryDescription({
    required String repositoryName,
    String? repositoryDescription,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdateRepositoryDescription'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (repositoryDescription != null)
          'repositoryDescription': repositoryDescription,
      },
    );
  }

  /// Updates the Key Management Service encryption key used to encrypt and
  /// decrypt a CodeCommit repository.
  ///
  /// May throw [RepositoryNameRequiredException].
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [InvalidRepositoryNameException].
  /// May throw [EncryptionKeyRequiredException].
  /// May throw [EncryptionIntegrityChecksFailedException].
  /// May throw [EncryptionKeyAccessDeniedException].
  /// May throw [EncryptionKeyInvalidIdException].
  /// May throw [EncryptionKeyInvalidUsageException].
  /// May throw [EncryptionKeyDisabledException].
  /// May throw [EncryptionKeyNotFoundException].
  /// May throw [EncryptionKeyUnavailableException].
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the encryption key. You can view the ID of an encryption key in
  /// the KMS console, or use the KMS APIs to programmatically retrieve a key
  /// ID. For more information about acceptable values for keyID, see <a
  /// href="https://docs.aws.amazon.com/APIReference/API_Decrypt.html#KMS-Decrypt-request-KeyId">KeyId</a>
  /// in the Decrypt API description in the <i>Key Management Service API
  /// Reference</i>.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository for which you want to update the KMS encryption
  /// key used to encrypt and decrypt the repository.
  Future<UpdateRepositoryEncryptionKeyOutput> updateRepositoryEncryptionKey({
    required String kmsKeyId,
    required String repositoryName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdateRepositoryEncryptionKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'kmsKeyId': kmsKeyId,
        'repositoryName': repositoryName,
      },
    );

    return UpdateRepositoryEncryptionKeyOutput.fromJson(jsonResponse.body);
  }

  /// Renames a repository. The repository name must be unique across the
  /// calling Amazon Web Services account. Repository names are limited to 100
  /// alphanumeric, dash, and underscore characters, and cannot include certain
  /// characters. The suffix .git is prohibited. For more information about the
  /// limits on repository names, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html">Quotas</a>
  /// in the CodeCommit User Guide.
  ///
  /// May throw [RepositoryDoesNotExistException].
  /// May throw [RepositoryNameExistsException].
  /// May throw [RepositoryNameRequiredException].
  /// May throw [InvalidRepositoryNameException].
  ///
  /// Parameter [newName] :
  /// The new name for the repository.
  ///
  /// Parameter [oldName] :
  /// The current name of the repository.
  Future<void> updateRepositoryName({
    required String newName,
    required String oldName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdateRepositoryName'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'newName': newName,
        'oldName': oldName,
      },
    );
  }
}

/// Returns information about a specific approval on a pull request.
class Approval {
  /// The state of the approval, APPROVE or REVOKE. REVOKE states are not stored.
  final ApprovalState? approvalState;

  /// The Amazon Resource Name (ARN) of the user.
  final String? userArn;

  Approval({
    this.approvalState,
    this.userArn,
  });

  factory Approval.fromJson(Map<String, dynamic> json) {
    return Approval(
      approvalState: (json['approvalState'] as String?)?.toApprovalState(),
      userArn: json['userArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalState = this.approvalState;
    final userArn = this.userArn;
    return {
      if (approvalState != null) 'approvalState': approvalState.toValue(),
      if (userArn != null) 'userArn': userArn,
    };
  }
}

/// Returns information about an approval rule.
class ApprovalRule {
  /// The content of the approval rule.
  final String? approvalRuleContent;

  /// The system-generated ID of the approval rule.
  final String? approvalRuleId;

  /// The name of the approval rule.
  final String? approvalRuleName;

  /// The date the approval rule was created, in timestamp format.
  final DateTime? creationDate;

  /// The date the approval rule was most recently changed, in timestamp format.
  final DateTime? lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the user who made the most recent changes
  /// to the approval rule.
  final String? lastModifiedUser;

  /// The approval rule template used to create the rule.
  final OriginApprovalRuleTemplate? originApprovalRuleTemplate;

  /// The SHA-256 hash signature for the content of the approval rule.
  final String? ruleContentSha256;

  ApprovalRule({
    this.approvalRuleContent,
    this.approvalRuleId,
    this.approvalRuleName,
    this.creationDate,
    this.lastModifiedDate,
    this.lastModifiedUser,
    this.originApprovalRuleTemplate,
    this.ruleContentSha256,
  });

  factory ApprovalRule.fromJson(Map<String, dynamic> json) {
    return ApprovalRule(
      approvalRuleContent: json['approvalRuleContent'] as String?,
      approvalRuleId: json['approvalRuleId'] as String?,
      approvalRuleName: json['approvalRuleName'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      lastModifiedUser: json['lastModifiedUser'] as String?,
      originApprovalRuleTemplate: json['originApprovalRuleTemplate'] != null
          ? OriginApprovalRuleTemplate.fromJson(
              json['originApprovalRuleTemplate'] as Map<String, dynamic>)
          : null,
      ruleContentSha256: json['ruleContentSha256'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleContent = this.approvalRuleContent;
    final approvalRuleId = this.approvalRuleId;
    final approvalRuleName = this.approvalRuleName;
    final creationDate = this.creationDate;
    final lastModifiedDate = this.lastModifiedDate;
    final lastModifiedUser = this.lastModifiedUser;
    final originApprovalRuleTemplate = this.originApprovalRuleTemplate;
    final ruleContentSha256 = this.ruleContentSha256;
    return {
      if (approvalRuleContent != null)
        'approvalRuleContent': approvalRuleContent,
      if (approvalRuleId != null) 'approvalRuleId': approvalRuleId,
      if (approvalRuleName != null) 'approvalRuleName': approvalRuleName,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (lastModifiedDate != null)
        'lastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (lastModifiedUser != null) 'lastModifiedUser': lastModifiedUser,
      if (originApprovalRuleTemplate != null)
        'originApprovalRuleTemplate': originApprovalRuleTemplate,
      if (ruleContentSha256 != null) 'ruleContentSha256': ruleContentSha256,
    };
  }
}

/// Returns information about an event for an approval rule.
class ApprovalRuleEventMetadata {
  /// The content of the approval rule.
  final String? approvalRuleContent;

  /// The system-generated ID of the approval rule.
  final String? approvalRuleId;

  /// The name of the approval rule.
  final String? approvalRuleName;

  ApprovalRuleEventMetadata({
    this.approvalRuleContent,
    this.approvalRuleId,
    this.approvalRuleName,
  });

  factory ApprovalRuleEventMetadata.fromJson(Map<String, dynamic> json) {
    return ApprovalRuleEventMetadata(
      approvalRuleContent: json['approvalRuleContent'] as String?,
      approvalRuleId: json['approvalRuleId'] as String?,
      approvalRuleName: json['approvalRuleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleContent = this.approvalRuleContent;
    final approvalRuleId = this.approvalRuleId;
    final approvalRuleName = this.approvalRuleName;
    return {
      if (approvalRuleContent != null)
        'approvalRuleContent': approvalRuleContent,
      if (approvalRuleId != null) 'approvalRuleId': approvalRuleId,
      if (approvalRuleName != null) 'approvalRuleName': approvalRuleName,
    };
  }
}

/// Returns information about an override event for approval rules for a pull
/// request.
class ApprovalRuleOverriddenEventMetadata {
  /// The status of the override event.
  final OverrideStatus? overrideStatus;

  /// The revision ID of the pull request when the override event occurred.
  final String? revisionId;

  ApprovalRuleOverriddenEventMetadata({
    this.overrideStatus,
    this.revisionId,
  });

  factory ApprovalRuleOverriddenEventMetadata.fromJson(
      Map<String, dynamic> json) {
    return ApprovalRuleOverriddenEventMetadata(
      overrideStatus: (json['overrideStatus'] as String?)?.toOverrideStatus(),
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final overrideStatus = this.overrideStatus;
    final revisionId = this.revisionId;
    return {
      if (overrideStatus != null) 'overrideStatus': overrideStatus.toValue(),
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

/// Returns information about an approval rule template.
class ApprovalRuleTemplate {
  /// The content of the approval rule template.
  final String? approvalRuleTemplateContent;

  /// The description of the approval rule template.
  final String? approvalRuleTemplateDescription;

  /// The system-generated ID of the approval rule template.
  final String? approvalRuleTemplateId;

  /// The name of the approval rule template.
  final String? approvalRuleTemplateName;

  /// The date the approval rule template was created, in timestamp format.
  final DateTime? creationDate;

  /// The date the approval rule template was most recently changed, in timestamp
  /// format.
  final DateTime? lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the user who made the most recent changes
  /// to the approval rule template.
  final String? lastModifiedUser;

  /// The SHA-256 hash signature for the content of the approval rule template.
  final String? ruleContentSha256;

  ApprovalRuleTemplate({
    this.approvalRuleTemplateContent,
    this.approvalRuleTemplateDescription,
    this.approvalRuleTemplateId,
    this.approvalRuleTemplateName,
    this.creationDate,
    this.lastModifiedDate,
    this.lastModifiedUser,
    this.ruleContentSha256,
  });

  factory ApprovalRuleTemplate.fromJson(Map<String, dynamic> json) {
    return ApprovalRuleTemplate(
      approvalRuleTemplateContent:
          json['approvalRuleTemplateContent'] as String?,
      approvalRuleTemplateDescription:
          json['approvalRuleTemplateDescription'] as String?,
      approvalRuleTemplateId: json['approvalRuleTemplateId'] as String?,
      approvalRuleTemplateName: json['approvalRuleTemplateName'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      lastModifiedUser: json['lastModifiedUser'] as String?,
      ruleContentSha256: json['ruleContentSha256'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleTemplateContent = this.approvalRuleTemplateContent;
    final approvalRuleTemplateDescription =
        this.approvalRuleTemplateDescription;
    final approvalRuleTemplateId = this.approvalRuleTemplateId;
    final approvalRuleTemplateName = this.approvalRuleTemplateName;
    final creationDate = this.creationDate;
    final lastModifiedDate = this.lastModifiedDate;
    final lastModifiedUser = this.lastModifiedUser;
    final ruleContentSha256 = this.ruleContentSha256;
    return {
      if (approvalRuleTemplateContent != null)
        'approvalRuleTemplateContent': approvalRuleTemplateContent,
      if (approvalRuleTemplateDescription != null)
        'approvalRuleTemplateDescription': approvalRuleTemplateDescription,
      if (approvalRuleTemplateId != null)
        'approvalRuleTemplateId': approvalRuleTemplateId,
      if (approvalRuleTemplateName != null)
        'approvalRuleTemplateName': approvalRuleTemplateName,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (lastModifiedDate != null)
        'lastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (lastModifiedUser != null) 'lastModifiedUser': lastModifiedUser,
      if (ruleContentSha256 != null) 'ruleContentSha256': ruleContentSha256,
    };
  }
}

enum ApprovalState {
  approve,
  revoke,
}

extension ApprovalStateValueExtension on ApprovalState {
  String toValue() {
    switch (this) {
      case ApprovalState.approve:
        return 'APPROVE';
      case ApprovalState.revoke:
        return 'REVOKE';
    }
  }
}

extension ApprovalStateFromString on String {
  ApprovalState toApprovalState() {
    switch (this) {
      case 'APPROVE':
        return ApprovalState.approve;
      case 'REVOKE':
        return ApprovalState.revoke;
    }
    throw Exception('$this is not known in enum ApprovalState');
  }
}

/// Returns information about a change in the approval state for a pull request.
class ApprovalStateChangedEventMetadata {
  /// The approval status for the pull request.
  final ApprovalState? approvalStatus;

  /// The revision ID of the pull request when the approval state changed.
  final String? revisionId;

  ApprovalStateChangedEventMetadata({
    this.approvalStatus,
    this.revisionId,
  });

  factory ApprovalStateChangedEventMetadata.fromJson(
      Map<String, dynamic> json) {
    return ApprovalStateChangedEventMetadata(
      approvalStatus: (json['approvalStatus'] as String?)?.toApprovalState(),
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalStatus = this.approvalStatus;
    final revisionId = this.revisionId;
    return {
      if (approvalStatus != null) 'approvalStatus': approvalStatus.toValue(),
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

/// Returns information about errors in a
/// BatchAssociateApprovalRuleTemplateWithRepositories operation.
class BatchAssociateApprovalRuleTemplateWithRepositoriesError {
  /// An error code that specifies whether the repository name was not valid or
  /// not found.
  final String? errorCode;

  /// An error message that provides details about why the repository name was not
  /// found or not valid.
  final String? errorMessage;

  /// The name of the repository where the association was not made.
  final String? repositoryName;

  BatchAssociateApprovalRuleTemplateWithRepositoriesError({
    this.errorCode,
    this.errorMessage,
    this.repositoryName,
  });

  factory BatchAssociateApprovalRuleTemplateWithRepositoriesError.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateApprovalRuleTemplateWithRepositoriesError(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final repositoryName = this.repositoryName;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

class BatchAssociateApprovalRuleTemplateWithRepositoriesOutput {
  /// A list of names of the repositories that have been associated with the
  /// template.
  final List<String> associatedRepositoryNames;

  /// A list of any errors that might have occurred while attempting to create the
  /// association between the template and the repositories.
  final List<BatchAssociateApprovalRuleTemplateWithRepositoriesError> errors;

  BatchAssociateApprovalRuleTemplateWithRepositoriesOutput({
    required this.associatedRepositoryNames,
    required this.errors,
  });

  factory BatchAssociateApprovalRuleTemplateWithRepositoriesOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateApprovalRuleTemplateWithRepositoriesOutput(
      associatedRepositoryNames: (json['associatedRepositoryNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) =>
              BatchAssociateApprovalRuleTemplateWithRepositoriesError.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final associatedRepositoryNames = this.associatedRepositoryNames;
    final errors = this.errors;
    return {
      'associatedRepositoryNames': associatedRepositoryNames,
      'errors': errors,
    };
  }
}

/// Returns information about errors in a BatchDescribeMergeConflicts operation.
class BatchDescribeMergeConflictsError {
  /// The name of the exception.
  final String exceptionName;

  /// The path to the file.
  final String filePath;

  /// The message provided by the exception.
  final String message;

  BatchDescribeMergeConflictsError({
    required this.exceptionName,
    required this.filePath,
    required this.message,
  });

  factory BatchDescribeMergeConflictsError.fromJson(Map<String, dynamic> json) {
    return BatchDescribeMergeConflictsError(
      exceptionName: json['exceptionName'] as String,
      filePath: json['filePath'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final exceptionName = this.exceptionName;
    final filePath = this.filePath;
    final message = this.message;
    return {
      'exceptionName': exceptionName,
      'filePath': filePath,
      'message': message,
    };
  }
}

class BatchDescribeMergeConflictsOutput {
  /// A list of conflicts for each file, including the conflict metadata and the
  /// hunks of the differences between the files.
  final List<Conflict> conflicts;

  /// The commit ID of the destination commit specifier that was used in the merge
  /// evaluation.
  final String destinationCommitId;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  final String sourceCommitId;

  /// The commit ID of the merge base.
  final String? baseCommitId;

  /// A list of any errors returned while describing the merge conflicts for each
  /// file.
  final List<BatchDescribeMergeConflictsError>? errors;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  final String? nextToken;

  BatchDescribeMergeConflictsOutput({
    required this.conflicts,
    required this.destinationCommitId,
    required this.sourceCommitId,
    this.baseCommitId,
    this.errors,
    this.nextToken,
  });

  factory BatchDescribeMergeConflictsOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchDescribeMergeConflictsOutput(
      conflicts: (json['conflicts'] as List)
          .whereNotNull()
          .map((e) => Conflict.fromJson(e as Map<String, dynamic>))
          .toList(),
      destinationCommitId: json['destinationCommitId'] as String,
      sourceCommitId: json['sourceCommitId'] as String,
      baseCommitId: json['baseCommitId'] as String?,
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchDescribeMergeConflictsError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conflicts = this.conflicts;
    final destinationCommitId = this.destinationCommitId;
    final sourceCommitId = this.sourceCommitId;
    final baseCommitId = this.baseCommitId;
    final errors = this.errors;
    final nextToken = this.nextToken;
    return {
      'conflicts': conflicts,
      'destinationCommitId': destinationCommitId,
      'sourceCommitId': sourceCommitId,
      if (baseCommitId != null) 'baseCommitId': baseCommitId,
      if (errors != null) 'errors': errors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Returns information about errors in a
/// BatchDisassociateApprovalRuleTemplateFromRepositories operation.
class BatchDisassociateApprovalRuleTemplateFromRepositoriesError {
  /// An error code that specifies whether the repository name was not valid or
  /// not found.
  final String? errorCode;

  /// An error message that provides details about why the repository name was
  /// either not found or not valid.
  final String? errorMessage;

  /// The name of the repository where the association with the template was not
  /// able to be removed.
  final String? repositoryName;

  BatchDisassociateApprovalRuleTemplateFromRepositoriesError({
    this.errorCode,
    this.errorMessage,
    this.repositoryName,
  });

  factory BatchDisassociateApprovalRuleTemplateFromRepositoriesError.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateApprovalRuleTemplateFromRepositoriesError(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final repositoryName = this.repositoryName;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

class BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput {
  /// A list of repository names that have had their association with the template
  /// removed.
  final List<String> disassociatedRepositoryNames;

  /// A list of any errors that might have occurred while attempting to remove the
  /// association between the template and the repositories.
  final List<BatchDisassociateApprovalRuleTemplateFromRepositoriesError> errors;

  BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput({
    required this.disassociatedRepositoryNames,
    required this.errors,
  });

  factory BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput(
      disassociatedRepositoryNames:
          (json['disassociatedRepositoryNames'] as List)
              .whereNotNull()
              .map((e) => e as String)
              .toList(),
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => BatchDisassociateApprovalRuleTemplateFromRepositoriesError
              .fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final disassociatedRepositoryNames = this.disassociatedRepositoryNames;
    final errors = this.errors;
    return {
      'disassociatedRepositoryNames': disassociatedRepositoryNames,
      'errors': errors,
    };
  }
}

/// Returns information about errors in a BatchGetCommits operation.
class BatchGetCommitsError {
  /// A commit ID that either could not be found or was not in a valid format.
  final String? commitId;

  /// An error code that specifies whether the commit ID was not valid or not
  /// found.
  final String? errorCode;

  /// An error message that provides detail about why the commit ID either was not
  /// found or was not valid.
  final String? errorMessage;

  BatchGetCommitsError({
    this.commitId,
    this.errorCode,
    this.errorMessage,
  });

  factory BatchGetCommitsError.fromJson(Map<String, dynamic> json) {
    return BatchGetCommitsError(
      commitId: json['commitId'] as String?,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitId = this.commitId;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (commitId != null) 'commitId': commitId,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

class BatchGetCommitsOutput {
  /// An array of commit data type objects, each of which contains information
  /// about a specified commit.
  final List<Commit>? commits;

  /// Returns any commit IDs for which information could not be found. For
  /// example, if one of the commit IDs was a shortened SHA ID or that commit was
  /// not found in the specified repository, the ID returns an error object with
  /// more information.
  final List<BatchGetCommitsError>? errors;

  BatchGetCommitsOutput({
    this.commits,
    this.errors,
  });

  factory BatchGetCommitsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetCommitsOutput(
      commits: (json['commits'] as List?)
          ?.whereNotNull()
          .map((e) => Commit.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchGetCommitsError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final commits = this.commits;
    final errors = this.errors;
    return {
      if (commits != null) 'commits': commits,
      if (errors != null) 'errors': errors,
    };
  }
}

/// Returns information about errors in a BatchGetRepositories operation.
class BatchGetRepositoriesError {
  /// An error code that specifies the type of failure.
  final BatchGetRepositoriesErrorCodeEnum? errorCode;

  /// An error message that provides detail about why the repository either was
  /// not found or was not in a valid state.
  final String? errorMessage;

  /// The ID of a repository that either could not be found or was not in a valid
  /// state.
  final String? repositoryId;

  /// The name of a repository that either could not be found or was not in a
  /// valid state.
  final String? repositoryName;

  BatchGetRepositoriesError({
    this.errorCode,
    this.errorMessage,
    this.repositoryId,
    this.repositoryName,
  });

  factory BatchGetRepositoriesError.fromJson(Map<String, dynamic> json) {
    return BatchGetRepositoriesError(
      errorCode:
          (json['errorCode'] as String?)?.toBatchGetRepositoriesErrorCodeEnum(),
      errorMessage: json['errorMessage'] as String?,
      repositoryId: json['repositoryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final repositoryId = this.repositoryId;
    final repositoryName = this.repositoryName;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (repositoryId != null) 'repositoryId': repositoryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

enum BatchGetRepositoriesErrorCodeEnum {
  encryptionIntegrityChecksFailedException,
  encryptionKeyAccessDeniedException,
  encryptionKeyDisabledException,
  encryptionKeyNotFoundException,
  encryptionKeyUnavailableException,
  repositoryDoesNotExistException,
}

extension BatchGetRepositoriesErrorCodeEnumValueExtension
    on BatchGetRepositoriesErrorCodeEnum {
  String toValue() {
    switch (this) {
      case BatchGetRepositoriesErrorCodeEnum
            .encryptionIntegrityChecksFailedException:
        return 'EncryptionIntegrityChecksFailedException';
      case BatchGetRepositoriesErrorCodeEnum.encryptionKeyAccessDeniedException:
        return 'EncryptionKeyAccessDeniedException';
      case BatchGetRepositoriesErrorCodeEnum.encryptionKeyDisabledException:
        return 'EncryptionKeyDisabledException';
      case BatchGetRepositoriesErrorCodeEnum.encryptionKeyNotFoundException:
        return 'EncryptionKeyNotFoundException';
      case BatchGetRepositoriesErrorCodeEnum.encryptionKeyUnavailableException:
        return 'EncryptionKeyUnavailableException';
      case BatchGetRepositoriesErrorCodeEnum.repositoryDoesNotExistException:
        return 'RepositoryDoesNotExistException';
    }
  }
}

extension BatchGetRepositoriesErrorCodeEnumFromString on String {
  BatchGetRepositoriesErrorCodeEnum toBatchGetRepositoriesErrorCodeEnum() {
    switch (this) {
      case 'EncryptionIntegrityChecksFailedException':
        return BatchGetRepositoriesErrorCodeEnum
            .encryptionIntegrityChecksFailedException;
      case 'EncryptionKeyAccessDeniedException':
        return BatchGetRepositoriesErrorCodeEnum
            .encryptionKeyAccessDeniedException;
      case 'EncryptionKeyDisabledException':
        return BatchGetRepositoriesErrorCodeEnum.encryptionKeyDisabledException;
      case 'EncryptionKeyNotFoundException':
        return BatchGetRepositoriesErrorCodeEnum.encryptionKeyNotFoundException;
      case 'EncryptionKeyUnavailableException':
        return BatchGetRepositoriesErrorCodeEnum
            .encryptionKeyUnavailableException;
      case 'RepositoryDoesNotExistException':
        return BatchGetRepositoriesErrorCodeEnum
            .repositoryDoesNotExistException;
    }
    throw Exception(
        '$this is not known in enum BatchGetRepositoriesErrorCodeEnum');
  }
}

/// Represents the output of a batch get repositories operation.
class BatchGetRepositoriesOutput {
  /// Returns information about any errors returned when attempting to retrieve
  /// information about the repositories.
  final List<BatchGetRepositoriesError>? errors;

  /// A list of repositories returned by the batch get repositories operation.
  final List<RepositoryMetadata>? repositories;

  /// Returns a list of repository names for which information could not be found.
  final List<String>? repositoriesNotFound;

  BatchGetRepositoriesOutput({
    this.errors,
    this.repositories,
    this.repositoriesNotFound,
  });

  factory BatchGetRepositoriesOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetRepositoriesOutput(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchGetRepositoriesError.fromJson(e as Map<String, dynamic>))
          .toList(),
      repositories: (json['repositories'] as List?)
          ?.whereNotNull()
          .map((e) => RepositoryMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      repositoriesNotFound: (json['repositoriesNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final repositories = this.repositories;
    final repositoriesNotFound = this.repositoriesNotFound;
    return {
      if (errors != null) 'errors': errors,
      if (repositories != null) 'repositories': repositories,
      if (repositoriesNotFound != null)
        'repositoriesNotFound': repositoriesNotFound,
    };
  }
}

/// Returns information about a specific Git blob object.
class BlobMetadata {
  /// The full ID of the blob.
  final String? blobId;

  /// The file mode permissions of the blob. File mode permission codes include:
  ///
  /// <ul>
  /// <li>
  /// <code>100644</code> indicates read/write
  /// </li>
  /// <li>
  /// <code>100755</code> indicates read/write/execute
  /// </li>
  /// <li>
  /// <code>160000</code> indicates a submodule
  /// </li>
  /// <li>
  /// <code>120000</code> indicates a symlink
  /// </li>
  /// </ul>
  final String? mode;

  /// The path to the blob and associated file name, if any.
  final String? path;

  BlobMetadata({
    this.blobId,
    this.mode,
    this.path,
  });

  factory BlobMetadata.fromJson(Map<String, dynamic> json) {
    return BlobMetadata(
      blobId: json['blobId'] as String?,
      mode: json['mode'] as String?,
      path: json['path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blobId = this.blobId;
    final mode = this.mode;
    final path = this.path;
    return {
      if (blobId != null) 'blobId': blobId,
      if (mode != null) 'mode': mode,
      if (path != null) 'path': path,
    };
  }
}

/// Returns information about a branch.
class BranchInfo {
  /// The name of the branch.
  final String? branchName;

  /// The ID of the last commit made to the branch.
  final String? commitId;

  BranchInfo({
    this.branchName,
    this.commitId,
  });

  factory BranchInfo.fromJson(Map<String, dynamic> json) {
    return BranchInfo(
      branchName: json['branchName'] as String?,
      commitId: json['commitId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final branchName = this.branchName;
    final commitId = this.commitId;
    return {
      if (branchName != null) 'branchName': branchName,
      if (commitId != null) 'commitId': commitId,
    };
  }
}

enum ChangeTypeEnum {
  a,
  m,
  d,
}

extension ChangeTypeEnumValueExtension on ChangeTypeEnum {
  String toValue() {
    switch (this) {
      case ChangeTypeEnum.a:
        return 'A';
      case ChangeTypeEnum.m:
        return 'M';
      case ChangeTypeEnum.d:
        return 'D';
    }
  }
}

extension ChangeTypeEnumFromString on String {
  ChangeTypeEnum toChangeTypeEnum() {
    switch (this) {
      case 'A':
        return ChangeTypeEnum.a;
      case 'M':
        return ChangeTypeEnum.m;
      case 'D':
        return ChangeTypeEnum.d;
    }
    throw Exception('$this is not known in enum ChangeTypeEnum');
  }
}

/// Returns information about a specific comment.
class Comment {
  /// The Amazon Resource Name (ARN) of the person who posted the comment.
  final String? authorArn;

  /// The emoji reactions to a comment, if any, submitted by the user whose
  /// credentials are associated with the call to the API.
  final List<String>? callerReactions;

  /// A unique, client-generated idempotency token that, when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter. If
  /// a request is received with the same parameters and a token is included, the
  /// request returns information about the initial request that used that token.
  final String? clientRequestToken;

  /// The system-generated comment ID.
  final String? commentId;

  /// The content of the comment.
  final String? content;

  /// The date and time the comment was created, in timestamp format.
  final DateTime? creationDate;

  /// A Boolean value indicating whether the comment has been deleted.
  final bool? deleted;

  /// The ID of the comment for which this comment is a reply, if any.
  final String? inReplyTo;

  /// The date and time the comment was most recently modified, in timestamp
  /// format.
  final DateTime? lastModifiedDate;

  /// A string to integer map that represents the number of individual users who
  /// have responded to a comment with the specified reactions.
  final Map<String, int>? reactionCounts;

  Comment({
    this.authorArn,
    this.callerReactions,
    this.clientRequestToken,
    this.commentId,
    this.content,
    this.creationDate,
    this.deleted,
    this.inReplyTo,
    this.lastModifiedDate,
    this.reactionCounts,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      authorArn: json['authorArn'] as String?,
      callerReactions: (json['callerReactions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      clientRequestToken: json['clientRequestToken'] as String?,
      commentId: json['commentId'] as String?,
      content: json['content'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      deleted: json['deleted'] as bool?,
      inReplyTo: json['inReplyTo'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      reactionCounts: (json['reactionCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final authorArn = this.authorArn;
    final callerReactions = this.callerReactions;
    final clientRequestToken = this.clientRequestToken;
    final commentId = this.commentId;
    final content = this.content;
    final creationDate = this.creationDate;
    final deleted = this.deleted;
    final inReplyTo = this.inReplyTo;
    final lastModifiedDate = this.lastModifiedDate;
    final reactionCounts = this.reactionCounts;
    return {
      if (authorArn != null) 'authorArn': authorArn,
      if (callerReactions != null) 'callerReactions': callerReactions,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (commentId != null) 'commentId': commentId,
      if (content != null) 'content': content,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (deleted != null) 'deleted': deleted,
      if (inReplyTo != null) 'inReplyTo': inReplyTo,
      if (lastModifiedDate != null)
        'lastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (reactionCounts != null) 'reactionCounts': reactionCounts,
    };
  }
}

/// Returns information about comments on the comparison between two commits.
class CommentsForComparedCommit {
  /// The full blob ID of the commit used to establish the after of the
  /// comparison.
  final String? afterBlobId;

  /// The full commit ID of the commit used to establish the after of the
  /// comparison.
  final String? afterCommitId;

  /// The full blob ID of the commit used to establish the before of the
  /// comparison.
  final String? beforeBlobId;

  /// The full commit ID of the commit used to establish the before of the
  /// comparison.
  final String? beforeCommitId;

  /// An array of comment objects. Each comment object contains information about
  /// a comment on the comparison between commits.
  final List<Comment>? comments;

  /// Location information about the comment on the comparison, including the file
  /// name, line number, and whether the version of the file where the comment was
  /// made is BEFORE or AFTER.
  final Location? location;

  /// The name of the repository that contains the compared commits.
  final String? repositoryName;

  CommentsForComparedCommit({
    this.afterBlobId,
    this.afterCommitId,
    this.beforeBlobId,
    this.beforeCommitId,
    this.comments,
    this.location,
    this.repositoryName,
  });

  factory CommentsForComparedCommit.fromJson(Map<String, dynamic> json) {
    return CommentsForComparedCommit(
      afterBlobId: json['afterBlobId'] as String?,
      afterCommitId: json['afterCommitId'] as String?,
      beforeBlobId: json['beforeBlobId'] as String?,
      beforeCommitId: json['beforeCommitId'] as String?,
      comments: (json['comments'] as List?)
          ?.whereNotNull()
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] != null
          ? Location.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final afterBlobId = this.afterBlobId;
    final afterCommitId = this.afterCommitId;
    final beforeBlobId = this.beforeBlobId;
    final beforeCommitId = this.beforeCommitId;
    final comments = this.comments;
    final location = this.location;
    final repositoryName = this.repositoryName;
    return {
      if (afterBlobId != null) 'afterBlobId': afterBlobId,
      if (afterCommitId != null) 'afterCommitId': afterCommitId,
      if (beforeBlobId != null) 'beforeBlobId': beforeBlobId,
      if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
      if (comments != null) 'comments': comments,
      if (location != null) 'location': location,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// Returns information about comments on a pull request.
class CommentsForPullRequest {
  /// The full blob ID of the file on which you want to comment on the source
  /// commit.
  final String? afterBlobId;

  /// The full commit ID of the commit that was the tip of the source branch at
  /// the time the comment was made.
  final String? afterCommitId;

  /// The full blob ID of the file on which you want to comment on the destination
  /// commit.
  final String? beforeBlobId;

  /// The full commit ID of the commit that was the tip of the destination branch
  /// when the pull request was created. This commit is superceded by the after
  /// commit in the source branch when and if you merge the source branch into the
  /// destination branch.
  final String? beforeCommitId;

  /// An array of comment objects. Each comment object contains information about
  /// a comment on the pull request.
  final List<Comment>? comments;

  /// Location information about the comment on the pull request, including the
  /// file name, line number, and whether the version of the file where the
  /// comment was made is BEFORE (destination branch) or AFTER (source branch).
  final Location? location;

  /// The system-generated ID of the pull request.
  final String? pullRequestId;

  /// The name of the repository that contains the pull request.
  final String? repositoryName;

  CommentsForPullRequest({
    this.afterBlobId,
    this.afterCommitId,
    this.beforeBlobId,
    this.beforeCommitId,
    this.comments,
    this.location,
    this.pullRequestId,
    this.repositoryName,
  });

  factory CommentsForPullRequest.fromJson(Map<String, dynamic> json) {
    return CommentsForPullRequest(
      afterBlobId: json['afterBlobId'] as String?,
      afterCommitId: json['afterCommitId'] as String?,
      beforeBlobId: json['beforeBlobId'] as String?,
      beforeCommitId: json['beforeCommitId'] as String?,
      comments: (json['comments'] as List?)
          ?.whereNotNull()
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] != null
          ? Location.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      pullRequestId: json['pullRequestId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final afterBlobId = this.afterBlobId;
    final afterCommitId = this.afterCommitId;
    final beforeBlobId = this.beforeBlobId;
    final beforeCommitId = this.beforeCommitId;
    final comments = this.comments;
    final location = this.location;
    final pullRequestId = this.pullRequestId;
    final repositoryName = this.repositoryName;
    return {
      if (afterBlobId != null) 'afterBlobId': afterBlobId,
      if (afterCommitId != null) 'afterCommitId': afterCommitId,
      if (beforeBlobId != null) 'beforeBlobId': beforeBlobId,
      if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
      if (comments != null) 'comments': comments,
      if (location != null) 'location': location,
      if (pullRequestId != null) 'pullRequestId': pullRequestId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// Returns information about a specific commit.
class Commit {
  /// Any other data associated with the specified commit.
  final String? additionalData;

  /// Information about the author of the specified commit. Information includes
  /// the date in timestamp format with GMT offset, the name of the author, and
  /// the email address for the author, as configured in Git.
  final UserInfo? author;

  /// The full SHA ID of the specified commit.
  final String? commitId;

  /// Information about the person who committed the specified commit, also known
  /// as the committer. Information includes the date in timestamp format with GMT
  /// offset, the name of the committer, and the email address for the committer,
  /// as configured in Git.
  ///
  /// For more information about the difference between an author and a committer
  /// in Git, see <a href="http://git-scm.com/book/ch2-3.html">Viewing the Commit
  /// History</a> in Pro Git by Scott Chacon and Ben Straub.
  final UserInfo? committer;

  /// The commit message associated with the specified commit.
  final String? message;

  /// A list of parent commits for the specified commit. Each parent commit ID is
  /// the full commit ID.
  final List<String>? parents;

  /// Tree information for the specified commit.
  final String? treeId;

  Commit({
    this.additionalData,
    this.author,
    this.commitId,
    this.committer,
    this.message,
    this.parents,
    this.treeId,
  });

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      additionalData: json['additionalData'] as String?,
      author: json['author'] != null
          ? UserInfo.fromJson(json['author'] as Map<String, dynamic>)
          : null,
      commitId: json['commitId'] as String?,
      committer: json['committer'] != null
          ? UserInfo.fromJson(json['committer'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
      parents: (json['parents'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      treeId: json['treeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalData = this.additionalData;
    final author = this.author;
    final commitId = this.commitId;
    final committer = this.committer;
    final message = this.message;
    final parents = this.parents;
    final treeId = this.treeId;
    return {
      if (additionalData != null) 'additionalData': additionalData,
      if (author != null) 'author': author,
      if (commitId != null) 'commitId': commitId,
      if (committer != null) 'committer': committer,
      if (message != null) 'message': message,
      if (parents != null) 'parents': parents,
      if (treeId != null) 'treeId': treeId,
    };
  }
}

/// Information about conflicts in a merge operation.
class Conflict {
  /// Metadata about a conflict in a merge operation.
  final ConflictMetadata? conflictMetadata;

  /// A list of hunks that contain the differences between files or lines causing
  /// the conflict.
  final List<MergeHunk>? mergeHunks;

  Conflict({
    this.conflictMetadata,
    this.mergeHunks,
  });

  factory Conflict.fromJson(Map<String, dynamic> json) {
    return Conflict(
      conflictMetadata: json['conflictMetadata'] != null
          ? ConflictMetadata.fromJson(
              json['conflictMetadata'] as Map<String, dynamic>)
          : null,
      mergeHunks: (json['mergeHunks'] as List?)
          ?.whereNotNull()
          .map((e) => MergeHunk.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final conflictMetadata = this.conflictMetadata;
    final mergeHunks = this.mergeHunks;
    return {
      if (conflictMetadata != null) 'conflictMetadata': conflictMetadata,
      if (mergeHunks != null) 'mergeHunks': mergeHunks,
    };
  }
}

enum ConflictDetailLevelTypeEnum {
  fileLevel,
  lineLevel,
}

extension ConflictDetailLevelTypeEnumValueExtension
    on ConflictDetailLevelTypeEnum {
  String toValue() {
    switch (this) {
      case ConflictDetailLevelTypeEnum.fileLevel:
        return 'FILE_LEVEL';
      case ConflictDetailLevelTypeEnum.lineLevel:
        return 'LINE_LEVEL';
    }
  }
}

extension ConflictDetailLevelTypeEnumFromString on String {
  ConflictDetailLevelTypeEnum toConflictDetailLevelTypeEnum() {
    switch (this) {
      case 'FILE_LEVEL':
        return ConflictDetailLevelTypeEnum.fileLevel;
      case 'LINE_LEVEL':
        return ConflictDetailLevelTypeEnum.lineLevel;
    }
    throw Exception('$this is not known in enum ConflictDetailLevelTypeEnum');
  }
}

/// Information about the metadata for a conflict in a merge operation.
class ConflictMetadata {
  /// A boolean value indicating whether there are conflicts in the content of a
  /// file.
  final bool? contentConflict;

  /// A boolean value indicating whether there are conflicts in the file mode of a
  /// file.
  final bool? fileModeConflict;

  /// The file modes of the file in the source, destination, and base of the
  /// merge.
  final FileModes? fileModes;

  /// The path of the file that contains conflicts.
  final String? filePath;

  /// The file sizes of the file in the source, destination, and base of the
  /// merge.
  final FileSizes? fileSizes;

  /// A boolean value (true or false) indicating whether the file is binary or
  /// textual in the source, destination, and base of the merge.
  final IsBinaryFile? isBinaryFile;

  /// Whether an add, modify, or delete operation caused the conflict between the
  /// source and destination of the merge.
  final MergeOperations? mergeOperations;

  /// The number of conflicts, including both hunk conflicts and metadata
  /// conflicts.
  final int? numberOfConflicts;

  /// A boolean value (true or false) indicating whether there are conflicts
  /// between the branches in the object type of a file, folder, or submodule.
  final bool? objectTypeConflict;

  /// Information about any object type conflicts in a merge operation.
  final ObjectTypes? objectTypes;

  ConflictMetadata({
    this.contentConflict,
    this.fileModeConflict,
    this.fileModes,
    this.filePath,
    this.fileSizes,
    this.isBinaryFile,
    this.mergeOperations,
    this.numberOfConflicts,
    this.objectTypeConflict,
    this.objectTypes,
  });

  factory ConflictMetadata.fromJson(Map<String, dynamic> json) {
    return ConflictMetadata(
      contentConflict: json['contentConflict'] as bool?,
      fileModeConflict: json['fileModeConflict'] as bool?,
      fileModes: json['fileModes'] != null
          ? FileModes.fromJson(json['fileModes'] as Map<String, dynamic>)
          : null,
      filePath: json['filePath'] as String?,
      fileSizes: json['fileSizes'] != null
          ? FileSizes.fromJson(json['fileSizes'] as Map<String, dynamic>)
          : null,
      isBinaryFile: json['isBinaryFile'] != null
          ? IsBinaryFile.fromJson(json['isBinaryFile'] as Map<String, dynamic>)
          : null,
      mergeOperations: json['mergeOperations'] != null
          ? MergeOperations.fromJson(
              json['mergeOperations'] as Map<String, dynamic>)
          : null,
      numberOfConflicts: json['numberOfConflicts'] as int?,
      objectTypeConflict: json['objectTypeConflict'] as bool?,
      objectTypes: json['objectTypes'] != null
          ? ObjectTypes.fromJson(json['objectTypes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentConflict = this.contentConflict;
    final fileModeConflict = this.fileModeConflict;
    final fileModes = this.fileModes;
    final filePath = this.filePath;
    final fileSizes = this.fileSizes;
    final isBinaryFile = this.isBinaryFile;
    final mergeOperations = this.mergeOperations;
    final numberOfConflicts = this.numberOfConflicts;
    final objectTypeConflict = this.objectTypeConflict;
    final objectTypes = this.objectTypes;
    return {
      if (contentConflict != null) 'contentConflict': contentConflict,
      if (fileModeConflict != null) 'fileModeConflict': fileModeConflict,
      if (fileModes != null) 'fileModes': fileModes,
      if (filePath != null) 'filePath': filePath,
      if (fileSizes != null) 'fileSizes': fileSizes,
      if (isBinaryFile != null) 'isBinaryFile': isBinaryFile,
      if (mergeOperations != null) 'mergeOperations': mergeOperations,
      if (numberOfConflicts != null) 'numberOfConflicts': numberOfConflicts,
      if (objectTypeConflict != null) 'objectTypeConflict': objectTypeConflict,
      if (objectTypes != null) 'objectTypes': objectTypes,
    };
  }
}

/// If AUTOMERGE is the conflict resolution strategy, a list of inputs to use
/// when resolving conflicts during a merge.
class ConflictResolution {
  /// Files to be deleted as part of the merge conflict resolution.
  final List<DeleteFileEntry>? deleteFiles;

  /// Files to have content replaced as part of the merge conflict resolution.
  final List<ReplaceContentEntry>? replaceContents;

  /// File modes that are set as part of the merge conflict resolution.
  final List<SetFileModeEntry>? setFileModes;

  ConflictResolution({
    this.deleteFiles,
    this.replaceContents,
    this.setFileModes,
  });

  Map<String, dynamic> toJson() {
    final deleteFiles = this.deleteFiles;
    final replaceContents = this.replaceContents;
    final setFileModes = this.setFileModes;
    return {
      if (deleteFiles != null) 'deleteFiles': deleteFiles,
      if (replaceContents != null) 'replaceContents': replaceContents,
      if (setFileModes != null) 'setFileModes': setFileModes,
    };
  }
}

enum ConflictResolutionStrategyTypeEnum {
  none,
  acceptSource,
  acceptDestination,
  automerge,
}

extension ConflictResolutionStrategyTypeEnumValueExtension
    on ConflictResolutionStrategyTypeEnum {
  String toValue() {
    switch (this) {
      case ConflictResolutionStrategyTypeEnum.none:
        return 'NONE';
      case ConflictResolutionStrategyTypeEnum.acceptSource:
        return 'ACCEPT_SOURCE';
      case ConflictResolutionStrategyTypeEnum.acceptDestination:
        return 'ACCEPT_DESTINATION';
      case ConflictResolutionStrategyTypeEnum.automerge:
        return 'AUTOMERGE';
    }
  }
}

extension ConflictResolutionStrategyTypeEnumFromString on String {
  ConflictResolutionStrategyTypeEnum toConflictResolutionStrategyTypeEnum() {
    switch (this) {
      case 'NONE':
        return ConflictResolutionStrategyTypeEnum.none;
      case 'ACCEPT_SOURCE':
        return ConflictResolutionStrategyTypeEnum.acceptSource;
      case 'ACCEPT_DESTINATION':
        return ConflictResolutionStrategyTypeEnum.acceptDestination;
      case 'AUTOMERGE':
        return ConflictResolutionStrategyTypeEnum.automerge;
    }
    throw Exception(
        '$this is not known in enum ConflictResolutionStrategyTypeEnum');
  }
}

class CreateApprovalRuleTemplateOutput {
  /// The content and structure of the created approval rule template.
  final ApprovalRuleTemplate approvalRuleTemplate;

  CreateApprovalRuleTemplateOutput({
    required this.approvalRuleTemplate,
  });

  factory CreateApprovalRuleTemplateOutput.fromJson(Map<String, dynamic> json) {
    return CreateApprovalRuleTemplateOutput(
      approvalRuleTemplate: ApprovalRuleTemplate.fromJson(
          json['approvalRuleTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleTemplate = this.approvalRuleTemplate;
    return {
      'approvalRuleTemplate': approvalRuleTemplate,
    };
  }
}

class CreateCommitOutput {
  /// The full commit ID of the commit that contains your committed file changes.
  final String? commitId;

  /// The files added as part of the committed file changes.
  final List<FileMetadata>? filesAdded;

  /// The files deleted as part of the committed file changes.
  final List<FileMetadata>? filesDeleted;

  /// The files updated as part of the commited file changes.
  final List<FileMetadata>? filesUpdated;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// the commited file changes.
  final String? treeId;

  CreateCommitOutput({
    this.commitId,
    this.filesAdded,
    this.filesDeleted,
    this.filesUpdated,
    this.treeId,
  });

  factory CreateCommitOutput.fromJson(Map<String, dynamic> json) {
    return CreateCommitOutput(
      commitId: json['commitId'] as String?,
      filesAdded: (json['filesAdded'] as List?)
          ?.whereNotNull()
          .map((e) => FileMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      filesDeleted: (json['filesDeleted'] as List?)
          ?.whereNotNull()
          .map((e) => FileMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      filesUpdated: (json['filesUpdated'] as List?)
          ?.whereNotNull()
          .map((e) => FileMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      treeId: json['treeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitId = this.commitId;
    final filesAdded = this.filesAdded;
    final filesDeleted = this.filesDeleted;
    final filesUpdated = this.filesUpdated;
    final treeId = this.treeId;
    return {
      if (commitId != null) 'commitId': commitId,
      if (filesAdded != null) 'filesAdded': filesAdded,
      if (filesDeleted != null) 'filesDeleted': filesDeleted,
      if (filesUpdated != null) 'filesUpdated': filesUpdated,
      if (treeId != null) 'treeId': treeId,
    };
  }
}

class CreatePullRequestApprovalRuleOutput {
  /// Information about the created approval rule.
  final ApprovalRule approvalRule;

  CreatePullRequestApprovalRuleOutput({
    required this.approvalRule,
  });

  factory CreatePullRequestApprovalRuleOutput.fromJson(
      Map<String, dynamic> json) {
    return CreatePullRequestApprovalRuleOutput(
      approvalRule:
          ApprovalRule.fromJson(json['approvalRule'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRule = this.approvalRule;
    return {
      'approvalRule': approvalRule,
    };
  }
}

class CreatePullRequestOutput {
  /// Information about the newly created pull request.
  final PullRequest pullRequest;

  CreatePullRequestOutput({
    required this.pullRequest,
  });

  factory CreatePullRequestOutput.fromJson(Map<String, dynamic> json) {
    return CreatePullRequestOutput(
      pullRequest:
          PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequest = this.pullRequest;
    return {
      'pullRequest': pullRequest,
    };
  }
}

/// Represents the output of a create repository operation.
class CreateRepositoryOutput {
  /// Information about the newly created repository.
  final RepositoryMetadata? repositoryMetadata;

  CreateRepositoryOutput({
    this.repositoryMetadata,
  });

  factory CreateRepositoryOutput.fromJson(Map<String, dynamic> json) {
    return CreateRepositoryOutput(
      repositoryMetadata: json['repositoryMetadata'] != null
          ? RepositoryMetadata.fromJson(
              json['repositoryMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryMetadata = this.repositoryMetadata;
    return {
      if (repositoryMetadata != null) 'repositoryMetadata': repositoryMetadata,
    };
  }
}

class CreateUnreferencedMergeCommitOutput {
  /// The full commit ID of the commit that contains your merge results.
  final String? commitId;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// the merge results.
  final String? treeId;

  CreateUnreferencedMergeCommitOutput({
    this.commitId,
    this.treeId,
  });

  factory CreateUnreferencedMergeCommitOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateUnreferencedMergeCommitOutput(
      commitId: json['commitId'] as String?,
      treeId: json['treeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitId = this.commitId;
    final treeId = this.treeId;
    return {
      if (commitId != null) 'commitId': commitId,
      if (treeId != null) 'treeId': treeId,
    };
  }
}

class DeleteApprovalRuleTemplateOutput {
  /// The system-generated ID of the deleted approval rule template. If the
  /// template has been previously deleted, the only response is a 200 OK.
  final String approvalRuleTemplateId;

  DeleteApprovalRuleTemplateOutput({
    required this.approvalRuleTemplateId,
  });

  factory DeleteApprovalRuleTemplateOutput.fromJson(Map<String, dynamic> json) {
    return DeleteApprovalRuleTemplateOutput(
      approvalRuleTemplateId: json['approvalRuleTemplateId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleTemplateId = this.approvalRuleTemplateId;
    return {
      'approvalRuleTemplateId': approvalRuleTemplateId,
    };
  }
}

/// Represents the output of a delete branch operation.
class DeleteBranchOutput {
  /// Information about the branch deleted by the operation, including the branch
  /// name and the commit ID that was the tip of the branch.
  final BranchInfo? deletedBranch;

  DeleteBranchOutput({
    this.deletedBranch,
  });

  factory DeleteBranchOutput.fromJson(Map<String, dynamic> json) {
    return DeleteBranchOutput(
      deletedBranch: json['deletedBranch'] != null
          ? BranchInfo.fromJson(json['deletedBranch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deletedBranch = this.deletedBranch;
    return {
      if (deletedBranch != null) 'deletedBranch': deletedBranch,
    };
  }
}

class DeleteCommentContentOutput {
  /// Information about the comment you just deleted.
  final Comment? comment;

  DeleteCommentContentOutput({
    this.comment,
  });

  factory DeleteCommentContentOutput.fromJson(Map<String, dynamic> json) {
    return DeleteCommentContentOutput(
      comment: json['comment'] != null
          ? Comment.fromJson(json['comment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    return {
      if (comment != null) 'comment': comment,
    };
  }
}

/// A file that is deleted as part of a commit.
class DeleteFileEntry {
  /// The full path of the file to be deleted, including the name of the file.
  final String filePath;

  DeleteFileEntry({
    required this.filePath,
  });

  Map<String, dynamic> toJson() {
    final filePath = this.filePath;
    return {
      'filePath': filePath,
    };
  }
}

class DeleteFileOutput {
  /// The blob ID removed from the tree as part of deleting the file.
  final String blobId;

  /// The full commit ID of the commit that contains the change that deletes the
  /// file.
  final String commitId;

  /// The fully qualified path to the file to be deleted, including the full name
  /// and extension of that file.
  final String filePath;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// the delete file change.
  final String treeId;

  DeleteFileOutput({
    required this.blobId,
    required this.commitId,
    required this.filePath,
    required this.treeId,
  });

  factory DeleteFileOutput.fromJson(Map<String, dynamic> json) {
    return DeleteFileOutput(
      blobId: json['blobId'] as String,
      commitId: json['commitId'] as String,
      filePath: json['filePath'] as String,
      treeId: json['treeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final blobId = this.blobId;
    final commitId = this.commitId;
    final filePath = this.filePath;
    final treeId = this.treeId;
    return {
      'blobId': blobId,
      'commitId': commitId,
      'filePath': filePath,
      'treeId': treeId,
    };
  }
}

class DeletePullRequestApprovalRuleOutput {
  /// The ID of the deleted approval rule.
  /// <note>
  /// If the approval rule was deleted in an earlier API call, the response is 200
  /// OK without content.
  /// </note>
  final String approvalRuleId;

  DeletePullRequestApprovalRuleOutput({
    required this.approvalRuleId,
  });

  factory DeletePullRequestApprovalRuleOutput.fromJson(
      Map<String, dynamic> json) {
    return DeletePullRequestApprovalRuleOutput(
      approvalRuleId: json['approvalRuleId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleId = this.approvalRuleId;
    return {
      'approvalRuleId': approvalRuleId,
    };
  }
}

/// Represents the output of a delete repository operation.
class DeleteRepositoryOutput {
  /// The ID of the repository that was deleted.
  final String? repositoryId;

  DeleteRepositoryOutput({
    this.repositoryId,
  });

  factory DeleteRepositoryOutput.fromJson(Map<String, dynamic> json) {
    return DeleteRepositoryOutput(
      repositoryId: json['repositoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryId = this.repositoryId;
    return {
      if (repositoryId != null) 'repositoryId': repositoryId,
    };
  }
}

class DescribeMergeConflictsOutput {
  /// Contains metadata about the conflicts found in the merge.
  final ConflictMetadata conflictMetadata;

  /// The commit ID of the destination commit specifier that was used in the merge
  /// evaluation.
  final String destinationCommitId;

  /// A list of merge hunks of the differences between the files or lines.
  final List<MergeHunk> mergeHunks;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  final String sourceCommitId;

  /// The commit ID of the merge base.
  final String? baseCommitId;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  final String? nextToken;

  DescribeMergeConflictsOutput({
    required this.conflictMetadata,
    required this.destinationCommitId,
    required this.mergeHunks,
    required this.sourceCommitId,
    this.baseCommitId,
    this.nextToken,
  });

  factory DescribeMergeConflictsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeMergeConflictsOutput(
      conflictMetadata: ConflictMetadata.fromJson(
          json['conflictMetadata'] as Map<String, dynamic>),
      destinationCommitId: json['destinationCommitId'] as String,
      mergeHunks: (json['mergeHunks'] as List)
          .whereNotNull()
          .map((e) => MergeHunk.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceCommitId: json['sourceCommitId'] as String,
      baseCommitId: json['baseCommitId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conflictMetadata = this.conflictMetadata;
    final destinationCommitId = this.destinationCommitId;
    final mergeHunks = this.mergeHunks;
    final sourceCommitId = this.sourceCommitId;
    final baseCommitId = this.baseCommitId;
    final nextToken = this.nextToken;
    return {
      'conflictMetadata': conflictMetadata,
      'destinationCommitId': destinationCommitId,
      'mergeHunks': mergeHunks,
      'sourceCommitId': sourceCommitId,
      if (baseCommitId != null) 'baseCommitId': baseCommitId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribePullRequestEventsOutput {
  /// Information about the pull request events.
  final List<PullRequestEvent> pullRequestEvents;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  final String? nextToken;

  DescribePullRequestEventsOutput({
    required this.pullRequestEvents,
    this.nextToken,
  });

  factory DescribePullRequestEventsOutput.fromJson(Map<String, dynamic> json) {
    return DescribePullRequestEventsOutput(
      pullRequestEvents: (json['pullRequestEvents'] as List)
          .whereNotNull()
          .map((e) => PullRequestEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequestEvents = this.pullRequestEvents;
    final nextToken = this.nextToken;
    return {
      'pullRequestEvents': pullRequestEvents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Returns information about a set of differences for a commit specifier.
class Difference {
  /// Information about an <code>afterBlob</code> data type object, including the
  /// ID, the file mode permission code, and the path.
  final BlobMetadata? afterBlob;

  /// Information about a <code>beforeBlob</code> data type object, including the
  /// ID, the file mode permission code, and the path.
  final BlobMetadata? beforeBlob;

  /// Whether the change type of the difference is an addition (A), deletion (D),
  /// or modification (M).
  final ChangeTypeEnum? changeType;

  Difference({
    this.afterBlob,
    this.beforeBlob,
    this.changeType,
  });

  factory Difference.fromJson(Map<String, dynamic> json) {
    return Difference(
      afterBlob: json['afterBlob'] != null
          ? BlobMetadata.fromJson(json['afterBlob'] as Map<String, dynamic>)
          : null,
      beforeBlob: json['beforeBlob'] != null
          ? BlobMetadata.fromJson(json['beforeBlob'] as Map<String, dynamic>)
          : null,
      changeType: (json['changeType'] as String?)?.toChangeTypeEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final afterBlob = this.afterBlob;
    final beforeBlob = this.beforeBlob;
    final changeType = this.changeType;
    return {
      if (afterBlob != null) 'afterBlob': afterBlob,
      if (beforeBlob != null) 'beforeBlob': beforeBlob,
      if (changeType != null) 'changeType': changeType.toValue(),
    };
  }
}

class EvaluatePullRequestApprovalRulesOutput {
  /// The result of the evaluation, including the names of the rules whose
  /// conditions have been met (if any), the names of the rules whose conditions
  /// have not been met (if any), whether the pull request is in the approved
  /// state, and whether the pull request approval rule has been set aside by an
  /// override.
  final Evaluation evaluation;

  EvaluatePullRequestApprovalRulesOutput({
    required this.evaluation,
  });

  factory EvaluatePullRequestApprovalRulesOutput.fromJson(
      Map<String, dynamic> json) {
    return EvaluatePullRequestApprovalRulesOutput(
      evaluation:
          Evaluation.fromJson(json['evaluation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluation = this.evaluation;
    return {
      'evaluation': evaluation,
    };
  }
}

/// Returns information about the approval rules applied to a pull request and
/// whether conditions have been met.
class Evaluation {
  /// The names of the approval rules that have not had their conditions met.
  final List<String>? approvalRulesNotSatisfied;

  /// The names of the approval rules that have had their conditions met.
  final List<String>? approvalRulesSatisfied;

  /// Whether the state of the pull request is approved.
  final bool? approved;

  /// Whether the approval rule requirements for the pull request have been
  /// overridden and no longer need to be met.
  final bool? overridden;

  Evaluation({
    this.approvalRulesNotSatisfied,
    this.approvalRulesSatisfied,
    this.approved,
    this.overridden,
  });

  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
      approvalRulesNotSatisfied: (json['approvalRulesNotSatisfied'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      approvalRulesSatisfied: (json['approvalRulesSatisfied'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      approved: json['approved'] as bool?,
      overridden: json['overridden'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRulesNotSatisfied = this.approvalRulesNotSatisfied;
    final approvalRulesSatisfied = this.approvalRulesSatisfied;
    final approved = this.approved;
    final overridden = this.overridden;
    return {
      if (approvalRulesNotSatisfied != null)
        'approvalRulesNotSatisfied': approvalRulesNotSatisfied,
      if (approvalRulesSatisfied != null)
        'approvalRulesSatisfied': approvalRulesSatisfied,
      if (approved != null) 'approved': approved,
      if (overridden != null) 'overridden': overridden,
    };
  }
}

/// Returns information about a file in a repository.
class File {
  /// The fully qualified path to the file in the repository.
  final String? absolutePath;

  /// The blob ID that contains the file information.
  final String? blobId;

  /// The extrapolated file mode permissions for the file. Valid values include
  /// EXECUTABLE and NORMAL.
  final FileModeTypeEnum? fileMode;

  /// The relative path of the file from the folder where the query originated.
  final String? relativePath;

  File({
    this.absolutePath,
    this.blobId,
    this.fileMode,
    this.relativePath,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      absolutePath: json['absolutePath'] as String?,
      blobId: json['blobId'] as String?,
      fileMode: (json['fileMode'] as String?)?.toFileModeTypeEnum(),
      relativePath: json['relativePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final absolutePath = this.absolutePath;
    final blobId = this.blobId;
    final fileMode = this.fileMode;
    final relativePath = this.relativePath;
    return {
      if (absolutePath != null) 'absolutePath': absolutePath,
      if (blobId != null) 'blobId': blobId,
      if (fileMode != null) 'fileMode': fileMode.toValue(),
      if (relativePath != null) 'relativePath': relativePath,
    };
  }
}

/// A file to be added, updated, or deleted as part of a commit.
class FileMetadata {
  /// The full path to the file to be added or updated, including the name of the
  /// file.
  final String? absolutePath;

  /// The blob ID that contains the file information.
  final String? blobId;

  /// The extrapolated file mode permissions for the file. Valid values include
  /// EXECUTABLE and NORMAL.
  final FileModeTypeEnum? fileMode;

  FileMetadata({
    this.absolutePath,
    this.blobId,
    this.fileMode,
  });

  factory FileMetadata.fromJson(Map<String, dynamic> json) {
    return FileMetadata(
      absolutePath: json['absolutePath'] as String?,
      blobId: json['blobId'] as String?,
      fileMode: (json['fileMode'] as String?)?.toFileModeTypeEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final absolutePath = this.absolutePath;
    final blobId = this.blobId;
    final fileMode = this.fileMode;
    return {
      if (absolutePath != null) 'absolutePath': absolutePath,
      if (blobId != null) 'blobId': blobId,
      if (fileMode != null) 'fileMode': fileMode.toValue(),
    };
  }
}

enum FileModeTypeEnum {
  executable,
  normal,
  symlink,
}

extension FileModeTypeEnumValueExtension on FileModeTypeEnum {
  String toValue() {
    switch (this) {
      case FileModeTypeEnum.executable:
        return 'EXECUTABLE';
      case FileModeTypeEnum.normal:
        return 'NORMAL';
      case FileModeTypeEnum.symlink:
        return 'SYMLINK';
    }
  }
}

extension FileModeTypeEnumFromString on String {
  FileModeTypeEnum toFileModeTypeEnum() {
    switch (this) {
      case 'EXECUTABLE':
        return FileModeTypeEnum.executable;
      case 'NORMAL':
        return FileModeTypeEnum.normal;
      case 'SYMLINK':
        return FileModeTypeEnum.symlink;
    }
    throw Exception('$this is not known in enum FileModeTypeEnum');
  }
}

/// Information about file modes in a merge or pull request.
class FileModes {
  /// The file mode of a file in the base of a merge or pull request.
  final FileModeTypeEnum? base;

  /// The file mode of a file in the destination of a merge or pull request.
  final FileModeTypeEnum? destination;

  /// The file mode of a file in the source of a merge or pull request.
  final FileModeTypeEnum? source;

  FileModes({
    this.base,
    this.destination,
    this.source,
  });

  factory FileModes.fromJson(Map<String, dynamic> json) {
    return FileModes(
      base: (json['base'] as String?)?.toFileModeTypeEnum(),
      destination: (json['destination'] as String?)?.toFileModeTypeEnum(),
      source: (json['source'] as String?)?.toFileModeTypeEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final base = this.base;
    final destination = this.destination;
    final source = this.source;
    return {
      if (base != null) 'base': base.toValue(),
      if (destination != null) 'destination': destination.toValue(),
      if (source != null) 'source': source.toValue(),
    };
  }
}

/// Information about the size of files in a merge or pull request.
class FileSizes {
  /// The size of a file in the base of a merge or pull request.
  final int? base;

  /// The size of a file in the destination of a merge or pull request.
  final int? destination;

  /// The size of a file in the source of a merge or pull request.
  final int? source;

  FileSizes({
    this.base,
    this.destination,
    this.source,
  });

  factory FileSizes.fromJson(Map<String, dynamic> json) {
    return FileSizes(
      base: json['base'] as int?,
      destination: json['destination'] as int?,
      source: json['source'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final base = this.base;
    final destination = this.destination;
    final source = this.source;
    return {
      if (base != null) 'base': base,
      if (destination != null) 'destination': destination,
      if (source != null) 'source': source,
    };
  }
}

/// Information about a version of a file.
class FileVersion {
  /// The blob ID of the object that represents the content of the file in this
  /// version.
  final String? blobId;
  final Commit? commit;

  /// The name and path of the file at which this blob is indexed which contains
  /// the data for this version of the file. This value will vary between file
  /// versions if a file is renamed or if its path changes.
  final String? path;

  /// An array of commit IDs that contain more recent versions of this file. If
  /// there are no additional versions of the file, this array will be empty.
  final List<String>? revisionChildren;

  FileVersion({
    this.blobId,
    this.commit,
    this.path,
    this.revisionChildren,
  });

  factory FileVersion.fromJson(Map<String, dynamic> json) {
    return FileVersion(
      blobId: json['blobId'] as String?,
      commit: json['commit'] != null
          ? Commit.fromJson(json['commit'] as Map<String, dynamic>)
          : null,
      path: json['path'] as String?,
      revisionChildren: (json['revisionChildren'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final blobId = this.blobId;
    final commit = this.commit;
    final path = this.path;
    final revisionChildren = this.revisionChildren;
    return {
      if (blobId != null) 'blobId': blobId,
      if (commit != null) 'commit': commit,
      if (path != null) 'path': path,
      if (revisionChildren != null) 'revisionChildren': revisionChildren,
    };
  }
}

/// Returns information about a folder in a repository.
class Folder {
  /// The fully qualified path of the folder in the repository.
  final String? absolutePath;

  /// The relative path of the specified folder from the folder where the query
  /// originated.
  final String? relativePath;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// the folder.
  final String? treeId;

  Folder({
    this.absolutePath,
    this.relativePath,
    this.treeId,
  });

  factory Folder.fromJson(Map<String, dynamic> json) {
    return Folder(
      absolutePath: json['absolutePath'] as String?,
      relativePath: json['relativePath'] as String?,
      treeId: json['treeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final absolutePath = this.absolutePath;
    final relativePath = this.relativePath;
    final treeId = this.treeId;
    return {
      if (absolutePath != null) 'absolutePath': absolutePath,
      if (relativePath != null) 'relativePath': relativePath,
      if (treeId != null) 'treeId': treeId,
    };
  }
}

class GetApprovalRuleTemplateOutput {
  /// The content and structure of the approval rule template.
  final ApprovalRuleTemplate approvalRuleTemplate;

  GetApprovalRuleTemplateOutput({
    required this.approvalRuleTemplate,
  });

  factory GetApprovalRuleTemplateOutput.fromJson(Map<String, dynamic> json) {
    return GetApprovalRuleTemplateOutput(
      approvalRuleTemplate: ApprovalRuleTemplate.fromJson(
          json['approvalRuleTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleTemplate = this.approvalRuleTemplate;
    return {
      'approvalRuleTemplate': approvalRuleTemplate,
    };
  }
}

/// Represents the output of a get blob operation.
class GetBlobOutput {
  /// The content of the blob, usually a file.
  final Uint8List content;

  GetBlobOutput({
    required this.content,
  });

  factory GetBlobOutput.fromJson(Map<String, dynamic> json) {
    return GetBlobOutput(
      content: _s.decodeUint8List(json['content']! as String),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    return {
      'content': base64Encode(content),
    };
  }
}

/// Represents the output of a get branch operation.
class GetBranchOutput {
  /// The name of the branch.
  final BranchInfo? branch;

  GetBranchOutput({
    this.branch,
  });

  factory GetBranchOutput.fromJson(Map<String, dynamic> json) {
    return GetBranchOutput(
      branch: json['branch'] != null
          ? BranchInfo.fromJson(json['branch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    return {
      if (branch != null) 'branch': branch,
    };
  }
}

class GetCommentOutput {
  /// The contents of the comment.
  final Comment? comment;

  GetCommentOutput({
    this.comment,
  });

  factory GetCommentOutput.fromJson(Map<String, dynamic> json) {
    return GetCommentOutput(
      comment: json['comment'] != null
          ? Comment.fromJson(json['comment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    return {
      if (comment != null) 'comment': comment,
    };
  }
}

class GetCommentReactionsOutput {
  /// An array of reactions to the specified comment.
  final List<ReactionForComment> reactionsForComment;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  final String? nextToken;

  GetCommentReactionsOutput({
    required this.reactionsForComment,
    this.nextToken,
  });

  factory GetCommentReactionsOutput.fromJson(Map<String, dynamic> json) {
    return GetCommentReactionsOutput(
      reactionsForComment: (json['reactionsForComment'] as List)
          .whereNotNull()
          .map((e) => ReactionForComment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reactionsForComment = this.reactionsForComment;
    final nextToken = this.nextToken;
    return {
      'reactionsForComment': reactionsForComment,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetCommentsForComparedCommitOutput {
  /// A list of comment objects on the compared commit.
  final List<CommentsForComparedCommit>? commentsForComparedCommitData;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  final String? nextToken;

  GetCommentsForComparedCommitOutput({
    this.commentsForComparedCommitData,
    this.nextToken,
  });

  factory GetCommentsForComparedCommitOutput.fromJson(
      Map<String, dynamic> json) {
    return GetCommentsForComparedCommitOutput(
      commentsForComparedCommitData:
          (json['commentsForComparedCommitData'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  CommentsForComparedCommit.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commentsForComparedCommitData = this.commentsForComparedCommitData;
    final nextToken = this.nextToken;
    return {
      if (commentsForComparedCommitData != null)
        'commentsForComparedCommitData': commentsForComparedCommitData,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetCommentsForPullRequestOutput {
  /// An array of comment objects on the pull request.
  final List<CommentsForPullRequest>? commentsForPullRequestData;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  final String? nextToken;

  GetCommentsForPullRequestOutput({
    this.commentsForPullRequestData,
    this.nextToken,
  });

  factory GetCommentsForPullRequestOutput.fromJson(Map<String, dynamic> json) {
    return GetCommentsForPullRequestOutput(
      commentsForPullRequestData: (json['commentsForPullRequestData'] as List?)
          ?.whereNotNull()
          .map(
              (e) => CommentsForPullRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commentsForPullRequestData = this.commentsForPullRequestData;
    final nextToken = this.nextToken;
    return {
      if (commentsForPullRequestData != null)
        'commentsForPullRequestData': commentsForPullRequestData,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the output of a get commit operation.
class GetCommitOutput {
  /// A commit data type object that contains information about the specified
  /// commit.
  final Commit commit;

  GetCommitOutput({
    required this.commit,
  });

  factory GetCommitOutput.fromJson(Map<String, dynamic> json) {
    return GetCommitOutput(
      commit: Commit.fromJson(json['commit'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final commit = this.commit;
    return {
      'commit': commit,
    };
  }
}

class GetDifferencesOutput {
  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  final String? nextToken;

  /// A data type object that contains information about the differences,
  /// including whether the difference is added, modified, or deleted (A, D, M).
  final List<Difference>? differences;

  GetDifferencesOutput({
    this.nextToken,
    this.differences,
  });

  factory GetDifferencesOutput.fromJson(Map<String, dynamic> json) {
    return GetDifferencesOutput(
      nextToken: json['NextToken'] as String?,
      differences: (json['differences'] as List?)
          ?.whereNotNull()
          .map((e) => Difference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final differences = this.differences;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (differences != null) 'differences': differences,
    };
  }
}

class GetFileOutput {
  /// The blob ID of the object that represents the file content.
  final String blobId;

  /// The full commit ID of the commit that contains the content returned by
  /// GetFile.
  final String commitId;

  /// The base-64 encoded binary data object that represents the content of the
  /// file.
  final Uint8List fileContent;

  /// The extrapolated file mode permissions of the blob. Valid values include
  /// strings such as EXECUTABLE and not numeric values.
  /// <note>
  /// The file mode permissions returned by this API are not the standard file
  /// mode permission values, such as 100644, but rather extrapolated values. See
  /// the supported return values.
  /// </note>
  final FileModeTypeEnum fileMode;

  /// The fully qualified path to the specified file. Returns the name and
  /// extension of the file.
  final String filePath;

  /// The size of the contents of the file, in bytes.
  final int fileSize;

  GetFileOutput({
    required this.blobId,
    required this.commitId,
    required this.fileContent,
    required this.fileMode,
    required this.filePath,
    required this.fileSize,
  });

  factory GetFileOutput.fromJson(Map<String, dynamic> json) {
    return GetFileOutput(
      blobId: json['blobId'] as String,
      commitId: json['commitId'] as String,
      fileContent: _s.decodeUint8List(json['fileContent']! as String),
      fileMode: (json['fileMode'] as String).toFileModeTypeEnum(),
      filePath: json['filePath'] as String,
      fileSize: json['fileSize'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final blobId = this.blobId;
    final commitId = this.commitId;
    final fileContent = this.fileContent;
    final fileMode = this.fileMode;
    final filePath = this.filePath;
    final fileSize = this.fileSize;
    return {
      'blobId': blobId,
      'commitId': commitId,
      'fileContent': base64Encode(fileContent),
      'fileMode': fileMode.toValue(),
      'filePath': filePath,
      'fileSize': fileSize,
    };
  }
}

class GetFolderOutput {
  /// The full commit ID used as a reference for the returned version of the
  /// folder content.
  final String commitId;

  /// The fully qualified path of the folder whose contents are returned.
  final String folderPath;

  /// The list of files in the specified folder, if any.
  final List<File>? files;

  /// The list of folders that exist under the specified folder, if any.
  final List<Folder>? subFolders;

  /// The list of submodules in the specified folder, if any.
  final List<SubModule>? subModules;

  /// The list of symbolic links to other files and folders in the specified
  /// folder, if any.
  final List<SymbolicLink>? symbolicLinks;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// the folder.
  final String? treeId;

  GetFolderOutput({
    required this.commitId,
    required this.folderPath,
    this.files,
    this.subFolders,
    this.subModules,
    this.symbolicLinks,
    this.treeId,
  });

  factory GetFolderOutput.fromJson(Map<String, dynamic> json) {
    return GetFolderOutput(
      commitId: json['commitId'] as String,
      folderPath: json['folderPath'] as String,
      files: (json['files'] as List?)
          ?.whereNotNull()
          .map((e) => File.fromJson(e as Map<String, dynamic>))
          .toList(),
      subFolders: (json['subFolders'] as List?)
          ?.whereNotNull()
          .map((e) => Folder.fromJson(e as Map<String, dynamic>))
          .toList(),
      subModules: (json['subModules'] as List?)
          ?.whereNotNull()
          .map((e) => SubModule.fromJson(e as Map<String, dynamic>))
          .toList(),
      symbolicLinks: (json['symbolicLinks'] as List?)
          ?.whereNotNull()
          .map((e) => SymbolicLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      treeId: json['treeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitId = this.commitId;
    final folderPath = this.folderPath;
    final files = this.files;
    final subFolders = this.subFolders;
    final subModules = this.subModules;
    final symbolicLinks = this.symbolicLinks;
    final treeId = this.treeId;
    return {
      'commitId': commitId,
      'folderPath': folderPath,
      if (files != null) 'files': files,
      if (subFolders != null) 'subFolders': subFolders,
      if (subModules != null) 'subModules': subModules,
      if (symbolicLinks != null) 'symbolicLinks': symbolicLinks,
      if (treeId != null) 'treeId': treeId,
    };
  }
}

class GetMergeCommitOutput {
  /// The commit ID of the merge base.
  final String? baseCommitId;

  /// The commit ID of the destination commit specifier that was used in the merge
  /// evaluation.
  final String? destinationCommitId;

  /// The commit ID for the merge commit created when the source branch was merged
  /// into the destination branch. If the fast-forward merge strategy was used,
  /// there is no merge commit.
  final String? mergedCommitId;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  final String? sourceCommitId;

  GetMergeCommitOutput({
    this.baseCommitId,
    this.destinationCommitId,
    this.mergedCommitId,
    this.sourceCommitId,
  });

  factory GetMergeCommitOutput.fromJson(Map<String, dynamic> json) {
    return GetMergeCommitOutput(
      baseCommitId: json['baseCommitId'] as String?,
      destinationCommitId: json['destinationCommitId'] as String?,
      mergedCommitId: json['mergedCommitId'] as String?,
      sourceCommitId: json['sourceCommitId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseCommitId = this.baseCommitId;
    final destinationCommitId = this.destinationCommitId;
    final mergedCommitId = this.mergedCommitId;
    final sourceCommitId = this.sourceCommitId;
    return {
      if (baseCommitId != null) 'baseCommitId': baseCommitId,
      if (destinationCommitId != null)
        'destinationCommitId': destinationCommitId,
      if (mergedCommitId != null) 'mergedCommitId': mergedCommitId,
      if (sourceCommitId != null) 'sourceCommitId': sourceCommitId,
    };
  }
}

class GetMergeConflictsOutput {
  /// A list of metadata for any conflicting files. If the specified merge
  /// strategy is FAST_FORWARD_MERGE, this list is always empty.
  final List<ConflictMetadata> conflictMetadataList;

  /// The commit ID of the destination commit specifier that was used in the merge
  /// evaluation.
  final String destinationCommitId;

  /// A Boolean value that indicates whether the code is mergeable by the
  /// specified merge option.
  final bool mergeable;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  final String sourceCommitId;

  /// The commit ID of the merge base.
  final String? baseCommitId;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  final String? nextToken;

  GetMergeConflictsOutput({
    required this.conflictMetadataList,
    required this.destinationCommitId,
    required this.mergeable,
    required this.sourceCommitId,
    this.baseCommitId,
    this.nextToken,
  });

  factory GetMergeConflictsOutput.fromJson(Map<String, dynamic> json) {
    return GetMergeConflictsOutput(
      conflictMetadataList: (json['conflictMetadataList'] as List)
          .whereNotNull()
          .map((e) => ConflictMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      destinationCommitId: json['destinationCommitId'] as String,
      mergeable: json['mergeable'] as bool,
      sourceCommitId: json['sourceCommitId'] as String,
      baseCommitId: json['baseCommitId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conflictMetadataList = this.conflictMetadataList;
    final destinationCommitId = this.destinationCommitId;
    final mergeable = this.mergeable;
    final sourceCommitId = this.sourceCommitId;
    final baseCommitId = this.baseCommitId;
    final nextToken = this.nextToken;
    return {
      'conflictMetadataList': conflictMetadataList,
      'destinationCommitId': destinationCommitId,
      'mergeable': mergeable,
      'sourceCommitId': sourceCommitId,
      if (baseCommitId != null) 'baseCommitId': baseCommitId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetMergeOptionsOutput {
  /// The commit ID of the merge base.
  final String baseCommitId;

  /// The commit ID of the destination commit specifier that was used in the merge
  /// evaluation.
  final String destinationCommitId;

  /// The merge option or strategy used to merge the code.
  final List<MergeOptionTypeEnum> mergeOptions;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  final String sourceCommitId;

  GetMergeOptionsOutput({
    required this.baseCommitId,
    required this.destinationCommitId,
    required this.mergeOptions,
    required this.sourceCommitId,
  });

  factory GetMergeOptionsOutput.fromJson(Map<String, dynamic> json) {
    return GetMergeOptionsOutput(
      baseCommitId: json['baseCommitId'] as String,
      destinationCommitId: json['destinationCommitId'] as String,
      mergeOptions: (json['mergeOptions'] as List)
          .whereNotNull()
          .map((e) => (e as String).toMergeOptionTypeEnum())
          .toList(),
      sourceCommitId: json['sourceCommitId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final baseCommitId = this.baseCommitId;
    final destinationCommitId = this.destinationCommitId;
    final mergeOptions = this.mergeOptions;
    final sourceCommitId = this.sourceCommitId;
    return {
      'baseCommitId': baseCommitId,
      'destinationCommitId': destinationCommitId,
      'mergeOptions': mergeOptions.map((e) => e.toValue()).toList(),
      'sourceCommitId': sourceCommitId,
    };
  }
}

class GetPullRequestApprovalStatesOutput {
  /// Information about users who have approved the pull request.
  final List<Approval>? approvals;

  GetPullRequestApprovalStatesOutput({
    this.approvals,
  });

  factory GetPullRequestApprovalStatesOutput.fromJson(
      Map<String, dynamic> json) {
    return GetPullRequestApprovalStatesOutput(
      approvals: (json['approvals'] as List?)
          ?.whereNotNull()
          .map((e) => Approval.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final approvals = this.approvals;
    return {
      if (approvals != null) 'approvals': approvals,
    };
  }
}

class GetPullRequestOutput {
  /// Information about the specified pull request.
  final PullRequest pullRequest;

  GetPullRequestOutput({
    required this.pullRequest,
  });

  factory GetPullRequestOutput.fromJson(Map<String, dynamic> json) {
    return GetPullRequestOutput(
      pullRequest:
          PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequest = this.pullRequest;
    return {
      'pullRequest': pullRequest,
    };
  }
}

class GetPullRequestOverrideStateOutput {
  /// A Boolean value that indicates whether a pull request has had its rules set
  /// aside (TRUE) or whether all approval rules still apply (FALSE).
  final bool? overridden;

  /// The Amazon Resource Name (ARN) of the user or identity that overrode the
  /// rules and their requirements for the pull request.
  final String? overrider;

  GetPullRequestOverrideStateOutput({
    this.overridden,
    this.overrider,
  });

  factory GetPullRequestOverrideStateOutput.fromJson(
      Map<String, dynamic> json) {
    return GetPullRequestOverrideStateOutput(
      overridden: json['overridden'] as bool?,
      overrider: json['overrider'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final overridden = this.overridden;
    final overrider = this.overrider;
    return {
      if (overridden != null) 'overridden': overridden,
      if (overrider != null) 'overrider': overrider,
    };
  }
}

/// Represents the output of a get repository operation.
class GetRepositoryOutput {
  /// Information about the repository.
  final RepositoryMetadata? repositoryMetadata;

  GetRepositoryOutput({
    this.repositoryMetadata,
  });

  factory GetRepositoryOutput.fromJson(Map<String, dynamic> json) {
    return GetRepositoryOutput(
      repositoryMetadata: json['repositoryMetadata'] != null
          ? RepositoryMetadata.fromJson(
              json['repositoryMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryMetadata = this.repositoryMetadata;
    return {
      if (repositoryMetadata != null) 'repositoryMetadata': repositoryMetadata,
    };
  }
}

/// Represents the output of a get repository triggers operation.
class GetRepositoryTriggersOutput {
  /// The system-generated unique ID for the trigger.
  final String? configurationId;

  /// The JSON block of configuration information for each trigger.
  final List<RepositoryTrigger>? triggers;

  GetRepositoryTriggersOutput({
    this.configurationId,
    this.triggers,
  });

  factory GetRepositoryTriggersOutput.fromJson(Map<String, dynamic> json) {
    return GetRepositoryTriggersOutput(
      configurationId: json['configurationId'] as String?,
      triggers: (json['triggers'] as List?)
          ?.whereNotNull()
          .map((e) => RepositoryTrigger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationId = this.configurationId;
    final triggers = this.triggers;
    return {
      if (configurationId != null) 'configurationId': configurationId,
      if (triggers != null) 'triggers': triggers,
    };
  }
}

/// Information about whether a file is binary or textual in a merge or pull
/// request operation.
class IsBinaryFile {
  /// The binary or non-binary status of a file in the base of a merge or pull
  /// request.
  final bool? base;

  /// The binary or non-binary status of a file in the destination of a merge or
  /// pull request.
  final bool? destination;

  /// The binary or non-binary status of file in the source of a merge or pull
  /// request.
  final bool? source;

  IsBinaryFile({
    this.base,
    this.destination,
    this.source,
  });

  factory IsBinaryFile.fromJson(Map<String, dynamic> json) {
    return IsBinaryFile(
      base: json['base'] as bool?,
      destination: json['destination'] as bool?,
      source: json['source'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final base = this.base;
    final destination = this.destination;
    final source = this.source;
    return {
      if (base != null) 'base': base,
      if (destination != null) 'destination': destination,
      if (source != null) 'source': source,
    };
  }
}

class ListApprovalRuleTemplatesOutput {
  /// The names of all the approval rule templates found in the Amazon Web
  /// Services Region for your Amazon Web Services account.
  final List<String>? approvalRuleTemplateNames;

  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  final String? nextToken;

  ListApprovalRuleTemplatesOutput({
    this.approvalRuleTemplateNames,
    this.nextToken,
  });

  factory ListApprovalRuleTemplatesOutput.fromJson(Map<String, dynamic> json) {
    return ListApprovalRuleTemplatesOutput(
      approvalRuleTemplateNames: (json['approvalRuleTemplateNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleTemplateNames = this.approvalRuleTemplateNames;
    final nextToken = this.nextToken;
    return {
      if (approvalRuleTemplateNames != null)
        'approvalRuleTemplateNames': approvalRuleTemplateNames,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssociatedApprovalRuleTemplatesForRepositoryOutput {
  /// The names of all approval rule templates associated with the repository.
  final List<String>? approvalRuleTemplateNames;

  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  final String? nextToken;

  ListAssociatedApprovalRuleTemplatesForRepositoryOutput({
    this.approvalRuleTemplateNames,
    this.nextToken,
  });

  factory ListAssociatedApprovalRuleTemplatesForRepositoryOutput.fromJson(
      Map<String, dynamic> json) {
    return ListAssociatedApprovalRuleTemplatesForRepositoryOutput(
      approvalRuleTemplateNames: (json['approvalRuleTemplateNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleTemplateNames = this.approvalRuleTemplateNames;
    final nextToken = this.nextToken;
    return {
      if (approvalRuleTemplateNames != null)
        'approvalRuleTemplateNames': approvalRuleTemplateNames,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the output of a list branches operation.
class ListBranchesOutput {
  /// The list of branch names.
  final List<String>? branches;

  /// An enumeration token that returns the batch of the results.
  final String? nextToken;

  ListBranchesOutput({
    this.branches,
    this.nextToken,
  });

  factory ListBranchesOutput.fromJson(Map<String, dynamic> json) {
    return ListBranchesOutput(
      branches: (json['branches'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final branches = this.branches;
    final nextToken = this.nextToken;
    return {
      if (branches != null) 'branches': branches,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFileCommitHistoryResponse {
  /// An array of FileVersion objects that form a directed acyclic graph (DAG) of
  /// the changes to the file made by the commits that changed the file.
  final List<FileVersion> revisionDag;

  /// An enumeration token that can be used to return the next batch of results.
  final String? nextToken;

  ListFileCommitHistoryResponse({
    required this.revisionDag,
    this.nextToken,
  });

  factory ListFileCommitHistoryResponse.fromJson(Map<String, dynamic> json) {
    return ListFileCommitHistoryResponse(
      revisionDag: (json['revisionDag'] as List)
          .whereNotNull()
          .map((e) => FileVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final revisionDag = this.revisionDag;
    final nextToken = this.nextToken;
    return {
      'revisionDag': revisionDag,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPullRequestsOutput {
  /// The system-generated IDs of the pull requests.
  final List<String> pullRequestIds;

  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  final String? nextToken;

  ListPullRequestsOutput({
    required this.pullRequestIds,
    this.nextToken,
  });

  factory ListPullRequestsOutput.fromJson(Map<String, dynamic> json) {
    return ListPullRequestsOutput(
      pullRequestIds: (json['pullRequestIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequestIds = this.pullRequestIds;
    final nextToken = this.nextToken;
    return {
      'pullRequestIds': pullRequestIds,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRepositoriesForApprovalRuleTemplateOutput {
  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  final String? nextToken;

  /// A list of repository names that are associated with the specified approval
  /// rule template.
  final List<String>? repositoryNames;

  ListRepositoriesForApprovalRuleTemplateOutput({
    this.nextToken,
    this.repositoryNames,
  });

  factory ListRepositoriesForApprovalRuleTemplateOutput.fromJson(
      Map<String, dynamic> json) {
    return ListRepositoriesForApprovalRuleTemplateOutput(
      nextToken: json['nextToken'] as String?,
      repositoryNames: (json['repositoryNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final repositoryNames = this.repositoryNames;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (repositoryNames != null) 'repositoryNames': repositoryNames,
    };
  }
}

/// Represents the output of a list repositories operation.
class ListRepositoriesOutput {
  /// An enumeration token that allows the operation to batch the results of the
  /// operation. Batch sizes are 1,000 for list repository operations. When the
  /// client sends the token back to CodeCommit, another page of 1,000 records is
  /// retrieved.
  final String? nextToken;

  /// Lists the repositories called by the list repositories operation.
  final List<RepositoryNameIdPair>? repositories;

  ListRepositoriesOutput({
    this.nextToken,
    this.repositories,
  });

  factory ListRepositoriesOutput.fromJson(Map<String, dynamic> json) {
    return ListRepositoriesOutput(
      nextToken: json['nextToken'] as String?,
      repositories: (json['repositories'] as List?)
          ?.whereNotNull()
          .map((e) => RepositoryNameIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final repositories = this.repositories;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (repositories != null) 'repositories': repositories,
    };
  }
}

class ListTagsForResourceOutput {
  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  final String? nextToken;

  /// A list of tag key and value pairs associated with the specified resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Returns information about the location of a change or comment in the
/// comparison between two commits or a pull request.
class Location {
  /// The name of the file being compared, including its extension and
  /// subdirectory, if any.
  final String? filePath;

  /// The position of a change in a compared file, in line number format.
  final int? filePosition;

  /// In a comparison of commits or a pull request, whether the change is in the
  /// before or after of that comparison.
  final RelativeFileVersionEnum? relativeFileVersion;

  Location({
    this.filePath,
    this.filePosition,
    this.relativeFileVersion,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      filePath: json['filePath'] as String?,
      filePosition: json['filePosition'] as int?,
      relativeFileVersion:
          (json['relativeFileVersion'] as String?)?.toRelativeFileVersionEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final filePath = this.filePath;
    final filePosition = this.filePosition;
    final relativeFileVersion = this.relativeFileVersion;
    return {
      if (filePath != null) 'filePath': filePath,
      if (filePosition != null) 'filePosition': filePosition,
      if (relativeFileVersion != null)
        'relativeFileVersion': relativeFileVersion.toValue(),
    };
  }
}

class MergeBranchesByFastForwardOutput {
  /// The commit ID of the merge in the destination or target branch.
  final String? commitId;

  /// The tree ID of the merge in the destination or target branch.
  final String? treeId;

  MergeBranchesByFastForwardOutput({
    this.commitId,
    this.treeId,
  });

  factory MergeBranchesByFastForwardOutput.fromJson(Map<String, dynamic> json) {
    return MergeBranchesByFastForwardOutput(
      commitId: json['commitId'] as String?,
      treeId: json['treeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitId = this.commitId;
    final treeId = this.treeId;
    return {
      if (commitId != null) 'commitId': commitId,
      if (treeId != null) 'treeId': treeId,
    };
  }
}

class MergeBranchesBySquashOutput {
  /// The commit ID of the merge in the destination or target branch.
  final String? commitId;

  /// The tree ID of the merge in the destination or target branch.
  final String? treeId;

  MergeBranchesBySquashOutput({
    this.commitId,
    this.treeId,
  });

  factory MergeBranchesBySquashOutput.fromJson(Map<String, dynamic> json) {
    return MergeBranchesBySquashOutput(
      commitId: json['commitId'] as String?,
      treeId: json['treeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitId = this.commitId;
    final treeId = this.treeId;
    return {
      if (commitId != null) 'commitId': commitId,
      if (treeId != null) 'treeId': treeId,
    };
  }
}

class MergeBranchesByThreeWayOutput {
  /// The commit ID of the merge in the destination or target branch.
  final String? commitId;

  /// The tree ID of the merge in the destination or target branch.
  final String? treeId;

  MergeBranchesByThreeWayOutput({
    this.commitId,
    this.treeId,
  });

  factory MergeBranchesByThreeWayOutput.fromJson(Map<String, dynamic> json) {
    return MergeBranchesByThreeWayOutput(
      commitId: json['commitId'] as String?,
      treeId: json['treeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitId = this.commitId;
    final treeId = this.treeId;
    return {
      if (commitId != null) 'commitId': commitId,
      if (treeId != null) 'treeId': treeId,
    };
  }
}

/// Information about merge hunks in a merge or pull request operation.
class MergeHunk {
  /// Information about the merge hunk in the base of a merge or pull request.
  final MergeHunkDetail? base;

  /// Information about the merge hunk in the destination of a merge or pull
  /// request.
  final MergeHunkDetail? destination;

  /// A Boolean value indicating whether a combination of hunks contains a
  /// conflict. Conflicts occur when the same file or the same lines in a file
  /// were modified in both the source and destination of a merge or pull request.
  /// Valid values include true, false, and null. True when the hunk represents a
  /// conflict and one or more files contains a line conflict. File mode conflicts
  /// in a merge do not set this to true.
  final bool? isConflict;

  /// Information about the merge hunk in the source of a merge or pull request.
  final MergeHunkDetail? source;

  MergeHunk({
    this.base,
    this.destination,
    this.isConflict,
    this.source,
  });

  factory MergeHunk.fromJson(Map<String, dynamic> json) {
    return MergeHunk(
      base: json['base'] != null
          ? MergeHunkDetail.fromJson(json['base'] as Map<String, dynamic>)
          : null,
      destination: json['destination'] != null
          ? MergeHunkDetail.fromJson(
              json['destination'] as Map<String, dynamic>)
          : null,
      isConflict: json['isConflict'] as bool?,
      source: json['source'] != null
          ? MergeHunkDetail.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final base = this.base;
    final destination = this.destination;
    final isConflict = this.isConflict;
    final source = this.source;
    return {
      if (base != null) 'base': base,
      if (destination != null) 'destination': destination,
      if (isConflict != null) 'isConflict': isConflict,
      if (source != null) 'source': source,
    };
  }
}

/// Information about the details of a merge hunk that contains a conflict in a
/// merge or pull request operation.
class MergeHunkDetail {
  /// The end position of the hunk in the merge result.
  final int? endLine;

  /// The base-64 encoded content of the hunk merged region that might contain a
  /// conflict.
  final String? hunkContent;

  /// The start position of the hunk in the merge result.
  final int? startLine;

  MergeHunkDetail({
    this.endLine,
    this.hunkContent,
    this.startLine,
  });

  factory MergeHunkDetail.fromJson(Map<String, dynamic> json) {
    return MergeHunkDetail(
      endLine: json['endLine'] as int?,
      hunkContent: json['hunkContent'] as String?,
      startLine: json['startLine'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final endLine = this.endLine;
    final hunkContent = this.hunkContent;
    final startLine = this.startLine;
    return {
      if (endLine != null) 'endLine': endLine,
      if (hunkContent != null) 'hunkContent': hunkContent,
      if (startLine != null) 'startLine': startLine,
    };
  }
}

/// Returns information about a merge or potential merge between a source
/// reference and a destination reference in a pull request.
class MergeMetadata {
  /// A Boolean value indicating whether the merge has been made.
  final bool? isMerged;

  /// The commit ID for the merge commit, if any.
  final String? mergeCommitId;

  /// The merge strategy used in the merge.
  final MergeOptionTypeEnum? mergeOption;

  /// The Amazon Resource Name (ARN) of the user who merged the branches.
  final String? mergedBy;

  MergeMetadata({
    this.isMerged,
    this.mergeCommitId,
    this.mergeOption,
    this.mergedBy,
  });

  factory MergeMetadata.fromJson(Map<String, dynamic> json) {
    return MergeMetadata(
      isMerged: json['isMerged'] as bool?,
      mergeCommitId: json['mergeCommitId'] as String?,
      mergeOption: (json['mergeOption'] as String?)?.toMergeOptionTypeEnum(),
      mergedBy: json['mergedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isMerged = this.isMerged;
    final mergeCommitId = this.mergeCommitId;
    final mergeOption = this.mergeOption;
    final mergedBy = this.mergedBy;
    return {
      if (isMerged != null) 'isMerged': isMerged,
      if (mergeCommitId != null) 'mergeCommitId': mergeCommitId,
      if (mergeOption != null) 'mergeOption': mergeOption.toValue(),
      if (mergedBy != null) 'mergedBy': mergedBy,
    };
  }
}

/// Information about the file operation conflicts in a merge operation.
class MergeOperations {
  /// The operation on a file in the destination of a merge or pull request.
  final ChangeTypeEnum? destination;

  /// The operation (add, modify, or delete) on a file in the source of a merge or
  /// pull request.
  final ChangeTypeEnum? source;

  MergeOperations({
    this.destination,
    this.source,
  });

  factory MergeOperations.fromJson(Map<String, dynamic> json) {
    return MergeOperations(
      destination: (json['destination'] as String?)?.toChangeTypeEnum(),
      source: (json['source'] as String?)?.toChangeTypeEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final source = this.source;
    return {
      if (destination != null) 'destination': destination.toValue(),
      if (source != null) 'source': source.toValue(),
    };
  }
}

enum MergeOptionTypeEnum {
  fastForwardMerge,
  squashMerge,
  threeWayMerge,
}

extension MergeOptionTypeEnumValueExtension on MergeOptionTypeEnum {
  String toValue() {
    switch (this) {
      case MergeOptionTypeEnum.fastForwardMerge:
        return 'FAST_FORWARD_MERGE';
      case MergeOptionTypeEnum.squashMerge:
        return 'SQUASH_MERGE';
      case MergeOptionTypeEnum.threeWayMerge:
        return 'THREE_WAY_MERGE';
    }
  }
}

extension MergeOptionTypeEnumFromString on String {
  MergeOptionTypeEnum toMergeOptionTypeEnum() {
    switch (this) {
      case 'FAST_FORWARD_MERGE':
        return MergeOptionTypeEnum.fastForwardMerge;
      case 'SQUASH_MERGE':
        return MergeOptionTypeEnum.squashMerge;
      case 'THREE_WAY_MERGE':
        return MergeOptionTypeEnum.threeWayMerge;
    }
    throw Exception('$this is not known in enum MergeOptionTypeEnum');
  }
}

class MergePullRequestByFastForwardOutput {
  /// Information about the specified pull request, including the merge.
  final PullRequest? pullRequest;

  MergePullRequestByFastForwardOutput({
    this.pullRequest,
  });

  factory MergePullRequestByFastForwardOutput.fromJson(
      Map<String, dynamic> json) {
    return MergePullRequestByFastForwardOutput(
      pullRequest: json['pullRequest'] != null
          ? PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequest = this.pullRequest;
    return {
      if (pullRequest != null) 'pullRequest': pullRequest,
    };
  }
}

class MergePullRequestBySquashOutput {
  final PullRequest? pullRequest;

  MergePullRequestBySquashOutput({
    this.pullRequest,
  });

  factory MergePullRequestBySquashOutput.fromJson(Map<String, dynamic> json) {
    return MergePullRequestBySquashOutput(
      pullRequest: json['pullRequest'] != null
          ? PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequest = this.pullRequest;
    return {
      if (pullRequest != null) 'pullRequest': pullRequest,
    };
  }
}

class MergePullRequestByThreeWayOutput {
  final PullRequest? pullRequest;

  MergePullRequestByThreeWayOutput({
    this.pullRequest,
  });

  factory MergePullRequestByThreeWayOutput.fromJson(Map<String, dynamic> json) {
    return MergePullRequestByThreeWayOutput(
      pullRequest: json['pullRequest'] != null
          ? PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequest = this.pullRequest;
    return {
      if (pullRequest != null) 'pullRequest': pullRequest,
    };
  }
}

enum ObjectTypeEnum {
  file,
  directory,
  gitLink,
  symbolicLink,
}

extension ObjectTypeEnumValueExtension on ObjectTypeEnum {
  String toValue() {
    switch (this) {
      case ObjectTypeEnum.file:
        return 'FILE';
      case ObjectTypeEnum.directory:
        return 'DIRECTORY';
      case ObjectTypeEnum.gitLink:
        return 'GIT_LINK';
      case ObjectTypeEnum.symbolicLink:
        return 'SYMBOLIC_LINK';
    }
  }
}

extension ObjectTypeEnumFromString on String {
  ObjectTypeEnum toObjectTypeEnum() {
    switch (this) {
      case 'FILE':
        return ObjectTypeEnum.file;
      case 'DIRECTORY':
        return ObjectTypeEnum.directory;
      case 'GIT_LINK':
        return ObjectTypeEnum.gitLink;
      case 'SYMBOLIC_LINK':
        return ObjectTypeEnum.symbolicLink;
    }
    throw Exception('$this is not known in enum ObjectTypeEnum');
  }
}

/// Information about the type of an object in a merge operation.
class ObjectTypes {
  /// The type of the object in the base commit of the merge.
  final ObjectTypeEnum? base;

  /// The type of the object in the destination branch.
  final ObjectTypeEnum? destination;

  /// The type of the object in the source branch.
  final ObjectTypeEnum? source;

  ObjectTypes({
    this.base,
    this.destination,
    this.source,
  });

  factory ObjectTypes.fromJson(Map<String, dynamic> json) {
    return ObjectTypes(
      base: (json['base'] as String?)?.toObjectTypeEnum(),
      destination: (json['destination'] as String?)?.toObjectTypeEnum(),
      source: (json['source'] as String?)?.toObjectTypeEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final base = this.base;
    final destination = this.destination;
    final source = this.source;
    return {
      if (base != null) 'base': base.toValue(),
      if (destination != null) 'destination': destination.toValue(),
      if (source != null) 'source': source.toValue(),
    };
  }
}

enum OrderEnum {
  ascending,
  descending,
}

extension OrderEnumValueExtension on OrderEnum {
  String toValue() {
    switch (this) {
      case OrderEnum.ascending:
        return 'ascending';
      case OrderEnum.descending:
        return 'descending';
    }
  }
}

extension OrderEnumFromString on String {
  OrderEnum toOrderEnum() {
    switch (this) {
      case 'ascending':
        return OrderEnum.ascending;
      case 'descending':
        return OrderEnum.descending;
    }
    throw Exception('$this is not known in enum OrderEnum');
  }
}

/// Returns information about the template that created the approval rule for a
/// pull request.
class OriginApprovalRuleTemplate {
  /// The ID of the template that created the approval rule.
  final String? approvalRuleTemplateId;

  /// The name of the template that created the approval rule.
  final String? approvalRuleTemplateName;

  OriginApprovalRuleTemplate({
    this.approvalRuleTemplateId,
    this.approvalRuleTemplateName,
  });

  factory OriginApprovalRuleTemplate.fromJson(Map<String, dynamic> json) {
    return OriginApprovalRuleTemplate(
      approvalRuleTemplateId: json['approvalRuleTemplateId'] as String?,
      approvalRuleTemplateName: json['approvalRuleTemplateName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleTemplateId = this.approvalRuleTemplateId;
    final approvalRuleTemplateName = this.approvalRuleTemplateName;
    return {
      if (approvalRuleTemplateId != null)
        'approvalRuleTemplateId': approvalRuleTemplateId,
      if (approvalRuleTemplateName != null)
        'approvalRuleTemplateName': approvalRuleTemplateName,
    };
  }
}

enum OverrideStatus {
  override,
  revoke,
}

extension OverrideStatusValueExtension on OverrideStatus {
  String toValue() {
    switch (this) {
      case OverrideStatus.override:
        return 'OVERRIDE';
      case OverrideStatus.revoke:
        return 'REVOKE';
    }
  }
}

extension OverrideStatusFromString on String {
  OverrideStatus toOverrideStatus() {
    switch (this) {
      case 'OVERRIDE':
        return OverrideStatus.override;
      case 'REVOKE':
        return OverrideStatus.revoke;
    }
    throw Exception('$this is not known in enum OverrideStatus');
  }
}

class PostCommentForComparedCommitOutput {
  /// In the directionality you established, the blob ID of the after blob.
  final String? afterBlobId;

  /// In the directionality you established, the full commit ID of the after
  /// commit.
  final String? afterCommitId;

  /// In the directionality you established, the blob ID of the before blob.
  final String? beforeBlobId;

  /// In the directionality you established, the full commit ID of the before
  /// commit.
  final String? beforeCommitId;

  /// The content of the comment you posted.
  final Comment? comment;

  /// The location of the comment in the comparison between the two commits.
  final Location? location;

  /// The name of the repository where you posted a comment on the comparison
  /// between commits.
  final String? repositoryName;

  PostCommentForComparedCommitOutput({
    this.afterBlobId,
    this.afterCommitId,
    this.beforeBlobId,
    this.beforeCommitId,
    this.comment,
    this.location,
    this.repositoryName,
  });

  factory PostCommentForComparedCommitOutput.fromJson(
      Map<String, dynamic> json) {
    return PostCommentForComparedCommitOutput(
      afterBlobId: json['afterBlobId'] as String?,
      afterCommitId: json['afterCommitId'] as String?,
      beforeBlobId: json['beforeBlobId'] as String?,
      beforeCommitId: json['beforeCommitId'] as String?,
      comment: json['comment'] != null
          ? Comment.fromJson(json['comment'] as Map<String, dynamic>)
          : null,
      location: json['location'] != null
          ? Location.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final afterBlobId = this.afterBlobId;
    final afterCommitId = this.afterCommitId;
    final beforeBlobId = this.beforeBlobId;
    final beforeCommitId = this.beforeCommitId;
    final comment = this.comment;
    final location = this.location;
    final repositoryName = this.repositoryName;
    return {
      if (afterBlobId != null) 'afterBlobId': afterBlobId,
      if (afterCommitId != null) 'afterCommitId': afterCommitId,
      if (beforeBlobId != null) 'beforeBlobId': beforeBlobId,
      if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
      if (comment != null) 'comment': comment,
      if (location != null) 'location': location,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

class PostCommentForPullRequestOutput {
  /// In the directionality of the pull request, the blob ID of the after blob.
  final String? afterBlobId;

  /// The full commit ID of the commit in the destination branch where the pull
  /// request is merged.
  final String? afterCommitId;

  /// In the directionality of the pull request, the blob ID of the before blob.
  final String? beforeBlobId;

  /// The full commit ID of the commit in the source branch used to create the
  /// pull request, or in the case of an updated pull request, the full commit ID
  /// of the commit used to update the pull request.
  final String? beforeCommitId;

  /// The content of the comment you posted.
  final Comment? comment;

  /// The location of the change where you posted your comment.
  final Location? location;

  /// The system-generated ID of the pull request.
  final String? pullRequestId;

  /// The name of the repository where you posted a comment on a pull request.
  final String? repositoryName;

  PostCommentForPullRequestOutput({
    this.afterBlobId,
    this.afterCommitId,
    this.beforeBlobId,
    this.beforeCommitId,
    this.comment,
    this.location,
    this.pullRequestId,
    this.repositoryName,
  });

  factory PostCommentForPullRequestOutput.fromJson(Map<String, dynamic> json) {
    return PostCommentForPullRequestOutput(
      afterBlobId: json['afterBlobId'] as String?,
      afterCommitId: json['afterCommitId'] as String?,
      beforeBlobId: json['beforeBlobId'] as String?,
      beforeCommitId: json['beforeCommitId'] as String?,
      comment: json['comment'] != null
          ? Comment.fromJson(json['comment'] as Map<String, dynamic>)
          : null,
      location: json['location'] != null
          ? Location.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      pullRequestId: json['pullRequestId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final afterBlobId = this.afterBlobId;
    final afterCommitId = this.afterCommitId;
    final beforeBlobId = this.beforeBlobId;
    final beforeCommitId = this.beforeCommitId;
    final comment = this.comment;
    final location = this.location;
    final pullRequestId = this.pullRequestId;
    final repositoryName = this.repositoryName;
    return {
      if (afterBlobId != null) 'afterBlobId': afterBlobId,
      if (afterCommitId != null) 'afterCommitId': afterCommitId,
      if (beforeBlobId != null) 'beforeBlobId': beforeBlobId,
      if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
      if (comment != null) 'comment': comment,
      if (location != null) 'location': location,
      if (pullRequestId != null) 'pullRequestId': pullRequestId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

class PostCommentReplyOutput {
  /// Information about the reply to a comment.
  final Comment? comment;

  PostCommentReplyOutput({
    this.comment,
  });

  factory PostCommentReplyOutput.fromJson(Map<String, dynamic> json) {
    return PostCommentReplyOutput(
      comment: json['comment'] != null
          ? Comment.fromJson(json['comment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    return {
      if (comment != null) 'comment': comment,
    };
  }
}

/// Returns information about a pull request.
class PullRequest {
  /// The approval rules applied to the pull request.
  final List<ApprovalRule>? approvalRules;

  /// The Amazon Resource Name (ARN) of the user who created the pull request.
  final String? authorArn;

  /// A unique, client-generated idempotency token that, when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter. If
  /// a request is received with the same parameters and a token is included, the
  /// request returns information about the initial request that used that token.
  final String? clientRequestToken;

  /// The date and time the pull request was originally created, in timestamp
  /// format.
  final DateTime? creationDate;

  /// The user-defined description of the pull request. This description can be
  /// used to clarify what should be reviewed and other details of the request.
  final String? description;

  /// The day and time of the last user or system activity on the pull request, in
  /// timestamp format.
  final DateTime? lastActivityDate;

  /// The system-generated ID of the pull request.
  final String? pullRequestId;

  /// The status of the pull request. Pull request status can only change from
  /// <code>OPEN</code> to <code>CLOSED</code>.
  final PullRequestStatusEnum? pullRequestStatus;

  /// The targets of the pull request, including the source branch and destination
  /// branch for the pull request.
  final List<PullRequestTarget>? pullRequestTargets;

  /// The system-generated revision ID for the pull request.
  final String? revisionId;

  /// The user-defined title of the pull request. This title is displayed in the
  /// list of pull requests to other repository users.
  final String? title;

  PullRequest({
    this.approvalRules,
    this.authorArn,
    this.clientRequestToken,
    this.creationDate,
    this.description,
    this.lastActivityDate,
    this.pullRequestId,
    this.pullRequestStatus,
    this.pullRequestTargets,
    this.revisionId,
    this.title,
  });

  factory PullRequest.fromJson(Map<String, dynamic> json) {
    return PullRequest(
      approvalRules: (json['approvalRules'] as List?)
          ?.whereNotNull()
          .map((e) => ApprovalRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      authorArn: json['authorArn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      lastActivityDate: timeStampFromJson(json['lastActivityDate']),
      pullRequestId: json['pullRequestId'] as String?,
      pullRequestStatus:
          (json['pullRequestStatus'] as String?)?.toPullRequestStatusEnum(),
      pullRequestTargets: (json['pullRequestTargets'] as List?)
          ?.whereNotNull()
          .map((e) => PullRequestTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      revisionId: json['revisionId'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRules = this.approvalRules;
    final authorArn = this.authorArn;
    final clientRequestToken = this.clientRequestToken;
    final creationDate = this.creationDate;
    final description = this.description;
    final lastActivityDate = this.lastActivityDate;
    final pullRequestId = this.pullRequestId;
    final pullRequestStatus = this.pullRequestStatus;
    final pullRequestTargets = this.pullRequestTargets;
    final revisionId = this.revisionId;
    final title = this.title;
    return {
      if (approvalRules != null) 'approvalRules': approvalRules,
      if (authorArn != null) 'authorArn': authorArn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (description != null) 'description': description,
      if (lastActivityDate != null)
        'lastActivityDate': unixTimestampToJson(lastActivityDate),
      if (pullRequestId != null) 'pullRequestId': pullRequestId,
      if (pullRequestStatus != null)
        'pullRequestStatus': pullRequestStatus.toValue(),
      if (pullRequestTargets != null) 'pullRequestTargets': pullRequestTargets,
      if (revisionId != null) 'revisionId': revisionId,
      if (title != null) 'title': title,
    };
  }
}

/// Metadata about the pull request that is used when comparing the pull request
/// source with its destination.
class PullRequestCreatedEventMetadata {
  /// The commit ID of the tip of the branch specified as the destination branch
  /// when the pull request was created.
  final String? destinationCommitId;

  /// The commit ID of the most recent commit that the source branch and the
  /// destination branch have in common.
  final String? mergeBase;

  /// The name of the repository where the pull request was created.
  final String? repositoryName;

  /// The commit ID on the source branch used when the pull request was created.
  final String? sourceCommitId;

  PullRequestCreatedEventMetadata({
    this.destinationCommitId,
    this.mergeBase,
    this.repositoryName,
    this.sourceCommitId,
  });

  factory PullRequestCreatedEventMetadata.fromJson(Map<String, dynamic> json) {
    return PullRequestCreatedEventMetadata(
      destinationCommitId: json['destinationCommitId'] as String?,
      mergeBase: json['mergeBase'] as String?,
      repositoryName: json['repositoryName'] as String?,
      sourceCommitId: json['sourceCommitId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationCommitId = this.destinationCommitId;
    final mergeBase = this.mergeBase;
    final repositoryName = this.repositoryName;
    final sourceCommitId = this.sourceCommitId;
    return {
      if (destinationCommitId != null)
        'destinationCommitId': destinationCommitId,
      if (mergeBase != null) 'mergeBase': mergeBase,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (sourceCommitId != null) 'sourceCommitId': sourceCommitId,
    };
  }
}

/// Returns information about a pull request event.
class PullRequestEvent {
  /// The Amazon Resource Name (ARN) of the user whose actions resulted in the
  /// event. Examples include updating the pull request with more commits or
  /// changing the status of a pull request.
  final String? actorArn;

  /// Information about a pull request event.
  final ApprovalRuleEventMetadata? approvalRuleEventMetadata;

  /// Information about an approval rule override event for a pull request.
  final ApprovalRuleOverriddenEventMetadata?
      approvalRuleOverriddenEventMetadata;

  /// Information about an approval state change for a pull request.
  final ApprovalStateChangedEventMetadata? approvalStateChangedEventMetadata;

  /// The day and time of the pull request event, in timestamp format.
  final DateTime? eventDate;

  /// Information about the source and destination branches for the pull request.
  final PullRequestCreatedEventMetadata? pullRequestCreatedEventMetadata;

  /// The type of the pull request event (for example, a status change event
  /// (PULL_REQUEST_STATUS_CHANGED) or update event
  /// (PULL_REQUEST_SOURCE_REFERENCE_UPDATED)).
  final PullRequestEventType? pullRequestEventType;

  /// The system-generated ID of the pull request.
  final String? pullRequestId;

  /// Information about the change in mergability state for the pull request
  /// event.
  final PullRequestMergedStateChangedEventMetadata?
      pullRequestMergedStateChangedEventMetadata;

  /// Information about the updated source branch for the pull request event.
  final PullRequestSourceReferenceUpdatedEventMetadata?
      pullRequestSourceReferenceUpdatedEventMetadata;

  /// Information about the change in status for the pull request event.
  final PullRequestStatusChangedEventMetadata?
      pullRequestStatusChangedEventMetadata;

  PullRequestEvent({
    this.actorArn,
    this.approvalRuleEventMetadata,
    this.approvalRuleOverriddenEventMetadata,
    this.approvalStateChangedEventMetadata,
    this.eventDate,
    this.pullRequestCreatedEventMetadata,
    this.pullRequestEventType,
    this.pullRequestId,
    this.pullRequestMergedStateChangedEventMetadata,
    this.pullRequestSourceReferenceUpdatedEventMetadata,
    this.pullRequestStatusChangedEventMetadata,
  });

  factory PullRequestEvent.fromJson(Map<String, dynamic> json) {
    return PullRequestEvent(
      actorArn: json['actorArn'] as String?,
      approvalRuleEventMetadata: json['approvalRuleEventMetadata'] != null
          ? ApprovalRuleEventMetadata.fromJson(
              json['approvalRuleEventMetadata'] as Map<String, dynamic>)
          : null,
      approvalRuleOverriddenEventMetadata:
          json['approvalRuleOverriddenEventMetadata'] != null
              ? ApprovalRuleOverriddenEventMetadata.fromJson(
                  json['approvalRuleOverriddenEventMetadata']
                      as Map<String, dynamic>)
              : null,
      approvalStateChangedEventMetadata:
          json['approvalStateChangedEventMetadata'] != null
              ? ApprovalStateChangedEventMetadata.fromJson(
                  json['approvalStateChangedEventMetadata']
                      as Map<String, dynamic>)
              : null,
      eventDate: timeStampFromJson(json['eventDate']),
      pullRequestCreatedEventMetadata:
          json['pullRequestCreatedEventMetadata'] != null
              ? PullRequestCreatedEventMetadata.fromJson(
                  json['pullRequestCreatedEventMetadata']
                      as Map<String, dynamic>)
              : null,
      pullRequestEventType:
          (json['pullRequestEventType'] as String?)?.toPullRequestEventType(),
      pullRequestId: json['pullRequestId'] as String?,
      pullRequestMergedStateChangedEventMetadata:
          json['pullRequestMergedStateChangedEventMetadata'] != null
              ? PullRequestMergedStateChangedEventMetadata.fromJson(
                  json['pullRequestMergedStateChangedEventMetadata']
                      as Map<String, dynamic>)
              : null,
      pullRequestSourceReferenceUpdatedEventMetadata:
          json['pullRequestSourceReferenceUpdatedEventMetadata'] != null
              ? PullRequestSourceReferenceUpdatedEventMetadata.fromJson(
                  json['pullRequestSourceReferenceUpdatedEventMetadata']
                      as Map<String, dynamic>)
              : null,
      pullRequestStatusChangedEventMetadata:
          json['pullRequestStatusChangedEventMetadata'] != null
              ? PullRequestStatusChangedEventMetadata.fromJson(
                  json['pullRequestStatusChangedEventMetadata']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actorArn = this.actorArn;
    final approvalRuleEventMetadata = this.approvalRuleEventMetadata;
    final approvalRuleOverriddenEventMetadata =
        this.approvalRuleOverriddenEventMetadata;
    final approvalStateChangedEventMetadata =
        this.approvalStateChangedEventMetadata;
    final eventDate = this.eventDate;
    final pullRequestCreatedEventMetadata =
        this.pullRequestCreatedEventMetadata;
    final pullRequestEventType = this.pullRequestEventType;
    final pullRequestId = this.pullRequestId;
    final pullRequestMergedStateChangedEventMetadata =
        this.pullRequestMergedStateChangedEventMetadata;
    final pullRequestSourceReferenceUpdatedEventMetadata =
        this.pullRequestSourceReferenceUpdatedEventMetadata;
    final pullRequestStatusChangedEventMetadata =
        this.pullRequestStatusChangedEventMetadata;
    return {
      if (actorArn != null) 'actorArn': actorArn,
      if (approvalRuleEventMetadata != null)
        'approvalRuleEventMetadata': approvalRuleEventMetadata,
      if (approvalRuleOverriddenEventMetadata != null)
        'approvalRuleOverriddenEventMetadata':
            approvalRuleOverriddenEventMetadata,
      if (approvalStateChangedEventMetadata != null)
        'approvalStateChangedEventMetadata': approvalStateChangedEventMetadata,
      if (eventDate != null) 'eventDate': unixTimestampToJson(eventDate),
      if (pullRequestCreatedEventMetadata != null)
        'pullRequestCreatedEventMetadata': pullRequestCreatedEventMetadata,
      if (pullRequestEventType != null)
        'pullRequestEventType': pullRequestEventType.toValue(),
      if (pullRequestId != null) 'pullRequestId': pullRequestId,
      if (pullRequestMergedStateChangedEventMetadata != null)
        'pullRequestMergedStateChangedEventMetadata':
            pullRequestMergedStateChangedEventMetadata,
      if (pullRequestSourceReferenceUpdatedEventMetadata != null)
        'pullRequestSourceReferenceUpdatedEventMetadata':
            pullRequestSourceReferenceUpdatedEventMetadata,
      if (pullRequestStatusChangedEventMetadata != null)
        'pullRequestStatusChangedEventMetadata':
            pullRequestStatusChangedEventMetadata,
    };
  }
}

enum PullRequestEventType {
  pullRequestCreated,
  pullRequestStatusChanged,
  pullRequestSourceReferenceUpdated,
  pullRequestMergeStateChanged,
  pullRequestApprovalRuleCreated,
  pullRequestApprovalRuleUpdated,
  pullRequestApprovalRuleDeleted,
  pullRequestApprovalRuleOverridden,
  pullRequestApprovalStateChanged,
}

extension PullRequestEventTypeValueExtension on PullRequestEventType {
  String toValue() {
    switch (this) {
      case PullRequestEventType.pullRequestCreated:
        return 'PULL_REQUEST_CREATED';
      case PullRequestEventType.pullRequestStatusChanged:
        return 'PULL_REQUEST_STATUS_CHANGED';
      case PullRequestEventType.pullRequestSourceReferenceUpdated:
        return 'PULL_REQUEST_SOURCE_REFERENCE_UPDATED';
      case PullRequestEventType.pullRequestMergeStateChanged:
        return 'PULL_REQUEST_MERGE_STATE_CHANGED';
      case PullRequestEventType.pullRequestApprovalRuleCreated:
        return 'PULL_REQUEST_APPROVAL_RULE_CREATED';
      case PullRequestEventType.pullRequestApprovalRuleUpdated:
        return 'PULL_REQUEST_APPROVAL_RULE_UPDATED';
      case PullRequestEventType.pullRequestApprovalRuleDeleted:
        return 'PULL_REQUEST_APPROVAL_RULE_DELETED';
      case PullRequestEventType.pullRequestApprovalRuleOverridden:
        return 'PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN';
      case PullRequestEventType.pullRequestApprovalStateChanged:
        return 'PULL_REQUEST_APPROVAL_STATE_CHANGED';
    }
  }
}

extension PullRequestEventTypeFromString on String {
  PullRequestEventType toPullRequestEventType() {
    switch (this) {
      case 'PULL_REQUEST_CREATED':
        return PullRequestEventType.pullRequestCreated;
      case 'PULL_REQUEST_STATUS_CHANGED':
        return PullRequestEventType.pullRequestStatusChanged;
      case 'PULL_REQUEST_SOURCE_REFERENCE_UPDATED':
        return PullRequestEventType.pullRequestSourceReferenceUpdated;
      case 'PULL_REQUEST_MERGE_STATE_CHANGED':
        return PullRequestEventType.pullRequestMergeStateChanged;
      case 'PULL_REQUEST_APPROVAL_RULE_CREATED':
        return PullRequestEventType.pullRequestApprovalRuleCreated;
      case 'PULL_REQUEST_APPROVAL_RULE_UPDATED':
        return PullRequestEventType.pullRequestApprovalRuleUpdated;
      case 'PULL_REQUEST_APPROVAL_RULE_DELETED':
        return PullRequestEventType.pullRequestApprovalRuleDeleted;
      case 'PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN':
        return PullRequestEventType.pullRequestApprovalRuleOverridden;
      case 'PULL_REQUEST_APPROVAL_STATE_CHANGED':
        return PullRequestEventType.pullRequestApprovalStateChanged;
    }
    throw Exception('$this is not known in enum PullRequestEventType');
  }
}

/// Returns information about the change in the merge state for a pull request
/// event.
class PullRequestMergedStateChangedEventMetadata {
  /// The name of the branch that the pull request is merged into.
  final String? destinationReference;

  /// Information about the merge state change event.
  final MergeMetadata? mergeMetadata;

  /// The name of the repository where the pull request was created.
  final String? repositoryName;

  PullRequestMergedStateChangedEventMetadata({
    this.destinationReference,
    this.mergeMetadata,
    this.repositoryName,
  });

  factory PullRequestMergedStateChangedEventMetadata.fromJson(
      Map<String, dynamic> json) {
    return PullRequestMergedStateChangedEventMetadata(
      destinationReference: json['destinationReference'] as String?,
      mergeMetadata: json['mergeMetadata'] != null
          ? MergeMetadata.fromJson(
              json['mergeMetadata'] as Map<String, dynamic>)
          : null,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationReference = this.destinationReference;
    final mergeMetadata = this.mergeMetadata;
    final repositoryName = this.repositoryName;
    return {
      if (destinationReference != null)
        'destinationReference': destinationReference,
      if (mergeMetadata != null) 'mergeMetadata': mergeMetadata,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// Information about an update to the source branch of a pull request.
class PullRequestSourceReferenceUpdatedEventMetadata {
  /// The full commit ID of the commit in the source branch that was the tip of
  /// the branch at the time the pull request was updated.
  final String? afterCommitId;

  /// The full commit ID of the commit in the destination branch that was the tip
  /// of the branch at the time the pull request was updated.
  final String? beforeCommitId;

  /// The commit ID of the most recent commit that the source branch and the
  /// destination branch have in common.
  final String? mergeBase;

  /// The name of the repository where the pull request was updated.
  final String? repositoryName;

  PullRequestSourceReferenceUpdatedEventMetadata({
    this.afterCommitId,
    this.beforeCommitId,
    this.mergeBase,
    this.repositoryName,
  });

  factory PullRequestSourceReferenceUpdatedEventMetadata.fromJson(
      Map<String, dynamic> json) {
    return PullRequestSourceReferenceUpdatedEventMetadata(
      afterCommitId: json['afterCommitId'] as String?,
      beforeCommitId: json['beforeCommitId'] as String?,
      mergeBase: json['mergeBase'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final afterCommitId = this.afterCommitId;
    final beforeCommitId = this.beforeCommitId;
    final mergeBase = this.mergeBase;
    final repositoryName = this.repositoryName;
    return {
      if (afterCommitId != null) 'afterCommitId': afterCommitId,
      if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
      if (mergeBase != null) 'mergeBase': mergeBase,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// Information about a change to the status of a pull request.
class PullRequestStatusChangedEventMetadata {
  /// The changed status of the pull request.
  final PullRequestStatusEnum? pullRequestStatus;

  PullRequestStatusChangedEventMetadata({
    this.pullRequestStatus,
  });

  factory PullRequestStatusChangedEventMetadata.fromJson(
      Map<String, dynamic> json) {
    return PullRequestStatusChangedEventMetadata(
      pullRequestStatus:
          (json['pullRequestStatus'] as String?)?.toPullRequestStatusEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequestStatus = this.pullRequestStatus;
    return {
      if (pullRequestStatus != null)
        'pullRequestStatus': pullRequestStatus.toValue(),
    };
  }
}

enum PullRequestStatusEnum {
  open,
  closed,
}

extension PullRequestStatusEnumValueExtension on PullRequestStatusEnum {
  String toValue() {
    switch (this) {
      case PullRequestStatusEnum.open:
        return 'OPEN';
      case PullRequestStatusEnum.closed:
        return 'CLOSED';
    }
  }
}

extension PullRequestStatusEnumFromString on String {
  PullRequestStatusEnum toPullRequestStatusEnum() {
    switch (this) {
      case 'OPEN':
        return PullRequestStatusEnum.open;
      case 'CLOSED':
        return PullRequestStatusEnum.closed;
    }
    throw Exception('$this is not known in enum PullRequestStatusEnum');
  }
}

/// Returns information about a pull request target.
class PullRequestTarget {
  /// The full commit ID that is the tip of the destination branch. This is the
  /// commit where the pull request was or will be merged.
  final String? destinationCommit;

  /// The branch of the repository where the pull request changes are merged. Also
  /// known as the destination branch.
  final String? destinationReference;

  /// The commit ID of the most recent commit that the source branch and the
  /// destination branch have in common.
  final String? mergeBase;

  /// Returns metadata about the state of the merge, including whether the merge
  /// has been made.
  final MergeMetadata? mergeMetadata;

  /// The name of the repository that contains the pull request source and
  /// destination branches.
  final String? repositoryName;

  /// The full commit ID of the tip of the source branch used to create the pull
  /// request. If the pull request branch is updated by a push while the pull
  /// request is open, the commit ID changes to reflect the new tip of the branch.
  final String? sourceCommit;

  /// The branch of the repository that contains the changes for the pull request.
  /// Also known as the source branch.
  final String? sourceReference;

  PullRequestTarget({
    this.destinationCommit,
    this.destinationReference,
    this.mergeBase,
    this.mergeMetadata,
    this.repositoryName,
    this.sourceCommit,
    this.sourceReference,
  });

  factory PullRequestTarget.fromJson(Map<String, dynamic> json) {
    return PullRequestTarget(
      destinationCommit: json['destinationCommit'] as String?,
      destinationReference: json['destinationReference'] as String?,
      mergeBase: json['mergeBase'] as String?,
      mergeMetadata: json['mergeMetadata'] != null
          ? MergeMetadata.fromJson(
              json['mergeMetadata'] as Map<String, dynamic>)
          : null,
      repositoryName: json['repositoryName'] as String?,
      sourceCommit: json['sourceCommit'] as String?,
      sourceReference: json['sourceReference'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationCommit = this.destinationCommit;
    final destinationReference = this.destinationReference;
    final mergeBase = this.mergeBase;
    final mergeMetadata = this.mergeMetadata;
    final repositoryName = this.repositoryName;
    final sourceCommit = this.sourceCommit;
    final sourceReference = this.sourceReference;
    return {
      if (destinationCommit != null) 'destinationCommit': destinationCommit,
      if (destinationReference != null)
        'destinationReference': destinationReference,
      if (mergeBase != null) 'mergeBase': mergeBase,
      if (mergeMetadata != null) 'mergeMetadata': mergeMetadata,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (sourceCommit != null) 'sourceCommit': sourceCommit,
      if (sourceReference != null) 'sourceReference': sourceReference,
    };
  }
}

/// Information about a file added or updated as part of a commit.
class PutFileEntry {
  /// The full path to the file in the repository, including the name of the file.
  final String filePath;

  /// The content of the file, if a source file is not specified.
  final Uint8List? fileContent;

  /// The extrapolated file mode permissions for the file. Valid values include
  /// EXECUTABLE and NORMAL.
  final FileModeTypeEnum? fileMode;

  /// The name and full path of the file that contains the changes you want to
  /// make as part of the commit, if you are not providing the file content
  /// directly.
  final SourceFileSpecifier? sourceFile;

  PutFileEntry({
    required this.filePath,
    this.fileContent,
    this.fileMode,
    this.sourceFile,
  });

  Map<String, dynamic> toJson() {
    final filePath = this.filePath;
    final fileContent = this.fileContent;
    final fileMode = this.fileMode;
    final sourceFile = this.sourceFile;
    return {
      'filePath': filePath,
      if (fileContent != null) 'fileContent': base64Encode(fileContent),
      if (fileMode != null) 'fileMode': fileMode.toValue(),
      if (sourceFile != null) 'sourceFile': sourceFile,
    };
  }
}

class PutFileOutput {
  /// The ID of the blob, which is its SHA-1 pointer.
  final String blobId;

  /// The full SHA ID of the commit that contains this file change.
  final String commitId;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// this file change.
  final String treeId;

  PutFileOutput({
    required this.blobId,
    required this.commitId,
    required this.treeId,
  });

  factory PutFileOutput.fromJson(Map<String, dynamic> json) {
    return PutFileOutput(
      blobId: json['blobId'] as String,
      commitId: json['commitId'] as String,
      treeId: json['treeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final blobId = this.blobId;
    final commitId = this.commitId;
    final treeId = this.treeId;
    return {
      'blobId': blobId,
      'commitId': commitId,
      'treeId': treeId,
    };
  }
}

/// Represents the output of a put repository triggers operation.
class PutRepositoryTriggersOutput {
  /// The system-generated unique ID for the create or update operation.
  final String? configurationId;

  PutRepositoryTriggersOutput({
    this.configurationId,
  });

  factory PutRepositoryTriggersOutput.fromJson(Map<String, dynamic> json) {
    return PutRepositoryTriggersOutput(
      configurationId: json['configurationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationId = this.configurationId;
    return {
      if (configurationId != null) 'configurationId': configurationId,
    };
  }
}

/// Information about the reaction values provided by users on a comment.
class ReactionForComment {
  /// The reaction for a specified comment.
  final ReactionValueFormats? reaction;

  /// The Amazon Resource Names (ARNs) of users who have provided reactions to the
  /// comment.
  final List<String>? reactionUsers;

  /// A numerical count of users who reacted with the specified emoji whose
  /// identities have been subsequently deleted from IAM. While these IAM users or
  /// roles no longer exist, the reactions might still appear in total reaction
  /// counts.
  final int? reactionsFromDeletedUsersCount;

  ReactionForComment({
    this.reaction,
    this.reactionUsers,
    this.reactionsFromDeletedUsersCount,
  });

  factory ReactionForComment.fromJson(Map<String, dynamic> json) {
    return ReactionForComment(
      reaction: json['reaction'] != null
          ? ReactionValueFormats.fromJson(
              json['reaction'] as Map<String, dynamic>)
          : null,
      reactionUsers: (json['reactionUsers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      reactionsFromDeletedUsersCount:
          json['reactionsFromDeletedUsersCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final reaction = this.reaction;
    final reactionUsers = this.reactionUsers;
    final reactionsFromDeletedUsersCount = this.reactionsFromDeletedUsersCount;
    return {
      if (reaction != null) 'reaction': reaction,
      if (reactionUsers != null) 'reactionUsers': reactionUsers,
      if (reactionsFromDeletedUsersCount != null)
        'reactionsFromDeletedUsersCount': reactionsFromDeletedUsersCount,
    };
  }
}

/// Information about the values for reactions to a comment. CodeCommit supports
/// a limited set of reactions.
class ReactionValueFormats {
  /// The Emoji Version 1.0 graphic of the reaction. These graphics are
  /// interpreted slightly differently on different operating systems.
  final String? emoji;

  /// The emoji short code for the reaction. Short codes are interpreted slightly
  /// differently on different operating systems.
  final String? shortCode;

  /// The Unicode codepoint for the reaction.
  final String? unicode;

  ReactionValueFormats({
    this.emoji,
    this.shortCode,
    this.unicode,
  });

  factory ReactionValueFormats.fromJson(Map<String, dynamic> json) {
    return ReactionValueFormats(
      emoji: json['emoji'] as String?,
      shortCode: json['shortCode'] as String?,
      unicode: json['unicode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emoji = this.emoji;
    final shortCode = this.shortCode;
    final unicode = this.unicode;
    return {
      if (emoji != null) 'emoji': emoji,
      if (shortCode != null) 'shortCode': shortCode,
      if (unicode != null) 'unicode': unicode,
    };
  }
}

enum RelativeFileVersionEnum {
  before,
  after,
}

extension RelativeFileVersionEnumValueExtension on RelativeFileVersionEnum {
  String toValue() {
    switch (this) {
      case RelativeFileVersionEnum.before:
        return 'BEFORE';
      case RelativeFileVersionEnum.after:
        return 'AFTER';
    }
  }
}

extension RelativeFileVersionEnumFromString on String {
  RelativeFileVersionEnum toRelativeFileVersionEnum() {
    switch (this) {
      case 'BEFORE':
        return RelativeFileVersionEnum.before;
      case 'AFTER':
        return RelativeFileVersionEnum.after;
    }
    throw Exception('$this is not known in enum RelativeFileVersionEnum');
  }
}

/// Information about a replacement content entry in the conflict of a merge or
/// pull request operation.
class ReplaceContentEntry {
  /// The path of the conflicting file.
  final String filePath;

  /// The replacement type to use when determining how to resolve the conflict.
  final ReplacementTypeEnum replacementType;

  /// The base-64 encoded content to use when the replacement type is
  /// USE_NEW_CONTENT.
  final Uint8List? content;

  /// The file mode to apply during conflict resoltion.
  final FileModeTypeEnum? fileMode;

  ReplaceContentEntry({
    required this.filePath,
    required this.replacementType,
    this.content,
    this.fileMode,
  });

  Map<String, dynamic> toJson() {
    final filePath = this.filePath;
    final replacementType = this.replacementType;
    final content = this.content;
    final fileMode = this.fileMode;
    return {
      'filePath': filePath,
      'replacementType': replacementType.toValue(),
      if (content != null) 'content': base64Encode(content),
      if (fileMode != null) 'fileMode': fileMode.toValue(),
    };
  }
}

enum ReplacementTypeEnum {
  keepBase,
  keepSource,
  keepDestination,
  useNewContent,
}

extension ReplacementTypeEnumValueExtension on ReplacementTypeEnum {
  String toValue() {
    switch (this) {
      case ReplacementTypeEnum.keepBase:
        return 'KEEP_BASE';
      case ReplacementTypeEnum.keepSource:
        return 'KEEP_SOURCE';
      case ReplacementTypeEnum.keepDestination:
        return 'KEEP_DESTINATION';
      case ReplacementTypeEnum.useNewContent:
        return 'USE_NEW_CONTENT';
    }
  }
}

extension ReplacementTypeEnumFromString on String {
  ReplacementTypeEnum toReplacementTypeEnum() {
    switch (this) {
      case 'KEEP_BASE':
        return ReplacementTypeEnum.keepBase;
      case 'KEEP_SOURCE':
        return ReplacementTypeEnum.keepSource;
      case 'KEEP_DESTINATION':
        return ReplacementTypeEnum.keepDestination;
      case 'USE_NEW_CONTENT':
        return ReplacementTypeEnum.useNewContent;
    }
    throw Exception('$this is not known in enum ReplacementTypeEnum');
  }
}

/// Information about a repository.
class RepositoryMetadata {
  /// The Amazon Resource Name (ARN) of the repository.
  final String? arn;

  /// The ID of the Amazon Web Services account associated with the repository.
  final String? accountId;

  /// The URL to use for cloning the repository over HTTPS.
  final String? cloneUrlHttp;

  /// The URL to use for cloning the repository over SSH.
  final String? cloneUrlSsh;

  /// The date and time the repository was created, in timestamp format.
  final DateTime? creationDate;

  /// The repository's default branch name.
  final String? defaultBranch;

  /// The ID of the Key Management Service encryption key used to encrypt and
  /// decrypt the repository.
  final String? kmsKeyId;

  /// The date and time the repository was last modified, in timestamp format.
  final DateTime? lastModifiedDate;

  /// A comment or description about the repository.
  final String? repositoryDescription;

  /// The ID of the repository.
  final String? repositoryId;

  /// The repository's name.
  final String? repositoryName;

  RepositoryMetadata({
    this.arn,
    this.accountId,
    this.cloneUrlHttp,
    this.cloneUrlSsh,
    this.creationDate,
    this.defaultBranch,
    this.kmsKeyId,
    this.lastModifiedDate,
    this.repositoryDescription,
    this.repositoryId,
    this.repositoryName,
  });

  factory RepositoryMetadata.fromJson(Map<String, dynamic> json) {
    return RepositoryMetadata(
      arn: json['Arn'] as String?,
      accountId: json['accountId'] as String?,
      cloneUrlHttp: json['cloneUrlHttp'] as String?,
      cloneUrlSsh: json['cloneUrlSsh'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      defaultBranch: json['defaultBranch'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      repositoryDescription: json['repositoryDescription'] as String?,
      repositoryId: json['repositoryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final accountId = this.accountId;
    final cloneUrlHttp = this.cloneUrlHttp;
    final cloneUrlSsh = this.cloneUrlSsh;
    final creationDate = this.creationDate;
    final defaultBranch = this.defaultBranch;
    final kmsKeyId = this.kmsKeyId;
    final lastModifiedDate = this.lastModifiedDate;
    final repositoryDescription = this.repositoryDescription;
    final repositoryId = this.repositoryId;
    final repositoryName = this.repositoryName;
    return {
      if (arn != null) 'Arn': arn,
      if (accountId != null) 'accountId': accountId,
      if (cloneUrlHttp != null) 'cloneUrlHttp': cloneUrlHttp,
      if (cloneUrlSsh != null) 'cloneUrlSsh': cloneUrlSsh,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (defaultBranch != null) 'defaultBranch': defaultBranch,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (lastModifiedDate != null)
        'lastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (repositoryDescription != null)
        'repositoryDescription': repositoryDescription,
      if (repositoryId != null) 'repositoryId': repositoryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// Information about a repository name and ID.
class RepositoryNameIdPair {
  /// The ID associated with the repository.
  final String? repositoryId;

  /// The name associated with the repository.
  final String? repositoryName;

  RepositoryNameIdPair({
    this.repositoryId,
    this.repositoryName,
  });

  factory RepositoryNameIdPair.fromJson(Map<String, dynamic> json) {
    return RepositoryNameIdPair(
      repositoryId: json['repositoryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryId = this.repositoryId;
    final repositoryName = this.repositoryName;
    return {
      if (repositoryId != null) 'repositoryId': repositoryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// Information about a trigger for a repository.
/// <note>
/// If you want to receive notifications about repository events, consider using
/// notifications instead of triggers. For more information, see <a
/// href="https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-repository-email.html">Configuring
/// notifications for repository events</a>.
/// </note>
class RepositoryTrigger {
  /// The ARN of the resource that is the target for a trigger (for example, the
  /// ARN of a topic in Amazon SNS).
  final String destinationArn;

  /// The repository events that cause the trigger to run actions in another
  /// service, such as sending a notification through Amazon SNS.
  /// <note>
  /// The valid value "all" cannot be used with any other values.
  /// </note>
  final List<RepositoryTriggerEventEnum> events;

  /// The name of the trigger.
  final String name;

  /// The branches to be included in the trigger configuration. If you specify an
  /// empty array, the trigger applies to all branches.
  /// <note>
  /// Although no content is required in the array, you must include the array
  /// itself.
  /// </note>
  final List<String>? branches;

  /// Any custom data associated with the trigger to be included in the
  /// information sent to the target of the trigger.
  final String? customData;

  RepositoryTrigger({
    required this.destinationArn,
    required this.events,
    required this.name,
    this.branches,
    this.customData,
  });

  factory RepositoryTrigger.fromJson(Map<String, dynamic> json) {
    return RepositoryTrigger(
      destinationArn: json['destinationArn'] as String,
      events: (json['events'] as List)
          .whereNotNull()
          .map((e) => (e as String).toRepositoryTriggerEventEnum())
          .toList(),
      name: json['name'] as String,
      branches: (json['branches'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      customData: json['customData'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationArn = this.destinationArn;
    final events = this.events;
    final name = this.name;
    final branches = this.branches;
    final customData = this.customData;
    return {
      'destinationArn': destinationArn,
      'events': events.map((e) => e.toValue()).toList(),
      'name': name,
      if (branches != null) 'branches': branches,
      if (customData != null) 'customData': customData,
    };
  }
}

enum RepositoryTriggerEventEnum {
  all,
  updateReference,
  createReference,
  deleteReference,
}

extension RepositoryTriggerEventEnumValueExtension
    on RepositoryTriggerEventEnum {
  String toValue() {
    switch (this) {
      case RepositoryTriggerEventEnum.all:
        return 'all';
      case RepositoryTriggerEventEnum.updateReference:
        return 'updateReference';
      case RepositoryTriggerEventEnum.createReference:
        return 'createReference';
      case RepositoryTriggerEventEnum.deleteReference:
        return 'deleteReference';
    }
  }
}

extension RepositoryTriggerEventEnumFromString on String {
  RepositoryTriggerEventEnum toRepositoryTriggerEventEnum() {
    switch (this) {
      case 'all':
        return RepositoryTriggerEventEnum.all;
      case 'updateReference':
        return RepositoryTriggerEventEnum.updateReference;
      case 'createReference':
        return RepositoryTriggerEventEnum.createReference;
      case 'deleteReference':
        return RepositoryTriggerEventEnum.deleteReference;
    }
    throw Exception('$this is not known in enum RepositoryTriggerEventEnum');
  }
}

/// A trigger failed to run.
class RepositoryTriggerExecutionFailure {
  /// Message information about the trigger that did not run.
  final String? failureMessage;

  /// The name of the trigger that did not run.
  final String? trigger;

  RepositoryTriggerExecutionFailure({
    this.failureMessage,
    this.trigger,
  });

  factory RepositoryTriggerExecutionFailure.fromJson(
      Map<String, dynamic> json) {
    return RepositoryTriggerExecutionFailure(
      failureMessage: json['failureMessage'] as String?,
      trigger: json['trigger'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureMessage = this.failureMessage;
    final trigger = this.trigger;
    return {
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (trigger != null) 'trigger': trigger,
    };
  }
}

/// Information about the file mode changes.
class SetFileModeEntry {
  /// The file mode for the file.
  final FileModeTypeEnum fileMode;

  /// The full path to the file, including the name of the file.
  final String filePath;

  SetFileModeEntry({
    required this.fileMode,
    required this.filePath,
  });

  Map<String, dynamic> toJson() {
    final fileMode = this.fileMode;
    final filePath = this.filePath;
    return {
      'fileMode': fileMode.toValue(),
      'filePath': filePath,
    };
  }
}

enum SortByEnum {
  repositoryName,
  lastModifiedDate,
}

extension SortByEnumValueExtension on SortByEnum {
  String toValue() {
    switch (this) {
      case SortByEnum.repositoryName:
        return 'repositoryName';
      case SortByEnum.lastModifiedDate:
        return 'lastModifiedDate';
    }
  }
}

extension SortByEnumFromString on String {
  SortByEnum toSortByEnum() {
    switch (this) {
      case 'repositoryName':
        return SortByEnum.repositoryName;
      case 'lastModifiedDate':
        return SortByEnum.lastModifiedDate;
    }
    throw Exception('$this is not known in enum SortByEnum');
  }
}

/// Information about a source file that is part of changes made in a commit.
class SourceFileSpecifier {
  /// The full path to the file, including the name of the file.
  final String filePath;

  /// Whether to remove the source file from the parent commit.
  final bool? isMove;

  SourceFileSpecifier({
    required this.filePath,
    this.isMove,
  });

  Map<String, dynamic> toJson() {
    final filePath = this.filePath;
    final isMove = this.isMove;
    return {
      'filePath': filePath,
      if (isMove != null) 'isMove': isMove,
    };
  }
}

/// Returns information about a submodule reference in a repository folder.
class SubModule {
  /// The fully qualified path to the folder that contains the reference to the
  /// submodule.
  final String? absolutePath;

  /// The commit ID that contains the reference to the submodule.
  final String? commitId;

  /// The relative path of the submodule from the folder where the query
  /// originated.
  final String? relativePath;

  SubModule({
    this.absolutePath,
    this.commitId,
    this.relativePath,
  });

  factory SubModule.fromJson(Map<String, dynamic> json) {
    return SubModule(
      absolutePath: json['absolutePath'] as String?,
      commitId: json['commitId'] as String?,
      relativePath: json['relativePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final absolutePath = this.absolutePath;
    final commitId = this.commitId;
    final relativePath = this.relativePath;
    return {
      if (absolutePath != null) 'absolutePath': absolutePath,
      if (commitId != null) 'commitId': commitId,
      if (relativePath != null) 'relativePath': relativePath,
    };
  }
}

/// Returns information about a symbolic link in a repository folder.
class SymbolicLink {
  /// The fully qualified path to the folder that contains the symbolic link.
  final String? absolutePath;

  /// The blob ID that contains the information about the symbolic link.
  final String? blobId;

  /// The file mode permissions of the blob that cotains information about the
  /// symbolic link.
  final FileModeTypeEnum? fileMode;

  /// The relative path of the symbolic link from the folder where the query
  /// originated.
  final String? relativePath;

  SymbolicLink({
    this.absolutePath,
    this.blobId,
    this.fileMode,
    this.relativePath,
  });

  factory SymbolicLink.fromJson(Map<String, dynamic> json) {
    return SymbolicLink(
      absolutePath: json['absolutePath'] as String?,
      blobId: json['blobId'] as String?,
      fileMode: (json['fileMode'] as String?)?.toFileModeTypeEnum(),
      relativePath: json['relativePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final absolutePath = this.absolutePath;
    final blobId = this.blobId;
    final fileMode = this.fileMode;
    final relativePath = this.relativePath;
    return {
      if (absolutePath != null) 'absolutePath': absolutePath,
      if (blobId != null) 'blobId': blobId,
      if (fileMode != null) 'fileMode': fileMode.toValue(),
      if (relativePath != null) 'relativePath': relativePath,
    };
  }
}

/// Returns information about a target for a pull request.
class Target {
  /// The name of the repository that contains the pull request.
  final String repositoryName;

  /// The branch of the repository that contains the changes for the pull request.
  /// Also known as the source branch.
  final String sourceReference;

  /// The branch of the repository where the pull request changes are merged. Also
  /// known as the destination branch.
  final String? destinationReference;

  Target({
    required this.repositoryName,
    required this.sourceReference,
    this.destinationReference,
  });

  Map<String, dynamic> toJson() {
    final repositoryName = this.repositoryName;
    final sourceReference = this.sourceReference;
    final destinationReference = this.destinationReference;
    return {
      'repositoryName': repositoryName,
      'sourceReference': sourceReference,
      if (destinationReference != null)
        'destinationReference': destinationReference,
    };
  }
}

/// Represents the output of a test repository triggers operation.
class TestRepositoryTriggersOutput {
  /// The list of triggers that were not tested. This list provides the names of
  /// the triggers that could not be tested, separated by commas.
  final List<RepositoryTriggerExecutionFailure>? failedExecutions;

  /// The list of triggers that were successfully tested. This list provides the
  /// names of the triggers that were successfully tested, separated by commas.
  final List<String>? successfulExecutions;

  TestRepositoryTriggersOutput({
    this.failedExecutions,
    this.successfulExecutions,
  });

  factory TestRepositoryTriggersOutput.fromJson(Map<String, dynamic> json) {
    return TestRepositoryTriggersOutput(
      failedExecutions: (json['failedExecutions'] as List?)
          ?.whereNotNull()
          .map((e) => RepositoryTriggerExecutionFailure.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successfulExecutions: (json['successfulExecutions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedExecutions = this.failedExecutions;
    final successfulExecutions = this.successfulExecutions;
    return {
      if (failedExecutions != null) 'failedExecutions': failedExecutions,
      if (successfulExecutions != null)
        'successfulExecutions': successfulExecutions,
    };
  }
}

class UpdateApprovalRuleTemplateContentOutput {
  final ApprovalRuleTemplate approvalRuleTemplate;

  UpdateApprovalRuleTemplateContentOutput({
    required this.approvalRuleTemplate,
  });

  factory UpdateApprovalRuleTemplateContentOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateApprovalRuleTemplateContentOutput(
      approvalRuleTemplate: ApprovalRuleTemplate.fromJson(
          json['approvalRuleTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleTemplate = this.approvalRuleTemplate;
    return {
      'approvalRuleTemplate': approvalRuleTemplate,
    };
  }
}

class UpdateApprovalRuleTemplateDescriptionOutput {
  /// The structure and content of the updated approval rule template.
  final ApprovalRuleTemplate approvalRuleTemplate;

  UpdateApprovalRuleTemplateDescriptionOutput({
    required this.approvalRuleTemplate,
  });

  factory UpdateApprovalRuleTemplateDescriptionOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateApprovalRuleTemplateDescriptionOutput(
      approvalRuleTemplate: ApprovalRuleTemplate.fromJson(
          json['approvalRuleTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleTemplate = this.approvalRuleTemplate;
    return {
      'approvalRuleTemplate': approvalRuleTemplate,
    };
  }
}

class UpdateApprovalRuleTemplateNameOutput {
  /// The structure and content of the updated approval rule template.
  final ApprovalRuleTemplate approvalRuleTemplate;

  UpdateApprovalRuleTemplateNameOutput({
    required this.approvalRuleTemplate,
  });

  factory UpdateApprovalRuleTemplateNameOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateApprovalRuleTemplateNameOutput(
      approvalRuleTemplate: ApprovalRuleTemplate.fromJson(
          json['approvalRuleTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRuleTemplate = this.approvalRuleTemplate;
    return {
      'approvalRuleTemplate': approvalRuleTemplate,
    };
  }
}

class UpdateCommentOutput {
  /// Information about the updated comment.
  final Comment? comment;

  UpdateCommentOutput({
    this.comment,
  });

  factory UpdateCommentOutput.fromJson(Map<String, dynamic> json) {
    return UpdateCommentOutput(
      comment: json['comment'] != null
          ? Comment.fromJson(json['comment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    return {
      if (comment != null) 'comment': comment,
    };
  }
}

class UpdatePullRequestApprovalRuleContentOutput {
  /// Information about the updated approval rule.
  final ApprovalRule approvalRule;

  UpdatePullRequestApprovalRuleContentOutput({
    required this.approvalRule,
  });

  factory UpdatePullRequestApprovalRuleContentOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdatePullRequestApprovalRuleContentOutput(
      approvalRule:
          ApprovalRule.fromJson(json['approvalRule'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRule = this.approvalRule;
    return {
      'approvalRule': approvalRule,
    };
  }
}

class UpdatePullRequestDescriptionOutput {
  /// Information about the updated pull request.
  final PullRequest pullRequest;

  UpdatePullRequestDescriptionOutput({
    required this.pullRequest,
  });

  factory UpdatePullRequestDescriptionOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdatePullRequestDescriptionOutput(
      pullRequest:
          PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequest = this.pullRequest;
    return {
      'pullRequest': pullRequest,
    };
  }
}

class UpdatePullRequestStatusOutput {
  /// Information about the pull request.
  final PullRequest pullRequest;

  UpdatePullRequestStatusOutput({
    required this.pullRequest,
  });

  factory UpdatePullRequestStatusOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePullRequestStatusOutput(
      pullRequest:
          PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequest = this.pullRequest;
    return {
      'pullRequest': pullRequest,
    };
  }
}

class UpdatePullRequestTitleOutput {
  /// Information about the updated pull request.
  final PullRequest pullRequest;

  UpdatePullRequestTitleOutput({
    required this.pullRequest,
  });

  factory UpdatePullRequestTitleOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePullRequestTitleOutput(
      pullRequest:
          PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final pullRequest = this.pullRequest;
    return {
      'pullRequest': pullRequest,
    };
  }
}

class UpdateRepositoryEncryptionKeyOutput {
  /// The ID of the encryption key.
  final String? kmsKeyId;

  /// The ID of the encryption key formerly used to encrypt and decrypt the
  /// repository.
  final String? originalKmsKeyId;

  /// The ID of the repository.
  final String? repositoryId;

  UpdateRepositoryEncryptionKeyOutput({
    this.kmsKeyId,
    this.originalKmsKeyId,
    this.repositoryId,
  });

  factory UpdateRepositoryEncryptionKeyOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateRepositoryEncryptionKeyOutput(
      kmsKeyId: json['kmsKeyId'] as String?,
      originalKmsKeyId: json['originalKmsKeyId'] as String?,
      repositoryId: json['repositoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final originalKmsKeyId = this.originalKmsKeyId;
    final repositoryId = this.repositoryId;
    return {
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (originalKmsKeyId != null) 'originalKmsKeyId': originalKmsKeyId,
      if (repositoryId != null) 'repositoryId': repositoryId,
    };
  }
}

/// Information about the user who made a specified commit.
class UserInfo {
  /// The date when the specified commit was commited, in timestamp format with
  /// GMT offset.
  final String? date;

  /// The email address associated with the user who made the commit, if any.
  final String? email;

  /// The name of the user who made the specified commit.
  final String? name;

  UserInfo({
    this.date,
    this.email,
    this.name,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      date: json['date'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final email = this.email;
    final name = this.name;
    return {
      if (date != null) 'date': date,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
    };
  }
}

class ActorDoesNotExistException extends _s.GenericAwsException {
  ActorDoesNotExistException({String? type, String? message})
      : super(type: type, code: 'ActorDoesNotExistException', message: message);
}

class ApprovalRuleContentRequiredException extends _s.GenericAwsException {
  ApprovalRuleContentRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalRuleContentRequiredException',
            message: message);
}

class ApprovalRuleDoesNotExistException extends _s.GenericAwsException {
  ApprovalRuleDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalRuleDoesNotExistException',
            message: message);
}

class ApprovalRuleNameAlreadyExistsException extends _s.GenericAwsException {
  ApprovalRuleNameAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalRuleNameAlreadyExistsException',
            message: message);
}

class ApprovalRuleNameRequiredException extends _s.GenericAwsException {
  ApprovalRuleNameRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalRuleNameRequiredException',
            message: message);
}

class ApprovalRuleTemplateContentRequiredException
    extends _s.GenericAwsException {
  ApprovalRuleTemplateContentRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalRuleTemplateContentRequiredException',
            message: message);
}

class ApprovalRuleTemplateDoesNotExistException extends _s.GenericAwsException {
  ApprovalRuleTemplateDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalRuleTemplateDoesNotExistException',
            message: message);
}

class ApprovalRuleTemplateInUseException extends _s.GenericAwsException {
  ApprovalRuleTemplateInUseException({String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalRuleTemplateInUseException',
            message: message);
}

class ApprovalRuleTemplateNameAlreadyExistsException
    extends _s.GenericAwsException {
  ApprovalRuleTemplateNameAlreadyExistsException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalRuleTemplateNameAlreadyExistsException',
            message: message);
}

class ApprovalRuleTemplateNameRequiredException extends _s.GenericAwsException {
  ApprovalRuleTemplateNameRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalRuleTemplateNameRequiredException',
            message: message);
}

class ApprovalStateRequiredException extends _s.GenericAwsException {
  ApprovalStateRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalStateRequiredException',
            message: message);
}

class AuthorDoesNotExistException extends _s.GenericAwsException {
  AuthorDoesNotExistException({String? type, String? message})
      : super(
            type: type, code: 'AuthorDoesNotExistException', message: message);
}

class BeforeCommitIdAndAfterCommitIdAreSameException
    extends _s.GenericAwsException {
  BeforeCommitIdAndAfterCommitIdAreSameException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'BeforeCommitIdAndAfterCommitIdAreSameException',
            message: message);
}

class BlobIdDoesNotExistException extends _s.GenericAwsException {
  BlobIdDoesNotExistException({String? type, String? message})
      : super(
            type: type, code: 'BlobIdDoesNotExistException', message: message);
}

class BlobIdRequiredException extends _s.GenericAwsException {
  BlobIdRequiredException({String? type, String? message})
      : super(type: type, code: 'BlobIdRequiredException', message: message);
}

class BranchDoesNotExistException extends _s.GenericAwsException {
  BranchDoesNotExistException({String? type, String? message})
      : super(
            type: type, code: 'BranchDoesNotExistException', message: message);
}

class BranchNameExistsException extends _s.GenericAwsException {
  BranchNameExistsException({String? type, String? message})
      : super(type: type, code: 'BranchNameExistsException', message: message);
}

class BranchNameIsTagNameException extends _s.GenericAwsException {
  BranchNameIsTagNameException({String? type, String? message})
      : super(
            type: type, code: 'BranchNameIsTagNameException', message: message);
}

class BranchNameRequiredException extends _s.GenericAwsException {
  BranchNameRequiredException({String? type, String? message})
      : super(
            type: type, code: 'BranchNameRequiredException', message: message);
}

class CannotDeleteApprovalRuleFromTemplateException
    extends _s.GenericAwsException {
  CannotDeleteApprovalRuleFromTemplateException({String? type, String? message})
      : super(
            type: type,
            code: 'CannotDeleteApprovalRuleFromTemplateException',
            message: message);
}

class CannotModifyApprovalRuleFromTemplateException
    extends _s.GenericAwsException {
  CannotModifyApprovalRuleFromTemplateException({String? type, String? message})
      : super(
            type: type,
            code: 'CannotModifyApprovalRuleFromTemplateException',
            message: message);
}

class ClientRequestTokenRequiredException extends _s.GenericAwsException {
  ClientRequestTokenRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ClientRequestTokenRequiredException',
            message: message);
}

class CommentContentRequiredException extends _s.GenericAwsException {
  CommentContentRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'CommentContentRequiredException',
            message: message);
}

class CommentContentSizeLimitExceededException extends _s.GenericAwsException {
  CommentContentSizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CommentContentSizeLimitExceededException',
            message: message);
}

class CommentDeletedException extends _s.GenericAwsException {
  CommentDeletedException({String? type, String? message})
      : super(type: type, code: 'CommentDeletedException', message: message);
}

class CommentDoesNotExistException extends _s.GenericAwsException {
  CommentDoesNotExistException({String? type, String? message})
      : super(
            type: type, code: 'CommentDoesNotExistException', message: message);
}

class CommentIdRequiredException extends _s.GenericAwsException {
  CommentIdRequiredException({String? type, String? message})
      : super(type: type, code: 'CommentIdRequiredException', message: message);
}

class CommentNotCreatedByCallerException extends _s.GenericAwsException {
  CommentNotCreatedByCallerException({String? type, String? message})
      : super(
            type: type,
            code: 'CommentNotCreatedByCallerException',
            message: message);
}

class CommitDoesNotExistException extends _s.GenericAwsException {
  CommitDoesNotExistException({String? type, String? message})
      : super(
            type: type, code: 'CommitDoesNotExistException', message: message);
}

class CommitIdDoesNotExistException extends _s.GenericAwsException {
  CommitIdDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'CommitIdDoesNotExistException',
            message: message);
}

class CommitIdRequiredException extends _s.GenericAwsException {
  CommitIdRequiredException({String? type, String? message})
      : super(type: type, code: 'CommitIdRequiredException', message: message);
}

class CommitIdsLimitExceededException extends _s.GenericAwsException {
  CommitIdsLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CommitIdsLimitExceededException',
            message: message);
}

class CommitIdsListRequiredException extends _s.GenericAwsException {
  CommitIdsListRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'CommitIdsListRequiredException',
            message: message);
}

class CommitMessageLengthExceededException extends _s.GenericAwsException {
  CommitMessageLengthExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CommitMessageLengthExceededException',
            message: message);
}

class CommitRequiredException extends _s.GenericAwsException {
  CommitRequiredException({String? type, String? message})
      : super(type: type, code: 'CommitRequiredException', message: message);
}

class ConcurrentReferenceUpdateException extends _s.GenericAwsException {
  ConcurrentReferenceUpdateException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentReferenceUpdateException',
            message: message);
}

class DefaultBranchCannotBeDeletedException extends _s.GenericAwsException {
  DefaultBranchCannotBeDeletedException({String? type, String? message})
      : super(
            type: type,
            code: 'DefaultBranchCannotBeDeletedException',
            message: message);
}

class DirectoryNameConflictsWithFileNameException
    extends _s.GenericAwsException {
  DirectoryNameConflictsWithFileNameException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryNameConflictsWithFileNameException',
            message: message);
}

class EncryptionIntegrityChecksFailedException extends _s.GenericAwsException {
  EncryptionIntegrityChecksFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'EncryptionIntegrityChecksFailedException',
            message: message);
}

class EncryptionKeyAccessDeniedException extends _s.GenericAwsException {
  EncryptionKeyAccessDeniedException({String? type, String? message})
      : super(
            type: type,
            code: 'EncryptionKeyAccessDeniedException',
            message: message);
}

class EncryptionKeyDisabledException extends _s.GenericAwsException {
  EncryptionKeyDisabledException({String? type, String? message})
      : super(
            type: type,
            code: 'EncryptionKeyDisabledException',
            message: message);
}

class EncryptionKeyInvalidIdException extends _s.GenericAwsException {
  EncryptionKeyInvalidIdException({String? type, String? message})
      : super(
            type: type,
            code: 'EncryptionKeyInvalidIdException',
            message: message);
}

class EncryptionKeyInvalidUsageException extends _s.GenericAwsException {
  EncryptionKeyInvalidUsageException({String? type, String? message})
      : super(
            type: type,
            code: 'EncryptionKeyInvalidUsageException',
            message: message);
}

class EncryptionKeyNotFoundException extends _s.GenericAwsException {
  EncryptionKeyNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'EncryptionKeyNotFoundException',
            message: message);
}

class EncryptionKeyRequiredException extends _s.GenericAwsException {
  EncryptionKeyRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'EncryptionKeyRequiredException',
            message: message);
}

class EncryptionKeyUnavailableException extends _s.GenericAwsException {
  EncryptionKeyUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'EncryptionKeyUnavailableException',
            message: message);
}

class FileContentAndSourceFileSpecifiedException
    extends _s.GenericAwsException {
  FileContentAndSourceFileSpecifiedException({String? type, String? message})
      : super(
            type: type,
            code: 'FileContentAndSourceFileSpecifiedException',
            message: message);
}

class FileContentRequiredException extends _s.GenericAwsException {
  FileContentRequiredException({String? type, String? message})
      : super(
            type: type, code: 'FileContentRequiredException', message: message);
}

class FileContentSizeLimitExceededException extends _s.GenericAwsException {
  FileContentSizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'FileContentSizeLimitExceededException',
            message: message);
}

class FileDoesNotExistException extends _s.GenericAwsException {
  FileDoesNotExistException({String? type, String? message})
      : super(type: type, code: 'FileDoesNotExistException', message: message);
}

class FileEntryRequiredException extends _s.GenericAwsException {
  FileEntryRequiredException({String? type, String? message})
      : super(type: type, code: 'FileEntryRequiredException', message: message);
}

class FileModeRequiredException extends _s.GenericAwsException {
  FileModeRequiredException({String? type, String? message})
      : super(type: type, code: 'FileModeRequiredException', message: message);
}

class FileNameConflictsWithDirectoryNameException
    extends _s.GenericAwsException {
  FileNameConflictsWithDirectoryNameException({String? type, String? message})
      : super(
            type: type,
            code: 'FileNameConflictsWithDirectoryNameException',
            message: message);
}

class FilePathConflictsWithSubmodulePathException
    extends _s.GenericAwsException {
  FilePathConflictsWithSubmodulePathException({String? type, String? message})
      : super(
            type: type,
            code: 'FilePathConflictsWithSubmodulePathException',
            message: message);
}

class FileTooLargeException extends _s.GenericAwsException {
  FileTooLargeException({String? type, String? message})
      : super(type: type, code: 'FileTooLargeException', message: message);
}

class FolderContentSizeLimitExceededException extends _s.GenericAwsException {
  FolderContentSizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'FolderContentSizeLimitExceededException',
            message: message);
}

class FolderDoesNotExistException extends _s.GenericAwsException {
  FolderDoesNotExistException({String? type, String? message})
      : super(
            type: type, code: 'FolderDoesNotExistException', message: message);
}

class IdempotencyParameterMismatchException extends _s.GenericAwsException {
  IdempotencyParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotencyParameterMismatchException',
            message: message);
}

class InvalidActorArnException extends _s.GenericAwsException {
  InvalidActorArnException({String? type, String? message})
      : super(type: type, code: 'InvalidActorArnException', message: message);
}

class InvalidApprovalRuleContentException extends _s.GenericAwsException {
  InvalidApprovalRuleContentException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidApprovalRuleContentException',
            message: message);
}

class InvalidApprovalRuleNameException extends _s.GenericAwsException {
  InvalidApprovalRuleNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidApprovalRuleNameException',
            message: message);
}

class InvalidApprovalRuleTemplateContentException
    extends _s.GenericAwsException {
  InvalidApprovalRuleTemplateContentException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidApprovalRuleTemplateContentException',
            message: message);
}

class InvalidApprovalRuleTemplateDescriptionException
    extends _s.GenericAwsException {
  InvalidApprovalRuleTemplateDescriptionException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'InvalidApprovalRuleTemplateDescriptionException',
            message: message);
}

class InvalidApprovalRuleTemplateNameException extends _s.GenericAwsException {
  InvalidApprovalRuleTemplateNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidApprovalRuleTemplateNameException',
            message: message);
}

class InvalidApprovalStateException extends _s.GenericAwsException {
  InvalidApprovalStateException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidApprovalStateException',
            message: message);
}

class InvalidAuthorArnException extends _s.GenericAwsException {
  InvalidAuthorArnException({String? type, String? message})
      : super(type: type, code: 'InvalidAuthorArnException', message: message);
}

class InvalidBlobIdException extends _s.GenericAwsException {
  InvalidBlobIdException({String? type, String? message})
      : super(type: type, code: 'InvalidBlobIdException', message: message);
}

class InvalidBranchNameException extends _s.GenericAwsException {
  InvalidBranchNameException({String? type, String? message})
      : super(type: type, code: 'InvalidBranchNameException', message: message);
}

class InvalidClientRequestTokenException extends _s.GenericAwsException {
  InvalidClientRequestTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClientRequestTokenException',
            message: message);
}

class InvalidCommentIdException extends _s.GenericAwsException {
  InvalidCommentIdException({String? type, String? message})
      : super(type: type, code: 'InvalidCommentIdException', message: message);
}

class InvalidCommitException extends _s.GenericAwsException {
  InvalidCommitException({String? type, String? message})
      : super(type: type, code: 'InvalidCommitException', message: message);
}

class InvalidCommitIdException extends _s.GenericAwsException {
  InvalidCommitIdException({String? type, String? message})
      : super(type: type, code: 'InvalidCommitIdException', message: message);
}

class InvalidConflictDetailLevelException extends _s.GenericAwsException {
  InvalidConflictDetailLevelException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidConflictDetailLevelException',
            message: message);
}

class InvalidConflictResolutionException extends _s.GenericAwsException {
  InvalidConflictResolutionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidConflictResolutionException',
            message: message);
}

class InvalidConflictResolutionStrategyException
    extends _s.GenericAwsException {
  InvalidConflictResolutionStrategyException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidConflictResolutionStrategyException',
            message: message);
}

class InvalidContinuationTokenException extends _s.GenericAwsException {
  InvalidContinuationTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidContinuationTokenException',
            message: message);
}

class InvalidDeletionParameterException extends _s.GenericAwsException {
  InvalidDeletionParameterException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeletionParameterException',
            message: message);
}

class InvalidDescriptionException extends _s.GenericAwsException {
  InvalidDescriptionException({String? type, String? message})
      : super(
            type: type, code: 'InvalidDescriptionException', message: message);
}

class InvalidDestinationCommitSpecifierException
    extends _s.GenericAwsException {
  InvalidDestinationCommitSpecifierException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDestinationCommitSpecifierException',
            message: message);
}

class InvalidEmailException extends _s.GenericAwsException {
  InvalidEmailException({String? type, String? message})
      : super(type: type, code: 'InvalidEmailException', message: message);
}

class InvalidFileLocationException extends _s.GenericAwsException {
  InvalidFileLocationException({String? type, String? message})
      : super(
            type: type, code: 'InvalidFileLocationException', message: message);
}

class InvalidFileModeException extends _s.GenericAwsException {
  InvalidFileModeException({String? type, String? message})
      : super(type: type, code: 'InvalidFileModeException', message: message);
}

class InvalidFilePositionException extends _s.GenericAwsException {
  InvalidFilePositionException({String? type, String? message})
      : super(
            type: type, code: 'InvalidFilePositionException', message: message);
}

class InvalidMaxConflictFilesException extends _s.GenericAwsException {
  InvalidMaxConflictFilesException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidMaxConflictFilesException',
            message: message);
}

class InvalidMaxMergeHunksException extends _s.GenericAwsException {
  InvalidMaxMergeHunksException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidMaxMergeHunksException',
            message: message);
}

class InvalidMaxResultsException extends _s.GenericAwsException {
  InvalidMaxResultsException({String? type, String? message})
      : super(type: type, code: 'InvalidMaxResultsException', message: message);
}

class InvalidMergeOptionException extends _s.GenericAwsException {
  InvalidMergeOptionException({String? type, String? message})
      : super(
            type: type, code: 'InvalidMergeOptionException', message: message);
}

class InvalidOrderException extends _s.GenericAwsException {
  InvalidOrderException({String? type, String? message})
      : super(type: type, code: 'InvalidOrderException', message: message);
}

class InvalidOverrideStatusException extends _s.GenericAwsException {
  InvalidOverrideStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidOverrideStatusException',
            message: message);
}

class InvalidParentCommitIdException extends _s.GenericAwsException {
  InvalidParentCommitIdException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParentCommitIdException',
            message: message);
}

class InvalidPathException extends _s.GenericAwsException {
  InvalidPathException({String? type, String? message})
      : super(type: type, code: 'InvalidPathException', message: message);
}

class InvalidPullRequestEventTypeException extends _s.GenericAwsException {
  InvalidPullRequestEventTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPullRequestEventTypeException',
            message: message);
}

class InvalidPullRequestIdException extends _s.GenericAwsException {
  InvalidPullRequestIdException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPullRequestIdException',
            message: message);
}

class InvalidPullRequestStatusException extends _s.GenericAwsException {
  InvalidPullRequestStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPullRequestStatusException',
            message: message);
}

class InvalidPullRequestStatusUpdateException extends _s.GenericAwsException {
  InvalidPullRequestStatusUpdateException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPullRequestStatusUpdateException',
            message: message);
}

class InvalidReactionUserArnException extends _s.GenericAwsException {
  InvalidReactionUserArnException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidReactionUserArnException',
            message: message);
}

class InvalidReactionValueException extends _s.GenericAwsException {
  InvalidReactionValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidReactionValueException',
            message: message);
}

class InvalidReferenceNameException extends _s.GenericAwsException {
  InvalidReferenceNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidReferenceNameException',
            message: message);
}

class InvalidRelativeFileVersionEnumException extends _s.GenericAwsException {
  InvalidRelativeFileVersionEnumException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRelativeFileVersionEnumException',
            message: message);
}

class InvalidReplacementContentException extends _s.GenericAwsException {
  InvalidReplacementContentException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidReplacementContentException',
            message: message);
}

class InvalidReplacementTypeException extends _s.GenericAwsException {
  InvalidReplacementTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidReplacementTypeException',
            message: message);
}

class InvalidRepositoryDescriptionException extends _s.GenericAwsException {
  InvalidRepositoryDescriptionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRepositoryDescriptionException',
            message: message);
}

class InvalidRepositoryNameException extends _s.GenericAwsException {
  InvalidRepositoryNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRepositoryNameException',
            message: message);
}

class InvalidRepositoryTriggerBranchNameException
    extends _s.GenericAwsException {
  InvalidRepositoryTriggerBranchNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerBranchNameException',
            message: message);
}

class InvalidRepositoryTriggerCustomDataException
    extends _s.GenericAwsException {
  InvalidRepositoryTriggerCustomDataException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerCustomDataException',
            message: message);
}

class InvalidRepositoryTriggerDestinationArnException
    extends _s.GenericAwsException {
  InvalidRepositoryTriggerDestinationArnException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerDestinationArnException',
            message: message);
}

class InvalidRepositoryTriggerEventsException extends _s.GenericAwsException {
  InvalidRepositoryTriggerEventsException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerEventsException',
            message: message);
}

class InvalidRepositoryTriggerNameException extends _s.GenericAwsException {
  InvalidRepositoryTriggerNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerNameException',
            message: message);
}

class InvalidRepositoryTriggerRegionException extends _s.GenericAwsException {
  InvalidRepositoryTriggerRegionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerRegionException',
            message: message);
}

class InvalidResourceArnException extends _s.GenericAwsException {
  InvalidResourceArnException({String? type, String? message})
      : super(
            type: type, code: 'InvalidResourceArnException', message: message);
}

class InvalidRevisionIdException extends _s.GenericAwsException {
  InvalidRevisionIdException({String? type, String? message})
      : super(type: type, code: 'InvalidRevisionIdException', message: message);
}

class InvalidRuleContentSha256Exception extends _s.GenericAwsException {
  InvalidRuleContentSha256Exception({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRuleContentSha256Exception',
            message: message);
}

class InvalidSortByException extends _s.GenericAwsException {
  InvalidSortByException({String? type, String? message})
      : super(type: type, code: 'InvalidSortByException', message: message);
}

class InvalidSourceCommitSpecifierException extends _s.GenericAwsException {
  InvalidSourceCommitSpecifierException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidSourceCommitSpecifierException',
            message: message);
}

class InvalidSystemTagUsageException extends _s.GenericAwsException {
  InvalidSystemTagUsageException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidSystemTagUsageException',
            message: message);
}

class InvalidTagKeysListException extends _s.GenericAwsException {
  InvalidTagKeysListException({String? type, String? message})
      : super(
            type: type, code: 'InvalidTagKeysListException', message: message);
}

class InvalidTagsMapException extends _s.GenericAwsException {
  InvalidTagsMapException({String? type, String? message})
      : super(type: type, code: 'InvalidTagsMapException', message: message);
}

class InvalidTargetBranchException extends _s.GenericAwsException {
  InvalidTargetBranchException({String? type, String? message})
      : super(
            type: type, code: 'InvalidTargetBranchException', message: message);
}

class InvalidTargetException extends _s.GenericAwsException {
  InvalidTargetException({String? type, String? message})
      : super(type: type, code: 'InvalidTargetException', message: message);
}

class InvalidTargetsException extends _s.GenericAwsException {
  InvalidTargetsException({String? type, String? message})
      : super(type: type, code: 'InvalidTargetsException', message: message);
}

class InvalidTitleException extends _s.GenericAwsException {
  InvalidTitleException({String? type, String? message})
      : super(type: type, code: 'InvalidTitleException', message: message);
}

class ManualMergeRequiredException extends _s.GenericAwsException {
  ManualMergeRequiredException({String? type, String? message})
      : super(
            type: type, code: 'ManualMergeRequiredException', message: message);
}

class MaximumBranchesExceededException extends _s.GenericAwsException {
  MaximumBranchesExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaximumBranchesExceededException',
            message: message);
}

class MaximumConflictResolutionEntriesExceededException
    extends _s.GenericAwsException {
  MaximumConflictResolutionEntriesExceededException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'MaximumConflictResolutionEntriesExceededException',
            message: message);
}

class MaximumFileContentToLoadExceededException extends _s.GenericAwsException {
  MaximumFileContentToLoadExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaximumFileContentToLoadExceededException',
            message: message);
}

class MaximumFileEntriesExceededException extends _s.GenericAwsException {
  MaximumFileEntriesExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaximumFileEntriesExceededException',
            message: message);
}

class MaximumItemsToCompareExceededException extends _s.GenericAwsException {
  MaximumItemsToCompareExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaximumItemsToCompareExceededException',
            message: message);
}

class MaximumNumberOfApprovalsExceededException extends _s.GenericAwsException {
  MaximumNumberOfApprovalsExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaximumNumberOfApprovalsExceededException',
            message: message);
}

class MaximumOpenPullRequestsExceededException extends _s.GenericAwsException {
  MaximumOpenPullRequestsExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaximumOpenPullRequestsExceededException',
            message: message);
}

class MaximumRepositoryNamesExceededException extends _s.GenericAwsException {
  MaximumRepositoryNamesExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaximumRepositoryNamesExceededException',
            message: message);
}

class MaximumRepositoryTriggersExceededException
    extends _s.GenericAwsException {
  MaximumRepositoryTriggersExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaximumRepositoryTriggersExceededException',
            message: message);
}

class MaximumRuleTemplatesAssociatedWithRepositoryException
    extends _s.GenericAwsException {
  MaximumRuleTemplatesAssociatedWithRepositoryException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'MaximumRuleTemplatesAssociatedWithRepositoryException',
            message: message);
}

class MergeOptionRequiredException extends _s.GenericAwsException {
  MergeOptionRequiredException({String? type, String? message})
      : super(
            type: type, code: 'MergeOptionRequiredException', message: message);
}

class MultipleConflictResolutionEntriesException
    extends _s.GenericAwsException {
  MultipleConflictResolutionEntriesException({String? type, String? message})
      : super(
            type: type,
            code: 'MultipleConflictResolutionEntriesException',
            message: message);
}

class MultipleRepositoriesInPullRequestException
    extends _s.GenericAwsException {
  MultipleRepositoriesInPullRequestException({String? type, String? message})
      : super(
            type: type,
            code: 'MultipleRepositoriesInPullRequestException',
            message: message);
}

class NameLengthExceededException extends _s.GenericAwsException {
  NameLengthExceededException({String? type, String? message})
      : super(
            type: type, code: 'NameLengthExceededException', message: message);
}

class NoChangeException extends _s.GenericAwsException {
  NoChangeException({String? type, String? message})
      : super(type: type, code: 'NoChangeException', message: message);
}

class NumberOfRuleTemplatesExceededException extends _s.GenericAwsException {
  NumberOfRuleTemplatesExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'NumberOfRuleTemplatesExceededException',
            message: message);
}

class NumberOfRulesExceededException extends _s.GenericAwsException {
  NumberOfRulesExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'NumberOfRulesExceededException',
            message: message);
}

class OverrideAlreadySetException extends _s.GenericAwsException {
  OverrideAlreadySetException({String? type, String? message})
      : super(
            type: type, code: 'OverrideAlreadySetException', message: message);
}

class OverrideStatusRequiredException extends _s.GenericAwsException {
  OverrideStatusRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'OverrideStatusRequiredException',
            message: message);
}

class ParentCommitDoesNotExistException extends _s.GenericAwsException {
  ParentCommitDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'ParentCommitDoesNotExistException',
            message: message);
}

class ParentCommitIdOutdatedException extends _s.GenericAwsException {
  ParentCommitIdOutdatedException({String? type, String? message})
      : super(
            type: type,
            code: 'ParentCommitIdOutdatedException',
            message: message);
}

class ParentCommitIdRequiredException extends _s.GenericAwsException {
  ParentCommitIdRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ParentCommitIdRequiredException',
            message: message);
}

class PathDoesNotExistException extends _s.GenericAwsException {
  PathDoesNotExistException({String? type, String? message})
      : super(type: type, code: 'PathDoesNotExistException', message: message);
}

class PathRequiredException extends _s.GenericAwsException {
  PathRequiredException({String? type, String? message})
      : super(type: type, code: 'PathRequiredException', message: message);
}

class PullRequestAlreadyClosedException extends _s.GenericAwsException {
  PullRequestAlreadyClosedException({String? type, String? message})
      : super(
            type: type,
            code: 'PullRequestAlreadyClosedException',
            message: message);
}

class PullRequestApprovalRulesNotSatisfiedException
    extends _s.GenericAwsException {
  PullRequestApprovalRulesNotSatisfiedException({String? type, String? message})
      : super(
            type: type,
            code: 'PullRequestApprovalRulesNotSatisfiedException',
            message: message);
}

class PullRequestCannotBeApprovedByAuthorException
    extends _s.GenericAwsException {
  PullRequestCannotBeApprovedByAuthorException({String? type, String? message})
      : super(
            type: type,
            code: 'PullRequestCannotBeApprovedByAuthorException',
            message: message);
}

class PullRequestDoesNotExistException extends _s.GenericAwsException {
  PullRequestDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'PullRequestDoesNotExistException',
            message: message);
}

class PullRequestIdRequiredException extends _s.GenericAwsException {
  PullRequestIdRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'PullRequestIdRequiredException',
            message: message);
}

class PullRequestStatusRequiredException extends _s.GenericAwsException {
  PullRequestStatusRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'PullRequestStatusRequiredException',
            message: message);
}

class PutFileEntryConflictException extends _s.GenericAwsException {
  PutFileEntryConflictException({String? type, String? message})
      : super(
            type: type,
            code: 'PutFileEntryConflictException',
            message: message);
}

class ReactionLimitExceededException extends _s.GenericAwsException {
  ReactionLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ReactionLimitExceededException',
            message: message);
}

class ReactionValueRequiredException extends _s.GenericAwsException {
  ReactionValueRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ReactionValueRequiredException',
            message: message);
}

class ReferenceDoesNotExistException extends _s.GenericAwsException {
  ReferenceDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'ReferenceDoesNotExistException',
            message: message);
}

class ReferenceNameRequiredException extends _s.GenericAwsException {
  ReferenceNameRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ReferenceNameRequiredException',
            message: message);
}

class ReferenceTypeNotSupportedException extends _s.GenericAwsException {
  ReferenceTypeNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'ReferenceTypeNotSupportedException',
            message: message);
}

class ReplacementContentRequiredException extends _s.GenericAwsException {
  ReplacementContentRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ReplacementContentRequiredException',
            message: message);
}

class ReplacementTypeRequiredException extends _s.GenericAwsException {
  ReplacementTypeRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ReplacementTypeRequiredException',
            message: message);
}

class RepositoryDoesNotExistException extends _s.GenericAwsException {
  RepositoryDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryDoesNotExistException',
            message: message);
}

class RepositoryLimitExceededException extends _s.GenericAwsException {
  RepositoryLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryLimitExceededException',
            message: message);
}

class RepositoryNameExistsException extends _s.GenericAwsException {
  RepositoryNameExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryNameExistsException',
            message: message);
}

class RepositoryNameRequiredException extends _s.GenericAwsException {
  RepositoryNameRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryNameRequiredException',
            message: message);
}

class RepositoryNamesRequiredException extends _s.GenericAwsException {
  RepositoryNamesRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryNamesRequiredException',
            message: message);
}

class RepositoryNotAssociatedWithPullRequestException
    extends _s.GenericAwsException {
  RepositoryNotAssociatedWithPullRequestException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryNotAssociatedWithPullRequestException',
            message: message);
}

class RepositoryTriggerBranchNameListRequiredException
    extends _s.GenericAwsException {
  RepositoryTriggerBranchNameListRequiredException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryTriggerBranchNameListRequiredException',
            message: message);
}

class RepositoryTriggerDestinationArnRequiredException
    extends _s.GenericAwsException {
  RepositoryTriggerDestinationArnRequiredException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryTriggerDestinationArnRequiredException',
            message: message);
}

class RepositoryTriggerEventsListRequiredException
    extends _s.GenericAwsException {
  RepositoryTriggerEventsListRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryTriggerEventsListRequiredException',
            message: message);
}

class RepositoryTriggerNameRequiredException extends _s.GenericAwsException {
  RepositoryTriggerNameRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryTriggerNameRequiredException',
            message: message);
}

class RepositoryTriggersListRequiredException extends _s.GenericAwsException {
  RepositoryTriggersListRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryTriggersListRequiredException',
            message: message);
}

class ResourceArnRequiredException extends _s.GenericAwsException {
  ResourceArnRequiredException({String? type, String? message})
      : super(
            type: type, code: 'ResourceArnRequiredException', message: message);
}

class RestrictedSourceFileException extends _s.GenericAwsException {
  RestrictedSourceFileException({String? type, String? message})
      : super(
            type: type,
            code: 'RestrictedSourceFileException',
            message: message);
}

class RevisionIdRequiredException extends _s.GenericAwsException {
  RevisionIdRequiredException({String? type, String? message})
      : super(
            type: type, code: 'RevisionIdRequiredException', message: message);
}

class RevisionNotCurrentException extends _s.GenericAwsException {
  RevisionNotCurrentException({String? type, String? message})
      : super(
            type: type, code: 'RevisionNotCurrentException', message: message);
}

class SameFileContentException extends _s.GenericAwsException {
  SameFileContentException({String? type, String? message})
      : super(type: type, code: 'SameFileContentException', message: message);
}

class SamePathRequestException extends _s.GenericAwsException {
  SamePathRequestException({String? type, String? message})
      : super(type: type, code: 'SamePathRequestException', message: message);
}

class SourceAndDestinationAreSameException extends _s.GenericAwsException {
  SourceAndDestinationAreSameException({String? type, String? message})
      : super(
            type: type,
            code: 'SourceAndDestinationAreSameException',
            message: message);
}

class SourceFileOrContentRequiredException extends _s.GenericAwsException {
  SourceFileOrContentRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'SourceFileOrContentRequiredException',
            message: message);
}

class TagKeysListRequiredException extends _s.GenericAwsException {
  TagKeysListRequiredException({String? type, String? message})
      : super(
            type: type, code: 'TagKeysListRequiredException', message: message);
}

class TagPolicyException extends _s.GenericAwsException {
  TagPolicyException({String? type, String? message})
      : super(type: type, code: 'TagPolicyException', message: message);
}

class TagsMapRequiredException extends _s.GenericAwsException {
  TagsMapRequiredException({String? type, String? message})
      : super(type: type, code: 'TagsMapRequiredException', message: message);
}

class TargetRequiredException extends _s.GenericAwsException {
  TargetRequiredException({String? type, String? message})
      : super(type: type, code: 'TargetRequiredException', message: message);
}

class TargetsRequiredException extends _s.GenericAwsException {
  TargetsRequiredException({String? type, String? message})
      : super(type: type, code: 'TargetsRequiredException', message: message);
}

class TipOfSourceReferenceIsDifferentException extends _s.GenericAwsException {
  TipOfSourceReferenceIsDifferentException({String? type, String? message})
      : super(
            type: type,
            code: 'TipOfSourceReferenceIsDifferentException',
            message: message);
}

class TipsDivergenceExceededException extends _s.GenericAwsException {
  TipsDivergenceExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'TipsDivergenceExceededException',
            message: message);
}

class TitleRequiredException extends _s.GenericAwsException {
  TitleRequiredException({String? type, String? message})
      : super(type: type, code: 'TitleRequiredException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ActorDoesNotExistException': (type, message) =>
      ActorDoesNotExistException(type: type, message: message),
  'ApprovalRuleContentRequiredException': (type, message) =>
      ApprovalRuleContentRequiredException(type: type, message: message),
  'ApprovalRuleDoesNotExistException': (type, message) =>
      ApprovalRuleDoesNotExistException(type: type, message: message),
  'ApprovalRuleNameAlreadyExistsException': (type, message) =>
      ApprovalRuleNameAlreadyExistsException(type: type, message: message),
  'ApprovalRuleNameRequiredException': (type, message) =>
      ApprovalRuleNameRequiredException(type: type, message: message),
  'ApprovalRuleTemplateContentRequiredException': (type, message) =>
      ApprovalRuleTemplateContentRequiredException(
          type: type, message: message),
  'ApprovalRuleTemplateDoesNotExistException': (type, message) =>
      ApprovalRuleTemplateDoesNotExistException(type: type, message: message),
  'ApprovalRuleTemplateInUseException': (type, message) =>
      ApprovalRuleTemplateInUseException(type: type, message: message),
  'ApprovalRuleTemplateNameAlreadyExistsException': (type, message) =>
      ApprovalRuleTemplateNameAlreadyExistsException(
          type: type, message: message),
  'ApprovalRuleTemplateNameRequiredException': (type, message) =>
      ApprovalRuleTemplateNameRequiredException(type: type, message: message),
  'ApprovalStateRequiredException': (type, message) =>
      ApprovalStateRequiredException(type: type, message: message),
  'AuthorDoesNotExistException': (type, message) =>
      AuthorDoesNotExistException(type: type, message: message),
  'BeforeCommitIdAndAfterCommitIdAreSameException': (type, message) =>
      BeforeCommitIdAndAfterCommitIdAreSameException(
          type: type, message: message),
  'BlobIdDoesNotExistException': (type, message) =>
      BlobIdDoesNotExistException(type: type, message: message),
  'BlobIdRequiredException': (type, message) =>
      BlobIdRequiredException(type: type, message: message),
  'BranchDoesNotExistException': (type, message) =>
      BranchDoesNotExistException(type: type, message: message),
  'BranchNameExistsException': (type, message) =>
      BranchNameExistsException(type: type, message: message),
  'BranchNameIsTagNameException': (type, message) =>
      BranchNameIsTagNameException(type: type, message: message),
  'BranchNameRequiredException': (type, message) =>
      BranchNameRequiredException(type: type, message: message),
  'CannotDeleteApprovalRuleFromTemplateException': (type, message) =>
      CannotDeleteApprovalRuleFromTemplateException(
          type: type, message: message),
  'CannotModifyApprovalRuleFromTemplateException': (type, message) =>
      CannotModifyApprovalRuleFromTemplateException(
          type: type, message: message),
  'ClientRequestTokenRequiredException': (type, message) =>
      ClientRequestTokenRequiredException(type: type, message: message),
  'CommentContentRequiredException': (type, message) =>
      CommentContentRequiredException(type: type, message: message),
  'CommentContentSizeLimitExceededException': (type, message) =>
      CommentContentSizeLimitExceededException(type: type, message: message),
  'CommentDeletedException': (type, message) =>
      CommentDeletedException(type: type, message: message),
  'CommentDoesNotExistException': (type, message) =>
      CommentDoesNotExistException(type: type, message: message),
  'CommentIdRequiredException': (type, message) =>
      CommentIdRequiredException(type: type, message: message),
  'CommentNotCreatedByCallerException': (type, message) =>
      CommentNotCreatedByCallerException(type: type, message: message),
  'CommitDoesNotExistException': (type, message) =>
      CommitDoesNotExistException(type: type, message: message),
  'CommitIdDoesNotExistException': (type, message) =>
      CommitIdDoesNotExistException(type: type, message: message),
  'CommitIdRequiredException': (type, message) =>
      CommitIdRequiredException(type: type, message: message),
  'CommitIdsLimitExceededException': (type, message) =>
      CommitIdsLimitExceededException(type: type, message: message),
  'CommitIdsListRequiredException': (type, message) =>
      CommitIdsListRequiredException(type: type, message: message),
  'CommitMessageLengthExceededException': (type, message) =>
      CommitMessageLengthExceededException(type: type, message: message),
  'CommitRequiredException': (type, message) =>
      CommitRequiredException(type: type, message: message),
  'ConcurrentReferenceUpdateException': (type, message) =>
      ConcurrentReferenceUpdateException(type: type, message: message),
  'DefaultBranchCannotBeDeletedException': (type, message) =>
      DefaultBranchCannotBeDeletedException(type: type, message: message),
  'DirectoryNameConflictsWithFileNameException': (type, message) =>
      DirectoryNameConflictsWithFileNameException(type: type, message: message),
  'EncryptionIntegrityChecksFailedException': (type, message) =>
      EncryptionIntegrityChecksFailedException(type: type, message: message),
  'EncryptionKeyAccessDeniedException': (type, message) =>
      EncryptionKeyAccessDeniedException(type: type, message: message),
  'EncryptionKeyDisabledException': (type, message) =>
      EncryptionKeyDisabledException(type: type, message: message),
  'EncryptionKeyInvalidIdException': (type, message) =>
      EncryptionKeyInvalidIdException(type: type, message: message),
  'EncryptionKeyInvalidUsageException': (type, message) =>
      EncryptionKeyInvalidUsageException(type: type, message: message),
  'EncryptionKeyNotFoundException': (type, message) =>
      EncryptionKeyNotFoundException(type: type, message: message),
  'EncryptionKeyRequiredException': (type, message) =>
      EncryptionKeyRequiredException(type: type, message: message),
  'EncryptionKeyUnavailableException': (type, message) =>
      EncryptionKeyUnavailableException(type: type, message: message),
  'FileContentAndSourceFileSpecifiedException': (type, message) =>
      FileContentAndSourceFileSpecifiedException(type: type, message: message),
  'FileContentRequiredException': (type, message) =>
      FileContentRequiredException(type: type, message: message),
  'FileContentSizeLimitExceededException': (type, message) =>
      FileContentSizeLimitExceededException(type: type, message: message),
  'FileDoesNotExistException': (type, message) =>
      FileDoesNotExistException(type: type, message: message),
  'FileEntryRequiredException': (type, message) =>
      FileEntryRequiredException(type: type, message: message),
  'FileModeRequiredException': (type, message) =>
      FileModeRequiredException(type: type, message: message),
  'FileNameConflictsWithDirectoryNameException': (type, message) =>
      FileNameConflictsWithDirectoryNameException(type: type, message: message),
  'FilePathConflictsWithSubmodulePathException': (type, message) =>
      FilePathConflictsWithSubmodulePathException(type: type, message: message),
  'FileTooLargeException': (type, message) =>
      FileTooLargeException(type: type, message: message),
  'FolderContentSizeLimitExceededException': (type, message) =>
      FolderContentSizeLimitExceededException(type: type, message: message),
  'FolderDoesNotExistException': (type, message) =>
      FolderDoesNotExistException(type: type, message: message),
  'IdempotencyParameterMismatchException': (type, message) =>
      IdempotencyParameterMismatchException(type: type, message: message),
  'InvalidActorArnException': (type, message) =>
      InvalidActorArnException(type: type, message: message),
  'InvalidApprovalRuleContentException': (type, message) =>
      InvalidApprovalRuleContentException(type: type, message: message),
  'InvalidApprovalRuleNameException': (type, message) =>
      InvalidApprovalRuleNameException(type: type, message: message),
  'InvalidApprovalRuleTemplateContentException': (type, message) =>
      InvalidApprovalRuleTemplateContentException(type: type, message: message),
  'InvalidApprovalRuleTemplateDescriptionException': (type, message) =>
      InvalidApprovalRuleTemplateDescriptionException(
          type: type, message: message),
  'InvalidApprovalRuleTemplateNameException': (type, message) =>
      InvalidApprovalRuleTemplateNameException(type: type, message: message),
  'InvalidApprovalStateException': (type, message) =>
      InvalidApprovalStateException(type: type, message: message),
  'InvalidAuthorArnException': (type, message) =>
      InvalidAuthorArnException(type: type, message: message),
  'InvalidBlobIdException': (type, message) =>
      InvalidBlobIdException(type: type, message: message),
  'InvalidBranchNameException': (type, message) =>
      InvalidBranchNameException(type: type, message: message),
  'InvalidClientRequestTokenException': (type, message) =>
      InvalidClientRequestTokenException(type: type, message: message),
  'InvalidCommentIdException': (type, message) =>
      InvalidCommentIdException(type: type, message: message),
  'InvalidCommitException': (type, message) =>
      InvalidCommitException(type: type, message: message),
  'InvalidCommitIdException': (type, message) =>
      InvalidCommitIdException(type: type, message: message),
  'InvalidConflictDetailLevelException': (type, message) =>
      InvalidConflictDetailLevelException(type: type, message: message),
  'InvalidConflictResolutionException': (type, message) =>
      InvalidConflictResolutionException(type: type, message: message),
  'InvalidConflictResolutionStrategyException': (type, message) =>
      InvalidConflictResolutionStrategyException(type: type, message: message),
  'InvalidContinuationTokenException': (type, message) =>
      InvalidContinuationTokenException(type: type, message: message),
  'InvalidDeletionParameterException': (type, message) =>
      InvalidDeletionParameterException(type: type, message: message),
  'InvalidDescriptionException': (type, message) =>
      InvalidDescriptionException(type: type, message: message),
  'InvalidDestinationCommitSpecifierException': (type, message) =>
      InvalidDestinationCommitSpecifierException(type: type, message: message),
  'InvalidEmailException': (type, message) =>
      InvalidEmailException(type: type, message: message),
  'InvalidFileLocationException': (type, message) =>
      InvalidFileLocationException(type: type, message: message),
  'InvalidFileModeException': (type, message) =>
      InvalidFileModeException(type: type, message: message),
  'InvalidFilePositionException': (type, message) =>
      InvalidFilePositionException(type: type, message: message),
  'InvalidMaxConflictFilesException': (type, message) =>
      InvalidMaxConflictFilesException(type: type, message: message),
  'InvalidMaxMergeHunksException': (type, message) =>
      InvalidMaxMergeHunksException(type: type, message: message),
  'InvalidMaxResultsException': (type, message) =>
      InvalidMaxResultsException(type: type, message: message),
  'InvalidMergeOptionException': (type, message) =>
      InvalidMergeOptionException(type: type, message: message),
  'InvalidOrderException': (type, message) =>
      InvalidOrderException(type: type, message: message),
  'InvalidOverrideStatusException': (type, message) =>
      InvalidOverrideStatusException(type: type, message: message),
  'InvalidParentCommitIdException': (type, message) =>
      InvalidParentCommitIdException(type: type, message: message),
  'InvalidPathException': (type, message) =>
      InvalidPathException(type: type, message: message),
  'InvalidPullRequestEventTypeException': (type, message) =>
      InvalidPullRequestEventTypeException(type: type, message: message),
  'InvalidPullRequestIdException': (type, message) =>
      InvalidPullRequestIdException(type: type, message: message),
  'InvalidPullRequestStatusException': (type, message) =>
      InvalidPullRequestStatusException(type: type, message: message),
  'InvalidPullRequestStatusUpdateException': (type, message) =>
      InvalidPullRequestStatusUpdateException(type: type, message: message),
  'InvalidReactionUserArnException': (type, message) =>
      InvalidReactionUserArnException(type: type, message: message),
  'InvalidReactionValueException': (type, message) =>
      InvalidReactionValueException(type: type, message: message),
  'InvalidReferenceNameException': (type, message) =>
      InvalidReferenceNameException(type: type, message: message),
  'InvalidRelativeFileVersionEnumException': (type, message) =>
      InvalidRelativeFileVersionEnumException(type: type, message: message),
  'InvalidReplacementContentException': (type, message) =>
      InvalidReplacementContentException(type: type, message: message),
  'InvalidReplacementTypeException': (type, message) =>
      InvalidReplacementTypeException(type: type, message: message),
  'InvalidRepositoryDescriptionException': (type, message) =>
      InvalidRepositoryDescriptionException(type: type, message: message),
  'InvalidRepositoryNameException': (type, message) =>
      InvalidRepositoryNameException(type: type, message: message),
  'InvalidRepositoryTriggerBranchNameException': (type, message) =>
      InvalidRepositoryTriggerBranchNameException(type: type, message: message),
  'InvalidRepositoryTriggerCustomDataException': (type, message) =>
      InvalidRepositoryTriggerCustomDataException(type: type, message: message),
  'InvalidRepositoryTriggerDestinationArnException': (type, message) =>
      InvalidRepositoryTriggerDestinationArnException(
          type: type, message: message),
  'InvalidRepositoryTriggerEventsException': (type, message) =>
      InvalidRepositoryTriggerEventsException(type: type, message: message),
  'InvalidRepositoryTriggerNameException': (type, message) =>
      InvalidRepositoryTriggerNameException(type: type, message: message),
  'InvalidRepositoryTriggerRegionException': (type, message) =>
      InvalidRepositoryTriggerRegionException(type: type, message: message),
  'InvalidResourceArnException': (type, message) =>
      InvalidResourceArnException(type: type, message: message),
  'InvalidRevisionIdException': (type, message) =>
      InvalidRevisionIdException(type: type, message: message),
  'InvalidRuleContentSha256Exception': (type, message) =>
      InvalidRuleContentSha256Exception(type: type, message: message),
  'InvalidSortByException': (type, message) =>
      InvalidSortByException(type: type, message: message),
  'InvalidSourceCommitSpecifierException': (type, message) =>
      InvalidSourceCommitSpecifierException(type: type, message: message),
  'InvalidSystemTagUsageException': (type, message) =>
      InvalidSystemTagUsageException(type: type, message: message),
  'InvalidTagKeysListException': (type, message) =>
      InvalidTagKeysListException(type: type, message: message),
  'InvalidTagsMapException': (type, message) =>
      InvalidTagsMapException(type: type, message: message),
  'InvalidTargetBranchException': (type, message) =>
      InvalidTargetBranchException(type: type, message: message),
  'InvalidTargetException': (type, message) =>
      InvalidTargetException(type: type, message: message),
  'InvalidTargetsException': (type, message) =>
      InvalidTargetsException(type: type, message: message),
  'InvalidTitleException': (type, message) =>
      InvalidTitleException(type: type, message: message),
  'ManualMergeRequiredException': (type, message) =>
      ManualMergeRequiredException(type: type, message: message),
  'MaximumBranchesExceededException': (type, message) =>
      MaximumBranchesExceededException(type: type, message: message),
  'MaximumConflictResolutionEntriesExceededException': (type, message) =>
      MaximumConflictResolutionEntriesExceededException(
          type: type, message: message),
  'MaximumFileContentToLoadExceededException': (type, message) =>
      MaximumFileContentToLoadExceededException(type: type, message: message),
  'MaximumFileEntriesExceededException': (type, message) =>
      MaximumFileEntriesExceededException(type: type, message: message),
  'MaximumItemsToCompareExceededException': (type, message) =>
      MaximumItemsToCompareExceededException(type: type, message: message),
  'MaximumNumberOfApprovalsExceededException': (type, message) =>
      MaximumNumberOfApprovalsExceededException(type: type, message: message),
  'MaximumOpenPullRequestsExceededException': (type, message) =>
      MaximumOpenPullRequestsExceededException(type: type, message: message),
  'MaximumRepositoryNamesExceededException': (type, message) =>
      MaximumRepositoryNamesExceededException(type: type, message: message),
  'MaximumRepositoryTriggersExceededException': (type, message) =>
      MaximumRepositoryTriggersExceededException(type: type, message: message),
  'MaximumRuleTemplatesAssociatedWithRepositoryException': (type, message) =>
      MaximumRuleTemplatesAssociatedWithRepositoryException(
          type: type, message: message),
  'MergeOptionRequiredException': (type, message) =>
      MergeOptionRequiredException(type: type, message: message),
  'MultipleConflictResolutionEntriesException': (type, message) =>
      MultipleConflictResolutionEntriesException(type: type, message: message),
  'MultipleRepositoriesInPullRequestException': (type, message) =>
      MultipleRepositoriesInPullRequestException(type: type, message: message),
  'NameLengthExceededException': (type, message) =>
      NameLengthExceededException(type: type, message: message),
  'NoChangeException': (type, message) =>
      NoChangeException(type: type, message: message),
  'NumberOfRuleTemplatesExceededException': (type, message) =>
      NumberOfRuleTemplatesExceededException(type: type, message: message),
  'NumberOfRulesExceededException': (type, message) =>
      NumberOfRulesExceededException(type: type, message: message),
  'OverrideAlreadySetException': (type, message) =>
      OverrideAlreadySetException(type: type, message: message),
  'OverrideStatusRequiredException': (type, message) =>
      OverrideStatusRequiredException(type: type, message: message),
  'ParentCommitDoesNotExistException': (type, message) =>
      ParentCommitDoesNotExistException(type: type, message: message),
  'ParentCommitIdOutdatedException': (type, message) =>
      ParentCommitIdOutdatedException(type: type, message: message),
  'ParentCommitIdRequiredException': (type, message) =>
      ParentCommitIdRequiredException(type: type, message: message),
  'PathDoesNotExistException': (type, message) =>
      PathDoesNotExistException(type: type, message: message),
  'PathRequiredException': (type, message) =>
      PathRequiredException(type: type, message: message),
  'PullRequestAlreadyClosedException': (type, message) =>
      PullRequestAlreadyClosedException(type: type, message: message),
  'PullRequestApprovalRulesNotSatisfiedException': (type, message) =>
      PullRequestApprovalRulesNotSatisfiedException(
          type: type, message: message),
  'PullRequestCannotBeApprovedByAuthorException': (type, message) =>
      PullRequestCannotBeApprovedByAuthorException(
          type: type, message: message),
  'PullRequestDoesNotExistException': (type, message) =>
      PullRequestDoesNotExistException(type: type, message: message),
  'PullRequestIdRequiredException': (type, message) =>
      PullRequestIdRequiredException(type: type, message: message),
  'PullRequestStatusRequiredException': (type, message) =>
      PullRequestStatusRequiredException(type: type, message: message),
  'PutFileEntryConflictException': (type, message) =>
      PutFileEntryConflictException(type: type, message: message),
  'ReactionLimitExceededException': (type, message) =>
      ReactionLimitExceededException(type: type, message: message),
  'ReactionValueRequiredException': (type, message) =>
      ReactionValueRequiredException(type: type, message: message),
  'ReferenceDoesNotExistException': (type, message) =>
      ReferenceDoesNotExistException(type: type, message: message),
  'ReferenceNameRequiredException': (type, message) =>
      ReferenceNameRequiredException(type: type, message: message),
  'ReferenceTypeNotSupportedException': (type, message) =>
      ReferenceTypeNotSupportedException(type: type, message: message),
  'ReplacementContentRequiredException': (type, message) =>
      ReplacementContentRequiredException(type: type, message: message),
  'ReplacementTypeRequiredException': (type, message) =>
      ReplacementTypeRequiredException(type: type, message: message),
  'RepositoryDoesNotExistException': (type, message) =>
      RepositoryDoesNotExistException(type: type, message: message),
  'RepositoryLimitExceededException': (type, message) =>
      RepositoryLimitExceededException(type: type, message: message),
  'RepositoryNameExistsException': (type, message) =>
      RepositoryNameExistsException(type: type, message: message),
  'RepositoryNameRequiredException': (type, message) =>
      RepositoryNameRequiredException(type: type, message: message),
  'RepositoryNamesRequiredException': (type, message) =>
      RepositoryNamesRequiredException(type: type, message: message),
  'RepositoryNotAssociatedWithPullRequestException': (type, message) =>
      RepositoryNotAssociatedWithPullRequestException(
          type: type, message: message),
  'RepositoryTriggerBranchNameListRequiredException': (type, message) =>
      RepositoryTriggerBranchNameListRequiredException(
          type: type, message: message),
  'RepositoryTriggerDestinationArnRequiredException': (type, message) =>
      RepositoryTriggerDestinationArnRequiredException(
          type: type, message: message),
  'RepositoryTriggerEventsListRequiredException': (type, message) =>
      RepositoryTriggerEventsListRequiredException(
          type: type, message: message),
  'RepositoryTriggerNameRequiredException': (type, message) =>
      RepositoryTriggerNameRequiredException(type: type, message: message),
  'RepositoryTriggersListRequiredException': (type, message) =>
      RepositoryTriggersListRequiredException(type: type, message: message),
  'ResourceArnRequiredException': (type, message) =>
      ResourceArnRequiredException(type: type, message: message),
  'RestrictedSourceFileException': (type, message) =>
      RestrictedSourceFileException(type: type, message: message),
  'RevisionIdRequiredException': (type, message) =>
      RevisionIdRequiredException(type: type, message: message),
  'RevisionNotCurrentException': (type, message) =>
      RevisionNotCurrentException(type: type, message: message),
  'SameFileContentException': (type, message) =>
      SameFileContentException(type: type, message: message),
  'SamePathRequestException': (type, message) =>
      SamePathRequestException(type: type, message: message),
  'SourceAndDestinationAreSameException': (type, message) =>
      SourceAndDestinationAreSameException(type: type, message: message),
  'SourceFileOrContentRequiredException': (type, message) =>
      SourceFileOrContentRequiredException(type: type, message: message),
  'TagKeysListRequiredException': (type, message) =>
      TagKeysListRequiredException(type: type, message: message),
  'TagPolicyException': (type, message) =>
      TagPolicyException(type: type, message: message),
  'TagsMapRequiredException': (type, message) =>
      TagsMapRequiredException(type: type, message: message),
  'TargetRequiredException': (type, message) =>
      TargetRequiredException(type: type, message: message),
  'TargetsRequiredException': (type, message) =>
      TargetsRequiredException(type: type, message: message),
  'TipOfSourceReferenceIsDifferentException': (type, message) =>
      TipOfSourceReferenceIsDifferentException(type: type, message: message),
  'TipsDivergenceExceededException': (type, message) =>
      TipsDivergenceExceededException(type: type, message: message),
  'TitleRequiredException': (type, message) =>
      TitleRequiredException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
