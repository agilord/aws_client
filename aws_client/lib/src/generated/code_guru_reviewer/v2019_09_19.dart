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

/// This section provides documentation for the Amazon CodeGuru Reviewer API
/// operations. CodeGuru Reviewer is a service that uses program analysis and
/// machine learning to detect potential defects that are difficult for
/// developers to find and recommends fixes in your Java and Python code.
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
/// Reviewer and interface VPC endpoints (Amazon Web Services PrivateLink)</a>
/// in the <i>Amazon CodeGuru Reviewer User Guide</i>.
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

  /// Use to associate an Amazon Web Services CodeCommit repository or a
  /// repository managed by Amazon Web Services CodeStar Connections with Amazon
  /// CodeGuru Reviewer. When you associate a repository, CodeGuru Reviewer
  /// reviews source code changes in the repository's pull requests and provides
  /// automatic recommendations. You can view recommendations using the CodeGuru
  /// Reviewer console. For more information, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/recommendations.html">Recommendations
  /// in Amazon CodeGuru Reviewer</a> in the <i>Amazon CodeGuru Reviewer User
  /// Guide.</i>
  ///
  /// If you associate a CodeCommit or S3 repository, it must be in the same
  /// Amazon Web Services Region and Amazon Web Services account where its
  /// CodeGuru Reviewer code reviews are configured.
  ///
  /// Bitbucket and GitHub Enterprise Server repositories are managed by Amazon
  /// Web Services CodeStar Connections to connect to CodeGuru Reviewer. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/getting-started-associate-repository.html">Associate
  /// a repository</a> in the <i>Amazon CodeGuru Reviewer User Guide.</i>
  /// <note>
  /// You cannot use the CodeGuru Reviewer SDK or the Amazon Web Services CLI to
  /// associate a GitHub repository with Amazon CodeGuru Reviewer. To associate
  /// a GitHub repository, use the console. For more information, see <a
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
  /// Parameter [kMSKeyDetails] :
  /// A <code>KMSKeyDetails</code> object that contains:
  ///
  /// <ul>
  /// <li>
  /// The encryption option for this repository association. It is either owned
  /// by Amazon Web Services Key Management Service (KMS)
  /// (<code>AWS_OWNED_CMK</code>) or customer managed
  /// (<code>CUSTOMER_MANAGED_CMK</code>).
  /// </li>
  /// <li>
  /// The ID of the Amazon Web Services KMS key that is associated with this
  /// repository association.
  /// </li>
  /// </ul>
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
    KMSKeyDetails? kMSKeyDetails,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Repository': repository,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (kMSKeyDetails != null) 'KMSKeyDetails': kMSKeyDetails,
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReviewType.html">CodeReviewType</a>
  /// of <code>RepositoryAnalysis</code>. This type of code review analyzes all
  /// code under a specified branch in an associated repository.
  /// <code>PullRequest</code> code reviews are automatically triggered by a
  /// pull request.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the code review. The name of each code review in your Amazon
  /// Web Services account must be unique.
  ///
  /// Parameter [repositoryAssociationArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">RepositoryAssociation</a>
  /// object. You can retrieve this ARN by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">ListRepositoryAssociations</a>.
  ///
  /// A code review can only be created on an associated repository. This is the
  /// ARN of the associated repository.
  ///
  /// Parameter [type] :
  /// The type of code review to create. This is specified using a <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReviewType.html">CodeReviewType</a>
  /// object. You can create a code review only of type
  /// <code>RepositoryAnalysis</code>.
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">CodeReview</a>
  /// object.
  Future<DescribeCodeReviewResponse> describeCodeReview({
    required String codeReviewArn,
  }) async {
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">CodeReview</a>
  /// object.
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
  /// Amazon Web Services account ID or an Amazon Resource Name (ARN). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">
  /// Specifying a Principal</a> in the <i>Amazon Web Services Identity and
  /// Access Management User Guide</i>.
  Future<DescribeRecommendationFeedbackResponse>
      describeRecommendationFeedback({
    required String codeReviewArn,
    required String recommendationId,
    String? userId,
  }) async {
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">RepositoryAssociation</a>
  /// object that contains information about the requested repository
  /// association.
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [associationArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">RepositoryAssociation</a>
  /// object. You can retrieve this ARN by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">ListRepositoryAssociations</a>.
  Future<DescribeRepositoryAssociationResponse> describeRepositoryAssociation({
    required String associationArn,
  }) async {
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">RepositoryAssociation</a>
  /// object. You can retrieve this ARN by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">ListRepositoryAssociations</a>.
  Future<DisassociateRepositoryResponse> disassociateRepository({
    required String associationArn,
  }) async {
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
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RecommendationFeedbackSummary.html">RecommendationFeedbackSummary</a>
  /// objects that contain customer recommendation feedback for all CodeGuru
  /// Reviewer users.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [codeReviewArn] :
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">CodeReview</a>
  /// object.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. The default is
  /// 100.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  ///
  /// Parameter [recommendationIds] :
  /// Used to query the recommendation feedback for a given recommendation.
  ///
  /// Parameter [userIds] :
  /// An Amazon Web Services user's account ID or Amazon Resource Name (ARN).
  /// Use this ID to query the recommendation feedback for a code review from
  /// that user.
  ///
  /// The <code>UserId</code> is an IAM principal that can be specified as an
  /// Amazon Web Services account ID or an Amazon Resource Name (ARN). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">
  /// Specifying a Principal</a> in the <i>Amazon Web Services Identity and
  /// Access Management User Guide</i>.
  Future<ListRecommendationFeedbackResponse> listRecommendationFeedback({
    required String codeReviewArn,
    int? maxResults,
    String? nextToken,
    List<String>? recommendationIds,
    List<String>? userIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">CodeReview</a>
  /// object.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html">RepositoryAssociationSummary</a>
  /// objects that contain summary information about a repository association.
  /// You can filter the returned list by <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-ProviderType">ProviderType</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-Name">Name</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-State">State</a>,
  /// and <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-Owner">Owner</a>.
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
  /// List of owners to use as a filter. For Amazon Web Services CodeCommit, it
  /// is the name of the CodeCommit account that was used to associate the
  /// repository. For other repository source providers, such as Bitbucket and
  /// GitHub Enterprise Server, this is name of the account that was used to
  /// associate the repository.
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
  /// reviews created in anassociated repository with tags after it has been
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">RepositoryAssociation</a>
  /// object. You can retrieve this ARN by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">ListRepositoryAssociations</a>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">CodeReview</a>
  /// object.
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">RepositoryAssociation</a>
  /// object. You can retrieve this ARN by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">ListRepositoryAssociations</a>.
  Future<void> tagResource({
    required Map<String, String> tags,
    required String resourceArn,
  }) async {
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
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">RepositoryAssociation</a>
  /// object. You can retrieve this ARN by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">ListRepositoryAssociations</a>.
  Future<void> untagResource({
    required List<String> tagKeys,
    required String resourceArn,
  }) async {
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

enum AnalysisType {
  security,
  codeQuality,
}

extension AnalysisTypeValueExtension on AnalysisType {
  String toValue() {
    switch (this) {
      case AnalysisType.security:
        return 'Security';
      case AnalysisType.codeQuality:
        return 'CodeQuality';
    }
  }
}

extension AnalysisTypeFromString on String {
  AnalysisType toAnalysisType() {
    switch (this) {
      case 'Security':
        return AnalysisType.security;
      case 'CodeQuality':
        return AnalysisType.codeQuality;
    }
    throw Exception('$this is not known in enum AnalysisType');
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

  Map<String, dynamic> toJson() {
    final repositoryAssociation = this.repositoryAssociation;
    final tags = this.tags;
    return {
      if (repositoryAssociation != null)
        'RepositoryAssociation': repositoryAssociation,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A type of <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">SourceCodeType</a>
/// that specifies a code diff between a source and destination branch in an
/// associated repository.
class BranchDiffSourceCodeType {
  /// The destination branch for a diff in an associated repository.
  final String destinationBranchName;

  /// The source branch for a diff in an associated repository.
  final String sourceBranchName;

  BranchDiffSourceCodeType({
    required this.destinationBranchName,
    required this.sourceBranchName,
  });

  factory BranchDiffSourceCodeType.fromJson(Map<String, dynamic> json) {
    return BranchDiffSourceCodeType(
      destinationBranchName: json['DestinationBranchName'] as String,
      sourceBranchName: json['SourceBranchName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationBranchName = this.destinationBranchName;
    final sourceBranchName = this.sourceBranchName;
    return {
      'DestinationBranchName': destinationBranchName,
      'SourceBranchName': sourceBranchName,
    };
  }
}

/// Code artifacts are source code artifacts and build artifacts used in a
/// repository analysis or a pull request review.
///
/// <ul>
/// <li>
/// Source code artifacts are source code files in a Git repository that are
/// compressed into a .zip file.
/// </li>
/// <li>
/// Build artifacts are .jar or .class files that are compressed in a .zip file.
/// </li>
/// </ul>
class CodeArtifacts {
  /// The S3 object key for a source code .zip file. This is required for all code
  /// reviews.
  final String sourceCodeArtifactsObjectKey;

  /// The S3 object key for a build artifacts .zip file that contains .jar or
  /// .class files. This is required for a code review with security analysis. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/working-with-cicd.html">Create
  /// code reviews with GitHub Actions</a> in the <i>Amazon CodeGuru Reviewer User
  /// Guide</i>.
  final String? buildArtifactsObjectKey;

  CodeArtifacts({
    required this.sourceCodeArtifactsObjectKey,
    this.buildArtifactsObjectKey,
  });

  factory CodeArtifacts.fromJson(Map<String, dynamic> json) {
    return CodeArtifacts(
      sourceCodeArtifactsObjectKey:
          json['SourceCodeArtifactsObjectKey'] as String,
      buildArtifactsObjectKey: json['BuildArtifactsObjectKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceCodeArtifactsObjectKey = this.sourceCodeArtifactsObjectKey;
    final buildArtifactsObjectKey = this.buildArtifactsObjectKey;
    return {
      'SourceCodeArtifactsObjectKey': sourceCodeArtifactsObjectKey,
      if (buildArtifactsObjectKey != null)
        'BuildArtifactsObjectKey': buildArtifactsObjectKey,
    };
  }
}

/// Information about an Amazon Web Services CodeCommit repository. The
/// CodeCommit repository must be in the same Amazon Web Services Region and
/// Amazon Web Services account where its CodeGuru Reviewer code reviews are
/// configured.
class CodeCommitRepository {
  /// The name of the Amazon Web Services CodeCommit repository. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/APIReference/API_GetRepository.html#CodeCommit-GetRepository-request-repositoryName">repositoryName</a>
  /// in the <i>Amazon Web Services CodeCommit API Reference</i>.
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
  /// The types of analysis performed during a repository analysis or a pull
  /// request review. You can specify either <code>Security</code>,
  /// <code>CodeQuality</code>, or both.
  final List<AnalysisType>? analysisTypes;

  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">RepositoryAssociation</a>
  /// that contains the reviewed source code. You can retrieve associated
  /// repository ARNs by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">ListRepositoryAssociations</a>.
  final String? associationArn;

  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">CodeReview</a>
  /// object.
  final String? codeReviewArn;

  /// The state of the <code>aws-codeguru-reviewer.yml</code> configuration file
  /// that allows the configuration of the CodeGuru Reviewer analysis. The file
  /// either exists, doesn't exist, or exists with errors at the root directory of
  /// your repository.
  final ConfigFileState? configFileState;

  /// The time, in milliseconds since the epoch, when the code review was created.
  final DateTime? createdTimeStamp;

  /// The time, in milliseconds since the epoch, when the code review was last
  /// updated.
  final DateTime? lastUpdatedTimeStamp;

  /// The statistics from the code review.
  final Metrics? metrics;

  /// The name of the code review.
  final String? name;

  /// The owner of the repository. For an Amazon Web Services CodeCommit
  /// repository, this is the Amazon Web Services account ID of the account that
  /// owns the repository. For a GitHub, GitHub Enterprise Server, or Bitbucket
  /// repository, this is the username for the account that owns the repository.
  /// For an S3 repository, it can be the username or Amazon Web Services account
  /// ID.
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
    this.analysisTypes,
    this.associationArn,
    this.codeReviewArn,
    this.configFileState,
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
      analysisTypes: (json['AnalysisTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAnalysisType())
          .toList(),
      associationArn: json['AssociationArn'] as String?,
      codeReviewArn: json['CodeReviewArn'] as String?,
      configFileState:
          (json['ConfigFileState'] as String?)?.toConfigFileState(),
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

  Map<String, dynamic> toJson() {
    final analysisTypes = this.analysisTypes;
    final associationArn = this.associationArn;
    final codeReviewArn = this.codeReviewArn;
    final configFileState = this.configFileState;
    final createdTimeStamp = this.createdTimeStamp;
    final lastUpdatedTimeStamp = this.lastUpdatedTimeStamp;
    final metrics = this.metrics;
    final name = this.name;
    final owner = this.owner;
    final providerType = this.providerType;
    final pullRequestId = this.pullRequestId;
    final repositoryName = this.repositoryName;
    final sourceCodeType = this.sourceCodeType;
    final state = this.state;
    final stateReason = this.stateReason;
    final type = this.type;
    return {
      if (analysisTypes != null)
        'AnalysisTypes': analysisTypes.map((e) => e.toValue()).toList(),
      if (associationArn != null) 'AssociationArn': associationArn,
      if (codeReviewArn != null) 'CodeReviewArn': codeReviewArn,
      if (configFileState != null) 'ConfigFileState': configFileState.toValue(),
      if (createdTimeStamp != null)
        'CreatedTimeStamp': unixTimestampToJson(createdTimeStamp),
      if (lastUpdatedTimeStamp != null)
        'LastUpdatedTimeStamp': unixTimestampToJson(lastUpdatedTimeStamp),
      if (metrics != null) 'Metrics': metrics,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (providerType != null) 'ProviderType': providerType.toValue(),
      if (pullRequestId != null) 'PullRequestId': pullRequestId,
      if (repositoryName != null) 'RepositoryName': repositoryName,
      if (sourceCodeType != null) 'SourceCodeType': sourceCodeType,
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Information about the summary of the code review.
class CodeReviewSummary {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">CodeReview</a>
  /// object.
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

  /// The owner of the repository. For an Amazon Web Services CodeCommit
  /// repository, this is the Amazon Web Services account ID of the account that
  /// owns the repository. For a GitHub, GitHub Enterprise Server, or Bitbucket
  /// repository, this is the username for the account that owns the repository.
  /// For an S3 repository, it can be the username or Amazon Web Services account
  /// ID.
  final String? owner;

  /// The provider type of the repository association.
  final ProviderType? providerType;

  /// The pull request ID for the code review.
  final String? pullRequestId;

  /// The name of the repository.
  final String? repositoryName;
  final SourceCodeType? sourceCodeType;

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
    this.sourceCodeType,
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
      sourceCodeType: json['SourceCodeType'] != null
          ? SourceCodeType.fromJson(
              json['SourceCodeType'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.toJobState(),
      type: (json['Type'] as String?)?.toType(),
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewArn = this.codeReviewArn;
    final createdTimeStamp = this.createdTimeStamp;
    final lastUpdatedTimeStamp = this.lastUpdatedTimeStamp;
    final metricsSummary = this.metricsSummary;
    final name = this.name;
    final owner = this.owner;
    final providerType = this.providerType;
    final pullRequestId = this.pullRequestId;
    final repositoryName = this.repositoryName;
    final sourceCodeType = this.sourceCodeType;
    final state = this.state;
    final type = this.type;
    return {
      if (codeReviewArn != null) 'CodeReviewArn': codeReviewArn,
      if (createdTimeStamp != null)
        'CreatedTimeStamp': unixTimestampToJson(createdTimeStamp),
      if (lastUpdatedTimeStamp != null)
        'LastUpdatedTimeStamp': unixTimestampToJson(lastUpdatedTimeStamp),
      if (metricsSummary != null) 'MetricsSummary': metricsSummary,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (providerType != null) 'ProviderType': providerType.toValue(),
      if (pullRequestId != null) 'PullRequestId': pullRequestId,
      if (repositoryName != null) 'RepositoryName': repositoryName,
      if (sourceCodeType != null) 'SourceCodeType': sourceCodeType,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// The type of a code review. There are two code review types:
///
/// <ul>
/// <li>
/// <code>PullRequest</code> - A code review that is automatically triggered by
/// a pull request on an associated repository.
/// </li>
/// <li>
/// <code>RepositoryAnalysis</code> - A code review that analyzes all code under
/// a specified branch in an associated repository. The associated repository is
/// specified using its ARN in <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CreateCodeReview">CreateCodeReview</a>.
/// </li>
/// </ul>
class CodeReviewType {
  /// A code review that analyzes all code under a specified branch in an
  /// associated repository. The associated repository is specified using its ARN
  /// in <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CreateCodeReview">CreateCodeReview</a>.
  final RepositoryAnalysis repositoryAnalysis;

  /// They types of analysis performed during a repository analysis or a pull
  /// request review. You can specify either <code>Security</code>,
  /// <code>CodeQuality</code>, or both.
  final List<AnalysisType>? analysisTypes;

  CodeReviewType({
    required this.repositoryAnalysis,
    this.analysisTypes,
  });

  Map<String, dynamic> toJson() {
    final repositoryAnalysis = this.repositoryAnalysis;
    final analysisTypes = this.analysisTypes;
    return {
      'RepositoryAnalysis': repositoryAnalysis,
      if (analysisTypes != null)
        'AnalysisTypes': analysisTypes.map((e) => e.toValue()).toList(),
    };
  }
}

/// A type of <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">SourceCodeType</a>
/// that specifies the commit diff for a pull request on an associated
/// repository. The <code>SourceCommit</code> and <code>DestinationCommit</code>
/// fields are required to do a pull request code review.
class CommitDiffSourceCodeType {
  /// The SHA of the destination commit used to generate a commit diff. This field
  /// is required for a pull request code review.
  final String? destinationCommit;

  /// The SHA of the merge base of a commit.
  final String? mergeBaseCommit;

  /// The SHA of the source commit used to generate a commit diff. This field is
  /// required for a pull request code review.
  final String? sourceCommit;

  CommitDiffSourceCodeType({
    this.destinationCommit,
    this.mergeBaseCommit,
    this.sourceCommit,
  });

  factory CommitDiffSourceCodeType.fromJson(Map<String, dynamic> json) {
    return CommitDiffSourceCodeType(
      destinationCommit: json['DestinationCommit'] as String?,
      mergeBaseCommit: json['MergeBaseCommit'] as String?,
      sourceCommit: json['SourceCommit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationCommit = this.destinationCommit;
    final mergeBaseCommit = this.mergeBaseCommit;
    final sourceCommit = this.sourceCommit;
    return {
      if (destinationCommit != null) 'DestinationCommit': destinationCommit,
      if (mergeBaseCommit != null) 'MergeBaseCommit': mergeBaseCommit,
      if (sourceCommit != null) 'SourceCommit': sourceCommit,
    };
  }
}

enum ConfigFileState {
  present,
  absent,
  presentWithErrors,
}

extension ConfigFileStateValueExtension on ConfigFileState {
  String toValue() {
    switch (this) {
      case ConfigFileState.present:
        return 'Present';
      case ConfigFileState.absent:
        return 'Absent';
      case ConfigFileState.presentWithErrors:
        return 'PresentWithErrors';
    }
  }
}

extension ConfigFileStateFromString on String {
  ConfigFileState toConfigFileState() {
    switch (this) {
      case 'Present':
        return ConfigFileState.present;
      case 'Absent':
        return ConfigFileState.absent;
      case 'PresentWithErrors':
        return ConfigFileState.presentWithErrors;
    }
    throw Exception('$this is not known in enum ConfigFileState');
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

  Map<String, dynamic> toJson() {
    final codeReview = this.codeReview;
    return {
      if (codeReview != null) 'CodeReview': codeReview,
    };
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

  Map<String, dynamic> toJson() {
    final codeReview = this.codeReview;
    return {
      if (codeReview != null) 'CodeReview': codeReview,
    };
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

  Map<String, dynamic> toJson() {
    final recommendationFeedback = this.recommendationFeedback;
    return {
      if (recommendationFeedback != null)
        'RecommendationFeedback': recommendationFeedback,
    };
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

  Map<String, dynamic> toJson() {
    final repositoryAssociation = this.repositoryAssociation;
    final tags = this.tags;
    return {
      if (repositoryAssociation != null)
        'RepositoryAssociation': repositoryAssociation,
      if (tags != null) 'Tags': tags,
    };
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

  Map<String, dynamic> toJson() {
    final repositoryAssociation = this.repositoryAssociation;
    final tags = this.tags;
    return {
      if (repositoryAssociation != null)
        'RepositoryAssociation': repositoryAssociation,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum EncryptionOption {
  awsOwnedCmk,
  customerManagedCmk,
}

extension EncryptionOptionValueExtension on EncryptionOption {
  String toValue() {
    switch (this) {
      case EncryptionOption.awsOwnedCmk:
        return 'AWS_OWNED_CMK';
      case EncryptionOption.customerManagedCmk:
        return 'CUSTOMER_MANAGED_CMK';
    }
  }
}

extension EncryptionOptionFromString on String {
  EncryptionOption toEncryptionOption() {
    switch (this) {
      case 'AWS_OWNED_CMK':
        return EncryptionOption.awsOwnedCmk;
      case 'CUSTOMER_MANAGED_CMK':
        return EncryptionOption.customerManagedCmk;
    }
    throw Exception('$this is not known in enum EncryptionOption');
  }
}

/// Information about an event. The event might be a push, pull request,
/// scheduled request, or another type of event.
class EventInfo {
  /// The name of the event. The possible names are <code>pull_request</code>,
  /// <code>workflow_dispatch</code>, <code>schedule</code>, and <code>push</code>
  final String? name;

  /// The state of an event. The state might be open, closed, or another state.
  final String? state;

  EventInfo({
    this.name,
    this.state,
  });

  factory EventInfo.fromJson(Map<String, dynamic> json) {
    return EventInfo(
      name: json['Name'] as String?,
      state: json['State'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final state = this.state;
    return {
      if (name != null) 'Name': name,
      if (state != null) 'State': state,
    };
  }
}

enum JobState {
  completed,
  pending,
  failed,
  deleting,
}

extension JobStateValueExtension on JobState {
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

extension JobStateFromString on String {
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

/// An object that contains:
///
/// <ul>
/// <li>
/// The encryption option for a repository association. It is either owned by
/// Amazon Web Services Key Management Service (KMS)
/// (<code>AWS_OWNED_CMK</code>) or customer managed
/// (<code>CUSTOMER_MANAGED_CMK</code>).
/// </li>
/// <li>
/// The ID of the Amazon Web Services KMS key that is associated with a
/// repository association.
/// </li>
/// </ul>
class KMSKeyDetails {
  /// The encryption option for a repository association. It is either owned by
  /// Amazon Web Services Key Management Service (KMS)
  /// (<code>AWS_OWNED_CMK</code>) or customer managed
  /// (<code>CUSTOMER_MANAGED_CMK</code>).
  final EncryptionOption? encryptionOption;

  /// The ID of the Amazon Web Services KMS key that is associated with a
  /// repository association.
  final String? kMSKeyId;

  KMSKeyDetails({
    this.encryptionOption,
    this.kMSKeyId,
  });

  factory KMSKeyDetails.fromJson(Map<String, dynamic> json) {
    return KMSKeyDetails(
      encryptionOption:
          (json['EncryptionOption'] as String?)?.toEncryptionOption(),
      kMSKeyId: json['KMSKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionOption = this.encryptionOption;
    final kMSKeyId = this.kMSKeyId;
    return {
      if (encryptionOption != null)
        'EncryptionOption': encryptionOption.toValue(),
      if (kMSKeyId != null) 'KMSKeyId': kMSKeyId,
    };
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

  Map<String, dynamic> toJson() {
    final codeReviewSummaries = this.codeReviewSummaries;
    final nextToken = this.nextToken;
    return {
      if (codeReviewSummaries != null)
        'CodeReviewSummaries': codeReviewSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRecommendationFeedbackResponse {
  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged.
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

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommendationFeedbackSummaries =
        this.recommendationFeedbackSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recommendationFeedbackSummaries != null)
        'RecommendationFeedbackSummaries': recommendationFeedbackSummaries,
    };
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

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommendationSummaries = this.recommendationSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recommendationSummaries != null)
        'RecommendationSummaries': recommendationSummaries,
    };
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

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final repositoryAssociationSummaries = this.repositoryAssociationSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (repositoryAssociationSummaries != null)
        'RepositoryAssociationSummaries': repositoryAssociationSummaries,
    };
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

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Information about the statistics from the code review.
class Metrics {
  /// Total number of recommendations found in the code review.
  final int? findingsCount;

  /// <code>MeteredLinesOfCodeCount</code> is the number of lines of code in the
  /// repository where the code review happened. This does not include non-code
  /// lines such as comments and blank lines.
  final int? meteredLinesOfCodeCount;

  /// <code>SuppressedLinesOfCodeCount</code> is the number of lines of code in
  /// the repository where the code review happened that CodeGuru Reviewer did not
  /// analyze. The lines suppressed in the analysis is based on the
  /// <code>excludeFiles</code> variable in the
  /// <code>aws-codeguru-reviewer.yml</code> file. This number does not include
  /// non-code lines such as comments and blank lines.
  final int? suppressedLinesOfCodeCount;

  Metrics({
    this.findingsCount,
    this.meteredLinesOfCodeCount,
    this.suppressedLinesOfCodeCount,
  });

  factory Metrics.fromJson(Map<String, dynamic> json) {
    return Metrics(
      findingsCount: json['FindingsCount'] as int?,
      meteredLinesOfCodeCount: json['MeteredLinesOfCodeCount'] as int?,
      suppressedLinesOfCodeCount: json['SuppressedLinesOfCodeCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final findingsCount = this.findingsCount;
    final meteredLinesOfCodeCount = this.meteredLinesOfCodeCount;
    final suppressedLinesOfCodeCount = this.suppressedLinesOfCodeCount;
    return {
      if (findingsCount != null) 'FindingsCount': findingsCount,
      if (meteredLinesOfCodeCount != null)
        'MeteredLinesOfCodeCount': meteredLinesOfCodeCount,
      if (suppressedLinesOfCodeCount != null)
        'SuppressedLinesOfCodeCount': suppressedLinesOfCodeCount,
    };
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

  /// Lines of code suppressed in the code review based on the
  /// <code>excludeFiles</code> element in the
  /// <code>aws-codeguru-reviewer.yml</code> file. For full repository analyses,
  /// this number includes all lines of code in the files that are suppressed. For
  /// pull requests, this number only includes the <i>changed</i> lines of code
  /// that are suppressed. In both cases, this number does not include non-code
  /// lines such as comments and import statements. For example, if you initiate a
  /// full repository analysis on a repository containing 5 files, each file with
  /// 100 lines of code, and 2 files are listed as excluded in the
  /// <code>aws-codeguru-reviewer.yml</code> file, then
  /// <code>SuppressedLinesOfCodeCount</code> returns 200 (2 * 100) as the total
  /// number of lines of code suppressed. However, if you submit a pull request
  /// for the same repository, then <code>SuppressedLinesOfCodeCount</code> only
  /// includes the lines in the 2 files that changed. If only 1 of the 2 files
  /// changed in the pull request, then <code>SuppressedLinesOfCodeCount</code>
  /// returns 100 (1 * 100) as the total number of lines of code suppressed.
  final int? suppressedLinesOfCodeCount;

  MetricsSummary({
    this.findingsCount,
    this.meteredLinesOfCodeCount,
    this.suppressedLinesOfCodeCount,
  });

  factory MetricsSummary.fromJson(Map<String, dynamic> json) {
    return MetricsSummary(
      findingsCount: json['FindingsCount'] as int?,
      meteredLinesOfCodeCount: json['MeteredLinesOfCodeCount'] as int?,
      suppressedLinesOfCodeCount: json['SuppressedLinesOfCodeCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final findingsCount = this.findingsCount;
    final meteredLinesOfCodeCount = this.meteredLinesOfCodeCount;
    final suppressedLinesOfCodeCount = this.suppressedLinesOfCodeCount;
    return {
      if (findingsCount != null) 'FindingsCount': findingsCount,
      if (meteredLinesOfCodeCount != null)
        'MeteredLinesOfCodeCount': meteredLinesOfCodeCount,
      if (suppressedLinesOfCodeCount != null)
        'SuppressedLinesOfCodeCount': suppressedLinesOfCodeCount,
    };
  }
}

enum ProviderType {
  codeCommit,
  gitHub,
  bitbucket,
  gitHubEnterpriseServer,
  s3Bucket,
}

extension ProviderTypeValueExtension on ProviderType {
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
      case ProviderType.s3Bucket:
        return 'S3Bucket';
    }
  }
}

extension ProviderTypeFromString on String {
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
      case 'S3Bucket':
        return ProviderType.s3Bucket;
    }
    throw Exception('$this is not known in enum ProviderType');
  }
}

class PutRecommendationFeedbackResponse {
  PutRecommendationFeedbackResponse();

  factory PutRecommendationFeedbackResponse.fromJson(Map<String, dynamic> _) {
    return PutRecommendationFeedbackResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum Reaction {
  thumbsUp,
  thumbsDown,
}

extension ReactionValueExtension on Reaction {
  String toValue() {
    switch (this) {
      case Reaction.thumbsUp:
        return 'ThumbsUp';
      case Reaction.thumbsDown:
        return 'ThumbsDown';
    }
  }
}

extension ReactionFromString on String {
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

enum RecommendationCategory {
  awsBestPractices,
  awsCloudFormationIssues,
  duplicateCode,
  codeMaintenanceIssues,
  concurrencyIssues,
  inputValidations,
  pythonBestPractices,
  javaBestPractices,
  resourceLeaks,
  securityIssues,
  codeInconsistencies,
}

extension RecommendationCategoryValueExtension on RecommendationCategory {
  String toValue() {
    switch (this) {
      case RecommendationCategory.awsBestPractices:
        return 'AWSBestPractices';
      case RecommendationCategory.awsCloudFormationIssues:
        return 'AWSCloudFormationIssues';
      case RecommendationCategory.duplicateCode:
        return 'DuplicateCode';
      case RecommendationCategory.codeMaintenanceIssues:
        return 'CodeMaintenanceIssues';
      case RecommendationCategory.concurrencyIssues:
        return 'ConcurrencyIssues';
      case RecommendationCategory.inputValidations:
        return 'InputValidations';
      case RecommendationCategory.pythonBestPractices:
        return 'PythonBestPractices';
      case RecommendationCategory.javaBestPractices:
        return 'JavaBestPractices';
      case RecommendationCategory.resourceLeaks:
        return 'ResourceLeaks';
      case RecommendationCategory.securityIssues:
        return 'SecurityIssues';
      case RecommendationCategory.codeInconsistencies:
        return 'CodeInconsistencies';
    }
  }
}

extension RecommendationCategoryFromString on String {
  RecommendationCategory toRecommendationCategory() {
    switch (this) {
      case 'AWSBestPractices':
        return RecommendationCategory.awsBestPractices;
      case 'AWSCloudFormationIssues':
        return RecommendationCategory.awsCloudFormationIssues;
      case 'DuplicateCode':
        return RecommendationCategory.duplicateCode;
      case 'CodeMaintenanceIssues':
        return RecommendationCategory.codeMaintenanceIssues;
      case 'ConcurrencyIssues':
        return RecommendationCategory.concurrencyIssues;
      case 'InputValidations':
        return RecommendationCategory.inputValidations;
      case 'PythonBestPractices':
        return RecommendationCategory.pythonBestPractices;
      case 'JavaBestPractices':
        return RecommendationCategory.javaBestPractices;
      case 'ResourceLeaks':
        return RecommendationCategory.resourceLeaks;
      case 'SecurityIssues':
        return RecommendationCategory.securityIssues;
      case 'CodeInconsistencies':
        return RecommendationCategory.codeInconsistencies;
    }
    throw Exception('$this is not known in enum RecommendationCategory');
  }
}

/// Information about the recommendation feedback.
class RecommendationFeedback {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">CodeReview</a>
  /// object.
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
  /// The <code>UserId</code> is an IAM principal that can be specified as an
  /// Amazon Web Services account ID or an Amazon Resource Name (ARN). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">
  /// Specifying a Principal</a> in the <i>Amazon Web Services Identity and Access
  /// Management User Guide</i>.
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

  Map<String, dynamic> toJson() {
    final codeReviewArn = this.codeReviewArn;
    final createdTimeStamp = this.createdTimeStamp;
    final lastUpdatedTimeStamp = this.lastUpdatedTimeStamp;
    final reactions = this.reactions;
    final recommendationId = this.recommendationId;
    final userId = this.userId;
    return {
      if (codeReviewArn != null) 'CodeReviewArn': codeReviewArn,
      if (createdTimeStamp != null)
        'CreatedTimeStamp': unixTimestampToJson(createdTimeStamp),
      if (lastUpdatedTimeStamp != null)
        'LastUpdatedTimeStamp': unixTimestampToJson(lastUpdatedTimeStamp),
      if (reactions != null)
        'Reactions': reactions.map((e) => e.toValue()).toList(),
      if (recommendationId != null) 'RecommendationId': recommendationId,
      if (userId != null) 'UserId': userId,
    };
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
  /// The <code>UserId</code> is an IAM principal that can be specified as an
  /// Amazon Web Services account ID or an Amazon Resource Name (ARN). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">
  /// Specifying a Principal</a> in the <i>Amazon Web Services Identity and Access
  /// Management User Guide</i>.
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

  Map<String, dynamic> toJson() {
    final reactions = this.reactions;
    final recommendationId = this.recommendationId;
    final userId = this.userId;
    return {
      if (reactions != null)
        'Reactions': reactions.map((e) => e.toValue()).toList(),
      if (recommendationId != null) 'RecommendationId': recommendationId,
      if (userId != null) 'UserId': userId,
    };
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

  /// The type of a recommendation.
  final RecommendationCategory? recommendationCategory;

  /// The recommendation ID that can be used to track the provided
  /// recommendations. Later on it can be used to collect the feedback.
  final String? recommendationId;

  /// Metadata about a rule. Rule metadata includes an ID, a name, a list of tags,
  /// and a short and long description. CodeGuru Reviewer uses rules to analyze
  /// code. A rule's recommendation is included in analysis results if code is
  /// detected that violates the rule.
  final RuleMetadata? ruleMetadata;

  /// The severity of the issue in the code that generated this recommendation.
  final Severity? severity;

  /// Start line from where the recommendation is applicable in the source commit
  /// or source branch.
  final int? startLine;

  RecommendationSummary({
    this.description,
    this.endLine,
    this.filePath,
    this.recommendationCategory,
    this.recommendationId,
    this.ruleMetadata,
    this.severity,
    this.startLine,
  });

  factory RecommendationSummary.fromJson(Map<String, dynamic> json) {
    return RecommendationSummary(
      description: json['Description'] as String?,
      endLine: json['EndLine'] as int?,
      filePath: json['FilePath'] as String?,
      recommendationCategory: (json['RecommendationCategory'] as String?)
          ?.toRecommendationCategory(),
      recommendationId: json['RecommendationId'] as String?,
      ruleMetadata: json['RuleMetadata'] != null
          ? RuleMetadata.fromJson(json['RuleMetadata'] as Map<String, dynamic>)
          : null,
      severity: (json['Severity'] as String?)?.toSeverity(),
      startLine: json['StartLine'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final endLine = this.endLine;
    final filePath = this.filePath;
    final recommendationCategory = this.recommendationCategory;
    final recommendationId = this.recommendationId;
    final ruleMetadata = this.ruleMetadata;
    final severity = this.severity;
    final startLine = this.startLine;
    return {
      if (description != null) 'Description': description,
      if (endLine != null) 'EndLine': endLine,
      if (filePath != null) 'FilePath': filePath,
      if (recommendationCategory != null)
        'RecommendationCategory': recommendationCategory.toValue(),
      if (recommendationId != null) 'RecommendationId': recommendationId,
      if (ruleMetadata != null) 'RuleMetadata': ruleMetadata,
      if (severity != null) 'Severity': severity.toValue(),
      if (startLine != null) 'StartLine': startLine,
    };
  }
}

/// Information about an associated Amazon Web Services CodeCommit repository or
/// an associated repository that is managed by Amazon Web Services CodeStar
/// Connections (for example, Bitbucket). This <code>Repository</code> object is
/// not used if your source code is in an associated GitHub repository.
class Repository {
  /// Information about a Bitbucket repository.
  final ThirdPartySourceRepository? bitbucket;

  /// Information about an Amazon Web Services CodeCommit repository.
  final CodeCommitRepository? codeCommit;

  /// Information about a GitHub Enterprise Server repository.
  final ThirdPartySourceRepository? gitHubEnterpriseServer;
  final S3Repository? s3Bucket;

  Repository({
    this.bitbucket,
    this.codeCommit,
    this.gitHubEnterpriseServer,
    this.s3Bucket,
  });

  Map<String, dynamic> toJson() {
    final bitbucket = this.bitbucket;
    final codeCommit = this.codeCommit;
    final gitHubEnterpriseServer = this.gitHubEnterpriseServer;
    final s3Bucket = this.s3Bucket;
    return {
      if (bitbucket != null) 'Bitbucket': bitbucket,
      if (codeCommit != null) 'CodeCommit': codeCommit,
      if (gitHubEnterpriseServer != null)
        'GitHubEnterpriseServer': gitHubEnterpriseServer,
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
    };
  }
}

/// A code review type that analyzes all code under a specified branch in an
/// associated repository. The associated repository is specified using its ARN
/// when you call <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CreateCodeReview">CreateCodeReview</a>.
class RepositoryAnalysis {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">SourceCodeType</a>
  /// that specifies the tip of a branch in an associated repository.
  final RepositoryHeadSourceCodeType? repositoryHead;
  final SourceCodeType? sourceCodeType;

  RepositoryAnalysis({
    this.repositoryHead,
    this.sourceCodeType,
  });

  Map<String, dynamic> toJson() {
    final repositoryHead = this.repositoryHead;
    final sourceCodeType = this.sourceCodeType;
    return {
      if (repositoryHead != null) 'RepositoryHead': repositoryHead,
      if (sourceCodeType != null) 'SourceCodeType': sourceCodeType,
    };
  }
}

/// Information about a repository association. The <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_DescribeRepositoryAssociation.html">DescribeRepositoryAssociation</a>
/// operation returns a <code>RepositoryAssociation</code> object.
class RepositoryAssociation {
  /// The Amazon Resource Name (ARN) identifying the repository association.
  final String? associationArn;

  /// The ID of the repository association.
  final String? associationId;

  /// The Amazon Resource Name (ARN) of an Amazon Web Services CodeStar
  /// Connections connection. Its format is
  /// <code>arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codestar-connections/latest/APIReference/API_Connection.html">Connection</a>
  /// in the <i>Amazon Web Services CodeStar Connections API Reference</i>.
  final String? connectionArn;

  /// The time, in milliseconds since the epoch, when the repository association
  /// was created.
  final DateTime? createdTimeStamp;

  /// A <code>KMSKeyDetails</code> object that contains:
  ///
  /// <ul>
  /// <li>
  /// The encryption option for this repository association. It is either owned by
  /// Amazon Web Services Key Management Service (KMS)
  /// (<code>AWS_OWNED_CMK</code>) or customer managed
  /// (<code>CUSTOMER_MANAGED_CMK</code>).
  /// </li>
  /// <li>
  /// The ID of the Amazon Web Services KMS key that is associated with this
  /// repository association.
  /// </li>
  /// </ul>
  final KMSKeyDetails? kMSKeyDetails;

  /// The time, in milliseconds since the epoch, when the repository association
  /// was last updated.
  final DateTime? lastUpdatedTimeStamp;

  /// The name of the repository.
  final String? name;

  /// The owner of the repository. For an Amazon Web Services CodeCommit
  /// repository, this is the Amazon Web Services account ID of the account that
  /// owns the repository. For a GitHub, GitHub Enterprise Server, or Bitbucket
  /// repository, this is the username for the account that owns the repository.
  /// For an S3 repository, it can be the username or Amazon Web Services account
  /// ID.
  final String? owner;

  /// The provider type of the repository association.
  final ProviderType? providerType;
  final S3RepositoryDetails? s3RepositoryDetails;

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
  /// reviews created in anassociated repository with tags after it has been
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
    this.kMSKeyDetails,
    this.lastUpdatedTimeStamp,
    this.name,
    this.owner,
    this.providerType,
    this.s3RepositoryDetails,
    this.state,
    this.stateReason,
  });

  factory RepositoryAssociation.fromJson(Map<String, dynamic> json) {
    return RepositoryAssociation(
      associationArn: json['AssociationArn'] as String?,
      associationId: json['AssociationId'] as String?,
      connectionArn: json['ConnectionArn'] as String?,
      createdTimeStamp: timeStampFromJson(json['CreatedTimeStamp']),
      kMSKeyDetails: json['KMSKeyDetails'] != null
          ? KMSKeyDetails.fromJson(
              json['KMSKeyDetails'] as Map<String, dynamic>)
          : null,
      lastUpdatedTimeStamp: timeStampFromJson(json['LastUpdatedTimeStamp']),
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      providerType: (json['ProviderType'] as String?)?.toProviderType(),
      s3RepositoryDetails: json['S3RepositoryDetails'] != null
          ? S3RepositoryDetails.fromJson(
              json['S3RepositoryDetails'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.toRepositoryAssociationState(),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationArn = this.associationArn;
    final associationId = this.associationId;
    final connectionArn = this.connectionArn;
    final createdTimeStamp = this.createdTimeStamp;
    final kMSKeyDetails = this.kMSKeyDetails;
    final lastUpdatedTimeStamp = this.lastUpdatedTimeStamp;
    final name = this.name;
    final owner = this.owner;
    final providerType = this.providerType;
    final s3RepositoryDetails = this.s3RepositoryDetails;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (associationArn != null) 'AssociationArn': associationArn,
      if (associationId != null) 'AssociationId': associationId,
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (createdTimeStamp != null)
        'CreatedTimeStamp': unixTimestampToJson(createdTimeStamp),
      if (kMSKeyDetails != null) 'KMSKeyDetails': kMSKeyDetails,
      if (lastUpdatedTimeStamp != null)
        'LastUpdatedTimeStamp': unixTimestampToJson(lastUpdatedTimeStamp),
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (providerType != null) 'ProviderType': providerType.toValue(),
      if (s3RepositoryDetails != null)
        'S3RepositoryDetails': s3RepositoryDetails,
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

enum RepositoryAssociationState {
  associated,
  associating,
  failed,
  disassociating,
  disassociated,
}

extension RepositoryAssociationStateValueExtension
    on RepositoryAssociationState {
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

extension RepositoryAssociationStateFromString on String {
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
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">ListRepositoryAssociations</a>
/// operation returns a list of <code>RepositoryAssociationSummary</code>
/// objects.
class RepositoryAssociationSummary {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">RepositoryAssociation</a>
  /// object. You can retrieve this ARN by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">ListRepositoryAssociations</a>.
  final String? associationArn;

  /// The repository association ID.
  final String? associationId;

  /// The Amazon Resource Name (ARN) of an Amazon Web Services CodeStar
  /// Connections connection. Its format is
  /// <code>arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codestar-connections/latest/APIReference/API_Connection.html">Connection</a>
  /// in the <i>Amazon Web Services CodeStar Connections API Reference</i>.
  final String? connectionArn;

  /// The time, in milliseconds since the epoch, since the repository association
  /// was last updated.
  final DateTime? lastUpdatedTimeStamp;

  /// The name of the repository association.
  final String? name;

  /// The owner of the repository. For an Amazon Web Services CodeCommit
  /// repository, this is the Amazon Web Services account ID of the account that
  /// owns the repository. For a GitHub, GitHub Enterprise Server, or Bitbucket
  /// repository, this is the username for the account that owns the repository.
  /// For an S3 repository, it can be the username or Amazon Web Services account
  /// ID.
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
  /// reviews created in anassociated repository with tags after it has been
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

  Map<String, dynamic> toJson() {
    final associationArn = this.associationArn;
    final associationId = this.associationId;
    final connectionArn = this.connectionArn;
    final lastUpdatedTimeStamp = this.lastUpdatedTimeStamp;
    final name = this.name;
    final owner = this.owner;
    final providerType = this.providerType;
    final state = this.state;
    return {
      if (associationArn != null) 'AssociationArn': associationArn,
      if (associationId != null) 'AssociationId': associationId,
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (lastUpdatedTimeStamp != null)
        'LastUpdatedTimeStamp': unixTimestampToJson(lastUpdatedTimeStamp),
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (providerType != null) 'ProviderType': providerType.toValue(),
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// A <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">SourceCodeType</a>
/// that specifies the tip of a branch in an associated repository.
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

/// Metadata that is associated with a code review. This applies to both pull
/// request and repository analysis code reviews.
class RequestMetadata {
  /// Information about the event associated with a code review.
  final EventInfo? eventInfo;

  /// The ID of the request. This is required for a pull request code review.
  final String? requestId;

  /// An identifier, such as a name or account ID, that is associated with the
  /// requester. The <code>Requester</code> is used to capture the
  /// <code>author/actor</code> name of the event request.
  final String? requester;

  /// The name of the repository vendor used to upload code to an S3 bucket for a
  /// CI/CD code review. For example, if code and artifacts are uploaded to an S3
  /// bucket for a CI/CD code review by GitHub scripts from a GitHub repository,
  /// then the repository association's <code>ProviderType</code> is
  /// <code>S3Bucket</code> and the CI/CD repository vendor name is GitHub. For
  /// more information, see the definition for <code>ProviderType</code> in <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">RepositoryAssociation</a>.
  final VendorName? vendorName;

  RequestMetadata({
    this.eventInfo,
    this.requestId,
    this.requester,
    this.vendorName,
  });

  factory RequestMetadata.fromJson(Map<String, dynamic> json) {
    return RequestMetadata(
      eventInfo: json['EventInfo'] != null
          ? EventInfo.fromJson(json['EventInfo'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      requester: json['Requester'] as String?,
      vendorName: (json['VendorName'] as String?)?.toVendorName(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventInfo = this.eventInfo;
    final requestId = this.requestId;
    final requester = this.requester;
    final vendorName = this.vendorName;
    return {
      if (eventInfo != null) 'EventInfo': eventInfo,
      if (requestId != null) 'RequestId': requestId,
      if (requester != null) 'Requester': requester,
      if (vendorName != null) 'VendorName': vendorName.toValue(),
    };
  }
}

/// Metadata about a rule. Rule metadata includes an ID, a name, a list of tags,
/// and a short and long description. CodeGuru Reviewer uses rules to analyze
/// code. A rule's recommendation is included in analysis results if code is
/// detected that violates the rule.
class RuleMetadata {
  /// A long description of the rule.
  final String? longDescription;

  /// The ID of the rule.
  final String? ruleId;

  /// The name of the rule.
  final String? ruleName;

  /// Tags that are associated with the rule.
  final List<String>? ruleTags;

  /// A short description of the rule.
  final String? shortDescription;

  RuleMetadata({
    this.longDescription,
    this.ruleId,
    this.ruleName,
    this.ruleTags,
    this.shortDescription,
  });

  factory RuleMetadata.fromJson(Map<String, dynamic> json) {
    return RuleMetadata(
      longDescription: json['LongDescription'] as String?,
      ruleId: json['RuleId'] as String?,
      ruleName: json['RuleName'] as String?,
      ruleTags: (json['RuleTags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      shortDescription: json['ShortDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final longDescription = this.longDescription;
    final ruleId = this.ruleId;
    final ruleName = this.ruleName;
    final ruleTags = this.ruleTags;
    final shortDescription = this.shortDescription;
    return {
      if (longDescription != null) 'LongDescription': longDescription,
      if (ruleId != null) 'RuleId': ruleId,
      if (ruleName != null) 'RuleName': ruleName,
      if (ruleTags != null) 'RuleTags': ruleTags,
      if (shortDescription != null) 'ShortDescription': shortDescription,
    };
  }
}

/// Information about an associated repository in an S3 bucket. The associated
/// repository contains a source code .zip file and a build artifacts .zip file
/// that contains .jar or .class files.
class S3BucketRepository {
  /// The name of the repository when the <code>ProviderType</code> is
  /// <code>S3Bucket</code>.
  final String name;

  /// An <code>S3RepositoryDetails</code> object that specifies the name of an S3
  /// bucket and a <code>CodeArtifacts</code> object. The
  /// <code>CodeArtifacts</code> object includes the S3 object keys for a source
  /// code .zip file and for a build artifacts .zip file.
  final S3RepositoryDetails? details;

  S3BucketRepository({
    required this.name,
    this.details,
  });

  factory S3BucketRepository.fromJson(Map<String, dynamic> json) {
    return S3BucketRepository(
      name: json['Name'] as String,
      details: json['Details'] != null
          ? S3RepositoryDetails.fromJson(
              json['Details'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final details = this.details;
    return {
      'Name': name,
      if (details != null) 'Details': details,
    };
  }
}

/// Information about a repository in an S3 bucket.
class S3Repository {
  /// The name of the S3 bucket used for associating a new S3 repository. It must
  /// begin with <code>codeguru-reviewer-</code>.
  final String bucketName;

  /// The name of the repository in the S3 bucket.
  final String name;

  S3Repository({
    required this.bucketName,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final name = this.name;
    return {
      'BucketName': bucketName,
      'Name': name,
    };
  }
}

/// Specifies the name of an S3 bucket and a <code>CodeArtifacts</code> object
/// that contains the S3 object keys for a source code .zip file and for a build
/// artifacts .zip file that contains .jar or .class files.
class S3RepositoryDetails {
  /// The name of the S3 bucket used for associating a new S3 repository. It must
  /// begin with <code>codeguru-reviewer-</code>.
  final String? bucketName;

  /// A <code>CodeArtifacts</code> object. The <code>CodeArtifacts</code> object
  /// includes the S3 object key for a source code .zip file and for a build
  /// artifacts .zip file that contains .jar or .class files.
  final CodeArtifacts? codeArtifacts;

  S3RepositoryDetails({
    this.bucketName,
    this.codeArtifacts,
  });

  factory S3RepositoryDetails.fromJson(Map<String, dynamic> json) {
    return S3RepositoryDetails(
      bucketName: json['BucketName'] as String?,
      codeArtifacts: json['CodeArtifacts'] != null
          ? CodeArtifacts.fromJson(
              json['CodeArtifacts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final codeArtifacts = this.codeArtifacts;
    return {
      if (bucketName != null) 'BucketName': bucketName,
      if (codeArtifacts != null) 'CodeArtifacts': codeArtifacts,
    };
  }
}

enum Severity {
  info,
  low,
  medium,
  high,
  critical,
}

extension SeverityValueExtension on Severity {
  String toValue() {
    switch (this) {
      case Severity.info:
        return 'Info';
      case Severity.low:
        return 'Low';
      case Severity.medium:
        return 'Medium';
      case Severity.high:
        return 'High';
      case Severity.critical:
        return 'Critical';
    }
  }
}

extension SeverityFromString on String {
  Severity toSeverity() {
    switch (this) {
      case 'Info':
        return Severity.info;
      case 'Low':
        return Severity.low;
      case 'Medium':
        return Severity.medium;
      case 'High':
        return Severity.high;
      case 'Critical':
        return Severity.critical;
    }
    throw Exception('$this is not known in enum Severity');
  }
}

/// Specifies the source code that is analyzed in a code review.
class SourceCodeType {
  /// A type of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">SourceCodeType</a>
  /// that specifies a source branch name and a destination branch name in an
  /// associated repository.
  final BranchDiffSourceCodeType? branchDiff;

  /// A <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">SourceCodeType</a>
  /// that specifies a commit diff created by a pull request on an associated
  /// repository.
  final CommitDiffSourceCodeType? commitDiff;
  final RepositoryHeadSourceCodeType? repositoryHead;

  /// Metadata that is associated with a code review. This applies to any type of
  /// code review supported by CodeGuru Reviewer. The <code>RequestMetadaa</code>
  /// field captures any event metadata. For example, it might capture metadata
  /// associated with an event trigger, such as a push or a pull request.
  final RequestMetadata? requestMetadata;

  /// Information about an associated repository in an S3 bucket that includes its
  /// name and an <code>S3RepositoryDetails</code> object. The
  /// <code>S3RepositoryDetails</code> object includes the name of an S3 bucket,
  /// an S3 key for a source code .zip file, and an S3 key for a build artifacts
  /// .zip file. <code>S3BucketRepository</code> is required in <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">SourceCodeType</a>
  /// for <code>S3BucketRepository</code> based code reviews.
  final S3BucketRepository? s3BucketRepository;

  SourceCodeType({
    this.branchDiff,
    this.commitDiff,
    this.repositoryHead,
    this.requestMetadata,
    this.s3BucketRepository,
  });

  factory SourceCodeType.fromJson(Map<String, dynamic> json) {
    return SourceCodeType(
      branchDiff: json['BranchDiff'] != null
          ? BranchDiffSourceCodeType.fromJson(
              json['BranchDiff'] as Map<String, dynamic>)
          : null,
      commitDiff: json['CommitDiff'] != null
          ? CommitDiffSourceCodeType.fromJson(
              json['CommitDiff'] as Map<String, dynamic>)
          : null,
      repositoryHead: json['RepositoryHead'] != null
          ? RepositoryHeadSourceCodeType.fromJson(
              json['RepositoryHead'] as Map<String, dynamic>)
          : null,
      requestMetadata: json['RequestMetadata'] != null
          ? RequestMetadata.fromJson(
              json['RequestMetadata'] as Map<String, dynamic>)
          : null,
      s3BucketRepository: json['S3BucketRepository'] != null
          ? S3BucketRepository.fromJson(
              json['S3BucketRepository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final branchDiff = this.branchDiff;
    final commitDiff = this.commitDiff;
    final repositoryHead = this.repositoryHead;
    final requestMetadata = this.requestMetadata;
    final s3BucketRepository = this.s3BucketRepository;
    return {
      if (branchDiff != null) 'BranchDiff': branchDiff,
      if (commitDiff != null) 'CommitDiff': commitDiff,
      if (repositoryHead != null) 'RepositoryHead': repositoryHead,
      if (requestMetadata != null) 'RequestMetadata': requestMetadata,
      if (s3BucketRepository != null) 'S3BucketRepository': s3BucketRepository,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a third-party source repository connected to CodeGuru
/// Reviewer.
class ThirdPartySourceRepository {
  /// The Amazon Resource Name (ARN) of an Amazon Web Services CodeStar
  /// Connections connection. Its format is
  /// <code>arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codestar-connections/latest/APIReference/API_Connection.html">Connection</a>
  /// in the <i>Amazon Web Services CodeStar Connections API Reference</i>.
  final String connectionArn;

  /// The name of the third party source repository.
  final String name;

  /// The owner of the repository. For a GitHub, GitHub Enterprise, or Bitbucket
  /// repository, this is the username for the account that owns the repository.
  /// For an S3 repository, this can be the username or Amazon Web Services
  /// account ID
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

extension TypeValueExtension on Type {
  String toValue() {
    switch (this) {
      case Type.pullRequest:
        return 'PullRequest';
      case Type.repositoryAnalysis:
        return 'RepositoryAnalysis';
    }
  }
}

extension TypeFromString on String {
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

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum VendorName {
  gitHub,
  gitLab,
  nativeS3,
}

extension VendorNameValueExtension on VendorName {
  String toValue() {
    switch (this) {
      case VendorName.gitHub:
        return 'GitHub';
      case VendorName.gitLab:
        return 'GitLab';
      case VendorName.nativeS3:
        return 'NativeS3';
    }
  }
}

extension VendorNameFromString on String {
  VendorName toVendorName() {
    switch (this) {
      case 'GitHub':
        return VendorName.gitHub;
      case 'GitLab':
        return VendorName.gitLab;
      case 'NativeS3':
        return VendorName.nativeS3;
    }
    throw Exception('$this is not known in enum VendorName');
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
