// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// This section provides documentation for the Amazon CodeGuru Reviewer API
/// operations. CodeGuru Reviewer is a service that uses program analysis and
/// machine learning to detect potential defects that are difficult for
/// developers to find and recommends fixes in your Java code.
///
/// By proactively detecting and providing recommendations for addressing code
/// defects and implementing best practices, CodeGuru Reviewer improves the
/// overall quality and maintainability of your code base during the code review
/// stage. For more information about CodeGuru Reviewer, see the <i> <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/welcome.html">Amazon
/// CodeGuru Reviewer User Guide</a>.</i>
///
/// To improve the security of your CodeGuru Reviewer API calls, you can
/// establish a private connection between your VPC and CodeGuru Reviewer by
/// creating an <i>interface VPC endpoint</i>. For more information, see <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/vpc-interface-endpoints.html">CodeGuru
/// Reviewer and interface VPC endpoints (AWS PrivateLink)</a> in the <i>Amazon
/// CodeGuru Reviewer User Guide</i>.
class CodeGuruReviewer {
  final _s.RestJsonProtocol _protocol;
  CodeGuruReviewer({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codeguru-reviewer',
            signingName: 'codeguru-reviewer',
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

  /// Use to associate an AWS CodeCommit repository or a repostory managed by
  /// AWS CodeStar Connections with Amazon CodeGuru Reviewer. When you associate
  /// a repository, CodeGuru Reviewer reviews source code changes in the
  /// repository's pull requests and provides automatic recommendations. You can
  /// view recommendations using the CodeGuru Reviewer console. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/recommendations.html">Recommendations
  /// in Amazon CodeGuru Reviewer</a> in the <i>Amazon CodeGuru Reviewer User
  /// Guide.</i>
  ///
  /// If you associate a CodeCommit repository, it must be in the same AWS
  /// Region and AWS account where its CodeGuru Reviewer code reviews are
  /// configured.
  ///
  /// Bitbucket and GitHub Enterprise Server repositories are managed by AWS
  /// CodeStar Connections to connect to CodeGuru Reviewer. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/reviewer-ug/step-one.html#select-repository-source-provider">Connect
  /// to a repository source provider</a> in the <i>Amazon CodeGuru Reviewer
  /// User Guide.</i>
  /// <note>
  /// You cannot use the CodeGuru Reviewer SDK or the AWS CLI to associate a
  /// GitHub repository with Amazon CodeGuru Reviewer. To associate a GitHub
  /// repository, use the console. For more information, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/getting-started-with-guru.html">Getting
  /// started with CodeGuru Reviewer</a> in the <i>CodeGuru Reviewer User
  /// Guide.</i>
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [repository] :
  /// The repository to associate.
  ///
  /// Parameter [clientRequestToken] :
  /// Amazon CodeGuru Reviewer uses this value to prevent the accidental
  /// creation of duplicate repository associations if there are failures and
  /// retries.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs used to tag an associated repository. A tag is
  /// a custom attribute label with two parts:
  ///
  /// <ul>
  /// <li>
  /// A <i>tag key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>).
  /// Tag keys are case sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a <i>tag value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag value is the same as using an empty string. Like tag
  /// keys, tag values are case sensitive.
  /// </li>
  /// </ul>
  Future<AssociateRepositoryResponse> associateRepository({
    required Repository repository,
    String? clientRequestToken,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    final $payload = <String, dynamic>{
      'Repository': repository,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/associations',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateRepositoryResponse.fromJson(response);
  }

  /// Use to create a code review with a <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReviewType.html">
  /// <code>CodeReviewType</code> </a> of <code>RepositoryAnalysis</code>. This
  /// type of code review analyzes all code under a specified branch in an
  /// associated repository. <code>PullRequest</code> code reviews are
  /// automatically triggered by a pull request so cannot be created using this
  /// method.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the code review. The name of each code review in your AWS
  /// account must be unique.
  ///
  /// Parameter [repositoryAssociationArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> object. You can retrieve this ARN
  /// by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
  /// <code>ListRepositoryAssociations</code> </a>.
  ///
  /// A code review can only be created on an associated repository. This is the
  /// ARN of the associated repository.
  ///
  /// Parameter [type] :
  /// The type of code review to create. This is specified using a <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReviewType.html">
  /// <code>CodeReviewType</code> </a> object. You can create a code review only
  /// of type <code>RepositoryAnalysis</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// Amazon CodeGuru Reviewer uses this value to prevent the accidental
  /// creation of duplicate code reviews if there are failures and retries.
  Future<CreateCodeReviewResponse> createCodeReview({
    required String name,
    required String repositoryAssociationArn,
    required CodeReviewType type,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        repositoryAssociationArn, 'repositoryAssociationArn');
    _s.validateStringLength(
      'repositoryAssociationArn',
      repositoryAssociationArn,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'RepositoryAssociationArn': repositoryAssociationArn,
      'Type': type,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codereviews',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCodeReviewResponse.fromJson(response);
  }

  /// Returns the metadata associated with the code review along with its
  /// status.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [codeReviewArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  Future<DescribeCodeReviewResponse> describeCodeReview({
    required String codeReviewArn,
  }) async {
    ArgumentError.checkNotNull(codeReviewArn, 'codeReviewArn');
    _s.validateStringLength(
      'codeReviewArn',
      codeReviewArn,
      1,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/codereviews/${Uri.encodeComponent(codeReviewArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCodeReviewResponse.fromJson(response);
  }

  /// Describes the customer feedback for a CodeGuru Reviewer recommendation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [codeReviewArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  ///
  /// Parameter [recommendationId] :
  /// The recommendation ID that can be used to track the provided
  /// recommendations and then to collect the feedback.
  ///
  /// Parameter [userId] :
  /// Optional parameter to describe the feedback for a given user. If this is
  /// not supplied, it defaults to the user making the request.
  ///
  /// The <code>UserId</code> is an IAM principal that can be specified as an
  /// AWS account ID or an Amazon Resource Name (ARN). For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">
  /// Specifying a Principal</a> in the <i>AWS Identity and Access Management
  /// User Guide</i>.
  Future<DescribeRecommendationFeedbackResponse>
      describeRecommendationFeedback({
    required String codeReviewArn,
    required String recommendationId,
    String? userId,
  }) async {
    ArgumentError.checkNotNull(codeReviewArn, 'codeReviewArn');
    _s.validateStringLength(
      'codeReviewArn',
      codeReviewArn,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(recommendationId, 'recommendationId');
    _s.validateStringLength(
      'recommendationId',
      recommendationId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
    );
    final $query = <String, List<String>>{
      'RecommendationId': [recommendationId],
      if (userId != null) 'UserId': [userId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/feedback/${Uri.encodeComponent(codeReviewArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRecommendationFeedbackResponse.fromJson(response);
  }

  /// Returns a <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> object that contains information
  /// about the requested repository association.
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [associationArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> object. You can retrieve this ARN
  /// by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
  /// <code>ListRepositoryAssociations</code> </a>.
  Future<DescribeRepositoryAssociationResponse> describeRepositoryAssociation({
    required String associationArn,
  }) async {
    ArgumentError.checkNotNull(associationArn, 'associationArn');
    _s.validateStringLength(
      'associationArn',
      associationArn,
      1,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/associations/${Uri.encodeComponent(associationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRepositoryAssociationResponse.fromJson(response);
  }

  /// Removes the association between Amazon CodeGuru Reviewer and a repository.
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [associationArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> object. You can retrieve this ARN
  /// by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
  /// <code>ListRepositoryAssociations</code> </a>.
  Future<DisassociateRepositoryResponse> disassociateRepository({
    required String associationArn,
  }) async {
    ArgumentError.checkNotNull(associationArn, 'associationArn');
    _s.validateStringLength(
      'associationArn',
      associationArn,
      1,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/associations/${Uri.encodeComponent(associationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateRepositoryResponse.fromJson(response);
  }

  /// Lists all the code reviews that the customer has created in the past 90
  /// days.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [type] :
  /// The type of code reviews to list in the response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. The default is
  /// 100.
  ///
  /// Parameter [nextToken] :
  /// If nextToken is returned, there are more results available. The value of
  /// nextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page. Keep all other
  /// arguments unchanged.
  ///
  /// Parameter [providerTypes] :
  /// List of provider types for filtering that needs to be applied before
  /// displaying the result. For example, <code>providerTypes=[GitHub]</code>
  /// lists code reviews from GitHub.
  ///
  /// Parameter [repositoryNames] :
  /// List of repository names for filtering that needs to be applied before
  /// displaying the result.
  ///
  /// Parameter [states] :
  /// List of states for filtering that needs to be applied before displaying
  /// the result. For example, <code>states=[Pending]</code> lists code reviews
  /// in the Pending state.
  ///
  /// The valid code review states are:
  ///
  /// <ul>
  /// <li>
  /// <code>Completed</code>: The code review is complete.
  /// </li>
  /// <li>
  /// <code>Pending</code>: The code review started and has not completed or
  /// failed.
  /// </li>
  /// <li>
  /// <code>Failed</code>: The code review failed.
  /// </li>
  /// <li>
  /// <code>Deleting</code>: The code review is being deleted.
  /// </li>
  /// </ul>
  Future<ListCodeReviewsResponse> listCodeReviews({
    required Type type,
    int? maxResults,
    String? nextToken,
    List<ProviderType>? providerTypes,
    List<String>? repositoryNames,
    List<JobState>? states,
  }) async {
    ArgumentError.checkNotNull(type, 'type');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      'Type': [type.toValue()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (providerTypes != null)
        'ProviderTypes': providerTypes.map((e) => e.toValue()).toList(),
      if (repositoryNames != null) 'RepositoryNames': repositoryNames,
      if (states != null) 'States': states.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/codereviews',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCodeReviewsResponse.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RecommendationFeedbackSummary.html">
  /// <code>RecommendationFeedbackSummary</code> </a> objects that contain
  /// customer recommendation feedback for all CodeGuru Reviewer users.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [codeReviewArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. The default is
  /// 100.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of nextToken is a unique pagination token for each page. Make
  /// the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged.
  ///
  /// Parameter [recommendationIds] :
  /// Used to query the recommendation feedback for a given recommendation.
  ///
  /// Parameter [userIds] :
  /// An AWS user's account ID or Amazon Resource Name (ARN). Use this ID to
  /// query the recommendation feedback for a code review from that user.
  ///
  /// The <code>UserId</code> is an IAM principal that can be specified as an
  /// AWS account ID or an Amazon Resource Name (ARN). For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">
  /// Specifying a Principal</a> in the <i>AWS Identity and Access Management
  /// User Guide</i>.
  Future<ListRecommendationFeedbackResponse> listRecommendationFeedback({
    required String codeReviewArn,
    int? maxResults,
    String? nextToken,
    List<String>? recommendationIds,
    List<String>? userIds,
  }) async {
    ArgumentError.checkNotNull(codeReviewArn, 'codeReviewArn');
    _s.validateStringLength(
      'codeReviewArn',
      codeReviewArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (recommendationIds != null) 'RecommendationIds': recommendationIds,
      if (userIds != null) 'UserIds': userIds,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/feedback/${Uri.encodeComponent(codeReviewArn)}/RecommendationFeedback',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationFeedbackResponse.fromJson(response);
  }

  /// Returns the list of all recommendations for a completed code review.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [codeReviewArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. The default is
  /// 100.
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  Future<ListRecommendationsResponse> listRecommendations({
    required String codeReviewArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(codeReviewArn, 'codeReviewArn');
    _s.validateStringLength(
      'codeReviewArn',
      codeReviewArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/codereviews/${Uri.encodeComponent(codeReviewArn)}/Recommendations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationsResponse.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html">
  /// <code>RepositoryAssociationSummary</code> </a> objects that contain
  /// summary information about a repository association. You can filter the
  /// returned list by <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-ProviderType">
  /// <code>ProviderType</code> </a>, <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-Name">
  /// <code>Name</code> </a>, <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-State">
  /// <code>State</code> </a>, and <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-Owner">
  /// <code>Owner</code> </a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository association results returned by
  /// <code>ListRepositoryAssociations</code> in paginated output. When this
  /// parameter is used, <code>ListRepositoryAssociations</code> only returns
  /// <code>maxResults</code> results in a single page with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListRepositoryAssociations</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, <code>ListRepositoryAssociations</code> returns up
  /// to 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [names] :
  /// List of repository names to use as a filter.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListRepositoryAssociations</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value.
  /// <note>
  /// Treat this token as an opaque identifier that is only used to retrieve the
  /// next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [owners] :
  /// List of owners to use as a filter. For AWS CodeCommit, it is the name of
  /// the CodeCommit account that was used to associate the repository. For
  /// other repository source providers, such as Bitbucket and GitHub Enterprise
  /// Server, this is name of the account that was used to associate the
  /// repository.
  ///
  /// Parameter [providerTypes] :
  /// List of provider types to use as a filter.
  ///
  /// Parameter [states] :
  /// List of repository association states to use as a filter.
  ///
  /// The valid repository association states are:
  ///
  /// <ul>
  /// <li>
  /// <b>Associated</b>: The repository association is complete.
  /// </li>
  /// <li>
  /// <b>Associating</b>: CodeGuru Reviewer is:
  ///
  /// <ul>
  /// <li>
  /// Setting up pull request notifications. This is required for pull requests
  /// to trigger a CodeGuru Reviewer review.
  /// <note>
  /// If your repository <code>ProviderType</code> is <code>GitHub</code>,
  /// <code>GitHub Enterprise Server</code>, or <code>Bitbucket</code>, CodeGuru
  /// Reviewer creates webhooks in your repository to trigger CodeGuru Reviewer
  /// reviews. If you delete these webhooks, reviews of code in your repository
  /// cannot be triggered.
  /// </note> </li>
  /// <li>
  /// Setting up source code access. This is required for CodeGuru Reviewer to
  /// securely clone code in your repository.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Failed</b>: The repository failed to associate or disassociate.
  /// </li>
  /// <li>
  /// <b>Disassociating</b>: CodeGuru Reviewer is removing the repository's pull
  /// request notifications and source code access.
  /// </li>
  /// <li>
  /// <b>Disassociated</b>: CodeGuru Reviewer successfully disassociated the
  /// repository. You can create a new association with this repository if you
  /// want to review source code in it later. You can control access to code
  /// reviews created in an associated repository with tags after it has been
  /// disassociated. For more information, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/auth-and-access-control-using-tags.html">Using
  /// tags to control access to associated repositories</a> in the <i>Amazon
  /// CodeGuru Reviewer User Guide</i>.
  /// </li>
  /// </ul>
  Future<ListRepositoryAssociationsResponse> listRepositoryAssociations({
    int? maxResults,
    List<String>? names,
    String? nextToken,
    List<String>? owners,
    List<ProviderType>? providerTypes,
    List<RepositoryAssociationState>? states,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (names != null) 'Name': names,
      if (nextToken != null) 'NextToken': [nextToken],
      if (owners != null) 'Owner': owners,
      if (providerTypes != null)
        'ProviderType': providerTypes.map((e) => e.toValue()).toList(),
      if (states != null) 'State': states.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRepositoryAssociationsResponse.fromJson(response);
  }

  /// Returns the list of tags associated with an associated repository
  /// resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> object. You can retrieve this ARN
  /// by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
  /// <code>ListRepositoryAssociations</code> </a>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Stores customer feedback for a CodeGuru Reviewer recommendation. When this
  /// API is called again with different reactions the previous feedback is
  /// overwritten.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [codeReviewArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  ///
  /// Parameter [reactions] :
  /// List for storing reactions. Reactions are utf-8 text code for emojis. If
  /// you send an empty list it clears all your feedback.
  ///
  /// Parameter [recommendationId] :
  /// The recommendation ID that can be used to track the provided
  /// recommendations and then to collect the feedback.
  Future<void> putRecommendationFeedback({
    required String codeReviewArn,
    required List<Reaction> reactions,
    required String recommendationId,
  }) async {
    ArgumentError.checkNotNull(codeReviewArn, 'codeReviewArn');
    _s.validateStringLength(
      'codeReviewArn',
      codeReviewArn,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(reactions, 'reactions');
    ArgumentError.checkNotNull(recommendationId, 'recommendationId');
    _s.validateStringLength(
      'recommendationId',
      recommendationId,
      1,
      64,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'CodeReviewArn': codeReviewArn,
      'Reactions': reactions.map((e) => e.toValue()).toList(),
      'RecommendationId': recommendationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/feedback',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds one or more tags to an associated repository.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs used to tag an associated repository. A tag is
  /// a custom attribute label with two parts:
  ///
  /// <ul>
  /// <li>
  /// A <i>tag key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>).
  /// Tag keys are case sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a <i>tag value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag value is the same as using an empty string. Like tag
  /// keys, tag values are case sensitive.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> object. You can retrieve this ARN
  /// by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
  /// <code>ListRepositoryAssociations</code> </a>.
  Future<void> tagResource({
    required Map<String, String> tags,
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(tags, 'tags');
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1600,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag from an associated repository.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [tagKeys] :
  /// A list of the keys for each tag you want to remove from an associated
  /// repository.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> object. You can retrieve this ARN
  /// by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
  /// <code>ListRepositoryAssociations</code> </a>.
  Future<void> untagResource({
    required List<String> tagKeys,
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1600,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

class AssociateRepositoryResponse {
  /// Information about the repository association.
  final RepositoryAssociation? repositoryAssociation;

  /// An array of key-value pairs used to tag an associated repository. A tag is a
  /// custom attribute label with two parts:
  ///
  /// <ul>
  /// <li>
  /// A <i>tag key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
  /// keys are case sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a <i>tag value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag value is the same as using an empty string. Like tag keys,
  /// tag values are case sensitive.
  /// </li>
  /// </ul>
  final Map<String, String>? tags;

  AssociateRepositoryResponse({
    this.repositoryAssociation,
    this.tags,
  });
  factory AssociateRepositoryResponse.fromJson(Map<String, dynamic> json) {
    return AssociateRepositoryResponse(
      repositoryAssociation: json['RepositoryAssociation'] != null
          ? RepositoryAssociation.fromJson(
              json['RepositoryAssociation'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

/// Information about an AWS CodeCommit repository. The CodeCommit repository
/// must be in the same AWS Region and AWS account where its CodeGuru Reviewer
/// code reviews are configured.
class CodeCommitRepository {
  /// The name of the AWS CodeCommit repository. For more information, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/APIReference/API_GetRepository.html#CodeCommit-GetRepository-request-repositoryName">repositoryName</a>
  /// in the <i>AWS CodeCommit API Reference</i>.
  final String name;

  CodeCommitRepository({
    required this.name,
  });
  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// Information about a code review. A code review belongs to the associated
/// repository that contains the reviewed code.
class CodeReview {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> that contains the reviewed source
  /// code. You can retrieve associated repository ARNs by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
  /// <code>ListRepositoryAssociations</code> </a>.
  final String? associationArn;

  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  final String? codeReviewArn;

  /// The time, in milliseconds since the epoch, when the code review was created.
  final DateTime? createdTimeStamp;

  /// The time, in milliseconds since the epoch, when the code review was last
  /// updated.
  final DateTime? lastUpdatedTimeStamp;

  /// The statistics from the code review.
  final Metrics? metrics;

  /// The name of the code review.
  final String? name;

  /// The owner of the repository. For an AWS CodeCommit repository, this is the
  /// AWS account ID of the account that owns the repository. For a GitHub, GitHub
  /// Enterprise Server, or Bitbucket repository, this is the username for the
  /// account that owns the repository.
  final String? owner;

  /// The type of repository that contains the reviewed code (for example, GitHub
  /// or Bitbucket).
  final ProviderType? providerType;

  /// The pull request ID for the code review.
  final String? pullRequestId;

  /// The name of the repository.
  final String? repositoryName;

  /// The type of the source code for the code review.
  final SourceCodeType? sourceCodeType;

  /// The valid code review states are:
  ///
  /// <ul>
  /// <li>
  /// <code>Completed</code>: The code review is complete.
  /// </li>
  /// <li>
  /// <code>Pending</code>: The code review started and has not completed or
  /// failed.
  /// </li>
  /// <li>
  /// <code>Failed</code>: The code review failed.
  /// </li>
  /// <li>
  /// <code>Deleting</code>: The code review is being deleted.
  /// </li>
  /// </ul>
  final JobState? state;

  /// The reason for the state of the code review.
  final String? stateReason;

  /// The type of code review.
  final Type? type;

  CodeReview({
    this.associationArn,
    this.codeReviewArn,
    this.createdTimeStamp,
    this.lastUpdatedTimeStamp,
    this.metrics,
    this.name,
    this.owner,
    this.providerType,
    this.pullRequestId,
    this.repositoryName,
    this.sourceCodeType,
    this.state,
    this.stateReason,
    this.type,
  });
  factory CodeReview.fromJson(Map<String, dynamic> json) {
    return CodeReview(
      associationArn: json['AssociationArn'] as String?,
      codeReviewArn: json['CodeReviewArn'] as String?,
      createdTimeStamp: timeStampFromJson(json['CreatedTimeStamp']),
      lastUpdatedTimeStamp: timeStampFromJson(json['LastUpdatedTimeStamp']),
      metrics: json['Metrics'] != null
          ? Metrics.fromJson(json['Metrics'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      providerType: (json['ProviderType'] as String?)?.toProviderType(),
      pullRequestId: json['PullRequestId'] as String?,
      repositoryName: json['RepositoryName'] as String?,
      sourceCodeType: json['SourceCodeType'] != null
          ? SourceCodeType.fromJson(
              json['SourceCodeType'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.toJobState(),
      stateReason: json['StateReason'] as String?,
      type: (json['Type'] as String?)?.toType(),
    );
  }
}

/// Information about the summary of the code review.
class CodeReviewSummary {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  final String? codeReviewArn;

  /// The time, in milliseconds since the epoch, when the code review was created.
  final DateTime? createdTimeStamp;

  /// The time, in milliseconds since the epoch, when the code review was last
  /// updated.
  final DateTime? lastUpdatedTimeStamp;

  /// The statistics from the code review.
  final MetricsSummary? metricsSummary;

  /// The name of the code review.
  final String? name;

  /// The owner of the repository. For an AWS CodeCommit repository, this is the
  /// AWS account ID of the account that owns the repository. For a GitHub, GitHub
  /// Enterprise Server, or Bitbucket repository, this is the username for the
  /// account that owns the repository.
  final String? owner;

  /// The provider type of the repository association.
  final ProviderType? providerType;

  /// The pull request ID for the code review.
  final String? pullRequestId;

  /// The name of the repository.
  final String? repositoryName;

  /// The state of the code review.
  ///
  /// The valid code review states are:
  ///
  /// <ul>
  /// <li>
  /// <code>Completed</code>: The code review is complete.
  /// </li>
  /// <li>
  /// <code>Pending</code>: The code review started and has not completed or
  /// failed.
  /// </li>
  /// <li>
  /// <code>Failed</code>: The code review failed.
  /// </li>
  /// <li>
  /// <code>Deleting</code>: The code review is being deleted.
  /// </li>
  /// </ul>
  final JobState? state;

  /// The type of the code review.
  final Type? type;

  CodeReviewSummary({
    this.codeReviewArn,
    this.createdTimeStamp,
    this.lastUpdatedTimeStamp,
    this.metricsSummary,
    this.name,
    this.owner,
    this.providerType,
    this.pullRequestId,
    this.repositoryName,
    this.state,
    this.type,
  });
  factory CodeReviewSummary.fromJson(Map<String, dynamic> json) {
    return CodeReviewSummary(
      codeReviewArn: json['CodeReviewArn'] as String?,
      createdTimeStamp: timeStampFromJson(json['CreatedTimeStamp']),
      lastUpdatedTimeStamp: timeStampFromJson(json['LastUpdatedTimeStamp']),
      metricsSummary: json['MetricsSummary'] != null
          ? MetricsSummary.fromJson(
              json['MetricsSummary'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      providerType: (json['ProviderType'] as String?)?.toProviderType(),
      pullRequestId: json['PullRequestId'] as String?,
      repositoryName: json['RepositoryName'] as String?,
      state: (json['State'] as String?)?.toJobState(),
      type: (json['Type'] as String?)?.toType(),
    );
  }
}

/// The type of a code review. There are two code review types:
///
/// <ul>
/// <li>
/// <code>PullRequest</code> - A code review that is automatically triggered by
/// a pull request on an assocaited repository. Because this type of code review
/// is automatically generated, you cannot specify this code review type using
/// <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CreateCodeReview">
/// <code>CreateCodeReview</code> </a>.
/// </li>
/// <li>
/// <code>RepositoryAnalysis</code> - A code review that analyzes all code under
/// a specified branch in an associated respository. The assocated repository is
/// specified using its ARN in <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CreateCodeReview">
/// <code>CreateCodeReview</code> </a>.
/// </li>
/// </ul>
class CodeReviewType {
  /// A code review that analyzes all code under a specified branch in an
  /// associated respository. The assocated repository is specified using its ARN
  /// in <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CreateCodeReview">
  /// <code>CreateCodeReview</code> </a>.
  final RepositoryAnalysis repositoryAnalysis;

  CodeReviewType({
    required this.repositoryAnalysis,
  });
  Map<String, dynamic> toJson() {
    final repositoryAnalysis = this.repositoryAnalysis;
    return {
      'RepositoryAnalysis': repositoryAnalysis,
    };
  }
}

/// A type of <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">
/// <code>SourceCodeType</code> </a> that specifies the commit diff for a pull
/// request on an associated repository.
class CommitDiffSourceCodeType {
  /// The SHA of the destination commit used to generate a commit diff.
  final String? destinationCommit;

  /// The SHA of the source commit used to generate a commit diff.
  final String? sourceCommit;

  CommitDiffSourceCodeType({
    this.destinationCommit,
    this.sourceCommit,
  });
  factory CommitDiffSourceCodeType.fromJson(Map<String, dynamic> json) {
    return CommitDiffSourceCodeType(
      destinationCommit: json['DestinationCommit'] as String?,
      sourceCommit: json['SourceCommit'] as String?,
    );
  }
}

class CreateCodeReviewResponse {
  final CodeReview? codeReview;

  CreateCodeReviewResponse({
    this.codeReview,
  });
  factory CreateCodeReviewResponse.fromJson(Map<String, dynamic> json) {
    return CreateCodeReviewResponse(
      codeReview: json['CodeReview'] != null
          ? CodeReview.fromJson(json['CodeReview'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeCodeReviewResponse {
  /// Information about the code review.
  final CodeReview? codeReview;

  DescribeCodeReviewResponse({
    this.codeReview,
  });
  factory DescribeCodeReviewResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCodeReviewResponse(
      codeReview: json['CodeReview'] != null
          ? CodeReview.fromJson(json['CodeReview'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeRecommendationFeedbackResponse {
  /// The recommendation feedback given by the user.
  final RecommendationFeedback? recommendationFeedback;

  DescribeRecommendationFeedbackResponse({
    this.recommendationFeedback,
  });
  factory DescribeRecommendationFeedbackResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRecommendationFeedbackResponse(
      recommendationFeedback: json['RecommendationFeedback'] != null
          ? RecommendationFeedback.fromJson(
              json['RecommendationFeedback'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeRepositoryAssociationResponse {
  /// Information about the repository association.
  final RepositoryAssociation? repositoryAssociation;

  /// An array of key-value pairs used to tag an associated repository. A tag is a
  /// custom attribute label with two parts:
  ///
  /// <ul>
  /// <li>
  /// A <i>tag key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
  /// keys are case sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a <i>tag value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag value is the same as using an empty string. Like tag keys,
  /// tag values are case sensitive.
  /// </li>
  /// </ul>
  final Map<String, String>? tags;

  DescribeRepositoryAssociationResponse({
    this.repositoryAssociation,
    this.tags,
  });
  factory DescribeRepositoryAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRepositoryAssociationResponse(
      repositoryAssociation: json['RepositoryAssociation'] != null
          ? RepositoryAssociation.fromJson(
              json['RepositoryAssociation'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class DisassociateRepositoryResponse {
  /// Information about the disassociated repository.
  final RepositoryAssociation? repositoryAssociation;

  /// An array of key-value pairs used to tag an associated repository. A tag is a
  /// custom attribute label with two parts:
  ///
  /// <ul>
  /// <li>
  /// A <i>tag key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
  /// keys are case sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a <i>tag value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag value is the same as using an empty string. Like tag keys,
  /// tag values are case sensitive.
  /// </li>
  /// </ul>
  final Map<String, String>? tags;

  DisassociateRepositoryResponse({
    this.repositoryAssociation,
    this.tags,
  });
  factory DisassociateRepositoryResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateRepositoryResponse(
      repositoryAssociation: json['RepositoryAssociation'] != null
          ? RepositoryAssociation.fromJson(
              json['RepositoryAssociation'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

enum JobState {
  completed,
  pending,
  failed,
  deleting,
}

extension on JobState {
  String toValue() {
    switch (this) {
      case JobState.completed:
        return 'Completed';
      case JobState.pending:
        return 'Pending';
      case JobState.failed:
        return 'Failed';
      case JobState.deleting:
        return 'Deleting';
    }
  }
}

extension on String {
  JobState toJobState() {
    switch (this) {
      case 'Completed':
        return JobState.completed;
      case 'Pending':
        return JobState.pending;
      case 'Failed':
        return JobState.failed;
      case 'Deleting':
        return JobState.deleting;
    }
    throw Exception('$this is not known in enum JobState');
  }
}

class ListCodeReviewsResponse {
  /// A list of code reviews that meet the criteria of the request.
  final List<CodeReviewSummary>? codeReviewSummaries;

  /// Pagination token.
  final String? nextToken;

  ListCodeReviewsResponse({
    this.codeReviewSummaries,
    this.nextToken,
  });
  factory ListCodeReviewsResponse.fromJson(Map<String, dynamic> json) {
    return ListCodeReviewsResponse(
      codeReviewSummaries: (json['CodeReviewSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => CodeReviewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListRecommendationFeedbackResponse {
  /// If nextToken is returned, there are more results available. The value of
  /// nextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page. Keep all other arguments
  /// unchanged.
  final String? nextToken;

  /// Recommendation feedback summaries corresponding to the code review ARN.
  final List<RecommendationFeedbackSummary>? recommendationFeedbackSummaries;

  ListRecommendationFeedbackResponse({
    this.nextToken,
    this.recommendationFeedbackSummaries,
  });
  factory ListRecommendationFeedbackResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRecommendationFeedbackResponse(
      nextToken: json['NextToken'] as String?,
      recommendationFeedbackSummaries: (json['RecommendationFeedbackSummaries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              RecommendationFeedbackSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListRecommendationsResponse {
  /// Pagination token.
  final String? nextToken;

  /// List of recommendations for the requested code review.
  final List<RecommendationSummary>? recommendationSummaries;

  ListRecommendationsResponse({
    this.nextToken,
    this.recommendationSummaries,
  });
  factory ListRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendationsResponse(
      nextToken: json['NextToken'] as String?,
      recommendationSummaries: (json['RecommendationSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => RecommendationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListRepositoryAssociationsResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListRecommendations</code> request. When the results of a
  /// <code>ListRecommendations</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// A list of repository associations that meet the criteria of the request.
  final List<RepositoryAssociationSummary>? repositoryAssociationSummaries;

  ListRepositoryAssociationsResponse({
    this.nextToken,
    this.repositoryAssociationSummaries,
  });
  factory ListRepositoryAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRepositoryAssociationsResponse(
      nextToken: json['NextToken'] as String?,
      repositoryAssociationSummaries: (json['RepositoryAssociationSummaries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              RepositoryAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTagsForResourceResponse {
  /// An array of key-value pairs used to tag an associated repository. A tag is a
  /// custom attribute label with two parts:
  ///
  /// <ul>
  /// <li>
  /// A <i>tag key</i> (for example, <code>CostCenter</code>,
  /// <code>Environment</code>, <code>Project</code>, or <code>Secret</code>). Tag
  /// keys are case sensitive.
  /// </li>
  /// <li>
  /// An optional field known as a <i>tag value</i> (for example,
  /// <code>111122223333</code>, <code>Production</code>, or a team name).
  /// Omitting the tag value is the same as using an empty string. Like tag keys,
  /// tag values are case sensitive.
  /// </li>
  /// </ul>
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

/// Information about the statistics from the code review.
class Metrics {
  /// Total number of recommendations found in the code review.
  final int? findingsCount;

  /// Lines of code metered in the code review. For the initial code review pull
  /// request and all subsequent revisions, this includes all lines of code in the
  /// files added to the pull request. In subsequent revisions, for files that
  /// already existed in the pull request, this includes only the changed lines of
  /// code. In both cases, this does not include non-code lines such as comments
  /// and import statements. For example, if you submit a pull request containing
  /// 5 files, each with 500 lines of code, and in a subsequent revision you added
  /// a new file with 200 lines of code, and also modified a total of 25 lines
  /// across the initial 5 files, <code>MeteredLinesOfCodeCount</code> includes
  /// the first 5 files (5 * 500 = 2,500 lines), the new file (200 lines) and the
  /// 25 changed lines of code for a total of 2,725 lines of code.
  final int? meteredLinesOfCodeCount;

  Metrics({
    this.findingsCount,
    this.meteredLinesOfCodeCount,
  });
  factory Metrics.fromJson(Map<String, dynamic> json) {
    return Metrics(
      findingsCount: json['FindingsCount'] as int?,
      meteredLinesOfCodeCount: json['MeteredLinesOfCodeCount'] as int?,
    );
  }
}

/// Information about metrics summaries.
class MetricsSummary {
  /// Total number of recommendations found in the code review.
  final int? findingsCount;

  /// Lines of code metered in the code review. For the initial code review pull
  /// request and all subsequent revisions, this includes all lines of code in the
  /// files added to the pull request. In subsequent revisions, for files that
  /// already existed in the pull request, this includes only the changed lines of
  /// code. In both cases, this does not include non-code lines such as comments
  /// and import statements. For example, if you submit a pull request containing
  /// 5 files, each with 500 lines of code, and in a subsequent revision you added
  /// a new file with 200 lines of code, and also modified a total of 25 lines
  /// across the initial 5 files, <code>MeteredLinesOfCodeCount</code> includes
  /// the first 5 files (5 * 500 = 2,500 lines), the new file (200 lines) and the
  /// 25 changed lines of code for a total of 2,725 lines of code.
  final int? meteredLinesOfCodeCount;

  MetricsSummary({
    this.findingsCount,
    this.meteredLinesOfCodeCount,
  });
  factory MetricsSummary.fromJson(Map<String, dynamic> json) {
    return MetricsSummary(
      findingsCount: json['FindingsCount'] as int?,
      meteredLinesOfCodeCount: json['MeteredLinesOfCodeCount'] as int?,
    );
  }
}

enum ProviderType {
  codeCommit,
  gitHub,
  bitbucket,
  gitHubEnterpriseServer,
}

extension on ProviderType {
  String toValue() {
    switch (this) {
      case ProviderType.codeCommit:
        return 'CodeCommit';
      case ProviderType.gitHub:
        return 'GitHub';
      case ProviderType.bitbucket:
        return 'Bitbucket';
      case ProviderType.gitHubEnterpriseServer:
        return 'GitHubEnterpriseServer';
    }
  }
}

extension on String {
  ProviderType toProviderType() {
    switch (this) {
      case 'CodeCommit':
        return ProviderType.codeCommit;
      case 'GitHub':
        return ProviderType.gitHub;
      case 'Bitbucket':
        return ProviderType.bitbucket;
      case 'GitHubEnterpriseServer':
        return ProviderType.gitHubEnterpriseServer;
    }
    throw Exception('$this is not known in enum ProviderType');
  }
}

class PutRecommendationFeedbackResponse {
  PutRecommendationFeedbackResponse();
  factory PutRecommendationFeedbackResponse.fromJson(Map<String, dynamic> _) {
    return PutRecommendationFeedbackResponse();
  }
}

enum Reaction {
  thumbsUp,
  thumbsDown,
}

extension on Reaction {
  String toValue() {
    switch (this) {
      case Reaction.thumbsUp:
        return 'ThumbsUp';
      case Reaction.thumbsDown:
        return 'ThumbsDown';
    }
  }
}

extension on String {
  Reaction toReaction() {
    switch (this) {
      case 'ThumbsUp':
        return Reaction.thumbsUp;
      case 'ThumbsDown':
        return Reaction.thumbsDown;
    }
    throw Exception('$this is not known in enum Reaction');
  }
}

/// Information about the recommendation feedback.
class RecommendationFeedback {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  final String? codeReviewArn;

  /// The time at which the feedback was created.
  final DateTime? createdTimeStamp;

  /// The time at which the feedback was last updated.
  final DateTime? lastUpdatedTimeStamp;

  /// List for storing reactions. Reactions are utf-8 text code for emojis. You
  /// can send an empty list to clear off all your feedback.
  final List<Reaction>? reactions;

  /// The recommendation ID that can be used to track the provided
  /// recommendations. Later on it can be used to collect the feedback.
  final String? recommendationId;

  /// The ID of the user that made the API call.
  ///
  /// The <code>UserId</code> is an IAM principal that can be specified as an AWS
  /// account ID or an Amazon Resource Name (ARN). For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">
  /// Specifying a Principal</a> in the <i>AWS Identity and Access Management User
  /// Guide</i>.
  final String? userId;

  RecommendationFeedback({
    this.codeReviewArn,
    this.createdTimeStamp,
    this.lastUpdatedTimeStamp,
    this.reactions,
    this.recommendationId,
    this.userId,
  });
  factory RecommendationFeedback.fromJson(Map<String, dynamic> json) {
    return RecommendationFeedback(
      codeReviewArn: json['CodeReviewArn'] as String?,
      createdTimeStamp: timeStampFromJson(json['CreatedTimeStamp']),
      lastUpdatedTimeStamp: timeStampFromJson(json['LastUpdatedTimeStamp']),
      reactions: (json['Reactions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toReaction())
          .toList(),
      recommendationId: json['RecommendationId'] as String?,
      userId: json['UserId'] as String?,
    );
  }
}

/// Information about recommendation feedback summaries.
class RecommendationFeedbackSummary {
  /// List for storing reactions. Reactions are utf-8 text code for emojis.
  final List<Reaction>? reactions;

  /// The recommendation ID that can be used to track the provided
  /// recommendations. Later on it can be used to collect the feedback.
  final String? recommendationId;

  /// The ID of the user that gave the feedback.
  ///
  /// The <code>UserId</code> is an IAM principal that can be specified as an AWS
  /// account ID or an Amazon Resource Name (ARN). For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">
  /// Specifying a Principal</a> in the <i>AWS Identity and Access Management User
  /// Guide</i>.
  final String? userId;

  RecommendationFeedbackSummary({
    this.reactions,
    this.recommendationId,
    this.userId,
  });
  factory RecommendationFeedbackSummary.fromJson(Map<String, dynamic> json) {
    return RecommendationFeedbackSummary(
      reactions: (json['Reactions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toReaction())
          .toList(),
      recommendationId: json['RecommendationId'] as String?,
      userId: json['UserId'] as String?,
    );
  }
}

/// Information about recommendations.
class RecommendationSummary {
  /// A description of the recommendation generated by CodeGuru Reviewer for the
  /// lines of code between the start line and the end line.
  final String? description;

  /// Last line where the recommendation is applicable in the source commit or
  /// source branch. For a single line comment the start line and end line values
  /// are the same.
  final int? endLine;

  /// Name of the file on which a recommendation is provided.
  final String? filePath;

  /// The recommendation ID that can be used to track the provided
  /// recommendations. Later on it can be used to collect the feedback.
  final String? recommendationId;

  /// Start line from where the recommendation is applicable in the source commit
  /// or source branch.
  final int? startLine;

  RecommendationSummary({
    this.description,
    this.endLine,
    this.filePath,
    this.recommendationId,
    this.startLine,
  });
  factory RecommendationSummary.fromJson(Map<String, dynamic> json) {
    return RecommendationSummary(
      description: json['Description'] as String?,
      endLine: json['EndLine'] as int?,
      filePath: json['FilePath'] as String?,
      recommendationId: json['RecommendationId'] as String?,
      startLine: json['StartLine'] as int?,
    );
  }
}

/// Information about an associated AWS CodeCommit repository or an associated
/// repository that is managed by AWS CodeStar Connections (for example,
/// Bitbucket). This <code>Repository</code> object is not used if your source
/// code is in an associated GitHub repository.
class Repository {
  /// Information about a Bitbucket repository.
  final ThirdPartySourceRepository? bitbucket;

  /// Information about an AWS CodeCommit repository.
  final CodeCommitRepository? codeCommit;

  /// Information about a GitHub Enterprise Server repository.
  final ThirdPartySourceRepository? gitHubEnterpriseServer;

  Repository({
    this.bitbucket,
    this.codeCommit,
    this.gitHubEnterpriseServer,
  });
  Map<String, dynamic> toJson() {
    final bitbucket = this.bitbucket;
    final codeCommit = this.codeCommit;
    final gitHubEnterpriseServer = this.gitHubEnterpriseServer;
    return {
      if (bitbucket != null) 'Bitbucket': bitbucket,
      if (codeCommit != null) 'CodeCommit': codeCommit,
      if (gitHubEnterpriseServer != null)
        'GitHubEnterpriseServer': gitHubEnterpriseServer,
    };
  }
}

/// A code review type that analyzes all code under a specified branch in an
/// associated respository. The assocated repository is specified using its ARN
/// when you call <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CreateCodeReview">
/// <code>CreateCodeReview</code> </a>.
class RepositoryAnalysis {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">
  /// <code>SourceCodeType</code> </a> that specifies the tip of a branch in an
  /// associated repository.
  final RepositoryHeadSourceCodeType repositoryHead;

  RepositoryAnalysis({
    required this.repositoryHead,
  });
  Map<String, dynamic> toJson() {
    final repositoryHead = this.repositoryHead;
    return {
      'RepositoryHead': repositoryHead,
    };
  }
}

/// Information about a repository association. The <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_DescribeRepositoryAssociation.html">
/// <code>DescribeRepositoryAssociation</code> </a> operation returns a
/// <code>RepositoryAssociation</code> object.
class RepositoryAssociation {
  /// The Amazon Resource Name (ARN) identifying the repository association.
  final String? associationArn;

  /// The ID of the repository association.
  final String? associationId;

  /// The Amazon Resource Name (ARN) of an AWS CodeStar Connections connection.
  /// Its format is
  /// <code>arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codestar-connections/latest/APIReference/API_Connection.html">
  /// <code>Connection</code> </a> in the <i>AWS CodeStar Connections API
  /// Reference</i>.
  final String? connectionArn;

  /// The time, in milliseconds since the epoch, when the repository association
  /// was created.
  final DateTime? createdTimeStamp;

  /// The time, in milliseconds since the epoch, when the repository association
  /// was last updated.
  final DateTime? lastUpdatedTimeStamp;

  /// The name of the repository.
  final String? name;

  /// The owner of the repository. For an AWS CodeCommit repository, this is the
  /// AWS account ID of the account that owns the repository. For a GitHub, GitHub
  /// Enterprise Server, or Bitbucket repository, this is the username for the
  /// account that owns the repository.
  final String? owner;

  /// The provider type of the repository association.
  final ProviderType? providerType;

  /// The state of the repository association.
  ///
  /// The valid repository association states are:
  ///
  /// <ul>
  /// <li>
  /// <b>Associated</b>: The repository association is complete.
  /// </li>
  /// <li>
  /// <b>Associating</b>: CodeGuru Reviewer is:
  ///
  /// <ul>
  /// <li>
  /// Setting up pull request notifications. This is required for pull requests to
  /// trigger a CodeGuru Reviewer review.
  /// <note>
  /// If your repository <code>ProviderType</code> is <code>GitHub</code>,
  /// <code>GitHub Enterprise Server</code>, or <code>Bitbucket</code>, CodeGuru
  /// Reviewer creates webhooks in your repository to trigger CodeGuru Reviewer
  /// reviews. If you delete these webhooks, reviews of code in your repository
  /// cannot be triggered.
  /// </note> </li>
  /// <li>
  /// Setting up source code access. This is required for CodeGuru Reviewer to
  /// securely clone code in your repository.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Failed</b>: The repository failed to associate or disassociate.
  /// </li>
  /// <li>
  /// <b>Disassociating</b>: CodeGuru Reviewer is removing the repository's pull
  /// request notifications and source code access.
  /// </li>
  /// <li>
  /// <b>Disassociated</b>: CodeGuru Reviewer successfully disassociated the
  /// repository. You can create a new association with this repository if you
  /// want to review source code in it later. You can control access to code
  /// reviews created in an associated repository with tags after it has been
  /// disassociated. For more information, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/auth-and-access-control-using-tags.html">Using
  /// tags to control access to associated repositories</a> in the <i>Amazon
  /// CodeGuru Reviewer User Guide</i>.
  /// </li>
  /// </ul>
  final RepositoryAssociationState? state;

  /// A description of why the repository association is in the current state.
  final String? stateReason;

  RepositoryAssociation({
    this.associationArn,
    this.associationId,
    this.connectionArn,
    this.createdTimeStamp,
    this.lastUpdatedTimeStamp,
    this.name,
    this.owner,
    this.providerType,
    this.state,
    this.stateReason,
  });
  factory RepositoryAssociation.fromJson(Map<String, dynamic> json) {
    return RepositoryAssociation(
      associationArn: json['AssociationArn'] as String?,
      associationId: json['AssociationId'] as String?,
      connectionArn: json['ConnectionArn'] as String?,
      createdTimeStamp: timeStampFromJson(json['CreatedTimeStamp']),
      lastUpdatedTimeStamp: timeStampFromJson(json['LastUpdatedTimeStamp']),
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      providerType: (json['ProviderType'] as String?)?.toProviderType(),
      state: (json['State'] as String?)?.toRepositoryAssociationState(),
      stateReason: json['StateReason'] as String?,
    );
  }
}

enum RepositoryAssociationState {
  associated,
  associating,
  failed,
  disassociating,
  disassociated,
}

extension on RepositoryAssociationState {
  String toValue() {
    switch (this) {
      case RepositoryAssociationState.associated:
        return 'Associated';
      case RepositoryAssociationState.associating:
        return 'Associating';
      case RepositoryAssociationState.failed:
        return 'Failed';
      case RepositoryAssociationState.disassociating:
        return 'Disassociating';
      case RepositoryAssociationState.disassociated:
        return 'Disassociated';
    }
  }
}

extension on String {
  RepositoryAssociationState toRepositoryAssociationState() {
    switch (this) {
      case 'Associated':
        return RepositoryAssociationState.associated;
      case 'Associating':
        return RepositoryAssociationState.associating;
      case 'Failed':
        return RepositoryAssociationState.failed;
      case 'Disassociating':
        return RepositoryAssociationState.disassociating;
      case 'Disassociated':
        return RepositoryAssociationState.disassociated;
    }
    throw Exception('$this is not known in enum RepositoryAssociationState');
  }
}

/// Summary information about a repository association. The <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
/// <code>ListRepositoryAssociations</code> </a> operation returns a list of
/// <code>RepositoryAssociationSummary</code> objects.
class RepositoryAssociationSummary {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> object. You can retrieve this ARN by
  /// calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
  /// <code>ListRepositoryAssociations</code> </a>.
  final String? associationArn;

  /// The repository association ID.
  final String? associationId;

  /// The Amazon Resource Name (ARN) of an AWS CodeStar Connections connection.
  /// Its format is
  /// <code>arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codestar-connections/latest/APIReference/API_Connection.html">
  /// <code>Connection</code> </a> in the <i>AWS CodeStar Connections API
  /// Reference</i>.
  final String? connectionArn;

  /// The time, in milliseconds since the epoch, since the repository association
  /// was last updated.
  final DateTime? lastUpdatedTimeStamp;

  /// The name of the repository association.
  final String? name;

  /// The owner of the repository. For an AWS CodeCommit repository, this is the
  /// AWS account ID of the account that owns the repository. For a GitHub, GitHub
  /// Enterprise Server, or Bitbucket repository, this is the username for the
  /// account that owns the repository.
  final String? owner;

  /// The provider type of the repository association.
  final ProviderType? providerType;

  /// The state of the repository association.
  ///
  /// The valid repository association states are:
  ///
  /// <ul>
  /// <li>
  /// <b>Associated</b>: The repository association is complete.
  /// </li>
  /// <li>
  /// <b>Associating</b>: CodeGuru Reviewer is:
  ///
  /// <ul>
  /// <li>
  /// Setting up pull request notifications. This is required for pull requests to
  /// trigger a CodeGuru Reviewer review.
  /// <note>
  /// If your repository <code>ProviderType</code> is <code>GitHub</code>,
  /// <code>GitHub Enterprise Server</code>, or <code>Bitbucket</code>, CodeGuru
  /// Reviewer creates webhooks in your repository to trigger CodeGuru Reviewer
  /// reviews. If you delete these webhooks, reviews of code in your repository
  /// cannot be triggered.
  /// </note> </li>
  /// <li>
  /// Setting up source code access. This is required for CodeGuru Reviewer to
  /// securely clone code in your repository.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Failed</b>: The repository failed to associate or disassociate.
  /// </li>
  /// <li>
  /// <b>Disassociating</b>: CodeGuru Reviewer is removing the repository's pull
  /// request notifications and source code access.
  /// </li>
  /// <li>
  /// <b>Disassociated</b>: CodeGuru Reviewer successfully disassociated the
  /// repository. You can create a new association with this repository if you
  /// want to review source code in it later. You can control access to code
  /// reviews created in an associated repository with tags after it has been
  /// disassociated. For more information, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/auth-and-access-control-using-tags.html">Using
  /// tags to control access to associated repositories</a> in the <i>Amazon
  /// CodeGuru Reviewer User Guide</i>.
  /// </li>
  /// </ul>
  final RepositoryAssociationState? state;

  RepositoryAssociationSummary({
    this.associationArn,
    this.associationId,
    this.connectionArn,
    this.lastUpdatedTimeStamp,
    this.name,
    this.owner,
    this.providerType,
    this.state,
  });
  factory RepositoryAssociationSummary.fromJson(Map<String, dynamic> json) {
    return RepositoryAssociationSummary(
      associationArn: json['AssociationArn'] as String?,
      associationId: json['AssociationId'] as String?,
      connectionArn: json['ConnectionArn'] as String?,
      lastUpdatedTimeStamp: timeStampFromJson(json['LastUpdatedTimeStamp']),
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      providerType: (json['ProviderType'] as String?)?.toProviderType(),
      state: (json['State'] as String?)?.toRepositoryAssociationState(),
    );
  }
}

/// A <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">
/// <code>SourceCodeType</code> </a> that specifies the tip of a branch in an
/// associated repository.
class RepositoryHeadSourceCodeType {
  /// The name of the branch in an associated repository. The
  /// <code>RepositoryHeadSourceCodeType</code> specifies the tip of this branch.
  final String branchName;

  RepositoryHeadSourceCodeType({
    required this.branchName,
  });
  factory RepositoryHeadSourceCodeType.fromJson(Map<String, dynamic> json) {
    return RepositoryHeadSourceCodeType(
      branchName: json['BranchName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final branchName = this.branchName;
    return {
      'BranchName': branchName,
    };
  }
}

/// Specifies the source code that is analyzed in a code review. A code review
/// can analyze the source code that is specified using a pull request diff or a
/// branch in an associated repository.
class SourceCodeType {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">
  /// <code>SourceCodeType</code> </a> that specifies a commit diff created by a
  /// pull request on an associated repository.
  final CommitDiffSourceCodeType? commitDiff;
  final RepositoryHeadSourceCodeType? repositoryHead;

  SourceCodeType({
    this.commitDiff,
    this.repositoryHead,
  });
  factory SourceCodeType.fromJson(Map<String, dynamic> json) {
    return SourceCodeType(
      commitDiff: json['CommitDiff'] != null
          ? CommitDiffSourceCodeType.fromJson(
              json['CommitDiff'] as Map<String, dynamic>)
          : null,
      repositoryHead: json['RepositoryHead'] != null
          ? RepositoryHeadSourceCodeType.fromJson(
              json['RepositoryHead'] as Map<String, dynamic>)
          : null,
    );
  }
}

class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

/// Information about a third-party source repository connected to CodeGuru
/// Reviewer.
class ThirdPartySourceRepository {
  /// The Amazon Resource Name (ARN) of an AWS CodeStar Connections connection.
  /// Its format is
  /// <code>arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codestar-connections/latest/APIReference/API_Connection.html">
  /// <code>Connection</code> </a> in the <i>AWS CodeStar Connections API
  /// Reference</i>.
  final String connectionArn;

  /// The name of the third party source repository.
  final String name;

  /// The owner of the repository. For a GitHub, GitHub Enterprise, or Bitbucket
  /// repository, this is the username for the account that owns the repository.
  final String owner;

  ThirdPartySourceRepository({
    required this.connectionArn,
    required this.name,
    required this.owner,
  });
  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final name = this.name;
    final owner = this.owner;
    return {
      'ConnectionArn': connectionArn,
      'Name': name,
      'Owner': owner,
    };
  }
}

enum Type {
  pullRequest,
  repositoryAnalysis,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.pullRequest:
        return 'PullRequest';
      case Type.repositoryAnalysis:
        return 'RepositoryAnalysis';
    }
  }
}

extension on String {
  Type toType() {
    switch (this) {
      case 'PullRequest':
        return Type.pullRequest;
      case 'RepositoryAnalysis':
        return Type.repositoryAnalysis;
    }
    throw Exception('$this is not known in enum Type');
  }
}

class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
