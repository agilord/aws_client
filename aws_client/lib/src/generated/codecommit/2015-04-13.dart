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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2015-04-13.g.dart';

/// This is the <i>AWS CodeCommit API Reference</i>. This reference provides
/// descriptions of the operations and data types for AWS CodeCommit API along
/// with usage examples.
class CodeCommit {
  final _s.JsonProtocol _protocol;
  CodeCommit({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codecommit',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String approvalRuleTemplateName,
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(
        approvalRuleTemplateName, 'approvalRuleTemplateName');
    _s.validateStringLength(
      'approvalRuleTemplateName',
      approvalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'CodeCommit_20150413.AssociateApprovalRuleTemplateWithRepository'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String approvalRuleTemplateName,
    @_s.required List<String> repositoryNames,
  }) async {
    ArgumentError.checkNotNull(
        approvalRuleTemplateName, 'approvalRuleTemplateName');
    _s.validateStringLength(
      'approvalRuleTemplateName',
      approvalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryNames, 'repositoryNames');
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
    @_s.required String destinationCommitSpecifier,
    @_s.required MergeOptionTypeEnum mergeOption,
    @_s.required String repositoryName,
    @_s.required String sourceCommitSpecifier,
    ConflictDetailLevelTypeEnum conflictDetailLevel,
    ConflictResolutionStrategyTypeEnum conflictResolutionStrategy,
    List<String> filePaths,
    int maxConflictFiles,
    int maxMergeHunks,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        destinationCommitSpecifier, 'destinationCommitSpecifier');
    ArgumentError.checkNotNull(mergeOption, 'mergeOption');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceCommitSpecifier, 'sourceCommitSpecifier');
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
        'mergeOption': mergeOption?.toValue() ?? '',
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
    @_s.required String approvalRuleTemplateName,
    @_s.required List<String> repositoryNames,
  }) async {
    ArgumentError.checkNotNull(
        approvalRuleTemplateName, 'approvalRuleTemplateName');
    _s.validateStringLength(
      'approvalRuleTemplateName',
      approvalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryNames, 'repositoryNames');
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
    @_s.required List<String> commitIds,
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(commitIds, 'commitIds');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required List<String> repositoryNames,
  }) async {
    ArgumentError.checkNotNull(repositoryNames, 'repositoryNames');
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
  /// or more repositories in your AWS account. When you associate a template
  /// with a repository, AWS CodeCommit creates an approval rule that matches
  /// the conditions of the template for all pull requests that meet the
  /// conditions of the template. For more information, see
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
  /// <b>CodeCommitApprovers</b>: This option only requires an AWS account and a
  /// resource. It can be used for both IAM users and federated access users
  /// whose name matches the provided resource name. This is a very powerful
  /// option that offers a great deal of flexibility. For example, if you
  /// specify the AWS account <i>123456789012</i> and <i>Mary_Major</i>, all of
  /// the following are counted as approvals coming from that user:
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
    @_s.required String approvalRuleTemplateContent,
    @_s.required String approvalRuleTemplateName,
    String approvalRuleTemplateDescription,
  }) async {
    ArgumentError.checkNotNull(
        approvalRuleTemplateContent, 'approvalRuleTemplateContent');
    _s.validateStringLength(
      'approvalRuleTemplateContent',
      approvalRuleTemplateContent,
      1,
      3000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        approvalRuleTemplateName, 'approvalRuleTemplateName');
    _s.validateStringLength(
      'approvalRuleTemplateName',
      approvalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'approvalRuleTemplateDescription',
      approvalRuleTemplateDescription,
      0,
      1000,
    );
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
    @_s.required String branchName,
    @_s.required String commitId,
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(commitId, 'commitId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.CreateBranch'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String branchName,
    @_s.required String repositoryName,
    String authorName,
    String commitMessage,
    List<DeleteFileEntry> deleteFiles,
    String email,
    bool keepEmptyFolders,
    String parentCommitId,
    List<PutFileEntry> putFiles,
    List<SetFileModeEntry> setFileModes,
  }) async {
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
  /// The AWS SDKs prepopulate client request tokens. If you are using an AWS
  /// SDK, an idempotency token is created for you.
  /// </note>
  ///
  /// Parameter [description] :
  /// A description of the pull request.
  Future<CreatePullRequestOutput> createPullRequest({
    @_s.required List<Target> targets,
    @_s.required String title,
    String clientRequestToken,
    String description,
  }) async {
    ArgumentError.checkNotNull(targets, 'targets');
    ArgumentError.checkNotNull(title, 'title');
    _s.validateStringLength(
      'title',
      title,
      0,
      150,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      10240,
    );
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
  /// more information about approval pools, see the AWS CodeCommit User Guide.
  /// <note>
  /// When you create the content of the approval rule, you can specify
  /// approvers in an approval pool in one of two ways:
  ///
  /// <ul>
  /// <li>
  /// <b>CodeCommitApprovers</b>: This option only requires an AWS account and a
  /// resource. It can be used for both IAM users and federated access users
  /// whose name matches the provided resource name. This is a very powerful
  /// option that offers a great deal of flexibility. For example, if you
  /// specify the AWS account <i>123456789012</i> and <i>Mary_Major</i>, all of
  /// the following would be counted as approvals coming from that user:
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
    @_s.required String approvalRuleContent,
    @_s.required String approvalRuleName,
    @_s.required String pullRequestId,
  }) async {
    ArgumentError.checkNotNull(approvalRuleContent, 'approvalRuleContent');
    _s.validateStringLength(
      'approvalRuleContent',
      approvalRuleContent,
      1,
      3000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(approvalRuleName, 'approvalRuleName');
    _s.validateStringLength(
      'approvalRuleName',
      approvalRuleName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
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
  /// May throw [InvalidTagsMapException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidSystemTagUsageException].
  /// May throw [TagPolicyException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the new repository to be created.
  /// <note>
  /// The repository name must be unique across the calling AWS account.
  /// Repository names are limited to 100 alphanumeric, dash, and underscore
  /// characters, and cannot include certain characters. For more information
  /// about the limits on repository names, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html">Limits</a>
  /// in the <i>AWS CodeCommit User Guide</i>. The suffix .git is prohibited.
  /// </note>
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
    @_s.required String repositoryName,
    String repositoryDescription,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'repositoryDescription',
      repositoryDescription,
      0,
      1000,
    );
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
    @_s.required String destinationCommitSpecifier,
    @_s.required MergeOptionTypeEnum mergeOption,
    @_s.required String repositoryName,
    @_s.required String sourceCommitSpecifier,
    String authorName,
    String commitMessage,
    ConflictDetailLevelTypeEnum conflictDetailLevel,
    ConflictResolution conflictResolution,
    ConflictResolutionStrategyTypeEnum conflictResolutionStrategy,
    String email,
    bool keepEmptyFolders,
  }) async {
    ArgumentError.checkNotNull(
        destinationCommitSpecifier, 'destinationCommitSpecifier');
    ArgumentError.checkNotNull(mergeOption, 'mergeOption');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceCommitSpecifier, 'sourceCommitSpecifier');
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
        'mergeOption': mergeOption?.toValue() ?? '',
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
    @_s.required String approvalRuleTemplateName,
  }) async {
    ArgumentError.checkNotNull(
        approvalRuleTemplateName, 'approvalRuleTemplateName');
    _s.validateStringLength(
      'approvalRuleTemplateName',
      approvalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
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
    @_s.required String branchName,
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String commentId,
  }) async {
    ArgumentError.checkNotNull(commentId, 'commentId');
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
    @_s.required String branchName,
    @_s.required String filePath,
    @_s.required String parentCommitId,
    @_s.required String repositoryName,
    String commitMessage,
    String email,
    bool keepEmptyFolders,
    String name,
  }) async {
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(filePath, 'filePath');
    ArgumentError.checkNotNull(parentCommitId, 'parentCommitId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String approvalRuleName,
    @_s.required String pullRequestId,
  }) async {
    ArgumentError.checkNotNull(approvalRuleName, 'approvalRuleName');
    _s.validateStringLength(
      'approvalRuleName',
      approvalRuleName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
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
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String destinationCommitSpecifier,
    @_s.required String filePath,
    @_s.required MergeOptionTypeEnum mergeOption,
    @_s.required String repositoryName,
    @_s.required String sourceCommitSpecifier,
    ConflictDetailLevelTypeEnum conflictDetailLevel,
    ConflictResolutionStrategyTypeEnum conflictResolutionStrategy,
    int maxMergeHunks,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        destinationCommitSpecifier, 'destinationCommitSpecifier');
    ArgumentError.checkNotNull(filePath, 'filePath');
    ArgumentError.checkNotNull(mergeOption, 'mergeOption');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceCommitSpecifier, 'sourceCommitSpecifier');
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
        'mergeOption': mergeOption?.toValue() ?? '',
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
    @_s.required String pullRequestId,
    String actorArn,
    int maxResults,
    String nextToken,
    PullRequestEventType pullRequestEventType,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
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
    @_s.required String approvalRuleTemplateName,
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(
        approvalRuleTemplateName, 'approvalRuleTemplateName');
    _s.validateStringLength(
      'approvalRuleTemplateName',
      approvalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'CodeCommit_20150413.DisassociateApprovalRuleTemplateFromRepository'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String pullRequestId,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
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
    @_s.required String approvalRuleTemplateName,
  }) async {
    ArgumentError.checkNotNull(
        approvalRuleTemplateName, 'approvalRuleTemplateName');
    _s.validateStringLength(
      'approvalRuleTemplateName',
      approvalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
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
    @_s.required String blobId,
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(blobId, 'blobId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    String branchName,
    String repositoryName,
  }) async {
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      256,
    );
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
    );
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
    @_s.required String commentId,
  }) async {
    ArgumentError.checkNotNull(commentId, 'commentId');
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
    @_s.required String commentId,
    int maxResults,
    String nextToken,
    String reactionUserArn,
  }) async {
    ArgumentError.checkNotNull(commentId, 'commentId');
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
    @_s.required String afterCommitId,
    @_s.required String repositoryName,
    String beforeCommitId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(afterCommitId, 'afterCommitId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
  /// the branch at the time the comment was made.
  ///
  /// Parameter [beforeCommitId] :
  /// The full commit ID of the commit in the destination branch that was the
  /// tip of the branch at the time the pull request was created.
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
  /// The name of the repository that contains the pull request.
  Future<GetCommentsForPullRequestOutput> getCommentsForPullRequest({
    @_s.required String pullRequestId,
    String afterCommitId,
    String beforeCommitId,
    int maxResults,
    String nextToken,
    String repositoryName,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
    );
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
    @_s.required String commitId,
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(commitId, 'commitId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String afterCommitSpecifier,
    @_s.required String repositoryName,
    int maxResults,
    String nextToken,
    String afterPath,
    String beforeCommitSpecifier,
    String beforePath,
  }) async {
    ArgumentError.checkNotNull(afterCommitSpecifier, 'afterCommitSpecifier');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
  /// or a reference such as refs/heads/master. If none is provided, the head
  /// commit is used.
  Future<GetFileOutput> getFile({
    @_s.required String filePath,
    @_s.required String repositoryName,
    String commitSpecifier,
  }) async {
    ArgumentError.checkNotNull(filePath, 'filePath');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String folderPath,
    @_s.required String repositoryName,
    String commitSpecifier,
  }) async {
    ArgumentError.checkNotNull(folderPath, 'folderPath');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String destinationCommitSpecifier,
    @_s.required String repositoryName,
    @_s.required String sourceCommitSpecifier,
    ConflictDetailLevelTypeEnum conflictDetailLevel,
    ConflictResolutionStrategyTypeEnum conflictResolutionStrategy,
  }) async {
    ArgumentError.checkNotNull(
        destinationCommitSpecifier, 'destinationCommitSpecifier');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceCommitSpecifier, 'sourceCommitSpecifier');
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
    @_s.required String destinationCommitSpecifier,
    @_s.required MergeOptionTypeEnum mergeOption,
    @_s.required String repositoryName,
    @_s.required String sourceCommitSpecifier,
    ConflictDetailLevelTypeEnum conflictDetailLevel,
    ConflictResolutionStrategyTypeEnum conflictResolutionStrategy,
    int maxConflictFiles,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        destinationCommitSpecifier, 'destinationCommitSpecifier');
    ArgumentError.checkNotNull(mergeOption, 'mergeOption');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceCommitSpecifier, 'sourceCommitSpecifier');
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
        'mergeOption': mergeOption?.toValue() ?? '',
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
    @_s.required String destinationCommitSpecifier,
    @_s.required String repositoryName,
    @_s.required String sourceCommitSpecifier,
    ConflictDetailLevelTypeEnum conflictDetailLevel,
    ConflictResolutionStrategyTypeEnum conflictResolutionStrategy,
  }) async {
    ArgumentError.checkNotNull(
        destinationCommitSpecifier, 'destinationCommitSpecifier');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceCommitSpecifier, 'sourceCommitSpecifier');
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
    @_s.required String pullRequestId,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
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
    @_s.required String pullRequestId,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
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
    @_s.required String pullRequestId,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
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
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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

  /// Lists all approval rule templates in the specified AWS Region in your AWS
  /// account. If an AWS Region is not specified, the AWS Region where you are
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
    int maxResults,
    String nextToken,
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
    @_s.required String repositoryName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String repositoryName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String repositoryName,
    String authorArn,
    int maxResults,
    String nextToken,
    PullRequestStatusEnum pullRequestStatus,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
  /// client sends the token back to AWS CodeCommit, another page of 1,000
  /// records is retrieved.
  ///
  /// Parameter [order] :
  /// The order in which to sort the results of a list repositories operation.
  ///
  /// Parameter [sortBy] :
  /// The criteria used to sort the results of a list repositories operation.
  Future<ListRepositoriesOutput> listRepositories({
    String nextToken,
    OrderEnum order,
    SortByEnum sortBy,
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
    @_s.required String approvalRuleTemplateName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        approvalRuleTemplateName, 'approvalRuleTemplateName');
    _s.validateStringLength(
      'approvalRuleTemplateName',
      approvalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
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

  /// Gets information about AWS tags for a specified Amazon Resource Name (ARN)
  /// in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit
  /// Resources and Operations</a> in the<i> AWS CodeCommit User Guide</i>.
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
    @_s.required String resourceArn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    @_s.required String destinationCommitSpecifier,
    @_s.required String repositoryName,
    @_s.required String sourceCommitSpecifier,
    String targetBranch,
  }) async {
    ArgumentError.checkNotNull(
        destinationCommitSpecifier, 'destinationCommitSpecifier');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceCommitSpecifier, 'sourceCommitSpecifier');
    _s.validateStringLength(
      'targetBranch',
      targetBranch,
      1,
      256,
    );
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
    @_s.required String destinationCommitSpecifier,
    @_s.required String repositoryName,
    @_s.required String sourceCommitSpecifier,
    String authorName,
    String commitMessage,
    ConflictDetailLevelTypeEnum conflictDetailLevel,
    ConflictResolution conflictResolution,
    ConflictResolutionStrategyTypeEnum conflictResolutionStrategy,
    String email,
    bool keepEmptyFolders,
    String targetBranch,
  }) async {
    ArgumentError.checkNotNull(
        destinationCommitSpecifier, 'destinationCommitSpecifier');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceCommitSpecifier, 'sourceCommitSpecifier');
    _s.validateStringLength(
      'targetBranch',
      targetBranch,
      1,
      256,
    );
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
    @_s.required String destinationCommitSpecifier,
    @_s.required String repositoryName,
    @_s.required String sourceCommitSpecifier,
    String authorName,
    String commitMessage,
    ConflictDetailLevelTypeEnum conflictDetailLevel,
    ConflictResolution conflictResolution,
    ConflictResolutionStrategyTypeEnum conflictResolutionStrategy,
    String email,
    bool keepEmptyFolders,
    String targetBranch,
  }) async {
    ArgumentError.checkNotNull(
        destinationCommitSpecifier, 'destinationCommitSpecifier');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceCommitSpecifier, 'sourceCommitSpecifier');
    _s.validateStringLength(
      'targetBranch',
      targetBranch,
      1,
      256,
    );
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
    @_s.required String pullRequestId,
    @_s.required String repositoryName,
    String sourceCommitId,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String pullRequestId,
    @_s.required String repositoryName,
    String authorName,
    String commitMessage,
    ConflictDetailLevelTypeEnum conflictDetailLevel,
    ConflictResolution conflictResolution,
    ConflictResolutionStrategyTypeEnum conflictResolutionStrategy,
    String email,
    bool keepEmptyFolders,
    String sourceCommitId,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String pullRequestId,
    @_s.required String repositoryName,
    String authorName,
    String commitMessage,
    ConflictDetailLevelTypeEnum conflictDetailLevel,
    ConflictResolution conflictResolution,
    ConflictResolutionStrategyTypeEnum conflictResolutionStrategy,
    String email,
    bool keepEmptyFolders,
    String sourceCommitId,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required OverrideStatus overrideStatus,
    @_s.required String pullRequestId,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(overrideStatus, 'overrideStatus');
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.OverridePullRequestApprovalRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'overrideStatus': overrideStatus?.toValue() ?? '',
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
    @_s.required String afterCommitId,
    @_s.required String content,
    @_s.required String repositoryName,
    String beforeCommitId,
    String clientRequestToken,
    Location location,
  }) async {
    ArgumentError.checkNotNull(afterCommitId, 'afterCommitId');
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String afterCommitId,
    @_s.required String beforeCommitId,
    @_s.required String content,
    @_s.required String pullRequestId,
    @_s.required String repositoryName,
    String clientRequestToken,
    Location location,
  }) async {
    ArgumentError.checkNotNull(afterCommitId, 'afterCommitId');
    ArgumentError.checkNotNull(beforeCommitId, 'beforeCommitId');
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
    @_s.required String content,
    @_s.required String inReplyTo,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(inReplyTo, 'inReplyTo');
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
  /// For information about emoji reaction values supported in AWS CodeCommit,
  /// see the <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-commit-comment.html#emoji-reaction-table">AWS
  /// CodeCommit User Guide</a>.
  Future<void> putCommentReaction({
    @_s.required String commentId,
    @_s.required String reactionValue,
  }) async {
    ArgumentError.checkNotNull(commentId, 'commentId');
    ArgumentError.checkNotNull(reactionValue, 'reactionValue');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.PutCommentReaction'
    };
    final jsonResponse = await _protocol.send(
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

  /// Adds or updates a file in a branch in an AWS CodeCommit repository, and
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
    @_s.required String branchName,
    @_s.required Uint8List fileContent,
    @_s.required String filePath,
    @_s.required String repositoryName,
    String commitMessage,
    String email,
    FileModeTypeEnum fileMode,
    String name,
    String parentCommitId,
  }) async {
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(fileContent, 'fileContent');
    ArgumentError.checkNotNull(filePath, 'filePath');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
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
        'fileContent': fileContent?.let(base64Encode),
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
    @_s.required String repositoryName,
    @_s.required List<RepositoryTrigger> triggers,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(triggers, 'triggers');
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

  /// Adds or updates tags for a resource in AWS CodeCommit. For a list of valid
  /// resources in AWS CodeCommit, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit
  /// Resources and Operations</a> in the <i>AWS CodeCommit User Guide</i>.
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.TagResource'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String repositoryName,
    @_s.required List<RepositoryTrigger> triggers,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(triggers, 'triggers');
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

  /// Removes tags for a resource in AWS CodeCommit. For a list of valid
  /// resources in AWS CodeCommit, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit
  /// Resources and Operations</a> in the <i>AWS CodeCommit User Guide</i>.
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String approvalRuleTemplateName,
    @_s.required String newRuleContent,
    String existingRuleContentSha256,
  }) async {
    ArgumentError.checkNotNull(
        approvalRuleTemplateName, 'approvalRuleTemplateName');
    _s.validateStringLength(
      'approvalRuleTemplateName',
      approvalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(newRuleContent, 'newRuleContent');
    _s.validateStringLength(
      'newRuleContent',
      newRuleContent,
      1,
      3000,
      isRequired: true,
    );
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
    @_s.required String approvalRuleTemplateDescription,
    @_s.required String approvalRuleTemplateName,
  }) async {
    ArgumentError.checkNotNull(
        approvalRuleTemplateDescription, 'approvalRuleTemplateDescription');
    _s.validateStringLength(
      'approvalRuleTemplateDescription',
      approvalRuleTemplateDescription,
      0,
      1000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        approvalRuleTemplateName, 'approvalRuleTemplateName');
    _s.validateStringLength(
      'approvalRuleTemplateName',
      approvalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
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
    @_s.required String newApprovalRuleTemplateName,
    @_s.required String oldApprovalRuleTemplateName,
  }) async {
    ArgumentError.checkNotNull(
        newApprovalRuleTemplateName, 'newApprovalRuleTemplateName');
    _s.validateStringLength(
      'newApprovalRuleTemplateName',
      newApprovalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        oldApprovalRuleTemplateName, 'oldApprovalRuleTemplateName');
    _s.validateStringLength(
      'oldApprovalRuleTemplateName',
      oldApprovalRuleTemplateName,
      1,
      100,
      isRequired: true,
    );
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
    @_s.required String commentId,
    @_s.required String content,
  }) async {
    ArgumentError.checkNotNull(commentId, 'commentId');
    ArgumentError.checkNotNull(content, 'content');
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
  /// The name of the branch to set as the default.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to set or change the default branch for.
  Future<void> updateDefaultBranch({
    @_s.required String defaultBranchName,
    @_s.required String repositoryName,
  }) async {
    ArgumentError.checkNotNull(defaultBranchName, 'defaultBranchName');
    _s.validateStringLength(
      'defaultBranchName',
      defaultBranchName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdateDefaultBranch'
    };
    final jsonResponse = await _protocol.send(
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
  /// <b>CodeCommitApprovers</b>: This option only requires an AWS account and a
  /// resource. It can be used for both IAM users and federated access users
  /// whose name matches the provided resource name. This is a very powerful
  /// option that offers a great deal of flexibility. For example, if you
  /// specify the AWS account <i>123456789012</i> and <i>Mary_Major</i>, all of
  /// the following are counted as approvals coming from that user:
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
    @_s.required String approvalRuleName,
    @_s.required String newRuleContent,
    @_s.required String pullRequestId,
    String existingRuleContentSha256,
  }) async {
    ArgumentError.checkNotNull(approvalRuleName, 'approvalRuleName');
    _s.validateStringLength(
      'approvalRuleName',
      approvalRuleName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(newRuleContent, 'newRuleContent');
    _s.validateStringLength(
      'newRuleContent',
      newRuleContent,
      1,
      3000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
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
    @_s.required ApprovalState approvalState,
    @_s.required String pullRequestId,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(approvalState, 'approvalState');
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdatePullRequestApprovalState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approvalState': approvalState?.toValue() ?? '',
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
    @_s.required String description,
    @_s.required String pullRequestId,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      0,
      10240,
      isRequired: true,
    );
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
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
    @_s.required String pullRequestId,
    @_s.required PullRequestStatusEnum pullRequestStatus,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(pullRequestStatus, 'pullRequestStatus');
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
        'pullRequestStatus': pullRequestStatus?.toValue() ?? '',
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
    @_s.required String pullRequestId,
    @_s.required String title,
  }) async {
    ArgumentError.checkNotNull(pullRequestId, 'pullRequestId');
    ArgumentError.checkNotNull(title, 'title');
    _s.validateStringLength(
      'title',
      title,
      0,
      150,
      isRequired: true,
    );
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
    @_s.required String repositoryName,
    String repositoryDescription,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'repositoryDescription',
      repositoryDescription,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdateRepositoryDescription'
    };
    final jsonResponse = await _protocol.send(
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

  /// Renames a repository. The repository name must be unique across the
  /// calling AWS account. Repository names are limited to 100 alphanumeric,
  /// dash, and underscore characters, and cannot include certain characters.
  /// The suffix .git is prohibited. For more information about the limits on
  /// repository names, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html">Limits</a>
  /// in the AWS CodeCommit User Guide.
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
    @_s.required String newName,
    @_s.required String oldName,
  }) async {
    ArgumentError.checkNotNull(newName, 'newName');
    _s.validateStringLength(
      'newName',
      newName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'newName',
      newName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(oldName, 'oldName');
    _s.validateStringLength(
      'oldName',
      oldName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'oldName',
      oldName,
      r'''[\w\.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeCommit_20150413.UpdateRepositoryName'
    };
    final jsonResponse = await _protocol.send(
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Approval {
  /// The state of the approval, APPROVE or REVOKE. REVOKE states are not stored.
  @_s.JsonKey(name: 'approvalState')
  final ApprovalState approvalState;

  /// The Amazon Resource Name (ARN) of the user.
  @_s.JsonKey(name: 'userArn')
  final String userArn;

  Approval({
    this.approvalState,
    this.userArn,
  });
  factory Approval.fromJson(Map<String, dynamic> json) =>
      _$ApprovalFromJson(json);
}

/// Returns information about an approval rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApprovalRule {
  /// The content of the approval rule.
  @_s.JsonKey(name: 'approvalRuleContent')
  final String approvalRuleContent;

  /// The system-generated ID of the approval rule.
  @_s.JsonKey(name: 'approvalRuleId')
  final String approvalRuleId;

  /// The name of the approval rule.
  @_s.JsonKey(name: 'approvalRuleName')
  final String approvalRuleName;

  /// The date the approval rule was created, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The date the approval rule was most recently changed, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the user who made the most recent changes
  /// to the approval rule.
  @_s.JsonKey(name: 'lastModifiedUser')
  final String lastModifiedUser;

  /// The approval rule template used to create the rule.
  @_s.JsonKey(name: 'originApprovalRuleTemplate')
  final OriginApprovalRuleTemplate originApprovalRuleTemplate;

  /// The SHA-256 hash signature for the content of the approval rule.
  @_s.JsonKey(name: 'ruleContentSha256')
  final String ruleContentSha256;

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
  factory ApprovalRule.fromJson(Map<String, dynamic> json) =>
      _$ApprovalRuleFromJson(json);
}

/// Returns information about an event for an approval rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApprovalRuleEventMetadata {
  /// The content of the approval rule.
  @_s.JsonKey(name: 'approvalRuleContent')
  final String approvalRuleContent;

  /// The system-generated ID of the approval rule.
  @_s.JsonKey(name: 'approvalRuleId')
  final String approvalRuleId;

  /// The name of the approval rule.
  @_s.JsonKey(name: 'approvalRuleName')
  final String approvalRuleName;

  ApprovalRuleEventMetadata({
    this.approvalRuleContent,
    this.approvalRuleId,
    this.approvalRuleName,
  });
  factory ApprovalRuleEventMetadata.fromJson(Map<String, dynamic> json) =>
      _$ApprovalRuleEventMetadataFromJson(json);
}

/// Returns information about an override event for approval rules for a pull
/// request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApprovalRuleOverriddenEventMetadata {
  /// The status of the override event.
  @_s.JsonKey(name: 'overrideStatus')
  final OverrideStatus overrideStatus;

  /// The revision ID of the pull request when the override event occurred.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  ApprovalRuleOverriddenEventMetadata({
    this.overrideStatus,
    this.revisionId,
  });
  factory ApprovalRuleOverriddenEventMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$ApprovalRuleOverriddenEventMetadataFromJson(json);
}

/// Returns information about an approval rule template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApprovalRuleTemplate {
  /// The content of the approval rule template.
  @_s.JsonKey(name: 'approvalRuleTemplateContent')
  final String approvalRuleTemplateContent;

  /// The description of the approval rule template.
  @_s.JsonKey(name: 'approvalRuleTemplateDescription')
  final String approvalRuleTemplateDescription;

  /// The system-generated ID of the approval rule template.
  @_s.JsonKey(name: 'approvalRuleTemplateId')
  final String approvalRuleTemplateId;

  /// The name of the approval rule template.
  @_s.JsonKey(name: 'approvalRuleTemplateName')
  final String approvalRuleTemplateName;

  /// The date the approval rule template was created, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The date the approval rule template was most recently changed, in timestamp
  /// format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the user who made the most recent changes
  /// to the approval rule template.
  @_s.JsonKey(name: 'lastModifiedUser')
  final String lastModifiedUser;

  /// The SHA-256 hash signature for the content of the approval rule template.
  @_s.JsonKey(name: 'ruleContentSha256')
  final String ruleContentSha256;

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
  factory ApprovalRuleTemplate.fromJson(Map<String, dynamic> json) =>
      _$ApprovalRuleTemplateFromJson(json);
}

enum ApprovalState {
  @_s.JsonValue('APPROVE')
  approve,
  @_s.JsonValue('REVOKE')
  revoke,
}

extension on ApprovalState {
  String toValue() {
    switch (this) {
      case ApprovalState.approve:
        return 'APPROVE';
      case ApprovalState.revoke:
        return 'REVOKE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Returns information about a change in the approval state for a pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApprovalStateChangedEventMetadata {
  /// The approval status for the pull request.
  @_s.JsonKey(name: 'approvalStatus')
  final ApprovalState approvalStatus;

  /// The revision ID of the pull request when the approval state changed.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  ApprovalStateChangedEventMetadata({
    this.approvalStatus,
    this.revisionId,
  });
  factory ApprovalStateChangedEventMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$ApprovalStateChangedEventMetadataFromJson(json);
}

/// Returns information about errors in a
/// BatchAssociateApprovalRuleTemplateWithRepositories operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAssociateApprovalRuleTemplateWithRepositoriesError {
  /// An error code that specifies whether the repository name was not valid or
  /// not found.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// An error message that provides details about why the repository name was not
  /// found or not valid.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The name of the repository where the association was not made.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  BatchAssociateApprovalRuleTemplateWithRepositoriesError({
    this.errorCode,
    this.errorMessage,
    this.repositoryName,
  });
  factory BatchAssociateApprovalRuleTemplateWithRepositoriesError.fromJson(
          Map<String, dynamic> json) =>
      _$BatchAssociateApprovalRuleTemplateWithRepositoriesErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAssociateApprovalRuleTemplateWithRepositoriesOutput {
  /// A list of names of the repositories that have been associated with the
  /// template.
  @_s.JsonKey(name: 'associatedRepositoryNames')
  final List<String> associatedRepositoryNames;

  /// A list of any errors that might have occurred while attempting to create the
  /// association between the template and the repositories.
  @_s.JsonKey(name: 'errors')
  final List<BatchAssociateApprovalRuleTemplateWithRepositoriesError> errors;

  BatchAssociateApprovalRuleTemplateWithRepositoriesOutput({
    @_s.required this.associatedRepositoryNames,
    @_s.required this.errors,
  });
  factory BatchAssociateApprovalRuleTemplateWithRepositoriesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$BatchAssociateApprovalRuleTemplateWithRepositoriesOutputFromJson(json);
}

/// Returns information about errors in a BatchDescribeMergeConflicts operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDescribeMergeConflictsError {
  /// The name of the exception.
  @_s.JsonKey(name: 'exceptionName')
  final String exceptionName;

  /// The path to the file.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  /// The message provided by the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  BatchDescribeMergeConflictsError({
    @_s.required this.exceptionName,
    @_s.required this.filePath,
    @_s.required this.message,
  });
  factory BatchDescribeMergeConflictsError.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDescribeMergeConflictsErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDescribeMergeConflictsOutput {
  /// A list of conflicts for each file, including the conflict metadata and the
  /// hunks of the differences between the files.
  @_s.JsonKey(name: 'conflicts')
  final List<Conflict> conflicts;

  /// The commit ID of the destination commit specifier that was used in the merge
  /// evaluation.
  @_s.JsonKey(name: 'destinationCommitId')
  final String destinationCommitId;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  @_s.JsonKey(name: 'sourceCommitId')
  final String sourceCommitId;

  /// The commit ID of the merge base.
  @_s.JsonKey(name: 'baseCommitId')
  final String baseCommitId;

  /// A list of any errors returned while describing the merge conflicts for each
  /// file.
  @_s.JsonKey(name: 'errors')
  final List<BatchDescribeMergeConflictsError> errors;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  BatchDescribeMergeConflictsOutput({
    @_s.required this.conflicts,
    @_s.required this.destinationCommitId,
    @_s.required this.sourceCommitId,
    this.baseCommitId,
    this.errors,
    this.nextToken,
  });
  factory BatchDescribeMergeConflictsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDescribeMergeConflictsOutputFromJson(json);
}

/// Returns information about errors in a
/// BatchDisassociateApprovalRuleTemplateFromRepositories operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDisassociateApprovalRuleTemplateFromRepositoriesError {
  /// An error code that specifies whether the repository name was not valid or
  /// not found.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// An error message that provides details about why the repository name was
  /// either not found or not valid.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The name of the repository where the association with the template was not
  /// able to be removed.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  BatchDisassociateApprovalRuleTemplateFromRepositoriesError({
    this.errorCode,
    this.errorMessage,
    this.repositoryName,
  });
  factory BatchDisassociateApprovalRuleTemplateFromRepositoriesError.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDisassociateApprovalRuleTemplateFromRepositoriesErrorFromJson(
          json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput {
  /// A list of repository names that have had their association with the template
  /// removed.
  @_s.JsonKey(name: 'disassociatedRepositoryNames')
  final List<String> disassociatedRepositoryNames;

  /// A list of any errors that might have occurred while attempting to remove the
  /// association between the template and the repositories.
  @_s.JsonKey(name: 'errors')
  final List<BatchDisassociateApprovalRuleTemplateFromRepositoriesError> errors;

  BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput({
    @_s.required this.disassociatedRepositoryNames,
    @_s.required this.errors,
  });
  factory BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDisassociateApprovalRuleTemplateFromRepositoriesOutputFromJson(
          json);
}

/// Returns information about errors in a BatchGetCommits operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetCommitsError {
  /// A commit ID that either could not be found or was not in a valid format.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// An error code that specifies whether the commit ID was not valid or not
  /// found.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// An error message that provides detail about why the commit ID either was not
  /// found or was not valid.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  BatchGetCommitsError({
    this.commitId,
    this.errorCode,
    this.errorMessage,
  });
  factory BatchGetCommitsError.fromJson(Map<String, dynamic> json) =>
      _$BatchGetCommitsErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetCommitsOutput {
  /// An array of commit data type objects, each of which contains information
  /// about a specified commit.
  @_s.JsonKey(name: 'commits')
  final List<Commit> commits;

  /// Returns any commit IDs for which information could not be found. For
  /// example, if one of the commit IDs was a shortened SHA ID or that commit was
  /// not found in the specified repository, the ID returns an error object with
  /// more information.
  @_s.JsonKey(name: 'errors')
  final List<BatchGetCommitsError> errors;

  BatchGetCommitsOutput({
    this.commits,
    this.errors,
  });
  factory BatchGetCommitsOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetCommitsOutputFromJson(json);
}

/// Represents the output of a batch get repositories operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetRepositoriesOutput {
  /// A list of repositories returned by the batch get repositories operation.
  @_s.JsonKey(name: 'repositories')
  final List<RepositoryMetadata> repositories;

  /// Returns a list of repository names for which information could not be found.
  @_s.JsonKey(name: 'repositoriesNotFound')
  final List<String> repositoriesNotFound;

  BatchGetRepositoriesOutput({
    this.repositories,
    this.repositoriesNotFound,
  });
  factory BatchGetRepositoriesOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetRepositoriesOutputFromJson(json);
}

/// Returns information about a specific Git blob object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BlobMetadata {
  /// The full ID of the blob.
  @_s.JsonKey(name: 'blobId')
  final String blobId;

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
  @_s.JsonKey(name: 'mode')
  final String mode;

  /// The path to the blob and associated file name, if any.
  @_s.JsonKey(name: 'path')
  final String path;

  BlobMetadata({
    this.blobId,
    this.mode,
    this.path,
  });
  factory BlobMetadata.fromJson(Map<String, dynamic> json) =>
      _$BlobMetadataFromJson(json);
}

/// Returns information about a branch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BranchInfo {
  /// The name of the branch.
  @_s.JsonKey(name: 'branchName')
  final String branchName;

  /// The ID of the last commit made to the branch.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  BranchInfo({
    this.branchName,
    this.commitId,
  });
  factory BranchInfo.fromJson(Map<String, dynamic> json) =>
      _$BranchInfoFromJson(json);
}

enum ChangeTypeEnum {
  @_s.JsonValue('A')
  a,
  @_s.JsonValue('M')
  m,
  @_s.JsonValue('D')
  d,
}

/// Returns information about a specific comment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Comment {
  /// The Amazon Resource Name (ARN) of the person who posted the comment.
  @_s.JsonKey(name: 'authorArn')
  final String authorArn;

  /// The emoji reactions to a comment, if any, submitted by the user whose
  /// credentials are associated with the call to the API.
  @_s.JsonKey(name: 'callerReactions')
  final List<String> callerReactions;

  /// A unique, client-generated idempotency token that, when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter. If
  /// a request is received with the same parameters and a token is included, the
  /// request returns information about the initial request that used that token.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The system-generated comment ID.
  @_s.JsonKey(name: 'commentId')
  final String commentId;

  /// The content of the comment.
  @_s.JsonKey(name: 'content')
  final String content;

  /// The date and time the comment was created, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// A Boolean value indicating whether the comment has been deleted.
  @_s.JsonKey(name: 'deleted')
  final bool deleted;

  /// The ID of the comment for which this comment is a reply, if any.
  @_s.JsonKey(name: 'inReplyTo')
  final String inReplyTo;

  /// The date and time the comment was most recently modified, in timestamp
  /// format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// A string to integer map that represents the number of individual users who
  /// have responded to a comment with the specified reactions.
  @_s.JsonKey(name: 'reactionCounts')
  final Map<String, int> reactionCounts;

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
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

/// Returns information about comments on the comparison between two commits.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CommentsForComparedCommit {
  /// The full blob ID of the commit used to establish the after of the
  /// comparison.
  @_s.JsonKey(name: 'afterBlobId')
  final String afterBlobId;

  /// The full commit ID of the commit used to establish the after of the
  /// comparison.
  @_s.JsonKey(name: 'afterCommitId')
  final String afterCommitId;

  /// The full blob ID of the commit used to establish the before of the
  /// comparison.
  @_s.JsonKey(name: 'beforeBlobId')
  final String beforeBlobId;

  /// The full commit ID of the commit used to establish the before of the
  /// comparison.
  @_s.JsonKey(name: 'beforeCommitId')
  final String beforeCommitId;

  /// An array of comment objects. Each comment object contains information about
  /// a comment on the comparison between commits.
  @_s.JsonKey(name: 'comments')
  final List<Comment> comments;

  /// Location information about the comment on the comparison, including the file
  /// name, line number, and whether the version of the file where the comment was
  /// made is BEFORE or AFTER.
  @_s.JsonKey(name: 'location')
  final Location location;

  /// The name of the repository that contains the compared commits.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  CommentsForComparedCommit({
    this.afterBlobId,
    this.afterCommitId,
    this.beforeBlobId,
    this.beforeCommitId,
    this.comments,
    this.location,
    this.repositoryName,
  });
  factory CommentsForComparedCommit.fromJson(Map<String, dynamic> json) =>
      _$CommentsForComparedCommitFromJson(json);
}

/// Returns information about comments on a pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CommentsForPullRequest {
  /// The full blob ID of the file on which you want to comment on the source
  /// commit.
  @_s.JsonKey(name: 'afterBlobId')
  final String afterBlobId;

  /// The full commit ID of the commit that was the tip of the source branch at
  /// the time the comment was made.
  @_s.JsonKey(name: 'afterCommitId')
  final String afterCommitId;

  /// The full blob ID of the file on which you want to comment on the destination
  /// commit.
  @_s.JsonKey(name: 'beforeBlobId')
  final String beforeBlobId;

  /// The full commit ID of the commit that was the tip of the destination branch
  /// when the pull request was created. This commit is superceded by the after
  /// commit in the source branch when and if you merge the source branch into the
  /// destination branch.
  @_s.JsonKey(name: 'beforeCommitId')
  final String beforeCommitId;

  /// An array of comment objects. Each comment object contains information about
  /// a comment on the pull request.
  @_s.JsonKey(name: 'comments')
  final List<Comment> comments;

  /// Location information about the comment on the pull request, including the
  /// file name, line number, and whether the version of the file where the
  /// comment was made is BEFORE (destination branch) or AFTER (source branch).
  @_s.JsonKey(name: 'location')
  final Location location;

  /// The system-generated ID of the pull request.
  @_s.JsonKey(name: 'pullRequestId')
  final String pullRequestId;

  /// The name of the repository that contains the pull request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

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
  factory CommentsForPullRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentsForPullRequestFromJson(json);
}

/// Returns information about a specific commit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Commit {
  /// Any other data associated with the specified commit.
  @_s.JsonKey(name: 'additionalData')
  final String additionalData;

  /// Information about the author of the specified commit. Information includes
  /// the date in timestamp format with GMT offset, the name of the author, and
  /// the email address for the author, as configured in Git.
  @_s.JsonKey(name: 'author')
  final UserInfo author;

  /// The full SHA ID of the specified commit.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// Information about the person who committed the specified commit, also known
  /// as the committer. Information includes the date in timestamp format with GMT
  /// offset, the name of the committer, and the email address for the committer,
  /// as configured in Git.
  ///
  /// For more information about the difference between an author and a committer
  /// in Git, see <a href="http://git-scm.com/book/ch2-3.html">Viewing the Commit
  /// History</a> in Pro Git by Scott Chacon and Ben Straub.
  @_s.JsonKey(name: 'committer')
  final UserInfo committer;

  /// The commit message associated with the specified commit.
  @_s.JsonKey(name: 'message')
  final String message;

  /// A list of parent commits for the specified commit. Each parent commit ID is
  /// the full commit ID.
  @_s.JsonKey(name: 'parents')
  final List<String> parents;

  /// Tree information for the specified commit.
  @_s.JsonKey(name: 'treeId')
  final String treeId;

  Commit({
    this.additionalData,
    this.author,
    this.commitId,
    this.committer,
    this.message,
    this.parents,
    this.treeId,
  });
  factory Commit.fromJson(Map<String, dynamic> json) => _$CommitFromJson(json);
}

/// Information about conflicts in a merge operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Conflict {
  /// Metadata about a conflict in a merge operation.
  @_s.JsonKey(name: 'conflictMetadata')
  final ConflictMetadata conflictMetadata;

  /// A list of hunks that contain the differences between files or lines causing
  /// the conflict.
  @_s.JsonKey(name: 'mergeHunks')
  final List<MergeHunk> mergeHunks;

  Conflict({
    this.conflictMetadata,
    this.mergeHunks,
  });
  factory Conflict.fromJson(Map<String, dynamic> json) =>
      _$ConflictFromJson(json);
}

enum ConflictDetailLevelTypeEnum {
  @_s.JsonValue('FILE_LEVEL')
  fileLevel,
  @_s.JsonValue('LINE_LEVEL')
  lineLevel,
}

extension on ConflictDetailLevelTypeEnum {
  String toValue() {
    switch (this) {
      case ConflictDetailLevelTypeEnum.fileLevel:
        return 'FILE_LEVEL';
      case ConflictDetailLevelTypeEnum.lineLevel:
        return 'LINE_LEVEL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the metadata for a conflict in a merge operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConflictMetadata {
  /// A boolean value indicating whether there are conflicts in the content of a
  /// file.
  @_s.JsonKey(name: 'contentConflict')
  final bool contentConflict;

  /// A boolean value indicating whether there are conflicts in the file mode of a
  /// file.
  @_s.JsonKey(name: 'fileModeConflict')
  final bool fileModeConflict;

  /// The file modes of the file in the source, destination, and base of the
  /// merge.
  @_s.JsonKey(name: 'fileModes')
  final FileModes fileModes;

  /// The path of the file that contains conflicts.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  /// The file sizes of the file in the source, destination, and base of the
  /// merge.
  @_s.JsonKey(name: 'fileSizes')
  final FileSizes fileSizes;

  /// A boolean value (true or false) indicating whether the file is binary or
  /// textual in the source, destination, and base of the merge.
  @_s.JsonKey(name: 'isBinaryFile')
  final IsBinaryFile isBinaryFile;

  /// Whether an add, modify, or delete operation caused the conflict between the
  /// source and destination of the merge.
  @_s.JsonKey(name: 'mergeOperations')
  final MergeOperations mergeOperations;

  /// The number of conflicts, including both hunk conflicts and metadata
  /// conflicts.
  @_s.JsonKey(name: 'numberOfConflicts')
  final int numberOfConflicts;

  /// A boolean value (true or false) indicating whether there are conflicts
  /// between the branches in the object type of a file, folder, or submodule.
  @_s.JsonKey(name: 'objectTypeConflict')
  final bool objectTypeConflict;

  /// Information about any object type conflicts in a merge operation.
  @_s.JsonKey(name: 'objectTypes')
  final ObjectTypes objectTypes;

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
  factory ConflictMetadata.fromJson(Map<String, dynamic> json) =>
      _$ConflictMetadataFromJson(json);
}

/// If AUTOMERGE is the conflict resolution strategy, a list of inputs to use
/// when resolving conflicts during a merge.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConflictResolution {
  /// Files to be deleted as part of the merge conflict resolution.
  @_s.JsonKey(name: 'deleteFiles')
  final List<DeleteFileEntry> deleteFiles;

  /// Files to have content replaced as part of the merge conflict resolution.
  @_s.JsonKey(name: 'replaceContents')
  final List<ReplaceContentEntry> replaceContents;

  /// File modes that are set as part of the merge conflict resolution.
  @_s.JsonKey(name: 'setFileModes')
  final List<SetFileModeEntry> setFileModes;

  ConflictResolution({
    this.deleteFiles,
    this.replaceContents,
    this.setFileModes,
  });
  Map<String, dynamic> toJson() => _$ConflictResolutionToJson(this);
}

enum ConflictResolutionStrategyTypeEnum {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('ACCEPT_SOURCE')
  acceptSource,
  @_s.JsonValue('ACCEPT_DESTINATION')
  acceptDestination,
  @_s.JsonValue('AUTOMERGE')
  automerge,
}

extension on ConflictResolutionStrategyTypeEnum {
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApprovalRuleTemplateOutput {
  /// The content and structure of the created approval rule template.
  @_s.JsonKey(name: 'approvalRuleTemplate')
  final ApprovalRuleTemplate approvalRuleTemplate;

  CreateApprovalRuleTemplateOutput({
    @_s.required this.approvalRuleTemplate,
  });
  factory CreateApprovalRuleTemplateOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateApprovalRuleTemplateOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCommitOutput {
  /// The full commit ID of the commit that contains your committed file changes.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The files added as part of the committed file changes.
  @_s.JsonKey(name: 'filesAdded')
  final List<FileMetadata> filesAdded;

  /// The files deleted as part of the committed file changes.
  @_s.JsonKey(name: 'filesDeleted')
  final List<FileMetadata> filesDeleted;

  /// The files updated as part of the commited file changes.
  @_s.JsonKey(name: 'filesUpdated')
  final List<FileMetadata> filesUpdated;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// the commited file changes.
  @_s.JsonKey(name: 'treeId')
  final String treeId;

  CreateCommitOutput({
    this.commitId,
    this.filesAdded,
    this.filesDeleted,
    this.filesUpdated,
    this.treeId,
  });
  factory CreateCommitOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateCommitOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePullRequestApprovalRuleOutput {
  /// Information about the created approval rule.
  @_s.JsonKey(name: 'approvalRule')
  final ApprovalRule approvalRule;

  CreatePullRequestApprovalRuleOutput({
    @_s.required this.approvalRule,
  });
  factory CreatePullRequestApprovalRuleOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreatePullRequestApprovalRuleOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePullRequestOutput {
  /// Information about the newly created pull request.
  @_s.JsonKey(name: 'pullRequest')
  final PullRequest pullRequest;

  CreatePullRequestOutput({
    @_s.required this.pullRequest,
  });
  factory CreatePullRequestOutput.fromJson(Map<String, dynamic> json) =>
      _$CreatePullRequestOutputFromJson(json);
}

/// Represents the output of a create repository operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRepositoryOutput {
  /// Information about the newly created repository.
  @_s.JsonKey(name: 'repositoryMetadata')
  final RepositoryMetadata repositoryMetadata;

  CreateRepositoryOutput({
    this.repositoryMetadata,
  });
  factory CreateRepositoryOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateRepositoryOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUnreferencedMergeCommitOutput {
  /// The full commit ID of the commit that contains your merge results.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// the merge results.
  @_s.JsonKey(name: 'treeId')
  final String treeId;

  CreateUnreferencedMergeCommitOutput({
    this.commitId,
    this.treeId,
  });
  factory CreateUnreferencedMergeCommitOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateUnreferencedMergeCommitOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApprovalRuleTemplateOutput {
  /// The system-generated ID of the deleted approval rule template. If the
  /// template has been previously deleted, the only response is a 200 OK.
  @_s.JsonKey(name: 'approvalRuleTemplateId')
  final String approvalRuleTemplateId;

  DeleteApprovalRuleTemplateOutput({
    @_s.required this.approvalRuleTemplateId,
  });
  factory DeleteApprovalRuleTemplateOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteApprovalRuleTemplateOutputFromJson(json);
}

/// Represents the output of a delete branch operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBranchOutput {
  /// Information about the branch deleted by the operation, including the branch
  /// name and the commit ID that was the tip of the branch.
  @_s.JsonKey(name: 'deletedBranch')
  final BranchInfo deletedBranch;

  DeleteBranchOutput({
    this.deletedBranch,
  });
  factory DeleteBranchOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteBranchOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCommentContentOutput {
  /// Information about the comment you just deleted.
  @_s.JsonKey(name: 'comment')
  final Comment comment;

  DeleteCommentContentOutput({
    this.comment,
  });
  factory DeleteCommentContentOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteCommentContentOutputFromJson(json);
}

/// A file that is deleted as part of a commit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteFileEntry {
  /// The full path of the file to be deleted, including the name of the file.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  DeleteFileEntry({
    @_s.required this.filePath,
  });
  Map<String, dynamic> toJson() => _$DeleteFileEntryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFileOutput {
  /// The blob ID removed from the tree as part of deleting the file.
  @_s.JsonKey(name: 'blobId')
  final String blobId;

  /// The full commit ID of the commit that contains the change that deletes the
  /// file.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The fully qualified path to the file to be deleted, including the full name
  /// and extension of that file.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// the delete file change.
  @_s.JsonKey(name: 'treeId')
  final String treeId;

  DeleteFileOutput({
    @_s.required this.blobId,
    @_s.required this.commitId,
    @_s.required this.filePath,
    @_s.required this.treeId,
  });
  factory DeleteFileOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePullRequestApprovalRuleOutput {
  /// The ID of the deleted approval rule.
  /// <note>
  /// If the approval rule was deleted in an earlier API call, the response is 200
  /// OK without content.
  /// </note>
  @_s.JsonKey(name: 'approvalRuleId')
  final String approvalRuleId;

  DeletePullRequestApprovalRuleOutput({
    @_s.required this.approvalRuleId,
  });
  factory DeletePullRequestApprovalRuleOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DeletePullRequestApprovalRuleOutputFromJson(json);
}

/// Represents the output of a delete repository operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRepositoryOutput {
  /// The ID of the repository that was deleted.
  @_s.JsonKey(name: 'repositoryId')
  final String repositoryId;

  DeleteRepositoryOutput({
    this.repositoryId,
  });
  factory DeleteRepositoryOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteRepositoryOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMergeConflictsOutput {
  /// Contains metadata about the conflicts found in the merge.
  @_s.JsonKey(name: 'conflictMetadata')
  final ConflictMetadata conflictMetadata;

  /// The commit ID of the destination commit specifier that was used in the merge
  /// evaluation.
  @_s.JsonKey(name: 'destinationCommitId')
  final String destinationCommitId;

  /// A list of merge hunks of the differences between the files or lines.
  @_s.JsonKey(name: 'mergeHunks')
  final List<MergeHunk> mergeHunks;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  @_s.JsonKey(name: 'sourceCommitId')
  final String sourceCommitId;

  /// The commit ID of the merge base.
  @_s.JsonKey(name: 'baseCommitId')
  final String baseCommitId;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeMergeConflictsOutput({
    @_s.required this.conflictMetadata,
    @_s.required this.destinationCommitId,
    @_s.required this.mergeHunks,
    @_s.required this.sourceCommitId,
    this.baseCommitId,
    this.nextToken,
  });
  factory DescribeMergeConflictsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeMergeConflictsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePullRequestEventsOutput {
  /// Information about the pull request events.
  @_s.JsonKey(name: 'pullRequestEvents')
  final List<PullRequestEvent> pullRequestEvents;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribePullRequestEventsOutput({
    @_s.required this.pullRequestEvents,
    this.nextToken,
  });
  factory DescribePullRequestEventsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribePullRequestEventsOutputFromJson(json);
}

/// Returns information about a set of differences for a commit specifier.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Difference {
  /// Information about an <code>afterBlob</code> data type object, including the
  /// ID, the file mode permission code, and the path.
  @_s.JsonKey(name: 'afterBlob')
  final BlobMetadata afterBlob;

  /// Information about a <code>beforeBlob</code> data type object, including the
  /// ID, the file mode permission code, and the path.
  @_s.JsonKey(name: 'beforeBlob')
  final BlobMetadata beforeBlob;

  /// Whether the change type of the difference is an addition (A), deletion (D),
  /// or modification (M).
  @_s.JsonKey(name: 'changeType')
  final ChangeTypeEnum changeType;

  Difference({
    this.afterBlob,
    this.beforeBlob,
    this.changeType,
  });
  factory Difference.fromJson(Map<String, dynamic> json) =>
      _$DifferenceFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EvaluatePullRequestApprovalRulesOutput {
  /// The result of the evaluation, including the names of the rules whose
  /// conditions have been met (if any), the names of the rules whose conditions
  /// have not been met (if any), whether the pull request is in the approved
  /// state, and whether the pull request approval rule has been set aside by an
  /// override.
  @_s.JsonKey(name: 'evaluation')
  final Evaluation evaluation;

  EvaluatePullRequestApprovalRulesOutput({
    @_s.required this.evaluation,
  });
  factory EvaluatePullRequestApprovalRulesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$EvaluatePullRequestApprovalRulesOutputFromJson(json);
}

/// Returns information about the approval rules applied to a pull request and
/// whether conditions have been met.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Evaluation {
  /// The names of the approval rules that have not had their conditions met.
  @_s.JsonKey(name: 'approvalRulesNotSatisfied')
  final List<String> approvalRulesNotSatisfied;

  /// The names of the approval rules that have had their conditions met.
  @_s.JsonKey(name: 'approvalRulesSatisfied')
  final List<String> approvalRulesSatisfied;

  /// Whether the state of the pull request is approved.
  @_s.JsonKey(name: 'approved')
  final bool approved;

  /// Whether the approval rule requirements for the pull request have been
  /// overridden and no longer need to be met.
  @_s.JsonKey(name: 'overridden')
  final bool overridden;

  Evaluation({
    this.approvalRulesNotSatisfied,
    this.approvalRulesSatisfied,
    this.approved,
    this.overridden,
  });
  factory Evaluation.fromJson(Map<String, dynamic> json) =>
      _$EvaluationFromJson(json);
}

/// Returns information about a file in a repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class File {
  /// The fully qualified path to the file in the repository.
  @_s.JsonKey(name: 'absolutePath')
  final String absolutePath;

  /// The blob ID that contains the file information.
  @_s.JsonKey(name: 'blobId')
  final String blobId;

  /// The extrapolated file mode permissions for the file. Valid values include
  /// EXECUTABLE and NORMAL.
  @_s.JsonKey(name: 'fileMode')
  final FileModeTypeEnum fileMode;

  /// The relative path of the file from the folder where the query originated.
  @_s.JsonKey(name: 'relativePath')
  final String relativePath;

  File({
    this.absolutePath,
    this.blobId,
    this.fileMode,
    this.relativePath,
  });
  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
}

/// A file to be added, updated, or deleted as part of a commit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FileMetadata {
  /// The full path to the file to be added or updated, including the name of the
  /// file.
  @_s.JsonKey(name: 'absolutePath')
  final String absolutePath;

  /// The blob ID that contains the file information.
  @_s.JsonKey(name: 'blobId')
  final String blobId;

  /// The extrapolated file mode permissions for the file. Valid values include
  /// EXECUTABLE and NORMAL.
  @_s.JsonKey(name: 'fileMode')
  final FileModeTypeEnum fileMode;

  FileMetadata({
    this.absolutePath,
    this.blobId,
    this.fileMode,
  });
  factory FileMetadata.fromJson(Map<String, dynamic> json) =>
      _$FileMetadataFromJson(json);
}

enum FileModeTypeEnum {
  @_s.JsonValue('EXECUTABLE')
  executable,
  @_s.JsonValue('NORMAL')
  normal,
  @_s.JsonValue('SYMLINK')
  symlink,
}

extension on FileModeTypeEnum {
  String toValue() {
    switch (this) {
      case FileModeTypeEnum.executable:
        return 'EXECUTABLE';
      case FileModeTypeEnum.normal:
        return 'NORMAL';
      case FileModeTypeEnum.symlink:
        return 'SYMLINK';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about file modes in a merge or pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FileModes {
  /// The file mode of a file in the base of a merge or pull request.
  @_s.JsonKey(name: 'base')
  final FileModeTypeEnum base;

  /// The file mode of a file in the destination of a merge or pull request.
  @_s.JsonKey(name: 'destination')
  final FileModeTypeEnum destination;

  /// The file mode of a file in the source of a merge or pull request.
  @_s.JsonKey(name: 'source')
  final FileModeTypeEnum source;

  FileModes({
    this.base,
    this.destination,
    this.source,
  });
  factory FileModes.fromJson(Map<String, dynamic> json) =>
      _$FileModesFromJson(json);
}

/// Information about the size of files in a merge or pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FileSizes {
  /// The size of a file in the base of a merge or pull request.
  @_s.JsonKey(name: 'base')
  final int base;

  /// The size of a file in the destination of a merge or pull request.
  @_s.JsonKey(name: 'destination')
  final int destination;

  /// The size of a file in the source of a merge or pull request.
  @_s.JsonKey(name: 'source')
  final int source;

  FileSizes({
    this.base,
    this.destination,
    this.source,
  });
  factory FileSizes.fromJson(Map<String, dynamic> json) =>
      _$FileSizesFromJson(json);
}

/// Returns information about a folder in a repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Folder {
  /// The fully qualified path of the folder in the repository.
  @_s.JsonKey(name: 'absolutePath')
  final String absolutePath;

  /// The relative path of the specified folder from the folder where the query
  /// originated.
  @_s.JsonKey(name: 'relativePath')
  final String relativePath;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// the folder.
  @_s.JsonKey(name: 'treeId')
  final String treeId;

  Folder({
    this.absolutePath,
    this.relativePath,
    this.treeId,
  });
  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApprovalRuleTemplateOutput {
  /// The content and structure of the approval rule template.
  @_s.JsonKey(name: 'approvalRuleTemplate')
  final ApprovalRuleTemplate approvalRuleTemplate;

  GetApprovalRuleTemplateOutput({
    @_s.required this.approvalRuleTemplate,
  });
  factory GetApprovalRuleTemplateOutput.fromJson(Map<String, dynamic> json) =>
      _$GetApprovalRuleTemplateOutputFromJson(json);
}

/// Represents the output of a get blob operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBlobOutput {
  /// The content of the blob, usually a file.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'content')
  final Uint8List content;

  GetBlobOutput({
    @_s.required this.content,
  });
  factory GetBlobOutput.fromJson(Map<String, dynamic> json) =>
      _$GetBlobOutputFromJson(json);
}

/// Represents the output of a get branch operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBranchOutput {
  /// The name of the branch.
  @_s.JsonKey(name: 'branch')
  final BranchInfo branch;

  GetBranchOutput({
    this.branch,
  });
  factory GetBranchOutput.fromJson(Map<String, dynamic> json) =>
      _$GetBranchOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCommentOutput {
  /// The contents of the comment.
  @_s.JsonKey(name: 'comment')
  final Comment comment;

  GetCommentOutput({
    this.comment,
  });
  factory GetCommentOutput.fromJson(Map<String, dynamic> json) =>
      _$GetCommentOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCommentReactionsOutput {
  /// An array of reactions to the specified comment.
  @_s.JsonKey(name: 'reactionsForComment')
  final List<ReactionForComment> reactionsForComment;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetCommentReactionsOutput({
    @_s.required this.reactionsForComment,
    this.nextToken,
  });
  factory GetCommentReactionsOutput.fromJson(Map<String, dynamic> json) =>
      _$GetCommentReactionsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCommentsForComparedCommitOutput {
  /// A list of comment objects on the compared commit.
  @_s.JsonKey(name: 'commentsForComparedCommitData')
  final List<CommentsForComparedCommit> commentsForComparedCommitData;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetCommentsForComparedCommitOutput({
    this.commentsForComparedCommitData,
    this.nextToken,
  });
  factory GetCommentsForComparedCommitOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetCommentsForComparedCommitOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCommentsForPullRequestOutput {
  /// An array of comment objects on the pull request.
  @_s.JsonKey(name: 'commentsForPullRequestData')
  final List<CommentsForPullRequest> commentsForPullRequestData;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetCommentsForPullRequestOutput({
    this.commentsForPullRequestData,
    this.nextToken,
  });
  factory GetCommentsForPullRequestOutput.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsForPullRequestOutputFromJson(json);
}

/// Represents the output of a get commit operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCommitOutput {
  /// A commit data type object that contains information about the specified
  /// commit.
  @_s.JsonKey(name: 'commit')
  final Commit commit;

  GetCommitOutput({
    @_s.required this.commit,
  });
  factory GetCommitOutput.fromJson(Map<String, dynamic> json) =>
      _$GetCommitOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDifferencesOutput {
  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A data type object that contains information about the differences,
  /// including whether the difference is added, modified, or deleted (A, D, M).
  @_s.JsonKey(name: 'differences')
  final List<Difference> differences;

  GetDifferencesOutput({
    this.nextToken,
    this.differences,
  });
  factory GetDifferencesOutput.fromJson(Map<String, dynamic> json) =>
      _$GetDifferencesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFileOutput {
  /// The blob ID of the object that represents the file content.
  @_s.JsonKey(name: 'blobId')
  final String blobId;

  /// The full commit ID of the commit that contains the content returned by
  /// GetFile.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The base-64 encoded binary data object that represents the content of the
  /// file.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'fileContent')
  final Uint8List fileContent;

  /// The extrapolated file mode permissions of the blob. Valid values include
  /// strings such as EXECUTABLE and not numeric values.
  /// <note>
  /// The file mode permissions returned by this API are not the standard file
  /// mode permission values, such as 100644, but rather extrapolated values. See
  /// the supported return values.
  /// </note>
  @_s.JsonKey(name: 'fileMode')
  final FileModeTypeEnum fileMode;

  /// The fully qualified path to the specified file. Returns the name and
  /// extension of the file.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  /// The size of the contents of the file, in bytes.
  @_s.JsonKey(name: 'fileSize')
  final int fileSize;

  GetFileOutput({
    @_s.required this.blobId,
    @_s.required this.commitId,
    @_s.required this.fileContent,
    @_s.required this.fileMode,
    @_s.required this.filePath,
    @_s.required this.fileSize,
  });
  factory GetFileOutput.fromJson(Map<String, dynamic> json) =>
      _$GetFileOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFolderOutput {
  /// The full commit ID used as a reference for the returned version of the
  /// folder content.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The fully qualified path of the folder whose contents are returned.
  @_s.JsonKey(name: 'folderPath')
  final String folderPath;

  /// The list of files in the specified folder, if any.
  @_s.JsonKey(name: 'files')
  final List<File> files;

  /// The list of folders that exist under the specified folder, if any.
  @_s.JsonKey(name: 'subFolders')
  final List<Folder> subFolders;

  /// The list of submodules in the specified folder, if any.
  @_s.JsonKey(name: 'subModules')
  final List<SubModule> subModules;

  /// The list of symbolic links to other files and folders in the specified
  /// folder, if any.
  @_s.JsonKey(name: 'symbolicLinks')
  final List<SymbolicLink> symbolicLinks;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// the folder.
  @_s.JsonKey(name: 'treeId')
  final String treeId;

  GetFolderOutput({
    @_s.required this.commitId,
    @_s.required this.folderPath,
    this.files,
    this.subFolders,
    this.subModules,
    this.symbolicLinks,
    this.treeId,
  });
  factory GetFolderOutput.fromJson(Map<String, dynamic> json) =>
      _$GetFolderOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMergeCommitOutput {
  /// The commit ID of the merge base.
  @_s.JsonKey(name: 'baseCommitId')
  final String baseCommitId;

  /// The commit ID of the destination commit specifier that was used in the merge
  /// evaluation.
  @_s.JsonKey(name: 'destinationCommitId')
  final String destinationCommitId;

  /// The commit ID for the merge commit created when the source branch was merged
  /// into the destination branch. If the fast-forward merge strategy was used,
  /// there is no merge commit.
  @_s.JsonKey(name: 'mergedCommitId')
  final String mergedCommitId;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  @_s.JsonKey(name: 'sourceCommitId')
  final String sourceCommitId;

  GetMergeCommitOutput({
    this.baseCommitId,
    this.destinationCommitId,
    this.mergedCommitId,
    this.sourceCommitId,
  });
  factory GetMergeCommitOutput.fromJson(Map<String, dynamic> json) =>
      _$GetMergeCommitOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMergeConflictsOutput {
  /// A list of metadata for any conflicting files. If the specified merge
  /// strategy is FAST_FORWARD_MERGE, this list is always empty.
  @_s.JsonKey(name: 'conflictMetadataList')
  final List<ConflictMetadata> conflictMetadataList;

  /// The commit ID of the destination commit specifier that was used in the merge
  /// evaluation.
  @_s.JsonKey(name: 'destinationCommitId')
  final String destinationCommitId;

  /// A Boolean value that indicates whether the code is mergeable by the
  /// specified merge option.
  @_s.JsonKey(name: 'mergeable')
  final bool mergeable;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  @_s.JsonKey(name: 'sourceCommitId')
  final String sourceCommitId;

  /// The commit ID of the merge base.
  @_s.JsonKey(name: 'baseCommitId')
  final String baseCommitId;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetMergeConflictsOutput({
    @_s.required this.conflictMetadataList,
    @_s.required this.destinationCommitId,
    @_s.required this.mergeable,
    @_s.required this.sourceCommitId,
    this.baseCommitId,
    this.nextToken,
  });
  factory GetMergeConflictsOutput.fromJson(Map<String, dynamic> json) =>
      _$GetMergeConflictsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMergeOptionsOutput {
  /// The commit ID of the merge base.
  @_s.JsonKey(name: 'baseCommitId')
  final String baseCommitId;

  /// The commit ID of the destination commit specifier that was used in the merge
  /// evaluation.
  @_s.JsonKey(name: 'destinationCommitId')
  final String destinationCommitId;

  /// The merge option or strategy used to merge the code.
  @_s.JsonKey(name: 'mergeOptions')
  final List<MergeOptionTypeEnum> mergeOptions;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  @_s.JsonKey(name: 'sourceCommitId')
  final String sourceCommitId;

  GetMergeOptionsOutput({
    @_s.required this.baseCommitId,
    @_s.required this.destinationCommitId,
    @_s.required this.mergeOptions,
    @_s.required this.sourceCommitId,
  });
  factory GetMergeOptionsOutput.fromJson(Map<String, dynamic> json) =>
      _$GetMergeOptionsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPullRequestApprovalStatesOutput {
  /// Information about users who have approved the pull request.
  @_s.JsonKey(name: 'approvals')
  final List<Approval> approvals;

  GetPullRequestApprovalStatesOutput({
    this.approvals,
  });
  factory GetPullRequestApprovalStatesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullRequestApprovalStatesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPullRequestOutput {
  /// Information about the specified pull request.
  @_s.JsonKey(name: 'pullRequest')
  final PullRequest pullRequest;

  GetPullRequestOutput({
    @_s.required this.pullRequest,
  });
  factory GetPullRequestOutput.fromJson(Map<String, dynamic> json) =>
      _$GetPullRequestOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPullRequestOverrideStateOutput {
  /// A Boolean value that indicates whether a pull request has had its rules set
  /// aside (TRUE) or whether all approval rules still apply (FALSE).
  @_s.JsonKey(name: 'overridden')
  final bool overridden;

  /// The Amazon Resource Name (ARN) of the user or identity that overrode the
  /// rules and their requirements for the pull request.
  @_s.JsonKey(name: 'overrider')
  final String overrider;

  GetPullRequestOverrideStateOutput({
    this.overridden,
    this.overrider,
  });
  factory GetPullRequestOverrideStateOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullRequestOverrideStateOutputFromJson(json);
}

/// Represents the output of a get repository operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRepositoryOutput {
  /// Information about the repository.
  @_s.JsonKey(name: 'repositoryMetadata')
  final RepositoryMetadata repositoryMetadata;

  GetRepositoryOutput({
    this.repositoryMetadata,
  });
  factory GetRepositoryOutput.fromJson(Map<String, dynamic> json) =>
      _$GetRepositoryOutputFromJson(json);
}

/// Represents the output of a get repository triggers operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRepositoryTriggersOutput {
  /// The system-generated unique ID for the trigger.
  @_s.JsonKey(name: 'configurationId')
  final String configurationId;

  /// The JSON block of configuration information for each trigger.
  @_s.JsonKey(name: 'triggers')
  final List<RepositoryTrigger> triggers;

  GetRepositoryTriggersOutput({
    this.configurationId,
    this.triggers,
  });
  factory GetRepositoryTriggersOutput.fromJson(Map<String, dynamic> json) =>
      _$GetRepositoryTriggersOutputFromJson(json);
}

/// Information about whether a file is binary or textual in a merge or pull
/// request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IsBinaryFile {
  /// The binary or non-binary status of a file in the base of a merge or pull
  /// request.
  @_s.JsonKey(name: 'base')
  final bool base;

  /// The binary or non-binary status of a file in the destination of a merge or
  /// pull request.
  @_s.JsonKey(name: 'destination')
  final bool destination;

  /// The binary or non-binary status of file in the source of a merge or pull
  /// request.
  @_s.JsonKey(name: 'source')
  final bool source;

  IsBinaryFile({
    this.base,
    this.destination,
    this.source,
  });
  factory IsBinaryFile.fromJson(Map<String, dynamic> json) =>
      _$IsBinaryFileFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApprovalRuleTemplatesOutput {
  /// The names of all the approval rule templates found in the AWS Region for
  /// your AWS account.
  @_s.JsonKey(name: 'approvalRuleTemplateNames')
  final List<String> approvalRuleTemplateNames;

  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListApprovalRuleTemplatesOutput({
    this.approvalRuleTemplateNames,
    this.nextToken,
  });
  factory ListApprovalRuleTemplatesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListApprovalRuleTemplatesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssociatedApprovalRuleTemplatesForRepositoryOutput {
  /// The names of all approval rule templates associated with the repository.
  @_s.JsonKey(name: 'approvalRuleTemplateNames')
  final List<String> approvalRuleTemplateNames;

  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAssociatedApprovalRuleTemplatesForRepositoryOutput({
    this.approvalRuleTemplateNames,
    this.nextToken,
  });
  factory ListAssociatedApprovalRuleTemplatesForRepositoryOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListAssociatedApprovalRuleTemplatesForRepositoryOutputFromJson(json);
}

/// Represents the output of a list branches operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBranchesOutput {
  /// The list of branch names.
  @_s.JsonKey(name: 'branches')
  final List<String> branches;

  /// An enumeration token that returns the batch of the results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBranchesOutput({
    this.branches,
    this.nextToken,
  });
  factory ListBranchesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBranchesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPullRequestsOutput {
  /// The system-generated IDs of the pull requests.
  @_s.JsonKey(name: 'pullRequestIds')
  final List<String> pullRequestIds;

  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListPullRequestsOutput({
    @_s.required this.pullRequestIds,
    this.nextToken,
  });
  factory ListPullRequestsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListPullRequestsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRepositoriesForApprovalRuleTemplateOutput {
  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of repository names that are associated with the specified approval
  /// rule template.
  @_s.JsonKey(name: 'repositoryNames')
  final List<String> repositoryNames;

  ListRepositoriesForApprovalRuleTemplateOutput({
    this.nextToken,
    this.repositoryNames,
  });
  factory ListRepositoriesForApprovalRuleTemplateOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListRepositoriesForApprovalRuleTemplateOutputFromJson(json);
}

/// Represents the output of a list repositories operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRepositoriesOutput {
  /// An enumeration token that allows the operation to batch the results of the
  /// operation. Batch sizes are 1,000 for list repository operations. When the
  /// client sends the token back to AWS CodeCommit, another page of 1,000 records
  /// is retrieved.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Lists the repositories called by the list repositories operation.
  @_s.JsonKey(name: 'repositories')
  final List<RepositoryNameIdPair> repositories;

  ListRepositoriesOutput({
    this.nextToken,
    this.repositories,
  });
  factory ListRepositoriesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListRepositoriesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceOutput {
  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of tag key and value pairs associated with the specified resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceOutput({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceOutputFromJson(json);
}

/// Returns information about the location of a change or comment in the
/// comparison between two commits or a pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Location {
  /// The name of the file being compared, including its extension and
  /// subdirectory, if any.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  /// The position of a change in a compared file, in line number format.
  @_s.JsonKey(name: 'filePosition')
  final int filePosition;

  /// In a comparison of commits or a pull request, whether the change is in the
  /// before or after of that comparison.
  @_s.JsonKey(name: 'relativeFileVersion')
  final RelativeFileVersionEnum relativeFileVersion;

  Location({
    this.filePath,
    this.filePosition,
    this.relativeFileVersion,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergeBranchesByFastForwardOutput {
  /// The commit ID of the merge in the destination or target branch.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The tree ID of the merge in the destination or target branch.
  @_s.JsonKey(name: 'treeId')
  final String treeId;

  MergeBranchesByFastForwardOutput({
    this.commitId,
    this.treeId,
  });
  factory MergeBranchesByFastForwardOutput.fromJson(
          Map<String, dynamic> json) =>
      _$MergeBranchesByFastForwardOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergeBranchesBySquashOutput {
  /// The commit ID of the merge in the destination or target branch.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The tree ID of the merge in the destination or target branch.
  @_s.JsonKey(name: 'treeId')
  final String treeId;

  MergeBranchesBySquashOutput({
    this.commitId,
    this.treeId,
  });
  factory MergeBranchesBySquashOutput.fromJson(Map<String, dynamic> json) =>
      _$MergeBranchesBySquashOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergeBranchesByThreeWayOutput {
  /// The commit ID of the merge in the destination or target branch.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The tree ID of the merge in the destination or target branch.
  @_s.JsonKey(name: 'treeId')
  final String treeId;

  MergeBranchesByThreeWayOutput({
    this.commitId,
    this.treeId,
  });
  factory MergeBranchesByThreeWayOutput.fromJson(Map<String, dynamic> json) =>
      _$MergeBranchesByThreeWayOutputFromJson(json);
}

/// Information about merge hunks in a merge or pull request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergeHunk {
  /// Information about the merge hunk in the base of a merge or pull request.
  @_s.JsonKey(name: 'base')
  final MergeHunkDetail base;

  /// Information about the merge hunk in the destination of a merge or pull
  /// request.
  @_s.JsonKey(name: 'destination')
  final MergeHunkDetail destination;

  /// A Boolean value indicating whether a combination of hunks contains a
  /// conflict. Conflicts occur when the same file or the same lines in a file
  /// were modified in both the source and destination of a merge or pull request.
  /// Valid values include true, false, and null. True when the hunk represents a
  /// conflict and one or more files contains a line conflict. File mode conflicts
  /// in a merge do not set this to true.
  @_s.JsonKey(name: 'isConflict')
  final bool isConflict;

  /// Information about the merge hunk in the source of a merge or pull request.
  @_s.JsonKey(name: 'source')
  final MergeHunkDetail source;

  MergeHunk({
    this.base,
    this.destination,
    this.isConflict,
    this.source,
  });
  factory MergeHunk.fromJson(Map<String, dynamic> json) =>
      _$MergeHunkFromJson(json);
}

/// Information about the details of a merge hunk that contains a conflict in a
/// merge or pull request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergeHunkDetail {
  /// The end position of the hunk in the merge result.
  @_s.JsonKey(name: 'endLine')
  final int endLine;

  /// The base-64 encoded content of the hunk merged region that might contain a
  /// conflict.
  @_s.JsonKey(name: 'hunkContent')
  final String hunkContent;

  /// The start position of the hunk in the merge result.
  @_s.JsonKey(name: 'startLine')
  final int startLine;

  MergeHunkDetail({
    this.endLine,
    this.hunkContent,
    this.startLine,
  });
  factory MergeHunkDetail.fromJson(Map<String, dynamic> json) =>
      _$MergeHunkDetailFromJson(json);
}

/// Returns information about a merge or potential merge between a source
/// reference and a destination reference in a pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergeMetadata {
  /// A Boolean value indicating whether the merge has been made.
  @_s.JsonKey(name: 'isMerged')
  final bool isMerged;

  /// The commit ID for the merge commit, if any.
  @_s.JsonKey(name: 'mergeCommitId')
  final String mergeCommitId;

  /// The merge strategy used in the merge.
  @_s.JsonKey(name: 'mergeOption')
  final MergeOptionTypeEnum mergeOption;

  /// The Amazon Resource Name (ARN) of the user who merged the branches.
  @_s.JsonKey(name: 'mergedBy')
  final String mergedBy;

  MergeMetadata({
    this.isMerged,
    this.mergeCommitId,
    this.mergeOption,
    this.mergedBy,
  });
  factory MergeMetadata.fromJson(Map<String, dynamic> json) =>
      _$MergeMetadataFromJson(json);
}

/// Information about the file operation conflicts in a merge operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergeOperations {
  /// The operation on a file in the destination of a merge or pull request.
  @_s.JsonKey(name: 'destination')
  final ChangeTypeEnum destination;

  /// The operation (add, modify, or delete) on a file in the source of a merge or
  /// pull request.
  @_s.JsonKey(name: 'source')
  final ChangeTypeEnum source;

  MergeOperations({
    this.destination,
    this.source,
  });
  factory MergeOperations.fromJson(Map<String, dynamic> json) =>
      _$MergeOperationsFromJson(json);
}

enum MergeOptionTypeEnum {
  @_s.JsonValue('FAST_FORWARD_MERGE')
  fastForwardMerge,
  @_s.JsonValue('SQUASH_MERGE')
  squashMerge,
  @_s.JsonValue('THREE_WAY_MERGE')
  threeWayMerge,
}

extension on MergeOptionTypeEnum {
  String toValue() {
    switch (this) {
      case MergeOptionTypeEnum.fastForwardMerge:
        return 'FAST_FORWARD_MERGE';
      case MergeOptionTypeEnum.squashMerge:
        return 'SQUASH_MERGE';
      case MergeOptionTypeEnum.threeWayMerge:
        return 'THREE_WAY_MERGE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergePullRequestByFastForwardOutput {
  /// Information about the specified pull request, including the merge.
  @_s.JsonKey(name: 'pullRequest')
  final PullRequest pullRequest;

  MergePullRequestByFastForwardOutput({
    this.pullRequest,
  });
  factory MergePullRequestByFastForwardOutput.fromJson(
          Map<String, dynamic> json) =>
      _$MergePullRequestByFastForwardOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergePullRequestBySquashOutput {
  @_s.JsonKey(name: 'pullRequest')
  final PullRequest pullRequest;

  MergePullRequestBySquashOutput({
    this.pullRequest,
  });
  factory MergePullRequestBySquashOutput.fromJson(Map<String, dynamic> json) =>
      _$MergePullRequestBySquashOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergePullRequestByThreeWayOutput {
  @_s.JsonKey(name: 'pullRequest')
  final PullRequest pullRequest;

  MergePullRequestByThreeWayOutput({
    this.pullRequest,
  });
  factory MergePullRequestByThreeWayOutput.fromJson(
          Map<String, dynamic> json) =>
      _$MergePullRequestByThreeWayOutputFromJson(json);
}

enum ObjectTypeEnum {
  @_s.JsonValue('FILE')
  file,
  @_s.JsonValue('DIRECTORY')
  directory,
  @_s.JsonValue('GIT_LINK')
  gitLink,
  @_s.JsonValue('SYMBOLIC_LINK')
  symbolicLink,
}

/// Information about the type of an object in a merge operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ObjectTypes {
  /// The type of the object in the base commit of the merge.
  @_s.JsonKey(name: 'base')
  final ObjectTypeEnum base;

  /// The type of the object in the destination branch.
  @_s.JsonKey(name: 'destination')
  final ObjectTypeEnum destination;

  /// The type of the object in the source branch.
  @_s.JsonKey(name: 'source')
  final ObjectTypeEnum source;

  ObjectTypes({
    this.base,
    this.destination,
    this.source,
  });
  factory ObjectTypes.fromJson(Map<String, dynamic> json) =>
      _$ObjectTypesFromJson(json);
}

enum OrderEnum {
  @_s.JsonValue('ascending')
  ascending,
  @_s.JsonValue('descending')
  descending,
}

extension on OrderEnum {
  String toValue() {
    switch (this) {
      case OrderEnum.ascending:
        return 'ascending';
      case OrderEnum.descending:
        return 'descending';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Returns information about the template that created the approval rule for a
/// pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OriginApprovalRuleTemplate {
  /// The ID of the template that created the approval rule.
  @_s.JsonKey(name: 'approvalRuleTemplateId')
  final String approvalRuleTemplateId;

  /// The name of the template that created the approval rule.
  @_s.JsonKey(name: 'approvalRuleTemplateName')
  final String approvalRuleTemplateName;

  OriginApprovalRuleTemplate({
    this.approvalRuleTemplateId,
    this.approvalRuleTemplateName,
  });
  factory OriginApprovalRuleTemplate.fromJson(Map<String, dynamic> json) =>
      _$OriginApprovalRuleTemplateFromJson(json);
}

enum OverrideStatus {
  @_s.JsonValue('OVERRIDE')
  override,
  @_s.JsonValue('REVOKE')
  revoke,
}

extension on OverrideStatus {
  String toValue() {
    switch (this) {
      case OverrideStatus.override:
        return 'OVERRIDE';
      case OverrideStatus.revoke:
        return 'REVOKE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PostCommentForComparedCommitOutput {
  /// In the directionality you established, the blob ID of the after blob.
  @_s.JsonKey(name: 'afterBlobId')
  final String afterBlobId;

  /// In the directionality you established, the full commit ID of the after
  /// commit.
  @_s.JsonKey(name: 'afterCommitId')
  final String afterCommitId;

  /// In the directionality you established, the blob ID of the before blob.
  @_s.JsonKey(name: 'beforeBlobId')
  final String beforeBlobId;

  /// In the directionality you established, the full commit ID of the before
  /// commit.
  @_s.JsonKey(name: 'beforeCommitId')
  final String beforeCommitId;

  /// The content of the comment you posted.
  @_s.JsonKey(name: 'comment')
  final Comment comment;

  /// The location of the comment in the comparison between the two commits.
  @_s.JsonKey(name: 'location')
  final Location location;

  /// The name of the repository where you posted a comment on the comparison
  /// between commits.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

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
          Map<String, dynamic> json) =>
      _$PostCommentForComparedCommitOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PostCommentForPullRequestOutput {
  /// In the directionality of the pull request, the blob ID of the after blob.
  @_s.JsonKey(name: 'afterBlobId')
  final String afterBlobId;

  /// The full commit ID of the commit in the destination branch where the pull
  /// request is merged.
  @_s.JsonKey(name: 'afterCommitId')
  final String afterCommitId;

  /// In the directionality of the pull request, the blob ID of the before blob.
  @_s.JsonKey(name: 'beforeBlobId')
  final String beforeBlobId;

  /// The full commit ID of the commit in the source branch used to create the
  /// pull request, or in the case of an updated pull request, the full commit ID
  /// of the commit used to update the pull request.
  @_s.JsonKey(name: 'beforeCommitId')
  final String beforeCommitId;

  /// The content of the comment you posted.
  @_s.JsonKey(name: 'comment')
  final Comment comment;

  /// The location of the change where you posted your comment.
  @_s.JsonKey(name: 'location')
  final Location location;

  /// The system-generated ID of the pull request.
  @_s.JsonKey(name: 'pullRequestId')
  final String pullRequestId;

  /// The name of the repository where you posted a comment on a pull request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

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
  factory PostCommentForPullRequestOutput.fromJson(Map<String, dynamic> json) =>
      _$PostCommentForPullRequestOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PostCommentReplyOutput {
  /// Information about the reply to a comment.
  @_s.JsonKey(name: 'comment')
  final Comment comment;

  PostCommentReplyOutput({
    this.comment,
  });
  factory PostCommentReplyOutput.fromJson(Map<String, dynamic> json) =>
      _$PostCommentReplyOutputFromJson(json);
}

/// Returns information about a pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PullRequest {
  /// The approval rules applied to the pull request.
  @_s.JsonKey(name: 'approvalRules')
  final List<ApprovalRule> approvalRules;

  /// The Amazon Resource Name (ARN) of the user who created the pull request.
  @_s.JsonKey(name: 'authorArn')
  final String authorArn;

  /// A unique, client-generated idempotency token that, when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter. If
  /// a request is received with the same parameters and a token is included, the
  /// request returns information about the initial request that used that token.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The date and time the pull request was originally created, in timestamp
  /// format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The user-defined description of the pull request. This description can be
  /// used to clarify what should be reviewed and other details of the request.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The day and time of the last user or system activity on the pull request, in
  /// timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastActivityDate')
  final DateTime lastActivityDate;

  /// The system-generated ID of the pull request.
  @_s.JsonKey(name: 'pullRequestId')
  final String pullRequestId;

  /// The status of the pull request. Pull request status can only change from
  /// <code>OPEN</code> to <code>CLOSED</code>.
  @_s.JsonKey(name: 'pullRequestStatus')
  final PullRequestStatusEnum pullRequestStatus;

  /// The targets of the pull request, including the source branch and destination
  /// branch for the pull request.
  @_s.JsonKey(name: 'pullRequestTargets')
  final List<PullRequestTarget> pullRequestTargets;

  /// The system-generated revision ID for the pull request.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// The user-defined title of the pull request. This title is displayed in the
  /// list of pull requests to other repository users.
  @_s.JsonKey(name: 'title')
  final String title;

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
  factory PullRequest.fromJson(Map<String, dynamic> json) =>
      _$PullRequestFromJson(json);
}

/// Metadata about the pull request that is used when comparing the pull request
/// source with its destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PullRequestCreatedEventMetadata {
  /// The commit ID of the tip of the branch specified as the destination branch
  /// when the pull request was created.
  @_s.JsonKey(name: 'destinationCommitId')
  final String destinationCommitId;

  /// The commit ID of the most recent commit that the source branch and the
  /// destination branch have in common.
  @_s.JsonKey(name: 'mergeBase')
  final String mergeBase;

  /// The name of the repository where the pull request was created.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  /// The commit ID on the source branch used when the pull request was created.
  @_s.JsonKey(name: 'sourceCommitId')
  final String sourceCommitId;

  PullRequestCreatedEventMetadata({
    this.destinationCommitId,
    this.mergeBase,
    this.repositoryName,
    this.sourceCommitId,
  });
  factory PullRequestCreatedEventMetadata.fromJson(Map<String, dynamic> json) =>
      _$PullRequestCreatedEventMetadataFromJson(json);
}

/// Returns information about a pull request event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PullRequestEvent {
  /// The Amazon Resource Name (ARN) of the user whose actions resulted in the
  /// event. Examples include updating the pull request with more commits or
  /// changing the status of a pull request.
  @_s.JsonKey(name: 'actorArn')
  final String actorArn;

  /// Information about a pull request event.
  @_s.JsonKey(name: 'approvalRuleEventMetadata')
  final ApprovalRuleEventMetadata approvalRuleEventMetadata;

  /// Information about an approval rule override event for a pull request.
  @_s.JsonKey(name: 'approvalRuleOverriddenEventMetadata')
  final ApprovalRuleOverriddenEventMetadata approvalRuleOverriddenEventMetadata;

  /// Information about an approval state change for a pull request.
  @_s.JsonKey(name: 'approvalStateChangedEventMetadata')
  final ApprovalStateChangedEventMetadata approvalStateChangedEventMetadata;

  /// The day and time of the pull request event, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'eventDate')
  final DateTime eventDate;

  /// Information about the source and destination branches for the pull request.
  @_s.JsonKey(name: 'pullRequestCreatedEventMetadata')
  final PullRequestCreatedEventMetadata pullRequestCreatedEventMetadata;

  /// The type of the pull request event (for example, a status change event
  /// (PULL_REQUEST_STATUS_CHANGED) or update event
  /// (PULL_REQUEST_SOURCE_REFERENCE_UPDATED)).
  @_s.JsonKey(name: 'pullRequestEventType')
  final PullRequestEventType pullRequestEventType;

  /// The system-generated ID of the pull request.
  @_s.JsonKey(name: 'pullRequestId')
  final String pullRequestId;

  /// Information about the change in mergability state for the pull request
  /// event.
  @_s.JsonKey(name: 'pullRequestMergedStateChangedEventMetadata')
  final PullRequestMergedStateChangedEventMetadata
      pullRequestMergedStateChangedEventMetadata;

  /// Information about the updated source branch for the pull request event.
  @_s.JsonKey(name: 'pullRequestSourceReferenceUpdatedEventMetadata')
  final PullRequestSourceReferenceUpdatedEventMetadata
      pullRequestSourceReferenceUpdatedEventMetadata;

  /// Information about the change in status for the pull request event.
  @_s.JsonKey(name: 'pullRequestStatusChangedEventMetadata')
  final PullRequestStatusChangedEventMetadata
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
  factory PullRequestEvent.fromJson(Map<String, dynamic> json) =>
      _$PullRequestEventFromJson(json);
}

enum PullRequestEventType {
  @_s.JsonValue('PULL_REQUEST_CREATED')
  pullRequestCreated,
  @_s.JsonValue('PULL_REQUEST_STATUS_CHANGED')
  pullRequestStatusChanged,
  @_s.JsonValue('PULL_REQUEST_SOURCE_REFERENCE_UPDATED')
  pullRequestSourceReferenceUpdated,
  @_s.JsonValue('PULL_REQUEST_MERGE_STATE_CHANGED')
  pullRequestMergeStateChanged,
  @_s.JsonValue('PULL_REQUEST_APPROVAL_RULE_CREATED')
  pullRequestApprovalRuleCreated,
  @_s.JsonValue('PULL_REQUEST_APPROVAL_RULE_UPDATED')
  pullRequestApprovalRuleUpdated,
  @_s.JsonValue('PULL_REQUEST_APPROVAL_RULE_DELETED')
  pullRequestApprovalRuleDeleted,
  @_s.JsonValue('PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN')
  pullRequestApprovalRuleOverridden,
  @_s.JsonValue('PULL_REQUEST_APPROVAL_STATE_CHANGED')
  pullRequestApprovalStateChanged,
}

extension on PullRequestEventType {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Returns information about the change in the merge state for a pull request
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PullRequestMergedStateChangedEventMetadata {
  /// The name of the branch that the pull request is merged into.
  @_s.JsonKey(name: 'destinationReference')
  final String destinationReference;

  /// Information about the merge state change event.
  @_s.JsonKey(name: 'mergeMetadata')
  final MergeMetadata mergeMetadata;

  /// The name of the repository where the pull request was created.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  PullRequestMergedStateChangedEventMetadata({
    this.destinationReference,
    this.mergeMetadata,
    this.repositoryName,
  });
  factory PullRequestMergedStateChangedEventMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestMergedStateChangedEventMetadataFromJson(json);
}

/// Information about an update to the source branch of a pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PullRequestSourceReferenceUpdatedEventMetadata {
  /// The full commit ID of the commit in the source branch that was the tip of
  /// the branch at the time the pull request was updated.
  @_s.JsonKey(name: 'afterCommitId')
  final String afterCommitId;

  /// The full commit ID of the commit in the destination branch that was the tip
  /// of the branch at the time the pull request was updated.
  @_s.JsonKey(name: 'beforeCommitId')
  final String beforeCommitId;

  /// The commit ID of the most recent commit that the source branch and the
  /// destination branch have in common.
  @_s.JsonKey(name: 'mergeBase')
  final String mergeBase;

  /// The name of the repository where the pull request was updated.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  PullRequestSourceReferenceUpdatedEventMetadata({
    this.afterCommitId,
    this.beforeCommitId,
    this.mergeBase,
    this.repositoryName,
  });
  factory PullRequestSourceReferenceUpdatedEventMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestSourceReferenceUpdatedEventMetadataFromJson(json);
}

/// Information about a change to the status of a pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PullRequestStatusChangedEventMetadata {
  /// The changed status of the pull request.
  @_s.JsonKey(name: 'pullRequestStatus')
  final PullRequestStatusEnum pullRequestStatus;

  PullRequestStatusChangedEventMetadata({
    this.pullRequestStatus,
  });
  factory PullRequestStatusChangedEventMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestStatusChangedEventMetadataFromJson(json);
}

enum PullRequestStatusEnum {
  @_s.JsonValue('OPEN')
  open,
  @_s.JsonValue('CLOSED')
  closed,
}

extension on PullRequestStatusEnum {
  String toValue() {
    switch (this) {
      case PullRequestStatusEnum.open:
        return 'OPEN';
      case PullRequestStatusEnum.closed:
        return 'CLOSED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Returns information about a pull request target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PullRequestTarget {
  /// The full commit ID that is the tip of the destination branch. This is the
  /// commit where the pull request was or will be merged.
  @_s.JsonKey(name: 'destinationCommit')
  final String destinationCommit;

  /// The branch of the repository where the pull request changes are merged. Also
  /// known as the destination branch.
  @_s.JsonKey(name: 'destinationReference')
  final String destinationReference;

  /// The commit ID of the most recent commit that the source branch and the
  /// destination branch have in common.
  @_s.JsonKey(name: 'mergeBase')
  final String mergeBase;

  /// Returns metadata about the state of the merge, including whether the merge
  /// has been made.
  @_s.JsonKey(name: 'mergeMetadata')
  final MergeMetadata mergeMetadata;

  /// The name of the repository that contains the pull request source and
  /// destination branches.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  /// The full commit ID of the tip of the source branch used to create the pull
  /// request. If the pull request branch is updated by a push while the pull
  /// request is open, the commit ID changes to reflect the new tip of the branch.
  @_s.JsonKey(name: 'sourceCommit')
  final String sourceCommit;

  /// The branch of the repository that contains the changes for the pull request.
  /// Also known as the source branch.
  @_s.JsonKey(name: 'sourceReference')
  final String sourceReference;

  PullRequestTarget({
    this.destinationCommit,
    this.destinationReference,
    this.mergeBase,
    this.mergeMetadata,
    this.repositoryName,
    this.sourceCommit,
    this.sourceReference,
  });
  factory PullRequestTarget.fromJson(Map<String, dynamic> json) =>
      _$PullRequestTargetFromJson(json);
}

/// Information about a file added or updated as part of a commit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PutFileEntry {
  /// The full path to the file in the repository, including the name of the file.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  /// The content of the file, if a source file is not specified.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'fileContent')
  final Uint8List fileContent;

  /// The extrapolated file mode permissions for the file. Valid values include
  /// EXECUTABLE and NORMAL.
  @_s.JsonKey(name: 'fileMode')
  final FileModeTypeEnum fileMode;

  /// The name and full path of the file that contains the changes you want to
  /// make as part of the commit, if you are not providing the file content
  /// directly.
  @_s.JsonKey(name: 'sourceFile')
  final SourceFileSpecifier sourceFile;

  PutFileEntry({
    @_s.required this.filePath,
    this.fileContent,
    this.fileMode,
    this.sourceFile,
  });
  Map<String, dynamic> toJson() => _$PutFileEntryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutFileOutput {
  /// The ID of the blob, which is its SHA-1 pointer.
  @_s.JsonKey(name: 'blobId')
  final String blobId;

  /// The full SHA ID of the commit that contains this file change.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The full SHA-1 pointer of the tree information for the commit that contains
  /// this file change.
  @_s.JsonKey(name: 'treeId')
  final String treeId;

  PutFileOutput({
    @_s.required this.blobId,
    @_s.required this.commitId,
    @_s.required this.treeId,
  });
  factory PutFileOutput.fromJson(Map<String, dynamic> json) =>
      _$PutFileOutputFromJson(json);
}

/// Represents the output of a put repository triggers operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRepositoryTriggersOutput {
  /// The system-generated unique ID for the create or update operation.
  @_s.JsonKey(name: 'configurationId')
  final String configurationId;

  PutRepositoryTriggersOutput({
    this.configurationId,
  });
  factory PutRepositoryTriggersOutput.fromJson(Map<String, dynamic> json) =>
      _$PutRepositoryTriggersOutputFromJson(json);
}

/// Information about the reaction values provided by users on a comment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReactionForComment {
  /// The reaction for a specified comment.
  @_s.JsonKey(name: 'reaction')
  final ReactionValueFormats reaction;

  /// The Amazon Resource Names (ARNs) of users who have provided reactions to the
  /// comment.
  @_s.JsonKey(name: 'reactionUsers')
  final List<String> reactionUsers;

  /// A numerical count of users who reacted with the specified emoji whose
  /// identities have been subsequently deleted from IAM. While these IAM users or
  /// roles no longer exist, the reactions might still appear in total reaction
  /// counts.
  @_s.JsonKey(name: 'reactionsFromDeletedUsersCount')
  final int reactionsFromDeletedUsersCount;

  ReactionForComment({
    this.reaction,
    this.reactionUsers,
    this.reactionsFromDeletedUsersCount,
  });
  factory ReactionForComment.fromJson(Map<String, dynamic> json) =>
      _$ReactionForCommentFromJson(json);
}

/// Information about the values for reactions to a comment. AWS CodeCommit
/// supports a limited set of reactions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReactionValueFormats {
  /// The Emoji Version 1.0 graphic of the reaction. These graphics are
  /// interpreted slightly differently on different operating systems.
  @_s.JsonKey(name: 'emoji')
  final String emoji;

  /// The emoji short code for the reaction. Short codes are interpreted slightly
  /// differently on different operating systems.
  @_s.JsonKey(name: 'shortCode')
  final String shortCode;

  /// The Unicode codepoint for the reaction.
  @_s.JsonKey(name: 'unicode')
  final String unicode;

  ReactionValueFormats({
    this.emoji,
    this.shortCode,
    this.unicode,
  });
  factory ReactionValueFormats.fromJson(Map<String, dynamic> json) =>
      _$ReactionValueFormatsFromJson(json);
}

enum RelativeFileVersionEnum {
  @_s.JsonValue('BEFORE')
  before,
  @_s.JsonValue('AFTER')
  after,
}

/// Information about a replacement content entry in the conflict of a merge or
/// pull request operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReplaceContentEntry {
  /// The path of the conflicting file.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  /// The replacement type to use when determining how to resolve the conflict.
  @_s.JsonKey(name: 'replacementType')
  final ReplacementTypeEnum replacementType;

  /// The base-64 encoded content to use when the replacement type is
  /// USE_NEW_CONTENT.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'content')
  final Uint8List content;

  /// The file mode to apply during conflict resoltion.
  @_s.JsonKey(name: 'fileMode')
  final FileModeTypeEnum fileMode;

  ReplaceContentEntry({
    @_s.required this.filePath,
    @_s.required this.replacementType,
    this.content,
    this.fileMode,
  });
  Map<String, dynamic> toJson() => _$ReplaceContentEntryToJson(this);
}

enum ReplacementTypeEnum {
  @_s.JsonValue('KEEP_BASE')
  keepBase,
  @_s.JsonValue('KEEP_SOURCE')
  keepSource,
  @_s.JsonValue('KEEP_DESTINATION')
  keepDestination,
  @_s.JsonValue('USE_NEW_CONTENT')
  useNewContent,
}

/// Information about a repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RepositoryMetadata {
  /// The Amazon Resource Name (ARN) of the repository.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the AWS account associated with the repository.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The URL to use for cloning the repository over HTTPS.
  @_s.JsonKey(name: 'cloneUrlHttp')
  final String cloneUrlHttp;

  /// The URL to use for cloning the repository over SSH.
  @_s.JsonKey(name: 'cloneUrlSsh')
  final String cloneUrlSsh;

  /// The date and time the repository was created, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The repository's default branch name.
  @_s.JsonKey(name: 'defaultBranch')
  final String defaultBranch;

  /// The date and time the repository was last modified, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// A comment or description about the repository.
  @_s.JsonKey(name: 'repositoryDescription')
  final String repositoryDescription;

  /// The ID of the repository.
  @_s.JsonKey(name: 'repositoryId')
  final String repositoryId;

  /// The repository's name.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  RepositoryMetadata({
    this.arn,
    this.accountId,
    this.cloneUrlHttp,
    this.cloneUrlSsh,
    this.creationDate,
    this.defaultBranch,
    this.lastModifiedDate,
    this.repositoryDescription,
    this.repositoryId,
    this.repositoryName,
  });
  factory RepositoryMetadata.fromJson(Map<String, dynamic> json) =>
      _$RepositoryMetadataFromJson(json);
}

/// Information about a repository name and ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RepositoryNameIdPair {
  /// The ID associated with the repository.
  @_s.JsonKey(name: 'repositoryId')
  final String repositoryId;

  /// The name associated with the repository.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  RepositoryNameIdPair({
    this.repositoryId,
    this.repositoryName,
  });
  factory RepositoryNameIdPair.fromJson(Map<String, dynamic> json) =>
      _$RepositoryNameIdPairFromJson(json);
}

/// Information about a trigger for a repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RepositoryTrigger {
  /// The ARN of the resource that is the target for a trigger (for example, the
  /// ARN of a topic in Amazon SNS).
  @_s.JsonKey(name: 'destinationArn')
  final String destinationArn;

  /// The repository events that cause the trigger to run actions in another
  /// service, such as sending a notification through Amazon SNS.
  /// <note>
  /// The valid value "all" cannot be used with any other values.
  /// </note>
  @_s.JsonKey(name: 'events')
  final List<RepositoryTriggerEventEnum> events;

  /// The name of the trigger.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The branches to be included in the trigger configuration. If you specify an
  /// empty array, the trigger applies to all branches.
  /// <note>
  /// Although no content is required in the array, you must include the array
  /// itself.
  /// </note>
  @_s.JsonKey(name: 'branches')
  final List<String> branches;

  /// Any custom data associated with the trigger to be included in the
  /// information sent to the target of the trigger.
  @_s.JsonKey(name: 'customData')
  final String customData;

  RepositoryTrigger({
    @_s.required this.destinationArn,
    @_s.required this.events,
    @_s.required this.name,
    this.branches,
    this.customData,
  });
  factory RepositoryTrigger.fromJson(Map<String, dynamic> json) =>
      _$RepositoryTriggerFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryTriggerToJson(this);
}

enum RepositoryTriggerEventEnum {
  @_s.JsonValue('all')
  all,
  @_s.JsonValue('updateReference')
  updateReference,
  @_s.JsonValue('createReference')
  createReference,
  @_s.JsonValue('deleteReference')
  deleteReference,
}

/// A trigger failed to run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RepositoryTriggerExecutionFailure {
  /// Message information about the trigger that did not run.
  @_s.JsonKey(name: 'failureMessage')
  final String failureMessage;

  /// The name of the trigger that did not run.
  @_s.JsonKey(name: 'trigger')
  final String trigger;

  RepositoryTriggerExecutionFailure({
    this.failureMessage,
    this.trigger,
  });
  factory RepositoryTriggerExecutionFailure.fromJson(
          Map<String, dynamic> json) =>
      _$RepositoryTriggerExecutionFailureFromJson(json);
}

/// Information about the file mode changes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SetFileModeEntry {
  /// The file mode for the file.
  @_s.JsonKey(name: 'fileMode')
  final FileModeTypeEnum fileMode;

  /// The full path to the file, including the name of the file.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  SetFileModeEntry({
    @_s.required this.fileMode,
    @_s.required this.filePath,
  });
  Map<String, dynamic> toJson() => _$SetFileModeEntryToJson(this);
}

enum SortByEnum {
  @_s.JsonValue('repositoryName')
  repositoryName,
  @_s.JsonValue('lastModifiedDate')
  lastModifiedDate,
}

extension on SortByEnum {
  String toValue() {
    switch (this) {
      case SortByEnum.repositoryName:
        return 'repositoryName';
      case SortByEnum.lastModifiedDate:
        return 'lastModifiedDate';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a source file that is part of changes made in a commit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SourceFileSpecifier {
  /// The full path to the file, including the name of the file.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  /// Whether to remove the source file from the parent commit.
  @_s.JsonKey(name: 'isMove')
  final bool isMove;

  SourceFileSpecifier({
    @_s.required this.filePath,
    this.isMove,
  });
  Map<String, dynamic> toJson() => _$SourceFileSpecifierToJson(this);
}

/// Returns information about a submodule reference in a repository folder.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubModule {
  /// The fully qualified path to the folder that contains the reference to the
  /// submodule.
  @_s.JsonKey(name: 'absolutePath')
  final String absolutePath;

  /// The commit ID that contains the reference to the submodule.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The relative path of the submodule from the folder where the query
  /// originated.
  @_s.JsonKey(name: 'relativePath')
  final String relativePath;

  SubModule({
    this.absolutePath,
    this.commitId,
    this.relativePath,
  });
  factory SubModule.fromJson(Map<String, dynamic> json) =>
      _$SubModuleFromJson(json);
}

/// Returns information about a symbolic link in a repository folder.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SymbolicLink {
  /// The fully qualified path to the folder that contains the symbolic link.
  @_s.JsonKey(name: 'absolutePath')
  final String absolutePath;

  /// The blob ID that contains the information about the symbolic link.
  @_s.JsonKey(name: 'blobId')
  final String blobId;

  /// The file mode permissions of the blob that cotains information about the
  /// symbolic link.
  @_s.JsonKey(name: 'fileMode')
  final FileModeTypeEnum fileMode;

  /// The relative path of the symbolic link from the folder where the query
  /// originated.
  @_s.JsonKey(name: 'relativePath')
  final String relativePath;

  SymbolicLink({
    this.absolutePath,
    this.blobId,
    this.fileMode,
    this.relativePath,
  });
  factory SymbolicLink.fromJson(Map<String, dynamic> json) =>
      _$SymbolicLinkFromJson(json);
}

/// Returns information about a target for a pull request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Target {
  /// The name of the repository that contains the pull request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  /// The branch of the repository that contains the changes for the pull request.
  /// Also known as the source branch.
  @_s.JsonKey(name: 'sourceReference')
  final String sourceReference;

  /// The branch of the repository where the pull request changes are merged. Also
  /// known as the destination branch.
  @_s.JsonKey(name: 'destinationReference')
  final String destinationReference;

  Target({
    @_s.required this.repositoryName,
    @_s.required this.sourceReference,
    this.destinationReference,
  });
  Map<String, dynamic> toJson() => _$TargetToJson(this);
}

/// Represents the output of a test repository triggers operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestRepositoryTriggersOutput {
  /// The list of triggers that were not tested. This list provides the names of
  /// the triggers that could not be tested, separated by commas.
  @_s.JsonKey(name: 'failedExecutions')
  final List<RepositoryTriggerExecutionFailure> failedExecutions;

  /// The list of triggers that were successfully tested. This list provides the
  /// names of the triggers that were successfully tested, separated by commas.
  @_s.JsonKey(name: 'successfulExecutions')
  final List<String> successfulExecutions;

  TestRepositoryTriggersOutput({
    this.failedExecutions,
    this.successfulExecutions,
  });
  factory TestRepositoryTriggersOutput.fromJson(Map<String, dynamic> json) =>
      _$TestRepositoryTriggersOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApprovalRuleTemplateContentOutput {
  @_s.JsonKey(name: 'approvalRuleTemplate')
  final ApprovalRuleTemplate approvalRuleTemplate;

  UpdateApprovalRuleTemplateContentOutput({
    @_s.required this.approvalRuleTemplate,
  });
  factory UpdateApprovalRuleTemplateContentOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateApprovalRuleTemplateContentOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApprovalRuleTemplateDescriptionOutput {
  /// The structure and content of the updated approval rule template.
  @_s.JsonKey(name: 'approvalRuleTemplate')
  final ApprovalRuleTemplate approvalRuleTemplate;

  UpdateApprovalRuleTemplateDescriptionOutput({
    @_s.required this.approvalRuleTemplate,
  });
  factory UpdateApprovalRuleTemplateDescriptionOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateApprovalRuleTemplateDescriptionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApprovalRuleTemplateNameOutput {
  /// The structure and content of the updated approval rule template.
  @_s.JsonKey(name: 'approvalRuleTemplate')
  final ApprovalRuleTemplate approvalRuleTemplate;

  UpdateApprovalRuleTemplateNameOutput({
    @_s.required this.approvalRuleTemplate,
  });
  factory UpdateApprovalRuleTemplateNameOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateApprovalRuleTemplateNameOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCommentOutput {
  /// Information about the updated comment.
  @_s.JsonKey(name: 'comment')
  final Comment comment;

  UpdateCommentOutput({
    this.comment,
  });
  factory UpdateCommentOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateCommentOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePullRequestApprovalRuleContentOutput {
  /// Information about the updated approval rule.
  @_s.JsonKey(name: 'approvalRule')
  final ApprovalRule approvalRule;

  UpdatePullRequestApprovalRuleContentOutput({
    @_s.required this.approvalRule,
  });
  factory UpdatePullRequestApprovalRuleContentOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePullRequestApprovalRuleContentOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePullRequestDescriptionOutput {
  /// Information about the updated pull request.
  @_s.JsonKey(name: 'pullRequest')
  final PullRequest pullRequest;

  UpdatePullRequestDescriptionOutput({
    @_s.required this.pullRequest,
  });
  factory UpdatePullRequestDescriptionOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePullRequestDescriptionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePullRequestStatusOutput {
  /// Information about the pull request.
  @_s.JsonKey(name: 'pullRequest')
  final PullRequest pullRequest;

  UpdatePullRequestStatusOutput({
    @_s.required this.pullRequest,
  });
  factory UpdatePullRequestStatusOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdatePullRequestStatusOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePullRequestTitleOutput {
  /// Information about the updated pull request.
  @_s.JsonKey(name: 'pullRequest')
  final PullRequest pullRequest;

  UpdatePullRequestTitleOutput({
    @_s.required this.pullRequest,
  });
  factory UpdatePullRequestTitleOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdatePullRequestTitleOutputFromJson(json);
}

/// Information about the user who made a specified commit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserInfo {
  /// The date when the specified commit was commited, in timestamp format with
  /// GMT offset.
  @_s.JsonKey(name: 'date')
  final String date;

  /// The email address associated with the user who made the commit, if any.
  @_s.JsonKey(name: 'email')
  final String email;

  /// The name of the user who made the specified commit.
  @_s.JsonKey(name: 'name')
  final String name;

  UserInfo({
    this.date,
    this.email,
    this.name,
  });
  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

class ActorDoesNotExistException extends _s.GenericAwsException {
  ActorDoesNotExistException({String type, String message})
      : super(type: type, code: 'ActorDoesNotExistException', message: message);
}

class ApprovalRuleContentRequiredException extends _s.GenericAwsException {
  ApprovalRuleContentRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ApprovalRuleContentRequiredException',
            message: message);
}

class ApprovalRuleDoesNotExistException extends _s.GenericAwsException {
  ApprovalRuleDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'ApprovalRuleDoesNotExistException',
            message: message);
}

class ApprovalRuleNameAlreadyExistsException extends _s.GenericAwsException {
  ApprovalRuleNameAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ApprovalRuleNameAlreadyExistsException',
            message: message);
}

class ApprovalRuleNameRequiredException extends _s.GenericAwsException {
  ApprovalRuleNameRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ApprovalRuleNameRequiredException',
            message: message);
}

class ApprovalRuleTemplateContentRequiredException
    extends _s.GenericAwsException {
  ApprovalRuleTemplateContentRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ApprovalRuleTemplateContentRequiredException',
            message: message);
}

class ApprovalRuleTemplateDoesNotExistException extends _s.GenericAwsException {
  ApprovalRuleTemplateDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'ApprovalRuleTemplateDoesNotExistException',
            message: message);
}

class ApprovalRuleTemplateInUseException extends _s.GenericAwsException {
  ApprovalRuleTemplateInUseException({String type, String message})
      : super(
            type: type,
            code: 'ApprovalRuleTemplateInUseException',
            message: message);
}

class ApprovalRuleTemplateNameAlreadyExistsException
    extends _s.GenericAwsException {
  ApprovalRuleTemplateNameAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ApprovalRuleTemplateNameAlreadyExistsException',
            message: message);
}

class ApprovalRuleTemplateNameRequiredException extends _s.GenericAwsException {
  ApprovalRuleTemplateNameRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ApprovalRuleTemplateNameRequiredException',
            message: message);
}

class ApprovalStateRequiredException extends _s.GenericAwsException {
  ApprovalStateRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ApprovalStateRequiredException',
            message: message);
}

class AuthorDoesNotExistException extends _s.GenericAwsException {
  AuthorDoesNotExistException({String type, String message})
      : super(
            type: type, code: 'AuthorDoesNotExistException', message: message);
}

class BeforeCommitIdAndAfterCommitIdAreSameException
    extends _s.GenericAwsException {
  BeforeCommitIdAndAfterCommitIdAreSameException({String type, String message})
      : super(
            type: type,
            code: 'BeforeCommitIdAndAfterCommitIdAreSameException',
            message: message);
}

class BlobIdDoesNotExistException extends _s.GenericAwsException {
  BlobIdDoesNotExistException({String type, String message})
      : super(
            type: type, code: 'BlobIdDoesNotExistException', message: message);
}

class BlobIdRequiredException extends _s.GenericAwsException {
  BlobIdRequiredException({String type, String message})
      : super(type: type, code: 'BlobIdRequiredException', message: message);
}

class BranchDoesNotExistException extends _s.GenericAwsException {
  BranchDoesNotExistException({String type, String message})
      : super(
            type: type, code: 'BranchDoesNotExistException', message: message);
}

class BranchNameExistsException extends _s.GenericAwsException {
  BranchNameExistsException({String type, String message})
      : super(type: type, code: 'BranchNameExistsException', message: message);
}

class BranchNameIsTagNameException extends _s.GenericAwsException {
  BranchNameIsTagNameException({String type, String message})
      : super(
            type: type, code: 'BranchNameIsTagNameException', message: message);
}

class BranchNameRequiredException extends _s.GenericAwsException {
  BranchNameRequiredException({String type, String message})
      : super(
            type: type, code: 'BranchNameRequiredException', message: message);
}

class CannotDeleteApprovalRuleFromTemplateException
    extends _s.GenericAwsException {
  CannotDeleteApprovalRuleFromTemplateException({String type, String message})
      : super(
            type: type,
            code: 'CannotDeleteApprovalRuleFromTemplateException',
            message: message);
}

class CannotModifyApprovalRuleFromTemplateException
    extends _s.GenericAwsException {
  CannotModifyApprovalRuleFromTemplateException({String type, String message})
      : super(
            type: type,
            code: 'CannotModifyApprovalRuleFromTemplateException',
            message: message);
}

class ClientRequestTokenRequiredException extends _s.GenericAwsException {
  ClientRequestTokenRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ClientRequestTokenRequiredException',
            message: message);
}

class CommentContentRequiredException extends _s.GenericAwsException {
  CommentContentRequiredException({String type, String message})
      : super(
            type: type,
            code: 'CommentContentRequiredException',
            message: message);
}

class CommentContentSizeLimitExceededException extends _s.GenericAwsException {
  CommentContentSizeLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'CommentContentSizeLimitExceededException',
            message: message);
}

class CommentDeletedException extends _s.GenericAwsException {
  CommentDeletedException({String type, String message})
      : super(type: type, code: 'CommentDeletedException', message: message);
}

class CommentDoesNotExistException extends _s.GenericAwsException {
  CommentDoesNotExistException({String type, String message})
      : super(
            type: type, code: 'CommentDoesNotExistException', message: message);
}

class CommentIdRequiredException extends _s.GenericAwsException {
  CommentIdRequiredException({String type, String message})
      : super(type: type, code: 'CommentIdRequiredException', message: message);
}

class CommentNotCreatedByCallerException extends _s.GenericAwsException {
  CommentNotCreatedByCallerException({String type, String message})
      : super(
            type: type,
            code: 'CommentNotCreatedByCallerException',
            message: message);
}

class CommitDoesNotExistException extends _s.GenericAwsException {
  CommitDoesNotExistException({String type, String message})
      : super(
            type: type, code: 'CommitDoesNotExistException', message: message);
}

class CommitIdDoesNotExistException extends _s.GenericAwsException {
  CommitIdDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'CommitIdDoesNotExistException',
            message: message);
}

class CommitIdRequiredException extends _s.GenericAwsException {
  CommitIdRequiredException({String type, String message})
      : super(type: type, code: 'CommitIdRequiredException', message: message);
}

class CommitIdsLimitExceededException extends _s.GenericAwsException {
  CommitIdsLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'CommitIdsLimitExceededException',
            message: message);
}

class CommitIdsListRequiredException extends _s.GenericAwsException {
  CommitIdsListRequiredException({String type, String message})
      : super(
            type: type,
            code: 'CommitIdsListRequiredException',
            message: message);
}

class CommitMessageLengthExceededException extends _s.GenericAwsException {
  CommitMessageLengthExceededException({String type, String message})
      : super(
            type: type,
            code: 'CommitMessageLengthExceededException',
            message: message);
}

class CommitRequiredException extends _s.GenericAwsException {
  CommitRequiredException({String type, String message})
      : super(type: type, code: 'CommitRequiredException', message: message);
}

class ConcurrentReferenceUpdateException extends _s.GenericAwsException {
  ConcurrentReferenceUpdateException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentReferenceUpdateException',
            message: message);
}

class DefaultBranchCannotBeDeletedException extends _s.GenericAwsException {
  DefaultBranchCannotBeDeletedException({String type, String message})
      : super(
            type: type,
            code: 'DefaultBranchCannotBeDeletedException',
            message: message);
}

class DirectoryNameConflictsWithFileNameException
    extends _s.GenericAwsException {
  DirectoryNameConflictsWithFileNameException({String type, String message})
      : super(
            type: type,
            code: 'DirectoryNameConflictsWithFileNameException',
            message: message);
}

class EncryptionIntegrityChecksFailedException extends _s.GenericAwsException {
  EncryptionIntegrityChecksFailedException({String type, String message})
      : super(
            type: type,
            code: 'EncryptionIntegrityChecksFailedException',
            message: message);
}

class EncryptionKeyAccessDeniedException extends _s.GenericAwsException {
  EncryptionKeyAccessDeniedException({String type, String message})
      : super(
            type: type,
            code: 'EncryptionKeyAccessDeniedException',
            message: message);
}

class EncryptionKeyDisabledException extends _s.GenericAwsException {
  EncryptionKeyDisabledException({String type, String message})
      : super(
            type: type,
            code: 'EncryptionKeyDisabledException',
            message: message);
}

class EncryptionKeyNotFoundException extends _s.GenericAwsException {
  EncryptionKeyNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'EncryptionKeyNotFoundException',
            message: message);
}

class EncryptionKeyUnavailableException extends _s.GenericAwsException {
  EncryptionKeyUnavailableException({String type, String message})
      : super(
            type: type,
            code: 'EncryptionKeyUnavailableException',
            message: message);
}

class FileContentAndSourceFileSpecifiedException
    extends _s.GenericAwsException {
  FileContentAndSourceFileSpecifiedException({String type, String message})
      : super(
            type: type,
            code: 'FileContentAndSourceFileSpecifiedException',
            message: message);
}

class FileContentRequiredException extends _s.GenericAwsException {
  FileContentRequiredException({String type, String message})
      : super(
            type: type, code: 'FileContentRequiredException', message: message);
}

class FileContentSizeLimitExceededException extends _s.GenericAwsException {
  FileContentSizeLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'FileContentSizeLimitExceededException',
            message: message);
}

class FileDoesNotExistException extends _s.GenericAwsException {
  FileDoesNotExistException({String type, String message})
      : super(type: type, code: 'FileDoesNotExistException', message: message);
}

class FileEntryRequiredException extends _s.GenericAwsException {
  FileEntryRequiredException({String type, String message})
      : super(type: type, code: 'FileEntryRequiredException', message: message);
}

class FileModeRequiredException extends _s.GenericAwsException {
  FileModeRequiredException({String type, String message})
      : super(type: type, code: 'FileModeRequiredException', message: message);
}

class FileNameConflictsWithDirectoryNameException
    extends _s.GenericAwsException {
  FileNameConflictsWithDirectoryNameException({String type, String message})
      : super(
            type: type,
            code: 'FileNameConflictsWithDirectoryNameException',
            message: message);
}

class FilePathConflictsWithSubmodulePathException
    extends _s.GenericAwsException {
  FilePathConflictsWithSubmodulePathException({String type, String message})
      : super(
            type: type,
            code: 'FilePathConflictsWithSubmodulePathException',
            message: message);
}

class FileTooLargeException extends _s.GenericAwsException {
  FileTooLargeException({String type, String message})
      : super(type: type, code: 'FileTooLargeException', message: message);
}

class FolderContentSizeLimitExceededException extends _s.GenericAwsException {
  FolderContentSizeLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'FolderContentSizeLimitExceededException',
            message: message);
}

class FolderDoesNotExistException extends _s.GenericAwsException {
  FolderDoesNotExistException({String type, String message})
      : super(
            type: type, code: 'FolderDoesNotExistException', message: message);
}

class IdempotencyParameterMismatchException extends _s.GenericAwsException {
  IdempotencyParameterMismatchException({String type, String message})
      : super(
            type: type,
            code: 'IdempotencyParameterMismatchException',
            message: message);
}

class InvalidActorArnException extends _s.GenericAwsException {
  InvalidActorArnException({String type, String message})
      : super(type: type, code: 'InvalidActorArnException', message: message);
}

class InvalidApprovalRuleContentException extends _s.GenericAwsException {
  InvalidApprovalRuleContentException({String type, String message})
      : super(
            type: type,
            code: 'InvalidApprovalRuleContentException',
            message: message);
}

class InvalidApprovalRuleNameException extends _s.GenericAwsException {
  InvalidApprovalRuleNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidApprovalRuleNameException',
            message: message);
}

class InvalidApprovalRuleTemplateContentException
    extends _s.GenericAwsException {
  InvalidApprovalRuleTemplateContentException({String type, String message})
      : super(
            type: type,
            code: 'InvalidApprovalRuleTemplateContentException',
            message: message);
}

class InvalidApprovalRuleTemplateDescriptionException
    extends _s.GenericAwsException {
  InvalidApprovalRuleTemplateDescriptionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidApprovalRuleTemplateDescriptionException',
            message: message);
}

class InvalidApprovalRuleTemplateNameException extends _s.GenericAwsException {
  InvalidApprovalRuleTemplateNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidApprovalRuleTemplateNameException',
            message: message);
}

class InvalidApprovalStateException extends _s.GenericAwsException {
  InvalidApprovalStateException({String type, String message})
      : super(
            type: type,
            code: 'InvalidApprovalStateException',
            message: message);
}

class InvalidAuthorArnException extends _s.GenericAwsException {
  InvalidAuthorArnException({String type, String message})
      : super(type: type, code: 'InvalidAuthorArnException', message: message);
}

class InvalidBlobIdException extends _s.GenericAwsException {
  InvalidBlobIdException({String type, String message})
      : super(type: type, code: 'InvalidBlobIdException', message: message);
}

class InvalidBranchNameException extends _s.GenericAwsException {
  InvalidBranchNameException({String type, String message})
      : super(type: type, code: 'InvalidBranchNameException', message: message);
}

class InvalidClientRequestTokenException extends _s.GenericAwsException {
  InvalidClientRequestTokenException({String type, String message})
      : super(
            type: type,
            code: 'InvalidClientRequestTokenException',
            message: message);
}

class InvalidCommentIdException extends _s.GenericAwsException {
  InvalidCommentIdException({String type, String message})
      : super(type: type, code: 'InvalidCommentIdException', message: message);
}

class InvalidCommitException extends _s.GenericAwsException {
  InvalidCommitException({String type, String message})
      : super(type: type, code: 'InvalidCommitException', message: message);
}

class InvalidCommitIdException extends _s.GenericAwsException {
  InvalidCommitIdException({String type, String message})
      : super(type: type, code: 'InvalidCommitIdException', message: message);
}

class InvalidConflictDetailLevelException extends _s.GenericAwsException {
  InvalidConflictDetailLevelException({String type, String message})
      : super(
            type: type,
            code: 'InvalidConflictDetailLevelException',
            message: message);
}

class InvalidConflictResolutionException extends _s.GenericAwsException {
  InvalidConflictResolutionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidConflictResolutionException',
            message: message);
}

class InvalidConflictResolutionStrategyException
    extends _s.GenericAwsException {
  InvalidConflictResolutionStrategyException({String type, String message})
      : super(
            type: type,
            code: 'InvalidConflictResolutionStrategyException',
            message: message);
}

class InvalidContinuationTokenException extends _s.GenericAwsException {
  InvalidContinuationTokenException({String type, String message})
      : super(
            type: type,
            code: 'InvalidContinuationTokenException',
            message: message);
}

class InvalidDeletionParameterException extends _s.GenericAwsException {
  InvalidDeletionParameterException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeletionParameterException',
            message: message);
}

class InvalidDescriptionException extends _s.GenericAwsException {
  InvalidDescriptionException({String type, String message})
      : super(
            type: type, code: 'InvalidDescriptionException', message: message);
}

class InvalidDestinationCommitSpecifierException
    extends _s.GenericAwsException {
  InvalidDestinationCommitSpecifierException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDestinationCommitSpecifierException',
            message: message);
}

class InvalidEmailException extends _s.GenericAwsException {
  InvalidEmailException({String type, String message})
      : super(type: type, code: 'InvalidEmailException', message: message);
}

class InvalidFileLocationException extends _s.GenericAwsException {
  InvalidFileLocationException({String type, String message})
      : super(
            type: type, code: 'InvalidFileLocationException', message: message);
}

class InvalidFileModeException extends _s.GenericAwsException {
  InvalidFileModeException({String type, String message})
      : super(type: type, code: 'InvalidFileModeException', message: message);
}

class InvalidFilePositionException extends _s.GenericAwsException {
  InvalidFilePositionException({String type, String message})
      : super(
            type: type, code: 'InvalidFilePositionException', message: message);
}

class InvalidMaxConflictFilesException extends _s.GenericAwsException {
  InvalidMaxConflictFilesException({String type, String message})
      : super(
            type: type,
            code: 'InvalidMaxConflictFilesException',
            message: message);
}

class InvalidMaxMergeHunksException extends _s.GenericAwsException {
  InvalidMaxMergeHunksException({String type, String message})
      : super(
            type: type,
            code: 'InvalidMaxMergeHunksException',
            message: message);
}

class InvalidMaxResultsException extends _s.GenericAwsException {
  InvalidMaxResultsException({String type, String message})
      : super(type: type, code: 'InvalidMaxResultsException', message: message);
}

class InvalidMergeOptionException extends _s.GenericAwsException {
  InvalidMergeOptionException({String type, String message})
      : super(
            type: type, code: 'InvalidMergeOptionException', message: message);
}

class InvalidOrderException extends _s.GenericAwsException {
  InvalidOrderException({String type, String message})
      : super(type: type, code: 'InvalidOrderException', message: message);
}

class InvalidOverrideStatusException extends _s.GenericAwsException {
  InvalidOverrideStatusException({String type, String message})
      : super(
            type: type,
            code: 'InvalidOverrideStatusException',
            message: message);
}

class InvalidParentCommitIdException extends _s.GenericAwsException {
  InvalidParentCommitIdException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParentCommitIdException',
            message: message);
}

class InvalidPathException extends _s.GenericAwsException {
  InvalidPathException({String type, String message})
      : super(type: type, code: 'InvalidPathException', message: message);
}

class InvalidPullRequestEventTypeException extends _s.GenericAwsException {
  InvalidPullRequestEventTypeException({String type, String message})
      : super(
            type: type,
            code: 'InvalidPullRequestEventTypeException',
            message: message);
}

class InvalidPullRequestIdException extends _s.GenericAwsException {
  InvalidPullRequestIdException({String type, String message})
      : super(
            type: type,
            code: 'InvalidPullRequestIdException',
            message: message);
}

class InvalidPullRequestStatusException extends _s.GenericAwsException {
  InvalidPullRequestStatusException({String type, String message})
      : super(
            type: type,
            code: 'InvalidPullRequestStatusException',
            message: message);
}

class InvalidPullRequestStatusUpdateException extends _s.GenericAwsException {
  InvalidPullRequestStatusUpdateException({String type, String message})
      : super(
            type: type,
            code: 'InvalidPullRequestStatusUpdateException',
            message: message);
}

class InvalidReactionUserArnException extends _s.GenericAwsException {
  InvalidReactionUserArnException({String type, String message})
      : super(
            type: type,
            code: 'InvalidReactionUserArnException',
            message: message);
}

class InvalidReactionValueException extends _s.GenericAwsException {
  InvalidReactionValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidReactionValueException',
            message: message);
}

class InvalidReferenceNameException extends _s.GenericAwsException {
  InvalidReferenceNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidReferenceNameException',
            message: message);
}

class InvalidRelativeFileVersionEnumException extends _s.GenericAwsException {
  InvalidRelativeFileVersionEnumException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRelativeFileVersionEnumException',
            message: message);
}

class InvalidReplacementContentException extends _s.GenericAwsException {
  InvalidReplacementContentException({String type, String message})
      : super(
            type: type,
            code: 'InvalidReplacementContentException',
            message: message);
}

class InvalidReplacementTypeException extends _s.GenericAwsException {
  InvalidReplacementTypeException({String type, String message})
      : super(
            type: type,
            code: 'InvalidReplacementTypeException',
            message: message);
}

class InvalidRepositoryDescriptionException extends _s.GenericAwsException {
  InvalidRepositoryDescriptionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRepositoryDescriptionException',
            message: message);
}

class InvalidRepositoryNameException extends _s.GenericAwsException {
  InvalidRepositoryNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRepositoryNameException',
            message: message);
}

class InvalidRepositoryTriggerBranchNameException
    extends _s.GenericAwsException {
  InvalidRepositoryTriggerBranchNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerBranchNameException',
            message: message);
}

class InvalidRepositoryTriggerCustomDataException
    extends _s.GenericAwsException {
  InvalidRepositoryTriggerCustomDataException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerCustomDataException',
            message: message);
}

class InvalidRepositoryTriggerDestinationArnException
    extends _s.GenericAwsException {
  InvalidRepositoryTriggerDestinationArnException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerDestinationArnException',
            message: message);
}

class InvalidRepositoryTriggerEventsException extends _s.GenericAwsException {
  InvalidRepositoryTriggerEventsException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerEventsException',
            message: message);
}

class InvalidRepositoryTriggerNameException extends _s.GenericAwsException {
  InvalidRepositoryTriggerNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerNameException',
            message: message);
}

class InvalidRepositoryTriggerRegionException extends _s.GenericAwsException {
  InvalidRepositoryTriggerRegionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRepositoryTriggerRegionException',
            message: message);
}

class InvalidResourceArnException extends _s.GenericAwsException {
  InvalidResourceArnException({String type, String message})
      : super(
            type: type, code: 'InvalidResourceArnException', message: message);
}

class InvalidRevisionIdException extends _s.GenericAwsException {
  InvalidRevisionIdException({String type, String message})
      : super(type: type, code: 'InvalidRevisionIdException', message: message);
}

class InvalidRuleContentSha256Exception extends _s.GenericAwsException {
  InvalidRuleContentSha256Exception({String type, String message})
      : super(
            type: type,
            code: 'InvalidRuleContentSha256Exception',
            message: message);
}

class InvalidSortByException extends _s.GenericAwsException {
  InvalidSortByException({String type, String message})
      : super(type: type, code: 'InvalidSortByException', message: message);
}

class InvalidSourceCommitSpecifierException extends _s.GenericAwsException {
  InvalidSourceCommitSpecifierException({String type, String message})
      : super(
            type: type,
            code: 'InvalidSourceCommitSpecifierException',
            message: message);
}

class InvalidSystemTagUsageException extends _s.GenericAwsException {
  InvalidSystemTagUsageException({String type, String message})
      : super(
            type: type,
            code: 'InvalidSystemTagUsageException',
            message: message);
}

class InvalidTagKeysListException extends _s.GenericAwsException {
  InvalidTagKeysListException({String type, String message})
      : super(
            type: type, code: 'InvalidTagKeysListException', message: message);
}

class InvalidTagsMapException extends _s.GenericAwsException {
  InvalidTagsMapException({String type, String message})
      : super(type: type, code: 'InvalidTagsMapException', message: message);
}

class InvalidTargetBranchException extends _s.GenericAwsException {
  InvalidTargetBranchException({String type, String message})
      : super(
            type: type, code: 'InvalidTargetBranchException', message: message);
}

class InvalidTargetException extends _s.GenericAwsException {
  InvalidTargetException({String type, String message})
      : super(type: type, code: 'InvalidTargetException', message: message);
}

class InvalidTargetsException extends _s.GenericAwsException {
  InvalidTargetsException({String type, String message})
      : super(type: type, code: 'InvalidTargetsException', message: message);
}

class InvalidTitleException extends _s.GenericAwsException {
  InvalidTitleException({String type, String message})
      : super(type: type, code: 'InvalidTitleException', message: message);
}

class ManualMergeRequiredException extends _s.GenericAwsException {
  ManualMergeRequiredException({String type, String message})
      : super(
            type: type, code: 'ManualMergeRequiredException', message: message);
}

class MaximumBranchesExceededException extends _s.GenericAwsException {
  MaximumBranchesExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaximumBranchesExceededException',
            message: message);
}

class MaximumConflictResolutionEntriesExceededException
    extends _s.GenericAwsException {
  MaximumConflictResolutionEntriesExceededException(
      {String type, String message})
      : super(
            type: type,
            code: 'MaximumConflictResolutionEntriesExceededException',
            message: message);
}

class MaximumFileContentToLoadExceededException extends _s.GenericAwsException {
  MaximumFileContentToLoadExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaximumFileContentToLoadExceededException',
            message: message);
}

class MaximumFileEntriesExceededException extends _s.GenericAwsException {
  MaximumFileEntriesExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaximumFileEntriesExceededException',
            message: message);
}

class MaximumItemsToCompareExceededException extends _s.GenericAwsException {
  MaximumItemsToCompareExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaximumItemsToCompareExceededException',
            message: message);
}

class MaximumNumberOfApprovalsExceededException extends _s.GenericAwsException {
  MaximumNumberOfApprovalsExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaximumNumberOfApprovalsExceededException',
            message: message);
}

class MaximumOpenPullRequestsExceededException extends _s.GenericAwsException {
  MaximumOpenPullRequestsExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaximumOpenPullRequestsExceededException',
            message: message);
}

class MaximumRepositoryNamesExceededException extends _s.GenericAwsException {
  MaximumRepositoryNamesExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaximumRepositoryNamesExceededException',
            message: message);
}

class MaximumRepositoryTriggersExceededException
    extends _s.GenericAwsException {
  MaximumRepositoryTriggersExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaximumRepositoryTriggersExceededException',
            message: message);
}

class MaximumRuleTemplatesAssociatedWithRepositoryException
    extends _s.GenericAwsException {
  MaximumRuleTemplatesAssociatedWithRepositoryException(
      {String type, String message})
      : super(
            type: type,
            code: 'MaximumRuleTemplatesAssociatedWithRepositoryException',
            message: message);
}

class MergeOptionRequiredException extends _s.GenericAwsException {
  MergeOptionRequiredException({String type, String message})
      : super(
            type: type, code: 'MergeOptionRequiredException', message: message);
}

class MultipleConflictResolutionEntriesException
    extends _s.GenericAwsException {
  MultipleConflictResolutionEntriesException({String type, String message})
      : super(
            type: type,
            code: 'MultipleConflictResolutionEntriesException',
            message: message);
}

class MultipleRepositoriesInPullRequestException
    extends _s.GenericAwsException {
  MultipleRepositoriesInPullRequestException({String type, String message})
      : super(
            type: type,
            code: 'MultipleRepositoriesInPullRequestException',
            message: message);
}

class NameLengthExceededException extends _s.GenericAwsException {
  NameLengthExceededException({String type, String message})
      : super(
            type: type, code: 'NameLengthExceededException', message: message);
}

class NoChangeException extends _s.GenericAwsException {
  NoChangeException({String type, String message})
      : super(type: type, code: 'NoChangeException', message: message);
}

class NumberOfRuleTemplatesExceededException extends _s.GenericAwsException {
  NumberOfRuleTemplatesExceededException({String type, String message})
      : super(
            type: type,
            code: 'NumberOfRuleTemplatesExceededException',
            message: message);
}

class NumberOfRulesExceededException extends _s.GenericAwsException {
  NumberOfRulesExceededException({String type, String message})
      : super(
            type: type,
            code: 'NumberOfRulesExceededException',
            message: message);
}

class OverrideAlreadySetException extends _s.GenericAwsException {
  OverrideAlreadySetException({String type, String message})
      : super(
            type: type, code: 'OverrideAlreadySetException', message: message);
}

class OverrideStatusRequiredException extends _s.GenericAwsException {
  OverrideStatusRequiredException({String type, String message})
      : super(
            type: type,
            code: 'OverrideStatusRequiredException',
            message: message);
}

class ParentCommitDoesNotExistException extends _s.GenericAwsException {
  ParentCommitDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'ParentCommitDoesNotExistException',
            message: message);
}

class ParentCommitIdOutdatedException extends _s.GenericAwsException {
  ParentCommitIdOutdatedException({String type, String message})
      : super(
            type: type,
            code: 'ParentCommitIdOutdatedException',
            message: message);
}

class ParentCommitIdRequiredException extends _s.GenericAwsException {
  ParentCommitIdRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ParentCommitIdRequiredException',
            message: message);
}

class PathDoesNotExistException extends _s.GenericAwsException {
  PathDoesNotExistException({String type, String message})
      : super(type: type, code: 'PathDoesNotExistException', message: message);
}

class PathRequiredException extends _s.GenericAwsException {
  PathRequiredException({String type, String message})
      : super(type: type, code: 'PathRequiredException', message: message);
}

class PullRequestAlreadyClosedException extends _s.GenericAwsException {
  PullRequestAlreadyClosedException({String type, String message})
      : super(
            type: type,
            code: 'PullRequestAlreadyClosedException',
            message: message);
}

class PullRequestApprovalRulesNotSatisfiedException
    extends _s.GenericAwsException {
  PullRequestApprovalRulesNotSatisfiedException({String type, String message})
      : super(
            type: type,
            code: 'PullRequestApprovalRulesNotSatisfiedException',
            message: message);
}

class PullRequestCannotBeApprovedByAuthorException
    extends _s.GenericAwsException {
  PullRequestCannotBeApprovedByAuthorException({String type, String message})
      : super(
            type: type,
            code: 'PullRequestCannotBeApprovedByAuthorException',
            message: message);
}

class PullRequestDoesNotExistException extends _s.GenericAwsException {
  PullRequestDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'PullRequestDoesNotExistException',
            message: message);
}

class PullRequestIdRequiredException extends _s.GenericAwsException {
  PullRequestIdRequiredException({String type, String message})
      : super(
            type: type,
            code: 'PullRequestIdRequiredException',
            message: message);
}

class PullRequestStatusRequiredException extends _s.GenericAwsException {
  PullRequestStatusRequiredException({String type, String message})
      : super(
            type: type,
            code: 'PullRequestStatusRequiredException',
            message: message);
}

class PutFileEntryConflictException extends _s.GenericAwsException {
  PutFileEntryConflictException({String type, String message})
      : super(
            type: type,
            code: 'PutFileEntryConflictException',
            message: message);
}

class ReactionLimitExceededException extends _s.GenericAwsException {
  ReactionLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ReactionLimitExceededException',
            message: message);
}

class ReactionValueRequiredException extends _s.GenericAwsException {
  ReactionValueRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ReactionValueRequiredException',
            message: message);
}

class ReferenceDoesNotExistException extends _s.GenericAwsException {
  ReferenceDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'ReferenceDoesNotExistException',
            message: message);
}

class ReferenceNameRequiredException extends _s.GenericAwsException {
  ReferenceNameRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ReferenceNameRequiredException',
            message: message);
}

class ReferenceTypeNotSupportedException extends _s.GenericAwsException {
  ReferenceTypeNotSupportedException({String type, String message})
      : super(
            type: type,
            code: 'ReferenceTypeNotSupportedException',
            message: message);
}

class ReplacementContentRequiredException extends _s.GenericAwsException {
  ReplacementContentRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ReplacementContentRequiredException',
            message: message);
}

class ReplacementTypeRequiredException extends _s.GenericAwsException {
  ReplacementTypeRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ReplacementTypeRequiredException',
            message: message);
}

class RepositoryDoesNotExistException extends _s.GenericAwsException {
  RepositoryDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryDoesNotExistException',
            message: message);
}

class RepositoryLimitExceededException extends _s.GenericAwsException {
  RepositoryLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryLimitExceededException',
            message: message);
}

class RepositoryNameExistsException extends _s.GenericAwsException {
  RepositoryNameExistsException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryNameExistsException',
            message: message);
}

class RepositoryNameRequiredException extends _s.GenericAwsException {
  RepositoryNameRequiredException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryNameRequiredException',
            message: message);
}

class RepositoryNamesRequiredException extends _s.GenericAwsException {
  RepositoryNamesRequiredException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryNamesRequiredException',
            message: message);
}

class RepositoryNotAssociatedWithPullRequestException
    extends _s.GenericAwsException {
  RepositoryNotAssociatedWithPullRequestException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryNotAssociatedWithPullRequestException',
            message: message);
}

class RepositoryTriggerBranchNameListRequiredException
    extends _s.GenericAwsException {
  RepositoryTriggerBranchNameListRequiredException(
      {String type, String message})
      : super(
            type: type,
            code: 'RepositoryTriggerBranchNameListRequiredException',
            message: message);
}

class RepositoryTriggerDestinationArnRequiredException
    extends _s.GenericAwsException {
  RepositoryTriggerDestinationArnRequiredException(
      {String type, String message})
      : super(
            type: type,
            code: 'RepositoryTriggerDestinationArnRequiredException',
            message: message);
}

class RepositoryTriggerEventsListRequiredException
    extends _s.GenericAwsException {
  RepositoryTriggerEventsListRequiredException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryTriggerEventsListRequiredException',
            message: message);
}

class RepositoryTriggerNameRequiredException extends _s.GenericAwsException {
  RepositoryTriggerNameRequiredException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryTriggerNameRequiredException',
            message: message);
}

class RepositoryTriggersListRequiredException extends _s.GenericAwsException {
  RepositoryTriggersListRequiredException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryTriggersListRequiredException',
            message: message);
}

class ResourceArnRequiredException extends _s.GenericAwsException {
  ResourceArnRequiredException({String type, String message})
      : super(
            type: type, code: 'ResourceArnRequiredException', message: message);
}

class RestrictedSourceFileException extends _s.GenericAwsException {
  RestrictedSourceFileException({String type, String message})
      : super(
            type: type,
            code: 'RestrictedSourceFileException',
            message: message);
}

class RevisionIdRequiredException extends _s.GenericAwsException {
  RevisionIdRequiredException({String type, String message})
      : super(
            type: type, code: 'RevisionIdRequiredException', message: message);
}

class RevisionNotCurrentException extends _s.GenericAwsException {
  RevisionNotCurrentException({String type, String message})
      : super(
            type: type, code: 'RevisionNotCurrentException', message: message);
}

class SameFileContentException extends _s.GenericAwsException {
  SameFileContentException({String type, String message})
      : super(type: type, code: 'SameFileContentException', message: message);
}

class SamePathRequestException extends _s.GenericAwsException {
  SamePathRequestException({String type, String message})
      : super(type: type, code: 'SamePathRequestException', message: message);
}

class SourceAndDestinationAreSameException extends _s.GenericAwsException {
  SourceAndDestinationAreSameException({String type, String message})
      : super(
            type: type,
            code: 'SourceAndDestinationAreSameException',
            message: message);
}

class SourceFileOrContentRequiredException extends _s.GenericAwsException {
  SourceFileOrContentRequiredException({String type, String message})
      : super(
            type: type,
            code: 'SourceFileOrContentRequiredException',
            message: message);
}

class TagKeysListRequiredException extends _s.GenericAwsException {
  TagKeysListRequiredException({String type, String message})
      : super(
            type: type, code: 'TagKeysListRequiredException', message: message);
}

class TagPolicyException extends _s.GenericAwsException {
  TagPolicyException({String type, String message})
      : super(type: type, code: 'TagPolicyException', message: message);
}

class TagsMapRequiredException extends _s.GenericAwsException {
  TagsMapRequiredException({String type, String message})
      : super(type: type, code: 'TagsMapRequiredException', message: message);
}

class TargetRequiredException extends _s.GenericAwsException {
  TargetRequiredException({String type, String message})
      : super(type: type, code: 'TargetRequiredException', message: message);
}

class TargetsRequiredException extends _s.GenericAwsException {
  TargetsRequiredException({String type, String message})
      : super(type: type, code: 'TargetsRequiredException', message: message);
}

class TipOfSourceReferenceIsDifferentException extends _s.GenericAwsException {
  TipOfSourceReferenceIsDifferentException({String type, String message})
      : super(
            type: type,
            code: 'TipOfSourceReferenceIsDifferentException',
            message: message);
}

class TipsDivergenceExceededException extends _s.GenericAwsException {
  TipsDivergenceExceededException({String type, String message})
      : super(
            type: type,
            code: 'TipsDivergenceExceededException',
            message: message);
}

class TitleRequiredException extends _s.GenericAwsException {
  TitleRequiredException({String type, String message})
      : super(type: type, code: 'TitleRequiredException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
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
  'EncryptionKeyNotFoundException': (type, message) =>
      EncryptionKeyNotFoundException(type: type, message: message),
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
