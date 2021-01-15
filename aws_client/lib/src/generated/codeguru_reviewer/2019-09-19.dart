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

part '2019-09-19.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codeguru-reviewer',
            signingName: 'codeguru-reviewer',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required Repository repository,
    String clientRequestToken,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[\w-]+$''',
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
    @_s.required String name,
    @_s.required String repositoryAssociationArn,
    @_s.required CodeReviewType type,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-_]*''',
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
    _s.validateStringPattern(
      'repositoryAssociationArn',
      repositoryAssociationArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:association:[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[\w-]+$''',
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
    @_s.required String codeReviewArn,
  }) async {
    ArgumentError.checkNotNull(codeReviewArn, 'codeReviewArn');
    _s.validateStringLength(
      'codeReviewArn',
      codeReviewArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'codeReviewArn',
      codeReviewArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:[a-z-]+:[\w-]+$''',
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
    @_s.required String codeReviewArn,
    @_s.required String recommendationId,
    String userId,
  }) async {
    ArgumentError.checkNotNull(codeReviewArn, 'codeReviewArn');
    _s.validateStringLength(
      'codeReviewArn',
      codeReviewArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'codeReviewArn',
      codeReviewArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:[a-z-]+:[\w-]+$''',
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
      if (recommendationId != null) 'RecommendationId': [recommendationId],
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
    @_s.required String associationArn,
  }) async {
    ArgumentError.checkNotNull(associationArn, 'associationArn');
    _s.validateStringLength(
      'associationArn',
      associationArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'associationArn',
      associationArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:association:[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String associationArn,
  }) async {
    ArgumentError.checkNotNull(associationArn, 'associationArn');
    _s.validateStringLength(
      'associationArn',
      associationArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'associationArn',
      associationArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:association:[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required Type type,
    int maxResults,
    String nextToken,
    List<ProviderType> providerTypes,
    List<String> repositoryNames,
    List<JobState> states,
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
      if (type != null) 'Type': [type.toValue()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (providerTypes != null)
        'ProviderTypes': providerTypes.map((e) => e?.toValue() ?? '').toList(),
      if (repositoryNames != null) 'RepositoryNames': repositoryNames,
      if (states != null)
        'States': states.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String codeReviewArn,
    int maxResults,
    String nextToken,
    List<String> recommendationIds,
    List<String> userIds,
  }) async {
    ArgumentError.checkNotNull(codeReviewArn, 'codeReviewArn');
    _s.validateStringLength(
      'codeReviewArn',
      codeReviewArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'codeReviewArn',
      codeReviewArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:[a-z-]+:[\w-]+$''',
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
    @_s.required String codeReviewArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(codeReviewArn, 'codeReviewArn');
    _s.validateStringLength(
      'codeReviewArn',
      codeReviewArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'codeReviewArn',
      codeReviewArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:[a-z-]+:[\w-]+$''',
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
    int maxResults,
    List<String> names,
    String nextToken,
    List<String> owners,
    List<ProviderType> providerTypes,
    List<RepositoryAssociationState> states,
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
        'ProviderType': providerTypes.map((e) => e?.toValue() ?? '').toList(),
      if (states != null)
        'State': states.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:association:[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String codeReviewArn,
    @_s.required List<Reaction> reactions,
    @_s.required String recommendationId,
  }) async {
    ArgumentError.checkNotNull(codeReviewArn, 'codeReviewArn');
    _s.validateStringLength(
      'codeReviewArn',
      codeReviewArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'codeReviewArn',
      codeReviewArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:[a-z-]+:[\w-]+$''',
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
      'Reactions': reactions?.map((e) => e?.toValue() ?? '')?.toList(),
      'RecommendationId': recommendationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/feedback',
      exceptionFnMap: _exceptionFns,
    );
    return PutRecommendationFeedbackResponse.fromJson(response);
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
    @_s.required Map<String, String> tags,
    @_s.required String resourceArn,
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
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:association:[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required List<String> tagKeys,
    @_s.required String resourceArn,
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
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:association:[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateRepositoryResponse {
  /// Information about the repository association.
  @_s.JsonKey(name: 'RepositoryAssociation')
  final RepositoryAssociation repositoryAssociation;

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
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  AssociateRepositoryResponse({
    this.repositoryAssociation,
    this.tags,
  });
  factory AssociateRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateRepositoryResponseFromJson(json);
}

/// Information about an AWS CodeCommit repository. The CodeCommit repository
/// must be in the same AWS Region and AWS account where its CodeGuru Reviewer
/// code reviews are configured.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CodeCommitRepository {
  /// The name of the AWS CodeCommit repository. For more information, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/APIReference/API_GetRepository.html#CodeCommit-GetRepository-request-repositoryName">repositoryName</a>
  /// in the <i>AWS CodeCommit API Reference</i>.
  @_s.JsonKey(name: 'Name')
  final String name;

  CodeCommitRepository({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$CodeCommitRepositoryToJson(this);
}

/// Information about a code review. A code review belongs to the associated
/// repository that contains the reviewed code.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CodeReview {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> that contains the reviewed source
  /// code. You can retrieve associated repository ARNs by calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
  /// <code>ListRepositoryAssociations</code> </a>.
  @_s.JsonKey(name: 'AssociationArn')
  final String associationArn;

  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  @_s.JsonKey(name: 'CodeReviewArn')
  final String codeReviewArn;

  /// The time, in milliseconds since the epoch, when the code review was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimeStamp')
  final DateTime createdTimeStamp;

  /// The time, in milliseconds since the epoch, when the code review was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimeStamp')
  final DateTime lastUpdatedTimeStamp;

  /// The statistics from the code review.
  @_s.JsonKey(name: 'Metrics')
  final Metrics metrics;

  /// The name of the code review.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The owner of the repository. For an AWS CodeCommit repository, this is the
  /// AWS account ID of the account that owns the repository. For a GitHub, GitHub
  /// Enterprise Server, or Bitbucket repository, this is the username for the
  /// account that owns the repository.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The type of repository that contains the reviewed code (for example, GitHub
  /// or Bitbucket).
  @_s.JsonKey(name: 'ProviderType')
  final ProviderType providerType;

  /// The pull request ID for the code review.
  @_s.JsonKey(name: 'PullRequestId')
  final String pullRequestId;

  /// The name of the repository.
  @_s.JsonKey(name: 'RepositoryName')
  final String repositoryName;

  /// The type of the source code for the code review.
  @_s.JsonKey(name: 'SourceCodeType')
  final SourceCodeType sourceCodeType;

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
  @_s.JsonKey(name: 'State')
  final JobState state;

  /// The reason for the state of the code review.
  @_s.JsonKey(name: 'StateReason')
  final String stateReason;

  /// The type of code review.
  @_s.JsonKey(name: 'Type')
  final Type type;

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
  factory CodeReview.fromJson(Map<String, dynamic> json) =>
      _$CodeReviewFromJson(json);
}

/// Information about the summary of the code review.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CodeReviewSummary {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  @_s.JsonKey(name: 'CodeReviewArn')
  final String codeReviewArn;

  /// The time, in milliseconds since the epoch, when the code review was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimeStamp')
  final DateTime createdTimeStamp;

  /// The time, in milliseconds since the epoch, when the code review was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimeStamp')
  final DateTime lastUpdatedTimeStamp;

  /// The statistics from the code review.
  @_s.JsonKey(name: 'MetricsSummary')
  final MetricsSummary metricsSummary;

  /// The name of the code review.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The owner of the repository. For an AWS CodeCommit repository, this is the
  /// AWS account ID of the account that owns the repository. For a GitHub, GitHub
  /// Enterprise Server, or Bitbucket repository, this is the username for the
  /// account that owns the repository.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The provider type of the repository association.
  @_s.JsonKey(name: 'ProviderType')
  final ProviderType providerType;

  /// The pull request ID for the code review.
  @_s.JsonKey(name: 'PullRequestId')
  final String pullRequestId;

  /// The name of the repository.
  @_s.JsonKey(name: 'RepositoryName')
  final String repositoryName;

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
  @_s.JsonKey(name: 'State')
  final JobState state;

  /// The type of the code review.
  @_s.JsonKey(name: 'Type')
  final Type type;

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
  factory CodeReviewSummary.fromJson(Map<String, dynamic> json) =>
      _$CodeReviewSummaryFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CodeReviewType {
  /// A code review that analyzes all code under a specified branch in an
  /// associated respository. The assocated repository is specified using its ARN
  /// in <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CreateCodeReview">
  /// <code>CreateCodeReview</code> </a>.
  @_s.JsonKey(name: 'RepositoryAnalysis')
  final RepositoryAnalysis repositoryAnalysis;

  CodeReviewType({
    @_s.required this.repositoryAnalysis,
  });
  Map<String, dynamic> toJson() => _$CodeReviewTypeToJson(this);
}

/// A type of <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">
/// <code>SourceCodeType</code> </a> that specifies the commit diff for a pull
/// request on an associated repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CommitDiffSourceCodeType {
  /// The SHA of the destination commit used to generate a commit diff.
  @_s.JsonKey(name: 'DestinationCommit')
  final String destinationCommit;

  /// The SHA of the source commit used to generate a commit diff.
  @_s.JsonKey(name: 'SourceCommit')
  final String sourceCommit;

  CommitDiffSourceCodeType({
    this.destinationCommit,
    this.sourceCommit,
  });
  factory CommitDiffSourceCodeType.fromJson(Map<String, dynamic> json) =>
      _$CommitDiffSourceCodeTypeFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCodeReviewResponse {
  @_s.JsonKey(name: 'CodeReview')
  final CodeReview codeReview;

  CreateCodeReviewResponse({
    this.codeReview,
  });
  factory CreateCodeReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCodeReviewResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCodeReviewResponse {
  /// Information about the code review.
  @_s.JsonKey(name: 'CodeReview')
  final CodeReview codeReview;

  DescribeCodeReviewResponse({
    this.codeReview,
  });
  factory DescribeCodeReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCodeReviewResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRecommendationFeedbackResponse {
  /// The recommendation feedback given by the user.
  @_s.JsonKey(name: 'RecommendationFeedback')
  final RecommendationFeedback recommendationFeedback;

  DescribeRecommendationFeedbackResponse({
    this.recommendationFeedback,
  });
  factory DescribeRecommendationFeedbackResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRecommendationFeedbackResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRepositoryAssociationResponse {
  /// Information about the repository association.
  @_s.JsonKey(name: 'RepositoryAssociation')
  final RepositoryAssociation repositoryAssociation;

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
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  DescribeRepositoryAssociationResponse({
    this.repositoryAssociation,
    this.tags,
  });
  factory DescribeRepositoryAssociationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRepositoryAssociationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateRepositoryResponse {
  /// Information about the disassociated repository.
  @_s.JsonKey(name: 'RepositoryAssociation')
  final RepositoryAssociation repositoryAssociation;

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
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  DisassociateRepositoryResponse({
    this.repositoryAssociation,
    this.tags,
  });
  factory DisassociateRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateRepositoryResponseFromJson(json);
}

enum JobState {
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Deleting')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCodeReviewsResponse {
  /// A list of code reviews that meet the criteria of the request.
  @_s.JsonKey(name: 'CodeReviewSummaries')
  final List<CodeReviewSummary> codeReviewSummaries;

  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCodeReviewsResponse({
    this.codeReviewSummaries,
    this.nextToken,
  });
  factory ListCodeReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCodeReviewsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecommendationFeedbackResponse {
  /// If nextToken is returned, there are more results available. The value of
  /// nextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page. Keep all other arguments
  /// unchanged.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Recommendation feedback summaries corresponding to the code review ARN.
  @_s.JsonKey(name: 'RecommendationFeedbackSummaries')
  final List<RecommendationFeedbackSummary> recommendationFeedbackSummaries;

  ListRecommendationFeedbackResponse({
    this.nextToken,
    this.recommendationFeedbackSummaries,
  });
  factory ListRecommendationFeedbackResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListRecommendationFeedbackResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecommendationsResponse {
  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of recommendations for the requested code review.
  @_s.JsonKey(name: 'RecommendationSummaries')
  final List<RecommendationSummary> recommendationSummaries;

  ListRecommendationsResponse({
    this.nextToken,
    this.recommendationSummaries,
  });
  factory ListRecommendationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRecommendationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRepositoryAssociationsResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListRecommendations</code> request. When the results of a
  /// <code>ListRecommendations</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of repository associations that meet the criteria of the request.
  @_s.JsonKey(name: 'RepositoryAssociationSummaries')
  final List<RepositoryAssociationSummary> repositoryAssociationSummaries;

  ListRepositoryAssociationsResponse({
    this.nextToken,
    this.repositoryAssociationSummaries,
  });
  factory ListRepositoryAssociationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListRepositoryAssociationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Information about the statistics from the code review.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Metrics {
  /// Total number of recommendations found in the code review.
  @_s.JsonKey(name: 'FindingsCount')
  final int findingsCount;

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
  @_s.JsonKey(name: 'MeteredLinesOfCodeCount')
  final int meteredLinesOfCodeCount;

  Metrics({
    this.findingsCount,
    this.meteredLinesOfCodeCount,
  });
  factory Metrics.fromJson(Map<String, dynamic> json) =>
      _$MetricsFromJson(json);
}

/// Information about metrics summaries.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MetricsSummary {
  /// Total number of recommendations found in the code review.
  @_s.JsonKey(name: 'FindingsCount')
  final int findingsCount;

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
  @_s.JsonKey(name: 'MeteredLinesOfCodeCount')
  final int meteredLinesOfCodeCount;

  MetricsSummary({
    this.findingsCount,
    this.meteredLinesOfCodeCount,
  });
  factory MetricsSummary.fromJson(Map<String, dynamic> json) =>
      _$MetricsSummaryFromJson(json);
}

enum ProviderType {
  @_s.JsonValue('CodeCommit')
  codeCommit,
  @_s.JsonValue('GitHub')
  gitHub,
  @_s.JsonValue('Bitbucket')
  bitbucket,
  @_s.JsonValue('GitHubEnterpriseServer')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRecommendationFeedbackResponse {
  PutRecommendationFeedbackResponse();
  factory PutRecommendationFeedbackResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutRecommendationFeedbackResponseFromJson(json);
}

enum Reaction {
  @_s.JsonValue('ThumbsUp')
  thumbsUp,
  @_s.JsonValue('ThumbsDown')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the recommendation feedback.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationFeedback {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReview.html">
  /// <code>CodeReview</code> </a> object.
  @_s.JsonKey(name: 'CodeReviewArn')
  final String codeReviewArn;

  /// The time at which the feedback was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimeStamp')
  final DateTime createdTimeStamp;

  /// The time at which the feedback was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimeStamp')
  final DateTime lastUpdatedTimeStamp;

  /// List for storing reactions. Reactions are utf-8 text code for emojis. You
  /// can send an empty list to clear off all your feedback.
  @_s.JsonKey(name: 'Reactions')
  final List<Reaction> reactions;

  /// The recommendation ID that can be used to track the provided
  /// recommendations. Later on it can be used to collect the feedback.
  @_s.JsonKey(name: 'RecommendationId')
  final String recommendationId;

  /// The ID of the user that made the API call.
  ///
  /// The <code>UserId</code> is an IAM principal that can be specified as an AWS
  /// account ID or an Amazon Resource Name (ARN). For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">
  /// Specifying a Principal</a> in the <i>AWS Identity and Access Management User
  /// Guide</i>.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  RecommendationFeedback({
    this.codeReviewArn,
    this.createdTimeStamp,
    this.lastUpdatedTimeStamp,
    this.reactions,
    this.recommendationId,
    this.userId,
  });
  factory RecommendationFeedback.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFeedbackFromJson(json);
}

/// Information about recommendation feedback summaries.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationFeedbackSummary {
  /// List for storing reactions. Reactions are utf-8 text code for emojis.
  @_s.JsonKey(name: 'Reactions')
  final List<Reaction> reactions;

  /// The recommendation ID that can be used to track the provided
  /// recommendations. Later on it can be used to collect the feedback.
  @_s.JsonKey(name: 'RecommendationId')
  final String recommendationId;

  /// The ID of the user that gave the feedback.
  ///
  /// The <code>UserId</code> is an IAM principal that can be specified as an AWS
  /// account ID or an Amazon Resource Name (ARN). For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">
  /// Specifying a Principal</a> in the <i>AWS Identity and Access Management User
  /// Guide</i>.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  RecommendationFeedbackSummary({
    this.reactions,
    this.recommendationId,
    this.userId,
  });
  factory RecommendationFeedbackSummary.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFeedbackSummaryFromJson(json);
}

/// Information about recommendations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommendationSummary {
  /// A description of the recommendation generated by CodeGuru Reviewer for the
  /// lines of code between the start line and the end line.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Last line where the recommendation is applicable in the source commit or
  /// source branch. For a single line comment the start line and end line values
  /// are the same.
  @_s.JsonKey(name: 'EndLine')
  final int endLine;

  /// Name of the file on which a recommendation is provided.
  @_s.JsonKey(name: 'FilePath')
  final String filePath;

  /// The recommendation ID that can be used to track the provided
  /// recommendations. Later on it can be used to collect the feedback.
  @_s.JsonKey(name: 'RecommendationId')
  final String recommendationId;

  /// Start line from where the recommendation is applicable in the source commit
  /// or source branch.
  @_s.JsonKey(name: 'StartLine')
  final int startLine;

  RecommendationSummary({
    this.description,
    this.endLine,
    this.filePath,
    this.recommendationId,
    this.startLine,
  });
  factory RecommendationSummary.fromJson(Map<String, dynamic> json) =>
      _$RecommendationSummaryFromJson(json);
}

/// Information about an associated AWS CodeCommit repository or an associated
/// repository that is managed by AWS CodeStar Connections (for example,
/// Bitbucket). This <code>Repository</code> object is not used if your source
/// code is in an associated GitHub repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Repository {
  /// Information about a Bitbucket repository.
  @_s.JsonKey(name: 'Bitbucket')
  final ThirdPartySourceRepository bitbucket;

  /// Information about an AWS CodeCommit repository.
  @_s.JsonKey(name: 'CodeCommit')
  final CodeCommitRepository codeCommit;

  /// Information about a GitHub Enterprise Server repository.
  @_s.JsonKey(name: 'GitHubEnterpriseServer')
  final ThirdPartySourceRepository gitHubEnterpriseServer;

  Repository({
    this.bitbucket,
    this.codeCommit,
    this.gitHubEnterpriseServer,
  });
  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}

/// A code review type that analyzes all code under a specified branch in an
/// associated respository. The assocated repository is specified using its ARN
/// when you call <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CreateCodeReview">
/// <code>CreateCodeReview</code> </a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RepositoryAnalysis {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">
  /// <code>SourceCodeType</code> </a> that specifies the tip of a branch in an
  /// associated repository.
  @_s.JsonKey(name: 'RepositoryHead')
  final RepositoryHeadSourceCodeType repositoryHead;

  RepositoryAnalysis({
    @_s.required this.repositoryHead,
  });
  Map<String, dynamic> toJson() => _$RepositoryAnalysisToJson(this);
}

/// Information about a repository association. The <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_DescribeRepositoryAssociation.html">
/// <code>DescribeRepositoryAssociation</code> </a> operation returns a
/// <code>RepositoryAssociation</code> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RepositoryAssociation {
  /// The Amazon Resource Name (ARN) identifying the repository association.
  @_s.JsonKey(name: 'AssociationArn')
  final String associationArn;

  /// The ID of the repository association.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The Amazon Resource Name (ARN) of an AWS CodeStar Connections connection.
  /// Its format is
  /// <code>arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codestar-connections/latest/APIReference/API_Connection.html">
  /// <code>Connection</code> </a> in the <i>AWS CodeStar Connections API
  /// Reference</i>.
  @_s.JsonKey(name: 'ConnectionArn')
  final String connectionArn;

  /// The time, in milliseconds since the epoch, when the repository association
  /// was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimeStamp')
  final DateTime createdTimeStamp;

  /// The time, in milliseconds since the epoch, when the repository association
  /// was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimeStamp')
  final DateTime lastUpdatedTimeStamp;

  /// The name of the repository.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The owner of the repository. For an AWS CodeCommit repository, this is the
  /// AWS account ID of the account that owns the repository. For a GitHub, GitHub
  /// Enterprise Server, or Bitbucket repository, this is the username for the
  /// account that owns the repository.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The provider type of the repository association.
  @_s.JsonKey(name: 'ProviderType')
  final ProviderType providerType;

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
  @_s.JsonKey(name: 'State')
  final RepositoryAssociationState state;

  /// A description of why the repository association is in the current state.
  @_s.JsonKey(name: 'StateReason')
  final String stateReason;

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
  factory RepositoryAssociation.fromJson(Map<String, dynamic> json) =>
      _$RepositoryAssociationFromJson(json);
}

enum RepositoryAssociationState {
  @_s.JsonValue('Associated')
  associated,
  @_s.JsonValue('Associating')
  associating,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Disassociating')
  disassociating,
  @_s.JsonValue('Disassociated')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Summary information about a repository association. The <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
/// <code>ListRepositoryAssociations</code> </a> operation returns a list of
/// <code>RepositoryAssociationSummary</code> objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RepositoryAssociationSummary {
  /// The Amazon Resource Name (ARN) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
  /// <code>RepositoryAssociation</code> </a> object. You can retrieve this ARN by
  /// calling <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_ListRepositoryAssociations.html">
  /// <code>ListRepositoryAssociations</code> </a>.
  @_s.JsonKey(name: 'AssociationArn')
  final String associationArn;

  /// The repository association ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The Amazon Resource Name (ARN) of an AWS CodeStar Connections connection.
  /// Its format is
  /// <code>arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codestar-connections/latest/APIReference/API_Connection.html">
  /// <code>Connection</code> </a> in the <i>AWS CodeStar Connections API
  /// Reference</i>.
  @_s.JsonKey(name: 'ConnectionArn')
  final String connectionArn;

  /// The time, in milliseconds since the epoch, since the repository association
  /// was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimeStamp')
  final DateTime lastUpdatedTimeStamp;

  /// The name of the repository association.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The owner of the repository. For an AWS CodeCommit repository, this is the
  /// AWS account ID of the account that owns the repository. For a GitHub, GitHub
  /// Enterprise Server, or Bitbucket repository, this is the username for the
  /// account that owns the repository.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The provider type of the repository association.
  @_s.JsonKey(name: 'ProviderType')
  final ProviderType providerType;

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
  @_s.JsonKey(name: 'State')
  final RepositoryAssociationState state;

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
  factory RepositoryAssociationSummary.fromJson(Map<String, dynamic> json) =>
      _$RepositoryAssociationSummaryFromJson(json);
}

/// A <a
/// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">
/// <code>SourceCodeType</code> </a> that specifies the tip of a branch in an
/// associated repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RepositoryHeadSourceCodeType {
  /// The name of the branch in an associated repository. The
  /// <code>RepositoryHeadSourceCodeType</code> specifies the tip of this branch.
  @_s.JsonKey(name: 'BranchName')
  final String branchName;

  RepositoryHeadSourceCodeType({
    @_s.required this.branchName,
  });
  factory RepositoryHeadSourceCodeType.fromJson(Map<String, dynamic> json) =>
      _$RepositoryHeadSourceCodeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryHeadSourceCodeTypeToJson(this);
}

/// Specifies the source code that is analyzed in a code review. A code review
/// can analyze the source code that is specified using a pull request diff or a
/// branch in an associated repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SourceCodeType {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/reviewer-api/API_SourceCodeType">
  /// <code>SourceCodeType</code> </a> that specifies a commit diff created by a
  /// pull request on an associated repository.
  @_s.JsonKey(name: 'CommitDiff')
  final CommitDiffSourceCodeType commitDiff;
  @_s.JsonKey(name: 'RepositoryHead')
  final RepositoryHeadSourceCodeType repositoryHead;

  SourceCodeType({
    this.commitDiff,
    this.repositoryHead,
  });
  factory SourceCodeType.fromJson(Map<String, dynamic> json) =>
      _$SourceCodeTypeFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Information about a third-party source repository connected to CodeGuru
/// Reviewer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ThirdPartySourceRepository {
  /// The Amazon Resource Name (ARN) of an AWS CodeStar Connections connection.
  /// Its format is
  /// <code>arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codestar-connections/latest/APIReference/API_Connection.html">
  /// <code>Connection</code> </a> in the <i>AWS CodeStar Connections API
  /// Reference</i>.
  @_s.JsonKey(name: 'ConnectionArn')
  final String connectionArn;

  /// The name of the third party source repository.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The owner of the repository. For a GitHub, GitHub Enterprise, or Bitbucket
  /// repository, this is the username for the account that owns the repository.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  ThirdPartySourceRepository({
    @_s.required this.connectionArn,
    @_s.required this.name,
    @_s.required this.owner,
  });
  Map<String, dynamic> toJson() => _$ThirdPartySourceRepositoryToJson(this);
}

enum Type {
  @_s.JsonValue('PullRequest')
  pullRequest,
  @_s.JsonValue('RepositoryAnalysis')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
