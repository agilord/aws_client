// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2020_10_19.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Operations_Amazon_Q_Connect.html">Amazon
/// Q actions</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Types_Amazon_Q_Connect.html">Amazon
/// Q data types</a>
/// </li>
/// </ul> <note>
/// <b>Powered by Amazon Bedrock</b>: Amazon Web Services implements <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/abuse-detection.html">automated
/// abuse detection</a>. Because Amazon Q in Connect is built on Amazon Bedrock,
/// users can take full advantage of the controls implemented in Amazon Bedrock
/// to enforce safety, security, and the responsible use of artificial
/// intelligence (AI).
/// </note>
/// Amazon Q in Connect is a generative AI customer service assistant. It is an
/// LLM-enhanced evolution of Amazon Connect Wisdom that delivers real-time
/// recommendations to help contact center agents resolve customer issues
/// quickly and accurately.
///
/// Amazon Q in Connect automatically detects customer intent during calls and
/// chats using conversational analytics and natural language understanding
/// (NLU). It then provides agents with immediate, real-time generative
/// responses and suggested actions, and links to relevant documents and
/// articles. Agents can also query Amazon Q in Connect directly using natural
/// language or keywords to answer customer requests.
///
/// Use the Amazon Q in Connect APIs to create an assistant and a knowledge
/// base, for example, or manage content by uploading custom files.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-q-connect.html">Use
/// Amazon Q in Connect for generative AI powered agent assistance in
/// real-time</a> in the <i>Amazon Connect Administrator Guide</i>.
class QConnect {
  final _s.RestJsonProtocol _protocol;
  factory QConnect({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'wisdom',
    );
    return QConnect._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  QConnect._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Adds the specified tags to the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified tags from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
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

  /// Creates an Amazon Q in Connect assistant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the assistant.
  ///
  /// Parameter [type] :
  /// The type of assistant.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [description] :
  /// The description of the assistant.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// The customer managed key must have a policy that allows
  /// <code>kms:CreateGrant</code>, <code> kms:DescribeKey</code>,
  /// <code>kms:Decrypt</code>, and <code>kms:GenerateDataKey*</code>
  /// permissions to the IAM identity using the key to invoke Amazon Q in
  /// Connect. To use Amazon Q in Connect with chat, the key policy must also
  /// allow <code>kms:Decrypt</code>, <code>kms:GenerateDataKey*</code>, and
  /// <code>kms:DescribeKey</code> permissions to the
  /// <code>connect.amazonaws.com</code> service principal.
  ///
  /// For more information about setting up a customer managed key for Amazon Q
  /// in Connect, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-q.html">Enable
  /// Amazon Q in Connect for your instance</a>.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateAssistantResponse> createAssistant({
    required String name,
    required AssistantType type,
    String? clientToken,
    String? description,
    ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'type': type.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assistants',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssistantResponse.fromJson(response);
  }

  /// Retrieves information about an assistant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  Future<GetAssistantResponse> getAssistant({
    required String assistantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssistantResponse.fromJson(response);
  }

  /// Deletes an assistant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  Future<void> deleteAssistant({
    required String assistantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists information about assistants.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListAssistantsResponse> listAssistants({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assistants',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssistantsResponse.fromJson(response);
  }

  /// <important>
  /// This API will be discontinued starting June 1, 2024. To receive generative
  /// responses after March 1, 2024, you will need to create a new Assistant in
  /// the Amazon Connect console and integrate the Amazon Q in Connect
  /// JavaScript library (amazon-q-connectjs) into your applications.
  /// </important>
  /// Retrieves recommendations for the specified session. To avoid retrieving
  /// the same recommendations in subsequent calls, use <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_NotifyRecommendationsReceived.html">NotifyRecommendationsReceived</a>.
  /// This API supports long-polling behavior with the
  /// <code>waitTimeSeconds</code> parameter. Short poll is the default behavior
  /// and only returns recommendations already available. To perform a manual
  /// query against an assistant, use <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_QueryAssistant.html">QueryAssistant</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextChunkToken] :
  /// The token for the next set of chunks. Use the value returned in the
  /// previous response in the next request to retrieve the next set of chunks.
  ///
  /// Parameter [recommendationType] :
  /// The type of recommendation being requested.
  ///
  /// Parameter [waitTimeSeconds] :
  /// The duration (in seconds) for which the call waits for a recommendation to
  /// be made available before returning. If a recommendation is available, the
  /// call returns sooner than <code>WaitTimeSeconds</code>. If no messages are
  /// available and the wait time expires, the call returns successfully with an
  /// empty list.
  Future<GetRecommendationsResponse> getRecommendations({
    required String assistantId,
    required String sessionId,
    int? maxResults,
    String? nextChunkToken,
    RecommendationType? recommendationType,
    int? waitTimeSeconds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateNumRange(
      'waitTimeSeconds',
      waitTimeSeconds,
      0,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextChunkToken != null) 'nextChunkToken': [nextChunkToken],
      if (recommendationType != null)
        'recommendationType': [recommendationType.value],
      if (waitTimeSeconds != null)
        'waitTimeSeconds': [waitTimeSeconds.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/sessions/${Uri.encodeComponent(sessionId)}/recommendations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommendationsResponse.fromJson(response);
  }

  /// Lists the models available to an Amazon Q in Connect assistant in the
  /// assistant's Amazon Web Services Region. The available models are
  /// determined by the region of the specified assistant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN. The assistant's region determines
  /// which models are available.
  ///
  /// Parameter [aiPromptType] :
  /// The type of the AI Prompt to filter models by. When specified, only models
  /// that support the given AI Prompt type are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [modelLifecycle] :
  /// The lifecycle status of models to filter by. When specified, only models
  /// with the given lifecycle status are returned.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListModelsResponse> listModels({
    required String assistantId,
    AIPromptType? aiPromptType,
    int? maxResults,
    ModelLifecycle? modelLifecycle,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (aiPromptType != null) 'aiPromptType': [aiPromptType.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (modelLifecycle != null) 'modelLifecycle': [modelLifecycle.value],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}/models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListModelsResponse.fromJson(response);
  }

  /// Removes the specified recommendations from the specified assistant's queue
  /// of newly available recommendations. You can use this API in conjunction
  /// with <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_GetRecommendations.html">GetRecommendations</a>
  /// and a <code>waitTimeSeconds</code> input for long-polling behavior and
  /// avoiding duplicate recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [recommendationIds] :
  /// The identifiers of the recommendations.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  Future<NotifyRecommendationsReceivedResponse> notifyRecommendationsReceived({
    required String assistantId,
    required List<String> recommendationIds,
    required String sessionId,
  }) async {
    final $payload = <String, dynamic>{
      'recommendationIds': recommendationIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/sessions/${Uri.encodeComponent(sessionId)}/recommendations/notify',
      exceptionFnMap: _exceptionFns,
    );
    return NotifyRecommendationsReceivedResponse.fromJson(response);
  }

  /// Provides feedback against the specified assistant for the specified
  /// target. This API only supports generative targets.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant.
  ///
  /// Parameter [contentFeedback] :
  /// Information about the feedback provided.
  ///
  /// Parameter [targetId] :
  /// The identifier of the feedback target.
  ///
  /// Parameter [targetType] :
  /// The type of the feedback target.
  Future<PutFeedbackResponse> putFeedback({
    required String assistantId,
    required ContentFeedbackData contentFeedback,
    required String targetId,
    required TargetType targetType,
  }) async {
    final $payload = <String, dynamic>{
      'contentFeedback': contentFeedback,
      'targetId': targetId,
      'targetType': targetType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}/feedback',
      exceptionFnMap: _exceptionFns,
    );
    return PutFeedbackResponse.fromJson(response);
  }

  /// <important>
  /// This API will be discontinued starting June 1, 2024. To receive generative
  /// responses after March 1, 2024, you will need to create a new Assistant in
  /// the Amazon Connect console and integrate the Amazon Q in Connect
  /// JavaScript library (amazon-q-connectjs) into your applications.
  /// </important>
  /// Performs a manual search against the specified assistant. To retrieve
  /// recommendations for an assistant, use <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_GetRecommendations.html">GetRecommendations</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [overrideKnowledgeBaseSearchType] :
  /// The search type to be used against the Knowledge Base for this request.
  /// The values can be <code>SEMANTIC</code> which uses vector embeddings or
  /// <code>HYBRID</code> which use vector embeddings and raw text.
  ///
  /// Parameter [queryCondition] :
  /// Information about how to query content.
  ///
  /// Parameter [queryInputData] :
  /// Information about the query.
  ///
  /// Parameter [queryText] :
  /// The text to search for.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the Amazon Q in Connect session. Can be either the ID or
  /// the ARN. URLs cannot contain the ARN.
  Future<QueryAssistantResponse> queryAssistant({
    required String assistantId,
    int? maxResults,
    String? nextToken,
    KnowledgeBaseSearchType? overrideKnowledgeBaseSearchType,
    List<QueryCondition>? queryCondition,
    QueryInputData? queryInputData,
    String? queryText,
    String? sessionId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (overrideKnowledgeBaseSearchType != null)
        'overrideKnowledgeBaseSearchType':
            overrideKnowledgeBaseSearchType.value,
      if (queryCondition != null) 'queryCondition': queryCondition,
      if (queryInputData != null) 'queryInputData': queryInputData,
      if (queryText != null) 'queryText': queryText,
      if (sessionId != null) 'sessionId': sessionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}/query',
      exceptionFnMap: _exceptionFns,
    );
    return QueryAssistantResponse.fromJson(response);
  }

  /// Removes the AI Agent that is set for use by default on an Amazon Q in
  /// Connect Assistant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiAgentType] :
  /// The type of the AI Agent being removed for use by default from the Amazon
  /// Q in Connect Assistant.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [orchestratorUseCase] :
  /// The orchestrator use case for the AI Agent being removed.
  Future<void> removeAssistantAIAgent({
    required AIAgentType aiAgentType,
    required String assistantId,
    String? orchestratorUseCase,
  }) async {
    final $query = <String, List<String>>{
      'aiAgentType': [aiAgentType.value],
      if (orchestratorUseCase != null)
        'orchestratorUseCase': [orchestratorUseCase],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiagentConfiguration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves content from knowledge sources based on a query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant for content retrieval.
  ///
  /// Parameter [retrievalConfiguration] :
  /// The configuration for the content retrieval operation.
  ///
  /// Parameter [retrievalQuery] :
  /// The query for content retrieval.
  Future<RetrieveResponse> retrieve({
    required String assistantId,
    required RetrievalConfiguration retrievalConfiguration,
    required String retrievalQuery,
  }) async {
    final $payload = <String, dynamic>{
      'retrievalConfiguration': retrievalConfiguration,
      'retrievalQuery': retrievalQuery,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}/retrieve',
      exceptionFnMap: _exceptionFns,
    );
    return RetrieveResponse.fromJson(response);
  }

  /// Searches for sessions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [searchExpression] :
  /// The search expression to filter results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<SearchSessionsResponse> searchSessions({
    required String assistantId,
    required SearchExpression searchExpression,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'searchExpression': searchExpression,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/searchSessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchSessionsResponse.fromJson(response);
  }

  /// Updates the AI Agent that is set for use by default on an Amazon Q in
  /// Connect Assistant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiAgentType] :
  /// The type of the AI Agent being updated for use by default on the Amazon Q
  /// in Connect Assistant.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [configuration] :
  /// The configuration of the AI Agent being updated for use by default on the
  /// Amazon Q in Connect Assistant.
  ///
  /// Parameter [orchestratorUseCase] :
  /// The orchestrator use case for the AI Agent being added.
  Future<UpdateAssistantAIAgentResponse> updateAssistantAIAgent({
    required AIAgentType aiAgentType,
    required String assistantId,
    required AIAgentConfigurationData configuration,
    String? orchestratorUseCase,
  }) async {
    final $payload = <String, dynamic>{
      'aiAgentType': aiAgentType.value,
      'configuration': configuration,
      if (orchestratorUseCase != null)
        'orchestratorUseCase': orchestratorUseCase,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiagentConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssistantAIAgentResponse.fromJson(response);
  }

  /// Creates an Amazon Q in Connect AI Agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [configuration] :
  /// The configuration of the AI Agent.
  ///
  /// Parameter [name] :
  /// The name of the AI Agent.
  ///
  /// Parameter [type] :
  /// The type of the AI Agent.
  ///
  /// Parameter [visibilityStatus] :
  /// The visibility status of the AI Agent.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>..
  ///
  /// Parameter [description] :
  /// The description of the AI Agent.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateAIAgentResponse> createAIAgent({
    required String assistantId,
    required AIAgentConfiguration configuration,
    required String name,
    required AIAgentType type,
    required VisibilityStatus visibilityStatus,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'name': name,
      'type': type.value,
      'visibilityStatus': visibilityStatus.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}/aiagents',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAIAgentResponse.fromJson(response);
  }

  /// Gets an Amazon Q in Connect AI Agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiAgentId] :
  /// The identifier of the Amazon Q in Connect AI Agent (with or without a
  /// version qualifier). Can be either the ID or the ARN. URLs cannot contain
  /// the ARN.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  Future<GetAIAgentResponse> getAIAgent({
    required String aiAgentId,
    required String assistantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiagents/${Uri.encodeComponent(aiAgentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAIAgentResponse.fromJson(response);
  }

  /// Updates an AI Agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiAgentId] :
  /// The identifier of the Amazon Q in Connect AI Agent.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [visibilityStatus] :
  /// The visbility status of the Amazon Q in Connect AI Agent.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>..
  ///
  /// Parameter [configuration] :
  /// The configuration of the Amazon Q in Connect AI Agent.
  ///
  /// Parameter [description] :
  /// The description of the Amazon Q in Connect AI Agent.
  Future<UpdateAIAgentResponse> updateAIAgent({
    required String aiAgentId,
    required String assistantId,
    required VisibilityStatus visibilityStatus,
    String? clientToken,
    AIAgentConfiguration? configuration,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'visibilityStatus': visibilityStatus.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (configuration != null) 'configuration': configuration,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiagents/${Uri.encodeComponent(aiAgentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAIAgentResponse.fromJson(response);
  }

  /// Deletes an Amazon Q in Connect AI Agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiAgentId] :
  /// The identifier of the Amazon Q in Connect AI Agent. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  Future<void> deleteAIAgent({
    required String aiAgentId,
    required String assistantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiagents/${Uri.encodeComponent(aiAgentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists AI Agents.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [origin] :
  /// The origin of the AI Agents to be listed. <code>SYSTEM</code> for a
  /// default AI Agent created by Q in Connect or <code>CUSTOMER</code> for an
  /// AI Agent created by calling AI Agent creation APIs.
  Future<ListAIAgentsResponse> listAIAgents({
    required String assistantId,
    int? maxResults,
    String? nextToken,
    Origin? origin,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (origin != null) 'origin': [origin.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}/aiagents',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAIAgentsResponse.fromJson(response);
  }

  /// Creates and Amazon Q in Connect AI Agent version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiAgentId] :
  /// The identifier of the Amazon Q in Connect AI Agent.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>..
  ///
  /// Parameter [modifiedTime] :
  /// The modification time of the AI Agent should be tracked for version
  /// creation. This field should be specified to avoid version creation when
  /// simultaneous update to the underlying AI Agent are possible. The value
  /// should be the modifiedTime returned from the request to create or update
  /// an AI Agent so that version creation can fail if an update to the AI Agent
  /// post the specified modification time has been made.
  Future<CreateAIAgentVersionResponse> createAIAgentVersion({
    required String aiAgentId,
    required String assistantId,
    String? clientToken,
    DateTime? modifiedTime,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (modifiedTime != null)
        'modifiedTime': unixTimestampToJson(modifiedTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiagents/${Uri.encodeComponent(aiAgentId)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAIAgentVersionResponse.fromJson(response);
  }

  /// Deletes an Amazon Q in Connect AI Agent Version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiAgentId] :
  /// The identifier of the Amazon Q in Connect AI Agent. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [versionNumber] :
  /// The version number of the AI Agent version.
  Future<void> deleteAIAgentVersion({
    required String aiAgentId,
    required String assistantId,
    required int versionNumber,
  }) async {
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiagents/${Uri.encodeComponent(aiAgentId)}/versions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List AI Agent versions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiAgentId] :
  /// The identifier of the Amazon Q in Connect AI Agent for which versions are
  /// to be listed.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [origin] :
  /// The origin of the AI Agent versions to be listed. <code>SYSTEM</code> for
  /// a default AI Agent created by Q in Connect or <code>CUSTOMER</code> for an
  /// AI Agent created by calling AI Agent creation APIs.
  Future<ListAIAgentVersionsResponse> listAIAgentVersions({
    required String aiAgentId,
    required String assistantId,
    int? maxResults,
    String? nextToken,
    Origin? origin,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (origin != null) 'origin': [origin.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiagents/${Uri.encodeComponent(aiAgentId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAIAgentVersionsResponse.fromJson(response);
  }

  /// Creates an Amazon Q in Connect AI Guardrail.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [blockedInputMessaging] :
  /// The message to return when the AI Guardrail blocks a prompt.
  ///
  /// Parameter [blockedOutputsMessaging] :
  /// The message to return when the AI Guardrail blocks a model response.
  ///
  /// Parameter [name] :
  /// The name of the AI Guardrail.
  ///
  /// Parameter [visibilityStatus] :
  /// The visibility status of the AI Guardrail.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>..
  ///
  /// Parameter [contentPolicyConfig] :
  /// The content filter policies to configure for the AI Guardrail.
  ///
  /// Parameter [contextualGroundingPolicyConfig] :
  /// The contextual grounding policy configuration used to create an AI
  /// Guardrail.
  ///
  /// Parameter [description] :
  /// A description of the AI Guardrail.
  ///
  /// Parameter [sensitiveInformationPolicyConfig] :
  /// The sensitive information policy to configure for the AI Guardrail.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  ///
  /// Parameter [topicPolicyConfig] :
  /// The topic policies to configure for the AI Guardrail.
  ///
  /// Parameter [wordPolicyConfig] :
  /// The word policy you configure for the AI Guardrail.
  Future<CreateAIGuardrailResponse> createAIGuardrail({
    required String assistantId,
    required String blockedInputMessaging,
    required String blockedOutputsMessaging,
    required String name,
    required VisibilityStatus visibilityStatus,
    String? clientToken,
    AIGuardrailContentPolicyConfig? contentPolicyConfig,
    AIGuardrailContextualGroundingPolicyConfig? contextualGroundingPolicyConfig,
    String? description,
    AIGuardrailSensitiveInformationPolicyConfig?
        sensitiveInformationPolicyConfig,
    Map<String, String>? tags,
    AIGuardrailTopicPolicyConfig? topicPolicyConfig,
    AIGuardrailWordPolicyConfig? wordPolicyConfig,
  }) async {
    final $payload = <String, dynamic>{
      'blockedInputMessaging': blockedInputMessaging,
      'blockedOutputsMessaging': blockedOutputsMessaging,
      'name': name,
      'visibilityStatus': visibilityStatus.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (contentPolicyConfig != null)
        'contentPolicyConfig': contentPolicyConfig,
      if (contextualGroundingPolicyConfig != null)
        'contextualGroundingPolicyConfig': contextualGroundingPolicyConfig,
      if (description != null) 'description': description,
      if (sensitiveInformationPolicyConfig != null)
        'sensitiveInformationPolicyConfig': sensitiveInformationPolicyConfig,
      if (tags != null) 'tags': tags,
      if (topicPolicyConfig != null) 'topicPolicyConfig': topicPolicyConfig,
      if (wordPolicyConfig != null) 'wordPolicyConfig': wordPolicyConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiguardrails',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAIGuardrailResponse.fromJson(response);
  }

  /// Gets the Amazon Q in Connect AI Guardrail.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiGuardrailId] :
  /// The identifier of the Amazon Q in Connect AI Guardrail.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  Future<GetAIGuardrailResponse> getAIGuardrail({
    required String aiGuardrailId,
    required String assistantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiguardrails/${Uri.encodeComponent(aiGuardrailId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAIGuardrailResponse.fromJson(response);
  }

  /// Updates an AI Guardrail.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiGuardrailId] :
  /// The identifier of the Amazon Q in Connect AI Guardrail.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [blockedInputMessaging] :
  /// The message to return when the AI Guardrail blocks a prompt.
  ///
  /// Parameter [blockedOutputsMessaging] :
  /// The message to return when the AI Guardrail blocks a model response.
  ///
  /// Parameter [visibilityStatus] :
  /// The visibility status of the Amazon Q in Connect AI Guardrail.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>..
  ///
  /// Parameter [contentPolicyConfig] :
  /// The content filter policies to configure for the AI Guardrail.
  ///
  /// Parameter [contextualGroundingPolicyConfig] :
  /// The contextual grounding policy configuration used to create an AI
  /// Guardrail.
  ///
  /// Parameter [description] :
  /// A description of the AI Guardrail.
  ///
  /// Parameter [sensitiveInformationPolicyConfig] :
  /// The sensitive information policy to configure for the AI Guardrail.
  ///
  /// Parameter [topicPolicyConfig] :
  /// The topic policies to configure for the AI Guardrail.
  ///
  /// Parameter [wordPolicyConfig] :
  /// The word policy you configure for the AI Guardrail.
  Future<UpdateAIGuardrailResponse> updateAIGuardrail({
    required String aiGuardrailId,
    required String assistantId,
    required String blockedInputMessaging,
    required String blockedOutputsMessaging,
    required VisibilityStatus visibilityStatus,
    String? clientToken,
    AIGuardrailContentPolicyConfig? contentPolicyConfig,
    AIGuardrailContextualGroundingPolicyConfig? contextualGroundingPolicyConfig,
    String? description,
    AIGuardrailSensitiveInformationPolicyConfig?
        sensitiveInformationPolicyConfig,
    AIGuardrailTopicPolicyConfig? topicPolicyConfig,
    AIGuardrailWordPolicyConfig? wordPolicyConfig,
  }) async {
    final $payload = <String, dynamic>{
      'blockedInputMessaging': blockedInputMessaging,
      'blockedOutputsMessaging': blockedOutputsMessaging,
      'visibilityStatus': visibilityStatus.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (contentPolicyConfig != null)
        'contentPolicyConfig': contentPolicyConfig,
      if (contextualGroundingPolicyConfig != null)
        'contextualGroundingPolicyConfig': contextualGroundingPolicyConfig,
      if (description != null) 'description': description,
      if (sensitiveInformationPolicyConfig != null)
        'sensitiveInformationPolicyConfig': sensitiveInformationPolicyConfig,
      if (topicPolicyConfig != null) 'topicPolicyConfig': topicPolicyConfig,
      if (wordPolicyConfig != null) 'wordPolicyConfig': wordPolicyConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiguardrails/${Uri.encodeComponent(aiGuardrailId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAIGuardrailResponse.fromJson(response);
  }

  /// Deletes an Amazon Q in Connect AI Guardrail.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiGuardrailId] :
  /// The identifier of the Amazon Q in Connect AI Guardrail. Can be either the
  /// ID or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  Future<void> deleteAIGuardrail({
    required String aiGuardrailId,
    required String assistantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiguardrails/${Uri.encodeComponent(aiGuardrailId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the AI Guardrails available on the Amazon Q in Connect assistant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListAIGuardrailsResponse> listAIGuardrails({
    required String assistantId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiguardrails',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAIGuardrailsResponse.fromJson(response);
  }

  /// Creates an Amazon Q in Connect AI Guardrail version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiGuardrailId] :
  /// The identifier of the Amazon Q in Connect AI Guardrail.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>..
  ///
  /// Parameter [modifiedTime] :
  /// The time the AI Guardrail was last modified.
  Future<CreateAIGuardrailVersionResponse> createAIGuardrailVersion({
    required String aiGuardrailId,
    required String assistantId,
    String? clientToken,
    DateTime? modifiedTime,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (modifiedTime != null)
        'modifiedTime': unixTimestampToJson(modifiedTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiguardrails/${Uri.encodeComponent(aiGuardrailId)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAIGuardrailVersionResponse.fromJson(response);
  }

  /// Delete and Amazon Q in Connect AI Guardrail version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiGuardrailId] :
  /// The identifier of the Amazon Q in Connect AI Guardrail.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [versionNumber] :
  /// The version number of the AI Guardrail version to be deleted.
  Future<void> deleteAIGuardrailVersion({
    required String aiGuardrailId,
    required String assistantId,
    required int versionNumber,
  }) async {
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiguardrails/${Uri.encodeComponent(aiGuardrailId)}/versions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists AI Guardrail versions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiGuardrailId] :
  /// The identifier of the Amazon Q in Connect AI Guardrail for which versions
  /// are to be listed.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListAIGuardrailVersionsResponse> listAIGuardrailVersions({
    required String aiGuardrailId,
    required String assistantId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiguardrails/${Uri.encodeComponent(aiGuardrailId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAIGuardrailVersionsResponse.fromJson(response);
  }

  /// Creates an Amazon Q in Connect AI Prompt.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [apiFormat] :
  /// The API Format of the AI Prompt.
  ///
  /// Recommended values: <code>MESSAGES | TEXT_COMPLETIONS</code>
  /// <note>
  /// The values <code>ANTHROPIC_CLAUDE_MESSAGES |
  /// ANTHROPIC_CLAUDE_TEXT_COMPLETIONS</code> will be deprecated.
  /// </note>
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [modelId] :
  /// The identifier of the model used for this AI Prompt.
  /// <note>
  /// For information about which models are supported in each Amazon Web
  /// Services Region, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/create-ai-prompts.html#cli-create-aiprompt">Supported
  /// models for system/custom prompts</a>.
  /// </note>
  ///
  /// Parameter [name] :
  /// The name of the AI Prompt.
  ///
  /// Parameter [templateConfiguration] :
  /// The configuration of the prompt template for this AI Prompt.
  ///
  /// Parameter [templateType] :
  /// The type of the prompt template for this AI Prompt.
  ///
  /// Parameter [type] :
  /// The type of this AI Prompt.
  ///
  /// Parameter [visibilityStatus] :
  /// The visibility status of the AI Prompt.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>..
  ///
  /// Parameter [description] :
  /// The description of the AI Prompt.
  ///
  /// Parameter [inferenceConfiguration] :
  /// The inference configuration for the AI Prompt being created.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateAIPromptResponse> createAIPrompt({
    required AIPromptAPIFormat apiFormat,
    required String assistantId,
    required String modelId,
    required String name,
    required AIPromptTemplateConfiguration templateConfiguration,
    required AIPromptTemplateType templateType,
    required AIPromptType type,
    required VisibilityStatus visibilityStatus,
    String? clientToken,
    String? description,
    AIPromptInferenceConfiguration? inferenceConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'apiFormat': apiFormat.value,
      'modelId': modelId,
      'name': name,
      'templateConfiguration': templateConfiguration,
      'templateType': templateType.value,
      'type': type.value,
      'visibilityStatus': visibilityStatus.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}/aiprompts',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAIPromptResponse.fromJson(response);
  }

  /// Gets and Amazon Q in Connect AI Prompt.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiPromptId] :
  /// The identifier of the Amazon Q in Connect AI prompt.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  Future<GetAIPromptResponse> getAIPrompt({
    required String aiPromptId,
    required String assistantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiprompts/${Uri.encodeComponent(aiPromptId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAIPromptResponse.fromJson(response);
  }

  /// Updates an AI Prompt.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiPromptId] :
  /// The identifier of the Amazon Q in Connect AI Prompt.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [visibilityStatus] :
  /// The visibility status of the Amazon Q in Connect AI prompt.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>..
  ///
  /// Parameter [description] :
  /// The description of the Amazon Q in Connect AI Prompt.
  ///
  /// Parameter [inferenceConfiguration] :
  /// The updated inference configuration for the AI Prompt.
  ///
  /// Parameter [modelId] :
  /// The identifier of the model used for this AI Prompt.
  /// <note>
  /// For information about which models are supported in each Amazon Web
  /// Services Region, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/create-ai-prompts.html#cli-create-aiprompt">Supported
  /// models for system/custom prompts</a>.
  /// </note>
  ///
  /// Parameter [templateConfiguration] :
  /// The configuration of the prompt template for this AI Prompt.
  Future<UpdateAIPromptResponse> updateAIPrompt({
    required String aiPromptId,
    required String assistantId,
    required VisibilityStatus visibilityStatus,
    String? clientToken,
    String? description,
    AIPromptInferenceConfiguration? inferenceConfiguration,
    String? modelId,
    AIPromptTemplateConfiguration? templateConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'visibilityStatus': visibilityStatus.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
      if (modelId != null) 'modelId': modelId,
      if (templateConfiguration != null)
        'templateConfiguration': templateConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiprompts/${Uri.encodeComponent(aiPromptId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAIPromptResponse.fromJson(response);
  }

  /// Deletes an Amazon Q in Connect AI Prompt.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiPromptId] :
  /// The identifier of the Amazon Q in Connect AI prompt. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  Future<void> deleteAIPrompt({
    required String aiPromptId,
    required String assistantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiprompts/${Uri.encodeComponent(aiPromptId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the AI Prompts available on the Amazon Q in Connect assistant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [origin] :
  /// The origin of the AI Prompts to be listed. <code>SYSTEM</code> for a
  /// default AI Agent created by Q in Connect or <code>CUSTOMER</code> for an
  /// AI Agent created by calling AI Agent creation APIs.
  Future<ListAIPromptsResponse> listAIPrompts({
    required String assistantId,
    int? maxResults,
    String? nextToken,
    Origin? origin,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (origin != null) 'origin': [origin.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}/aiprompts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAIPromptsResponse.fromJson(response);
  }

  /// Creates an Amazon Q in Connect AI Prompt version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiPromptId] :
  /// The identifier of the Amazon Q in Connect AI prompt.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>..
  ///
  /// Parameter [modifiedTime] :
  /// The time the AI Prompt was last modified.
  Future<CreateAIPromptVersionResponse> createAIPromptVersion({
    required String aiPromptId,
    required String assistantId,
    String? clientToken,
    DateTime? modifiedTime,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (modifiedTime != null)
        'modifiedTime': unixTimestampToJson(modifiedTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiprompts/${Uri.encodeComponent(aiPromptId)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAIPromptVersionResponse.fromJson(response);
  }

  /// Delete and Amazon Q in Connect AI Prompt version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiPromptId] :
  /// The identifier of the Amazon Q in Connect AI prompt.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [versionNumber] :
  /// The version number of the AI Prompt version to be deleted.
  Future<void> deleteAIPromptVersion({
    required String aiPromptId,
    required String assistantId,
    required int versionNumber,
  }) async {
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiprompts/${Uri.encodeComponent(aiPromptId)}/versions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists AI Prompt versions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aiPromptId] :
  /// The identifier of the Amazon Q in Connect AI prompt for which versions are
  /// to be listed.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [origin] :
  /// The origin of the AI Prompt versions to be listed. <code>SYSTEM</code> for
  /// a default AI Agent created by Q in Connect or <code>CUSTOMER</code> for an
  /// AI Agent created by calling AI Agent creation APIs.
  Future<ListAIPromptVersionsResponse> listAIPromptVersions({
    required String aiPromptId,
    required String assistantId,
    int? maxResults,
    String? nextToken,
    Origin? origin,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (origin != null) 'origin': [origin.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/aiprompts/${Uri.encodeComponent(aiPromptId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAIPromptVersionsResponse.fromJson(response);
  }

  /// Creates an association between an Amazon Q in Connect assistant and
  /// another resource. Currently, the only supported association is with a
  /// knowledge base. An assistant can have only a single association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [association] :
  /// The identifier of the associated resource.
  ///
  /// Parameter [associationType] :
  /// The type of association.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateAssistantAssociationResponse> createAssistantAssociation({
    required String assistantId,
    required AssistantAssociationInputData association,
    required AssociationType associationType,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'association': association,
      'associationType': associationType.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/associations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssistantAssociationResponse.fromJson(response);
  }

  /// Retrieves information about an assistant association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantAssociationId] :
  /// The identifier of the assistant association. Can be either the ID or the
  /// ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  Future<GetAssistantAssociationResponse> getAssistantAssociation({
    required String assistantAssociationId,
    required String assistantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/associations/${Uri.encodeComponent(assistantAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssistantAssociationResponse.fromJson(response);
  }

  /// Deletes an assistant association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantAssociationId] :
  /// The identifier of the assistant association. Can be either the ID or the
  /// ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  Future<void> deleteAssistantAssociation({
    required String assistantAssociationId,
    required String assistantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/associations/${Uri.encodeComponent(assistantAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists information about assistant associations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListAssistantAssociationsResponse> listAssistantAssociations({
    required String assistantId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssistantAssociationsResponse.fromJson(response);
  }

  /// Creates a session. A session is a contextual container used for generating
  /// recommendations. Amazon Connect creates a new Amazon Q in Connect session
  /// for each contact on which Amazon Q in Connect is enabled.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [name] :
  /// The name of the session.
  ///
  /// Parameter [aiAgentConfiguration] :
  /// The configuration of the AI Agents (mapped by AI Agent Type to AI Agent
  /// version) that should be used by Amazon Q in Connect for this Session.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [contactArn] :
  /// The Amazon Resource Name (ARN) of the email contact in Amazon Connect.
  /// Used to retrieve email content and establish session context for
  /// AI-powered email assistance.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [orchestratorConfigurationList] :
  /// The list of orchestrator configurations for the session being created.
  ///
  /// Parameter [removeOrchestratorConfigurationList] :
  /// The list of orchestrator configurations to remove from the session.
  ///
  /// Parameter [tagFilter] :
  /// An object that can be used to specify Tag conditions.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateSessionResponse> createSession({
    required String assistantId,
    required String name,
    Map<AIAgentType, AIAgentConfigurationData>? aiAgentConfiguration,
    String? clientToken,
    String? contactArn,
    String? description,
    List<OrchestratorConfigurationEntry>? orchestratorConfigurationList,
    bool? removeOrchestratorConfigurationList,
    TagFilter? tagFilter,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (aiAgentConfiguration != null)
        'aiAgentConfiguration':
            aiAgentConfiguration.map((k, e) => MapEntry(k.value, e)),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (contactArn != null) 'contactArn': contactArn,
      if (description != null) 'description': description,
      if (orchestratorConfigurationList != null)
        'orchestratorConfigurationList': orchestratorConfigurationList,
      if (removeOrchestratorConfigurationList != null)
        'removeOrchestratorConfigurationList':
            removeOrchestratorConfigurationList,
      if (tagFilter != null) 'tagFilter': tagFilter,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}/sessions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSessionResponse.fromJson(response);
  }

  /// Retrieves information for a specified session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  Future<GetSessionResponse> getSession({
    required String assistantId,
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/sessions/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionResponse.fromJson(response);
  }

  /// Updates a session. A session is a contextual container used for generating
  /// recommendations. Amazon Connect updates the existing Amazon Q in Connect
  /// session for each contact on which Amazon Q in Connect is enabled.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  ///
  /// Parameter [aiAgentConfiguration] :
  /// The configuration of the AI Agents (mapped by AI Agent Type to AI Agent
  /// version) that should be used by Amazon Q in Connect for this Session.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [orchestratorConfigurationList] :
  /// The updated list of orchestrator configurations for the session.
  ///
  /// Parameter [removeOrchestratorConfigurationList] :
  /// The list of orchestrator configurations to remove from the session.
  ///
  /// Parameter [tagFilter] :
  /// An object that can be used to specify Tag conditions.
  Future<UpdateSessionResponse> updateSession({
    required String assistantId,
    required String sessionId,
    Map<AIAgentType, AIAgentConfigurationData>? aiAgentConfiguration,
    String? description,
    List<OrchestratorConfigurationEntry>? orchestratorConfigurationList,
    bool? removeOrchestratorConfigurationList,
    TagFilter? tagFilter,
  }) async {
    final $payload = <String, dynamic>{
      if (aiAgentConfiguration != null)
        'aiAgentConfiguration':
            aiAgentConfiguration.map((k, e) => MapEntry(k.value, e)),
      if (description != null) 'description': description,
      if (orchestratorConfigurationList != null)
        'orchestratorConfigurationList': orchestratorConfigurationList,
      if (removeOrchestratorConfigurationList != null)
        'removeOrchestratorConfigurationList':
            removeOrchestratorConfigurationList,
      if (tagFilter != null) 'tagFilter': tagFilter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/sessions/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSessionResponse.fromJson(response);
  }

  /// Retrieves next message on an Amazon Q in Connect session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnprocessableContentException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant.
  ///
  /// Parameter [nextMessageToken] :
  /// The token for the next message. Use the value returned in the SendMessage
  /// or previous response in the next request to retrieve the next message.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the Amazon Q in Connect session.
  Future<GetNextMessageResponse> getNextMessage({
    required String assistantId,
    required String nextMessageToken,
    required String sessionId,
  }) async {
    final $query = <String, List<String>>{
      'nextMessageToken': [nextMessageToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/sessions/${Uri.encodeComponent(sessionId)}/messages/next',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetNextMessageResponse.fromJson(response);
  }

  /// Lists messages on an Amazon Q in Connect session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the Amazon Q in Connect session.
  ///
  /// Parameter [filter] :
  /// The filter criteria for listing messages.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListMessagesResponse> listMessages({
    required String assistantId,
    required String sessionId,
    MessageFilterType? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (filter != null) 'filter': [filter.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/sessions/${Uri.encodeComponent(sessionId)}/messages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMessagesResponse.fromJson(response);
  }

  /// Retrieves AI agent execution traces for a session, providing granular
  /// visibility into agent orchestration flows, LLM interactions, and tool
  /// invocations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// UUID or ARN of the Connect AI Assistant resource
  ///
  /// Parameter [sessionId] :
  /// UUID or ARN of the Connect AI Session resource
  ///
  /// Parameter [maxResults] :
  /// Maximum number of spans to return per page
  ///
  /// Parameter [nextToken] :
  /// Pagination token for retrieving the next page of results
  Future<ListSpansResponse> listSpans({
    required String assistantId,
    required String sessionId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/sessions/${Uri.encodeComponent(sessionId)}/spans',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSpansResponse.fromJson(response);
  }

  /// Submits a message to the Amazon Q in Connect session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant.
  ///
  /// Parameter [message] :
  /// The message data to submit to the Amazon Q in Connect session.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the Amazon Q in Connect session.
  ///
  /// Parameter [type] :
  /// The message type.
  ///
  /// Parameter [aiAgentId] :
  /// The identifier of the AI Agent to use for processing the message.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the AWS SDK populates this
  /// field.For more information about idempotency, see Making retries safe with
  /// idempotent APIs.
  ///
  /// Parameter [configuration] :
  /// The configuration of the <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_amazon-q-connect_SendMessage.html">SendMessage</a>
  /// request.
  ///
  /// Parameter [conversationContext] :
  /// The conversation context before the Amazon Q in Connect session.
  ///
  /// Parameter [metadata] :
  /// Additional metadata for the message.
  ///
  /// Parameter [orchestratorUseCase] :
  /// The orchestrator use case for message processing.
  ///
  /// Parameter [originRequestId] :
  /// Request identifier from the origin system, used for end-to-end tracing
  /// across spans.
  Future<SendMessageResponse> sendMessage({
    required String assistantId,
    required MessageInput message,
    required String sessionId,
    required MessageType type,
    String? aiAgentId,
    String? clientToken,
    MessageConfiguration? configuration,
    ConversationContext? conversationContext,
    Map<String, String>? metadata,
    String? orchestratorUseCase,
    String? originRequestId,
  }) async {
    final $payload = <String, dynamic>{
      'message': message,
      'type': type.value,
      if (aiAgentId != null) 'aiAgentId': aiAgentId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (configuration != null) 'configuration': configuration,
      if (conversationContext != null)
        'conversationContext': conversationContext,
      if (metadata != null) 'metadata': metadata,
      if (orchestratorUseCase != null)
        'orchestratorUseCase': orchestratorUseCase,
      if (originRequestId != null) 'originRequestId': originRequestId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/sessions/${Uri.encodeComponent(sessionId)}/message',
      exceptionFnMap: _exceptionFns,
    );
    return SendMessageResponse.fromJson(response);
  }

  /// Updates the data stored on an Amazon Q in Connect Session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID
  /// or the ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [data] :
  /// The data stored on the Amazon Q in Connect Session.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  ///
  /// Parameter [namespace] :
  /// The namespace into which the session data is stored. Supported namespaces
  /// are: Custom
  Future<UpdateSessionDataResponse> updateSessionData({
    required String assistantId,
    required List<RuntimeSessionData> data,
    required String sessionId,
    SessionDataNamespace? namespace,
  }) async {
    final $payload = <String, dynamic>{
      'data': data,
      if (namespace != null) 'namespace': namespace.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/assistants/${Uri.encodeComponent(assistantId)}/sessions/${Uri.encodeComponent(sessionId)}/data',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSessionDataResponse.fromJson(response);
  }

  /// Creates a knowledge base.
  /// <note>
  /// When using this API, you cannot reuse <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/Welcome.html">Amazon
  /// AppIntegrations</a> DataIntegrations with external knowledge bases such as
  /// Salesforce and ServiceNow. If you do, you'll get an
  /// <code>InvalidRequestException</code> error.
  ///
  /// For example, you're programmatically managing your external knowledge
  /// base, and you want to add or remove one of the fields that is being
  /// ingested from Salesforce. Do the following:
  /// <ol>
  /// <li>
  /// Call <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_DeleteKnowledgeBase.html">DeleteKnowledgeBase</a>.
  /// </li>
  /// <li>
  /// Call <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_DeleteDataIntegration.html">DeleteDataIntegration</a>.
  /// </li>
  /// <li>
  /// Call <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html">CreateDataIntegration</a>
  /// to recreate the DataIntegration or a create different one.
  /// </li>
  /// <li>
  /// Call CreateKnowledgeBase.
  /// </li> </ol> </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseType] :
  /// The type of knowledge base. Only CUSTOM knowledge bases allow you to
  /// upload your own content. EXTERNAL knowledge bases support integrations
  /// with third-party systems whose content is synchronized automatically.
  ///
  /// Parameter [name] :
  /// The name of the knowledge base.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [renderingConfiguration] :
  /// Information about how to render the content.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// This KMS key must have a policy that allows <code>kms:CreateGrant</code>,
  /// <code>kms:DescribeKey</code>, <code>kms:Decrypt</code>, and
  /// <code>kms:GenerateDataKey*</code> permissions to the IAM identity using
  /// the key to invoke Amazon Q in Connect.
  ///
  /// For more information about setting up a customer managed key for Amazon Q
  /// in Connect, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-q.html">Enable
  /// Amazon Q in Connect for your instance</a>.
  ///
  /// Parameter [sourceConfiguration] :
  /// The source of the knowledge base content. Only set this argument for
  /// EXTERNAL or Managed knowledge bases.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  ///
  /// Parameter [vectorIngestionConfiguration] :
  /// Contains details about how to ingest the documents in a data source.
  Future<CreateKnowledgeBaseResponse> createKnowledgeBase({
    required KnowledgeBaseType knowledgeBaseType,
    required String name,
    String? clientToken,
    String? description,
    RenderingConfiguration? renderingConfiguration,
    ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration,
    SourceConfiguration? sourceConfiguration,
    Map<String, String>? tags,
    VectorIngestionConfiguration? vectorIngestionConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'knowledgeBaseType': knowledgeBaseType.value,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (renderingConfiguration != null)
        'renderingConfiguration': renderingConfiguration,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (sourceConfiguration != null)
        'sourceConfiguration': sourceConfiguration,
      if (tags != null) 'tags': tags,
      if (vectorIngestionConfiguration != null)
        'vectorIngestionConfiguration': vectorIngestionConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/knowledgeBases',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKnowledgeBaseResponse.fromJson(response);
  }

  /// Retrieves information about the knowledge base.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  Future<GetKnowledgeBaseResponse> getKnowledgeBase({
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKnowledgeBaseResponse.fromJson(response);
  }

  /// Deletes the knowledge base.
  /// <note>
  /// When you use this API to delete an external knowledge base such as
  /// Salesforce or ServiceNow, you must also delete the <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/Welcome.html">Amazon
  /// AppIntegrations</a> DataIntegration. This is because you can't reuse the
  /// DataIntegration after it's been associated with an external knowledge
  /// base. However, you can delete and recreate it. See <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_DeleteDataIntegration.html">DeleteDataIntegration</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html">CreateDataIntegration</a>
  /// in the <i>Amazon AppIntegrations API Reference</i>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The knowledge base to delete content from. Can be either the ID or the
  /// ARN. URLs cannot contain the ARN.
  Future<void> deleteKnowledgeBase({
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the knowledge bases.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListKnowledgeBasesResponse> listKnowledgeBases({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/knowledgeBases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKnowledgeBasesResponse.fromJson(response);
  }

  /// Deletes the quick response import job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [importJobId] :
  /// The identifier of the import job to be deleted.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base.
  Future<void> deleteImportJob({
    required String importJobId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/importJobs/${Uri.encodeComponent(importJobId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the started import job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [importJobId] :
  /// The identifier of the import job to retrieve.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base that the import job belongs to.
  Future<GetImportJobResponse> getImportJob({
    required String importJobId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/importJobs/${Uri.encodeComponent(importJobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetImportJobResponse.fromJson(response);
  }

  /// Lists information about import jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListImportJobsResponse> listImportJobs({
    required String knowledgeBaseId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/importJobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListImportJobsResponse.fromJson(response);
  }

  /// Removes a URI template from a knowledge base.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  Future<void> removeKnowledgeBaseTemplateUri({
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/templateUri',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Searches for content in a specified knowledge base. Can be used to get a
  /// specific content resource by its name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base. Can be either the ID or the ARN. URLs cannot contain
  /// the ARN.
  ///
  /// Parameter [searchExpression] :
  /// The search expression to filter results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<SearchContentResponse> searchContent({
    required String knowledgeBaseId,
    required SearchExpression searchExpression,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'searchExpression': searchExpression,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/search',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchContentResponse.fromJson(response);
  }

  /// Searches for Amazon Q in Connect message templates in the specified
  /// knowledge base.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [searchExpression] :
  /// The search expression for querying the message template.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<SearchMessageTemplatesResponse> searchMessageTemplates({
    required String knowledgeBaseId,
    required MessageTemplateSearchExpression searchExpression,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'searchExpression': searchExpression,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/search/messageTemplates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchMessageTemplatesResponse.fromJson(response);
  }

  /// Searches existing Amazon Q in Connect quick responses in an Amazon Q in
  /// Connect knowledge base.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should be a QUICK_RESPONSES
  /// type knowledge base. Can be either the ID or the ARN. URLs cannot contain
  /// the ARN.
  ///
  /// Parameter [searchExpression] :
  /// The search expression for querying the quick response.
  ///
  /// Parameter [attributes] :
  /// The <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/connect-attrib-list.html#user-defined-attributes">user-defined
  /// Amazon Connect contact attributes</a> to be resolved when search results
  /// are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<SearchQuickResponsesResponse> searchQuickResponses({
    required String knowledgeBaseId,
    required QuickResponseSearchExpression searchExpression,
    Map<String, String>? attributes,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'searchExpression': searchExpression,
      if (attributes != null) 'attributes': attributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/search/quickResponses',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchQuickResponsesResponse.fromJson(response);
  }

  /// Get a URL to upload content to a knowledge base. To upload content, first
  /// make a PUT request to the returned URL with your file, making sure to
  /// include the required headers. Then use <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_CreateContent.html">CreateContent</a>
  /// to finalize the content creation process or <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_UpdateContent.html">UpdateContent</a>
  /// to modify an existing resource. You can only upload content to a knowledge
  /// base of type CUSTOM.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contentType] :
  /// The type of content to upload.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [presignedUrlTimeToLive] :
  /// The expected expiration time of the generated presigned URL, specified in
  /// minutes.
  Future<StartContentUploadResponse> startContentUpload({
    required String contentType,
    required String knowledgeBaseId,
    int? presignedUrlTimeToLive,
  }) async {
    _s.validateNumRange(
      'presignedUrlTimeToLive',
      presignedUrlTimeToLive,
      1,
      60,
    );
    final $payload = <String, dynamic>{
      'contentType': contentType,
      if (presignedUrlTimeToLive != null)
        'presignedUrlTimeToLive': presignedUrlTimeToLive,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/upload',
      exceptionFnMap: _exceptionFns,
    );
    return StartContentUploadResponse.fromJson(response);
  }

  /// Start an asynchronous job to import Amazon Q in Connect resources from an
  /// uploaded source file. Before calling this API, use <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>
  /// to upload an asset that contains the resource data.
  ///
  /// <ul>
  /// <li>
  /// For importing Amazon Q in Connect quick responses, you need to upload a
  /// csv file including the quick responses. For information about how to
  /// format the csv file for importing quick responses, see <a
  /// href="https://docs.aws.amazon.com/console/connect/quick-responses/add-data">Import
  /// quick responses</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [importJobType] :
  /// The type of the import job.
  ///
  /// <ul>
  /// <li>
  /// For importing quick response resource, set the value to
  /// <code>QUICK_RESPONSES</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// <ul>
  /// <li>
  /// For importing Amazon Q in Connect quick responses, this should be a
  /// <code>QUICK_RESPONSES</code> type knowledge base.
  /// </li>
  /// </ul>
  ///
  /// Parameter [uploadId] :
  /// A pointer to the uploaded asset. This value is returned by <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>.
  ///
  /// Parameter [clientToken] :
  /// The tags used to organize, track, or control access for this resource.
  ///
  /// Parameter [externalSourceConfiguration] :
  /// The configuration information of the external source that the resource
  /// data are imported from.
  ///
  /// Parameter [metadata] :
  /// The metadata fields of the imported Amazon Q in Connect resources.
  Future<StartImportJobResponse> startImportJob({
    required ImportJobType importJobType,
    required String knowledgeBaseId,
    required String uploadId,
    String? clientToken,
    ExternalSourceConfiguration? externalSourceConfiguration,
    Map<String, String>? metadata,
  }) async {
    final $payload = <String, dynamic>{
      'importJobType': importJobType.value,
      'uploadId': uploadId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (externalSourceConfiguration != null)
        'externalSourceConfiguration': externalSourceConfiguration,
      if (metadata != null) 'metadata': metadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/importJobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartImportJobResponse.fromJson(response);
  }

  /// Updates the template URI of a knowledge base. This is only supported for
  /// knowledge bases of type EXTERNAL. Include a single variable in
  /// <code>${variable}</code> format; this interpolated by Amazon Q in Connect
  /// using ingested content. For example, if you ingest a Salesforce article,
  /// it has an <code>Id</code> value, and you can set the template URI to
  /// <code>https://myInstanceName.lightning.force.com/lightning/r/Knowledge__kav/*${Id}*/view</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base. Can be either the ID or the ARN. URLs cannot contain
  /// the ARN.
  ///
  /// Parameter [templateUri] :
  /// The template URI to update.
  Future<UpdateKnowledgeBaseTemplateUriResponse>
      updateKnowledgeBaseTemplateUri({
    required String knowledgeBaseId,
    required String templateUri,
  }) async {
    final $payload = <String, dynamic>{
      'templateUri': templateUri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/templateUri',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKnowledgeBaseTemplateUriResponse.fromJson(response);
  }

  /// Creates Amazon Q in Connect content. Before to calling this API, use <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>
  /// to upload an asset.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base. Can be either the ID or the ARN. URLs cannot contain
  /// the ARN.
  ///
  /// Parameter [name] :
  /// The name of the content. Each piece of content in a knowledge base must
  /// have a unique name. You can retrieve a piece of content using only its
  /// knowledge base and its name with the <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_SearchContent.html">SearchContent</a>
  /// API.
  ///
  /// Parameter [uploadId] :
  /// A pointer to the uploaded asset. This value is returned by <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [metadata] :
  /// A key/value map to store attributes without affecting tagging or
  /// recommendations. For example, when synchronizing data between an external
  /// system and Amazon Q in Connect, you can store an external version
  /// identifier as metadata to utilize for determining drift.
  ///
  /// Parameter [overrideLinkOutUri] :
  /// The URI you want to use for the article. If the knowledge base has a
  /// templateUri, setting this argument overrides it for this piece of content.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  ///
  /// Parameter [title] :
  /// The title of the content. If not set, the title is equal to the name.
  Future<CreateContentResponse> createContent({
    required String knowledgeBaseId,
    required String name,
    required String uploadId,
    String? clientToken,
    Map<String, String>? metadata,
    String? overrideLinkOutUri,
    Map<String, String>? tags,
    String? title,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'uploadId': uploadId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (metadata != null) 'metadata': metadata,
      if (overrideLinkOutUri != null) 'overrideLinkOutUri': overrideLinkOutUri,
      if (tags != null) 'tags': tags,
      if (title != null) 'title': title,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/contents',
      exceptionFnMap: _exceptionFns,
    );
    return CreateContentResponse.fromJson(response);
  }

  /// Retrieves content, including a pre-signed URL to download the content.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contentId] :
  /// The identifier of the content. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base. Can be either the ID or the ARN. URLs cannot contain
  /// the ARN.
  Future<GetContentResponse> getContent({
    required String contentId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/contents/${Uri.encodeComponent(contentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetContentResponse.fromJson(response);
  }

  /// Updates information about the content.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contentId] :
  /// The identifier of the content. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base. Can be either the ID or the ARN
  ///
  /// Parameter [metadata] :
  /// A key/value map to store attributes without affecting tagging or
  /// recommendations. For example, when synchronizing data between an external
  /// system and Amazon Q in Connect, you can store an external version
  /// identifier as metadata to utilize for determining drift.
  ///
  /// Parameter [overrideLinkOutUri] :
  /// The URI for the article. If the knowledge base has a templateUri, setting
  /// this argument overrides it for this piece of content. To remove an
  /// existing <code>overrideLinkOurUri</code>, exclude this argument and set
  /// <code>removeOverrideLinkOutUri</code> to true.
  ///
  /// Parameter [removeOverrideLinkOutUri] :
  /// Unset the existing <code>overrideLinkOutUri</code> if it exists.
  ///
  /// Parameter [revisionId] :
  /// The <code>revisionId</code> of the content resource to update, taken from
  /// an earlier call to <code>GetContent</code>,
  /// <code>GetContentSummary</code>, <code>SearchContent</code>, or
  /// <code>ListContents</code>. If included, this argument acts as an
  /// optimistic lock to ensure content was not modified since it was last read.
  /// If it has been modified, this API throws a
  /// <code>PreconditionFailedException</code>.
  ///
  /// Parameter [title] :
  /// The title of the content.
  ///
  /// Parameter [uploadId] :
  /// A pointer to the uploaded asset. This value is returned by <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>.
  Future<UpdateContentResponse> updateContent({
    required String contentId,
    required String knowledgeBaseId,
    Map<String, String>? metadata,
    String? overrideLinkOutUri,
    bool? removeOverrideLinkOutUri,
    String? revisionId,
    String? title,
    String? uploadId,
  }) async {
    final $payload = <String, dynamic>{
      if (metadata != null) 'metadata': metadata,
      if (overrideLinkOutUri != null) 'overrideLinkOutUri': overrideLinkOutUri,
      if (removeOverrideLinkOutUri != null)
        'removeOverrideLinkOutUri': removeOverrideLinkOutUri,
      if (revisionId != null) 'revisionId': revisionId,
      if (title != null) 'title': title,
      if (uploadId != null) 'uploadId': uploadId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/contents/${Uri.encodeComponent(contentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateContentResponse.fromJson(response);
  }

  /// Deletes the content.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contentId] :
  /// The identifier of the content. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  Future<void> deleteContent({
    required String contentId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/contents/${Uri.encodeComponent(contentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the content.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base. Can be either the ID or the ARN. URLs cannot contain
  /// the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListContentsResponse> listContents({
    required String knowledgeBaseId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/contents',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListContentsResponse.fromJson(response);
  }

  /// Retrieves summary information about the content.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contentId] :
  /// The identifier of the content. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  Future<GetContentSummaryResponse> getContentSummary({
    required String contentId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/contents/${Uri.encodeComponent(contentId)}/summary',
      exceptionFnMap: _exceptionFns,
    );
    return GetContentSummaryResponse.fromJson(response);
  }

  /// Creates an association between a content resource in a knowledge base and
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/step-by-step-guided-experiences.html">step-by-step
  /// guides</a>. Step-by-step guides offer instructions to agents for resolving
  /// common customer issues. You create a content association to integrate
  /// Amazon Q in Connect and step-by-step guides.
  ///
  /// After you integrate Amazon Q and step-by-step guides, when Amazon Q
  /// provides a recommendation to an agent based on the intent that it's
  /// detected, it also provides them with the option to start the step-by-step
  /// guide that you have associated with the content.
  ///
  /// Note the following limitations:
  ///
  /// <ul>
  /// <li>
  /// You can create only one content association for each content resource in a
  /// knowledge base.
  /// </li>
  /// <li>
  /// You can associate a step-by-step guide with multiple content resources.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/integrate-q-with-guides.html">Integrate
  /// Amazon Q in Connect with step-by-step guides</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [association] :
  /// The identifier of the associated resource.
  ///
  /// Parameter [associationType] :
  /// The type of association.
  ///
  /// Parameter [contentId] :
  /// The identifier of the content.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateContentAssociationResponse> createContentAssociation({
    required ContentAssociationContents association,
    required ContentAssociationType associationType,
    required String contentId,
    required String knowledgeBaseId,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'association': association,
      'associationType': associationType.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/contents/${Uri.encodeComponent(contentId)}/associations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateContentAssociationResponse.fromJson(response);
  }

  /// Returns the content association.
  ///
  /// For more information about content associations--what they are and when
  /// they are used--see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/integrate-q-with-guides.html">Integrate
  /// Amazon Q in Connect with step-by-step guides</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contentAssociationId] :
  /// The identifier of the content association. Can be either the ID or the
  /// ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [contentId] :
  /// The identifier of the content.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base.
  Future<GetContentAssociationResponse> getContentAssociation({
    required String contentAssociationId,
    required String contentId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/contents/${Uri.encodeComponent(contentId)}/associations/${Uri.encodeComponent(contentAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetContentAssociationResponse.fromJson(response);
  }

  /// Deletes the content association.
  ///
  /// For more information about content associations--what they are and when
  /// they are used--see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/integrate-q-with-guides.html">Integrate
  /// Amazon Q in Connect with step-by-step guides</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contentAssociationId] :
  /// The identifier of the content association. Can be either the ID or the
  /// ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [contentId] :
  /// The identifier of the content.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base.
  Future<void> deleteContentAssociation({
    required String contentAssociationId,
    required String contentId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/contents/${Uri.encodeComponent(contentId)}/associations/${Uri.encodeComponent(contentAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the content associations.
  ///
  /// For more information about content associations--what they are and when
  /// they are used--see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/integrate-q-with-guides.html">Integrate
  /// Amazon Q in Connect with step-by-step guides</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contentId] :
  /// The identifier of the content.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListContentAssociationsResponse> listContentAssociations({
    required String contentId,
    required String knowledgeBaseId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/contents/${Uri.encodeComponent(contentId)}/associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListContentAssociationsResponse.fromJson(response);
  }

  /// Creates an Amazon Q in Connect message template. The name of the message
  /// template has to be unique for each knowledge base. The channel subtype of
  /// the message template is immutable and cannot be modified after creation.
  /// After the message template is created, you can use the
  /// <code>$LATEST</code> qualifier to reference the created message template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelSubtype] :
  /// The channel subtype this message template applies to.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [content] :
  /// The content of the message template.
  ///
  /// Parameter [defaultAttributes] :
  /// An object that specifies the default values to use for variables in the
  /// message template. This object contains different categories of key-value
  /// pairs. Each key defines a variable or placeholder in the message template.
  /// The corresponding value defines the default value for that variable.
  ///
  /// Parameter [description] :
  /// The description of the message template.
  ///
  /// Parameter [language] :
  /// The language code value for the language in which the quick response is
  /// written. The supported language codes include <code>de_DE</code>,
  /// <code>en_US</code>, <code>es_ES</code>, <code>fr_FR</code>,
  /// <code>id_ID</code>, <code>it_IT</code>, <code>ja_JP</code>,
  /// <code>ko_KR</code>, <code>pt_BR</code>, <code>zh_CN</code>,
  /// <code>zh_TW</code>
  ///
  /// Parameter [name] :
  /// The name of the message template.
  ///
  /// Parameter [sourceConfiguration] :
  /// The source configuration of the message template. Only set this argument
  /// for WHATSAPP channel subtype.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateMessageTemplateResponse> createMessageTemplate({
    required ChannelSubtype channelSubtype,
    required String knowledgeBaseId,
    String? clientToken,
    MessageTemplateContentProvider? content,
    MessageTemplateAttributes? defaultAttributes,
    String? description,
    GroupingConfiguration? groupingConfiguration,
    String? language,
    String? name,
    MessageTemplateSourceConfiguration? sourceConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'channelSubtype': channelSubtype.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (content != null) 'content': content,
      if (defaultAttributes != null) 'defaultAttributes': defaultAttributes,
      if (description != null) 'description': description,
      if (groupingConfiguration != null)
        'groupingConfiguration': groupingConfiguration,
      if (language != null) 'language': language,
      if (name != null) 'name': name,
      if (sourceConfiguration != null)
        'sourceConfiguration': sourceConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMessageTemplateResponse.fromJson(response);
  }

  /// Retrieves the Amazon Q in Connect message template. The message template
  /// identifier can contain an optional qualifier, for example,
  /// <code>&lt;message-template-id&gt;:&lt;qualifier&gt;</code>, which is
  /// either an actual version number or an Amazon Q Connect managed qualifier
  /// <code>$ACTIVE_VERSION</code> | <code>$LATEST</code>. If it is not
  /// supplied, then <code>$LATEST</code> is assumed implicitly.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  Future<GetMessageTemplateResponse> getMessageTemplate({
    required String knowledgeBaseId,
    required String messageTemplateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMessageTemplateResponse.fromJson(response);
  }

  /// Updates the Amazon Q in Connect message template. Partial update is
  /// supported. If any field is not supplied, it will remain unchanged for the
  /// message template that is referenced by the <code>$LATEST</code> qualifier.
  /// Any modification will only apply to the message template that is
  /// referenced by the <code>$LATEST</code> qualifier. The fields for all
  /// available versions will remain unchanged.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  /// It cannot contain any qualifier.
  ///
  /// Parameter [content] :
  /// The content of the message template.
  ///
  /// Parameter [defaultAttributes] :
  /// An object that specifies the default values to use for variables in the
  /// message template. This object contains different categories of key-value
  /// pairs. Each key defines a variable or placeholder in the message template.
  /// The corresponding value defines the default value for that variable.
  ///
  /// Parameter [language] :
  /// The language code value for the language in which the quick response is
  /// written. The supported language codes include <code>de_DE</code>,
  /// <code>en_US</code>, <code>es_ES</code>, <code>fr_FR</code>,
  /// <code>id_ID</code>, <code>it_IT</code>, <code>ja_JP</code>,
  /// <code>ko_KR</code>, <code>pt_BR</code>, <code>zh_CN</code>,
  /// <code>zh_TW</code>
  ///
  /// Parameter [sourceConfiguration] :
  /// The source configuration of the message template. Only set this argument
  /// for WHATSAPP channel subtype.
  Future<UpdateMessageTemplateResponse> updateMessageTemplate({
    required String knowledgeBaseId,
    required String messageTemplateId,
    MessageTemplateContentProvider? content,
    MessageTemplateAttributes? defaultAttributes,
    String? language,
    MessageTemplateSourceConfiguration? sourceConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (content != null) 'content': content,
      if (defaultAttributes != null) 'defaultAttributes': defaultAttributes,
      if (language != null) 'language': language,
      if (sourceConfiguration != null)
        'sourceConfiguration': sourceConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMessageTemplateResponse.fromJson(response);
  }

  /// Deletes an Amazon Q in Connect message template entirely or a specific
  /// version of the message template if version is supplied in the request. You
  /// can provide the message template identifier as
  /// <code>&lt;message-template-id&gt;:&lt;versionNumber&gt;</code> to delete a
  /// specific version of the message template. If it is not supplied, the
  /// message template and all available versions will be deleted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  Future<void> deleteMessageTemplate({
    required String knowledgeBaseId,
    required String messageTemplateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all the available Amazon Q in Connect message templates for the
  /// specified knowledge base.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListMessageTemplatesResponse> listMessageTemplates({
    required String knowledgeBaseId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMessageTemplatesResponse.fromJson(response);
  }

  /// Activates a specific version of the Amazon Q in Connect message template.
  /// After the version is activated, the previous active version will be
  /// deactivated automatically. You can use the <code>$ACTIVE_VERSION</code>
  /// qualifier later to reference the version that is in active status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  /// It cannot contain any qualifier.
  ///
  /// Parameter [versionNumber] :
  /// The version number of the message template version to activate.
  Future<ActivateMessageTemplateResponse> activateMessageTemplate({
    required String knowledgeBaseId,
    required String messageTemplateId,
    required int versionNumber,
  }) async {
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'versionNumber': versionNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}/activate',
      exceptionFnMap: _exceptionFns,
    );
    return ActivateMessageTemplateResponse.fromJson(response);
  }

  /// Uploads an attachment file to the specified Amazon Q in Connect message
  /// template. The name of the message template attachment has to be unique for
  /// each message template referenced by the <code>$LATEST</code> qualifier.
  /// The body of the attachment file should be encoded using base64 encoding.
  /// After the file is uploaded, you can use the pre-signed Amazon S3 URL
  /// returned in response to download the uploaded file.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [body] :
  /// The body of the attachment file being uploaded. It should be encoded using
  /// base64 encoding.
  ///
  /// Parameter [contentDisposition] :
  /// The presentation information for the attachment file.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  /// It cannot contain any qualifier.
  ///
  /// Parameter [name] :
  /// The name of the attachment file being uploaded. The name should include
  /// the file extension.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  Future<CreateMessageTemplateAttachmentResponse>
      createMessageTemplateAttachment({
    required String body,
    required ContentDisposition contentDisposition,
    required String knowledgeBaseId,
    required String messageTemplateId,
    required String name,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'body': body,
      'contentDisposition': contentDisposition.value,
      'name': name,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}/attachments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMessageTemplateAttachmentResponse.fromJson(response);
  }

  /// Creates a new Amazon Q in Connect message template version from the
  /// current content and configuration of a message template. Versions are
  /// immutable and monotonically increasing. Once a version is created, you can
  /// reference a specific version of the message template by passing in
  /// <code>&lt;message-template-id&gt;:&lt;versionNumber&gt;</code> as the
  /// message template identifier. An error is displayed if the supplied
  /// <code>messageTemplateContentSha256</code> is different from the
  /// <code>messageTemplateContentSha256</code> of the message template with
  /// <code>$LATEST</code> qualifier. If multiple
  /// <code>CreateMessageTemplateVersion</code> requests are made while the
  /// message template remains the same, only the first invocation creates a new
  /// version and the succeeding requests will return the same response as the
  /// first invocation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  /// It cannot contain any qualifier.
  ///
  /// Parameter [messageTemplateContentSha256] :
  /// The checksum value of the message template content that is referenced by
  /// the <code>$LATEST</code> qualifier. It can be returned in
  /// <code>MessageTemplateData</code> or
  /// <code>ExtendedMessageTemplateData</code>. It’s calculated by content,
  /// language, <code>defaultAttributes</code> and <code>Attachments</code> of
  /// the message template. If not supplied, the message template version will
  /// be created based on the message template content that is referenced by the
  /// <code>$LATEST</code> qualifier by default.
  Future<CreateMessageTemplateVersionResponse> createMessageTemplateVersion({
    required String knowledgeBaseId,
    required String messageTemplateId,
    String? messageTemplateContentSha256,
  }) async {
    final $payload = <String, dynamic>{
      if (messageTemplateContentSha256 != null)
        'messageTemplateContentSha256': messageTemplateContentSha256,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMessageTemplateVersionResponse.fromJson(response);
  }

  /// Deactivates a specific version of the Amazon Q in Connect message template
  /// . After the version is deactivated, you can no longer use the
  /// <code>$ACTIVE_VERSION</code> qualifier to reference the version in active
  /// status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  /// It cannot contain any qualifier.
  ///
  /// Parameter [versionNumber] :
  /// The version number of the message template version to deactivate.
  Future<DeactivateMessageTemplateResponse> deactivateMessageTemplate({
    required String knowledgeBaseId,
    required String messageTemplateId,
    required int versionNumber,
  }) async {
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'versionNumber': versionNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}/deactivate',
      exceptionFnMap: _exceptionFns,
    );
    return DeactivateMessageTemplateResponse.fromJson(response);
  }

  /// Deletes the attachment file from the Amazon Q in Connect message template
  /// that is referenced by <code>$LATEST</code> qualifier. Attachments on
  /// available message template versions will remain unchanged.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [attachmentId] :
  /// The identifier of the attachment file.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  /// It cannot contain any qualifier.
  Future<void> deleteMessageTemplateAttachment({
    required String attachmentId,
    required String knowledgeBaseId,
    required String messageTemplateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}/attachments/${Uri.encodeComponent(attachmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all the available versions for the specified Amazon Q in Connect
  /// message template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  /// It cannot contain any qualifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListMessageTemplateVersionsResponse> listMessageTemplateVersions({
    required String knowledgeBaseId,
    required String messageTemplateId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMessageTemplateVersionsResponse.fromJson(response);
  }

  /// Renders the Amazon Q in Connect message template based on the attribute
  /// values provided and generates the message content. For any variable
  /// present in the message template, if the attribute value is neither
  /// provided in the attribute request parameter nor the default attribute of
  /// the message template, the rendered message content will keep the variable
  /// placeholder as it is and return the attribute keys that are missing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [attributes] :
  /// An object that specifies the values to use for variables in the message
  /// template. This object contains different categories of key-value pairs.
  /// Each key defines a variable or placeholder in the message template. The
  /// corresponding value defines the value for that variable.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  Future<RenderMessageTemplateResponse> renderMessageTemplate({
    required MessageTemplateAttributes attributes,
    required String knowledgeBaseId,
    required String messageTemplateId,
  }) async {
    final $payload = <String, dynamic>{
      'attributes': attributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}/render',
      exceptionFnMap: _exceptionFns,
    );
    return RenderMessageTemplateResponse.fromJson(response);
  }

  /// Updates the Amazon Q in Connect message template metadata. Note that any
  /// modification to the message template’s name, description and grouping
  /// configuration will applied to the message template pointed by the
  /// <code>$LATEST</code> qualifier and all available versions. Partial update
  /// is supported. If any field is not supplied, it will remain unchanged for
  /// the message template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [messageTemplateId] :
  /// The identifier of the message template. Can be either the ID or the ARN.
  /// It cannot contain any qualifier.
  ///
  /// Parameter [description] :
  /// The description of the message template.
  ///
  /// Parameter [name] :
  /// The name of the message template.
  Future<UpdateMessageTemplateMetadataResponse> updateMessageTemplateMetadata({
    required String knowledgeBaseId,
    required String messageTemplateId,
    String? description,
    GroupingConfiguration? groupingConfiguration,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (groupingConfiguration != null)
        'groupingConfiguration': groupingConfiguration,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/messageTemplates/${Uri.encodeComponent(messageTemplateId)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMessageTemplateMetadataResponse.fromJson(response);
  }

  /// Creates an Amazon Q in Connect quick response.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [content] :
  /// The content of the quick response.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [name] :
  /// The name of the quick response.
  ///
  /// Parameter [channels] :
  /// The Amazon Connect channels this quick response applies to.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="http://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [contentType] :
  /// The media type of the quick response content.
  ///
  /// <ul>
  /// <li>
  /// Use <code>application/x.quickresponse;format=plain</code> for a quick
  /// response written in plain text.
  /// </li>
  /// <li>
  /// Use <code>application/x.quickresponse;format=markdown</code> for a quick
  /// response written in richtext.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The description of the quick response.
  ///
  /// Parameter [groupingConfiguration] :
  /// The configuration information of the user groups that the quick response
  /// is accessible to.
  ///
  /// Parameter [isActive] :
  /// Whether the quick response is active.
  ///
  /// Parameter [language] :
  /// The language code value for the language in which the quick response is
  /// written. The supported language codes include <code>de_DE</code>,
  /// <code>en_US</code>, <code>es_ES</code>, <code>fr_FR</code>,
  /// <code>id_ID</code>, <code>it_IT</code>, <code>ja_JP</code>,
  /// <code>ko_KR</code>, <code>pt_BR</code>, <code>zh_CN</code>,
  /// <code>zh_TW</code>
  ///
  /// Parameter [shortcutKey] :
  /// The shortcut key of the quick response. The value should be unique across
  /// the knowledge base.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateQuickResponseResponse> createQuickResponse({
    required QuickResponseDataProvider content,
    required String knowledgeBaseId,
    required String name,
    List<String>? channels,
    String? clientToken,
    String? contentType,
    String? description,
    GroupingConfiguration? groupingConfiguration,
    bool? isActive,
    String? language,
    String? shortcutKey,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'content': content,
      'name': name,
      if (channels != null) 'channels': channels,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (contentType != null) 'contentType': contentType,
      if (description != null) 'description': description,
      if (groupingConfiguration != null)
        'groupingConfiguration': groupingConfiguration,
      if (isActive != null) 'isActive': isActive,
      if (language != null) 'language': language,
      if (shortcutKey != null) 'shortcutKey': shortcutKey,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/quickResponses',
      exceptionFnMap: _exceptionFns,
    );
    return CreateQuickResponseResponse.fromJson(response);
  }

  /// Retrieves the quick response.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should be a QUICK_RESPONSES
  /// type knowledge base.
  ///
  /// Parameter [quickResponseId] :
  /// The identifier of the quick response.
  Future<GetQuickResponseResponse> getQuickResponse({
    required String knowledgeBaseId,
    required String quickResponseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/quickResponses/${Uri.encodeComponent(quickResponseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetQuickResponseResponse.fromJson(response);
  }

  /// Updates an existing Amazon Q in Connect quick response.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [quickResponseId] :
  /// The identifier of the quick response.
  ///
  /// Parameter [channels] :
  /// The Amazon Connect contact channels this quick response applies to. The
  /// supported contact channel types include <code>Chat</code>.
  ///
  /// Parameter [content] :
  /// The updated content of the quick response.
  ///
  /// Parameter [contentType] :
  /// The media type of the quick response content.
  ///
  /// <ul>
  /// <li>
  /// Use <code>application/x.quickresponse;format=plain</code> for quick
  /// response written in plain text.
  /// </li>
  /// <li>
  /// Use <code>application/x.quickresponse;format=markdown</code> for quick
  /// response written in richtext.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The updated description of the quick response.
  ///
  /// Parameter [groupingConfiguration] :
  /// The updated grouping configuration of the quick response.
  ///
  /// Parameter [isActive] :
  /// Whether the quick response is active.
  ///
  /// Parameter [language] :
  /// The language code value for the language in which the quick response is
  /// written. The supported language codes include <code>de_DE</code>,
  /// <code>en_US</code>, <code>es_ES</code>, <code>fr_FR</code>,
  /// <code>id_ID</code>, <code>it_IT</code>, <code>ja_JP</code>,
  /// <code>ko_KR</code>, <code>pt_BR</code>, <code>zh_CN</code>,
  /// <code>zh_TW</code>
  ///
  /// Parameter [name] :
  /// The name of the quick response.
  ///
  /// Parameter [removeDescription] :
  /// Whether to remove the description from the quick response.
  ///
  /// Parameter [removeGroupingConfiguration] :
  /// Whether to remove the grouping configuration of the quick response.
  ///
  /// Parameter [removeShortcutKey] :
  /// Whether to remove the shortcut key of the quick response.
  ///
  /// Parameter [shortcutKey] :
  /// The shortcut key of the quick response. The value should be unique across
  /// the knowledge base.
  Future<UpdateQuickResponseResponse> updateQuickResponse({
    required String knowledgeBaseId,
    required String quickResponseId,
    List<String>? channels,
    QuickResponseDataProvider? content,
    String? contentType,
    String? description,
    GroupingConfiguration? groupingConfiguration,
    bool? isActive,
    String? language,
    String? name,
    bool? removeDescription,
    bool? removeGroupingConfiguration,
    bool? removeShortcutKey,
    String? shortcutKey,
  }) async {
    final $payload = <String, dynamic>{
      if (channels != null) 'channels': channels,
      if (content != null) 'content': content,
      if (contentType != null) 'contentType': contentType,
      if (description != null) 'description': description,
      if (groupingConfiguration != null)
        'groupingConfiguration': groupingConfiguration,
      if (isActive != null) 'isActive': isActive,
      if (language != null) 'language': language,
      if (name != null) 'name': name,
      if (removeDescription != null) 'removeDescription': removeDescription,
      if (removeGroupingConfiguration != null)
        'removeGroupingConfiguration': removeGroupingConfiguration,
      if (removeShortcutKey != null) 'removeShortcutKey': removeShortcutKey,
      if (shortcutKey != null) 'shortcutKey': shortcutKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/quickResponses/${Uri.encodeComponent(quickResponseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateQuickResponseResponse.fromJson(response);
  }

  /// Deletes a quick response.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The knowledge base from which the quick response is deleted. The
  /// identifier of the knowledge base.
  ///
  /// Parameter [quickResponseId] :
  /// The identifier of the quick response to delete.
  Future<void> deleteQuickResponse({
    required String knowledgeBaseId,
    required String quickResponseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/quickResponses/${Uri.encodeComponent(quickResponseId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists information about quick response.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListQuickResponsesResponse> listQuickResponses({
    required String knowledgeBaseId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgeBases/${Uri.encodeComponent(knowledgeBaseId)}/quickResponses',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQuickResponsesResponse.fromJson(response);
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateAssistantResponse {
  /// Information about the assistant.
  final AssistantData? assistant;

  CreateAssistantResponse({
    this.assistant,
  });

  factory CreateAssistantResponse.fromJson(Map<String, dynamic> json) {
    return CreateAssistantResponse(
      assistant: json['assistant'] != null
          ? AssistantData.fromJson(json['assistant'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assistant = this.assistant;
    return {
      if (assistant != null) 'assistant': assistant,
    };
  }
}

/// @nodoc
class GetAssistantResponse {
  /// Information about the assistant.
  final AssistantData? assistant;

  GetAssistantResponse({
    this.assistant,
  });

  factory GetAssistantResponse.fromJson(Map<String, dynamic> json) {
    return GetAssistantResponse(
      assistant: json['assistant'] != null
          ? AssistantData.fromJson(json['assistant'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assistant = this.assistant;
    return {
      if (assistant != null) 'assistant': assistant,
    };
  }
}

/// @nodoc
class DeleteAssistantResponse {
  DeleteAssistantResponse();

  factory DeleteAssistantResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAssistantResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAssistantsResponse {
  /// Information about the assistants.
  final List<AssistantSummary> assistantSummaries;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListAssistantsResponse({
    required this.assistantSummaries,
    this.nextToken,
  });

  factory ListAssistantsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssistantsResponse(
      assistantSummaries: ((json['assistantSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => AssistantSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assistantSummaries = this.assistantSummaries;
    final nextToken = this.nextToken;
    return {
      'assistantSummaries': assistantSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetRecommendationsResponse {
  /// The recommendations.
  final List<RecommendationData> recommendations;

  /// The triggers corresponding to recommendations.
  final List<RecommendationTrigger>? triggers;

  GetRecommendationsResponse({
    required this.recommendations,
    this.triggers,
  });

  factory GetRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommendationsResponse(
      recommendations: ((json['recommendations'] as List?) ?? const [])
          .nonNulls
          .map((e) => RecommendationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      triggers: (json['triggers'] as List?)
          ?.nonNulls
          .map((e) => RecommendationTrigger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final recommendations = this.recommendations;
    final triggers = this.triggers;
    return {
      'recommendations': recommendations,
      if (triggers != null) 'triggers': triggers,
    };
  }
}

/// @nodoc
class ListModelsResponse {
  /// The summaries of the models available to the assistant.
  final List<ModelSummary> modelSummaries;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListModelsResponse({
    required this.modelSummaries,
    this.nextToken,
  });

  factory ListModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListModelsResponse(
      modelSummaries: ((json['modelSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelSummaries = this.modelSummaries;
    final nextToken = this.nextToken;
    return {
      'modelSummaries': modelSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class NotifyRecommendationsReceivedResponse {
  /// The identifiers of recommendations that are causing errors.
  final List<NotifyRecommendationsReceivedError>? errors;

  /// The identifiers of the recommendations.
  final List<String>? recommendationIds;

  NotifyRecommendationsReceivedResponse({
    this.errors,
    this.recommendationIds,
  });

  factory NotifyRecommendationsReceivedResponse.fromJson(
      Map<String, dynamic> json) {
    return NotifyRecommendationsReceivedResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => NotifyRecommendationsReceivedError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      recommendationIds: (json['recommendationIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final recommendationIds = this.recommendationIds;
    return {
      if (errors != null) 'errors': errors,
      if (recommendationIds != null) 'recommendationIds': recommendationIds,
    };
  }
}

/// @nodoc
class PutFeedbackResponse {
  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The identifier of the Amazon Q in Connect assistant.
  final String assistantId;

  /// Information about the feedback provided.
  final ContentFeedbackData contentFeedback;

  /// The identifier of the feedback target.
  final String targetId;

  /// The type of the feedback target.
  final TargetType targetType;

  PutFeedbackResponse({
    required this.assistantArn,
    required this.assistantId,
    required this.contentFeedback,
    required this.targetId,
    required this.targetType,
  });

  factory PutFeedbackResponse.fromJson(Map<String, dynamic> json) {
    return PutFeedbackResponse(
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      contentFeedback: ContentFeedbackData.fromJson(
          (json['contentFeedback'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      targetId: (json['targetId'] as String?) ?? '',
      targetType: TargetType.fromString((json['targetType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final assistantArn = this.assistantArn;
    final assistantId = this.assistantId;
    final contentFeedback = this.contentFeedback;
    final targetId = this.targetId;
    final targetType = this.targetType;
    return {
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'contentFeedback': contentFeedback,
      'targetId': targetId,
      'targetType': targetType.value,
    };
  }
}

/// @nodoc
class QueryAssistantResponse {
  /// The results of the query.
  final List<ResultData> results;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  QueryAssistantResponse({
    required this.results,
    this.nextToken,
  });

  factory QueryAssistantResponse.fromJson(Map<String, dynamic> json) {
    return QueryAssistantResponse(
      results: ((json['results'] as List?) ?? const [])
          .nonNulls
          .map((e) => ResultData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final nextToken = this.nextToken;
    return {
      'results': results,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class RemoveAssistantAIAgentResponse {
  RemoveAssistantAIAgentResponse();

  factory RemoveAssistantAIAgentResponse.fromJson(Map<String, dynamic> _) {
    return RemoveAssistantAIAgentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class RetrieveResponse {
  /// The results of the content retrieval operation.
  final List<RetrieveResult> results;

  RetrieveResponse({
    required this.results,
  });

  factory RetrieveResponse.fromJson(Map<String, dynamic> json) {
    return RetrieveResponse(
      results: ((json['results'] as List?) ?? const [])
          .nonNulls
          .map((e) => RetrieveResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    return {
      'results': results,
    };
  }
}

/// @nodoc
class SearchSessionsResponse {
  /// Summary information about the sessions.
  final List<SessionSummary> sessionSummaries;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  SearchSessionsResponse({
    required this.sessionSummaries,
    this.nextToken,
  });

  factory SearchSessionsResponse.fromJson(Map<String, dynamic> json) {
    return SearchSessionsResponse(
      sessionSummaries: ((json['sessionSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => SessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionSummaries = this.sessionSummaries;
    final nextToken = this.nextToken;
    return {
      'sessionSummaries': sessionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class UpdateAssistantAIAgentResponse {
  final AssistantData? assistant;

  UpdateAssistantAIAgentResponse({
    this.assistant,
  });

  factory UpdateAssistantAIAgentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAssistantAIAgentResponse(
      assistant: json['assistant'] != null
          ? AssistantData.fromJson(json['assistant'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assistant = this.assistant;
    return {
      if (assistant != null) 'assistant': assistant,
    };
  }
}

/// @nodoc
class CreateAIAgentResponse {
  /// The data of the created AI Agent.
  final AIAgentData? aiAgent;

  CreateAIAgentResponse({
    this.aiAgent,
  });

  factory CreateAIAgentResponse.fromJson(Map<String, dynamic> json) {
    return CreateAIAgentResponse(
      aiAgent: json['aiAgent'] != null
          ? AIAgentData.fromJson(json['aiAgent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgent = this.aiAgent;
    return {
      if (aiAgent != null) 'aiAgent': aiAgent,
    };
  }
}

/// @nodoc
class GetAIAgentResponse {
  /// The data of the AI Agent.
  final AIAgentData? aiAgent;

  /// The version number of the AI Agent version (returned if an AI Agent version
  /// was specified via use of a qualifier for the <code>aiAgentId</code> on the
  /// request).
  final int? versionNumber;

  GetAIAgentResponse({
    this.aiAgent,
    this.versionNumber,
  });

  factory GetAIAgentResponse.fromJson(Map<String, dynamic> json) {
    return GetAIAgentResponse(
      aiAgent: json['aiAgent'] != null
          ? AIAgentData.fromJson(json['aiAgent'] as Map<String, dynamic>)
          : null,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgent = this.aiAgent;
    final versionNumber = this.versionNumber;
    return {
      if (aiAgent != null) 'aiAgent': aiAgent,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// @nodoc
class UpdateAIAgentResponse {
  /// The data of the updated Amazon Q in Connect AI Agent.
  final AIAgentData? aiAgent;

  UpdateAIAgentResponse({
    this.aiAgent,
  });

  factory UpdateAIAgentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAIAgentResponse(
      aiAgent: json['aiAgent'] != null
          ? AIAgentData.fromJson(json['aiAgent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgent = this.aiAgent;
    return {
      if (aiAgent != null) 'aiAgent': aiAgent,
    };
  }
}

/// @nodoc
class DeleteAIAgentResponse {
  DeleteAIAgentResponse();

  factory DeleteAIAgentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAIAgentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAIAgentsResponse {
  /// The summaries of AI Agents.
  final List<AIAgentSummary> aiAgentSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListAIAgentsResponse({
    required this.aiAgentSummaries,
    this.nextToken,
  });

  factory ListAIAgentsResponse.fromJson(Map<String, dynamic> json) {
    return ListAIAgentsResponse(
      aiAgentSummaries: ((json['aiAgentSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => AIAgentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgentSummaries = this.aiAgentSummaries;
    final nextToken = this.nextToken;
    return {
      'aiAgentSummaries': aiAgentSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateAIAgentVersionResponse {
  /// The data of the AI Agent version.
  final AIAgentData? aiAgent;

  /// The version number of the AI Agent version.
  final int? versionNumber;

  CreateAIAgentVersionResponse({
    this.aiAgent,
    this.versionNumber,
  });

  factory CreateAIAgentVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateAIAgentVersionResponse(
      aiAgent: json['aiAgent'] != null
          ? AIAgentData.fromJson(json['aiAgent'] as Map<String, dynamic>)
          : null,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgent = this.aiAgent;
    final versionNumber = this.versionNumber;
    return {
      if (aiAgent != null) 'aiAgent': aiAgent,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// @nodoc
class DeleteAIAgentVersionResponse {
  DeleteAIAgentVersionResponse();

  factory DeleteAIAgentVersionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAIAgentVersionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAIAgentVersionsResponse {
  /// The summaries of AI Agent versions.
  final List<AIAgentVersionSummary> aiAgentVersionSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListAIAgentVersionsResponse({
    required this.aiAgentVersionSummaries,
    this.nextToken,
  });

  factory ListAIAgentVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAIAgentVersionsResponse(
      aiAgentVersionSummaries: ((json['aiAgentVersionSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => AIAgentVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgentVersionSummaries = this.aiAgentVersionSummaries;
    final nextToken = this.nextToken;
    return {
      'aiAgentVersionSummaries': aiAgentVersionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateAIGuardrailResponse {
  /// The data of the AI Guardrail.
  final AIGuardrailData? aiGuardrail;

  CreateAIGuardrailResponse({
    this.aiGuardrail,
  });

  factory CreateAIGuardrailResponse.fromJson(Map<String, dynamic> json) {
    return CreateAIGuardrailResponse(
      aiGuardrail: json['aiGuardrail'] != null
          ? AIGuardrailData.fromJson(
              json['aiGuardrail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aiGuardrail = this.aiGuardrail;
    return {
      if (aiGuardrail != null) 'aiGuardrail': aiGuardrail,
    };
  }
}

/// @nodoc
class GetAIGuardrailResponse {
  /// The data of the AI Guardrail.
  final AIGuardrailData? aiGuardrail;

  /// The version number of the AI Guardrail version (returned if an AI Guardrail
  /// version was specified via use of a qualifier for the
  /// <code>aiGuardrailId</code> on the request).
  final int? versionNumber;

  GetAIGuardrailResponse({
    this.aiGuardrail,
    this.versionNumber,
  });

  factory GetAIGuardrailResponse.fromJson(Map<String, dynamic> json) {
    return GetAIGuardrailResponse(
      aiGuardrail: json['aiGuardrail'] != null
          ? AIGuardrailData.fromJson(
              json['aiGuardrail'] as Map<String, dynamic>)
          : null,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiGuardrail = this.aiGuardrail;
    final versionNumber = this.versionNumber;
    return {
      if (aiGuardrail != null) 'aiGuardrail': aiGuardrail,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// @nodoc
class UpdateAIGuardrailResponse {
  /// The data of the updated Amazon Q in Connect AI Guardrail.
  final AIGuardrailData? aiGuardrail;

  UpdateAIGuardrailResponse({
    this.aiGuardrail,
  });

  factory UpdateAIGuardrailResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAIGuardrailResponse(
      aiGuardrail: json['aiGuardrail'] != null
          ? AIGuardrailData.fromJson(
              json['aiGuardrail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aiGuardrail = this.aiGuardrail;
    return {
      if (aiGuardrail != null) 'aiGuardrail': aiGuardrail,
    };
  }
}

/// @nodoc
class DeleteAIGuardrailResponse {
  DeleteAIGuardrailResponse();

  factory DeleteAIGuardrailResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAIGuardrailResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAIGuardrailsResponse {
  /// The summaries of the AI Guardrails.
  final List<AIGuardrailSummary> aiGuardrailSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListAIGuardrailsResponse({
    required this.aiGuardrailSummaries,
    this.nextToken,
  });

  factory ListAIGuardrailsResponse.fromJson(Map<String, dynamic> json) {
    return ListAIGuardrailsResponse(
      aiGuardrailSummaries: ((json['aiGuardrailSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => AIGuardrailSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiGuardrailSummaries = this.aiGuardrailSummaries;
    final nextToken = this.nextToken;
    return {
      'aiGuardrailSummaries': aiGuardrailSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateAIGuardrailVersionResponse {
  /// The data of the AI Guardrail version.
  final AIGuardrailData? aiGuardrail;

  /// The version number of the AI Guardrail version.
  final int? versionNumber;

  CreateAIGuardrailVersionResponse({
    this.aiGuardrail,
    this.versionNumber,
  });

  factory CreateAIGuardrailVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateAIGuardrailVersionResponse(
      aiGuardrail: json['aiGuardrail'] != null
          ? AIGuardrailData.fromJson(
              json['aiGuardrail'] as Map<String, dynamic>)
          : null,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiGuardrail = this.aiGuardrail;
    final versionNumber = this.versionNumber;
    return {
      if (aiGuardrail != null) 'aiGuardrail': aiGuardrail,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// @nodoc
class DeleteAIGuardrailVersionResponse {
  DeleteAIGuardrailVersionResponse();

  factory DeleteAIGuardrailVersionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAIGuardrailVersionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAIGuardrailVersionsResponse {
  /// The summaries of the AI Guardrail versions.
  final List<AIGuardrailVersionSummary> aiGuardrailVersionSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListAIGuardrailVersionsResponse({
    required this.aiGuardrailVersionSummaries,
    this.nextToken,
  });

  factory ListAIGuardrailVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAIGuardrailVersionsResponse(
      aiGuardrailVersionSummaries:
          ((json['aiGuardrailVersionSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  AIGuardrailVersionSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiGuardrailVersionSummaries = this.aiGuardrailVersionSummaries;
    final nextToken = this.nextToken;
    return {
      'aiGuardrailVersionSummaries': aiGuardrailVersionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateAIPromptResponse {
  /// The data of the AI Prompt.
  final AIPromptData? aiPrompt;

  CreateAIPromptResponse({
    this.aiPrompt,
  });

  factory CreateAIPromptResponse.fromJson(Map<String, dynamic> json) {
    return CreateAIPromptResponse(
      aiPrompt: json['aiPrompt'] != null
          ? AIPromptData.fromJson(json['aiPrompt'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aiPrompt = this.aiPrompt;
    return {
      if (aiPrompt != null) 'aiPrompt': aiPrompt,
    };
  }
}

/// @nodoc
class GetAIPromptResponse {
  /// The data of the AI Prompt.
  final AIPromptData? aiPrompt;

  /// The version number of the AI Prompt version (returned if an AI Prompt
  /// version was specified via use of a qualifier for the <code>aiPromptId</code>
  /// on the request).
  final int? versionNumber;

  GetAIPromptResponse({
    this.aiPrompt,
    this.versionNumber,
  });

  factory GetAIPromptResponse.fromJson(Map<String, dynamic> json) {
    return GetAIPromptResponse(
      aiPrompt: json['aiPrompt'] != null
          ? AIPromptData.fromJson(json['aiPrompt'] as Map<String, dynamic>)
          : null,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiPrompt = this.aiPrompt;
    final versionNumber = this.versionNumber;
    return {
      if (aiPrompt != null) 'aiPrompt': aiPrompt,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// @nodoc
class UpdateAIPromptResponse {
  /// The data of the updated Amazon Q in Connect AI Prompt.
  final AIPromptData? aiPrompt;

  UpdateAIPromptResponse({
    this.aiPrompt,
  });

  factory UpdateAIPromptResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAIPromptResponse(
      aiPrompt: json['aiPrompt'] != null
          ? AIPromptData.fromJson(json['aiPrompt'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aiPrompt = this.aiPrompt;
    return {
      if (aiPrompt != null) 'aiPrompt': aiPrompt,
    };
  }
}

/// @nodoc
class DeleteAIPromptResponse {
  DeleteAIPromptResponse();

  factory DeleteAIPromptResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAIPromptResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAIPromptsResponse {
  /// The summaries of the AI Prompts.
  final List<AIPromptSummary> aiPromptSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListAIPromptsResponse({
    required this.aiPromptSummaries,
    this.nextToken,
  });

  factory ListAIPromptsResponse.fromJson(Map<String, dynamic> json) {
    return ListAIPromptsResponse(
      aiPromptSummaries: ((json['aiPromptSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => AIPromptSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiPromptSummaries = this.aiPromptSummaries;
    final nextToken = this.nextToken;
    return {
      'aiPromptSummaries': aiPromptSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateAIPromptVersionResponse {
  /// The data of the AI Prompt version.
  final AIPromptData? aiPrompt;

  /// The version number of the AI Prompt version.
  final int? versionNumber;

  CreateAIPromptVersionResponse({
    this.aiPrompt,
    this.versionNumber,
  });

  factory CreateAIPromptVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateAIPromptVersionResponse(
      aiPrompt: json['aiPrompt'] != null
          ? AIPromptData.fromJson(json['aiPrompt'] as Map<String, dynamic>)
          : null,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiPrompt = this.aiPrompt;
    final versionNumber = this.versionNumber;
    return {
      if (aiPrompt != null) 'aiPrompt': aiPrompt,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// @nodoc
class DeleteAIPromptVersionResponse {
  DeleteAIPromptVersionResponse();

  factory DeleteAIPromptVersionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAIPromptVersionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAIPromptVersionsResponse {
  /// The summaries of the AI Prompt versions.
  final List<AIPromptVersionSummary> aiPromptVersionSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListAIPromptVersionsResponse({
    required this.aiPromptVersionSummaries,
    this.nextToken,
  });

  factory ListAIPromptVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAIPromptVersionsResponse(
      aiPromptVersionSummaries: ((json['aiPromptVersionSummaries'] as List?) ??
              const [])
          .nonNulls
          .map(
              (e) => AIPromptVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiPromptVersionSummaries = this.aiPromptVersionSummaries;
    final nextToken = this.nextToken;
    return {
      'aiPromptVersionSummaries': aiPromptVersionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateAssistantAssociationResponse {
  /// The assistant association.
  final AssistantAssociationData? assistantAssociation;

  CreateAssistantAssociationResponse({
    this.assistantAssociation,
  });

  factory CreateAssistantAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAssistantAssociationResponse(
      assistantAssociation: json['assistantAssociation'] != null
          ? AssistantAssociationData.fromJson(
              json['assistantAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assistantAssociation = this.assistantAssociation;
    return {
      if (assistantAssociation != null)
        'assistantAssociation': assistantAssociation,
    };
  }
}

/// @nodoc
class GetAssistantAssociationResponse {
  /// The assistant association.
  final AssistantAssociationData? assistantAssociation;

  GetAssistantAssociationResponse({
    this.assistantAssociation,
  });

  factory GetAssistantAssociationResponse.fromJson(Map<String, dynamic> json) {
    return GetAssistantAssociationResponse(
      assistantAssociation: json['assistantAssociation'] != null
          ? AssistantAssociationData.fromJson(
              json['assistantAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assistantAssociation = this.assistantAssociation;
    return {
      if (assistantAssociation != null)
        'assistantAssociation': assistantAssociation,
    };
  }
}

/// @nodoc
class DeleteAssistantAssociationResponse {
  DeleteAssistantAssociationResponse();

  factory DeleteAssistantAssociationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAssistantAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAssistantAssociationsResponse {
  /// Summary information about assistant associations.
  final List<AssistantAssociationSummary> assistantAssociationSummaries;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListAssistantAssociationsResponse({
    required this.assistantAssociationSummaries,
    this.nextToken,
  });

  factory ListAssistantAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAssistantAssociationsResponse(
      assistantAssociationSummaries: ((json['assistantAssociationSummaries']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              AssistantAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assistantAssociationSummaries = this.assistantAssociationSummaries;
    final nextToken = this.nextToken;
    return {
      'assistantAssociationSummaries': assistantAssociationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateSessionResponse {
  /// The session.
  final SessionData? session;

  CreateSessionResponse({
    this.session,
  });

  factory CreateSessionResponse.fromJson(Map<String, dynamic> json) {
    return CreateSessionResponse(
      session: json['session'] != null
          ? SessionData.fromJson(json['session'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final session = this.session;
    return {
      if (session != null) 'session': session,
    };
  }
}

/// @nodoc
class GetSessionResponse {
  /// The session.
  final SessionData? session;

  GetSessionResponse({
    this.session,
  });

  factory GetSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionResponse(
      session: json['session'] != null
          ? SessionData.fromJson(json['session'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final session = this.session;
    return {
      if (session != null) 'session': session,
    };
  }
}

/// @nodoc
class UpdateSessionResponse {
  final SessionData? session;

  UpdateSessionResponse({
    this.session,
  });

  factory UpdateSessionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSessionResponse(
      session: json['session'] != null
          ? SessionData.fromJson(json['session'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final session = this.session;
    return {
      if (session != null) 'session': session,
    };
  }
}

/// @nodoc
class GetNextMessageResponse {
  /// The state of current conversation.
  final ConversationState conversationState;

  /// The identifier of the submitted message.
  final String requestMessageId;

  /// The message response to the requested message.
  final MessageOutput response;

  /// The type of message response.
  final MessageType type;

  /// Indicates whether the chunked response has been terminated.
  final bool? chunkedResponseTerminated;

  /// The conversation data stored on an Amazon Q in Connect Session.
  final List<RuntimeSessionData>? conversationSessionData;

  /// The token for the next message.
  final String? nextMessageToken;

  GetNextMessageResponse({
    required this.conversationState,
    required this.requestMessageId,
    required this.response,
    required this.type,
    this.chunkedResponseTerminated,
    this.conversationSessionData,
    this.nextMessageToken,
  });

  factory GetNextMessageResponse.fromJson(Map<String, dynamic> json) {
    return GetNextMessageResponse(
      conversationState: ConversationState.fromJson(
          (json['conversationState'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      requestMessageId: (json['requestMessageId'] as String?) ?? '',
      response: MessageOutput.fromJson(
          (json['response'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      type: MessageType.fromString((json['type'] as String?) ?? ''),
      chunkedResponseTerminated: json['chunkedResponseTerminated'] as bool?,
      conversationSessionData: (json['conversationSessionData'] as List?)
          ?.nonNulls
          .map((e) => RuntimeSessionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMessageToken: json['nextMessageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conversationState = this.conversationState;
    final requestMessageId = this.requestMessageId;
    final response = this.response;
    final type = this.type;
    final chunkedResponseTerminated = this.chunkedResponseTerminated;
    final conversationSessionData = this.conversationSessionData;
    final nextMessageToken = this.nextMessageToken;
    return {
      'conversationState': conversationState,
      'requestMessageId': requestMessageId,
      'response': response,
      'type': type.value,
      if (chunkedResponseTerminated != null)
        'chunkedResponseTerminated': chunkedResponseTerminated,
      if (conversationSessionData != null)
        'conversationSessionData': conversationSessionData,
      if (nextMessageToken != null) 'nextMessageToken': nextMessageToken,
    };
  }
}

/// @nodoc
class ListMessagesResponse {
  /// The message information.
  final List<MessageOutput> messages;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListMessagesResponse({
    required this.messages,
    this.nextToken,
  });

  factory ListMessagesResponse.fromJson(Map<String, dynamic> json) {
    return ListMessagesResponse(
      messages: ((json['messages'] as List?) ?? const [])
          .nonNulls
          .map((e) => MessageOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messages = this.messages;
    final nextToken = this.nextToken;
    return {
      'messages': messages,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSpansResponse {
  /// Array of span objects for the session
  final List<Span> spans;

  /// Pagination token for retrieving additional results
  final String? nextToken;

  ListSpansResponse({
    required this.spans,
    this.nextToken,
  });

  factory ListSpansResponse.fromJson(Map<String, dynamic> json) {
    return ListSpansResponse(
      spans: ((json['spans'] as List?) ?? const [])
          .nonNulls
          .map((e) => Span.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final spans = this.spans;
    final nextToken = this.nextToken;
    return {
      'spans': spans,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class SendMessageResponse {
  /// The token for the next message, used by GetNextMessage.
  final String nextMessageToken;

  /// The identifier of the submitted message.
  final String requestMessageId;

  /// The configuration of the <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_amazon-q-connect_SendMessage.html">SendMessage</a>
  /// request.
  final MessageConfiguration? configuration;

  SendMessageResponse({
    required this.nextMessageToken,
    required this.requestMessageId,
    this.configuration,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendMessageResponse(
      nextMessageToken: (json['nextMessageToken'] as String?) ?? '',
      requestMessageId: (json['requestMessageId'] as String?) ?? '',
      configuration: json['configuration'] != null
          ? MessageConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextMessageToken = this.nextMessageToken;
    final requestMessageId = this.requestMessageId;
    final configuration = this.configuration;
    return {
      'nextMessageToken': nextMessageToken,
      'requestMessageId': requestMessageId,
      if (configuration != null) 'configuration': configuration,
    };
  }
}

/// @nodoc
class UpdateSessionDataResponse {
  /// Data stored in the session.
  final List<RuntimeSessionData> data;

  /// The namespace into which the session data is stored. Supported namespaces
  /// are: Custom
  final SessionDataNamespace namespace;

  /// The Amazon Resource Name (ARN) of the session.
  final String sessionArn;

  /// The identifier of the session.
  final String sessionId;

  UpdateSessionDataResponse({
    required this.data,
    required this.namespace,
    required this.sessionArn,
    required this.sessionId,
  });

  factory UpdateSessionDataResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSessionDataResponse(
      data: ((json['data'] as List?) ?? const [])
          .nonNulls
          .map((e) => RuntimeSessionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      namespace:
          SessionDataNamespace.fromString((json['namespace'] as String?) ?? ''),
      sessionArn: (json['sessionArn'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final namespace = this.namespace;
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    return {
      'data': data,
      'namespace': namespace.value,
      'sessionArn': sessionArn,
      'sessionId': sessionId,
    };
  }
}

/// @nodoc
class CreateKnowledgeBaseResponse {
  /// The knowledge base.
  final KnowledgeBaseData? knowledgeBase;

  CreateKnowledgeBaseResponse({
    this.knowledgeBase,
  });

  factory CreateKnowledgeBaseResponse.fromJson(Map<String, dynamic> json) {
    return CreateKnowledgeBaseResponse(
      knowledgeBase: json['knowledgeBase'] != null
          ? KnowledgeBaseData.fromJson(
              json['knowledgeBase'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBase = this.knowledgeBase;
    return {
      if (knowledgeBase != null) 'knowledgeBase': knowledgeBase,
    };
  }
}

/// @nodoc
class GetKnowledgeBaseResponse {
  /// The knowledge base.
  final KnowledgeBaseData? knowledgeBase;

  GetKnowledgeBaseResponse({
    this.knowledgeBase,
  });

  factory GetKnowledgeBaseResponse.fromJson(Map<String, dynamic> json) {
    return GetKnowledgeBaseResponse(
      knowledgeBase: json['knowledgeBase'] != null
          ? KnowledgeBaseData.fromJson(
              json['knowledgeBase'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBase = this.knowledgeBase;
    return {
      if (knowledgeBase != null) 'knowledgeBase': knowledgeBase,
    };
  }
}

/// @nodoc
class DeleteKnowledgeBaseResponse {
  DeleteKnowledgeBaseResponse();

  factory DeleteKnowledgeBaseResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKnowledgeBaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListKnowledgeBasesResponse {
  /// Information about the knowledge bases.
  final List<KnowledgeBaseSummary> knowledgeBaseSummaries;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListKnowledgeBasesResponse({
    required this.knowledgeBaseSummaries,
    this.nextToken,
  });

  factory ListKnowledgeBasesResponse.fromJson(Map<String, dynamic> json) {
    return ListKnowledgeBasesResponse(
      knowledgeBaseSummaries: ((json['knowledgeBaseSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => KnowledgeBaseSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseSummaries = this.knowledgeBaseSummaries;
    final nextToken = this.nextToken;
    return {
      'knowledgeBaseSummaries': knowledgeBaseSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class DeleteImportJobResponse {
  DeleteImportJobResponse();

  factory DeleteImportJobResponse.fromJson(Map<String, dynamic> _) {
    return DeleteImportJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetImportJobResponse {
  /// The import job.
  final ImportJobData? importJob;

  GetImportJobResponse({
    this.importJob,
  });

  factory GetImportJobResponse.fromJson(Map<String, dynamic> json) {
    return GetImportJobResponse(
      importJob: json['importJob'] != null
          ? ImportJobData.fromJson(json['importJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final importJob = this.importJob;
    return {
      if (importJob != null) 'importJob': importJob,
    };
  }
}

/// @nodoc
class ListImportJobsResponse {
  /// Summary information about the import jobs.
  final List<ImportJobSummary> importJobSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListImportJobsResponse({
    required this.importJobSummaries,
    this.nextToken,
  });

  factory ListImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListImportJobsResponse(
      importJobSummaries: ((json['importJobSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ImportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final importJobSummaries = this.importJobSummaries;
    final nextToken = this.nextToken;
    return {
      'importJobSummaries': importJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class RemoveKnowledgeBaseTemplateUriResponse {
  RemoveKnowledgeBaseTemplateUriResponse();

  factory RemoveKnowledgeBaseTemplateUriResponse.fromJson(
      Map<String, dynamic> _) {
    return RemoveKnowledgeBaseTemplateUriResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class SearchContentResponse {
  /// Summary information about the content.
  final List<ContentSummary> contentSummaries;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  SearchContentResponse({
    required this.contentSummaries,
    this.nextToken,
  });

  factory SearchContentResponse.fromJson(Map<String, dynamic> json) {
    return SearchContentResponse(
      contentSummaries: ((json['contentSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ContentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentSummaries = this.contentSummaries;
    final nextToken = this.nextToken;
    return {
      'contentSummaries': contentSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class SearchMessageTemplatesResponse {
  /// The results of the message template search.
  final List<MessageTemplateSearchResultData> results;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  SearchMessageTemplatesResponse({
    required this.results,
    this.nextToken,
  });

  factory SearchMessageTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return SearchMessageTemplatesResponse(
      results: ((json['results'] as List?) ?? const [])
          .nonNulls
          .map((e) => MessageTemplateSearchResultData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final nextToken = this.nextToken;
    return {
      'results': results,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class SearchQuickResponsesResponse {
  /// The results of the quick response search.
  final List<QuickResponseSearchResultData> results;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  SearchQuickResponsesResponse({
    required this.results,
    this.nextToken,
  });

  factory SearchQuickResponsesResponse.fromJson(Map<String, dynamic> json) {
    return SearchQuickResponsesResponse(
      results: ((json['results'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              QuickResponseSearchResultData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final nextToken = this.nextToken;
    return {
      'results': results,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StartContentUploadResponse {
  /// The headers to include in the upload.
  final Map<String, String> headersToInclude;

  /// The identifier of the upload.
  final String uploadId;

  /// The URL of the upload.
  final String url;

  /// The expiration time of the URL as an epoch timestamp.
  final DateTime urlExpiry;

  StartContentUploadResponse({
    required this.headersToInclude,
    required this.uploadId,
    required this.url,
    required this.urlExpiry,
  });

  factory StartContentUploadResponse.fromJson(Map<String, dynamic> json) {
    return StartContentUploadResponse(
      headersToInclude: ((json['headersToInclude'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      uploadId: (json['uploadId'] as String?) ?? '',
      url: (json['url'] as String?) ?? '',
      urlExpiry: nonNullableTimeStampFromJson(json['urlExpiry'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final headersToInclude = this.headersToInclude;
    final uploadId = this.uploadId;
    final url = this.url;
    final urlExpiry = this.urlExpiry;
    return {
      'headersToInclude': headersToInclude,
      'uploadId': uploadId,
      'url': url,
      'urlExpiry': unixTimestampToJson(urlExpiry),
    };
  }
}

/// @nodoc
class StartImportJobResponse {
  /// The import job.
  final ImportJobData? importJob;

  StartImportJobResponse({
    this.importJob,
  });

  factory StartImportJobResponse.fromJson(Map<String, dynamic> json) {
    return StartImportJobResponse(
      importJob: json['importJob'] != null
          ? ImportJobData.fromJson(json['importJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final importJob = this.importJob;
    return {
      if (importJob != null) 'importJob': importJob,
    };
  }
}

/// @nodoc
class UpdateKnowledgeBaseTemplateUriResponse {
  /// The knowledge base to update.
  final KnowledgeBaseData? knowledgeBase;

  UpdateKnowledgeBaseTemplateUriResponse({
    this.knowledgeBase,
  });

  factory UpdateKnowledgeBaseTemplateUriResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateKnowledgeBaseTemplateUriResponse(
      knowledgeBase: json['knowledgeBase'] != null
          ? KnowledgeBaseData.fromJson(
              json['knowledgeBase'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBase = this.knowledgeBase;
    return {
      if (knowledgeBase != null) 'knowledgeBase': knowledgeBase,
    };
  }
}

/// @nodoc
class CreateContentResponse {
  /// The content.
  final ContentData? content;

  CreateContentResponse({
    this.content,
  });

  factory CreateContentResponse.fromJson(Map<String, dynamic> json) {
    return CreateContentResponse(
      content: json['content'] != null
          ? ContentData.fromJson(json['content'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    return {
      if (content != null) 'content': content,
    };
  }
}

/// @nodoc
class GetContentResponse {
  /// The content.
  final ContentData? content;

  GetContentResponse({
    this.content,
  });

  factory GetContentResponse.fromJson(Map<String, dynamic> json) {
    return GetContentResponse(
      content: json['content'] != null
          ? ContentData.fromJson(json['content'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    return {
      if (content != null) 'content': content,
    };
  }
}

/// @nodoc
class UpdateContentResponse {
  /// The content.
  final ContentData? content;

  UpdateContentResponse({
    this.content,
  });

  factory UpdateContentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateContentResponse(
      content: json['content'] != null
          ? ContentData.fromJson(json['content'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    return {
      if (content != null) 'content': content,
    };
  }
}

/// @nodoc
class DeleteContentResponse {
  DeleteContentResponse();

  factory DeleteContentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteContentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListContentsResponse {
  /// Information about the content.
  final List<ContentSummary> contentSummaries;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListContentsResponse({
    required this.contentSummaries,
    this.nextToken,
  });

  factory ListContentsResponse.fromJson(Map<String, dynamic> json) {
    return ListContentsResponse(
      contentSummaries: ((json['contentSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ContentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentSummaries = this.contentSummaries;
    final nextToken = this.nextToken;
    return {
      'contentSummaries': contentSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetContentSummaryResponse {
  /// The content summary.
  final ContentSummary? contentSummary;

  GetContentSummaryResponse({
    this.contentSummary,
  });

  factory GetContentSummaryResponse.fromJson(Map<String, dynamic> json) {
    return GetContentSummaryResponse(
      contentSummary: json['contentSummary'] != null
          ? ContentSummary.fromJson(
              json['contentSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentSummary = this.contentSummary;
    return {
      if (contentSummary != null) 'contentSummary': contentSummary,
    };
  }
}

/// @nodoc
class CreateContentAssociationResponse {
  /// The association between Amazon Q in Connect content and another resource.
  final ContentAssociationData? contentAssociation;

  CreateContentAssociationResponse({
    this.contentAssociation,
  });

  factory CreateContentAssociationResponse.fromJson(Map<String, dynamic> json) {
    return CreateContentAssociationResponse(
      contentAssociation: json['contentAssociation'] != null
          ? ContentAssociationData.fromJson(
              json['contentAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentAssociation = this.contentAssociation;
    return {
      if (contentAssociation != null) 'contentAssociation': contentAssociation,
    };
  }
}

/// @nodoc
class GetContentAssociationResponse {
  /// The association between Amazon Q in Connect content and another resource.
  final ContentAssociationData? contentAssociation;

  GetContentAssociationResponse({
    this.contentAssociation,
  });

  factory GetContentAssociationResponse.fromJson(Map<String, dynamic> json) {
    return GetContentAssociationResponse(
      contentAssociation: json['contentAssociation'] != null
          ? ContentAssociationData.fromJson(
              json['contentAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentAssociation = this.contentAssociation;
    return {
      if (contentAssociation != null) 'contentAssociation': contentAssociation,
    };
  }
}

/// @nodoc
class DeleteContentAssociationResponse {
  DeleteContentAssociationResponse();

  factory DeleteContentAssociationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteContentAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListContentAssociationsResponse {
  /// Summary information about content associations.
  final List<ContentAssociationSummary> contentAssociationSummaries;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListContentAssociationsResponse({
    required this.contentAssociationSummaries,
    this.nextToken,
  });

  factory ListContentAssociationsResponse.fromJson(Map<String, dynamic> json) {
    return ListContentAssociationsResponse(
      contentAssociationSummaries:
          ((json['contentAssociationSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  ContentAssociationSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentAssociationSummaries = this.contentAssociationSummaries;
    final nextToken = this.nextToken;
    return {
      'contentAssociationSummaries': contentAssociationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateMessageTemplateResponse {
  /// The message template.
  final MessageTemplateData? messageTemplate;

  CreateMessageTemplateResponse({
    this.messageTemplate,
  });

  factory CreateMessageTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateMessageTemplateResponse(
      messageTemplate: json['messageTemplate'] != null
          ? MessageTemplateData.fromJson(
              json['messageTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final messageTemplate = this.messageTemplate;
    return {
      if (messageTemplate != null) 'messageTemplate': messageTemplate,
    };
  }
}

/// @nodoc
class GetMessageTemplateResponse {
  /// The message template.
  final ExtendedMessageTemplateData? messageTemplate;

  GetMessageTemplateResponse({
    this.messageTemplate,
  });

  factory GetMessageTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetMessageTemplateResponse(
      messageTemplate: json['messageTemplate'] != null
          ? ExtendedMessageTemplateData.fromJson(
              json['messageTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final messageTemplate = this.messageTemplate;
    return {
      if (messageTemplate != null) 'messageTemplate': messageTemplate,
    };
  }
}

/// @nodoc
class UpdateMessageTemplateResponse {
  /// The message template.
  final MessageTemplateData? messageTemplate;

  UpdateMessageTemplateResponse({
    this.messageTemplate,
  });

  factory UpdateMessageTemplateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMessageTemplateResponse(
      messageTemplate: json['messageTemplate'] != null
          ? MessageTemplateData.fromJson(
              json['messageTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final messageTemplate = this.messageTemplate;
    return {
      if (messageTemplate != null) 'messageTemplate': messageTemplate,
    };
  }
}

/// @nodoc
class DeleteMessageTemplateResponse {
  DeleteMessageTemplateResponse();

  factory DeleteMessageTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMessageTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListMessageTemplatesResponse {
  /// Summary information about the message template.
  final List<MessageTemplateSummary> messageTemplateSummaries;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListMessageTemplatesResponse({
    required this.messageTemplateSummaries,
    this.nextToken,
  });

  factory ListMessageTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListMessageTemplatesResponse(
      messageTemplateSummaries: ((json['messageTemplateSummaries'] as List?) ??
              const [])
          .nonNulls
          .map(
              (e) => MessageTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageTemplateSummaries = this.messageTemplateSummaries;
    final nextToken = this.nextToken;
    return {
      'messageTemplateSummaries': messageTemplateSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ActivateMessageTemplateResponse {
  /// The Amazon Resource Name (ARN) of the message template.
  final String messageTemplateArn;

  /// The identifier of the message template.
  final String messageTemplateId;

  /// The version number of the message template version that is activated.
  final int versionNumber;

  ActivateMessageTemplateResponse({
    required this.messageTemplateArn,
    required this.messageTemplateId,
    required this.versionNumber,
  });

  factory ActivateMessageTemplateResponse.fromJson(Map<String, dynamic> json) {
    return ActivateMessageTemplateResponse(
      messageTemplateArn: (json['messageTemplateArn'] as String?) ?? '',
      messageTemplateId: (json['messageTemplateId'] as String?) ?? '',
      versionNumber: (json['versionNumber'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final messageTemplateArn = this.messageTemplateArn;
    final messageTemplateId = this.messageTemplateId;
    final versionNumber = this.versionNumber;
    return {
      'messageTemplateArn': messageTemplateArn,
      'messageTemplateId': messageTemplateId,
      'versionNumber': versionNumber,
    };
  }
}

/// @nodoc
class CreateMessageTemplateAttachmentResponse {
  /// The message template attachment.
  final MessageTemplateAttachment? attachment;

  CreateMessageTemplateAttachmentResponse({
    this.attachment,
  });

  factory CreateMessageTemplateAttachmentResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMessageTemplateAttachmentResponse(
      attachment: json['attachment'] != null
          ? MessageTemplateAttachment.fromJson(
              json['attachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    return {
      if (attachment != null) 'attachment': attachment,
    };
  }
}

/// @nodoc
class CreateMessageTemplateVersionResponse {
  /// The message template.
  final ExtendedMessageTemplateData? messageTemplate;

  CreateMessageTemplateVersionResponse({
    this.messageTemplate,
  });

  factory CreateMessageTemplateVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMessageTemplateVersionResponse(
      messageTemplate: json['messageTemplate'] != null
          ? ExtendedMessageTemplateData.fromJson(
              json['messageTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final messageTemplate = this.messageTemplate;
    return {
      if (messageTemplate != null) 'messageTemplate': messageTemplate,
    };
  }
}

/// @nodoc
class DeactivateMessageTemplateResponse {
  /// The Amazon Resource Name (ARN) of the message template.
  final String messageTemplateArn;

  /// The identifier of the message template.
  final String messageTemplateId;

  /// The version number of the message template version that has been
  /// deactivated.
  final int versionNumber;

  DeactivateMessageTemplateResponse({
    required this.messageTemplateArn,
    required this.messageTemplateId,
    required this.versionNumber,
  });

  factory DeactivateMessageTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return DeactivateMessageTemplateResponse(
      messageTemplateArn: (json['messageTemplateArn'] as String?) ?? '',
      messageTemplateId: (json['messageTemplateId'] as String?) ?? '',
      versionNumber: (json['versionNumber'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final messageTemplateArn = this.messageTemplateArn;
    final messageTemplateId = this.messageTemplateId;
    final versionNumber = this.versionNumber;
    return {
      'messageTemplateArn': messageTemplateArn,
      'messageTemplateId': messageTemplateId,
      'versionNumber': versionNumber,
    };
  }
}

/// @nodoc
class DeleteMessageTemplateAttachmentResponse {
  DeleteMessageTemplateAttachmentResponse();

  factory DeleteMessageTemplateAttachmentResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteMessageTemplateAttachmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListMessageTemplateVersionsResponse {
  /// Summary information about the versions of a message template.
  final List<MessageTemplateVersionSummary> messageTemplateVersionSummaries;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListMessageTemplateVersionsResponse({
    required this.messageTemplateVersionSummaries,
    this.nextToken,
  });

  factory ListMessageTemplateVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMessageTemplateVersionsResponse(
      messageTemplateVersionSummaries: ((json['messageTemplateVersionSummaries']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              MessageTemplateVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageTemplateVersionSummaries =
        this.messageTemplateVersionSummaries;
    final nextToken = this.nextToken;
    return {
      'messageTemplateVersionSummaries': messageTemplateVersionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class RenderMessageTemplateResponse {
  /// The message template attachments.
  final List<MessageTemplateAttachment>? attachments;

  /// The attribute keys that are not resolved.
  final List<String>? attributesNotInterpolated;

  /// The content of the message template.
  final MessageTemplateContentProvider? content;

  /// The source configuration of the message template.
  final MessageTemplateSourceConfigurationSummary? sourceConfigurationSummary;

  RenderMessageTemplateResponse({
    this.attachments,
    this.attributesNotInterpolated,
    this.content,
    this.sourceConfigurationSummary,
  });

  factory RenderMessageTemplateResponse.fromJson(Map<String, dynamic> json) {
    return RenderMessageTemplateResponse(
      attachments: (json['attachments'] as List?)
          ?.nonNulls
          .map((e) =>
              MessageTemplateAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributesNotInterpolated: (json['attributesNotInterpolated'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      content: json['content'] != null
          ? MessageTemplateContentProvider.fromJson(
              json['content'] as Map<String, dynamic>)
          : null,
      sourceConfigurationSummary: json['sourceConfigurationSummary'] != null
          ? MessageTemplateSourceConfigurationSummary.fromJson(
              json['sourceConfigurationSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attachments = this.attachments;
    final attributesNotInterpolated = this.attributesNotInterpolated;
    final content = this.content;
    final sourceConfigurationSummary = this.sourceConfigurationSummary;
    return {
      if (attachments != null) 'attachments': attachments,
      if (attributesNotInterpolated != null)
        'attributesNotInterpolated': attributesNotInterpolated,
      if (content != null) 'content': content,
      if (sourceConfigurationSummary != null)
        'sourceConfigurationSummary': sourceConfigurationSummary,
    };
  }
}

/// @nodoc
class UpdateMessageTemplateMetadataResponse {
  /// The message template.
  final MessageTemplateData? messageTemplate;

  UpdateMessageTemplateMetadataResponse({
    this.messageTemplate,
  });

  factory UpdateMessageTemplateMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateMessageTemplateMetadataResponse(
      messageTemplate: json['messageTemplate'] != null
          ? MessageTemplateData.fromJson(
              json['messageTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final messageTemplate = this.messageTemplate;
    return {
      if (messageTemplate != null) 'messageTemplate': messageTemplate,
    };
  }
}

/// @nodoc
class CreateQuickResponseResponse {
  /// The quick response.
  final QuickResponseData? quickResponse;

  CreateQuickResponseResponse({
    this.quickResponse,
  });

  factory CreateQuickResponseResponse.fromJson(Map<String, dynamic> json) {
    return CreateQuickResponseResponse(
      quickResponse: json['quickResponse'] != null
          ? QuickResponseData.fromJson(
              json['quickResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final quickResponse = this.quickResponse;
    return {
      if (quickResponse != null) 'quickResponse': quickResponse,
    };
  }
}

/// @nodoc
class GetQuickResponseResponse {
  /// The quick response.
  final QuickResponseData? quickResponse;

  GetQuickResponseResponse({
    this.quickResponse,
  });

  factory GetQuickResponseResponse.fromJson(Map<String, dynamic> json) {
    return GetQuickResponseResponse(
      quickResponse: json['quickResponse'] != null
          ? QuickResponseData.fromJson(
              json['quickResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final quickResponse = this.quickResponse;
    return {
      if (quickResponse != null) 'quickResponse': quickResponse,
    };
  }
}

/// @nodoc
class UpdateQuickResponseResponse {
  /// The quick response.
  final QuickResponseData? quickResponse;

  UpdateQuickResponseResponse({
    this.quickResponse,
  });

  factory UpdateQuickResponseResponse.fromJson(Map<String, dynamic> json) {
    return UpdateQuickResponseResponse(
      quickResponse: json['quickResponse'] != null
          ? QuickResponseData.fromJson(
              json['quickResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final quickResponse = this.quickResponse;
    return {
      if (quickResponse != null) 'quickResponse': quickResponse,
    };
  }
}

/// @nodoc
class DeleteQuickResponseResponse {
  DeleteQuickResponseResponse();

  factory DeleteQuickResponseResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQuickResponseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListQuickResponsesResponse {
  /// Summary information about the quick responses.
  final List<QuickResponseSummary> quickResponseSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListQuickResponsesResponse({
    required this.quickResponseSummaries,
    this.nextToken,
  });

  factory ListQuickResponsesResponse.fromJson(Map<String, dynamic> json) {
    return ListQuickResponsesResponse(
      quickResponseSummaries: ((json['quickResponseSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => QuickResponseSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final quickResponseSummaries = this.quickResponseSummaries;
    final nextToken = this.nextToken;
    return {
      'quickResponseSummaries': quickResponseSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The summary information about the quick response.
///
/// @nodoc
class QuickResponseSummary {
  /// The media type of the quick response content.
  ///
  /// <ul>
  /// <li>
  /// Use <code>application/x.quickresponse;format=plain</code> for quick response
  /// written in plain text.
  /// </li>
  /// <li>
  /// Use <code>application/x.quickresponse;format=markdown</code> for quick
  /// response written in richtext.
  /// </li>
  /// </ul>
  final String contentType;

  /// The timestamp when the quick response was created.
  final DateTime createdTime;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The timestamp when the quick response summary was last modified.
  final DateTime lastModifiedTime;

  /// The name of the quick response.
  final String name;

  /// The Amazon Resource Name (ARN) of the quick response.
  final String quickResponseArn;

  /// The identifier of the quick response.
  final String quickResponseId;

  /// The resource status of the quick response.
  final QuickResponseStatus status;

  /// The Amazon Connect contact channels this quick response applies to. The
  /// supported contact channel types include <code>Chat</code>.
  final List<String>? channels;

  /// The description of the quick response.
  final String? description;

  /// Whether the quick response is active.
  final bool? isActive;

  /// The Amazon Resource Name (ARN) of the user who last updated the quick
  /// response data.
  final String? lastModifiedBy;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  QuickResponseSummary({
    required this.contentType,
    required this.createdTime,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.lastModifiedTime,
    required this.name,
    required this.quickResponseArn,
    required this.quickResponseId,
    required this.status,
    this.channels,
    this.description,
    this.isActive,
    this.lastModifiedBy,
    this.tags,
  });

  factory QuickResponseSummary.fromJson(Map<String, dynamic> json) {
    return QuickResponseSummary(
      contentType: (json['contentType'] as String?) ?? '',
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      quickResponseArn: (json['quickResponseArn'] as String?) ?? '',
      quickResponseId: (json['quickResponseId'] as String?) ?? '',
      status: QuickResponseStatus.fromString((json['status'] as String?) ?? ''),
      channels: (json['channels'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      isActive: json['isActive'] as bool?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final createdTime = this.createdTime;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final quickResponseArn = this.quickResponseArn;
    final quickResponseId = this.quickResponseId;
    final status = this.status;
    final channels = this.channels;
    final description = this.description;
    final isActive = this.isActive;
    final lastModifiedBy = this.lastModifiedBy;
    final tags = this.tags;
    return {
      'contentType': contentType,
      'createdTime': unixTimestampToJson(createdTime),
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'name': name,
      'quickResponseArn': quickResponseArn,
      'quickResponseId': quickResponseId,
      'status': status.value,
      if (channels != null) 'channels': channels,
      if (description != null) 'description': description,
      if (isActive != null) 'isActive': isActive,
      if (lastModifiedBy != null) 'lastModifiedBy': lastModifiedBy,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class QuickResponseStatus {
  static const createInProgress = QuickResponseStatus._('CREATE_IN_PROGRESS');
  static const createFailed = QuickResponseStatus._('CREATE_FAILED');
  static const created = QuickResponseStatus._('CREATED');
  static const deleteInProgress = QuickResponseStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = QuickResponseStatus._('DELETE_FAILED');
  static const deleted = QuickResponseStatus._('DELETED');
  static const updateInProgress = QuickResponseStatus._('UPDATE_IN_PROGRESS');
  static const updateFailed = QuickResponseStatus._('UPDATE_FAILED');

  final String value;

  const QuickResponseStatus._(this.value);

  static const values = [
    createInProgress,
    createFailed,
    created,
    deleteInProgress,
    deleteFailed,
    deleted,
    updateInProgress,
    updateFailed
  ];

  static QuickResponseStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QuickResponseStatus._(value));

  @override
  bool operator ==(other) =>
      other is QuickResponseStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the quick response.
///
/// @nodoc
class QuickResponseData {
  /// The media type of the quick response content.
  ///
  /// <ul>
  /// <li>
  /// Use <code>application/x.quickresponse;format=plain</code> for quick response
  /// written in plain text.
  /// </li>
  /// <li>
  /// Use <code>application/x.quickresponse;format=markdown</code> for quick
  /// response written in richtext.
  /// </li>
  /// </ul>
  final String contentType;

  /// The timestamp when the quick response was created.
  final DateTime createdTime;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  final String knowledgeBaseId;

  /// The timestamp when the quick response data was last modified.
  final DateTime lastModifiedTime;

  /// The name of the quick response.
  final String name;

  /// The Amazon Resource Name (ARN) of the quick response.
  final String quickResponseArn;

  /// The identifier of the quick response.
  final String quickResponseId;

  /// The status of the quick response data.
  final QuickResponseStatus status;

  /// The Amazon Connect contact channels this quick response applies to. The
  /// supported contact channel types include <code>Chat</code>.
  final List<String>? channels;

  /// The contents of the quick response.
  final QuickResponseContents? contents;

  /// The description of the quick response.
  final String? description;

  /// The configuration information of the user groups that the quick response is
  /// accessible to.
  final GroupingConfiguration? groupingConfiguration;

  /// Whether the quick response is active.
  final bool? isActive;

  /// The language code value for the language in which the quick response is
  /// written. The supported language codes include <code>de_DE</code>,
  /// <code>en_US</code>, <code>es_ES</code>, <code>fr_FR</code>,
  /// <code>id_ID</code>, <code>it_IT</code>, <code>ja_JP</code>,
  /// <code>ko_KR</code>, <code>pt_BR</code>, <code>zh_CN</code>,
  /// <code>zh_TW</code>
  final String? language;

  /// The Amazon Resource Name (ARN) of the user who last updated the quick
  /// response data.
  final String? lastModifiedBy;

  /// The shortcut key of the quick response. The value should be unique across
  /// the knowledge base.
  final String? shortcutKey;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  QuickResponseData({
    required this.contentType,
    required this.createdTime,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.lastModifiedTime,
    required this.name,
    required this.quickResponseArn,
    required this.quickResponseId,
    required this.status,
    this.channels,
    this.contents,
    this.description,
    this.groupingConfiguration,
    this.isActive,
    this.language,
    this.lastModifiedBy,
    this.shortcutKey,
    this.tags,
  });

  factory QuickResponseData.fromJson(Map<String, dynamic> json) {
    return QuickResponseData(
      contentType: (json['contentType'] as String?) ?? '',
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      quickResponseArn: (json['quickResponseArn'] as String?) ?? '',
      quickResponseId: (json['quickResponseId'] as String?) ?? '',
      status: QuickResponseStatus.fromString((json['status'] as String?) ?? ''),
      channels: (json['channels'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      contents: json['contents'] != null
          ? QuickResponseContents.fromJson(
              json['contents'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      groupingConfiguration: json['groupingConfiguration'] != null
          ? GroupingConfiguration.fromJson(
              json['groupingConfiguration'] as Map<String, dynamic>)
          : null,
      isActive: json['isActive'] as bool?,
      language: json['language'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      shortcutKey: json['shortcutKey'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final createdTime = this.createdTime;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final quickResponseArn = this.quickResponseArn;
    final quickResponseId = this.quickResponseId;
    final status = this.status;
    final channels = this.channels;
    final contents = this.contents;
    final description = this.description;
    final groupingConfiguration = this.groupingConfiguration;
    final isActive = this.isActive;
    final language = this.language;
    final lastModifiedBy = this.lastModifiedBy;
    final shortcutKey = this.shortcutKey;
    final tags = this.tags;
    return {
      'contentType': contentType,
      'createdTime': unixTimestampToJson(createdTime),
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'name': name,
      'quickResponseArn': quickResponseArn,
      'quickResponseId': quickResponseId,
      'status': status.value,
      if (channels != null) 'channels': channels,
      if (contents != null) 'contents': contents,
      if (description != null) 'description': description,
      if (groupingConfiguration != null)
        'groupingConfiguration': groupingConfiguration,
      if (isActive != null) 'isActive': isActive,
      if (language != null) 'language': language,
      if (lastModifiedBy != null) 'lastModifiedBy': lastModifiedBy,
      if (shortcutKey != null) 'shortcutKey': shortcutKey,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The content of the quick response stored in different media types.
///
/// @nodoc
class QuickResponseContents {
  final QuickResponseContentProvider? markdown;
  final QuickResponseContentProvider? plainText;

  QuickResponseContents({
    this.markdown,
    this.plainText,
  });

  factory QuickResponseContents.fromJson(Map<String, dynamic> json) {
    return QuickResponseContents(
      markdown: json['markdown'] != null
          ? QuickResponseContentProvider.fromJson(
              json['markdown'] as Map<String, dynamic>)
          : null,
      plainText: json['plainText'] != null
          ? QuickResponseContentProvider.fromJson(
              json['plainText'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final markdown = this.markdown;
    final plainText = this.plainText;
    return {
      if (markdown != null) 'markdown': markdown,
      if (plainText != null) 'plainText': plainText,
    };
  }
}

/// The configuration information of the grouping of Amazon Q in Connect users.
///
/// @nodoc
class GroupingConfiguration {
  /// The criteria used for grouping Amazon Q in Connect users.
  ///
  /// The following is the list of supported criteria values.
  ///
  /// <ul>
  /// <li>
  /// <code>RoutingProfileArn</code>: Grouping the users by their <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_RoutingProfile.html">Amazon
  /// Connect routing profile ARN</a>. User should have <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_SearchRoutingProfiles.html">SearchRoutingProfile</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribeRoutingProfile.html">DescribeRoutingProfile</a>
  /// permissions when setting criteria to this value.
  /// </li>
  /// </ul>
  final String? criteria;

  /// The list of values that define different groups of Amazon Q in Connect
  /// users.
  ///
  /// <ul>
  /// <li>
  /// When setting <code>criteria</code> to <code>RoutingProfileArn</code>, you
  /// need to provide a list of ARNs of <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_RoutingProfile.html">Amazon
  /// Connect routing profiles</a> as values of this parameter.
  /// </li>
  /// </ul>
  final List<String>? values;

  GroupingConfiguration({
    this.criteria,
    this.values,
  });

  factory GroupingConfiguration.fromJson(Map<String, dynamic> json) {
    return GroupingConfiguration(
      criteria: json['criteria'] as String?,
      values:
          (json['values'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final criteria = this.criteria;
    final values = this.values;
    return {
      if (criteria != null) 'criteria': criteria,
      if (values != null) 'values': values,
    };
  }
}

/// The container quick response content.
///
/// @nodoc
class QuickResponseContentProvider {
  /// The content of the quick response.
  final String? content;

  QuickResponseContentProvider({
    this.content,
  });

  factory QuickResponseContentProvider.fromJson(Map<String, dynamic> json) {
    return QuickResponseContentProvider(
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    return {
      if (content != null) 'content': content,
    };
  }
}

/// The container of quick response data.
///
/// @nodoc
class QuickResponseDataProvider {
  /// The content of the quick response.
  final String? content;

  QuickResponseDataProvider({
    this.content,
  });

  Map<String, dynamic> toJson() {
    final content = this.content;
    return {
      if (content != null) 'content': content,
    };
  }
}

/// The data of a message template.
///
/// @nodoc
class MessageTemplateData {
  /// The channel subtype this message template applies to.
  final ChannelSubtype channelSubtype;

  /// The timestamp when the message template was created.
  final DateTime createdTime;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The Amazon Resource Name (ARN) of the user who last updated the message
  /// template data.
  final String lastModifiedBy;

  /// The timestamp when the message template data was last modified.
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the message template.
  final String messageTemplateArn;

  /// The checksum value of the message template content that is referenced by the
  /// <code>$LATEST</code> qualifier. It can be returned in
  /// <code>MessageTemplateData</code> or
  /// <code>ExtendedMessageTemplateData</code>. It’s calculated by content,
  /// language, <code>defaultAttributes</code> and <code>Attachments</code> of the
  /// message template.
  final String messageTemplateContentSha256;

  /// The identifier of the message template.
  final String messageTemplateId;

  /// The name of the message template.
  final String name;

  /// The types of attributes that the message template contains.
  final List<MessageTemplateAttributeType>? attributeTypes;

  /// The channel of the message template.
  final String? channel;

  /// The content of the message template.
  final MessageTemplateContentProvider? content;

  /// An object that specifies the default values to use for variables in the
  /// message template. This object contains different categories of key-value
  /// pairs. Each key defines a variable or placeholder in the message template.
  /// The corresponding value defines the default value for that variable.
  final MessageTemplateAttributes? defaultAttributes;

  /// The description of the message template.
  final String? description;
  final GroupingConfiguration? groupingConfiguration;

  /// The language code value for the language in which the quick response is
  /// written. The supported language codes include <code>de_DE</code>,
  /// <code>en_US</code>, <code>es_ES</code>, <code>fr_FR</code>,
  /// <code>id_ID</code>, <code>it_IT</code>, <code>ja_JP</code>,
  /// <code>ko_KR</code>, <code>pt_BR</code>, <code>zh_CN</code>,
  /// <code>zh_TW</code>
  final String? language;

  /// The source configuration summary of the message template.
  final MessageTemplateSourceConfigurationSummary? sourceConfigurationSummary;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  MessageTemplateData({
    required this.channelSubtype,
    required this.createdTime,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.lastModifiedBy,
    required this.lastModifiedTime,
    required this.messageTemplateArn,
    required this.messageTemplateContentSha256,
    required this.messageTemplateId,
    required this.name,
    this.attributeTypes,
    this.channel,
    this.content,
    this.defaultAttributes,
    this.description,
    this.groupingConfiguration,
    this.language,
    this.sourceConfigurationSummary,
    this.tags,
  });

  factory MessageTemplateData.fromJson(Map<String, dynamic> json) {
    return MessageTemplateData(
      channelSubtype:
          ChannelSubtype.fromString((json['channelSubtype'] as String?) ?? ''),
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      lastModifiedBy: (json['lastModifiedBy'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      messageTemplateArn: (json['messageTemplateArn'] as String?) ?? '',
      messageTemplateContentSha256:
          (json['messageTemplateContentSha256'] as String?) ?? '',
      messageTemplateId: (json['messageTemplateId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      attributeTypes: (json['attributeTypes'] as List?)
          ?.nonNulls
          .map((e) => MessageTemplateAttributeType.fromString((e as String)))
          .toList(),
      channel: json['channel'] as String?,
      content: json['content'] != null
          ? MessageTemplateContentProvider.fromJson(
              json['content'] as Map<String, dynamic>)
          : null,
      defaultAttributes: json['defaultAttributes'] != null
          ? MessageTemplateAttributes.fromJson(
              json['defaultAttributes'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      groupingConfiguration: json['groupingConfiguration'] != null
          ? GroupingConfiguration.fromJson(
              json['groupingConfiguration'] as Map<String, dynamic>)
          : null,
      language: json['language'] as String?,
      sourceConfigurationSummary: json['sourceConfigurationSummary'] != null
          ? MessageTemplateSourceConfigurationSummary.fromJson(
              json['sourceConfigurationSummary'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final channelSubtype = this.channelSubtype;
    final createdTime = this.createdTime;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedTime = this.lastModifiedTime;
    final messageTemplateArn = this.messageTemplateArn;
    final messageTemplateContentSha256 = this.messageTemplateContentSha256;
    final messageTemplateId = this.messageTemplateId;
    final name = this.name;
    final attributeTypes = this.attributeTypes;
    final channel = this.channel;
    final content = this.content;
    final defaultAttributes = this.defaultAttributes;
    final description = this.description;
    final groupingConfiguration = this.groupingConfiguration;
    final language = this.language;
    final sourceConfigurationSummary = this.sourceConfigurationSummary;
    final tags = this.tags;
    return {
      'channelSubtype': channelSubtype.value,
      'createdTime': iso8601ToJson(createdTime),
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      'messageTemplateArn': messageTemplateArn,
      'messageTemplateContentSha256': messageTemplateContentSha256,
      'messageTemplateId': messageTemplateId,
      'name': name,
      if (attributeTypes != null)
        'attributeTypes': attributeTypes.map((e) => e.value).toList(),
      if (channel != null) 'channel': channel,
      if (content != null) 'content': content,
      if (defaultAttributes != null) 'defaultAttributes': defaultAttributes,
      if (description != null) 'description': description,
      if (groupingConfiguration != null)
        'groupingConfiguration': groupingConfiguration,
      if (language != null) 'language': language,
      if (sourceConfigurationSummary != null)
        'sourceConfigurationSummary': sourceConfigurationSummary,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ChannelSubtype {
  static const email = ChannelSubtype._('EMAIL');
  static const sms = ChannelSubtype._('SMS');
  static const whatsapp = ChannelSubtype._('WHATSAPP');
  static const push = ChannelSubtype._('PUSH');

  final String value;

  const ChannelSubtype._(this.value);

  static const values = [email, sms, whatsapp, push];

  static ChannelSubtype fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChannelSubtype._(value));

  @override
  bool operator ==(other) => other is ChannelSubtype && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The container of message template content.
///
/// @nodoc
class MessageTemplateContentProvider {
  /// The content of the message template that applies to the email channel
  /// subtype.
  final EmailMessageTemplateContent? email;
  final PushMessageTemplateContent? push;

  /// The content of the message template that applies to the SMS channel subtype.
  final SMSMessageTemplateContent? sms;

  /// The content of the message template that applies to the WHATSAPP channel
  /// subtype.
  final WhatsAppMessageTemplateContent? whatsApp;

  MessageTemplateContentProvider({
    this.email,
    this.push,
    this.sms,
    this.whatsApp,
  });

  factory MessageTemplateContentProvider.fromJson(Map<String, dynamic> json) {
    return MessageTemplateContentProvider(
      email: json['email'] != null
          ? EmailMessageTemplateContent.fromJson(
              json['email'] as Map<String, dynamic>)
          : null,
      push: json['push'] != null
          ? PushMessageTemplateContent.fromJson(
              json['push'] as Map<String, dynamic>)
          : null,
      sms: json['sms'] != null
          ? SMSMessageTemplateContent.fromJson(
              json['sms'] as Map<String, dynamic>)
          : null,
      whatsApp: json['whatsApp'] != null
          ? WhatsAppMessageTemplateContent.fromJson(
              json['whatsApp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final push = this.push;
    final sms = this.sms;
    final whatsApp = this.whatsApp;
    return {
      if (email != null) 'email': email,
      if (push != null) 'push': push,
      if (sms != null) 'sms': sms,
      if (whatsApp != null) 'whatsApp': whatsApp,
    };
  }
}

/// The container of message template source configuration summary.
///
/// @nodoc
class MessageTemplateSourceConfigurationSummary {
  /// The sourceConfiguration summary of the message template that applies to the
  /// WHATSAPP channel subtype.
  final WhatsAppMessageTemplateSourceConfigurationSummary? whatsApp;

  MessageTemplateSourceConfigurationSummary({
    this.whatsApp,
  });

  factory MessageTemplateSourceConfigurationSummary.fromJson(
      Map<String, dynamic> json) {
    return MessageTemplateSourceConfigurationSummary(
      whatsApp: json['whatsApp'] != null
          ? WhatsAppMessageTemplateSourceConfigurationSummary.fromJson(
              json['whatsApp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final whatsApp = this.whatsApp;
    return {
      if (whatsApp != null) 'whatsApp': whatsApp,
    };
  }
}

/// The attributes that are used with the message template.
///
/// @nodoc
class MessageTemplateAttributes {
  /// The agent attributes that are used with the message template.
  final AgentAttributes? agentAttributes;

  /// The custom attributes that are used with the message template.
  final Map<String, String>? customAttributes;

  /// The customer profile attributes that are used with the message template.
  final CustomerProfileAttributes? customerProfileAttributes;

  /// The system attributes that are used with the message template.
  final SystemAttributes? systemAttributes;

  MessageTemplateAttributes({
    this.agentAttributes,
    this.customAttributes,
    this.customerProfileAttributes,
    this.systemAttributes,
  });

  factory MessageTemplateAttributes.fromJson(Map<String, dynamic> json) {
    return MessageTemplateAttributes(
      agentAttributes: json['agentAttributes'] != null
          ? AgentAttributes.fromJson(
              json['agentAttributes'] as Map<String, dynamic>)
          : null,
      customAttributes: (json['customAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      customerProfileAttributes: json['customerProfileAttributes'] != null
          ? CustomerProfileAttributes.fromJson(
              json['customerProfileAttributes'] as Map<String, dynamic>)
          : null,
      systemAttributes: json['systemAttributes'] != null
          ? SystemAttributes.fromJson(
              json['systemAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentAttributes = this.agentAttributes;
    final customAttributes = this.customAttributes;
    final customerProfileAttributes = this.customerProfileAttributes;
    final systemAttributes = this.systemAttributes;
    return {
      if (agentAttributes != null) 'agentAttributes': agentAttributes,
      if (customAttributes != null) 'customAttributes': customAttributes,
      if (customerProfileAttributes != null)
        'customerProfileAttributes': customerProfileAttributes,
      if (systemAttributes != null) 'systemAttributes': systemAttributes,
    };
  }
}

/// @nodoc
class MessageTemplateAttributeType {
  static const system = MessageTemplateAttributeType._('SYSTEM');
  static const agent = MessageTemplateAttributeType._('AGENT');
  static const customerProfile =
      MessageTemplateAttributeType._('CUSTOMER_PROFILE');
  static const custom = MessageTemplateAttributeType._('CUSTOM');

  final String value;

  const MessageTemplateAttributeType._(this.value);

  static const values = [system, agent, customerProfile, custom];

  static MessageTemplateAttributeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MessageTemplateAttributeType._(value));

  @override
  bool operator ==(other) =>
      other is MessageTemplateAttributeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The system attributes that are used with the message template.
///
/// @nodoc
class SystemAttributes {
  /// The CustomerEndpoint attribute.
  final SystemEndpointAttributes? customerEndpoint;

  /// The name of the task.
  final String? name;

  /// The SystemEndpoint attribute.
  final SystemEndpointAttributes? systemEndpoint;

  SystemAttributes({
    this.customerEndpoint,
    this.name,
    this.systemEndpoint,
  });

  factory SystemAttributes.fromJson(Map<String, dynamic> json) {
    return SystemAttributes(
      customerEndpoint: json['customerEndpoint'] != null
          ? SystemEndpointAttributes.fromJson(
              json['customerEndpoint'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      systemEndpoint: json['systemEndpoint'] != null
          ? SystemEndpointAttributes.fromJson(
              json['systemEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerEndpoint = this.customerEndpoint;
    final name = this.name;
    final systemEndpoint = this.systemEndpoint;
    return {
      if (customerEndpoint != null) 'customerEndpoint': customerEndpoint,
      if (name != null) 'name': name,
      if (systemEndpoint != null) 'systemEndpoint': systemEndpoint,
    };
  }
}

/// Information about an agent.
///
/// @nodoc
class AgentAttributes {
  /// The agent’s first name as entered in their Amazon Connect user account.
  final String? firstName;

  /// The agent’s last name as entered in their Amazon Connect user account.
  final String? lastName;

  AgentAttributes({
    this.firstName,
    this.lastName,
  });

  factory AgentAttributes.fromJson(Map<String, dynamic> json) {
    return AgentAttributes(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firstName = this.firstName;
    final lastName = this.lastName;
    return {
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
    };
  }
}

/// The customer profile attributes that are used with the message template.
///
/// @nodoc
class CustomerProfileAttributes {
  /// A unique account number that you have given to the customer.
  final String? accountNumber;

  /// Any additional information relevant to the customer's profile.
  final String? additionalInformation;

  /// The first line of a customer address.
  final String? address1;

  /// The second line of a customer address.
  final String? address2;

  /// The third line of a customer address.
  final String? address3;

  /// The fourth line of a customer address.
  final String? address4;

  /// The first line of a customer’s billing address.
  final String? billingAddress1;

  /// The second line of a customer’s billing address.
  final String? billingAddress2;

  /// The third line of a customer’s billing address.
  final String? billingAddress3;

  /// The fourth line of a customer’s billing address.
  final String? billingAddress4;

  /// The city of a customer’s billing address.
  final String? billingCity;

  /// The country of a customer’s billing address.
  final String? billingCountry;

  /// The county of a customer’s billing address.
  final String? billingCounty;

  /// The postal code of a customer’s billing address.
  final String? billingPostalCode;

  /// The province of a customer’s billing address.
  final String? billingProvince;

  /// The state of a customer’s billing address.
  final String? billingState;

  /// The customer's birth date.
  final String? birthDate;

  /// The customer's business email address.
  final String? businessEmailAddress;

  /// The name of the customer's business.
  final String? businessName;

  /// The customer's business phone number.
  final String? businessPhoneNumber;

  /// The city in which a customer lives.
  final String? city;

  /// The country in which a customer lives.
  final String? country;

  /// The county in which a customer lives.
  final String? county;

  /// The custom attributes in customer profile attributes.
  final Map<String, String>? custom;

  /// The customer's email address, which has not been specified as a personal or
  /// business address.
  final String? emailAddress;

  /// The customer's first name.
  final String? firstName;

  /// The customer's gender.
  final String? gender;

  /// The customer's mobile phone number.
  final String? homePhoneNumber;

  /// The customer's last name.
  final String? lastName;

  /// The first line of a customer’s mailing address.
  final String? mailingAddress1;

  /// The second line of a customer’s mailing address.
  final String? mailingAddress2;

  /// The third line of a customer’s mailing address.
  final String? mailingAddress3;

  /// The fourth line of a customer’s mailing address.
  final String? mailingAddress4;

  /// The city of a customer’s mailing address.
  final String? mailingCity;

  /// The country of a customer’s mailing address.
  final String? mailingCountry;

  /// The county of a customer’s mailing address.
  final String? mailingCounty;

  /// The postal code of a customer’s mailing address.
  final String? mailingPostalCode;

  /// The province of a customer’s mailing address.
  final String? mailingProvince;

  /// The state of a customer’s mailing address.
  final String? mailingState;

  /// The customer's middle name.
  final String? middleName;

  /// The customer's mobile phone number.
  final String? mobilePhoneNumber;

  /// The customer's party type.
  final String? partyType;

  /// The customer's phone number, which has not been specified as a mobile, home,
  /// or business number.
  final String? phoneNumber;

  /// The postal code of a customer address.
  final String? postalCode;

  /// The ARN of a customer profile.
  final String? profileARN;

  /// The unique identifier of a customer profile.
  final String? profileId;

  /// The province in which a customer lives.
  final String? province;

  /// The first line of a customer’s shipping address.
  final String? shippingAddress1;

  /// The second line of a customer’s shipping address.
  final String? shippingAddress2;

  /// The third line of a customer’s shipping address.
  final String? shippingAddress3;

  /// The fourth line of a customer’s shipping address.
  final String? shippingAddress4;

  /// The city of a customer’s shipping address.
  final String? shippingCity;

  /// The country of a customer’s shipping address.
  final String? shippingCountry;

  /// The county of a customer’s shipping address.
  final String? shippingCounty;

  /// The postal code of a customer’s shipping address.
  final String? shippingPostalCode;

  /// The province of a customer’s shipping address.
  final String? shippingProvince;

  /// The state of a customer’s shipping address.
  final String? shippingState;

  /// The state in which a customer lives.
  final String? state;

  CustomerProfileAttributes({
    this.accountNumber,
    this.additionalInformation,
    this.address1,
    this.address2,
    this.address3,
    this.address4,
    this.billingAddress1,
    this.billingAddress2,
    this.billingAddress3,
    this.billingAddress4,
    this.billingCity,
    this.billingCountry,
    this.billingCounty,
    this.billingPostalCode,
    this.billingProvince,
    this.billingState,
    this.birthDate,
    this.businessEmailAddress,
    this.businessName,
    this.businessPhoneNumber,
    this.city,
    this.country,
    this.county,
    this.custom,
    this.emailAddress,
    this.firstName,
    this.gender,
    this.homePhoneNumber,
    this.lastName,
    this.mailingAddress1,
    this.mailingAddress2,
    this.mailingAddress3,
    this.mailingAddress4,
    this.mailingCity,
    this.mailingCountry,
    this.mailingCounty,
    this.mailingPostalCode,
    this.mailingProvince,
    this.mailingState,
    this.middleName,
    this.mobilePhoneNumber,
    this.partyType,
    this.phoneNumber,
    this.postalCode,
    this.profileARN,
    this.profileId,
    this.province,
    this.shippingAddress1,
    this.shippingAddress2,
    this.shippingAddress3,
    this.shippingAddress4,
    this.shippingCity,
    this.shippingCountry,
    this.shippingCounty,
    this.shippingPostalCode,
    this.shippingProvince,
    this.shippingState,
    this.state,
  });

  factory CustomerProfileAttributes.fromJson(Map<String, dynamic> json) {
    return CustomerProfileAttributes(
      accountNumber: json['accountNumber'] as String?,
      additionalInformation: json['additionalInformation'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      address3: json['address3'] as String?,
      address4: json['address4'] as String?,
      billingAddress1: json['billingAddress1'] as String?,
      billingAddress2: json['billingAddress2'] as String?,
      billingAddress3: json['billingAddress3'] as String?,
      billingAddress4: json['billingAddress4'] as String?,
      billingCity: json['billingCity'] as String?,
      billingCountry: json['billingCountry'] as String?,
      billingCounty: json['billingCounty'] as String?,
      billingPostalCode: json['billingPostalCode'] as String?,
      billingProvince: json['billingProvince'] as String?,
      billingState: json['billingState'] as String?,
      birthDate: json['birthDate'] as String?,
      businessEmailAddress: json['businessEmailAddress'] as String?,
      businessName: json['businessName'] as String?,
      businessPhoneNumber: json['businessPhoneNumber'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      county: json['county'] as String?,
      custom: (json['custom'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      emailAddress: json['emailAddress'] as String?,
      firstName: json['firstName'] as String?,
      gender: json['gender'] as String?,
      homePhoneNumber: json['homePhoneNumber'] as String?,
      lastName: json['lastName'] as String?,
      mailingAddress1: json['mailingAddress1'] as String?,
      mailingAddress2: json['mailingAddress2'] as String?,
      mailingAddress3: json['mailingAddress3'] as String?,
      mailingAddress4: json['mailingAddress4'] as String?,
      mailingCity: json['mailingCity'] as String?,
      mailingCountry: json['mailingCountry'] as String?,
      mailingCounty: json['mailingCounty'] as String?,
      mailingPostalCode: json['mailingPostalCode'] as String?,
      mailingProvince: json['mailingProvince'] as String?,
      mailingState: json['mailingState'] as String?,
      middleName: json['middleName'] as String?,
      mobilePhoneNumber: json['mobilePhoneNumber'] as String?,
      partyType: json['partyType'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      postalCode: json['postalCode'] as String?,
      profileARN: json['profileARN'] as String?,
      profileId: json['profileId'] as String?,
      province: json['province'] as String?,
      shippingAddress1: json['shippingAddress1'] as String?,
      shippingAddress2: json['shippingAddress2'] as String?,
      shippingAddress3: json['shippingAddress3'] as String?,
      shippingAddress4: json['shippingAddress4'] as String?,
      shippingCity: json['shippingCity'] as String?,
      shippingCountry: json['shippingCountry'] as String?,
      shippingCounty: json['shippingCounty'] as String?,
      shippingPostalCode: json['shippingPostalCode'] as String?,
      shippingProvince: json['shippingProvince'] as String?,
      shippingState: json['shippingState'] as String?,
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountNumber = this.accountNumber;
    final additionalInformation = this.additionalInformation;
    final address1 = this.address1;
    final address2 = this.address2;
    final address3 = this.address3;
    final address4 = this.address4;
    final billingAddress1 = this.billingAddress1;
    final billingAddress2 = this.billingAddress2;
    final billingAddress3 = this.billingAddress3;
    final billingAddress4 = this.billingAddress4;
    final billingCity = this.billingCity;
    final billingCountry = this.billingCountry;
    final billingCounty = this.billingCounty;
    final billingPostalCode = this.billingPostalCode;
    final billingProvince = this.billingProvince;
    final billingState = this.billingState;
    final birthDate = this.birthDate;
    final businessEmailAddress = this.businessEmailAddress;
    final businessName = this.businessName;
    final businessPhoneNumber = this.businessPhoneNumber;
    final city = this.city;
    final country = this.country;
    final county = this.county;
    final custom = this.custom;
    final emailAddress = this.emailAddress;
    final firstName = this.firstName;
    final gender = this.gender;
    final homePhoneNumber = this.homePhoneNumber;
    final lastName = this.lastName;
    final mailingAddress1 = this.mailingAddress1;
    final mailingAddress2 = this.mailingAddress2;
    final mailingAddress3 = this.mailingAddress3;
    final mailingAddress4 = this.mailingAddress4;
    final mailingCity = this.mailingCity;
    final mailingCountry = this.mailingCountry;
    final mailingCounty = this.mailingCounty;
    final mailingPostalCode = this.mailingPostalCode;
    final mailingProvince = this.mailingProvince;
    final mailingState = this.mailingState;
    final middleName = this.middleName;
    final mobilePhoneNumber = this.mobilePhoneNumber;
    final partyType = this.partyType;
    final phoneNumber = this.phoneNumber;
    final postalCode = this.postalCode;
    final profileARN = this.profileARN;
    final profileId = this.profileId;
    final province = this.province;
    final shippingAddress1 = this.shippingAddress1;
    final shippingAddress2 = this.shippingAddress2;
    final shippingAddress3 = this.shippingAddress3;
    final shippingAddress4 = this.shippingAddress4;
    final shippingCity = this.shippingCity;
    final shippingCountry = this.shippingCountry;
    final shippingCounty = this.shippingCounty;
    final shippingPostalCode = this.shippingPostalCode;
    final shippingProvince = this.shippingProvince;
    final shippingState = this.shippingState;
    final state = this.state;
    return {
      if (accountNumber != null) 'accountNumber': accountNumber,
      if (additionalInformation != null)
        'additionalInformation': additionalInformation,
      if (address1 != null) 'address1': address1,
      if (address2 != null) 'address2': address2,
      if (address3 != null) 'address3': address3,
      if (address4 != null) 'address4': address4,
      if (billingAddress1 != null) 'billingAddress1': billingAddress1,
      if (billingAddress2 != null) 'billingAddress2': billingAddress2,
      if (billingAddress3 != null) 'billingAddress3': billingAddress3,
      if (billingAddress4 != null) 'billingAddress4': billingAddress4,
      if (billingCity != null) 'billingCity': billingCity,
      if (billingCountry != null) 'billingCountry': billingCountry,
      if (billingCounty != null) 'billingCounty': billingCounty,
      if (billingPostalCode != null) 'billingPostalCode': billingPostalCode,
      if (billingProvince != null) 'billingProvince': billingProvince,
      if (billingState != null) 'billingState': billingState,
      if (birthDate != null) 'birthDate': birthDate,
      if (businessEmailAddress != null)
        'businessEmailAddress': businessEmailAddress,
      if (businessName != null) 'businessName': businessName,
      if (businessPhoneNumber != null)
        'businessPhoneNumber': businessPhoneNumber,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (county != null) 'county': county,
      if (custom != null) 'custom': custom,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (firstName != null) 'firstName': firstName,
      if (gender != null) 'gender': gender,
      if (homePhoneNumber != null) 'homePhoneNumber': homePhoneNumber,
      if (lastName != null) 'lastName': lastName,
      if (mailingAddress1 != null) 'mailingAddress1': mailingAddress1,
      if (mailingAddress2 != null) 'mailingAddress2': mailingAddress2,
      if (mailingAddress3 != null) 'mailingAddress3': mailingAddress3,
      if (mailingAddress4 != null) 'mailingAddress4': mailingAddress4,
      if (mailingCity != null) 'mailingCity': mailingCity,
      if (mailingCountry != null) 'mailingCountry': mailingCountry,
      if (mailingCounty != null) 'mailingCounty': mailingCounty,
      if (mailingPostalCode != null) 'mailingPostalCode': mailingPostalCode,
      if (mailingProvince != null) 'mailingProvince': mailingProvince,
      if (mailingState != null) 'mailingState': mailingState,
      if (middleName != null) 'middleName': middleName,
      if (mobilePhoneNumber != null) 'mobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'partyType': partyType,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (postalCode != null) 'postalCode': postalCode,
      if (profileARN != null) 'profileARN': profileARN,
      if (profileId != null) 'profileId': profileId,
      if (province != null) 'province': province,
      if (shippingAddress1 != null) 'shippingAddress1': shippingAddress1,
      if (shippingAddress2 != null) 'shippingAddress2': shippingAddress2,
      if (shippingAddress3 != null) 'shippingAddress3': shippingAddress3,
      if (shippingAddress4 != null) 'shippingAddress4': shippingAddress4,
      if (shippingCity != null) 'shippingCity': shippingCity,
      if (shippingCountry != null) 'shippingCountry': shippingCountry,
      if (shippingCounty != null) 'shippingCounty': shippingCounty,
      if (shippingPostalCode != null) 'shippingPostalCode': shippingPostalCode,
      if (shippingProvince != null) 'shippingProvince': shippingProvince,
      if (shippingState != null) 'shippingState': shippingState,
      if (state != null) 'state': state,
    };
  }
}

/// The system endpoint attributes that are used with the message template.
///
/// @nodoc
class SystemEndpointAttributes {
  /// The customer's phone number if used with <code>customerEndpoint</code>, or
  /// the number the customer dialed to call your contact center if used with
  /// <code>systemEndpoint</code>.
  final String? address;

  SystemEndpointAttributes({
    this.address,
  });

  factory SystemEndpointAttributes.fromJson(Map<String, dynamic> json) {
    return SystemEndpointAttributes(
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    return {
      if (address != null) 'address': address,
    };
  }
}

/// Configuration information about the external data source.
///
/// @nodoc
class WhatsAppMessageTemplateSourceConfigurationSummary {
  /// The ID of the End User Messaging WhatsApp Business Account to associate with
  /// this template.
  final String businessAccountId;

  /// The ID of WhatsApp template.
  final String templateId;

  /// The list of component mapping from WhatsApp template parameters to Message
  /// Template attributes.
  final List<String>? components;

  /// The language of the WhatsApp template.
  final String? language;

  /// The name of the WhatsApp template.
  final String? name;

  /// The status of the message template.
  final WhatsAppSourceConfigurationStatus? status;

  /// The status reason of the message template.
  final String? statusReason;

  WhatsAppMessageTemplateSourceConfigurationSummary({
    required this.businessAccountId,
    required this.templateId,
    this.components,
    this.language,
    this.name,
    this.status,
    this.statusReason,
  });

  factory WhatsAppMessageTemplateSourceConfigurationSummary.fromJson(
      Map<String, dynamic> json) {
    return WhatsAppMessageTemplateSourceConfigurationSummary(
      businessAccountId: (json['businessAccountId'] as String?) ?? '',
      templateId: (json['templateId'] as String?) ?? '',
      components: (json['components'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      language: json['language'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)
          ?.let(WhatsAppSourceConfigurationStatus.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final businessAccountId = this.businessAccountId;
    final templateId = this.templateId;
    final components = this.components;
    final language = this.language;
    final name = this.name;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'businessAccountId': businessAccountId,
      'templateId': templateId,
      if (components != null) 'components': components,
      if (language != null) 'language': language,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// @nodoc
class WhatsAppSourceConfigurationStatus {
  static const valid = WhatsAppSourceConfigurationStatus._('VALID');
  static const invalid = WhatsAppSourceConfigurationStatus._('INVALID');
  static const rejected = WhatsAppSourceConfigurationStatus._('REJECTED');

  final String value;

  const WhatsAppSourceConfigurationStatus._(this.value);

  static const values = [valid, invalid, rejected];

  static WhatsAppSourceConfigurationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WhatsAppSourceConfigurationStatus._(value));

  @override
  bool operator ==(other) =>
      other is WhatsAppSourceConfigurationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The content of the message template that applies to the email channel
/// subtype.
///
/// @nodoc
class EmailMessageTemplateContent {
  /// The body to use in email messages.
  final EmailMessageTemplateContentBody? body;

  /// The email headers to include in email messages.
  final List<EmailHeader>? headers;

  /// The subject line, or title, to use in email messages.
  final String? subject;

  EmailMessageTemplateContent({
    this.body,
    this.headers,
    this.subject,
  });

  factory EmailMessageTemplateContent.fromJson(Map<String, dynamic> json) {
    return EmailMessageTemplateContent(
      body: json['body'] != null
          ? EmailMessageTemplateContentBody.fromJson(
              json['body'] as Map<String, dynamic>)
          : null,
      headers: (json['headers'] as List?)
          ?.nonNulls
          .map((e) => EmailHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: json['subject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final headers = this.headers;
    final subject = this.subject;
    return {
      if (body != null) 'body': body,
      if (headers != null) 'headers': headers,
      if (subject != null) 'subject': subject,
    };
  }
}

/// The content of the message template that applies to the SMS channel subtype.
///
/// @nodoc
class SMSMessageTemplateContent {
  /// The body to use in SMS messages.
  final SMSMessageTemplateContentBody? body;

  SMSMessageTemplateContent({
    this.body,
  });

  factory SMSMessageTemplateContent.fromJson(Map<String, dynamic> json) {
    return SMSMessageTemplateContent(
      body: json['body'] != null
          ? SMSMessageTemplateContentBody.fromJson(
              json['body'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    return {
      if (body != null) 'body': body,
    };
  }
}

/// The content of the message template that applies to the WHATSAPP channel
/// subtype.
///
/// @nodoc
class WhatsAppMessageTemplateContent {
  /// The data.
  final String? data;

  WhatsAppMessageTemplateContent({
    this.data,
  });

  factory WhatsAppMessageTemplateContent.fromJson(Map<String, dynamic> json) {
    return WhatsAppMessageTemplateContent(
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'data': data,
    };
  }
}

/// The content of the message template that applies to the push channel
/// subtype.
///
/// @nodoc
class PushMessageTemplateContent {
  /// The content of the message template that applies to ADM (Amazon Device
  /// Messaging) notification service.
  final PushADMMessageTemplateContent? adm;

  /// The content of the message template that applies to APNS(Apple Push
  /// Notification service) notification service.
  final PushAPNSMessageTemplateContent? apns;

  /// The content of the message template that applies to Baidu notification
  /// service.
  final PushBaiduMessageTemplateContent? baidu;

  /// The content of the message template that applies to FCM (Firebase Cloud
  /// Messaging) notification service.
  final PushFCMMessageTemplateContent? fcm;

  PushMessageTemplateContent({
    this.adm,
    this.apns,
    this.baidu,
    this.fcm,
  });

  factory PushMessageTemplateContent.fromJson(Map<String, dynamic> json) {
    return PushMessageTemplateContent(
      adm: json['adm'] != null
          ? PushADMMessageTemplateContent.fromJson(
              json['adm'] as Map<String, dynamic>)
          : null,
      apns: json['apns'] != null
          ? PushAPNSMessageTemplateContent.fromJson(
              json['apns'] as Map<String, dynamic>)
          : null,
      baidu: json['baidu'] != null
          ? PushBaiduMessageTemplateContent.fromJson(
              json['baidu'] as Map<String, dynamic>)
          : null,
      fcm: json['fcm'] != null
          ? PushFCMMessageTemplateContent.fromJson(
              json['fcm'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final adm = this.adm;
    final apns = this.apns;
    final baidu = this.baidu;
    final fcm = this.fcm;
    return {
      if (adm != null) 'adm': adm,
      if (apns != null) 'apns': apns,
      if (baidu != null) 'baidu': baidu,
      if (fcm != null) 'fcm': fcm,
    };
  }
}

/// The content of the push message template that applies to ADM (Amazon Device
/// Messaging) notification service.
///
/// @nodoc
class PushADMMessageTemplateContent {
  /// The action to occur if a recipient taps a push notification that is based on
  /// the message template. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>OPEN_APP</code> - Your app opens or it becomes the foreground app if
  /// it was sent to the background. This is the default action.
  /// </li>
  /// <li>
  /// <code>DEEP_LINK</code> - Your app opens and displays a designated user
  /// interface in the app. This action uses the deep-linking features of the
  /// Android platform.
  /// </li>
  /// <li>
  /// <code>URL</code> - The default mobile browser on the recipient's device
  /// opens and loads the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final PushMessageAction? action;

  /// The message body to use in a push notification that is based on the message
  /// template.
  final MessageTemplateBodyContentProvider? body;

  /// The URL of the large icon image to display in the content view of a push
  /// notification that's based on the message template.
  final String? imageIconUrl;

  /// The URL of an image to display in a push notification that's based on the
  /// message template.
  final String? imageUrl;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of a push notification that's based on the message template.
  final MessageTemplateBodyContentProvider? rawContent;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of a push notification that's based on the message template.
  final String? smallImageIconUrl;

  /// The sound to play when a recipient receives a push notification that's based
  /// on the message template. You can use the default stream or specify the file
  /// name of a sound resource that's bundled in your app. On an Android platform,
  /// the sound file must reside in <code>/res/raw/</code>.
  final String? sound;

  /// The title to use in a push notification that's based on the message
  /// template. This title appears above the notification message on a recipient's
  /// device.
  final String? title;

  /// The URL to open in a recipient's default mobile browser, if a recipient taps
  /// a push notification that's based on the message template and the value of
  /// the <code>action</code> property is <code>URL</code>.
  final String? url;

  PushADMMessageTemplateContent({
    this.action,
    this.body,
    this.imageIconUrl,
    this.imageUrl,
    this.rawContent,
    this.smallImageIconUrl,
    this.sound,
    this.title,
    this.url,
  });

  factory PushADMMessageTemplateContent.fromJson(Map<String, dynamic> json) {
    return PushADMMessageTemplateContent(
      action: (json['action'] as String?)?.let(PushMessageAction.fromString),
      body: json['body'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['body'] as Map<String, dynamic>)
          : null,
      imageIconUrl: json['imageIconUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      rawContent: json['rawContent'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['rawContent'] as Map<String, dynamic>)
          : null,
      smallImageIconUrl: json['smallImageIconUrl'] as String?,
      sound: json['sound'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final imageIconUrl = this.imageIconUrl;
    final imageUrl = this.imageUrl;
    final rawContent = this.rawContent;
    final smallImageIconUrl = this.smallImageIconUrl;
    final sound = this.sound;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'action': action.value,
      if (body != null) 'body': body,
      if (imageIconUrl != null) 'imageIconUrl': imageIconUrl,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (rawContent != null) 'rawContent': rawContent,
      if (smallImageIconUrl != null) 'smallImageIconUrl': smallImageIconUrl,
      if (sound != null) 'sound': sound,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
    };
  }
}

/// The content of the push message template that applies to APNS (Apple Push
/// Notification service) notification service.
///
/// @nodoc
class PushAPNSMessageTemplateContent {
  /// The action to occur if a recipient taps a push notification that is based on
  /// the message template. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>OPEN_APP</code> - Your app opens or it becomes the foreground app if
  /// it was sent to the background. This is the default action.
  /// </li>
  /// <li>
  /// <code>DEEP_LINK</code> - Your app opens and displays a designated user
  /// interface in the app. This action uses the deep-linking features of the iOS
  /// platform.
  /// </li>
  /// <li>
  /// <code>URL</code> - The default mobile browser on the recipient's device
  /// opens and loads the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final PushMessageAction? action;

  /// The message body to use in a push notification that is based on the message
  /// template.
  final MessageTemplateBodyContentProvider? body;

  /// The URL of an image or video to display in push notifications that are based
  /// on the message template.
  final String? mediaUrl;

  /// The raw, JSON-formatted string to use as the payload for a push notification
  /// that's based on the message template. If specified, this value overrides all
  /// other content for the message template.
  final MessageTemplateBodyContentProvider? rawContent;

  /// The key for the sound to play when the recipient receives a push
  /// notification that's based on the message template. The value for this key is
  /// the name of a sound file in your app's main bundle or the
  /// <code>Library/Sounds</code> folder in your app's data container. If the
  /// sound file can't be found or you specify <code>default</code> for the value,
  /// the system plays the default alert sound.
  final String? sound;

  /// The title to use in a push notification that's based on the message
  /// template. This title appears above the notification message on a recipient's
  /// device.
  final String? title;

  /// The URL to open in a recipient's default mobile browser, if a recipient taps
  /// a push notification that's based on the message template and the value of
  /// the <code>action</code> property is <code>URL</code>.
  final String? url;

  PushAPNSMessageTemplateContent({
    this.action,
    this.body,
    this.mediaUrl,
    this.rawContent,
    this.sound,
    this.title,
    this.url,
  });

  factory PushAPNSMessageTemplateContent.fromJson(Map<String, dynamic> json) {
    return PushAPNSMessageTemplateContent(
      action: (json['action'] as String?)?.let(PushMessageAction.fromString),
      body: json['body'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['body'] as Map<String, dynamic>)
          : null,
      mediaUrl: json['mediaUrl'] as String?,
      rawContent: json['rawContent'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['rawContent'] as Map<String, dynamic>)
          : null,
      sound: json['sound'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final mediaUrl = this.mediaUrl;
    final rawContent = this.rawContent;
    final sound = this.sound;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'action': action.value,
      if (body != null) 'body': body,
      if (mediaUrl != null) 'mediaUrl': mediaUrl,
      if (rawContent != null) 'rawContent': rawContent,
      if (sound != null) 'sound': sound,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
    };
  }
}

/// The content of the push message template that applies to FCM (Firebase Cloud
/// Messaging) notification service.
///
/// @nodoc
class PushFCMMessageTemplateContent {
  /// The action to occur if a recipient taps a push notification that is based on
  /// the message template. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>OPEN_APP</code> - Your app opens or it becomes the foreground app if
  /// it was sent to the background. This is the default action.
  /// </li>
  /// <li>
  /// <code>DEEP_LINK</code> - Your app opens and displays a designated user
  /// interface in the app. This action uses the deep-linking features of the
  /// Android platform.
  /// </li>
  /// <li>
  /// <code>URL</code> - The default mobile browser on the recipient's device
  /// opens and loads the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final PushMessageAction? action;

  /// The message body to use in a push notification that is based on the message
  /// template.
  final MessageTemplateBodyContentProvider? body;

  /// The URL of the large icon image to display in the content view of a push
  /// notification that's based on the message template.
  final String? imageIconUrl;

  /// The URL of an image to display in a push notification that's based on the
  /// message template.
  final String? imageUrl;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of a push notification that's based on the message template.
  final MessageTemplateBodyContentProvider? rawContent;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of a push notification that's based on the message template.
  final String? smallImageIconUrl;

  /// The sound to play when a recipient receives a push notification that's based
  /// on the message template. You can use the default stream or specify the file
  /// name of a sound resource that's bundled in your app. On an Android platform,
  /// the sound file must reside in <code>/res/raw/</code>.
  final String? sound;

  /// The title to use in a push notification that's based on the message
  /// template. This title appears above the notification message on a recipient's
  /// device.
  final String? title;

  /// The URL to open in a recipient's default mobile browser, if a recipient taps
  /// a push notification that's based on the message template and the value of
  /// the <code>action</code> property is <code>URL</code>.
  final String? url;

  PushFCMMessageTemplateContent({
    this.action,
    this.body,
    this.imageIconUrl,
    this.imageUrl,
    this.rawContent,
    this.smallImageIconUrl,
    this.sound,
    this.title,
    this.url,
  });

  factory PushFCMMessageTemplateContent.fromJson(Map<String, dynamic> json) {
    return PushFCMMessageTemplateContent(
      action: (json['action'] as String?)?.let(PushMessageAction.fromString),
      body: json['body'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['body'] as Map<String, dynamic>)
          : null,
      imageIconUrl: json['imageIconUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      rawContent: json['rawContent'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['rawContent'] as Map<String, dynamic>)
          : null,
      smallImageIconUrl: json['smallImageIconUrl'] as String?,
      sound: json['sound'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final imageIconUrl = this.imageIconUrl;
    final imageUrl = this.imageUrl;
    final rawContent = this.rawContent;
    final smallImageIconUrl = this.smallImageIconUrl;
    final sound = this.sound;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'action': action.value,
      if (body != null) 'body': body,
      if (imageIconUrl != null) 'imageIconUrl': imageIconUrl,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (rawContent != null) 'rawContent': rawContent,
      if (smallImageIconUrl != null) 'smallImageIconUrl': smallImageIconUrl,
      if (sound != null) 'sound': sound,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
    };
  }
}

/// The content of the push message template that applies to Baidu notification
/// service.
///
/// @nodoc
class PushBaiduMessageTemplateContent {
  /// The action to occur if a recipient taps a push notification that is based on
  /// the message template. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>OPEN_APP</code> - Your app opens or it becomes the foreground app if
  /// it was sent to the background. This is the default action.
  /// </li>
  /// <li>
  /// <code>DEEP_LINK</code> - Your app opens and displays a designated user
  /// interface in the app. This action uses the deep-linking features of the
  /// Android platform.
  /// </li>
  /// <li>
  /// <code>URL</code> - The default mobile browser on the recipient's device
  /// opens and loads the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final PushMessageAction? action;

  /// The message body to use in a push notification that is based on the message
  /// template.
  final MessageTemplateBodyContentProvider? body;

  /// The URL of the large icon image to display in the content view of a push
  /// notification that's based on the message template.
  final String? imageIconUrl;

  /// The URL of an image to display in a push notification that's based on the
  /// message template.
  final String? imageUrl;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of a push notification that's based on the message template.
  final MessageTemplateBodyContentProvider? rawContent;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of a push notification that's based on the message template.
  final String? smallImageIconUrl;

  /// The sound to play when a recipient receives a push notification that's based
  /// on the message template. You can use the default stream or specify the file
  /// name of a sound resource that's bundled in your app. On an Android platform,
  /// the sound file must reside in <code>/res/raw/</code>.
  final String? sound;

  /// The title to use in a push notification that's based on the message
  /// template. This title appears above the notification message on a recipient's
  /// device.
  final String? title;

  /// The URL to open in a recipient's default mobile browser, if a recipient taps
  /// a push notification that's based on the message template and the value of
  /// the <code>action</code> property is <code>URL</code>.
  final String? url;

  PushBaiduMessageTemplateContent({
    this.action,
    this.body,
    this.imageIconUrl,
    this.imageUrl,
    this.rawContent,
    this.smallImageIconUrl,
    this.sound,
    this.title,
    this.url,
  });

  factory PushBaiduMessageTemplateContent.fromJson(Map<String, dynamic> json) {
    return PushBaiduMessageTemplateContent(
      action: (json['action'] as String?)?.let(PushMessageAction.fromString),
      body: json['body'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['body'] as Map<String, dynamic>)
          : null,
      imageIconUrl: json['imageIconUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      rawContent: json['rawContent'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['rawContent'] as Map<String, dynamic>)
          : null,
      smallImageIconUrl: json['smallImageIconUrl'] as String?,
      sound: json['sound'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final imageIconUrl = this.imageIconUrl;
    final imageUrl = this.imageUrl;
    final rawContent = this.rawContent;
    final smallImageIconUrl = this.smallImageIconUrl;
    final sound = this.sound;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'action': action.value,
      if (body != null) 'body': body,
      if (imageIconUrl != null) 'imageIconUrl': imageIconUrl,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (rawContent != null) 'rawContent': rawContent,
      if (smallImageIconUrl != null) 'smallImageIconUrl': smallImageIconUrl,
      if (sound != null) 'sound': sound,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
    };
  }
}

/// The container of the message template body.
///
/// @nodoc
class MessageTemplateBodyContentProvider {
  /// The content of the message template.
  final String? content;

  MessageTemplateBodyContentProvider({
    this.content,
  });

  factory MessageTemplateBodyContentProvider.fromJson(
      Map<String, dynamic> json) {
    return MessageTemplateBodyContentProvider(
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    return {
      if (content != null) 'content': content,
    };
  }
}

/// @nodoc
class PushMessageAction {
  static const openApp = PushMessageAction._('OPEN_APP');
  static const deepLink = PushMessageAction._('DEEP_LINK');
  static const url = PushMessageAction._('URL');

  final String value;

  const PushMessageAction._(this.value);

  static const values = [openApp, deepLink, url];

  static PushMessageAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PushMessageAction._(value));

  @override
  bool operator ==(other) => other is PushMessageAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The body to use in SMS messages.
///
/// @nodoc
class SMSMessageTemplateContentBody {
  /// The message body to use in SMS messages.
  final MessageTemplateBodyContentProvider? plainText;

  SMSMessageTemplateContentBody({
    this.plainText,
  });

  factory SMSMessageTemplateContentBody.fromJson(Map<String, dynamic> json) {
    return SMSMessageTemplateContentBody(
      plainText: json['plainText'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['plainText'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final plainText = this.plainText;
    return {
      if (plainText != null) 'plainText': plainText,
    };
  }
}

/// The body to use in email messages.
///
/// @nodoc
class EmailMessageTemplateContentBody {
  /// The message body, in HTML format, to use in email messages that are based on
  /// the message template. We recommend using HTML format for email clients that
  /// render HTML content. You can include links, formatted text, and more in an
  /// HTML message.
  final MessageTemplateBodyContentProvider? html;

  /// The message body, in plain text format, to use in email messages that are
  /// based on the message template. We recommend using plain text format for
  /// email clients that don't render HTML content and clients that are connected
  /// to high-latency networks, such as mobile devices.
  final MessageTemplateBodyContentProvider? plainText;

  EmailMessageTemplateContentBody({
    this.html,
    this.plainText,
  });

  factory EmailMessageTemplateContentBody.fromJson(Map<String, dynamic> json) {
    return EmailMessageTemplateContentBody(
      html: json['html'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['html'] as Map<String, dynamic>)
          : null,
      plainText: json['plainText'] != null
          ? MessageTemplateBodyContentProvider.fromJson(
              json['plainText'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final html = this.html;
    final plainText = this.plainText;
    return {
      if (html != null) 'html': html,
      if (plainText != null) 'plainText': plainText,
    };
  }
}

/// The email header to include in email messages.
///
/// @nodoc
class EmailHeader {
  /// The name of the email header.
  final String? name;

  /// The value of the email header.
  final String? value;

  EmailHeader({
    this.name,
    this.value,
  });

  factory EmailHeader.fromJson(Map<String, dynamic> json) {
    return EmailHeader(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// Information about the message template attachment.
///
/// @nodoc
class MessageTemplateAttachment {
  /// The identifier of the attachment file.
  final String attachmentId;

  /// The presentation information for the attachment file.
  final ContentDisposition contentDisposition;

  /// The name of the attachment file being uploaded. The name should include the
  /// file extension.
  final String name;

  /// The timestamp when the attachment file was uploaded.
  final DateTime uploadedTime;

  /// A pre-signed Amazon S3 URL that can be used to download the attachment file.
  final String url;

  /// The expiration time of the pre-signed Amazon S3 URL.
  final DateTime urlExpiry;

  MessageTemplateAttachment({
    required this.attachmentId,
    required this.contentDisposition,
    required this.name,
    required this.uploadedTime,
    required this.url,
    required this.urlExpiry,
  });

  factory MessageTemplateAttachment.fromJson(Map<String, dynamic> json) {
    return MessageTemplateAttachment(
      attachmentId: (json['attachmentId'] as String?) ?? '',
      contentDisposition: ContentDisposition.fromString(
          (json['contentDisposition'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      uploadedTime: nonNullableTimeStampFromJson(json['uploadedTime'] ?? 0),
      url: (json['url'] as String?) ?? '',
      urlExpiry: nonNullableTimeStampFromJson(json['urlExpiry'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final contentDisposition = this.contentDisposition;
    final name = this.name;
    final uploadedTime = this.uploadedTime;
    final url = this.url;
    final urlExpiry = this.urlExpiry;
    return {
      'attachmentId': attachmentId,
      'contentDisposition': contentDisposition.value,
      'name': name,
      'uploadedTime': iso8601ToJson(uploadedTime),
      'url': url,
      'urlExpiry': iso8601ToJson(urlExpiry),
    };
  }
}

/// @nodoc
class ContentDisposition {
  static const attachment = ContentDisposition._('ATTACHMENT');

  final String value;

  const ContentDisposition._(this.value);

  static const values = [attachment];

  static ContentDisposition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentDisposition._(value));

  @override
  bool operator ==(other) =>
      other is ContentDisposition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of the message template version.
///
/// @nodoc
class MessageTemplateVersionSummary {
  /// The channel subtype this message template applies to.
  final ChannelSubtype channelSubtype;

  /// Whether the version of the message template is activated.
  final bool isActive;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The Amazon Resource Name (ARN) of the message template.
  final String messageTemplateArn;

  /// The identifier of the message template.
  final String messageTemplateId;

  /// The name of the message template.
  final String name;

  /// The version number of the message template version.
  final int versionNumber;

  /// The channel of the message template.
  final String? channel;

  MessageTemplateVersionSummary({
    required this.channelSubtype,
    required this.isActive,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.messageTemplateArn,
    required this.messageTemplateId,
    required this.name,
    required this.versionNumber,
    this.channel,
  });

  factory MessageTemplateVersionSummary.fromJson(Map<String, dynamic> json) {
    return MessageTemplateVersionSummary(
      channelSubtype:
          ChannelSubtype.fromString((json['channelSubtype'] as String?) ?? ''),
      isActive: (json['isActive'] as bool?) ?? false,
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      messageTemplateArn: (json['messageTemplateArn'] as String?) ?? '',
      messageTemplateId: (json['messageTemplateId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      versionNumber: (json['versionNumber'] as int?) ?? 0,
      channel: json['channel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelSubtype = this.channelSubtype;
    final isActive = this.isActive;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final messageTemplateArn = this.messageTemplateArn;
    final messageTemplateId = this.messageTemplateId;
    final name = this.name;
    final versionNumber = this.versionNumber;
    final channel = this.channel;
    return {
      'channelSubtype': channelSubtype.value,
      'isActive': isActive,
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'messageTemplateArn': messageTemplateArn,
      'messageTemplateId': messageTemplateId,
      'name': name,
      'versionNumber': versionNumber,
      if (channel != null) 'channel': channel,
    };
  }
}

/// The extended data of a message template.
///
/// @nodoc
class ExtendedMessageTemplateData {
  /// The channel subtype this message template applies to.
  final ChannelSubtype channelSubtype;

  /// The timestamp when the message template was created.
  final DateTime createdTime;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The Amazon Resource Name (ARN) of the user who last updated the message
  /// template data.
  final String lastModifiedBy;

  /// The timestamp when the message template data was last modified.
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the message template.
  final String messageTemplateArn;

  /// The checksum value of the message template content that is referenced by the
  /// <code>$LATEST</code> qualifier. It can be returned in
  /// <code>MessageTemplateData</code> or
  /// <code>ExtendedMessageTemplateData</code>. It’s calculated by content,
  /// language, <code>defaultAttributes</code> and <code>Attachments</code> of the
  /// message template.
  final String messageTemplateContentSha256;

  /// The identifier of the message template.
  final String messageTemplateId;

  /// The name of the message template.
  final String name;

  /// The message template attachments.
  final List<MessageTemplateAttachment>? attachments;

  /// The types of attributes contain the message template.
  final List<MessageTemplateAttributeType>? attributeTypes;

  /// The channel of the message template.
  final String? channel;

  /// The content of the message template.
  final MessageTemplateContentProvider? content;

  /// An object that specifies the default values to use for variables in the
  /// message template. This object contains different categories of key-value
  /// pairs. Each key defines a variable or placeholder in the message template.
  /// The corresponding value defines the default value for that variable.
  final MessageTemplateAttributes? defaultAttributes;

  /// The description of the message template.
  final String? description;
  final GroupingConfiguration? groupingConfiguration;

  /// Whether the version of the message template is activated.
  final bool? isActive;

  /// The language code value for the language in which the quick response is
  /// written. The supported language codes include <code>de_DE</code>,
  /// <code>en_US</code>, <code>es_ES</code>, <code>fr_FR</code>,
  /// <code>id_ID</code>, <code>it_IT</code>, <code>ja_JP</code>,
  /// <code>ko_KR</code>, <code>pt_BR</code>, <code>zh_CN</code>,
  /// <code>zh_TW</code>
  final String? language;

  /// The source configuration summary of the message template.
  final MessageTemplateSourceConfigurationSummary? sourceConfigurationSummary;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// The version number of the message template version.
  final int? versionNumber;

  ExtendedMessageTemplateData({
    required this.channelSubtype,
    required this.createdTime,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.lastModifiedBy,
    required this.lastModifiedTime,
    required this.messageTemplateArn,
    required this.messageTemplateContentSha256,
    required this.messageTemplateId,
    required this.name,
    this.attachments,
    this.attributeTypes,
    this.channel,
    this.content,
    this.defaultAttributes,
    this.description,
    this.groupingConfiguration,
    this.isActive,
    this.language,
    this.sourceConfigurationSummary,
    this.tags,
    this.versionNumber,
  });

  factory ExtendedMessageTemplateData.fromJson(Map<String, dynamic> json) {
    return ExtendedMessageTemplateData(
      channelSubtype:
          ChannelSubtype.fromString((json['channelSubtype'] as String?) ?? ''),
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      lastModifiedBy: (json['lastModifiedBy'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      messageTemplateArn: (json['messageTemplateArn'] as String?) ?? '',
      messageTemplateContentSha256:
          (json['messageTemplateContentSha256'] as String?) ?? '',
      messageTemplateId: (json['messageTemplateId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      attachments: (json['attachments'] as List?)
          ?.nonNulls
          .map((e) =>
              MessageTemplateAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributeTypes: (json['attributeTypes'] as List?)
          ?.nonNulls
          .map((e) => MessageTemplateAttributeType.fromString((e as String)))
          .toList(),
      channel: json['channel'] as String?,
      content: json['content'] != null
          ? MessageTemplateContentProvider.fromJson(
              json['content'] as Map<String, dynamic>)
          : null,
      defaultAttributes: json['defaultAttributes'] != null
          ? MessageTemplateAttributes.fromJson(
              json['defaultAttributes'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      groupingConfiguration: json['groupingConfiguration'] != null
          ? GroupingConfiguration.fromJson(
              json['groupingConfiguration'] as Map<String, dynamic>)
          : null,
      isActive: json['isActive'] as bool?,
      language: json['language'] as String?,
      sourceConfigurationSummary: json['sourceConfigurationSummary'] != null
          ? MessageTemplateSourceConfigurationSummary.fromJson(
              json['sourceConfigurationSummary'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelSubtype = this.channelSubtype;
    final createdTime = this.createdTime;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedTime = this.lastModifiedTime;
    final messageTemplateArn = this.messageTemplateArn;
    final messageTemplateContentSha256 = this.messageTemplateContentSha256;
    final messageTemplateId = this.messageTemplateId;
    final name = this.name;
    final attachments = this.attachments;
    final attributeTypes = this.attributeTypes;
    final channel = this.channel;
    final content = this.content;
    final defaultAttributes = this.defaultAttributes;
    final description = this.description;
    final groupingConfiguration = this.groupingConfiguration;
    final isActive = this.isActive;
    final language = this.language;
    final sourceConfigurationSummary = this.sourceConfigurationSummary;
    final tags = this.tags;
    final versionNumber = this.versionNumber;
    return {
      'channelSubtype': channelSubtype.value,
      'createdTime': iso8601ToJson(createdTime),
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      'messageTemplateArn': messageTemplateArn,
      'messageTemplateContentSha256': messageTemplateContentSha256,
      'messageTemplateId': messageTemplateId,
      'name': name,
      if (attachments != null) 'attachments': attachments,
      if (attributeTypes != null)
        'attributeTypes': attributeTypes.map((e) => e.value).toList(),
      if (channel != null) 'channel': channel,
      if (content != null) 'content': content,
      if (defaultAttributes != null) 'defaultAttributes': defaultAttributes,
      if (description != null) 'description': description,
      if (groupingConfiguration != null)
        'groupingConfiguration': groupingConfiguration,
      if (isActive != null) 'isActive': isActive,
      if (language != null) 'language': language,
      if (sourceConfigurationSummary != null)
        'sourceConfigurationSummary': sourceConfigurationSummary,
      if (tags != null) 'tags': tags,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// The summary of the message template.
///
/// @nodoc
class MessageTemplateSummary {
  /// The channel subtype this message template applies to.
  final ChannelSubtype channelSubtype;

  /// The timestamp when the message template was created.
  final DateTime createdTime;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The Amazon Resource Name (ARN) of the user who last updated the message
  /// template data.
  final String lastModifiedBy;

  /// The timestamp when the message template data was last modified.
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the message template.
  final String messageTemplateArn;

  /// The identifier of the message template.
  final String messageTemplateId;

  /// The name of the message template.
  final String name;

  /// The version number of the message template version that is activated.
  final int? activeVersionNumber;

  /// The channel this message template applies to.
  final String? channel;

  /// The description of the message template.
  final String? description;
  final MessageTemplateSourceConfiguration? sourceConfiguration;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  MessageTemplateSummary({
    required this.channelSubtype,
    required this.createdTime,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.lastModifiedBy,
    required this.lastModifiedTime,
    required this.messageTemplateArn,
    required this.messageTemplateId,
    required this.name,
    this.activeVersionNumber,
    this.channel,
    this.description,
    this.sourceConfiguration,
    this.tags,
  });

  factory MessageTemplateSummary.fromJson(Map<String, dynamic> json) {
    return MessageTemplateSummary(
      channelSubtype:
          ChannelSubtype.fromString((json['channelSubtype'] as String?) ?? ''),
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      lastModifiedBy: (json['lastModifiedBy'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      messageTemplateArn: (json['messageTemplateArn'] as String?) ?? '',
      messageTemplateId: (json['messageTemplateId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      activeVersionNumber: json['activeVersionNumber'] as int?,
      channel: json['channel'] as String?,
      description: json['description'] as String?,
      sourceConfiguration: json['sourceConfiguration'] != null
          ? MessageTemplateSourceConfiguration.fromJson(
              json['sourceConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final channelSubtype = this.channelSubtype;
    final createdTime = this.createdTime;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedTime = this.lastModifiedTime;
    final messageTemplateArn = this.messageTemplateArn;
    final messageTemplateId = this.messageTemplateId;
    final name = this.name;
    final activeVersionNumber = this.activeVersionNumber;
    final channel = this.channel;
    final description = this.description;
    final sourceConfiguration = this.sourceConfiguration;
    final tags = this.tags;
    return {
      'channelSubtype': channelSubtype.value,
      'createdTime': iso8601ToJson(createdTime),
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      'messageTemplateArn': messageTemplateArn,
      'messageTemplateId': messageTemplateId,
      'name': name,
      if (activeVersionNumber != null)
        'activeVersionNumber': activeVersionNumber,
      if (channel != null) 'channel': channel,
      if (description != null) 'description': description,
      if (sourceConfiguration != null)
        'sourceConfiguration': sourceConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The container of message template source configuration.
///
/// @nodoc
class MessageTemplateSourceConfiguration {
  /// The sourceConfiguration of the message template that applies to the WHATSAPP
  /// channel subtype.
  final WhatsAppMessageTemplateSourceConfiguration? whatsApp;

  MessageTemplateSourceConfiguration({
    this.whatsApp,
  });

  factory MessageTemplateSourceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MessageTemplateSourceConfiguration(
      whatsApp: json['whatsApp'] != null
          ? WhatsAppMessageTemplateSourceConfiguration.fromJson(
              json['whatsApp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final whatsApp = this.whatsApp;
    return {
      if (whatsApp != null) 'whatsApp': whatsApp,
    };
  }
}

/// Configuration information about the external data source.
///
/// @nodoc
class WhatsAppMessageTemplateSourceConfiguration {
  /// The ID of the End User Messaging WhatsApp Business Account to associate with
  /// this template.
  final String businessAccountId;

  /// The WhatsApp template ID.
  final String templateId;

  /// The list of component mapping from WhatsApp template parameters to Message
  /// Template attributes.
  final List<String>? components;

  WhatsAppMessageTemplateSourceConfiguration({
    required this.businessAccountId,
    required this.templateId,
    this.components,
  });

  factory WhatsAppMessageTemplateSourceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return WhatsAppMessageTemplateSourceConfiguration(
      businessAccountId: (json['businessAccountId'] as String?) ?? '',
      templateId: (json['templateId'] as String?) ?? '',
      components: (json['components'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final businessAccountId = this.businessAccountId;
    final templateId = this.templateId;
    final components = this.components;
    return {
      'businessAccountId': businessAccountId,
      'templateId': templateId,
      if (components != null) 'components': components,
    };
  }
}

/// Summary information about a content association.
///
/// @nodoc
class ContentAssociationSummary {
  /// The content association.
  final ContentAssociationContents associationData;

  /// The type of association.
  final ContentAssociationType associationType;

  /// The Amazon Resource Name (ARN) of the content.
  final String contentArn;

  /// The Amazon Resource Name (ARN) of the content association.
  final String contentAssociationArn;

  /// The identifier of the content association. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  final String contentAssociationId;

  /// The identifier of the content.
  final String contentId;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ContentAssociationSummary({
    required this.associationData,
    required this.associationType,
    required this.contentArn,
    required this.contentAssociationArn,
    required this.contentAssociationId,
    required this.contentId,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    this.tags,
  });

  factory ContentAssociationSummary.fromJson(Map<String, dynamic> json) {
    return ContentAssociationSummary(
      associationData: ContentAssociationContents.fromJson(
          (json['associationData'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      associationType: ContentAssociationType.fromString(
          (json['associationType'] as String?) ?? ''),
      contentArn: (json['contentArn'] as String?) ?? '',
      contentAssociationArn: (json['contentAssociationArn'] as String?) ?? '',
      contentAssociationId: (json['contentAssociationId'] as String?) ?? '',
      contentId: (json['contentId'] as String?) ?? '',
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final associationData = this.associationData;
    final associationType = this.associationType;
    final contentArn = this.contentArn;
    final contentAssociationArn = this.contentAssociationArn;
    final contentAssociationId = this.contentAssociationId;
    final contentId = this.contentId;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final tags = this.tags;
    return {
      'associationData': associationData,
      'associationType': associationType.value,
      'contentArn': contentArn,
      'contentAssociationArn': contentAssociationArn,
      'contentAssociationId': contentAssociationId,
      'contentId': contentId,
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ContentAssociationType {
  static const amazonConnectGuide =
      ContentAssociationType._('AMAZON_CONNECT_GUIDE');

  final String value;

  const ContentAssociationType._(this.value);

  static const values = [amazonConnectGuide];

  static ContentAssociationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentAssociationType._(value));

  @override
  bool operator ==(other) =>
      other is ContentAssociationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The contents of a content association.
///
/// @nodoc
class ContentAssociationContents {
  /// The data of the step-by-step guide association.
  final AmazonConnectGuideAssociationData? amazonConnectGuideAssociation;

  ContentAssociationContents({
    this.amazonConnectGuideAssociation,
  });

  factory ContentAssociationContents.fromJson(Map<String, dynamic> json) {
    return ContentAssociationContents(
      amazonConnectGuideAssociation:
          json['amazonConnectGuideAssociation'] != null
              ? AmazonConnectGuideAssociationData.fromJson(
                  json['amazonConnectGuideAssociation'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonConnectGuideAssociation = this.amazonConnectGuideAssociation;
    return {
      if (amazonConnectGuideAssociation != null)
        'amazonConnectGuideAssociation': amazonConnectGuideAssociation,
    };
  }
}

/// Content association data for a <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/step-by-step-guided-experiences.html">step-by-step
/// guide</a>.
///
/// @nodoc
class AmazonConnectGuideAssociationData {
  /// The Amazon Resource Name (ARN) of an Amazon Connect flow. Step-by-step
  /// guides are a type of flow.
  final String? flowId;

  AmazonConnectGuideAssociationData({
    this.flowId,
  });

  factory AmazonConnectGuideAssociationData.fromJson(
      Map<String, dynamic> json) {
    return AmazonConnectGuideAssociationData(
      flowId: json['flowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowId = this.flowId;
    return {
      if (flowId != null) 'flowId': flowId,
    };
  }
}

/// Information about the content association.
///
/// @nodoc
class ContentAssociationData {
  /// The content association.
  final ContentAssociationContents associationData;

  /// The type of association.
  final ContentAssociationType associationType;

  /// The Amazon Resource Name (ARN) of the content.
  final String contentArn;

  /// The Amazon Resource Name (ARN) of the content association.
  final String contentAssociationArn;

  /// The identifier of the content association. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  final String contentAssociationId;

  /// The identifier of the content.
  final String contentId;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ContentAssociationData({
    required this.associationData,
    required this.associationType,
    required this.contentArn,
    required this.contentAssociationArn,
    required this.contentAssociationId,
    required this.contentId,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    this.tags,
  });

  factory ContentAssociationData.fromJson(Map<String, dynamic> json) {
    return ContentAssociationData(
      associationData: ContentAssociationContents.fromJson(
          (json['associationData'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      associationType: ContentAssociationType.fromString(
          (json['associationType'] as String?) ?? ''),
      contentArn: (json['contentArn'] as String?) ?? '',
      contentAssociationArn: (json['contentAssociationArn'] as String?) ?? '',
      contentAssociationId: (json['contentAssociationId'] as String?) ?? '',
      contentId: (json['contentId'] as String?) ?? '',
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final associationData = this.associationData;
    final associationType = this.associationType;
    final contentArn = this.contentArn;
    final contentAssociationArn = this.contentAssociationArn;
    final contentAssociationId = this.contentAssociationId;
    final contentId = this.contentId;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final tags = this.tags;
    return {
      'associationData': associationData,
      'associationType': associationType.value,
      'contentArn': contentArn,
      'contentAssociationArn': contentAssociationArn,
      'contentAssociationId': contentAssociationId,
      'contentId': contentId,
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Summary information about the content.
///
/// @nodoc
class ContentSummary {
  /// The Amazon Resource Name (ARN) of the content.
  final String contentArn;

  /// The identifier of the content.
  final String contentId;

  /// The media type of the content.
  final String contentType;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base.
  final String knowledgeBaseId;

  /// A key/value map to store attributes without affecting tagging or
  /// recommendations. For example, when synchronizing data between an external
  /// system and Amazon Q in Connect, you can store an external version identifier
  /// as metadata to utilize for determining drift.
  final Map<String, String> metadata;

  /// The name of the content.
  final String name;

  /// The identifier of the revision of the content.
  final String revisionId;

  /// The status of the content.
  final ContentStatus status;

  /// The title of the content.
  final String title;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ContentSummary({
    required this.contentArn,
    required this.contentId,
    required this.contentType,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.metadata,
    required this.name,
    required this.revisionId,
    required this.status,
    required this.title,
    this.tags,
  });

  factory ContentSummary.fromJson(Map<String, dynamic> json) {
    return ContentSummary(
      contentArn: (json['contentArn'] as String?) ?? '',
      contentId: (json['contentId'] as String?) ?? '',
      contentType: (json['contentType'] as String?) ?? '',
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      metadata: ((json['metadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      name: (json['name'] as String?) ?? '',
      revisionId: (json['revisionId'] as String?) ?? '',
      status: ContentStatus.fromString((json['status'] as String?) ?? ''),
      title: (json['title'] as String?) ?? '',
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final contentArn = this.contentArn;
    final contentId = this.contentId;
    final contentType = this.contentType;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final metadata = this.metadata;
    final name = this.name;
    final revisionId = this.revisionId;
    final status = this.status;
    final title = this.title;
    final tags = this.tags;
    return {
      'contentArn': contentArn,
      'contentId': contentId,
      'contentType': contentType,
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'metadata': metadata,
      'name': name,
      'revisionId': revisionId,
      'status': status.value,
      'title': title,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ContentStatus {
  static const createInProgress = ContentStatus._('CREATE_IN_PROGRESS');
  static const createFailed = ContentStatus._('CREATE_FAILED');
  static const active = ContentStatus._('ACTIVE');
  static const deleteInProgress = ContentStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = ContentStatus._('DELETE_FAILED');
  static const deleted = ContentStatus._('DELETED');
  static const updateFailed = ContentStatus._('UPDATE_FAILED');

  final String value;

  const ContentStatus._(this.value);

  static const values = [
    createInProgress,
    createFailed,
    active,
    deleteInProgress,
    deleteFailed,
    deleted,
    updateFailed
  ];

  static ContentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentStatus._(value));

  @override
  bool operator ==(other) => other is ContentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the content.
///
/// @nodoc
class ContentData {
  /// The Amazon Resource Name (ARN) of the content.
  final String contentArn;

  /// The identifier of the content.
  final String contentId;

  /// The media type of the content.
  final String contentType;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// A key/value map to store attributes without affecting tagging or
  /// recommendations. For example, when synchronizing data between an external
  /// system and Amazon Q in Connect, you can store an external version identifier
  /// as metadata to utilize for determining drift.
  final Map<String, String> metadata;

  /// The name of the content.
  final String name;

  /// The identifier of the content revision.
  final String revisionId;

  /// The status of the content.
  final ContentStatus status;

  /// The title of the content.
  final String title;

  /// The URL of the content.
  final String url;

  /// The expiration time of the URL as an epoch timestamp.
  final DateTime urlExpiry;

  /// The URI of the content.
  final String? linkOutUri;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ContentData({
    required this.contentArn,
    required this.contentId,
    required this.contentType,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.metadata,
    required this.name,
    required this.revisionId,
    required this.status,
    required this.title,
    required this.url,
    required this.urlExpiry,
    this.linkOutUri,
    this.tags,
  });

  factory ContentData.fromJson(Map<String, dynamic> json) {
    return ContentData(
      contentArn: (json['contentArn'] as String?) ?? '',
      contentId: (json['contentId'] as String?) ?? '',
      contentType: (json['contentType'] as String?) ?? '',
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      metadata: ((json['metadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      name: (json['name'] as String?) ?? '',
      revisionId: (json['revisionId'] as String?) ?? '',
      status: ContentStatus.fromString((json['status'] as String?) ?? ''),
      title: (json['title'] as String?) ?? '',
      url: (json['url'] as String?) ?? '',
      urlExpiry: nonNullableTimeStampFromJson(json['urlExpiry'] ?? 0),
      linkOutUri: json['linkOutUri'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final contentArn = this.contentArn;
    final contentId = this.contentId;
    final contentType = this.contentType;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final metadata = this.metadata;
    final name = this.name;
    final revisionId = this.revisionId;
    final status = this.status;
    final title = this.title;
    final url = this.url;
    final urlExpiry = this.urlExpiry;
    final linkOutUri = this.linkOutUri;
    final tags = this.tags;
    return {
      'contentArn': contentArn,
      'contentId': contentId,
      'contentType': contentType,
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'metadata': metadata,
      'name': name,
      'revisionId': revisionId,
      'status': status.value,
      'title': title,
      'url': url,
      'urlExpiry': unixTimestampToJson(urlExpiry),
      if (linkOutUri != null) 'linkOutUri': linkOutUri,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information about the knowledge base.
///
/// @nodoc
class KnowledgeBaseData {
  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The type of knowledge base.
  final KnowledgeBaseType knowledgeBaseType;

  /// The name of the knowledge base.
  final String name;

  /// The status of the knowledge base.
  final KnowledgeBaseStatus status;

  /// The description.
  final String? description;

  /// List of failure reasons on ingestion per file.
  final List<String>? ingestionFailureReasons;

  /// Status of ingestion on data source.
  final SyncStatus? ingestionStatus;

  /// An epoch timestamp indicating the most recent content modification inside
  /// the knowledge base. If no content exists in a knowledge base, this value is
  /// unset.
  final DateTime? lastContentModificationTime;

  /// Information about how to render the content.
  final RenderingConfiguration? renderingConfiguration;

  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// This KMS key must have a policy that allows <code>kms:CreateGrant</code>,
  /// <code>kms:DescribeKey</code>, <code>kms:Decrypt</code>, and
  /// <code>kms:GenerateDataKey*</code> permissions to the IAM identity using the
  /// key to invoke Amazon Q in Connect.
  ///
  /// For more information about setting up a customer managed key for Amazon Q in
  /// Connect, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-q.html">Enable
  /// Amazon Q in Connect for your instance</a>.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// Source configuration information about the knowledge base.
  final SourceConfiguration? sourceConfiguration;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Contains details about how to ingest the documents in a data source.
  final VectorIngestionConfiguration? vectorIngestionConfiguration;

  KnowledgeBaseData({
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.knowledgeBaseType,
    required this.name,
    required this.status,
    this.description,
    this.ingestionFailureReasons,
    this.ingestionStatus,
    this.lastContentModificationTime,
    this.renderingConfiguration,
    this.serverSideEncryptionConfiguration,
    this.sourceConfiguration,
    this.tags,
    this.vectorIngestionConfiguration,
  });

  factory KnowledgeBaseData.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseData(
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      knowledgeBaseType: KnowledgeBaseType.fromString(
          (json['knowledgeBaseType'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      status: KnowledgeBaseStatus.fromString((json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      ingestionFailureReasons: (json['ingestionFailureReasons'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ingestionStatus:
          (json['ingestionStatus'] as String?)?.let(SyncStatus.fromString),
      lastContentModificationTime:
          timeStampFromJson(json['lastContentModificationTime']),
      renderingConfiguration: json['renderingConfiguration'] != null
          ? RenderingConfiguration.fromJson(
              json['renderingConfiguration'] as Map<String, dynamic>)
          : null,
      serverSideEncryptionConfiguration:
          json['serverSideEncryptionConfiguration'] != null
              ? ServerSideEncryptionConfiguration.fromJson(
                  json['serverSideEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      sourceConfiguration: json['sourceConfiguration'] != null
          ? SourceConfiguration.fromJson(
              json['sourceConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vectorIngestionConfiguration: json['vectorIngestionConfiguration'] != null
          ? VectorIngestionConfiguration.fromJson(
              json['vectorIngestionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final knowledgeBaseType = this.knowledgeBaseType;
    final name = this.name;
    final status = this.status;
    final description = this.description;
    final ingestionFailureReasons = this.ingestionFailureReasons;
    final ingestionStatus = this.ingestionStatus;
    final lastContentModificationTime = this.lastContentModificationTime;
    final renderingConfiguration = this.renderingConfiguration;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final sourceConfiguration = this.sourceConfiguration;
    final tags = this.tags;
    final vectorIngestionConfiguration = this.vectorIngestionConfiguration;
    return {
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'knowledgeBaseType': knowledgeBaseType.value,
      'name': name,
      'status': status.value,
      if (description != null) 'description': description,
      if (ingestionFailureReasons != null)
        'ingestionFailureReasons': ingestionFailureReasons,
      if (ingestionStatus != null) 'ingestionStatus': ingestionStatus.value,
      if (lastContentModificationTime != null)
        'lastContentModificationTime':
            unixTimestampToJson(lastContentModificationTime),
      if (renderingConfiguration != null)
        'renderingConfiguration': renderingConfiguration,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (sourceConfiguration != null)
        'sourceConfiguration': sourceConfiguration,
      if (tags != null) 'tags': tags,
      if (vectorIngestionConfiguration != null)
        'vectorIngestionConfiguration': vectorIngestionConfiguration,
    };
  }
}

/// @nodoc
class KnowledgeBaseType {
  static const external = KnowledgeBaseType._('EXTERNAL');
  static const custom = KnowledgeBaseType._('CUSTOM');
  static const quickResponses = KnowledgeBaseType._('QUICK_RESPONSES');
  static const messageTemplates = KnowledgeBaseType._('MESSAGE_TEMPLATES');
  static const managed = KnowledgeBaseType._('MANAGED');

  final String value;

  const KnowledgeBaseType._(this.value);

  static const values = [
    external,
    custom,
    quickResponses,
    messageTemplates,
    managed
  ];

  static KnowledgeBaseType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KnowledgeBaseType._(value));

  @override
  bool operator ==(other) => other is KnowledgeBaseType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class KnowledgeBaseStatus {
  static const createInProgress = KnowledgeBaseStatus._('CREATE_IN_PROGRESS');
  static const createFailed = KnowledgeBaseStatus._('CREATE_FAILED');
  static const active = KnowledgeBaseStatus._('ACTIVE');
  static const deleteInProgress = KnowledgeBaseStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = KnowledgeBaseStatus._('DELETE_FAILED');
  static const deleted = KnowledgeBaseStatus._('DELETED');

  final String value;

  const KnowledgeBaseStatus._(this.value);

  static const values = [
    createInProgress,
    createFailed,
    active,
    deleteInProgress,
    deleteFailed,
    deleted
  ];

  static KnowledgeBaseStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KnowledgeBaseStatus._(value));

  @override
  bool operator ==(other) =>
      other is KnowledgeBaseStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about how to ingest the documents in a data source.
///
/// @nodoc
class VectorIngestionConfiguration {
  /// Details about how to chunk the documents in the data source. A chunk refers
  /// to an excerpt from a data source that is returned when the knowledge base
  /// that it belongs to is queried.
  final ChunkingConfiguration? chunkingConfiguration;

  /// A custom parser for data source documents.
  final ParsingConfiguration? parsingConfiguration;

  VectorIngestionConfiguration({
    this.chunkingConfiguration,
    this.parsingConfiguration,
  });

  factory VectorIngestionConfiguration.fromJson(Map<String, dynamic> json) {
    return VectorIngestionConfiguration(
      chunkingConfiguration: json['chunkingConfiguration'] != null
          ? ChunkingConfiguration.fromJson(
              json['chunkingConfiguration'] as Map<String, dynamic>)
          : null,
      parsingConfiguration: json['parsingConfiguration'] != null
          ? ParsingConfiguration.fromJson(
              json['parsingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final chunkingConfiguration = this.chunkingConfiguration;
    final parsingConfiguration = this.parsingConfiguration;
    return {
      if (chunkingConfiguration != null)
        'chunkingConfiguration': chunkingConfiguration,
      if (parsingConfiguration != null)
        'parsingConfiguration': parsingConfiguration,
    };
  }
}

/// Configuration information about the external data source.
///
/// @nodoc
class SourceConfiguration {
  /// Configuration information for Amazon AppIntegrations to automatically ingest
  /// content.
  final AppIntegrationsConfiguration? appIntegrations;

  /// Source configuration for managed resources.
  final ManagedSourceConfiguration? managedSourceConfiguration;

  SourceConfiguration({
    this.appIntegrations,
    this.managedSourceConfiguration,
  });

  factory SourceConfiguration.fromJson(Map<String, dynamic> json) {
    return SourceConfiguration(
      appIntegrations: json['appIntegrations'] != null
          ? AppIntegrationsConfiguration.fromJson(
              json['appIntegrations'] as Map<String, dynamic>)
          : null,
      managedSourceConfiguration: json['managedSourceConfiguration'] != null
          ? ManagedSourceConfiguration.fromJson(
              json['managedSourceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appIntegrations = this.appIntegrations;
    final managedSourceConfiguration = this.managedSourceConfiguration;
    return {
      if (appIntegrations != null) 'appIntegrations': appIntegrations,
      if (managedSourceConfiguration != null)
        'managedSourceConfiguration': managedSourceConfiguration,
    };
  }
}

/// Information about how to render the content.
///
/// @nodoc
class RenderingConfiguration {
  /// A URI template containing exactly one variable in <code>${variableName}
  /// </code>format. This can only be set for <code>EXTERNAL</code> knowledge
  /// bases. For Salesforce, ServiceNow, and Zendesk, the variable must be one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// Salesforce: <code>Id</code>, <code>ArticleNumber</code>,
  /// <code>VersionNumber</code>, <code>Title</code>, <code>PublishStatus</code>,
  /// or <code>IsDeleted</code>
  /// </li>
  /// <li>
  /// ServiceNow: <code>number</code>, <code>short_description</code>,
  /// <code>sys_mod_count</code>, <code>workflow_state</code>, or
  /// <code>active</code>
  /// </li>
  /// <li>
  /// Zendesk: <code>id</code>, <code>title</code>, <code>updated_at</code>, or
  /// <code>draft</code>
  /// </li>
  /// </ul>
  /// The variable is replaced with the actual value for a piece of content when
  /// calling <a
  /// href="https://docs.aws.amazon.com/amazon-q-connect/latest/APIReference/API_GetContent.html">GetContent</a>.
  final String? templateUri;

  RenderingConfiguration({
    this.templateUri,
  });

  factory RenderingConfiguration.fromJson(Map<String, dynamic> json) {
    return RenderingConfiguration(
      templateUri: json['templateUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateUri = this.templateUri;
    return {
      if (templateUri != null) 'templateUri': templateUri,
    };
  }
}

/// The configuration information for the customer managed key used for
/// encryption.
///
/// @nodoc
class ServerSideEncryptionConfiguration {
  /// The customer managed key used for encryption. For more information about
  /// setting up a customer managed key for Amazon Q in Connect, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-q.html">Enable
  /// Amazon Q in Connect for your instance</a>. For information about valid ID
  /// values, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id">Key
  /// identifiers (KeyId)</a>.
  final String? kmsKeyId;

  ServerSideEncryptionConfiguration({
    this.kmsKeyId,
  });

  factory ServerSideEncryptionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServerSideEncryptionConfiguration(
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    return {
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

/// @nodoc
class SyncStatus {
  static const syncFailed = SyncStatus._('SYNC_FAILED');
  static const syncingInProgress = SyncStatus._('SYNCING_IN_PROGRESS');
  static const syncSuccess = SyncStatus._('SYNC_SUCCESS');
  static const createInProgress = SyncStatus._('CREATE_IN_PROGRESS');

  final String value;

  const SyncStatus._(this.value);

  static const values = [
    syncFailed,
    syncingInProgress,
    syncSuccess,
    createInProgress
  ];

  static SyncStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SyncStatus._(value));

  @override
  bool operator ==(other) => other is SyncStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration information for Amazon AppIntegrations to automatically ingest
/// content.
///
/// @nodoc
class AppIntegrationsConfiguration {
  /// The Amazon Resource Name (ARN) of the AppIntegrations DataIntegration to use
  /// for ingesting content.
  ///
  /// <ul>
  /// <li>
  /// For <a
  /// href="https://developer.salesforce.com/docs/atlas.en-us.knowledge_dev.meta/knowledge_dev/sforce_api_objects_knowledge__kav.htm">
  /// Salesforce</a>, your AppIntegrations DataIntegration must have an
  /// ObjectConfiguration if objectFields is not provided, including at least
  /// <code>Id</code>, <code>ArticleNumber</code>, <code>VersionNumber</code>,
  /// <code>Title</code>, <code>PublishStatus</code>, and <code>IsDeleted</code>
  /// as source fields.
  /// </li>
  /// <li>
  /// For <a
  /// href="https://developer.servicenow.com/dev.do#!/reference/api/rome/rest/knowledge-management-api">
  /// ServiceNow</a>, your AppIntegrations DataIntegration must have an
  /// ObjectConfiguration if objectFields is not provided, including at least
  /// <code>number</code>, <code>short_description</code>,
  /// <code>sys_mod_count</code>, <code>workflow_state</code>, and
  /// <code>active</code> as source fields.
  /// </li>
  /// <li>
  /// For <a
  /// href="https://developer.zendesk.com/api-reference/help_center/help-center-api/articles/">
  /// Zendesk</a>, your AppIntegrations DataIntegration must have an
  /// ObjectConfiguration if <code>objectFields</code> is not provided, including
  /// at least <code>id</code>, <code>title</code>, <code>updated_at</code>, and
  /// <code>draft</code> as source fields.
  /// </li>
  /// <li>
  /// For <a
  /// href="https://learn.microsoft.com/en-us/sharepoint/dev/sp-add-ins/sharepoint-net-server-csom-jsom-and-rest-api-index">SharePoint</a>,
  /// your AppIntegrations DataIntegration must have a FileConfiguration,
  /// including only file extensions that are among <code>docx</code>,
  /// <code>pdf</code>, <code>html</code>, <code>htm</code>, and <code>txt</code>.
  /// </li>
  /// <li>
  /// For <a href="http://aws.amazon.com/s3/">Amazon S3</a>, the
  /// ObjectConfiguration and FileConfiguration of your AppIntegrations
  /// DataIntegration must be null. The <code>SourceURI</code> of your
  /// DataIntegration must use the following format:
  /// <code>s3://your_s3_bucket_name</code>.
  /// <important>
  /// The bucket policy of the corresponding S3 bucket must allow the Amazon Web
  /// Services principal <code>app-integrations.amazonaws.com</code> to perform
  /// <code>s3:ListBucket</code>, <code>s3:GetObject</code>, and
  /// <code>s3:GetBucketLocation</code> against the bucket.
  /// </important> </li>
  /// </ul>
  final String appIntegrationArn;

  /// The fields from the source that are made available to your agents in Amazon
  /// Q in Connect. Optional if ObjectConfiguration is included in the provided
  /// DataIntegration.
  ///
  /// <ul>
  /// <li>
  /// For <a
  /// href="https://developer.salesforce.com/docs/atlas.en-us.knowledge_dev.meta/knowledge_dev/sforce_api_objects_knowledge__kav.htm">
  /// Salesforce</a>, you must include at least <code>Id</code>,
  /// <code>ArticleNumber</code>, <code>VersionNumber</code>, <code>Title</code>,
  /// <code>PublishStatus</code>, and <code>IsDeleted</code>.
  /// </li>
  /// <li>
  /// For <a
  /// href="https://developer.servicenow.com/dev.do#!/reference/api/rome/rest/knowledge-management-api">
  /// ServiceNow</a>, you must include at least <code>number</code>,
  /// <code>short_description</code>, <code>sys_mod_count</code>,
  /// <code>workflow_state</code>, and <code>active</code>.
  /// </li>
  /// <li>
  /// For <a
  /// href="https://developer.zendesk.com/api-reference/help_center/help-center-api/articles/">
  /// Zendesk</a>, you must include at least <code>id</code>, <code>title</code>,
  /// <code>updated_at</code>, and <code>draft</code>.
  /// </li>
  /// </ul>
  /// Make sure to include additional fields. These fields are indexed and used to
  /// source recommendations.
  final List<String>? objectFields;

  AppIntegrationsConfiguration({
    required this.appIntegrationArn,
    this.objectFields,
  });

  factory AppIntegrationsConfiguration.fromJson(Map<String, dynamic> json) {
    return AppIntegrationsConfiguration(
      appIntegrationArn: (json['appIntegrationArn'] as String?) ?? '',
      objectFields: (json['objectFields'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appIntegrationArn = this.appIntegrationArn;
    final objectFields = this.objectFields;
    return {
      'appIntegrationArn': appIntegrationArn,
      if (objectFields != null) 'objectFields': objectFields,
    };
  }
}

/// Source configuration for managed resources.
///
/// @nodoc
class ManagedSourceConfiguration {
  /// Configuration data for web crawler data source.
  final WebCrawlerConfiguration? webCrawlerConfiguration;

  ManagedSourceConfiguration({
    this.webCrawlerConfiguration,
  });

  factory ManagedSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return ManagedSourceConfiguration(
      webCrawlerConfiguration: json['webCrawlerConfiguration'] != null
          ? WebCrawlerConfiguration.fromJson(
              json['webCrawlerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final webCrawlerConfiguration = this.webCrawlerConfiguration;
    return {
      if (webCrawlerConfiguration != null)
        'webCrawlerConfiguration': webCrawlerConfiguration,
    };
  }
}

/// The configuration details for the web data source.
///
/// @nodoc
class WebCrawlerConfiguration {
  /// The configuration of the URL/URLs for the web content that you want to
  /// crawl. You should be authorized to crawl the URLs.
  final UrlConfiguration urlConfiguration;

  /// The configuration of crawl limits for the web URLs.
  final WebCrawlerLimits? crawlerLimits;

  /// A list of one or more exclusion regular expression patterns to exclude
  /// certain URLs. If you specify an inclusion and exclusion filter/pattern and
  /// both match a URL, the exclusion filter takes precedence and the web content
  /// of the URL isn’t crawled.
  final List<String>? exclusionFilters;

  /// A list of one or more inclusion regular expression patterns to include
  /// certain URLs. If you specify an inclusion and exclusion filter/pattern and
  /// both match a URL, the exclusion filter takes precedence and the web content
  /// of the URL isn’t crawled.
  final List<String>? inclusionFilters;

  /// The scope of what is crawled for your URLs. You can choose to crawl only web
  /// pages that belong to the same host or primary domain. For example, only web
  /// pages that contain the seed URL
  /// <code>https://docs.aws.amazon.com/bedrock/latest/userguide/</code> and no
  /// other domains. You can choose to include sub domains in addition to the host
  /// or primary domain. For example, web pages that contain
  /// <code>aws.amazon.com</code> can also include sub domain
  /// <code>docs.aws.amazon.com</code>.
  final WebScopeType? scope;

  WebCrawlerConfiguration({
    required this.urlConfiguration,
    this.crawlerLimits,
    this.exclusionFilters,
    this.inclusionFilters,
    this.scope,
  });

  factory WebCrawlerConfiguration.fromJson(Map<String, dynamic> json) {
    return WebCrawlerConfiguration(
      urlConfiguration: UrlConfiguration.fromJson(
          (json['urlConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      crawlerLimits: json['crawlerLimits'] != null
          ? WebCrawlerLimits.fromJson(
              json['crawlerLimits'] as Map<String, dynamic>)
          : null,
      exclusionFilters: (json['exclusionFilters'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      inclusionFilters: (json['inclusionFilters'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      scope: (json['scope'] as String?)?.let(WebScopeType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final urlConfiguration = this.urlConfiguration;
    final crawlerLimits = this.crawlerLimits;
    final exclusionFilters = this.exclusionFilters;
    final inclusionFilters = this.inclusionFilters;
    final scope = this.scope;
    return {
      'urlConfiguration': urlConfiguration,
      if (crawlerLimits != null) 'crawlerLimits': crawlerLimits,
      if (exclusionFilters != null) 'exclusionFilters': exclusionFilters,
      if (inclusionFilters != null) 'inclusionFilters': inclusionFilters,
      if (scope != null) 'scope': scope.value,
    };
  }
}

/// The configuration of the URL/URLs for the web content that you want to
/// crawl. You should be authorized to crawl the URLs.
///
/// @nodoc
class UrlConfiguration {
  /// List of URLs for crawling.
  final List<SeedUrl>? seedUrls;

  UrlConfiguration({
    this.seedUrls,
  });

  factory UrlConfiguration.fromJson(Map<String, dynamic> json) {
    return UrlConfiguration(
      seedUrls: (json['seedUrls'] as List?)
          ?.nonNulls
          .map((e) => SeedUrl.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final seedUrls = this.seedUrls;
    return {
      if (seedUrls != null) 'seedUrls': seedUrls,
    };
  }
}

/// The configuration of crawl limits for the web URLs.
///
/// @nodoc
class WebCrawlerLimits {
  /// Rate of web URLs retrieved per minute.
  final int? rateLimit;

  WebCrawlerLimits({
    this.rateLimit,
  });

  factory WebCrawlerLimits.fromJson(Map<String, dynamic> json) {
    return WebCrawlerLimits(
      rateLimit: json['rateLimit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final rateLimit = this.rateLimit;
    return {
      if (rateLimit != null) 'rateLimit': rateLimit,
    };
  }
}

/// @nodoc
class WebScopeType {
  static const hostOnly = WebScopeType._('HOST_ONLY');
  static const subdomains = WebScopeType._('SUBDOMAINS');

  final String value;

  const WebScopeType._(this.value);

  static const values = [hostOnly, subdomains];

  static WebScopeType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => WebScopeType._(value));

  @override
  bool operator ==(other) => other is WebScopeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A URL for crawling.
///
/// @nodoc
class SeedUrl {
  /// URL for crawling
  final String? url;

  SeedUrl({
    this.url,
  });

  factory SeedUrl.fromJson(Map<String, dynamic> json) {
    return SeedUrl(
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    return {
      if (url != null) 'url': url,
    };
  }
}

/// Details about how to chunk the documents in the data source. A chunk refers
/// to an excerpt from a data source that is returned when the knowledge base
/// that it belongs to is queried.
///
/// @nodoc
class ChunkingConfiguration {
  /// Knowledge base can split your source data into chunks. A chunk refers to an
  /// excerpt from a data source that is returned when the knowledge base that it
  /// belongs to is queried. You have the following options for chunking your
  /// data. If you opt for <code>NONE</code>, then you may want to pre-process
  /// your files by splitting them up such that each file corresponds to a chunk.
  final ChunkingStrategy chunkingStrategy;

  /// Configurations for when you choose fixed-size chunking. If you set the
  /// <code>chunkingStrategy</code> as <code>NONE</code>, exclude this field.
  final FixedSizeChunkingConfiguration? fixedSizeChunkingConfiguration;

  /// Settings for hierarchical document chunking for a data source. Hierarchical
  /// chunking splits documents into layers of chunks where the first layer
  /// contains large chunks, and the second layer contains smaller chunks derived
  /// from the first layer.
  final HierarchicalChunkingConfiguration? hierarchicalChunkingConfiguration;

  /// Settings for semantic document chunking for a data source. Semantic chunking
  /// splits a document into smaller documents based on groups of similar content
  /// derived from the text with natural language processing.
  final SemanticChunkingConfiguration? semanticChunkingConfiguration;

  ChunkingConfiguration({
    required this.chunkingStrategy,
    this.fixedSizeChunkingConfiguration,
    this.hierarchicalChunkingConfiguration,
    this.semanticChunkingConfiguration,
  });

  factory ChunkingConfiguration.fromJson(Map<String, dynamic> json) {
    return ChunkingConfiguration(
      chunkingStrategy: ChunkingStrategy.fromString(
          (json['chunkingStrategy'] as String?) ?? ''),
      fixedSizeChunkingConfiguration: json['fixedSizeChunkingConfiguration'] !=
              null
          ? FixedSizeChunkingConfiguration.fromJson(
              json['fixedSizeChunkingConfiguration'] as Map<String, dynamic>)
          : null,
      hierarchicalChunkingConfiguration:
          json['hierarchicalChunkingConfiguration'] != null
              ? HierarchicalChunkingConfiguration.fromJson(
                  json['hierarchicalChunkingConfiguration']
                      as Map<String, dynamic>)
              : null,
      semanticChunkingConfiguration:
          json['semanticChunkingConfiguration'] != null
              ? SemanticChunkingConfiguration.fromJson(
                  json['semanticChunkingConfiguration'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final chunkingStrategy = this.chunkingStrategy;
    final fixedSizeChunkingConfiguration = this.fixedSizeChunkingConfiguration;
    final hierarchicalChunkingConfiguration =
        this.hierarchicalChunkingConfiguration;
    final semanticChunkingConfiguration = this.semanticChunkingConfiguration;
    return {
      'chunkingStrategy': chunkingStrategy.value,
      if (fixedSizeChunkingConfiguration != null)
        'fixedSizeChunkingConfiguration': fixedSizeChunkingConfiguration,
      if (hierarchicalChunkingConfiguration != null)
        'hierarchicalChunkingConfiguration': hierarchicalChunkingConfiguration,
      if (semanticChunkingConfiguration != null)
        'semanticChunkingConfiguration': semanticChunkingConfiguration,
    };
  }
}

/// Settings for parsing document contents. By default, the service converts the
/// contents of each document into text before splitting it into chunks. To
/// improve processing of PDF files with tables and images, you can configure
/// the data source to convert the pages of text into images and use a model to
/// describe the contents of each page.
///
/// @nodoc
class ParsingConfiguration {
  /// The parsing strategy for the data source.
  final ParsingStrategy parsingStrategy;

  /// Settings for a foundation model used to parse documents for a data source.
  final BedrockFoundationModelConfigurationForParsing?
      bedrockFoundationModelConfiguration;

  ParsingConfiguration({
    required this.parsingStrategy,
    this.bedrockFoundationModelConfiguration,
  });

  factory ParsingConfiguration.fromJson(Map<String, dynamic> json) {
    return ParsingConfiguration(
      parsingStrategy: ParsingStrategy.fromString(
          (json['parsingStrategy'] as String?) ?? ''),
      bedrockFoundationModelConfiguration:
          json['bedrockFoundationModelConfiguration'] != null
              ? BedrockFoundationModelConfigurationForParsing.fromJson(
                  json['bedrockFoundationModelConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final parsingStrategy = this.parsingStrategy;
    final bedrockFoundationModelConfiguration =
        this.bedrockFoundationModelConfiguration;
    return {
      'parsingStrategy': parsingStrategy.value,
      if (bedrockFoundationModelConfiguration != null)
        'bedrockFoundationModelConfiguration':
            bedrockFoundationModelConfiguration,
    };
  }
}

/// @nodoc
class ParsingStrategy {
  static const bedrockFoundationModel =
      ParsingStrategy._('BEDROCK_FOUNDATION_MODEL');

  final String value;

  const ParsingStrategy._(this.value);

  static const values = [bedrockFoundationModel];

  static ParsingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParsingStrategy._(value));

  @override
  bool operator ==(other) => other is ParsingStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Settings for a foundation model used to parse documents for a data source.
///
/// @nodoc
class BedrockFoundationModelConfigurationForParsing {
  /// The ARN of the foundation model.
  final String modelArn;

  /// Instructions for interpreting the contents of a document.
  final ParsingPrompt? parsingPrompt;

  BedrockFoundationModelConfigurationForParsing({
    required this.modelArn,
    this.parsingPrompt,
  });

  factory BedrockFoundationModelConfigurationForParsing.fromJson(
      Map<String, dynamic> json) {
    return BedrockFoundationModelConfigurationForParsing(
      modelArn: (json['modelArn'] as String?) ?? '',
      parsingPrompt: json['parsingPrompt'] != null
          ? ParsingPrompt.fromJson(
              json['parsingPrompt'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final parsingPrompt = this.parsingPrompt;
    return {
      'modelArn': modelArn,
      if (parsingPrompt != null) 'parsingPrompt': parsingPrompt,
    };
  }
}

/// Instructions for interpreting the contents of a document.
///
/// @nodoc
class ParsingPrompt {
  /// Instructions for interpreting the contents of a document.
  final String parsingPromptText;

  ParsingPrompt({
    required this.parsingPromptText,
  });

  factory ParsingPrompt.fromJson(Map<String, dynamic> json) {
    return ParsingPrompt(
      parsingPromptText: (json['parsingPromptText'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final parsingPromptText = this.parsingPromptText;
    return {
      'parsingPromptText': parsingPromptText,
    };
  }
}

/// @nodoc
class ChunkingStrategy {
  static const fixedSize = ChunkingStrategy._('FIXED_SIZE');
  static const none = ChunkingStrategy._('NONE');
  static const hierarchical = ChunkingStrategy._('HIERARCHICAL');
  static const semantic = ChunkingStrategy._('SEMANTIC');

  final String value;

  const ChunkingStrategy._(this.value);

  static const values = [fixedSize, none, hierarchical, semantic];

  static ChunkingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChunkingStrategy._(value));

  @override
  bool operator ==(other) => other is ChunkingStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configurations for when you choose fixed-size chunking. If you set the
/// <code>chunkingStrategy</code> as <code>NONE</code>, exclude this field.
///
/// @nodoc
class FixedSizeChunkingConfiguration {
  /// The maximum number of tokens to include in a chunk.
  final int maxTokens;

  /// The percentage of overlap between adjacent chunks of a data source.
  final int overlapPercentage;

  FixedSizeChunkingConfiguration({
    required this.maxTokens,
    required this.overlapPercentage,
  });

  factory FixedSizeChunkingConfiguration.fromJson(Map<String, dynamic> json) {
    return FixedSizeChunkingConfiguration(
      maxTokens: (json['maxTokens'] as int?) ?? 0,
      overlapPercentage: (json['overlapPercentage'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final maxTokens = this.maxTokens;
    final overlapPercentage = this.overlapPercentage;
    return {
      'maxTokens': maxTokens,
      'overlapPercentage': overlapPercentage,
    };
  }
}

/// Settings for hierarchical document chunking for a data source. Hierarchical
/// chunking splits documents into layers of chunks where the first layer
/// contains large chunks, and the second layer contains smaller chunks derived
/// from the first layer.
///
/// @nodoc
class HierarchicalChunkingConfiguration {
  /// Token settings for each layer.
  final List<HierarchicalChunkingLevelConfiguration> levelConfigurations;

  /// The number of tokens to repeat across chunks in the same layer.
  final int overlapTokens;

  HierarchicalChunkingConfiguration({
    required this.levelConfigurations,
    required this.overlapTokens,
  });

  factory HierarchicalChunkingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return HierarchicalChunkingConfiguration(
      levelConfigurations: ((json['levelConfigurations'] as List?) ?? const [])
          .nonNulls
          .map((e) => HierarchicalChunkingLevelConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      overlapTokens: (json['overlapTokens'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final levelConfigurations = this.levelConfigurations;
    final overlapTokens = this.overlapTokens;
    return {
      'levelConfigurations': levelConfigurations,
      'overlapTokens': overlapTokens,
    };
  }
}

/// Settings for semantic document chunking for a data source. Semantic chunking
/// splits a document into smaller documents based on groups of similar content
/// derived from the text with natural language processing.
///
/// @nodoc
class SemanticChunkingConfiguration {
  /// The dissimilarity threshold for splitting chunks.
  final int breakpointPercentileThreshold;

  /// The buffer size.
  final int bufferSize;

  /// The maximum number of tokens that a chunk can contain.
  final int maxTokens;

  SemanticChunkingConfiguration({
    required this.breakpointPercentileThreshold,
    required this.bufferSize,
    required this.maxTokens,
  });

  factory SemanticChunkingConfiguration.fromJson(Map<String, dynamic> json) {
    return SemanticChunkingConfiguration(
      breakpointPercentileThreshold:
          (json['breakpointPercentileThreshold'] as int?) ?? 0,
      bufferSize: (json['bufferSize'] as int?) ?? 0,
      maxTokens: (json['maxTokens'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final breakpointPercentileThreshold = this.breakpointPercentileThreshold;
    final bufferSize = this.bufferSize;
    final maxTokens = this.maxTokens;
    return {
      'breakpointPercentileThreshold': breakpointPercentileThreshold,
      'bufferSize': bufferSize,
      'maxTokens': maxTokens,
    };
  }
}

/// Token settings for each layer.
///
/// @nodoc
class HierarchicalChunkingLevelConfiguration {
  /// The maximum number of tokens that a chunk can contain in this layer.
  final int maxTokens;

  HierarchicalChunkingLevelConfiguration({
    required this.maxTokens,
  });

  factory HierarchicalChunkingLevelConfiguration.fromJson(
      Map<String, dynamic> json) {
    return HierarchicalChunkingLevelConfiguration(
      maxTokens: (json['maxTokens'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final maxTokens = this.maxTokens;
    return {
      'maxTokens': maxTokens,
    };
  }
}

/// Summary information about the import job.
///
/// @nodoc
class ImportJobData {
  /// The timestamp when the import job was created.
  final DateTime createdTime;

  /// The identifier of the import job.
  final String importJobId;

  /// The type of the import job.
  final ImportJobType importJobType;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The timestamp when the import job data was last modified.
  final DateTime lastModifiedTime;

  /// The status of the import job.
  final ImportJobStatus status;

  /// A pointer to the uploaded asset. This value is returned by <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>.
  final String uploadId;

  /// The download link to the resource file that is uploaded to the import job.
  final String url;

  /// The expiration time of the URL as an epoch timestamp.
  final DateTime urlExpiry;
  final ExternalSourceConfiguration? externalSourceConfiguration;

  /// The link to download the information of resource data that failed to be
  /// imported.
  final String? failedRecordReport;

  /// The metadata fields of the imported Amazon Q in Connect resources.
  final Map<String, String>? metadata;

  ImportJobData({
    required this.createdTime,
    required this.importJobId,
    required this.importJobType,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.lastModifiedTime,
    required this.status,
    required this.uploadId,
    required this.url,
    required this.urlExpiry,
    this.externalSourceConfiguration,
    this.failedRecordReport,
    this.metadata,
  });

  factory ImportJobData.fromJson(Map<String, dynamic> json) {
    return ImportJobData(
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      importJobId: (json['importJobId'] as String?) ?? '',
      importJobType:
          ImportJobType.fromString((json['importJobType'] as String?) ?? ''),
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      status: ImportJobStatus.fromString((json['status'] as String?) ?? ''),
      uploadId: (json['uploadId'] as String?) ?? '',
      url: (json['url'] as String?) ?? '',
      urlExpiry: nonNullableTimeStampFromJson(json['urlExpiry'] ?? 0),
      externalSourceConfiguration: json['externalSourceConfiguration'] != null
          ? ExternalSourceConfiguration.fromJson(
              json['externalSourceConfiguration'] as Map<String, dynamic>)
          : null,
      failedRecordReport: json['failedRecordReport'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final importJobId = this.importJobId;
    final importJobType = this.importJobType;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final lastModifiedTime = this.lastModifiedTime;
    final status = this.status;
    final uploadId = this.uploadId;
    final url = this.url;
    final urlExpiry = this.urlExpiry;
    final externalSourceConfiguration = this.externalSourceConfiguration;
    final failedRecordReport = this.failedRecordReport;
    final metadata = this.metadata;
    return {
      'createdTime': unixTimestampToJson(createdTime),
      'importJobId': importJobId,
      'importJobType': importJobType.value,
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'status': status.value,
      'uploadId': uploadId,
      'url': url,
      'urlExpiry': unixTimestampToJson(urlExpiry),
      if (externalSourceConfiguration != null)
        'externalSourceConfiguration': externalSourceConfiguration,
      if (failedRecordReport != null) 'failedRecordReport': failedRecordReport,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// @nodoc
class ImportJobType {
  static const quickResponses = ImportJobType._('QUICK_RESPONSES');

  final String value;

  const ImportJobType._(this.value);

  static const values = [quickResponses];

  static ImportJobType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImportJobType._(value));

  @override
  bool operator ==(other) => other is ImportJobType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ImportJobStatus {
  static const startInProgress = ImportJobStatus._('START_IN_PROGRESS');
  static const failed = ImportJobStatus._('FAILED');
  static const complete = ImportJobStatus._('COMPLETE');
  static const deleteInProgress = ImportJobStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = ImportJobStatus._('DELETE_FAILED');
  static const deleted = ImportJobStatus._('DELETED');

  final String value;

  const ImportJobStatus._(this.value);

  static const values = [
    startInProgress,
    failed,
    complete,
    deleteInProgress,
    deleteFailed,
    deleted
  ];

  static ImportJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImportJobStatus._(value));

  @override
  bool operator ==(other) => other is ImportJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration information of the external data source.
///
/// @nodoc
class ExternalSourceConfiguration {
  /// The configuration information of the external data source.
  final Configuration configuration;

  /// The type of the external data source.
  final ExternalSource source;

  ExternalSourceConfiguration({
    required this.configuration,
    required this.source,
  });

  factory ExternalSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return ExternalSourceConfiguration(
      configuration: Configuration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      source: ExternalSource.fromString((json['source'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final source = this.source;
    return {
      'configuration': configuration,
      'source': source.value,
    };
  }
}

/// @nodoc
class ExternalSource {
  static const amazonConnect = ExternalSource._('AMAZON_CONNECT');

  final String value;

  const ExternalSource._(this.value);

  static const values = [amazonConnect];

  static ExternalSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExternalSource._(value));

  @override
  bool operator ==(other) => other is ExternalSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration information of the external data source.
///
/// @nodoc
class Configuration {
  /// The configuration information of the Amazon Connect data source.
  final ConnectConfiguration? connectConfiguration;

  Configuration({
    this.connectConfiguration,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      connectConfiguration: json['connectConfiguration'] != null
          ? ConnectConfiguration.fromJson(
              json['connectConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectConfiguration = this.connectConfiguration;
    return {
      if (connectConfiguration != null)
        'connectConfiguration': connectConfiguration,
    };
  }
}

/// The configuration information of the Amazon Connect data source.
///
/// @nodoc
class ConnectConfiguration {
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  final String? instanceId;

  ConnectConfiguration({
    this.instanceId,
  });

  factory ConnectConfiguration.fromJson(Map<String, dynamic> json) {
    return ConnectConfiguration(
      instanceId: json['instanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    return {
      if (instanceId != null) 'instanceId': instanceId,
    };
  }
}

/// The result of quick response search.
///
/// @nodoc
class QuickResponseSearchResultData {
  /// The media type of the quick response content.
  ///
  /// <ul>
  /// <li>
  /// Use <code>application/x.quickresponse;format=plain</code> for quick response
  /// written in plain text.
  /// </li>
  /// <li>
  /// Use <code>application/x.quickresponse;format=markdown</code> for quick
  /// response written in richtext.
  /// </li>
  /// </ul>
  final String contentType;

  /// The contents of the quick response.
  final QuickResponseContents contents;

  /// The timestamp when the quick response was created.
  final DateTime createdTime;

  /// Whether the quick response is active.
  final bool isActive;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  final String knowledgeBaseId;

  /// The timestamp when the quick response search result data was last modified.
  final DateTime lastModifiedTime;

  /// The name of the quick response.
  final String name;

  /// The Amazon Resource Name (ARN) of the quick response.
  final String quickResponseArn;

  /// The identifier of the quick response.
  final String quickResponseId;

  /// The resource status of the quick response.
  final QuickResponseStatus status;

  /// The user defined contact attributes that are resolved when the search result
  /// is returned.
  final List<String>? attributesInterpolated;

  /// The user defined contact attributes that are not resolved when the search
  /// result is returned.
  final List<String>? attributesNotInterpolated;

  /// The Amazon Connect contact channels this quick response applies to. The
  /// supported contact channel types include <code>Chat</code>.
  final List<String>? channels;

  /// The description of the quick response.
  final String? description;

  /// The configuration information of the user groups that the quick response is
  /// accessible to.
  final GroupingConfiguration? groupingConfiguration;

  /// The language code value for the language in which the quick response is
  /// written.
  final String? language;

  /// The Amazon Resource Name (ARN) of the user who last updated the quick
  /// response search result data.
  final String? lastModifiedBy;

  /// The shortcut key of the quick response. The value should be unique across
  /// the knowledge base.
  final String? shortcutKey;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  QuickResponseSearchResultData({
    required this.contentType,
    required this.contents,
    required this.createdTime,
    required this.isActive,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.lastModifiedTime,
    required this.name,
    required this.quickResponseArn,
    required this.quickResponseId,
    required this.status,
    this.attributesInterpolated,
    this.attributesNotInterpolated,
    this.channels,
    this.description,
    this.groupingConfiguration,
    this.language,
    this.lastModifiedBy,
    this.shortcutKey,
    this.tags,
  });

  factory QuickResponseSearchResultData.fromJson(Map<String, dynamic> json) {
    return QuickResponseSearchResultData(
      contentType: (json['contentType'] as String?) ?? '',
      contents: QuickResponseContents.fromJson(
          (json['contents'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      isActive: (json['isActive'] as bool?) ?? false,
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      quickResponseArn: (json['quickResponseArn'] as String?) ?? '',
      quickResponseId: (json['quickResponseId'] as String?) ?? '',
      status: QuickResponseStatus.fromString((json['status'] as String?) ?? ''),
      attributesInterpolated: (json['attributesInterpolated'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      attributesNotInterpolated: (json['attributesNotInterpolated'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      channels: (json['channels'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      groupingConfiguration: json['groupingConfiguration'] != null
          ? GroupingConfiguration.fromJson(
              json['groupingConfiguration'] as Map<String, dynamic>)
          : null,
      language: json['language'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      shortcutKey: json['shortcutKey'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final contents = this.contents;
    final createdTime = this.createdTime;
    final isActive = this.isActive;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final quickResponseArn = this.quickResponseArn;
    final quickResponseId = this.quickResponseId;
    final status = this.status;
    final attributesInterpolated = this.attributesInterpolated;
    final attributesNotInterpolated = this.attributesNotInterpolated;
    final channels = this.channels;
    final description = this.description;
    final groupingConfiguration = this.groupingConfiguration;
    final language = this.language;
    final lastModifiedBy = this.lastModifiedBy;
    final shortcutKey = this.shortcutKey;
    final tags = this.tags;
    return {
      'contentType': contentType,
      'contents': contents,
      'createdTime': unixTimestampToJson(createdTime),
      'isActive': isActive,
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'name': name,
      'quickResponseArn': quickResponseArn,
      'quickResponseId': quickResponseId,
      'status': status.value,
      if (attributesInterpolated != null)
        'attributesInterpolated': attributesInterpolated,
      if (attributesNotInterpolated != null)
        'attributesNotInterpolated': attributesNotInterpolated,
      if (channels != null) 'channels': channels,
      if (description != null) 'description': description,
      if (groupingConfiguration != null)
        'groupingConfiguration': groupingConfiguration,
      if (language != null) 'language': language,
      if (lastModifiedBy != null) 'lastModifiedBy': lastModifiedBy,
      if (shortcutKey != null) 'shortcutKey': shortcutKey,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information about the import job.
///
/// @nodoc
class QuickResponseSearchExpression {
  /// The configuration of filtering rules applied to quick response query
  /// results.
  final List<QuickResponseFilterField>? filters;

  /// The quick response attribute fields on which the query results are ordered.
  final QuickResponseOrderField? orderOnField;

  /// The quick response query expressions.
  final List<QuickResponseQueryField>? queries;

  QuickResponseSearchExpression({
    this.filters,
    this.orderOnField,
    this.queries,
  });

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final orderOnField = this.orderOnField;
    final queries = this.queries;
    return {
      if (filters != null) 'filters': filters,
      if (orderOnField != null) 'orderOnField': orderOnField,
      if (queries != null) 'queries': queries,
    };
  }
}

/// The quick response fields to order the quick response query results by.
///
/// The following is the list of supported field names.
///
/// <ul>
/// <li>
/// name
/// </li>
/// <li>
/// description
/// </li>
/// <li>
/// shortcutKey
/// </li>
/// <li>
/// isActive
/// </li>
/// <li>
/// channels
/// </li>
/// <li>
/// language
/// </li>
/// <li>
/// contentType
/// </li>
/// <li>
/// createdTime
/// </li>
/// <li>
/// lastModifiedTime
/// </li>
/// <li>
/// lastModifiedBy
/// </li>
/// <li>
/// groupingConfiguration.criteria
/// </li>
/// <li>
/// groupingConfiguration.values
/// </li>
/// </ul>
///
/// @nodoc
class QuickResponseOrderField {
  /// The name of the attribute to order the quick response query results by.
  final String name;

  /// The order at which the quick responses are sorted by.
  final Order? order;

  QuickResponseOrderField({
    required this.name,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final order = this.order;
    return {
      'name': name,
      if (order != null) 'order': order.value,
    };
  }
}

/// @nodoc
class Order {
  static const asc = Order._('ASC');
  static const desc = Order._('DESC');

  final String value;

  const Order._(this.value);

  static const values = [asc, desc];

  static Order fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Order._(value));

  @override
  bool operator ==(other) => other is Order && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The quick response fields to filter the quick response query results by.
///
/// The following is the list of supported field names.
///
/// <ul>
/// <li>
/// name
/// </li>
/// <li>
/// description
/// </li>
/// <li>
/// shortcutKey
/// </li>
/// <li>
/// isActive
/// </li>
/// <li>
/// channels
/// </li>
/// <li>
/// language
/// </li>
/// <li>
/// contentType
/// </li>
/// <li>
/// createdTime
/// </li>
/// <li>
/// lastModifiedTime
/// </li>
/// <li>
/// lastModifiedBy
/// </li>
/// <li>
/// groupingConfiguration.criteria
/// </li>
/// <li>
/// groupingConfiguration.values
/// </li>
/// </ul>
///
/// @nodoc
class QuickResponseFilterField {
  /// The name of the attribute field to filter the quick responses by.
  final String name;

  /// The operator to use for filtering.
  final QuickResponseFilterOperator operator;

  /// Whether to treat null value as a match for the attribute field.
  final bool? includeNoExistence;

  /// The values of attribute field to filter the quick response by.
  final List<String>? values;

  QuickResponseFilterField({
    required this.name,
    required this.operator,
    this.includeNoExistence,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final includeNoExistence = this.includeNoExistence;
    final values = this.values;
    return {
      'name': name,
      'operator': operator.value,
      if (includeNoExistence != null) 'includeNoExistence': includeNoExistence,
      if (values != null) 'values': values,
    };
  }
}

/// @nodoc
class QuickResponseFilterOperator {
  static const equals = QuickResponseFilterOperator._('EQUALS');
  static const prefix = QuickResponseFilterOperator._('PREFIX');

  final String value;

  const QuickResponseFilterOperator._(this.value);

  static const values = [equals, prefix];

  static QuickResponseFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QuickResponseFilterOperator._(value));

  @override
  bool operator ==(other) =>
      other is QuickResponseFilterOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The quick response fields to query quick responses by.
///
/// The following is the list of supported field names.
///
/// <ul>
/// <li>
/// content
/// </li>
/// <li>
/// name
/// </li>
/// <li>
/// description
/// </li>
/// <li>
/// shortcutKey
/// </li>
/// </ul>
///
/// @nodoc
class QuickResponseQueryField {
  /// The name of the attribute to query the quick responses by.
  final String name;

  /// The operator to use for matching attribute field values in the query.
  final QuickResponseQueryOperator operator;

  /// The values of the attribute to query the quick responses by.
  final List<String> values;

  /// Whether the query expects only exact matches on the attribute field values.
  /// The results of the query will only include exact matches if this parameter
  /// is set to false.
  final bool? allowFuzziness;

  /// The importance of the attribute field when calculating query result
  /// relevancy scores. The value set for this parameter affects the ordering of
  /// search results.
  final Priority? priority;

  QuickResponseQueryField({
    required this.name,
    required this.operator,
    required this.values,
    this.allowFuzziness,
    this.priority,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    final allowFuzziness = this.allowFuzziness;
    final priority = this.priority;
    return {
      'name': name,
      'operator': operator.value,
      'values': values,
      if (allowFuzziness != null) 'allowFuzziness': allowFuzziness,
      if (priority != null) 'priority': priority.value,
    };
  }
}

/// @nodoc
class QuickResponseQueryOperator {
  static const contains = QuickResponseQueryOperator._('CONTAINS');
  static const containsAndPrefix =
      QuickResponseQueryOperator._('CONTAINS_AND_PREFIX');

  final String value;

  const QuickResponseQueryOperator._(this.value);

  static const values = [contains, containsAndPrefix];

  static QuickResponseQueryOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QuickResponseQueryOperator._(value));

  @override
  bool operator ==(other) =>
      other is QuickResponseQueryOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Priority {
  static const high = Priority._('HIGH');
  static const medium = Priority._('MEDIUM');
  static const low = Priority._('LOW');

  final String value;

  const Priority._(this.value);

  static const values = [high, medium, low];

  static Priority fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Priority._(value));

  @override
  bool operator ==(other) => other is Priority && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The result of message template search.
///
/// @nodoc
class MessageTemplateSearchResultData {
  /// The channel subtype this message template applies to.
  final ChannelSubtype channelSubtype;

  /// The timestamp when the message template was created.
  final DateTime createdTime;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The Amazon Resource Name (ARN) of the user who last updated the message
  /// template data.
  final String lastModifiedBy;

  /// The timestamp when the message template data was last modified.
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the message template.
  final String messageTemplateArn;

  /// The identifier of the message template.
  final String messageTemplateId;

  /// The name of the message template.
  final String name;

  /// The channel of the message template.
  final String? channel;

  /// The description of the message template.
  final String? description;
  final GroupingConfiguration? groupingConfiguration;

  /// Whether the version of the message template is activated.
  final bool? isActive;

  /// The language code value for the language in which the quick response is
  /// written. The supported language codes include <code>de_DE</code>,
  /// <code>en_US</code>, <code>es_ES</code>, <code>fr_FR</code>,
  /// <code>id_ID</code>, <code>it_IT</code>, <code>ja_JP</code>,
  /// <code>ko_KR</code>, <code>pt_BR</code>, <code>zh_CN</code>,
  /// <code>zh_TW</code>
  final String? language;

  /// The source configuration summary of the message template.
  final MessageTemplateSourceConfigurationSummary? sourceConfigurationSummary;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// The version number of the message template version.
  final int? versionNumber;

  MessageTemplateSearchResultData({
    required this.channelSubtype,
    required this.createdTime,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.lastModifiedBy,
    required this.lastModifiedTime,
    required this.messageTemplateArn,
    required this.messageTemplateId,
    required this.name,
    this.channel,
    this.description,
    this.groupingConfiguration,
    this.isActive,
    this.language,
    this.sourceConfigurationSummary,
    this.tags,
    this.versionNumber,
  });

  factory MessageTemplateSearchResultData.fromJson(Map<String, dynamic> json) {
    return MessageTemplateSearchResultData(
      channelSubtype:
          ChannelSubtype.fromString((json['channelSubtype'] as String?) ?? ''),
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      lastModifiedBy: (json['lastModifiedBy'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      messageTemplateArn: (json['messageTemplateArn'] as String?) ?? '',
      messageTemplateId: (json['messageTemplateId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      channel: json['channel'] as String?,
      description: json['description'] as String?,
      groupingConfiguration: json['groupingConfiguration'] != null
          ? GroupingConfiguration.fromJson(
              json['groupingConfiguration'] as Map<String, dynamic>)
          : null,
      isActive: json['isActive'] as bool?,
      language: json['language'] as String?,
      sourceConfigurationSummary: json['sourceConfigurationSummary'] != null
          ? MessageTemplateSourceConfigurationSummary.fromJson(
              json['sourceConfigurationSummary'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelSubtype = this.channelSubtype;
    final createdTime = this.createdTime;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedTime = this.lastModifiedTime;
    final messageTemplateArn = this.messageTemplateArn;
    final messageTemplateId = this.messageTemplateId;
    final name = this.name;
    final channel = this.channel;
    final description = this.description;
    final groupingConfiguration = this.groupingConfiguration;
    final isActive = this.isActive;
    final language = this.language;
    final sourceConfigurationSummary = this.sourceConfigurationSummary;
    final tags = this.tags;
    final versionNumber = this.versionNumber;
    return {
      'channelSubtype': channelSubtype.value,
      'createdTime': iso8601ToJson(createdTime),
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      'messageTemplateArn': messageTemplateArn,
      'messageTemplateId': messageTemplateId,
      'name': name,
      if (channel != null) 'channel': channel,
      if (description != null) 'description': description,
      if (groupingConfiguration != null)
        'groupingConfiguration': groupingConfiguration,
      if (isActive != null) 'isActive': isActive,
      if (language != null) 'language': language,
      if (sourceConfigurationSummary != null)
        'sourceConfigurationSummary': sourceConfigurationSummary,
      if (tags != null) 'tags': tags,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// The search expression of the message template.
///
/// @nodoc
class MessageTemplateSearchExpression {
  /// The configuration of filtering rules applied to message template query
  /// results.
  final List<MessageTemplateFilterField>? filters;

  /// The message template attribute fields on which the query results are
  /// ordered.
  final MessageTemplateOrderField? orderOnField;

  /// The message template query expressions.
  final List<MessageTemplateQueryField>? queries;

  MessageTemplateSearchExpression({
    this.filters,
    this.orderOnField,
    this.queries,
  });

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final orderOnField = this.orderOnField;
    final queries = this.queries;
    return {
      if (filters != null) 'filters': filters,
      if (orderOnField != null) 'orderOnField': orderOnField,
      if (queries != null) 'queries': queries,
    };
  }
}

/// The message template fields to order the message template query results by.
/// The following is the list of supported field names:
///
/// <ul>
/// <li>
/// name
/// </li>
/// <li>
/// description
/// </li>
/// <li>
/// channel
/// </li>
/// <li>
/// channelSubtype
/// </li>
/// <li>
/// language
/// </li>
/// <li>
/// qualifier
/// </li>
/// <li>
/// createdTime
/// </li>
/// <li>
/// lastModifiedTime
/// </li>
/// <li>
/// lastModifiedBy
/// </li>
/// <li>
/// groupingConfiguration.criteria
/// </li>
/// <li>
/// groupingConfiguration.values
/// </li>
/// </ul>
///
/// @nodoc
class MessageTemplateOrderField {
  /// The name of the message template.
  final String name;

  /// The order at which the message templates are sorted by.
  final Order? order;

  MessageTemplateOrderField({
    required this.name,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final order = this.order;
    return {
      'name': name,
      if (order != null) 'order': order.value,
    };
  }
}

/// The message template fields to filter the message template query results by.
/// The following is the list of supported field names:
///
/// <ul>
/// <li>
/// name
/// </li>
/// <li>
/// description
/// </li>
/// <li>
/// channel
/// </li>
/// <li>
/// channelSubtype
/// </li>
/// <li>
/// language
/// </li>
/// <li>
/// qualifier
/// </li>
/// <li>
/// createdTime
/// </li>
/// <li>
/// lastModifiedTime
/// </li>
/// <li>
/// lastModifiedBy
/// </li>
/// <li>
/// groupingConfiguration.criteria
/// </li>
/// <li>
/// groupingConfiguration.values
/// </li>
/// </ul>
///
/// @nodoc
class MessageTemplateFilterField {
  /// The name of the attribute field to filter the message templates by.
  final String name;

  /// The operator to use for filtering.
  final MessageTemplateFilterOperator operator;

  /// Whether to treat null value as a match for the attribute field.
  final bool? includeNoExistence;

  /// The values of attribute field to filter the message template by.
  final List<String>? values;

  MessageTemplateFilterField({
    required this.name,
    required this.operator,
    this.includeNoExistence,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final includeNoExistence = this.includeNoExistence;
    final values = this.values;
    return {
      'name': name,
      'operator': operator.value,
      if (includeNoExistence != null) 'includeNoExistence': includeNoExistence,
      if (values != null) 'values': values,
    };
  }
}

/// @nodoc
class MessageTemplateFilterOperator {
  static const equals = MessageTemplateFilterOperator._('EQUALS');
  static const prefix = MessageTemplateFilterOperator._('PREFIX');

  final String value;

  const MessageTemplateFilterOperator._(this.value);

  static const values = [equals, prefix];

  static MessageTemplateFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MessageTemplateFilterOperator._(value));

  @override
  bool operator ==(other) =>
      other is MessageTemplateFilterOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The message template fields to query message templates by. The following is
/// the list of supported field names:
///
/// <ul>
/// <li>
/// name
/// </li>
/// <li>
/// description
/// </li>
/// </ul>
///
/// @nodoc
class MessageTemplateQueryField {
  /// The name of the attribute to query the message templates by.
  final String name;

  /// The operator to use for matching attribute field values in the query.
  final MessageTemplateQueryOperator operator;

  /// The values of the attribute to query the message templates by.
  final List<String> values;

  /// Whether the query expects only exact matches on the attribute field values.
  /// The results of the query will only include exact matches if this parameter
  /// is set to false.
  final bool? allowFuzziness;

  /// The importance of the attribute field when calculating query result
  /// relevancy scores. The value set for this parameter affects the ordering of
  /// search results.
  final Priority? priority;

  MessageTemplateQueryField({
    required this.name,
    required this.operator,
    required this.values,
    this.allowFuzziness,
    this.priority,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    final allowFuzziness = this.allowFuzziness;
    final priority = this.priority;
    return {
      'name': name,
      'operator': operator.value,
      'values': values,
      if (allowFuzziness != null) 'allowFuzziness': allowFuzziness,
      if (priority != null) 'priority': priority.value,
    };
  }
}

/// @nodoc
class MessageTemplateQueryOperator {
  static const contains = MessageTemplateQueryOperator._('CONTAINS');
  static const containsAndPrefix =
      MessageTemplateQueryOperator._('CONTAINS_AND_PREFIX');

  final String value;

  const MessageTemplateQueryOperator._(this.value);

  static const values = [contains, containsAndPrefix];

  static MessageTemplateQueryOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MessageTemplateQueryOperator._(value));

  @override
  bool operator ==(other) =>
      other is MessageTemplateQueryOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The search expression.
///
/// @nodoc
class SearchExpression {
  /// The search expression filters.
  final List<Filter> filters;

  SearchExpression({
    required this.filters,
  });

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    return {
      'filters': filters,
    };
  }
}

/// A search filter.
///
/// @nodoc
class Filter {
  /// The field on which to filter.
  final FilterField field;

  /// The operator to use for comparing the field’s value with the provided value.
  final FilterOperator operator;

  /// The desired field value on which to filter.
  final String value;

  Filter({
    required this.field,
    required this.operator,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final field = this.field;
    final operator = this.operator;
    final value = this.value;
    return {
      'field': field.value,
      'operator': operator.value,
      'value': value,
    };
  }
}

/// @nodoc
class FilterField {
  static const name = FilterField._('NAME');

  final String value;

  const FilterField._(this.value);

  static const values = [name];

  static FilterField fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FilterField._(value));

  @override
  bool operator ==(other) => other is FilterField && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FilterOperator {
  static const equals = FilterOperator._('EQUALS');

  final String value;

  const FilterOperator._(this.value);

  static const values = [equals];

  static FilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FilterOperator._(value));

  @override
  bool operator ==(other) => other is FilterOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about the import job.
///
/// @nodoc
class ImportJobSummary {
  /// The timestamp when the import job was created.
  final DateTime createdTime;

  /// The identifier of the import job.
  final String importJobId;

  /// The type of import job.
  final ImportJobType importJobType;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The timestamp when the import job was last modified.
  final DateTime lastModifiedTime;

  /// The status of the import job.
  final ImportJobStatus status;

  /// A pointer to the uploaded asset. This value is returned by <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>.
  final String uploadId;

  /// The configuration information of the external source that the resource data
  /// are imported from.
  final ExternalSourceConfiguration? externalSourceConfiguration;

  /// The metadata fields of the imported Amazon Q in Connect resources.
  final Map<String, String>? metadata;

  ImportJobSummary({
    required this.createdTime,
    required this.importJobId,
    required this.importJobType,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.lastModifiedTime,
    required this.status,
    required this.uploadId,
    this.externalSourceConfiguration,
    this.metadata,
  });

  factory ImportJobSummary.fromJson(Map<String, dynamic> json) {
    return ImportJobSummary(
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      importJobId: (json['importJobId'] as String?) ?? '',
      importJobType:
          ImportJobType.fromString((json['importJobType'] as String?) ?? ''),
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      status: ImportJobStatus.fromString((json['status'] as String?) ?? ''),
      uploadId: (json['uploadId'] as String?) ?? '',
      externalSourceConfiguration: json['externalSourceConfiguration'] != null
          ? ExternalSourceConfiguration.fromJson(
              json['externalSourceConfiguration'] as Map<String, dynamic>)
          : null,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final importJobId = this.importJobId;
    final importJobType = this.importJobType;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final lastModifiedTime = this.lastModifiedTime;
    final status = this.status;
    final uploadId = this.uploadId;
    final externalSourceConfiguration = this.externalSourceConfiguration;
    final metadata = this.metadata;
    return {
      'createdTime': unixTimestampToJson(createdTime),
      'importJobId': importJobId,
      'importJobType': importJobType.value,
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'status': status.value,
      'uploadId': uploadId,
      if (externalSourceConfiguration != null)
        'externalSourceConfiguration': externalSourceConfiguration,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// Summary information about the knowledge base.
///
/// @nodoc
class KnowledgeBaseSummary {
  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The type of knowledge base.
  final KnowledgeBaseType knowledgeBaseType;

  /// The name of the knowledge base.
  final String name;

  /// The status of the knowledge base summary.
  final KnowledgeBaseStatus status;

  /// The description of the knowledge base.
  final String? description;

  /// Information about how to render the content.
  final RenderingConfiguration? renderingConfiguration;

  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// This KMS key must have a policy that allows <code>kms:CreateGrant</code>,
  /// <code>kms:DescribeKey</code>, <code>kms:Decrypt</code>, and
  /// <code>kms:GenerateDataKey*</code> permissions to the IAM identity using the
  /// key to invoke Amazon Q in Connect.
  ///
  /// For more information about setting up a customer managed key for Amazon Q in
  /// Connect, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-q.html">Enable
  /// Amazon Q in Connect for your instance</a>.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// Configuration information about the external data source.
  final SourceConfiguration? sourceConfiguration;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Contains details about how to ingest the documents in a data source.
  final VectorIngestionConfiguration? vectorIngestionConfiguration;

  KnowledgeBaseSummary({
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.knowledgeBaseType,
    required this.name,
    required this.status,
    this.description,
    this.renderingConfiguration,
    this.serverSideEncryptionConfiguration,
    this.sourceConfiguration,
    this.tags,
    this.vectorIngestionConfiguration,
  });

  factory KnowledgeBaseSummary.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseSummary(
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      knowledgeBaseType: KnowledgeBaseType.fromString(
          (json['knowledgeBaseType'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      status: KnowledgeBaseStatus.fromString((json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      renderingConfiguration: json['renderingConfiguration'] != null
          ? RenderingConfiguration.fromJson(
              json['renderingConfiguration'] as Map<String, dynamic>)
          : null,
      serverSideEncryptionConfiguration:
          json['serverSideEncryptionConfiguration'] != null
              ? ServerSideEncryptionConfiguration.fromJson(
                  json['serverSideEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      sourceConfiguration: json['sourceConfiguration'] != null
          ? SourceConfiguration.fromJson(
              json['sourceConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vectorIngestionConfiguration: json['vectorIngestionConfiguration'] != null
          ? VectorIngestionConfiguration.fromJson(
              json['vectorIngestionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final knowledgeBaseType = this.knowledgeBaseType;
    final name = this.name;
    final status = this.status;
    final description = this.description;
    final renderingConfiguration = this.renderingConfiguration;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final sourceConfiguration = this.sourceConfiguration;
    final tags = this.tags;
    final vectorIngestionConfiguration = this.vectorIngestionConfiguration;
    return {
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'knowledgeBaseType': knowledgeBaseType.value,
      'name': name,
      'status': status.value,
      if (description != null) 'description': description,
      if (renderingConfiguration != null)
        'renderingConfiguration': renderingConfiguration,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (sourceConfiguration != null)
        'sourceConfiguration': sourceConfiguration,
      if (tags != null) 'tags': tags,
      if (vectorIngestionConfiguration != null)
        'vectorIngestionConfiguration': vectorIngestionConfiguration,
    };
  }
}

/// @nodoc
class SessionDataNamespace {
  static const custom = SessionDataNamespace._('Custom');

  final String value;

  const SessionDataNamespace._(this.value);

  static const values = [custom];

  static SessionDataNamespace fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionDataNamespace._(value));

  @override
  bool operator ==(other) =>
      other is SessionDataNamespace && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The list of key-value pairs that are stored on the session.
///
/// @nodoc
class RuntimeSessionData {
  /// The key of the data stored on the session.
  final String key;

  /// The value of the data stored on the session.
  final RuntimeSessionDataValue value;

  RuntimeSessionData({
    required this.key,
    required this.value,
  });

  factory RuntimeSessionData.fromJson(Map<String, dynamic> json) {
    return RuntimeSessionData(
      key: (json['key'] as String?) ?? '',
      value: RuntimeSessionDataValue.fromJson(
          (json['value'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// A union type that specifies the data stored on the session.
///
/// @nodoc
class RuntimeSessionDataValue {
  /// The string value of the data stored on the session.
  final String? stringValue;

  RuntimeSessionDataValue({
    this.stringValue,
  });

  factory RuntimeSessionDataValue.fromJson(Map<String, dynamic> json) {
    return RuntimeSessionDataValue(
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stringValue = this.stringValue;
    return {
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// The configuration for a <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_amazon-q-connect_SendMessage.html">SendMessage</a>
/// request.
///
/// @nodoc
class MessageConfiguration {
  /// Configuration for generating chunked messages.
  final bool? generateChunkedMessage;

  /// Generates a filler response when tool selection is <code>QUESTION</code>.
  final bool? generateFillerMessage;

  MessageConfiguration({
    this.generateChunkedMessage,
    this.generateFillerMessage,
  });

  factory MessageConfiguration.fromJson(Map<String, dynamic> json) {
    return MessageConfiguration(
      generateChunkedMessage: json['generateChunkedMessage'] as bool?,
      generateFillerMessage: json['generateFillerMessage'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final generateChunkedMessage = this.generateChunkedMessage;
    final generateFillerMessage = this.generateFillerMessage;
    return {
      if (generateChunkedMessage != null)
        'generateChunkedMessage': generateChunkedMessage,
      if (generateFillerMessage != null)
        'generateFillerMessage': generateFillerMessage,
    };
  }
}

/// @nodoc
class MessageType {
  static const text = MessageType._('TEXT');
  static const toolUseResult = MessageType._('TOOL_USE_RESULT');

  final String value;

  const MessageType._(this.value);

  static const values = [text, toolUseResult];

  static MessageType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MessageType._(value));

  @override
  bool operator ==(other) => other is MessageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The message input.
///
/// @nodoc
class MessageInput {
  /// The message input value.
  final MessageData value;

  MessageInput({
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

/// The conversation context to include in SendMessage.
///
/// @nodoc
class ConversationContext {
  /// The self service conversation history before the Amazon Q in Connect
  /// session.
  final List<SelfServiceConversationHistory> selfServiceConversationHistory;

  ConversationContext({
    required this.selfServiceConversationHistory,
  });

  Map<String, dynamic> toJson() {
    final selfServiceConversationHistory = this.selfServiceConversationHistory;
    return {
      'selfServiceConversationHistory': selfServiceConversationHistory,
    };
  }
}

/// The conversation history data to included in conversation context data
/// before the Amazon Q in Connect session.
///
/// @nodoc
class SelfServiceConversationHistory {
  /// The bot response of the conversation history data.
  final String? botResponse;

  /// The input transcript of the conversation history data.
  final String? inputTranscript;

  /// The timestamp of the conversation history entry.
  final DateTime? timestamp;

  /// The number of turn of the conversation history data.
  final int? turnNumber;

  SelfServiceConversationHistory({
    this.botResponse,
    this.inputTranscript,
    this.timestamp,
    this.turnNumber,
  });

  Map<String, dynamic> toJson() {
    final botResponse = this.botResponse;
    final inputTranscript = this.inputTranscript;
    final timestamp = this.timestamp;
    final turnNumber = this.turnNumber;
    return {
      if (botResponse != null) 'botResponse': botResponse,
      if (inputTranscript != null) 'inputTranscript': inputTranscript,
      if (timestamp != null) 'timestamp': unixTimestampToJson(timestamp),
      if (turnNumber != null) 'turnNumber': turnNumber,
    };
  }
}

/// The message data.
///
/// @nodoc
class MessageData {
  /// The message data in text type.
  final TextMessage? text;

  /// The result of tool usage in the message.
  final ToolUseResultData? toolUseResult;

  MessageData({
    this.text,
    this.toolUseResult,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
      text: json['text'] != null
          ? TextMessage.fromJson(json['text'] as Map<String, dynamic>)
          : null,
      toolUseResult: json['toolUseResult'] != null
          ? ToolUseResultData.fromJson(
              json['toolUseResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final toolUseResult = this.toolUseResult;
    return {
      if (text != null) 'text': text,
      if (toolUseResult != null) 'toolUseResult': toolUseResult,
    };
  }
}

/// The message data in text type.
///
/// @nodoc
class TextMessage {
  /// The AI Guardrail assessment for the text message.
  final AIGuardrailAssessment? aiGuardrailAssessment;

  /// The citations associated with the text message.
  final List<Citation>? citations;

  /// The value of the message data in text type.
  final String? value;

  TextMessage({
    this.aiGuardrailAssessment,
    this.citations,
    this.value,
  });

  factory TextMessage.fromJson(Map<String, dynamic> json) {
    return TextMessage(
      aiGuardrailAssessment: json['aiGuardrailAssessment'] != null
          ? AIGuardrailAssessment.fromJson(
              json['aiGuardrailAssessment'] as Map<String, dynamic>)
          : null,
      citations: (json['citations'] as List?)
          ?.nonNulls
          .map((e) => Citation.fromJson(e as Map<String, dynamic>))
          .toList(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiGuardrailAssessment = this.aiGuardrailAssessment;
    final citations = this.citations;
    final value = this.value;
    return {
      if (aiGuardrailAssessment != null)
        'aiGuardrailAssessment': aiGuardrailAssessment,
      if (citations != null) 'citations': citations,
      if (value != null) 'value': value,
    };
  }
}

/// Data about the result of tool usage.
///
/// @nodoc
class ToolUseResultData {
  /// The name of the tool that was used.
  final String toolName;

  /// The result of the tool usage.
  final Object toolResult;

  /// The identifier of the tool use instance.
  final String toolUseId;

  /// The input schema for the tool use result.
  final Object? inputSchema;

  ToolUseResultData({
    required this.toolName,
    required this.toolResult,
    required this.toolUseId,
    this.inputSchema,
  });

  factory ToolUseResultData.fromJson(Map<String, dynamic> json) {
    return ToolUseResultData(
      toolName: (json['toolName'] as String?) ?? '',
      toolResult: json['toolResult'] as Object,
      toolUseId: (json['toolUseId'] as String?) ?? '',
      inputSchema: json['inputSchema'],
    );
  }

  Map<String, dynamic> toJson() {
    final toolName = this.toolName;
    final toolResult = this.toolResult;
    final toolUseId = this.toolUseId;
    final inputSchema = this.inputSchema;
    return {
      'toolName': toolName,
      'toolResult': toolResult,
      'toolUseId': toolUseId,
      if (inputSchema != null) 'inputSchema': inputSchema,
    };
  }
}

/// The assessment information from the AI Guardrail.
///
/// @nodoc
class AIGuardrailAssessment {
  /// Indicates whether the AI Guardrail blocked the content.
  final bool blocked;

  AIGuardrailAssessment({
    required this.blocked,
  });

  factory AIGuardrailAssessment.fromJson(Map<String, dynamic> json) {
    return AIGuardrailAssessment(
      blocked: (json['blocked'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final blocked = this.blocked;
    return {
      'blocked': blocked,
    };
  }
}

/// A citation that references source content.
///
/// @nodoc
class Citation {
  final CitationSpan citationSpan;

  /// A type to define the KB origin of a cited content
  final ReferenceType referenceType;

  /// The identifier of the content being cited.
  final String? contentId;

  /// The identifier of the knowledge base containing the cited content.
  final String? knowledgeBaseId;

  /// The source URL for the citation.
  final String? sourceURL;

  /// The title of the cited content.
  final String? title;

  Citation({
    required this.citationSpan,
    required this.referenceType,
    this.contentId,
    this.knowledgeBaseId,
    this.sourceURL,
    this.title,
  });

  factory Citation.fromJson(Map<String, dynamic> json) {
    return Citation(
      citationSpan: CitationSpan.fromJson(
          (json['citationSpan'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      referenceType:
          ReferenceType.fromString((json['referenceType'] as String?) ?? ''),
      contentId: json['contentId'] as String?,
      knowledgeBaseId: json['knowledgeBaseId'] as String?,
      sourceURL: json['sourceURL'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final citationSpan = this.citationSpan;
    final referenceType = this.referenceType;
    final contentId = this.contentId;
    final knowledgeBaseId = this.knowledgeBaseId;
    final sourceURL = this.sourceURL;
    final title = this.title;
    return {
      'citationSpan': citationSpan,
      'referenceType': referenceType.value,
      if (contentId != null) 'contentId': contentId,
      if (knowledgeBaseId != null) 'knowledgeBaseId': knowledgeBaseId,
      if (sourceURL != null) 'sourceURL': sourceURL,
      if (title != null) 'title': title,
    };
  }
}

/// Contains information about where the text with a citation begins and ends in
/// the generated output.
///
/// @nodoc
class CitationSpan {
  /// Where the text with a citation starts in the generated output.
  final int? beginOffsetInclusive;

  /// Where the text with a citation ends in the generated output.
  final int? endOffsetExclusive;

  CitationSpan({
    this.beginOffsetInclusive,
    this.endOffsetExclusive,
  });

  factory CitationSpan.fromJson(Map<String, dynamic> json) {
    return CitationSpan(
      beginOffsetInclusive: json['beginOffsetInclusive'] as int?,
      endOffsetExclusive: json['endOffsetExclusive'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffsetInclusive = this.beginOffsetInclusive;
    final endOffsetExclusive = this.endOffsetExclusive;
    return {
      if (beginOffsetInclusive != null)
        'beginOffsetInclusive': beginOffsetInclusive,
      if (endOffsetExclusive != null) 'endOffsetExclusive': endOffsetExclusive,
    };
  }
}

/// @nodoc
class ReferenceType {
  static const webCrawler = ReferenceType._('WEB_CRAWLER');
  static const knowledgeBase = ReferenceType._('KNOWLEDGE_BASE');
  static const bedrockKbS3 = ReferenceType._('BEDROCK_KB_S3');
  static const bedrockKbWeb = ReferenceType._('BEDROCK_KB_WEB');
  static const bedrockKbConfluence = ReferenceType._('BEDROCK_KB_CONFLUENCE');
  static const bedrockKbSalesforce = ReferenceType._('BEDROCK_KB_SALESFORCE');
  static const bedrockKbSharepoint = ReferenceType._('BEDROCK_KB_SHAREPOINT');
  static const bedrockKbKendra = ReferenceType._('BEDROCK_KB_KENDRA');
  static const bedrockKbCustomDocument =
      ReferenceType._('BEDROCK_KB_CUSTOM_DOCUMENT');
  static const bedrockKbSql = ReferenceType._('BEDROCK_KB_SQL');

  final String value;

  const ReferenceType._(this.value);

  static const values = [
    webCrawler,
    knowledgeBase,
    bedrockKbS3,
    bedrockKbWeb,
    bedrockKbConfluence,
    bedrockKbSalesforce,
    bedrockKbSharepoint,
    bedrockKbKendra,
    bedrockKbCustomDocument,
    bedrockKbSql
  ];

  static ReferenceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReferenceType._(value));

  @override
  bool operator ==(other) => other is ReferenceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A span represents a unit of work during AI agent execution, capturing
/// timing, status, and contextual attributes.
///
/// @nodoc
class Span {
  /// UUID of the Connect AI Assistant resource
  final String assistantId;

  /// Span-specific contextual attributes
  final SpanAttributes attributes;

  /// Operation end time in milliseconds since epoch
  final DateTime endTimestamp;

  /// The service request ID that initiated the operation
  final String requestId;

  /// UUID of the Connect AI Session resource
  final String sessionId;

  /// Unique span identifier
  final String spanId;

  /// Service-defined operation name
  final String spanName;

  /// Operation relationship type
  final SpanType spanType;

  /// Operation start time in milliseconds since epoch
  final DateTime startTimestamp;

  /// Span completion status
  final SpanStatus status;

  /// The origin request identifier for end-to-end tracing.
  final String? originRequestId;

  /// Parent span identifier for hierarchy. Null for root spans.
  final String? parentSpanId;

  /// Human-readable error description when status is ERROR or TIMEOUT
  final String? statusDescription;

  Span({
    required this.assistantId,
    required this.attributes,
    required this.endTimestamp,
    required this.requestId,
    required this.sessionId,
    required this.spanId,
    required this.spanName,
    required this.spanType,
    required this.startTimestamp,
    required this.status,
    this.originRequestId,
    this.parentSpanId,
    this.statusDescription,
  });

  factory Span.fromJson(Map<String, dynamic> json) {
    return Span(
      assistantId: (json['assistantId'] as String?) ?? '',
      attributes: SpanAttributes.fromJson(
          (json['attributes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      endTimestamp: nonNullableTimeStampFromJson(json['endTimestamp'] ?? 0),
      requestId: (json['requestId'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      spanId: (json['spanId'] as String?) ?? '',
      spanName: (json['spanName'] as String?) ?? '',
      spanType: SpanType.fromString((json['spanType'] as String?) ?? ''),
      startTimestamp: nonNullableTimeStampFromJson(json['startTimestamp'] ?? 0),
      status: SpanStatus.fromString((json['status'] as String?) ?? ''),
      originRequestId: json['originRequestId'] as String?,
      parentSpanId: json['parentSpanId'] as String?,
      statusDescription: json['statusDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assistantId = this.assistantId;
    final attributes = this.attributes;
    final endTimestamp = this.endTimestamp;
    final requestId = this.requestId;
    final sessionId = this.sessionId;
    final spanId = this.spanId;
    final spanName = this.spanName;
    final spanType = this.spanType;
    final startTimestamp = this.startTimestamp;
    final status = this.status;
    final originRequestId = this.originRequestId;
    final parentSpanId = this.parentSpanId;
    final statusDescription = this.statusDescription;
    return {
      'assistantId': assistantId,
      'attributes': attributes,
      'endTimestamp': unixTimestampToJson(endTimestamp),
      'requestId': requestId,
      'sessionId': sessionId,
      'spanId': spanId,
      'spanName': spanName,
      'spanType': spanType.value,
      'startTimestamp': unixTimestampToJson(startTimestamp),
      'status': status.value,
      if (originRequestId != null) 'originRequestId': originRequestId,
      if (parentSpanId != null) 'parentSpanId': parentSpanId,
      if (statusDescription != null) 'statusDescription': statusDescription,
    };
  }
}

/// @nodoc
class SpanType {
  static const client = SpanType._('CLIENT');
  static const server = SpanType._('SERVER');
  static const internal = SpanType._('INTERNAL');

  final String value;

  const SpanType._(this.value);

  static const values = [client, server, internal];

  static SpanType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SpanType._(value));

  @override
  bool operator ==(other) => other is SpanType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SpanStatus {
  static const ok = SpanStatus._('OK');
  static const error = SpanStatus._('ERROR');
  static const timeout = SpanStatus._('TIMEOUT');

  final String value;

  const SpanStatus._(this.value);

  static const values = [ok, error, timeout];

  static SpanStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SpanStatus._(value));

  @override
  bool operator ==(other) => other is SpanStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contextual attributes capturing operation details, LLM configuration, usage
/// metrics, and conversation data
///
/// @nodoc
class SpanAttributes {
  /// Amazon Connect agent ID
  final String? agentId;

  /// AI agent ARN
  final String? aiAgentArn;

  /// AI agent identifier
  final String? aiAgentId;

  /// Entity that invoked the AI agent
  final String? aiAgentInvoker;

  /// AI agent name
  final String? aiAgentName;

  /// AI agent orchestrator use case
  final String? aiAgentOrchestratorUseCase;

  /// AI agent type
  final AIAgentType? aiAgentType;

  /// AI agent version number
  final int? aiAgentVersion;

  /// Number of input tokens that were retrieved from cache
  final int? cacheReadInputTokens;

  /// Number of input tokens that were written to cache in this request
  final int? cacheWriteInputTokens;

  /// Amazon Connect contact identifier
  final String? contactId;

  /// Error classification if span failed (e.g., throttle, timeout)
  final String? errorType;

  /// Guardrail assessments for the inference span. Absent on other span types and
  /// when no AI Guardrail is attached to the AI Agent.
  final List<SpanGuardrailAssessment>? guardrailAssessments;

  /// Amazon Connect contact identifier
  final String? initialContactId;

  /// Input message collection sent to LLM
  final List<SpanMessage>? inputMessages;

  /// Amazon Connect instance ARN
  final String? instanceArn;

  /// Action being performed
  final String? operationName;

  /// Output message collection received from LLM
  final List<SpanMessage>? outputMessages;

  /// AI prompt ARN
  final String? promptArn;

  /// AI prompt identifier
  final String? promptId;

  /// AI prompt name
  final String? promptName;

  /// AI prompt type
  final AIPromptType? promptType;

  /// AI prompt version number
  final int? promptVersion;

  /// Model provider identifier (e.g., aws.bedrock)
  final String? providerName;

  /// Maximum tokens configured for generation
  final int? requestMaxTokens;

  /// LLM model ID for request (e.g., anthropic.claude-3-sonnet)
  final String? requestModel;

  /// Generation termination reasons (e.g., stop, max_tokens)
  final List<String>? responseFinishReasons;

  /// Actual model used for response (usually matches requestModel)
  final String? responseModel;

  /// Session name
  final String? sessionName;

  /// System prompt instructions
  final List<SpanMessageValue>? systemInstructions;

  /// Sampling temperature for generation
  final double? temperature;

  /// Time to first token in milliseconds, measured from when Amazon Bedrock was
  /// invoked to when the first token was returned
  final int? timeToFirstTokenMs;

  /// Top-p sampling parameter for generation
  final double? topP;

  /// Number of input tokens in prompt
  final int? usageInputTokens;

  /// Number of output tokens in response
  final int? usageOutputTokens;

  /// Total tokens consumed (input + output)
  final int? usageTotalTokens;

  SpanAttributes({
    this.agentId,
    this.aiAgentArn,
    this.aiAgentId,
    this.aiAgentInvoker,
    this.aiAgentName,
    this.aiAgentOrchestratorUseCase,
    this.aiAgentType,
    this.aiAgentVersion,
    this.cacheReadInputTokens,
    this.cacheWriteInputTokens,
    this.contactId,
    this.errorType,
    this.guardrailAssessments,
    this.initialContactId,
    this.inputMessages,
    this.instanceArn,
    this.operationName,
    this.outputMessages,
    this.promptArn,
    this.promptId,
    this.promptName,
    this.promptType,
    this.promptVersion,
    this.providerName,
    this.requestMaxTokens,
    this.requestModel,
    this.responseFinishReasons,
    this.responseModel,
    this.sessionName,
    this.systemInstructions,
    this.temperature,
    this.timeToFirstTokenMs,
    this.topP,
    this.usageInputTokens,
    this.usageOutputTokens,
    this.usageTotalTokens,
  });

  factory SpanAttributes.fromJson(Map<String, dynamic> json) {
    return SpanAttributes(
      agentId: json['agentId'] as String?,
      aiAgentArn: json['aiAgentArn'] as String?,
      aiAgentId: json['aiAgentId'] as String?,
      aiAgentInvoker: json['aiAgentInvoker'] as String?,
      aiAgentName: json['aiAgentName'] as String?,
      aiAgentOrchestratorUseCase: json['aiAgentOrchestratorUseCase'] as String?,
      aiAgentType:
          (json['aiAgentType'] as String?)?.let(AIAgentType.fromString),
      aiAgentVersion: json['aiAgentVersion'] as int?,
      cacheReadInputTokens: json['cacheReadInputTokens'] as int?,
      cacheWriteInputTokens: json['cacheWriteInputTokens'] as int?,
      contactId: json['contactId'] as String?,
      errorType: json['errorType'] as String?,
      guardrailAssessments: (json['guardrailAssessments'] as List?)
          ?.nonNulls
          .map((e) =>
              SpanGuardrailAssessment.fromJson(e as Map<String, dynamic>))
          .toList(),
      initialContactId: json['initialContactId'] as String?,
      inputMessages: (json['inputMessages'] as List?)
          ?.nonNulls
          .map((e) => SpanMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      instanceArn: json['instanceArn'] as String?,
      operationName: json['operationName'] as String?,
      outputMessages: (json['outputMessages'] as List?)
          ?.nonNulls
          .map((e) => SpanMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      promptArn: json['promptArn'] as String?,
      promptId: json['promptId'] as String?,
      promptName: json['promptName'] as String?,
      promptType: (json['promptType'] as String?)?.let(AIPromptType.fromString),
      promptVersion: json['promptVersion'] as int?,
      providerName: json['providerName'] as String?,
      requestMaxTokens: json['requestMaxTokens'] as int?,
      requestModel: json['requestModel'] as String?,
      responseFinishReasons: (json['responseFinishReasons'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      responseModel: json['responseModel'] as String?,
      sessionName: json['sessionName'] as String?,
      systemInstructions: (json['systemInstructions'] as List?)
          ?.nonNulls
          .map((e) => SpanMessageValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: _s.parseJsonDouble(json['temperature']),
      timeToFirstTokenMs: json['timeToFirstTokenMs'] as int?,
      topP: _s.parseJsonDouble(json['topP']),
      usageInputTokens: json['usageInputTokens'] as int?,
      usageOutputTokens: json['usageOutputTokens'] as int?,
      usageTotalTokens: json['usageTotalTokens'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final aiAgentArn = this.aiAgentArn;
    final aiAgentId = this.aiAgentId;
    final aiAgentInvoker = this.aiAgentInvoker;
    final aiAgentName = this.aiAgentName;
    final aiAgentOrchestratorUseCase = this.aiAgentOrchestratorUseCase;
    final aiAgentType = this.aiAgentType;
    final aiAgentVersion = this.aiAgentVersion;
    final cacheReadInputTokens = this.cacheReadInputTokens;
    final cacheWriteInputTokens = this.cacheWriteInputTokens;
    final contactId = this.contactId;
    final errorType = this.errorType;
    final guardrailAssessments = this.guardrailAssessments;
    final initialContactId = this.initialContactId;
    final inputMessages = this.inputMessages;
    final instanceArn = this.instanceArn;
    final operationName = this.operationName;
    final outputMessages = this.outputMessages;
    final promptArn = this.promptArn;
    final promptId = this.promptId;
    final promptName = this.promptName;
    final promptType = this.promptType;
    final promptVersion = this.promptVersion;
    final providerName = this.providerName;
    final requestMaxTokens = this.requestMaxTokens;
    final requestModel = this.requestModel;
    final responseFinishReasons = this.responseFinishReasons;
    final responseModel = this.responseModel;
    final sessionName = this.sessionName;
    final systemInstructions = this.systemInstructions;
    final temperature = this.temperature;
    final timeToFirstTokenMs = this.timeToFirstTokenMs;
    final topP = this.topP;
    final usageInputTokens = this.usageInputTokens;
    final usageOutputTokens = this.usageOutputTokens;
    final usageTotalTokens = this.usageTotalTokens;
    return {
      if (agentId != null) 'agentId': agentId,
      if (aiAgentArn != null) 'aiAgentArn': aiAgentArn,
      if (aiAgentId != null) 'aiAgentId': aiAgentId,
      if (aiAgentInvoker != null) 'aiAgentInvoker': aiAgentInvoker,
      if (aiAgentName != null) 'aiAgentName': aiAgentName,
      if (aiAgentOrchestratorUseCase != null)
        'aiAgentOrchestratorUseCase': aiAgentOrchestratorUseCase,
      if (aiAgentType != null) 'aiAgentType': aiAgentType.value,
      if (aiAgentVersion != null) 'aiAgentVersion': aiAgentVersion,
      if (cacheReadInputTokens != null)
        'cacheReadInputTokens': cacheReadInputTokens,
      if (cacheWriteInputTokens != null)
        'cacheWriteInputTokens': cacheWriteInputTokens,
      if (contactId != null) 'contactId': contactId,
      if (errorType != null) 'errorType': errorType,
      if (guardrailAssessments != null)
        'guardrailAssessments': guardrailAssessments,
      if (initialContactId != null) 'initialContactId': initialContactId,
      if (inputMessages != null) 'inputMessages': inputMessages,
      if (instanceArn != null) 'instanceArn': instanceArn,
      if (operationName != null) 'operationName': operationName,
      if (outputMessages != null) 'outputMessages': outputMessages,
      if (promptArn != null) 'promptArn': promptArn,
      if (promptId != null) 'promptId': promptId,
      if (promptName != null) 'promptName': promptName,
      if (promptType != null) 'promptType': promptType.value,
      if (promptVersion != null) 'promptVersion': promptVersion,
      if (providerName != null) 'providerName': providerName,
      if (requestMaxTokens != null) 'requestMaxTokens': requestMaxTokens,
      if (requestModel != null) 'requestModel': requestModel,
      if (responseFinishReasons != null)
        'responseFinishReasons': responseFinishReasons,
      if (responseModel != null) 'responseModel': responseModel,
      if (sessionName != null) 'sessionName': sessionName,
      if (systemInstructions != null) 'systemInstructions': systemInstructions,
      if (temperature != null) 'temperature': _s.encodeJsonDouble(temperature),
      if (timeToFirstTokenMs != null) 'timeToFirstTokenMs': timeToFirstTokenMs,
      if (topP != null) 'topP': _s.encodeJsonDouble(topP),
      if (usageInputTokens != null) 'usageInputTokens': usageInputTokens,
      if (usageOutputTokens != null) 'usageOutputTokens': usageOutputTokens,
      if (usageTotalTokens != null) 'usageTotalTokens': usageTotalTokens,
    };
  }
}

/// @nodoc
class AIAgentType {
  static const manualSearch = AIAgentType._('MANUAL_SEARCH');
  static const answerRecommendation = AIAgentType._('ANSWER_RECOMMENDATION');
  static const selfService = AIAgentType._('SELF_SERVICE');
  static const emailResponse = AIAgentType._('EMAIL_RESPONSE');
  static const emailOverview = AIAgentType._('EMAIL_OVERVIEW');
  static const emailGenerativeAnswer = AIAgentType._('EMAIL_GENERATIVE_ANSWER');
  static const orchestration = AIAgentType._('ORCHESTRATION');
  static const noteTaking = AIAgentType._('NOTE_TAKING');
  static const caseSummarization = AIAgentType._('CASE_SUMMARIZATION');

  final String value;

  const AIAgentType._(this.value);

  static const values = [
    manualSearch,
    answerRecommendation,
    selfService,
    emailResponse,
    emailOverview,
    emailGenerativeAnswer,
    orchestration,
    noteTaking,
    caseSummarization
  ];

  static AIAgentType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AIAgentType._(value));

  @override
  bool operator ==(other) => other is AIAgentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AIPromptType {
  static const answerGeneration = AIPromptType._('ANSWER_GENERATION');
  static const intentLabelingGeneration =
      AIPromptType._('INTENT_LABELING_GENERATION');
  static const queryReformulation = AIPromptType._('QUERY_REFORMULATION');
  static const selfServicePreProcessing =
      AIPromptType._('SELF_SERVICE_PRE_PROCESSING');
  static const selfServiceAnswerGeneration =
      AIPromptType._('SELF_SERVICE_ANSWER_GENERATION');
  static const emailResponse = AIPromptType._('EMAIL_RESPONSE');
  static const emailOverview = AIPromptType._('EMAIL_OVERVIEW');
  static const emailGenerativeAnswer =
      AIPromptType._('EMAIL_GENERATIVE_ANSWER');
  static const emailQueryReformulation =
      AIPromptType._('EMAIL_QUERY_REFORMULATION');
  static const orchestration = AIPromptType._('ORCHESTRATION');
  static const noteTaking = AIPromptType._('NOTE_TAKING');
  static const caseSummarization = AIPromptType._('CASE_SUMMARIZATION');

  final String value;

  const AIPromptType._(this.value);

  static const values = [
    answerGeneration,
    intentLabelingGeneration,
    queryReformulation,
    selfServicePreProcessing,
    selfServiceAnswerGeneration,
    emailResponse,
    emailOverview,
    emailGenerativeAnswer,
    emailQueryReformulation,
    orchestration,
    noteTaking,
    caseSummarization
  ];

  static AIPromptType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AIPromptType._(value));

  @override
  bool operator ==(other) => other is AIPromptType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Result of a single guardrail assessment, covering either the input
/// (customer/user message) or the output (LLM response) of a Bedrock Converse
/// call.
///
/// @nodoc
class SpanGuardrailAssessment {
  /// Outcome of the guardrail assessment.
  final GuardrailAction action;

  /// Unique AI Guardrail identifier.
  final String guardrailId;

  /// Customer-defined display name of the AI Guardrail resource.
  final String guardrailName;

  /// Content source the guardrail was evaluated against.
  final GuardrailSource source;

  /// Per-policy assessment results. Absent or empty when action is NONE.
  final List<GuardrailPolicyResult>? policies;

  SpanGuardrailAssessment({
    required this.action,
    required this.guardrailId,
    required this.guardrailName,
    required this.source,
    this.policies,
  });

  factory SpanGuardrailAssessment.fromJson(Map<String, dynamic> json) {
    return SpanGuardrailAssessment(
      action: GuardrailAction.fromString((json['action'] as String?) ?? ''),
      guardrailId: (json['guardrailId'] as String?) ?? '',
      guardrailName: (json['guardrailName'] as String?) ?? '',
      source: GuardrailSource.fromString((json['source'] as String?) ?? ''),
      policies: (json['policies'] as List?)
          ?.nonNulls
          .map((e) => GuardrailPolicyResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final guardrailId = this.guardrailId;
    final guardrailName = this.guardrailName;
    final source = this.source;
    final policies = this.policies;
    return {
      'action': action.value,
      'guardrailId': guardrailId,
      'guardrailName': guardrailName,
      'source': source.value,
      if (policies != null) 'policies': policies,
    };
  }
}

/// Content source for a guardrail assessment.
///
/// @nodoc
class GuardrailSource {
  static const input = GuardrailSource._('INPUT');
  static const output = GuardrailSource._('OUTPUT');

  final String value;

  const GuardrailSource._(this.value);

  static const values = [input, output];

  static GuardrailSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailSource._(value));

  @override
  bool operator ==(other) => other is GuardrailSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The outcome of a guardrail assessment.
///
/// @nodoc
class GuardrailAction {
  static const none = GuardrailAction._('NONE');
  static const blocked = GuardrailAction._('BLOCKED');
  static const masked = GuardrailAction._('MASKED');

  final String value;

  const GuardrailAction._(this.value);

  static const values = [none, blocked, masked];

  static GuardrailAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailAction._(value));

  @override
  bool operator ==(other) => other is GuardrailAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Per-policy guardrail assessment result. Captures which policy triggered, its
/// outcome, and a policy-specific detail string.
///
/// @nodoc
class GuardrailPolicyResult {
  /// Outcome of this specific policy.
  final GuardrailAction action;

  /// The type of guardrail policy that was evaluated.
  final GuardrailPolicyType policyType;

  /// Policy-specific detail.
  final String? details;

  GuardrailPolicyResult({
    required this.action,
    required this.policyType,
    this.details,
  });

  factory GuardrailPolicyResult.fromJson(Map<String, dynamic> json) {
    return GuardrailPolicyResult(
      action: GuardrailAction.fromString((json['action'] as String?) ?? ''),
      policyType:
          GuardrailPolicyType.fromString((json['policyType'] as String?) ?? ''),
      details: json['details'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final policyType = this.policyType;
    final details = this.details;
    return {
      'action': action.value,
      'policyType': policyType.value,
      if (details != null) 'details': details,
    };
  }
}

/// Classification of a guardrail policy.
///
/// @nodoc
class GuardrailPolicyType {
  static const contentFilter = GuardrailPolicyType._('CONTENT_FILTER');
  static const topic = GuardrailPolicyType._('TOPIC');
  static const word = GuardrailPolicyType._('WORD');
  static const sensitiveInformationPii =
      GuardrailPolicyType._('SENSITIVE_INFORMATION_PII');
  static const sensitiveInformationRegex =
      GuardrailPolicyType._('SENSITIVE_INFORMATION_REGEX');
  static const contextualGrounding =
      GuardrailPolicyType._('CONTEXTUAL_GROUNDING');

  final String value;

  const GuardrailPolicyType._(this.value);

  static const values = [
    contentFilter,
    topic,
    word,
    sensitiveInformationPii,
    sensitiveInformationRegex,
    contextualGrounding
  ];

  static GuardrailPolicyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailPolicyType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailPolicyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Message content value - can be text, tool invocation, tool result, or
/// reasoning
///
/// @nodoc
class SpanMessageValue {
  final SpanReasoningValue? reasoning;

  /// Text message content
  final SpanTextValue? text;

  /// Tool result message content
  final SpanToolResultValue? toolResult;

  /// Tool invocation message content
  final SpanToolUseValue? toolUse;

  SpanMessageValue({
    this.reasoning,
    this.text,
    this.toolResult,
    this.toolUse,
  });

  factory SpanMessageValue.fromJson(Map<String, dynamic> json) {
    return SpanMessageValue(
      reasoning: json['reasoning'] != null
          ? SpanReasoningValue.fromJson(
              json['reasoning'] as Map<String, dynamic>)
          : null,
      text: json['text'] != null
          ? SpanTextValue.fromJson(json['text'] as Map<String, dynamic>)
          : null,
      toolResult: json['toolResult'] != null
          ? SpanToolResultValue.fromJson(
              json['toolResult'] as Map<String, dynamic>)
          : null,
      toolUse: json['toolUse'] != null
          ? SpanToolUseValue.fromJson(json['toolUse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reasoning = this.reasoning;
    final text = this.text;
    final toolResult = this.toolResult;
    final toolUse = this.toolUse;
    return {
      if (reasoning != null) 'reasoning': reasoning,
      if (text != null) 'text': text,
      if (toolResult != null) 'toolResult': toolResult,
      if (toolUse != null) 'toolUse': toolUse,
    };
  }
}

/// Text message content
///
/// @nodoc
class SpanTextValue {
  /// String content of the message text
  final String value;

  /// The AI Guardrail assessment for the span text.
  final AIGuardrailAssessment? aiGuardrailAssessment;

  /// The citations associated with the span text.
  final List<SpanCitation>? citations;

  SpanTextValue({
    required this.value,
    this.aiGuardrailAssessment,
    this.citations,
  });

  factory SpanTextValue.fromJson(Map<String, dynamic> json) {
    return SpanTextValue(
      value: (json['value'] as String?) ?? '',
      aiGuardrailAssessment: json['aiGuardrailAssessment'] != null
          ? AIGuardrailAssessment.fromJson(
              json['aiGuardrailAssessment'] as Map<String, dynamic>)
          : null,
      citations: (json['citations'] as List?)
          ?.nonNulls
          .map((e) => SpanCitation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final aiGuardrailAssessment = this.aiGuardrailAssessment;
    final citations = this.citations;
    return {
      'value': value,
      if (aiGuardrailAssessment != null)
        'aiGuardrailAssessment': aiGuardrailAssessment,
      if (citations != null) 'citations': citations,
    };
  }
}

/// Tool invocation message content
///
/// @nodoc
class SpanToolUseValue {
  /// The tool input arguments
  final Object arguments;

  /// The tool name
  final String name;

  /// Unique ID for this tool invocation
  final String toolUseId;

  SpanToolUseValue({
    required this.arguments,
    required this.name,
    required this.toolUseId,
  });

  factory SpanToolUseValue.fromJson(Map<String, dynamic> json) {
    return SpanToolUseValue(
      arguments: json['arguments'] as Object,
      name: (json['name'] as String?) ?? '',
      toolUseId: (json['toolUseId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arguments = this.arguments;
    final name = this.name;
    final toolUseId = this.toolUseId;
    return {
      'arguments': arguments,
      'name': name,
      'toolUseId': toolUseId,
    };
  }
}

/// Tool result message content
///
/// @nodoc
class SpanToolResultValue {
  /// Relates this result back to the tool invocation
  final String toolUseId;

  /// The tool results
  final List<SpanMessageValue> values;

  /// The tool invocation error if failed
  final String? error;

  SpanToolResultValue({
    required this.toolUseId,
    required this.values,
    this.error,
  });

  factory SpanToolResultValue.fromJson(Map<String, dynamic> json) {
    return SpanToolResultValue(
      toolUseId: (json['toolUseId'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => SpanMessageValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final toolUseId = this.toolUseId;
    final values = this.values;
    final error = this.error;
    return {
      'toolUseId': toolUseId,
      'values': values,
      if (error != null) 'error': error,
    };
  }
}

/// Model reasoning and it's internal decision making process
///
/// @nodoc
class SpanReasoningValue {
  /// The reasoning text content
  final String value;

  SpanReasoningValue({
    required this.value,
  });

  factory SpanReasoningValue.fromJson(Map<String, dynamic> json) {
    return SpanReasoningValue(
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

/// A citation that spans a specific range of text.
///
/// @nodoc
class SpanCitation {
  /// The identifier of the content being cited in the span.
  final String? contentId;

  /// The Amazon Resource Name (ARN) of the knowledge base containing the cited
  /// content.
  final String? knowledgeBaseArn;

  /// The identifier of the knowledge base containing the cited content.
  final String? knowledgeBaseId;

  /// The title of the content being cited in the span.
  final String? title;

  SpanCitation({
    this.contentId,
    this.knowledgeBaseArn,
    this.knowledgeBaseId,
    this.title,
  });

  factory SpanCitation.fromJson(Map<String, dynamic> json) {
    return SpanCitation(
      contentId: json['contentId'] as String?,
      knowledgeBaseArn: json['knowledgeBaseArn'] as String?,
      knowledgeBaseId: json['knowledgeBaseId'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentId = this.contentId;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final title = this.title;
    return {
      if (contentId != null) 'contentId': contentId,
      if (knowledgeBaseArn != null) 'knowledgeBaseArn': knowledgeBaseArn,
      if (knowledgeBaseId != null) 'knowledgeBaseId': knowledgeBaseId,
      if (title != null) 'title': title,
    };
  }
}

/// A message in the conversation history with participant role and content
/// values
///
/// @nodoc
class SpanMessage {
  /// Unique message identifier
  final String messageId;

  /// Message source role
  final Participant participant;

  /// Message timestamp
  final DateTime timestamp;

  /// Message content values (text, tool use, tool result, reasoning)
  final List<SpanMessageValue> values;

  SpanMessage({
    required this.messageId,
    required this.participant,
    required this.timestamp,
    required this.values,
  });

  factory SpanMessage.fromJson(Map<String, dynamic> json) {
    return SpanMessage(
      messageId: (json['messageId'] as String?) ?? '',
      participant:
          Participant.fromString((json['participant'] as String?) ?? ''),
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => SpanMessageValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    final participant = this.participant;
    final timestamp = this.timestamp;
    final values = this.values;
    return {
      'messageId': messageId,
      'participant': participant.value,
      'timestamp': unixTimestampToJson(timestamp),
      'values': values,
    };
  }
}

/// @nodoc
class Participant {
  static const customer = Participant._('CUSTOMER');
  static const agent = Participant._('AGENT');
  static const bot = Participant._('BOT');

  final String value;

  const Participant._(this.value);

  static const values = [customer, agent, bot];

  static Participant fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Participant._(value));

  @override
  bool operator ==(other) => other is Participant && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The message output.
///
/// @nodoc
class MessageOutput {
  /// The identifier of a message.
  final String messageId;

  /// The participant of a message.
  final Participant participant;

  /// The timestamp of a message.
  final DateTime timestamp;

  /// The value of a message data.
  final MessageData value;

  MessageOutput({
    required this.messageId,
    required this.participant,
    required this.timestamp,
    required this.value,
  });

  factory MessageOutput.fromJson(Map<String, dynamic> json) {
    return MessageOutput(
      messageId: (json['messageId'] as String?) ?? '',
      participant:
          Participant.fromString((json['participant'] as String?) ?? ''),
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
      value: MessageData.fromJson((json['value'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    final participant = this.participant;
    final timestamp = this.timestamp;
    final value = this.value;
    return {
      'messageId': messageId,
      'participant': participant.value,
      'timestamp': unixTimestampToJson(timestamp),
      'value': value,
    };
  }
}

/// @nodoc
class MessageFilterType {
  static const all = MessageFilterType._('ALL');
  static const textOnly = MessageFilterType._('TEXT_ONLY');

  final String value;

  const MessageFilterType._(this.value);

  static const values = [all, textOnly];

  static MessageFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MessageFilterType._(value));

  @override
  bool operator ==(other) => other is MessageFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The conversation state associated to a message.
///
/// @nodoc
class ConversationState {
  /// The status of the conversation state.
  final ConversationStatus status;

  /// The reason of the conversation state.
  final ConversationStatusReason? reason;

  ConversationState({
    required this.status,
    this.reason,
  });

  factory ConversationState.fromJson(Map<String, dynamic> json) {
    return ConversationState(
      status: ConversationStatus.fromString((json['status'] as String?) ?? ''),
      reason:
          (json['reason'] as String?)?.let(ConversationStatusReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final reason = this.reason;
    return {
      'status': status.value,
      if (reason != null) 'reason': reason.value,
    };
  }
}

/// @nodoc
class ConversationStatus {
  static const closed = ConversationStatus._('CLOSED');
  static const ready = ConversationStatus._('READY');
  static const processing = ConversationStatus._('PROCESSING');

  final String value;

  const ConversationStatus._(this.value);

  static const values = [closed, ready, processing];

  static ConversationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConversationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ConversationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConversationStatusReason {
  static const success = ConversationStatusReason._('SUCCESS');
  static const failed = ConversationStatusReason._('FAILED');
  static const rejected = ConversationStatusReason._('REJECTED');

  final String value;

  const ConversationStatusReason._(this.value);

  static const values = [success, failed, rejected];

  static ConversationStatusReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConversationStatusReason._(value));

  @override
  bool operator ==(other) =>
      other is ConversationStatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the session.
///
/// @nodoc
class SessionData {
  /// The name of the session.
  final String name;

  /// The Amazon Resource Name (ARN) of the session.
  final String sessionArn;

  /// The identifier of the session.
  final String sessionId;

  /// The configuration of the AI Agents (mapped by AI Agent Type to AI Agent
  /// version) that should be used by Amazon Q in Connect for this Session.
  final Map<AIAgentType, AIAgentConfigurationData>? aiAgentConfiguration;

  /// The description of the session.
  final String? description;

  /// The configuration information for the session integration.
  final SessionIntegrationConfiguration? integrationConfiguration;

  /// The list of orchestrator configurations for the session.
  final List<OrchestratorConfigurationEntry>? orchestratorConfigurationList;

  /// The origin of the Session to be listed. <code>SYSTEM</code> for a default
  /// Session created by Amazon Q in Connect or <code>CUSTOMER</code> for a
  /// Session created by calling <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_amazon-q-connect_CreateSession.html">CreateSession</a>
  /// API.
  final Origin? origin;

  /// An object that can be used to specify Tag conditions.
  final TagFilter? tagFilter;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  SessionData({
    required this.name,
    required this.sessionArn,
    required this.sessionId,
    this.aiAgentConfiguration,
    this.description,
    this.integrationConfiguration,
    this.orchestratorConfigurationList,
    this.origin,
    this.tagFilter,
    this.tags,
  });

  factory SessionData.fromJson(Map<String, dynamic> json) {
    return SessionData(
      name: (json['name'] as String?) ?? '',
      sessionArn: (json['sessionArn'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      aiAgentConfiguration: (json['aiAgentConfiguration']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(AIAgentType.fromString(k),
              AIAgentConfigurationData.fromJson(e as Map<String, dynamic>))),
      description: json['description'] as String?,
      integrationConfiguration: json['integrationConfiguration'] != null
          ? SessionIntegrationConfiguration.fromJson(
              json['integrationConfiguration'] as Map<String, dynamic>)
          : null,
      orchestratorConfigurationList:
          (json['orchestratorConfigurationList'] as List?)
              ?.nonNulls
              .map((e) => OrchestratorConfigurationEntry.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      origin: (json['origin'] as String?)?.let(Origin.fromString),
      tagFilter: json['tagFilter'] != null
          ? TagFilter.fromJson(json['tagFilter'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    final aiAgentConfiguration = this.aiAgentConfiguration;
    final description = this.description;
    final integrationConfiguration = this.integrationConfiguration;
    final orchestratorConfigurationList = this.orchestratorConfigurationList;
    final origin = this.origin;
    final tagFilter = this.tagFilter;
    final tags = this.tags;
    return {
      'name': name,
      'sessionArn': sessionArn,
      'sessionId': sessionId,
      if (aiAgentConfiguration != null)
        'aiAgentConfiguration':
            aiAgentConfiguration.map((k, e) => MapEntry(k.value, e)),
      if (description != null) 'description': description,
      if (integrationConfiguration != null)
        'integrationConfiguration': integrationConfiguration,
      if (orchestratorConfigurationList != null)
        'orchestratorConfigurationList': orchestratorConfigurationList,
      if (origin != null) 'origin': origin.value,
      if (tagFilter != null) 'tagFilter': tagFilter,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The configuration information for the session integration.
///
/// @nodoc
class SessionIntegrationConfiguration {
  /// The Amazon Resource Name (ARN) of the integrated Amazon SNS topic used for
  /// streaming chat messages.
  final String? topicIntegrationArn;

  SessionIntegrationConfiguration({
    this.topicIntegrationArn,
  });

  factory SessionIntegrationConfiguration.fromJson(Map<String, dynamic> json) {
    return SessionIntegrationConfiguration(
      topicIntegrationArn: json['topicIntegrationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final topicIntegrationArn = this.topicIntegrationArn;
    return {
      if (topicIntegrationArn != null)
        'topicIntegrationArn': topicIntegrationArn,
    };
  }
}

/// An object that can be used to specify Tag conditions.
///
/// @nodoc
class TagFilter {
  /// A list of conditions which would be applied together with an
  /// <code>AND</code> condition.
  final List<TagCondition>? andConditions;

  /// A list of conditions which would be applied together with an <code>OR</code>
  /// condition.
  final List<OrCondition>? orConditions;

  /// A leaf node condition which can be used to specify a tag condition.
  final TagCondition? tagCondition;

  TagFilter({
    this.andConditions,
    this.orConditions,
    this.tagCondition,
  });

  factory TagFilter.fromJson(Map<String, dynamic> json) {
    return TagFilter(
      andConditions: (json['andConditions'] as List?)
          ?.nonNulls
          .map((e) => TagCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      orConditions: (json['orConditions'] as List?)
          ?.nonNulls
          .map((e) => OrCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagCondition: json['tagCondition'] != null
          ? TagCondition.fromJson(json['tagCondition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final andConditions = this.andConditions;
    final orConditions = this.orConditions;
    final tagCondition = this.tagCondition;
    return {
      if (andConditions != null) 'andConditions': andConditions,
      if (orConditions != null) 'orConditions': orConditions,
      if (tagCondition != null) 'tagCondition': tagCondition,
    };
  }
}

/// @nodoc
class Origin {
  static const system = Origin._('SYSTEM');
  static const customer = Origin._('CUSTOMER');

  final String value;

  const Origin._(this.value);

  static const values = [system, customer];

  static Origin fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Origin._(value));

  @override
  bool operator ==(other) => other is Origin && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An entry in the orchestrator configuration list.
///
/// @nodoc
class OrchestratorConfigurationEntry {
  /// The use case for the orchestrator configuration. (for example
  /// Connect.SelfService, Connect.AgentAssistance)
  final String orchestratorUseCase;

  /// The identifier of the AI Agent in the orchestrator configuration.
  final String? aiAgentId;

  OrchestratorConfigurationEntry({
    required this.orchestratorUseCase,
    this.aiAgentId,
  });

  factory OrchestratorConfigurationEntry.fromJson(Map<String, dynamic> json) {
    return OrchestratorConfigurationEntry(
      orchestratorUseCase: (json['orchestratorUseCase'] as String?) ?? '',
      aiAgentId: json['aiAgentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final orchestratorUseCase = this.orchestratorUseCase;
    final aiAgentId = this.aiAgentId;
    return {
      'orchestratorUseCase': orchestratorUseCase,
      if (aiAgentId != null) 'aiAgentId': aiAgentId,
    };
  }
}

/// A type that specifies the AI Agent ID configuration data when mapping an AI
/// Agents to be used for an AI Agent type on a session or assistant.
///
/// @nodoc
class AIAgentConfigurationData {
  /// The ID of the AI Agent to be configured.
  final String aiAgentId;

  AIAgentConfigurationData({
    required this.aiAgentId,
  });

  factory AIAgentConfigurationData.fromJson(Map<String, dynamic> json) {
    return AIAgentConfigurationData(
      aiAgentId: (json['aiAgentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgentId = this.aiAgentId;
    return {
      'aiAgentId': aiAgentId,
    };
  }
}

/// A leaf node condition which can be used to specify a tag condition.
///
/// @nodoc
class TagCondition {
  /// The tag key in the tag condition.
  final String key;

  /// The tag value in the tag condition.
  final String? value;

  TagCondition({
    required this.key,
    this.value,
  });

  factory TagCondition.fromJson(Map<String, dynamic> json) {
    return TagCondition(
      key: (json['key'] as String?) ?? '',
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// A list of conditions which would be applied together with an <code>OR</code>
/// condition.
///
/// @nodoc
class OrCondition {
  /// A list of conditions which would be applied together with an
  /// <code>AND</code> condition.
  final List<TagCondition>? andConditions;

  /// A leaf node condition which can be used to specify a tag condition.
  final TagCondition? tagCondition;

  OrCondition({
    this.andConditions,
    this.tagCondition,
  });

  factory OrCondition.fromJson(Map<String, dynamic> json) {
    return OrCondition(
      andConditions: (json['andConditions'] as List?)
          ?.nonNulls
          .map((e) => TagCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagCondition: json['tagCondition'] != null
          ? TagCondition.fromJson(json['tagCondition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final andConditions = this.andConditions;
    final tagCondition = this.tagCondition;
    return {
      if (andConditions != null) 'andConditions': andConditions,
      if (tagCondition != null) 'tagCondition': tagCondition,
    };
  }
}

/// Summary information about the assistant association.
///
/// @nodoc
class AssistantAssociationSummary {
  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The Amazon Resource Name (ARN) of the assistant association.
  final String assistantAssociationArn;

  /// The identifier of the assistant association.
  final String assistantAssociationId;

  /// The identifier of the Amazon Q in Connect assistant.
  final String assistantId;

  /// The association data.
  final AssistantAssociationOutputData associationData;

  /// The type of association.
  final AssociationType associationType;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AssistantAssociationSummary({
    required this.assistantArn,
    required this.assistantAssociationArn,
    required this.assistantAssociationId,
    required this.assistantId,
    required this.associationData,
    required this.associationType,
    this.tags,
  });

  factory AssistantAssociationSummary.fromJson(Map<String, dynamic> json) {
    return AssistantAssociationSummary(
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantAssociationArn:
          (json['assistantAssociationArn'] as String?) ?? '',
      assistantAssociationId: (json['assistantAssociationId'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      associationData: AssistantAssociationOutputData.fromJson(
          (json['associationData'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      associationType: AssociationType.fromString(
          (json['associationType'] as String?) ?? ''),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final assistantArn = this.assistantArn;
    final assistantAssociationArn = this.assistantAssociationArn;
    final assistantAssociationId = this.assistantAssociationId;
    final assistantId = this.assistantId;
    final associationData = this.associationData;
    final associationType = this.associationType;
    final tags = this.tags;
    return {
      'assistantArn': assistantArn,
      'assistantAssociationArn': assistantAssociationArn,
      'assistantAssociationId': assistantAssociationId,
      'assistantId': assistantId,
      'associationData': associationData,
      'associationType': associationType.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class AssociationType {
  static const knowledgeBase = AssociationType._('KNOWLEDGE_BASE');
  static const externalBedrockKnowledgeBase =
      AssociationType._('EXTERNAL_BEDROCK_KNOWLEDGE_BASE');

  final String value;

  const AssociationType._(this.value);

  static const values = [knowledgeBase, externalBedrockKnowledgeBase];

  static AssociationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssociationType._(value));

  @override
  bool operator ==(other) => other is AssociationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The data that is output as a result of the assistant association.
///
/// @nodoc
class AssistantAssociationOutputData {
  /// The configuration for an external Bedrock knowledge base association in the
  /// output data.
  final ExternalBedrockKnowledgeBaseConfig? externalBedrockKnowledgeBaseConfig;

  /// The knowledge base where output data is sent.
  final KnowledgeBaseAssociationData? knowledgeBaseAssociation;

  AssistantAssociationOutputData({
    this.externalBedrockKnowledgeBaseConfig,
    this.knowledgeBaseAssociation,
  });

  factory AssistantAssociationOutputData.fromJson(Map<String, dynamic> json) {
    return AssistantAssociationOutputData(
      externalBedrockKnowledgeBaseConfig:
          json['externalBedrockKnowledgeBaseConfig'] != null
              ? ExternalBedrockKnowledgeBaseConfig.fromJson(
                  json['externalBedrockKnowledgeBaseConfig']
                      as Map<String, dynamic>)
              : null,
      knowledgeBaseAssociation: json['knowledgeBaseAssociation'] != null
          ? KnowledgeBaseAssociationData.fromJson(
              json['knowledgeBaseAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final externalBedrockKnowledgeBaseConfig =
        this.externalBedrockKnowledgeBaseConfig;
    final knowledgeBaseAssociation = this.knowledgeBaseAssociation;
    return {
      if (externalBedrockKnowledgeBaseConfig != null)
        'externalBedrockKnowledgeBaseConfig':
            externalBedrockKnowledgeBaseConfig,
      if (knowledgeBaseAssociation != null)
        'knowledgeBaseAssociation': knowledgeBaseAssociation,
    };
  }
}

/// Association information about the knowledge base.
///
/// @nodoc
class KnowledgeBaseAssociationData {
  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String? knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String? knowledgeBaseId;

  KnowledgeBaseAssociationData({
    this.knowledgeBaseArn,
    this.knowledgeBaseId,
  });

  factory KnowledgeBaseAssociationData.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseAssociationData(
      knowledgeBaseArn: json['knowledgeBaseArn'] as String?,
      knowledgeBaseId: json['knowledgeBaseId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    return {
      if (knowledgeBaseArn != null) 'knowledgeBaseArn': knowledgeBaseArn,
      if (knowledgeBaseId != null) 'knowledgeBaseId': knowledgeBaseId,
    };
  }
}

/// Configuration for an external Bedrock knowledge base.
///
/// @nodoc
class ExternalBedrockKnowledgeBaseConfig {
  /// The Amazon Resource Name (ARN) of the IAM role used to access the external
  /// Bedrock knowledge base.
  final String accessRoleArn;

  /// The Amazon Resource Name (ARN) of the external Bedrock knowledge base.
  final String bedrockKnowledgeBaseArn;

  ExternalBedrockKnowledgeBaseConfig({
    required this.accessRoleArn,
    required this.bedrockKnowledgeBaseArn,
  });

  factory ExternalBedrockKnowledgeBaseConfig.fromJson(
      Map<String, dynamic> json) {
    return ExternalBedrockKnowledgeBaseConfig(
      accessRoleArn: (json['accessRoleArn'] as String?) ?? '',
      bedrockKnowledgeBaseArn:
          (json['bedrockKnowledgeBaseArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accessRoleArn = this.accessRoleArn;
    final bedrockKnowledgeBaseArn = this.bedrockKnowledgeBaseArn;
    return {
      'accessRoleArn': accessRoleArn,
      'bedrockKnowledgeBaseArn': bedrockKnowledgeBaseArn,
    };
  }
}

/// Information about the assistant association.
///
/// @nodoc
class AssistantAssociationData {
  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The Amazon Resource Name (ARN) of the assistant association.
  final String assistantAssociationArn;

  /// The identifier of the assistant association.
  final String assistantAssociationId;

  /// The identifier of the Amazon Q in Connect assistant.
  final String assistantId;

  /// A union type that currently has a single argument, the knowledge base ID.
  final AssistantAssociationOutputData associationData;

  /// The type of association.
  final AssociationType associationType;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AssistantAssociationData({
    required this.assistantArn,
    required this.assistantAssociationArn,
    required this.assistantAssociationId,
    required this.assistantId,
    required this.associationData,
    required this.associationType,
    this.tags,
  });

  factory AssistantAssociationData.fromJson(Map<String, dynamic> json) {
    return AssistantAssociationData(
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantAssociationArn:
          (json['assistantAssociationArn'] as String?) ?? '',
      assistantAssociationId: (json['assistantAssociationId'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      associationData: AssistantAssociationOutputData.fromJson(
          (json['associationData'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      associationType: AssociationType.fromString(
          (json['associationType'] as String?) ?? ''),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final assistantArn = this.assistantArn;
    final assistantAssociationArn = this.assistantAssociationArn;
    final assistantAssociationId = this.assistantAssociationId;
    final assistantId = this.assistantId;
    final associationData = this.associationData;
    final associationType = this.associationType;
    final tags = this.tags;
    return {
      'assistantArn': assistantArn,
      'assistantAssociationArn': assistantAssociationArn,
      'assistantAssociationId': assistantAssociationId,
      'assistantId': assistantId,
      'associationData': associationData,
      'associationType': associationType.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The data that is input into Amazon Q in Connect as a result of the assistant
/// association.
///
/// @nodoc
class AssistantAssociationInputData {
  /// The configuration for an external Bedrock knowledge base association.
  final ExternalBedrockKnowledgeBaseConfig? externalBedrockKnowledgeBaseConfig;

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base.
  final String? knowledgeBaseId;

  AssistantAssociationInputData({
    this.externalBedrockKnowledgeBaseConfig,
    this.knowledgeBaseId,
  });

  Map<String, dynamic> toJson() {
    final externalBedrockKnowledgeBaseConfig =
        this.externalBedrockKnowledgeBaseConfig;
    final knowledgeBaseId = this.knowledgeBaseId;
    return {
      if (externalBedrockKnowledgeBaseConfig != null)
        'externalBedrockKnowledgeBaseConfig':
            externalBedrockKnowledgeBaseConfig,
      if (knowledgeBaseId != null) 'knowledgeBaseId': knowledgeBaseId,
    };
  }
}

/// The summary of the AI Prompt version.
///
/// @nodoc
class AIPromptVersionSummary {
  /// The date for the summary of the AI Prompt version.
  final AIPromptSummary? aiPromptSummary;

  /// The version number for this AI Prompt version.
  final int? versionNumber;

  AIPromptVersionSummary({
    this.aiPromptSummary,
    this.versionNumber,
  });

  factory AIPromptVersionSummary.fromJson(Map<String, dynamic> json) {
    return AIPromptVersionSummary(
      aiPromptSummary: json['aiPromptSummary'] != null
          ? AIPromptSummary.fromJson(
              json['aiPromptSummary'] as Map<String, dynamic>)
          : null,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiPromptSummary = this.aiPromptSummary;
    final versionNumber = this.versionNumber;
    return {
      if (aiPromptSummary != null) 'aiPromptSummary': aiPromptSummary,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// The summary of the AI Prompt.
///
/// @nodoc
class AIPromptSummary {
  /// The Amazon Resource Name (ARN) of the AI Prompt.
  final String aiPromptArn;

  /// The identifier of the Amazon Q in Connect AI prompt.
  final String aiPromptId;

  /// The API format used for this AI Prompt.
  final AIPromptAPIFormat apiFormat;

  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID or
  /// the ARN. URLs cannot contain the ARN.
  final String assistantId;

  /// The identifier of the model used for this AI Prompt. Model Ids supported
  /// are: <code>anthropic.claude-3-haiku-20240307-v1:0</code>.
  final String modelId;

  /// The name of the AI Prompt.
  final String name;

  /// The type of the prompt template for this AI Prompt.
  final AIPromptTemplateType templateType;

  /// The type of this AI Prompt.
  final AIPromptType type;

  /// The visibility status of the AI Prompt.
  final VisibilityStatus visibilityStatus;

  /// The description of the AI Prompt.
  final String? description;

  /// The time the AI Prompt was last modified.
  final DateTime? modifiedTime;

  /// The origin of the AI Prompt. <code>SYSTEM</code> for a default AI Prompt
  /// created by Q in Connect or <code>CUSTOMER</code> for an AI Prompt created by
  /// calling AI Prompt creation APIs.
  final Origin? origin;

  /// The status of the AI Prompt.
  final Status? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AIPromptSummary({
    required this.aiPromptArn,
    required this.aiPromptId,
    required this.apiFormat,
    required this.assistantArn,
    required this.assistantId,
    required this.modelId,
    required this.name,
    required this.templateType,
    required this.type,
    required this.visibilityStatus,
    this.description,
    this.modifiedTime,
    this.origin,
    this.status,
    this.tags,
  });

  factory AIPromptSummary.fromJson(Map<String, dynamic> json) {
    return AIPromptSummary(
      aiPromptArn: (json['aiPromptArn'] as String?) ?? '',
      aiPromptId: (json['aiPromptId'] as String?) ?? '',
      apiFormat:
          AIPromptAPIFormat.fromString((json['apiFormat'] as String?) ?? ''),
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      modelId: (json['modelId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      templateType: AIPromptTemplateType.fromString(
          (json['templateType'] as String?) ?? ''),
      type: AIPromptType.fromString((json['type'] as String?) ?? ''),
      visibilityStatus: VisibilityStatus.fromString(
          (json['visibilityStatus'] as String?) ?? ''),
      description: json['description'] as String?,
      modifiedTime: timeStampFromJson(json['modifiedTime']),
      origin: (json['origin'] as String?)?.let(Origin.fromString),
      status: (json['status'] as String?)?.let(Status.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final aiPromptArn = this.aiPromptArn;
    final aiPromptId = this.aiPromptId;
    final apiFormat = this.apiFormat;
    final assistantArn = this.assistantArn;
    final assistantId = this.assistantId;
    final modelId = this.modelId;
    final name = this.name;
    final templateType = this.templateType;
    final type = this.type;
    final visibilityStatus = this.visibilityStatus;
    final description = this.description;
    final modifiedTime = this.modifiedTime;
    final origin = this.origin;
    final status = this.status;
    final tags = this.tags;
    return {
      'aiPromptArn': aiPromptArn,
      'aiPromptId': aiPromptId,
      'apiFormat': apiFormat.value,
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'modelId': modelId,
      'name': name,
      'templateType': templateType.value,
      'type': type.value,
      'visibilityStatus': visibilityStatus.value,
      if (description != null) 'description': description,
      if (modifiedTime != null)
        'modifiedTime': unixTimestampToJson(modifiedTime),
      if (origin != null) 'origin': origin.value,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class AIPromptTemplateType {
  static const text = AIPromptTemplateType._('TEXT');

  final String value;

  const AIPromptTemplateType._(this.value);

  static const values = [text];

  static AIPromptTemplateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AIPromptTemplateType._(value));

  @override
  bool operator ==(other) =>
      other is AIPromptTemplateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AIPromptAPIFormat {
  static const anthropicClaudeMessages =
      AIPromptAPIFormat._('ANTHROPIC_CLAUDE_MESSAGES');
  static const anthropicClaudeTextCompletions =
      AIPromptAPIFormat._('ANTHROPIC_CLAUDE_TEXT_COMPLETIONS');
  static const messages = AIPromptAPIFormat._('MESSAGES');
  static const textCompletions = AIPromptAPIFormat._('TEXT_COMPLETIONS');

  final String value;

  const AIPromptAPIFormat._(this.value);

  static const values = [
    anthropicClaudeMessages,
    anthropicClaudeTextCompletions,
    messages,
    textCompletions
  ];

  static AIPromptAPIFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AIPromptAPIFormat._(value));

  @override
  bool operator ==(other) => other is AIPromptAPIFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class VisibilityStatus {
  static const saved = VisibilityStatus._('SAVED');
  static const published = VisibilityStatus._('PUBLISHED');

  final String value;

  const VisibilityStatus._(this.value);

  static const values = [saved, published];

  static VisibilityStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VisibilityStatus._(value));

  @override
  bool operator ==(other) => other is VisibilityStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Status {
  static const createInProgress = Status._('CREATE_IN_PROGRESS');
  static const createFailed = Status._('CREATE_FAILED');
  static const active = Status._('ACTIVE');
  static const deleteInProgress = Status._('DELETE_IN_PROGRESS');
  static const deleteFailed = Status._('DELETE_FAILED');
  static const deleted = Status._('DELETED');

  final String value;

  const Status._(this.value);

  static const values = [
    createInProgress,
    createFailed,
    active,
    deleteInProgress,
    deleteFailed,
    deleted
  ];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The data for the AI Prompt
///
/// @nodoc
class AIPromptData {
  /// The Amazon Resource Name (ARN) of the AI Prompt.
  final String aiPromptArn;

  /// The identifier of the Amazon Q in Connect AI prompt.
  final String aiPromptId;

  /// The API format used for this AI Prompt.
  final AIPromptAPIFormat apiFormat;

  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID or
  /// the ARN. URLs cannot contain the ARN.
  final String assistantId;

  /// The identifier of the model used for this AI Prompt. The following model Ids
  /// are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>anthropic.claude-3-haiku--v1:0</code>
  /// </li>
  /// <li>
  /// <code>apac.amazon.nova-lite-v1:0</code>
  /// </li>
  /// <li>
  /// <code>apac.amazon.nova-micro-v1:0</code>
  /// </li>
  /// <li>
  /// <code>apac.amazon.nova-pro-v1:0</code>
  /// </li>
  /// <li>
  /// <code>apac.anthropic.claude-3-5-sonnet--v2:0</code>
  /// </li>
  /// <li>
  /// <code>apac.anthropic.claude-3-haiku-20240307-v1:0</code>
  /// </li>
  /// <li>
  /// <code>eu.amazon.nova-lite-v1:0</code>
  /// </li>
  /// <li>
  /// <code>eu.amazon.nova-micro-v1:0</code>
  /// </li>
  /// <li>
  /// <code>eu.amazon.nova-pro-v1:0</code>
  /// </li>
  /// <li>
  /// <code>eu.anthropic.claude-3-7-sonnet-20250219-v1:0</code>
  /// </li>
  /// <li>
  /// <code>eu.anthropic.claude-3-haiku-20240307-v1:0</code>
  /// </li>
  /// <li>
  /// <code>us.amazon.nova-lite-v1:0</code>
  /// </li>
  /// <li>
  /// <code>us.amazon.nova-micro-v1:0</code>
  /// </li>
  /// <li>
  /// <code>us.amazon.nova-pro-v1:0</code>
  /// </li>
  /// <li>
  /// <code>us.anthropic.claude-3-5-haiku-20241022-v1:0</code>
  /// </li>
  /// <li>
  /// <code>us.anthropic.claude-3-7-sonnet-20250219-v1:0</code>
  /// </li>
  /// <li>
  /// <code>us.anthropic.claude-3-haiku-20240307-v1:0</code>
  /// </li>
  /// </ul>
  final String modelId;

  /// The name of the AI Prompt
  final String name;

  /// The configuration of the prompt template for this AI Prompt.
  final AIPromptTemplateConfiguration templateConfiguration;

  /// The type of the prompt template for this AI Prompt.
  final AIPromptTemplateType templateType;

  /// The type of this AI Prompt.
  final AIPromptType type;

  /// The visibility status of the AI Prompt.
  final VisibilityStatus visibilityStatus;

  /// The description of the AI Prompt.
  final String? description;

  /// The configuration for inference parameters when using the AI Prompt.
  final AIPromptInferenceConfiguration? inferenceConfiguration;

  /// The time the AI Prompt was last modified.
  final DateTime? modifiedTime;

  /// The origin of the AI Prompt. <code>SYSTEM</code> for a default AI Prompt
  /// created by Q in Connect or <code>CUSTOMER</code> for an AI Prompt created by
  /// calling AI Prompt creation APIs.
  final Origin? origin;

  /// The status of the AI Prompt.
  final Status? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AIPromptData({
    required this.aiPromptArn,
    required this.aiPromptId,
    required this.apiFormat,
    required this.assistantArn,
    required this.assistantId,
    required this.modelId,
    required this.name,
    required this.templateConfiguration,
    required this.templateType,
    required this.type,
    required this.visibilityStatus,
    this.description,
    this.inferenceConfiguration,
    this.modifiedTime,
    this.origin,
    this.status,
    this.tags,
  });

  factory AIPromptData.fromJson(Map<String, dynamic> json) {
    return AIPromptData(
      aiPromptArn: (json['aiPromptArn'] as String?) ?? '',
      aiPromptId: (json['aiPromptId'] as String?) ?? '',
      apiFormat:
          AIPromptAPIFormat.fromString((json['apiFormat'] as String?) ?? ''),
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      modelId: (json['modelId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      templateConfiguration: AIPromptTemplateConfiguration.fromJson(
          (json['templateConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      templateType: AIPromptTemplateType.fromString(
          (json['templateType'] as String?) ?? ''),
      type: AIPromptType.fromString((json['type'] as String?) ?? ''),
      visibilityStatus: VisibilityStatus.fromString(
          (json['visibilityStatus'] as String?) ?? ''),
      description: json['description'] as String?,
      inferenceConfiguration: json['inferenceConfiguration'] != null
          ? AIPromptInferenceConfiguration.fromJson(
              json['inferenceConfiguration'] as Map<String, dynamic>)
          : null,
      modifiedTime: timeStampFromJson(json['modifiedTime']),
      origin: (json['origin'] as String?)?.let(Origin.fromString),
      status: (json['status'] as String?)?.let(Status.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final aiPromptArn = this.aiPromptArn;
    final aiPromptId = this.aiPromptId;
    final apiFormat = this.apiFormat;
    final assistantArn = this.assistantArn;
    final assistantId = this.assistantId;
    final modelId = this.modelId;
    final name = this.name;
    final templateConfiguration = this.templateConfiguration;
    final templateType = this.templateType;
    final type = this.type;
    final visibilityStatus = this.visibilityStatus;
    final description = this.description;
    final inferenceConfiguration = this.inferenceConfiguration;
    final modifiedTime = this.modifiedTime;
    final origin = this.origin;
    final status = this.status;
    final tags = this.tags;
    return {
      'aiPromptArn': aiPromptArn,
      'aiPromptId': aiPromptId,
      'apiFormat': apiFormat.value,
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'modelId': modelId,
      'name': name,
      'templateConfiguration': templateConfiguration,
      'templateType': templateType.value,
      'type': type.value,
      'visibilityStatus': visibilityStatus.value,
      if (description != null) 'description': description,
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
      if (modifiedTime != null)
        'modifiedTime': unixTimestampToJson(modifiedTime),
      if (origin != null) 'origin': origin.value,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A typed union that specifies the configuration for a prompt template based
/// on its type.
///
/// @nodoc
class AIPromptTemplateConfiguration {
  /// The configuration for a prompt template that supports full textual prompt
  /// configuration using a YAML prompt.
  final TextFullAIPromptEditTemplateConfiguration?
      textFullAIPromptEditTemplateConfiguration;

  AIPromptTemplateConfiguration({
    this.textFullAIPromptEditTemplateConfiguration,
  });

  factory AIPromptTemplateConfiguration.fromJson(Map<String, dynamic> json) {
    return AIPromptTemplateConfiguration(
      textFullAIPromptEditTemplateConfiguration:
          json['textFullAIPromptEditTemplateConfiguration'] != null
              ? TextFullAIPromptEditTemplateConfiguration.fromJson(
                  json['textFullAIPromptEditTemplateConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final textFullAIPromptEditTemplateConfiguration =
        this.textFullAIPromptEditTemplateConfiguration;
    return {
      if (textFullAIPromptEditTemplateConfiguration != null)
        'textFullAIPromptEditTemplateConfiguration':
            textFullAIPromptEditTemplateConfiguration,
    };
  }
}

/// The configuration for inference parameters when using AI Prompts.
///
/// @nodoc
class AIPromptInferenceConfiguration {
  /// The maximum number of tokens to generate in the response.
  final int? maxTokensToSample;

  /// The temperature setting for controlling randomness in the generated
  /// response.
  final double? temperature;

  /// The top-K sampling parameter for token selection.
  final int? topK;

  /// The top-P sampling parameter for nucleus sampling.
  final double? topP;

  AIPromptInferenceConfiguration({
    this.maxTokensToSample,
    this.temperature,
    this.topK,
    this.topP,
  });

  factory AIPromptInferenceConfiguration.fromJson(Map<String, dynamic> json) {
    return AIPromptInferenceConfiguration(
      maxTokensToSample: json['maxTokensToSample'] as int?,
      temperature: _s.parseJsonDouble(json['temperature']),
      topK: json['topK'] as int?,
      topP: _s.parseJsonDouble(json['topP']),
    );
  }

  Map<String, dynamic> toJson() {
    final maxTokensToSample = this.maxTokensToSample;
    final temperature = this.temperature;
    final topK = this.topK;
    final topP = this.topP;
    return {
      if (maxTokensToSample != null) 'maxTokensToSample': maxTokensToSample,
      if (temperature != null) 'temperature': _s.encodeJsonDouble(temperature),
      if (topK != null) 'topK': topK,
      if (topP != null) 'topP': _s.encodeJsonDouble(topP),
    };
  }
}

/// The configuration for a prompt template that supports full textual prompt
/// configuration using a YAML prompt.
///
/// @nodoc
class TextFullAIPromptEditTemplateConfiguration {
  /// The YAML text for the AI Prompt template.
  final String text;

  TextFullAIPromptEditTemplateConfiguration({
    required this.text,
  });

  factory TextFullAIPromptEditTemplateConfiguration.fromJson(
      Map<String, dynamic> json) {
    return TextFullAIPromptEditTemplateConfiguration(
      text: (json['text'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'text': text,
    };
  }
}

/// The summary of the AI Guardrail version.
///
/// @nodoc
class AIGuardrailVersionSummary {
  /// The data for the summary of the AI Guardrail version.
  final AIGuardrailSummary? aiGuardrailSummary;

  /// The version number for this AI Guardrail version.
  final int? versionNumber;

  AIGuardrailVersionSummary({
    this.aiGuardrailSummary,
    this.versionNumber,
  });

  factory AIGuardrailVersionSummary.fromJson(Map<String, dynamic> json) {
    return AIGuardrailVersionSummary(
      aiGuardrailSummary: json['aiGuardrailSummary'] != null
          ? AIGuardrailSummary.fromJson(
              json['aiGuardrailSummary'] as Map<String, dynamic>)
          : null,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiGuardrailSummary = this.aiGuardrailSummary;
    final versionNumber = this.versionNumber;
    return {
      if (aiGuardrailSummary != null) 'aiGuardrailSummary': aiGuardrailSummary,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// The summary of the AI Guardrail.
///
/// @nodoc
class AIGuardrailSummary {
  /// The Amazon Resource Name (ARN) of the AI Guardrail.
  final String aiGuardrailArn;

  /// The identifier of the Amazon Q in Connect AI Guardrail.
  final String aiGuardrailId;

  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID or
  /// the ARN. URLs cannot contain the ARN.
  final String assistantId;

  /// The name of the AI Guardrail.
  final String name;

  /// The visibility status of the AI Guardrail.
  final VisibilityStatus visibilityStatus;

  /// A description of the AI Guardrail.
  final String? description;

  /// The time the AI Guardrail was last modified.
  final DateTime? modifiedTime;

  /// The status of the AI Guardrail.
  final Status? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AIGuardrailSummary({
    required this.aiGuardrailArn,
    required this.aiGuardrailId,
    required this.assistantArn,
    required this.assistantId,
    required this.name,
    required this.visibilityStatus,
    this.description,
    this.modifiedTime,
    this.status,
    this.tags,
  });

  factory AIGuardrailSummary.fromJson(Map<String, dynamic> json) {
    return AIGuardrailSummary(
      aiGuardrailArn: (json['aiGuardrailArn'] as String?) ?? '',
      aiGuardrailId: (json['aiGuardrailId'] as String?) ?? '',
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      visibilityStatus: VisibilityStatus.fromString(
          (json['visibilityStatus'] as String?) ?? ''),
      description: json['description'] as String?,
      modifiedTime: timeStampFromJson(json['modifiedTime']),
      status: (json['status'] as String?)?.let(Status.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final aiGuardrailArn = this.aiGuardrailArn;
    final aiGuardrailId = this.aiGuardrailId;
    final assistantArn = this.assistantArn;
    final assistantId = this.assistantId;
    final name = this.name;
    final visibilityStatus = this.visibilityStatus;
    final description = this.description;
    final modifiedTime = this.modifiedTime;
    final status = this.status;
    final tags = this.tags;
    return {
      'aiGuardrailArn': aiGuardrailArn,
      'aiGuardrailId': aiGuardrailId,
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'name': name,
      'visibilityStatus': visibilityStatus.value,
      if (description != null) 'description': description,
      if (modifiedTime != null)
        'modifiedTime': unixTimestampToJson(modifiedTime),
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The data for the AI Guardrail
///
/// @nodoc
class AIGuardrailData {
  /// The Amazon Resource Name (ARN) of the AI Guardrail.
  final String aiGuardrailArn;

  /// The identifier of the Amazon Q in Connect AI Guardrail.
  final String aiGuardrailId;

  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID or
  /// the ARN. URLs cannot contain the ARN.
  final String assistantId;

  /// The message to return when the AI Guardrail blocks a prompt.
  final String blockedInputMessaging;

  /// The message to return when the AI Guardrail blocks a model response.
  final String blockedOutputsMessaging;

  /// The name of the AI Guardrail.
  final String name;

  /// The visibility status of the AI Guardrail.
  final VisibilityStatus visibilityStatus;

  /// Contains details about how to handle harmful content.
  final AIGuardrailContentPolicyConfig? contentPolicyConfig;

  /// The policy configuration details for the AI Guardrail's contextual grounding
  /// policy.
  final AIGuardrailContextualGroundingPolicyConfig?
      contextualGroundingPolicyConfig;

  /// A description of the AI Guardrail.
  final String? description;

  /// The time the AI Guardrail was last modified.
  final DateTime? modifiedTime;

  /// Contains details about PII entities and regular expressions to configure for
  /// the AI Guardrail.
  final AIGuardrailSensitiveInformationPolicyConfig?
      sensitiveInformationPolicyConfig;

  /// The status of the AI Guardrail.
  final Status? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Contains details about topics that the AI Guardrail should identify and
  /// deny.
  final AIGuardrailTopicPolicyConfig? topicPolicyConfig;

  /// Contains details about the word policy to configured for the AI Guardrail.
  final AIGuardrailWordPolicyConfig? wordPolicyConfig;

  AIGuardrailData({
    required this.aiGuardrailArn,
    required this.aiGuardrailId,
    required this.assistantArn,
    required this.assistantId,
    required this.blockedInputMessaging,
    required this.blockedOutputsMessaging,
    required this.name,
    required this.visibilityStatus,
    this.contentPolicyConfig,
    this.contextualGroundingPolicyConfig,
    this.description,
    this.modifiedTime,
    this.sensitiveInformationPolicyConfig,
    this.status,
    this.tags,
    this.topicPolicyConfig,
    this.wordPolicyConfig,
  });

  factory AIGuardrailData.fromJson(Map<String, dynamic> json) {
    return AIGuardrailData(
      aiGuardrailArn: (json['aiGuardrailArn'] as String?) ?? '',
      aiGuardrailId: (json['aiGuardrailId'] as String?) ?? '',
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      blockedInputMessaging: (json['blockedInputMessaging'] as String?) ?? '',
      blockedOutputsMessaging:
          (json['blockedOutputsMessaging'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      visibilityStatus: VisibilityStatus.fromString(
          (json['visibilityStatus'] as String?) ?? ''),
      contentPolicyConfig: json['contentPolicyConfig'] != null
          ? AIGuardrailContentPolicyConfig.fromJson(
              json['contentPolicyConfig'] as Map<String, dynamic>)
          : null,
      contextualGroundingPolicyConfig:
          json['contextualGroundingPolicyConfig'] != null
              ? AIGuardrailContextualGroundingPolicyConfig.fromJson(
                  json['contextualGroundingPolicyConfig']
                      as Map<String, dynamic>)
              : null,
      description: json['description'] as String?,
      modifiedTime: timeStampFromJson(json['modifiedTime']),
      sensitiveInformationPolicyConfig:
          json['sensitiveInformationPolicyConfig'] != null
              ? AIGuardrailSensitiveInformationPolicyConfig.fromJson(
                  json['sensitiveInformationPolicyConfig']
                      as Map<String, dynamic>)
              : null,
      status: (json['status'] as String?)?.let(Status.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      topicPolicyConfig: json['topicPolicyConfig'] != null
          ? AIGuardrailTopicPolicyConfig.fromJson(
              json['topicPolicyConfig'] as Map<String, dynamic>)
          : null,
      wordPolicyConfig: json['wordPolicyConfig'] != null
          ? AIGuardrailWordPolicyConfig.fromJson(
              json['wordPolicyConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aiGuardrailArn = this.aiGuardrailArn;
    final aiGuardrailId = this.aiGuardrailId;
    final assistantArn = this.assistantArn;
    final assistantId = this.assistantId;
    final blockedInputMessaging = this.blockedInputMessaging;
    final blockedOutputsMessaging = this.blockedOutputsMessaging;
    final name = this.name;
    final visibilityStatus = this.visibilityStatus;
    final contentPolicyConfig = this.contentPolicyConfig;
    final contextualGroundingPolicyConfig =
        this.contextualGroundingPolicyConfig;
    final description = this.description;
    final modifiedTime = this.modifiedTime;
    final sensitiveInformationPolicyConfig =
        this.sensitiveInformationPolicyConfig;
    final status = this.status;
    final tags = this.tags;
    final topicPolicyConfig = this.topicPolicyConfig;
    final wordPolicyConfig = this.wordPolicyConfig;
    return {
      'aiGuardrailArn': aiGuardrailArn,
      'aiGuardrailId': aiGuardrailId,
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'blockedInputMessaging': blockedInputMessaging,
      'blockedOutputsMessaging': blockedOutputsMessaging,
      'name': name,
      'visibilityStatus': visibilityStatus.value,
      if (contentPolicyConfig != null)
        'contentPolicyConfig': contentPolicyConfig,
      if (contextualGroundingPolicyConfig != null)
        'contextualGroundingPolicyConfig': contextualGroundingPolicyConfig,
      if (description != null) 'description': description,
      if (modifiedTime != null)
        'modifiedTime': unixTimestampToJson(modifiedTime),
      if (sensitiveInformationPolicyConfig != null)
        'sensitiveInformationPolicyConfig': sensitiveInformationPolicyConfig,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (topicPolicyConfig != null) 'topicPolicyConfig': topicPolicyConfig,
      if (wordPolicyConfig != null) 'wordPolicyConfig': wordPolicyConfig,
    };
  }
}

/// Contains details about topics that the AI Guardrail should identify and
/// deny.
///
/// @nodoc
class AIGuardrailTopicPolicyConfig {
  /// A list of policies related to topics that the AI Guardrail should deny.
  final List<GuardrailTopicConfig> topicsConfig;

  AIGuardrailTopicPolicyConfig({
    required this.topicsConfig,
  });

  factory AIGuardrailTopicPolicyConfig.fromJson(Map<String, dynamic> json) {
    return AIGuardrailTopicPolicyConfig(
      topicsConfig: ((json['topicsConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) => GuardrailTopicConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final topicsConfig = this.topicsConfig;
    return {
      'topicsConfig': topicsConfig,
    };
  }
}

/// Contains details about how to handle harmful content.
///
/// @nodoc
class AIGuardrailContentPolicyConfig {
  /// Contains the type of the content filter and how strongly it should apply to
  /// prompts and model responses.
  final List<GuardrailContentFilterConfig> filtersConfig;

  AIGuardrailContentPolicyConfig({
    required this.filtersConfig,
  });

  factory AIGuardrailContentPolicyConfig.fromJson(Map<String, dynamic> json) {
    return AIGuardrailContentPolicyConfig(
      filtersConfig: ((json['filtersConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              GuardrailContentFilterConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final filtersConfig = this.filtersConfig;
    return {
      'filtersConfig': filtersConfig,
    };
  }
}

/// Contains details about the word policy to configured for the AI Guardrail.
///
/// @nodoc
class AIGuardrailWordPolicyConfig {
  /// A list of managed words to configure for the AI Guardrail.
  final List<GuardrailManagedWordsConfig>? managedWordListsConfig;

  /// A list of words to configure for the AI Guardrail.
  final List<GuardrailWordConfig>? wordsConfig;

  AIGuardrailWordPolicyConfig({
    this.managedWordListsConfig,
    this.wordsConfig,
  });

  factory AIGuardrailWordPolicyConfig.fromJson(Map<String, dynamic> json) {
    return AIGuardrailWordPolicyConfig(
      managedWordListsConfig: (json['managedWordListsConfig'] as List?)
          ?.nonNulls
          .map((e) =>
              GuardrailManagedWordsConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      wordsConfig: (json['wordsConfig'] as List?)
          ?.nonNulls
          .map((e) => GuardrailWordConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final managedWordListsConfig = this.managedWordListsConfig;
    final wordsConfig = this.wordsConfig;
    return {
      if (managedWordListsConfig != null)
        'managedWordListsConfig': managedWordListsConfig,
      if (wordsConfig != null) 'wordsConfig': wordsConfig,
    };
  }
}

/// Contains details about PII entities and regular expressions to configure for
/// the AI Guardrail.
///
/// @nodoc
class AIGuardrailSensitiveInformationPolicyConfig {
  /// A list of PII entities to configure to the AI Guardrail.
  final List<GuardrailPiiEntityConfig>? piiEntitiesConfig;

  /// A list of regular expressions to configure to the AI Guardrail.
  final List<GuardrailRegexConfig>? regexesConfig;

  AIGuardrailSensitiveInformationPolicyConfig({
    this.piiEntitiesConfig,
    this.regexesConfig,
  });

  factory AIGuardrailSensitiveInformationPolicyConfig.fromJson(
      Map<String, dynamic> json) {
    return AIGuardrailSensitiveInformationPolicyConfig(
      piiEntitiesConfig: (json['piiEntitiesConfig'] as List?)
          ?.nonNulls
          .map((e) =>
              GuardrailPiiEntityConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      regexesConfig: (json['regexesConfig'] as List?)
          ?.nonNulls
          .map((e) => GuardrailRegexConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final piiEntitiesConfig = this.piiEntitiesConfig;
    final regexesConfig = this.regexesConfig;
    return {
      if (piiEntitiesConfig != null) 'piiEntitiesConfig': piiEntitiesConfig,
      if (regexesConfig != null) 'regexesConfig': regexesConfig,
    };
  }
}

/// The policy configuration details for the AI Guardrail's contextual grounding
/// policy.
///
/// @nodoc
class AIGuardrailContextualGroundingPolicyConfig {
  /// The filter configuration details for the AI Guardrails contextual grounding
  /// policy.
  final List<GuardrailContextualGroundingFilterConfig> filtersConfig;

  AIGuardrailContextualGroundingPolicyConfig({
    required this.filtersConfig,
  });

  factory AIGuardrailContextualGroundingPolicyConfig.fromJson(
      Map<String, dynamic> json) {
    return AIGuardrailContextualGroundingPolicyConfig(
      filtersConfig: ((json['filtersConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) => GuardrailContextualGroundingFilterConfig.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final filtersConfig = this.filtersConfig;
    return {
      'filtersConfig': filtersConfig,
    };
  }
}

/// The filter configuration details for the AI Guardrail's contextual grounding
/// filter.
///
/// @nodoc
class GuardrailContextualGroundingFilterConfig {
  /// The threshold details for the AI Guardrail's contextual grounding filter.
  final double threshold;

  /// The filter type for the AI Guardrail's contextual grounding filter.
  final GuardrailContextualGroundingFilterType type;

  GuardrailContextualGroundingFilterConfig({
    required this.threshold,
    required this.type,
  });

  factory GuardrailContextualGroundingFilterConfig.fromJson(
      Map<String, dynamic> json) {
    return GuardrailContextualGroundingFilterConfig(
      threshold: _s.parseJsonDouble(json['threshold']) ?? 0,
      type: GuardrailContextualGroundingFilterType.fromString(
          (json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final threshold = this.threshold;
    final type = this.type;
    return {
      'threshold': _s.encodeJsonDouble(threshold),
      'type': type.value,
    };
  }
}

/// Type of contextual grounding filter
///
/// @nodoc
class GuardrailContextualGroundingFilterType {
  static const grounding =
      GuardrailContextualGroundingFilterType._('GROUNDING');
  static const relevance =
      GuardrailContextualGroundingFilterType._('RELEVANCE');

  final String value;

  const GuardrailContextualGroundingFilterType._(this.value);

  static const values = [grounding, relevance];

  static GuardrailContextualGroundingFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContextualGroundingFilterType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContextualGroundingFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The regular expression to configure for the AI Guardrail.
///
/// @nodoc
class GuardrailRegexConfig {
  /// The AI Guardrail action to configure when matching regular expression is
  /// detected.
  final GuardrailSensitiveInformationAction action;

  /// The name of the regular expression to configure for the AI Guardrail.
  final String name;

  /// The regular expression pattern to configure for the AI Guardrail.
  final String pattern;

  /// The description of the regular expression to configure for the AI Guardrail.
  final String? description;

  GuardrailRegexConfig({
    required this.action,
    required this.name,
    required this.pattern,
    this.description,
  });

  factory GuardrailRegexConfig.fromJson(Map<String, dynamic> json) {
    return GuardrailRegexConfig(
      action: GuardrailSensitiveInformationAction.fromString(
          (json['action'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      pattern: (json['pattern'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final pattern = this.pattern;
    final description = this.description;
    return {
      'action': action.value,
      'name': name,
      'pattern': pattern,
      if (description != null) 'description': description,
    };
  }
}

/// Options for sensitive information action.
///
/// @nodoc
class GuardrailSensitiveInformationAction {
  static const block = GuardrailSensitiveInformationAction._('BLOCK');
  static const anonymize = GuardrailSensitiveInformationAction._('ANONYMIZE');

  final String value;

  const GuardrailSensitiveInformationAction._(this.value);

  static const values = [block, anonymize];

  static GuardrailSensitiveInformationAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailSensitiveInformationAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailSensitiveInformationAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The PII entity to configure for the AI Guardrail.
///
/// @nodoc
class GuardrailPiiEntityConfig {
  /// Configure AI Guardrail's action when the PII entity is detected.
  final GuardrailSensitiveInformationAction action;

  /// Configure AI Guardrail type when the PII entity is detected.
  ///
  /// The following PIIs are used to block or mask sensitive information:
  ///
  /// <ul>
  /// <li>
  /// <b>General</b>
  ///
  /// <ul>
  /// <li>
  /// <b>ADDRESS</b>
  ///
  /// A physical address, such as "100 Main Street, Anytown, USA" or "Suite #12,
  /// Building 123". An address can include information such as the street,
  /// building, location, city, state, country, county, zip code, precinct, and
  /// neighborhood.
  /// </li>
  /// <li>
  /// <b>AGE</b>
  ///
  /// An individual's age, including the quantity and unit of time. For example,
  /// in the phrase "I am 40 years old," Guarrails recognizes "40 years" as an
  /// age.
  /// </li>
  /// <li>
  /// <b>NAME</b>
  ///
  /// An individual's name. This entity type does not include titles, such as Dr.,
  /// Mr., Mrs., or Miss. AI Guardrail doesn't apply this entity type to names
  /// that are part of organizations or addresses. For example, AI Guardrail
  /// recognizes the "John Doe Organization" as an organization, and it recognizes
  /// "Jane Doe Street" as an address.
  /// </li>
  /// <li>
  /// <b>EMAIL</b>
  ///
  /// An email address, such as <i>marymajor@email.com</i>.
  /// </li>
  /// <li>
  /// <b>PHONE</b>
  ///
  /// A phone number. This entity type also includes fax and pager numbers.
  /// </li>
  /// <li>
  /// <b>USERNAME</b>
  ///
  /// A user name that identifies an account, such as a login name, screen name,
  /// nick name, or handle.
  /// </li>
  /// <li>
  /// <b>PASSWORD</b>
  ///
  /// An alphanumeric string that is used as a password, such as "*<i>
  /// very20special#pass*</i>".
  /// </li>
  /// <li>
  /// <b>DRIVER_ID</b>
  ///
  /// The number assigned to a driver's license, which is an official document
  /// permitting an individual to operate one or more motorized vehicles on a
  /// public road. A driver's license number consists of alphanumeric characters.
  /// </li>
  /// <li>
  /// <b>LICENSE_PLATE</b>
  ///
  /// A license plate for a vehicle is issued by the state or country where the
  /// vehicle is registered. The format for passenger vehicles is typically five
  /// to eight digits, consisting of upper-case letters and numbers. The format
  /// varies depending on the location of the issuing state or country.
  /// </li>
  /// <li>
  /// <b>VEHICLE_IDENTIFICATION_NUMBER</b>
  ///
  /// A Vehicle Identification Number (VIN) uniquely identifies a vehicle. VIN
  /// content and format are defined in the <i>ISO 3779</i> specification. Each
  /// country has specific codes and formats for VINs.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Finance</b>
  ///
  /// <ul>
  /// <li>
  /// <b>CREDIT_DEBIT_CARD_CVV</b>
  ///
  /// A three-digit card verification code (CVV) that is present on VISA,
  /// MasterCard, and Discover credit and debit cards. For American Express credit
  /// or debit cards, the CVV is a four-digit numeric code.
  /// </li>
  /// <li>
  /// <b>CREDIT_DEBIT_CARD_EXPIRY</b>
  ///
  /// The expiration date for a credit or debit card. This number is usually four
  /// digits long and is often formatted as <i>month/year</i> or <i>MM/YY</i>. AI
  /// Guardrail recognizes expiration dates such as <i>01/21</i>, <i>01/2021</i>,
  /// and <i>Jan 2021</i>.
  /// </li>
  /// <li>
  /// <b>CREDIT_DEBIT_CARD_NUMBER</b>
  ///
  /// The number for a credit or debit card. These numbers can vary from 13 to 16
  /// digits in length. However, Amazon Comprehend also recognizes credit or debit
  /// card numbers when only the last four digits are present.
  /// </li>
  /// <li>
  /// <b>PIN</b>
  ///
  /// A four-digit personal identification number (PIN) with which you can access
  /// your bank account.
  /// </li>
  /// <li>
  /// <b>INTERNATIONAL_BANK_ACCOUNT_NUMBER</b>
  ///
  /// An International Bank Account Number has specific formats in each country.
  /// For more information, see <a href="https://www.iban.com/structure">
  /// www.iban.com/structure</a>.
  /// </li>
  /// <li>
  /// <b>SWIFT_CODE</b>
  ///
  /// A SWIFT code is a standard format of Bank Identifier Code (BIC) used to
  /// specify a particular bank or branch. Banks use these codes for money
  /// transfers such as international wire transfers.
  ///
  /// SWIFT codes consist of eight or 11 characters. The 11-digit codes refer to
  /// specific branches, while eight-digit codes (or 11-digit codes ending in
  /// 'XXX') refer to the head or primary office.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>IT</b>
  ///
  /// <ul>
  /// <li>
  /// <b>IP_ADDRESS</b>
  ///
  /// An IPv4 address, such as <i>198.51.100.0</i>.
  /// </li>
  /// <li>
  /// <b>MAC_ADDRESS</b>
  ///
  /// A <i>media access control</i> (MAC) address is a unique identifier assigned
  /// to a network interface controller (NIC).
  /// </li>
  /// <li>
  /// <b>URL</b>
  ///
  /// A web address, such as <i>www.example.com</i>.
  /// </li>
  /// <li>
  /// <b>AWS_ACCESS_KEY</b>
  ///
  /// A unique identifier that's associated with a secret access key; you use the
  /// access key ID and secret access key to sign programmatic Amazon Web Services
  /// requests cryptographically.
  /// </li>
  /// <li>
  /// <b>AWS_SECRET_KEY</b>
  ///
  /// A unique identifier that's associated with an access key. You use the access
  /// key ID and secret access key to sign programmatic Amazon Web Services
  /// requests cryptographically.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>USA specific</b>
  ///
  /// <ul>
  /// <li>
  /// <b>US_BANK_ACCOUNT_NUMBER</b>
  ///
  /// A US bank account number, which is typically 10 to 12 digits long.
  /// </li>
  /// <li>
  /// <b>US_BANK_ROUTING_NUMBER</b>
  ///
  /// A US bank account routing number. These are typically nine digits long,
  /// </li>
  /// <li>
  /// <b>US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER</b>
  ///
  /// A US Individual Taxpayer Identification Number (ITIN) is a nine-digit number
  /// that starts with a "9" and contain a "7" or "8" as the fourth digit. An ITIN
  /// can be formatted with a space or a dash after the third and forth digits.
  /// </li>
  /// <li>
  /// <b>US_PASSPORT_NUMBER</b>
  ///
  /// A US passport number. Passport numbers range from six to nine alphanumeric
  /// characters.
  /// </li>
  /// <li>
  /// <b>US_SOCIAL_SECURITY_NUMBER</b>
  ///
  /// A US Social Security Number (SSN) is a nine-digit number that is issued to
  /// US citizens, permanent residents, and temporary working residents.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Canada specific</b>
  ///
  /// <ul>
  /// <li>
  /// <b>CA_HEALTH_NUMBER</b>
  ///
  /// A Canadian Health Service Number is a 10-digit unique identifier, required
  /// for individuals to access healthcare benefits.
  /// </li>
  /// <li>
  /// <b>CA_SOCIAL_INSURANCE_NUMBER</b>
  ///
  /// A Canadian Social Insurance Number (SIN) is a nine-digit unique identifier,
  /// required for individuals to access government programs and benefits.
  ///
  /// The SIN is formatted as three groups of three digits, such as <i>
  /// 123-456-789</i>. A SIN can be validated through a simple check-digit process
  /// called the <a href="https://www.wikipedia.org/wiki/Luhn_algorithm">Luhn
  /// algorithm</a> .
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>UK Specific</b>
  ///
  /// <ul>
  /// <li>
  /// <b>UK_NATIONAL_HEALTH_SERVICE_NUMBER</b>
  ///
  /// A UK National Health Service Number is a 10-17 digit number, such as <i>485
  /// 555 3456</i>. The current system formats the 10-digit number with spaces
  /// after the third and sixth digits. The final digit is an error-detecting
  /// checksum.
  /// </li>
  /// <li>
  /// <b>UK_NATIONAL_INSURANCE_NUMBER</b>
  ///
  /// A UK National Insurance Number (NINO) provides individuals with access to
  /// National Insurance (social security) benefits. It is also used for some
  /// purposes in the UK tax system.
  ///
  /// The number is nine digits long and starts with two letters, followed by six
  /// numbers and one letter. A NINO can be formatted with a space or a dash after
  /// the two letters and after the second, forth, and sixth digits.
  /// </li>
  /// <li>
  /// <b>UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER</b>
  ///
  /// A UK Unique Taxpayer Reference (UTR) is a 10-digit number that identifies a
  /// taxpayer or a business.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Custom</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Regex filter</b> - You can use a regular expressions to define patterns
  /// for an AI Guardrail to recognize and act upon such as serial number, booking
  /// ID etc..
  /// </li>
  /// </ul> </li>
  /// </ul>
  final GuardrailPiiEntityType type;

  GuardrailPiiEntityConfig({
    required this.action,
    required this.type,
  });

  factory GuardrailPiiEntityConfig.fromJson(Map<String, dynamic> json) {
    return GuardrailPiiEntityConfig(
      action: GuardrailSensitiveInformationAction.fromString(
          (json['action'] as String?) ?? ''),
      type: GuardrailPiiEntityType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final type = this.type;
    return {
      'action': action.value,
      'type': type.value,
    };
  }
}

/// The currently supported PII entities
///
/// @nodoc
class GuardrailPiiEntityType {
  static const address = GuardrailPiiEntityType._('ADDRESS');
  static const age = GuardrailPiiEntityType._('AGE');
  static const awsAccessKey = GuardrailPiiEntityType._('AWS_ACCESS_KEY');
  static const awsSecretKey = GuardrailPiiEntityType._('AWS_SECRET_KEY');
  static const caHealthNumber = GuardrailPiiEntityType._('CA_HEALTH_NUMBER');
  static const caSocialInsuranceNumber =
      GuardrailPiiEntityType._('CA_SOCIAL_INSURANCE_NUMBER');
  static const creditDebitCardCvv =
      GuardrailPiiEntityType._('CREDIT_DEBIT_CARD_CVV');
  static const creditDebitCardExpiry =
      GuardrailPiiEntityType._('CREDIT_DEBIT_CARD_EXPIRY');
  static const creditDebitCardNumber =
      GuardrailPiiEntityType._('CREDIT_DEBIT_CARD_NUMBER');
  static const driverId = GuardrailPiiEntityType._('DRIVER_ID');
  static const email = GuardrailPiiEntityType._('EMAIL');
  static const internationalBankAccountNumber =
      GuardrailPiiEntityType._('INTERNATIONAL_BANK_ACCOUNT_NUMBER');
  static const ipAddress = GuardrailPiiEntityType._('IP_ADDRESS');
  static const licensePlate = GuardrailPiiEntityType._('LICENSE_PLATE');
  static const macAddress = GuardrailPiiEntityType._('MAC_ADDRESS');
  static const name = GuardrailPiiEntityType._('NAME');
  static const password = GuardrailPiiEntityType._('PASSWORD');
  static const phone = GuardrailPiiEntityType._('PHONE');
  static const pin = GuardrailPiiEntityType._('PIN');
  static const swiftCode = GuardrailPiiEntityType._('SWIFT_CODE');
  static const ukNationalHealthServiceNumber =
      GuardrailPiiEntityType._('UK_NATIONAL_HEALTH_SERVICE_NUMBER');
  static const ukNationalInsuranceNumber =
      GuardrailPiiEntityType._('UK_NATIONAL_INSURANCE_NUMBER');
  static const ukUniqueTaxpayerReferenceNumber =
      GuardrailPiiEntityType._('UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER');
  static const url = GuardrailPiiEntityType._('URL');
  static const username = GuardrailPiiEntityType._('USERNAME');
  static const usBankAccountNumber =
      GuardrailPiiEntityType._('US_BANK_ACCOUNT_NUMBER');
  static const usBankRoutingNumber =
      GuardrailPiiEntityType._('US_BANK_ROUTING_NUMBER');
  static const usIndividualTaxIdentificationNumber =
      GuardrailPiiEntityType._('US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER');
  static const usPassportNumber =
      GuardrailPiiEntityType._('US_PASSPORT_NUMBER');
  static const usSocialSecurityNumber =
      GuardrailPiiEntityType._('US_SOCIAL_SECURITY_NUMBER');
  static const vehicleIdentificationNumber =
      GuardrailPiiEntityType._('VEHICLE_IDENTIFICATION_NUMBER');

  final String value;

  const GuardrailPiiEntityType._(this.value);

  static const values = [
    address,
    age,
    awsAccessKey,
    awsSecretKey,
    caHealthNumber,
    caSocialInsuranceNumber,
    creditDebitCardCvv,
    creditDebitCardExpiry,
    creditDebitCardNumber,
    driverId,
    email,
    internationalBankAccountNumber,
    ipAddress,
    licensePlate,
    macAddress,
    name,
    password,
    phone,
    pin,
    swiftCode,
    ukNationalHealthServiceNumber,
    ukNationalInsuranceNumber,
    ukUniqueTaxpayerReferenceNumber,
    url,
    username,
    usBankAccountNumber,
    usBankRoutingNumber,
    usIndividualTaxIdentificationNumber,
    usPassportNumber,
    usSocialSecurityNumber,
    vehicleIdentificationNumber
  ];

  static GuardrailPiiEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailPiiEntityType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailPiiEntityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The managed word list to configure for the AI Guardrail.
///
/// @nodoc
class GuardrailManagedWordsConfig {
  /// The managed word type to configure for the AI Guardrail.
  final GuardrailManagedWordsType type;

  GuardrailManagedWordsConfig({
    required this.type,
  });

  factory GuardrailManagedWordsConfig.fromJson(Map<String, dynamic> json) {
    return GuardrailManagedWordsConfig(
      type:
          GuardrailManagedWordsType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.value,
    };
  }
}

/// Options for managed words.
///
/// @nodoc
class GuardrailManagedWordsType {
  static const profanity = GuardrailManagedWordsType._('PROFANITY');

  final String value;

  const GuardrailManagedWordsType._(this.value);

  static const values = [profanity];

  static GuardrailManagedWordsType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailManagedWordsType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailManagedWordsType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A word to configure for the AI Guardrail.
///
/// @nodoc
class GuardrailWordConfig {
  /// Text of the word configured for the AI Guardrail to block.
  final String text;

  GuardrailWordConfig({
    required this.text,
  });

  factory GuardrailWordConfig.fromJson(Map<String, dynamic> json) {
    return GuardrailWordConfig(
      text: (json['text'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'text': text,
    };
  }
}

/// Contains filter strengths for harmful content. AI Guardrail's support the
/// following content filters to detect and filter harmful user inputs and
/// FM-generated outputs.
///
/// <ul>
/// <li>
/// <b>Hate</b>: Describes input prompts and model responses that discriminate,
/// criticize, insult, denounce, or dehumanize a person or group on the basis of
/// an identity (such as race, ethnicity, gender, religion, sexual orientation,
/// ability, and national origin).
/// </li>
/// <li>
/// <b>Insults</b>: Describes input prompts and model responses that includes
/// demeaning, humiliating, mocking, insulting, or belittling language. This
/// type of language is also labeled as bullying.
/// </li>
/// <li>
/// <b>Sexual</b>: Describes input prompts and model responses that indicates
/// sexual interest, activity, or arousal using direct or indirect references to
/// body parts, physical traits, or sex.
/// </li>
/// <li>
/// <b>Violence</b>: Describes input prompts and model responses that includes
/// glorification of, or threats to inflict physical pain, hurt, or injury
/// toward a person, group, or thing.
/// </li>
/// </ul>
/// Content filtering depends on the confidence classification of user inputs
/// and FM responses across each of the four harmful categories. All input and
/// output statements are classified into one of four confidence levels (NONE,
/// LOW, MEDIUM, HIGH) for each harmful category. For example, if a statement is
/// classified as <i>Hate</i> with HIGH confidence, the likelihood of the
/// statement representing hateful content is high. A single statement can be
/// classified across multiple categories with varying confidence levels. For
/// example, a single statement can be classified as <i>Hate</i> with HIGH
/// confidence, <i> Insults</i> with LOW confidence, <i>Sexual</i> with NONE
/// confidence, and <i>Violence</i> with MEDIUM confidence.
///
/// @nodoc
class GuardrailContentFilterConfig {
  /// The strength of the content filter to apply to prompts. As you increase the
  /// filter strength, the likelihood of filtering harmful content increases and
  /// the probability of seeing harmful content in your application reduces.
  final GuardrailFilterStrength inputStrength;

  /// The strength of the content filter to apply to model responses. As you
  /// increase the filter strength, the likelihood of filtering harmful content
  /// increases and the probability of seeing harmful content in your application
  /// reduces.
  final GuardrailFilterStrength outputStrength;

  /// The harmful category that the content filter is applied to.
  final GuardrailContentFilterType type;

  GuardrailContentFilterConfig({
    required this.inputStrength,
    required this.outputStrength,
    required this.type,
  });

  factory GuardrailContentFilterConfig.fromJson(Map<String, dynamic> json) {
    return GuardrailContentFilterConfig(
      inputStrength: GuardrailFilterStrength.fromString(
          (json['inputStrength'] as String?) ?? ''),
      outputStrength: GuardrailFilterStrength.fromString(
          (json['outputStrength'] as String?) ?? ''),
      type: GuardrailContentFilterType.fromString(
          (json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final inputStrength = this.inputStrength;
    final outputStrength = this.outputStrength;
    final type = this.type;
    return {
      'inputStrength': inputStrength.value,
      'outputStrength': outputStrength.value,
      'type': type.value,
    };
  }
}

/// Type of text to text filter in content policy
///
/// @nodoc
class GuardrailContentFilterType {
  static const sexual = GuardrailContentFilterType._('SEXUAL');
  static const violence = GuardrailContentFilterType._('VIOLENCE');
  static const hate = GuardrailContentFilterType._('HATE');
  static const insults = GuardrailContentFilterType._('INSULTS');
  static const misconduct = GuardrailContentFilterType._('MISCONDUCT');
  static const promptAttack = GuardrailContentFilterType._('PROMPT_ATTACK');

  final String value;

  const GuardrailContentFilterType._(this.value);

  static const values = [
    sexual,
    violence,
    hate,
    insults,
    misconduct,
    promptAttack
  ];

  static GuardrailContentFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContentFilterType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContentFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Strength for filters
///
/// @nodoc
class GuardrailFilterStrength {
  static const none = GuardrailFilterStrength._('NONE');
  static const low = GuardrailFilterStrength._('LOW');
  static const medium = GuardrailFilterStrength._('MEDIUM');
  static const high = GuardrailFilterStrength._('HIGH');

  final String value;

  const GuardrailFilterStrength._(this.value);

  static const values = [none, low, medium, high];

  static GuardrailFilterStrength fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailFilterStrength._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailFilterStrength && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about topics for the AI Guardrail to identify and deny.
///
/// @nodoc
class GuardrailTopicConfig {
  /// A definition of the topic to deny.
  final String definition;

  /// The name of the topic to deny.
  final String name;

  /// Specifies to deny the topic.
  final GuardrailTopicType type;

  /// A list of prompts, each of which is an example of a prompt that can be
  /// categorized as belonging to the topic.
  final List<String>? examples;

  GuardrailTopicConfig({
    required this.definition,
    required this.name,
    required this.type,
    this.examples,
  });

  factory GuardrailTopicConfig.fromJson(Map<String, dynamic> json) {
    return GuardrailTopicConfig(
      definition: (json['definition'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      type: GuardrailTopicType.fromString((json['type'] as String?) ?? ''),
      examples: (json['examples'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final name = this.name;
    final type = this.type;
    final examples = this.examples;
    return {
      'definition': definition,
      'name': name,
      'type': type.value,
      if (examples != null) 'examples': examples,
    };
  }
}

/// Type of topic in a policy
///
/// @nodoc
class GuardrailTopicType {
  static const deny = GuardrailTopicType._('DENY');

  final String value;

  const GuardrailTopicType._(this.value);

  static const values = [deny];

  static GuardrailTopicType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailTopicType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailTopicType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of the AI Agent version.
///
/// @nodoc
class AIAgentVersionSummary {
  /// The data for the summary of the AI Agent version.
  final AIAgentSummary? aiAgentSummary;

  /// The version number for this AI Agent version.
  final int? versionNumber;

  AIAgentVersionSummary({
    this.aiAgentSummary,
    this.versionNumber,
  });

  factory AIAgentVersionSummary.fromJson(Map<String, dynamic> json) {
    return AIAgentVersionSummary(
      aiAgentSummary: json['aiAgentSummary'] != null
          ? AIAgentSummary.fromJson(
              json['aiAgentSummary'] as Map<String, dynamic>)
          : null,
      versionNumber: json['versionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgentSummary = this.aiAgentSummary;
    final versionNumber = this.versionNumber;
    return {
      if (aiAgentSummary != null) 'aiAgentSummary': aiAgentSummary,
      if (versionNumber != null) 'versionNumber': versionNumber,
    };
  }
}

/// The summary of the AI Agent.
///
/// @nodoc
class AIAgentSummary {
  /// The Amazon Resource Name (ARN) of the AI agent.
  final String aiAgentArn;

  /// The identifier of the AI Agent.
  final String aiAgentId;

  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID or
  /// the ARN. URLs cannot contain the ARN.
  final String assistantId;

  /// The name of the AI Agent.
  final String name;

  /// The type of the AI Agent.
  final AIAgentType type;

  /// The visibility status of the AI Agent.
  final VisibilityStatus visibilityStatus;

  /// The configuration for the AI Agent.
  final AIAgentConfiguration? configuration;

  /// The description of the AI Agent.
  final String? description;

  /// The time the AI Agent was last modified.
  final DateTime? modifiedTime;

  /// The origin of the AI Agent. <code>SYSTEM</code> for a default AI Agent
  /// created by Q in Connect or <code>CUSTOMER</code> for an AI Agent created by
  /// calling AI Agent creation APIs.
  final Origin? origin;

  /// The status of the AI Agent.
  final Status? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AIAgentSummary({
    required this.aiAgentArn,
    required this.aiAgentId,
    required this.assistantArn,
    required this.assistantId,
    required this.name,
    required this.type,
    required this.visibilityStatus,
    this.configuration,
    this.description,
    this.modifiedTime,
    this.origin,
    this.status,
    this.tags,
  });

  factory AIAgentSummary.fromJson(Map<String, dynamic> json) {
    return AIAgentSummary(
      aiAgentArn: (json['aiAgentArn'] as String?) ?? '',
      aiAgentId: (json['aiAgentId'] as String?) ?? '',
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      type: AIAgentType.fromString((json['type'] as String?) ?? ''),
      visibilityStatus: VisibilityStatus.fromString(
          (json['visibilityStatus'] as String?) ?? ''),
      configuration: json['configuration'] != null
          ? AIAgentConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      modifiedTime: timeStampFromJson(json['modifiedTime']),
      origin: (json['origin'] as String?)?.let(Origin.fromString),
      status: (json['status'] as String?)?.let(Status.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgentArn = this.aiAgentArn;
    final aiAgentId = this.aiAgentId;
    final assistantArn = this.assistantArn;
    final assistantId = this.assistantId;
    final name = this.name;
    final type = this.type;
    final visibilityStatus = this.visibilityStatus;
    final configuration = this.configuration;
    final description = this.description;
    final modifiedTime = this.modifiedTime;
    final origin = this.origin;
    final status = this.status;
    final tags = this.tags;
    return {
      'aiAgentArn': aiAgentArn,
      'aiAgentId': aiAgentId,
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'name': name,
      'type': type.value,
      'visibilityStatus': visibilityStatus.value,
      if (configuration != null) 'configuration': configuration,
      if (description != null) 'description': description,
      if (modifiedTime != null)
        'modifiedTime': unixTimestampToJson(modifiedTime),
      if (origin != null) 'origin': origin.value,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A typed union that specifies the configuration based on the type of AI
/// Agent.
///
/// @nodoc
class AIAgentConfiguration {
  /// The configuration for AI Agents of type <code>ANSWER_RECOMMENDATION</code>.
  final AnswerRecommendationAIAgentConfiguration?
      answerRecommendationAIAgentConfiguration;

  /// The configuration for AI Agents of type <code>CASE_SUMMARIZATION</code>.
  final CaseSummarizationAIAgentConfiguration?
      caseSummarizationAIAgentConfiguration;

  /// Configuration for the EMAIL_GENERATIVE_ANSWER AI agent that provides
  /// comprehensive knowledge-based answers for customer queries.
  final EmailGenerativeAnswerAIAgentConfiguration?
      emailGenerativeAnswerAIAgentConfiguration;

  /// Configuration for the EMAIL_OVERVIEW AI agent that generates structured
  /// overview of email conversations.
  final EmailOverviewAIAgentConfiguration? emailOverviewAIAgentConfiguration;

  /// Configuration for the EMAIL_RESPONSE AI agent that generates professional
  /// email responses using knowledge base content.
  final EmailResponseAIAgentConfiguration? emailResponseAIAgentConfiguration;

  /// The configuration for AI Agents of type <code>MANUAL_SEARCH</code>.
  final ManualSearchAIAgentConfiguration? manualSearchAIAgentConfiguration;

  /// The configuration for AI Agents of type <code>NOTE_TAKING</code>.
  final NoteTakingAIAgentConfiguration? noteTakingAIAgentConfiguration;

  /// The configuration for AI Agents of type <code>ORCHESTRATION</code>.
  final OrchestrationAIAgentConfiguration? orchestrationAIAgentConfiguration;

  /// The configuration for AI Agents of type SELF_SERVICE.
  final SelfServiceAIAgentConfiguration? selfServiceAIAgentConfiguration;

  AIAgentConfiguration({
    this.answerRecommendationAIAgentConfiguration,
    this.caseSummarizationAIAgentConfiguration,
    this.emailGenerativeAnswerAIAgentConfiguration,
    this.emailOverviewAIAgentConfiguration,
    this.emailResponseAIAgentConfiguration,
    this.manualSearchAIAgentConfiguration,
    this.noteTakingAIAgentConfiguration,
    this.orchestrationAIAgentConfiguration,
    this.selfServiceAIAgentConfiguration,
  });

  factory AIAgentConfiguration.fromJson(Map<String, dynamic> json) {
    return AIAgentConfiguration(
      answerRecommendationAIAgentConfiguration:
          json['answerRecommendationAIAgentConfiguration'] != null
              ? AnswerRecommendationAIAgentConfiguration.fromJson(
                  json['answerRecommendationAIAgentConfiguration']
                      as Map<String, dynamic>)
              : null,
      caseSummarizationAIAgentConfiguration:
          json['caseSummarizationAIAgentConfiguration'] != null
              ? CaseSummarizationAIAgentConfiguration.fromJson(
                  json['caseSummarizationAIAgentConfiguration']
                      as Map<String, dynamic>)
              : null,
      emailGenerativeAnswerAIAgentConfiguration:
          json['emailGenerativeAnswerAIAgentConfiguration'] != null
              ? EmailGenerativeAnswerAIAgentConfiguration.fromJson(
                  json['emailGenerativeAnswerAIAgentConfiguration']
                      as Map<String, dynamic>)
              : null,
      emailOverviewAIAgentConfiguration:
          json['emailOverviewAIAgentConfiguration'] != null
              ? EmailOverviewAIAgentConfiguration.fromJson(
                  json['emailOverviewAIAgentConfiguration']
                      as Map<String, dynamic>)
              : null,
      emailResponseAIAgentConfiguration:
          json['emailResponseAIAgentConfiguration'] != null
              ? EmailResponseAIAgentConfiguration.fromJson(
                  json['emailResponseAIAgentConfiguration']
                      as Map<String, dynamic>)
              : null,
      manualSearchAIAgentConfiguration:
          json['manualSearchAIAgentConfiguration'] != null
              ? ManualSearchAIAgentConfiguration.fromJson(
                  json['manualSearchAIAgentConfiguration']
                      as Map<String, dynamic>)
              : null,
      noteTakingAIAgentConfiguration: json['noteTakingAIAgentConfiguration'] !=
              null
          ? NoteTakingAIAgentConfiguration.fromJson(
              json['noteTakingAIAgentConfiguration'] as Map<String, dynamic>)
          : null,
      orchestrationAIAgentConfiguration:
          json['orchestrationAIAgentConfiguration'] != null
              ? OrchestrationAIAgentConfiguration.fromJson(
                  json['orchestrationAIAgentConfiguration']
                      as Map<String, dynamic>)
              : null,
      selfServiceAIAgentConfiguration:
          json['selfServiceAIAgentConfiguration'] != null
              ? SelfServiceAIAgentConfiguration.fromJson(
                  json['selfServiceAIAgentConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final answerRecommendationAIAgentConfiguration =
        this.answerRecommendationAIAgentConfiguration;
    final caseSummarizationAIAgentConfiguration =
        this.caseSummarizationAIAgentConfiguration;
    final emailGenerativeAnswerAIAgentConfiguration =
        this.emailGenerativeAnswerAIAgentConfiguration;
    final emailOverviewAIAgentConfiguration =
        this.emailOverviewAIAgentConfiguration;
    final emailResponseAIAgentConfiguration =
        this.emailResponseAIAgentConfiguration;
    final manualSearchAIAgentConfiguration =
        this.manualSearchAIAgentConfiguration;
    final noteTakingAIAgentConfiguration = this.noteTakingAIAgentConfiguration;
    final orchestrationAIAgentConfiguration =
        this.orchestrationAIAgentConfiguration;
    final selfServiceAIAgentConfiguration =
        this.selfServiceAIAgentConfiguration;
    return {
      if (answerRecommendationAIAgentConfiguration != null)
        'answerRecommendationAIAgentConfiguration':
            answerRecommendationAIAgentConfiguration,
      if (caseSummarizationAIAgentConfiguration != null)
        'caseSummarizationAIAgentConfiguration':
            caseSummarizationAIAgentConfiguration,
      if (emailGenerativeAnswerAIAgentConfiguration != null)
        'emailGenerativeAnswerAIAgentConfiguration':
            emailGenerativeAnswerAIAgentConfiguration,
      if (emailOverviewAIAgentConfiguration != null)
        'emailOverviewAIAgentConfiguration': emailOverviewAIAgentConfiguration,
      if (emailResponseAIAgentConfiguration != null)
        'emailResponseAIAgentConfiguration': emailResponseAIAgentConfiguration,
      if (manualSearchAIAgentConfiguration != null)
        'manualSearchAIAgentConfiguration': manualSearchAIAgentConfiguration,
      if (noteTakingAIAgentConfiguration != null)
        'noteTakingAIAgentConfiguration': noteTakingAIAgentConfiguration,
      if (orchestrationAIAgentConfiguration != null)
        'orchestrationAIAgentConfiguration': orchestrationAIAgentConfiguration,
      if (selfServiceAIAgentConfiguration != null)
        'selfServiceAIAgentConfiguration': selfServiceAIAgentConfiguration,
    };
  }
}

/// The configuration for the <code>MANUAL_SEARCH</code> AI Agent type.
///
/// @nodoc
class ManualSearchAIAgentConfiguration {
  /// The AI Guardrail identifier for the Answer Generation guardrail used by the
  /// MANUAL_SEARCH AI Agent.
  final String? answerGenerationAIGuardrailId;

  /// The AI Prompt identifier for the Answer Generation prompt used by the
  /// MANUAL_SEARCH AI Agent.
  final String? answerGenerationAIPromptId;

  /// The association configurations for overriding behavior on this AI Agent.
  final List<AssociationConfiguration>? associationConfigurations;

  /// The locale to which specifies the language and region settings that
  /// determine the response language for <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_amazon-q-connect_QueryAssistant.html">QueryAssistant</a>.
  /// <note>
  /// For more information on supported locales, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/supported-languages.html#qic-notes-languages">Language
  /// support for Amazon Q in Connect</a>.
  /// </note>
  final String? locale;

  ManualSearchAIAgentConfiguration({
    this.answerGenerationAIGuardrailId,
    this.answerGenerationAIPromptId,
    this.associationConfigurations,
    this.locale,
  });

  factory ManualSearchAIAgentConfiguration.fromJson(Map<String, dynamic> json) {
    return ManualSearchAIAgentConfiguration(
      answerGenerationAIGuardrailId:
          json['answerGenerationAIGuardrailId'] as String?,
      answerGenerationAIPromptId: json['answerGenerationAIPromptId'] as String?,
      associationConfigurations: (json['associationConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              AssociationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      locale: json['locale'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answerGenerationAIGuardrailId = this.answerGenerationAIGuardrailId;
    final answerGenerationAIPromptId = this.answerGenerationAIPromptId;
    final associationConfigurations = this.associationConfigurations;
    final locale = this.locale;
    return {
      if (answerGenerationAIGuardrailId != null)
        'answerGenerationAIGuardrailId': answerGenerationAIGuardrailId,
      if (answerGenerationAIPromptId != null)
        'answerGenerationAIPromptId': answerGenerationAIPromptId,
      if (associationConfigurations != null)
        'associationConfigurations': associationConfigurations,
      if (locale != null) 'locale': locale,
    };
  }
}

/// The configuration for the <code>ANSWER_RECOMMENDATION</code> AI Agent type.
///
/// @nodoc
class AnswerRecommendationAIAgentConfiguration {
  /// The AI Guardrail identifier for the Answer Generation Guardrail used by the
  /// <code>ANSWER_RECOMMENDATION</code> AI Agent.
  final String? answerGenerationAIGuardrailId;

  /// The AI Prompt identifier for the Answer Generation prompt used by the
  /// <code>ANSWER_RECOMMENDATION</code> AI Agent.
  final String? answerGenerationAIPromptId;

  /// The association configurations for overriding behavior on this AI Agent.
  final List<AssociationConfiguration>? associationConfigurations;

  /// The AI Prompt identifier for the Intent Labeling prompt used by the
  /// <code>ANSWER_RECOMMENDATION</code> AI Agent.
  final String? intentLabelingGenerationAIPromptId;

  /// The locale to which specifies the language and region settings that
  /// determine the response language for <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_amazon-q-connect_QueryAssistant.html">QueryAssistant</a>.
  /// <note>
  /// For more information on supported locales, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/supported-languages.html#qic-notes-languages">Language
  /// support for Amazon Q in Connect</a>.
  /// </note>
  final String? locale;

  /// The AI Prompt identifier for the Query Reformulation prompt used by the
  /// <code>ANSWER_RECOMMENDATION</code> AI Agent.
  final String? queryReformulationAIPromptId;

  /// The suggested messages configuration for the Answer Recommendation AI Agent.
  final List<String>? suggestedMessages;

  AnswerRecommendationAIAgentConfiguration({
    this.answerGenerationAIGuardrailId,
    this.answerGenerationAIPromptId,
    this.associationConfigurations,
    this.intentLabelingGenerationAIPromptId,
    this.locale,
    this.queryReformulationAIPromptId,
    this.suggestedMessages,
  });

  factory AnswerRecommendationAIAgentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AnswerRecommendationAIAgentConfiguration(
      answerGenerationAIGuardrailId:
          json['answerGenerationAIGuardrailId'] as String?,
      answerGenerationAIPromptId: json['answerGenerationAIPromptId'] as String?,
      associationConfigurations: (json['associationConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              AssociationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      intentLabelingGenerationAIPromptId:
          json['intentLabelingGenerationAIPromptId'] as String?,
      locale: json['locale'] as String?,
      queryReformulationAIPromptId:
          json['queryReformulationAIPromptId'] as String?,
      suggestedMessages: (json['suggestedMessages'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final answerGenerationAIGuardrailId = this.answerGenerationAIGuardrailId;
    final answerGenerationAIPromptId = this.answerGenerationAIPromptId;
    final associationConfigurations = this.associationConfigurations;
    final intentLabelingGenerationAIPromptId =
        this.intentLabelingGenerationAIPromptId;
    final locale = this.locale;
    final queryReformulationAIPromptId = this.queryReformulationAIPromptId;
    final suggestedMessages = this.suggestedMessages;
    return {
      if (answerGenerationAIGuardrailId != null)
        'answerGenerationAIGuardrailId': answerGenerationAIGuardrailId,
      if (answerGenerationAIPromptId != null)
        'answerGenerationAIPromptId': answerGenerationAIPromptId,
      if (associationConfigurations != null)
        'associationConfigurations': associationConfigurations,
      if (intentLabelingGenerationAIPromptId != null)
        'intentLabelingGenerationAIPromptId':
            intentLabelingGenerationAIPromptId,
      if (locale != null) 'locale': locale,
      if (queryReformulationAIPromptId != null)
        'queryReformulationAIPromptId': queryReformulationAIPromptId,
      if (suggestedMessages != null) 'suggestedMessages': suggestedMessages,
    };
  }
}

/// The configuration for AI Agents of type SELF_SERVICE.
///
/// @nodoc
class SelfServiceAIAgentConfiguration {
  /// The association configurations for overriding behavior on this AI Agent.
  final List<AssociationConfiguration>? associationConfigurations;

  /// The AI Guardrail identifier used by the SELF_SERVICE AI Agent.
  final String? selfServiceAIGuardrailId;

  /// The AI Prompt identifier for the Self Service Answer Generation prompt used
  /// by the SELF_SERVICE AI Agent
  final String? selfServiceAnswerGenerationAIPromptId;

  /// The AI Prompt identifier for the Self Service Pre-Processing prompt used by
  /// the SELF_SERVICE AI Agent
  final String? selfServicePreProcessingAIPromptId;

  SelfServiceAIAgentConfiguration({
    this.associationConfigurations,
    this.selfServiceAIGuardrailId,
    this.selfServiceAnswerGenerationAIPromptId,
    this.selfServicePreProcessingAIPromptId,
  });

  factory SelfServiceAIAgentConfiguration.fromJson(Map<String, dynamic> json) {
    return SelfServiceAIAgentConfiguration(
      associationConfigurations: (json['associationConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              AssociationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      selfServiceAIGuardrailId: json['selfServiceAIGuardrailId'] as String?,
      selfServiceAnswerGenerationAIPromptId:
          json['selfServiceAnswerGenerationAIPromptId'] as String?,
      selfServicePreProcessingAIPromptId:
          json['selfServicePreProcessingAIPromptId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationConfigurations = this.associationConfigurations;
    final selfServiceAIGuardrailId = this.selfServiceAIGuardrailId;
    final selfServiceAnswerGenerationAIPromptId =
        this.selfServiceAnswerGenerationAIPromptId;
    final selfServicePreProcessingAIPromptId =
        this.selfServicePreProcessingAIPromptId;
    return {
      if (associationConfigurations != null)
        'associationConfigurations': associationConfigurations,
      if (selfServiceAIGuardrailId != null)
        'selfServiceAIGuardrailId': selfServiceAIGuardrailId,
      if (selfServiceAnswerGenerationAIPromptId != null)
        'selfServiceAnswerGenerationAIPromptId':
            selfServiceAnswerGenerationAIPromptId,
      if (selfServicePreProcessingAIPromptId != null)
        'selfServicePreProcessingAIPromptId':
            selfServicePreProcessingAIPromptId,
    };
  }
}

/// Configuration settings for the EMAIL_RESPONSE AI agent including prompts,
/// locale, and knowledge base associations.
///
/// @nodoc
class EmailResponseAIAgentConfiguration {
  /// Configuration settings for knowledge base associations used by the email
  /// response agent.
  final List<AssociationConfiguration>? associationConfigurations;

  /// The ID of the System AI prompt used for reformulating email queries to
  /// optimize knowledge base search for response generation.
  final String? emailQueryReformulationAIPromptId;

  /// The ID of the System AI prompt used for generating professional email
  /// responses based on knowledge base content.
  final String? emailResponseAIPromptId;

  /// The locale setting for language-specific email response generation (for
  /// example, en_US, es_ES).
  final String? locale;

  EmailResponseAIAgentConfiguration({
    this.associationConfigurations,
    this.emailQueryReformulationAIPromptId,
    this.emailResponseAIPromptId,
    this.locale,
  });

  factory EmailResponseAIAgentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return EmailResponseAIAgentConfiguration(
      associationConfigurations: (json['associationConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              AssociationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      emailQueryReformulationAIPromptId:
          json['emailQueryReformulationAIPromptId'] as String?,
      emailResponseAIPromptId: json['emailResponseAIPromptId'] as String?,
      locale: json['locale'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationConfigurations = this.associationConfigurations;
    final emailQueryReformulationAIPromptId =
        this.emailQueryReformulationAIPromptId;
    final emailResponseAIPromptId = this.emailResponseAIPromptId;
    final locale = this.locale;
    return {
      if (associationConfigurations != null)
        'associationConfigurations': associationConfigurations,
      if (emailQueryReformulationAIPromptId != null)
        'emailQueryReformulationAIPromptId': emailQueryReformulationAIPromptId,
      if (emailResponseAIPromptId != null)
        'emailResponseAIPromptId': emailResponseAIPromptId,
      if (locale != null) 'locale': locale,
    };
  }
}

/// Configuration settings for the EMAIL_OVERVIEW AI agent including prompt ID
/// and locale settings.
///
/// @nodoc
class EmailOverviewAIAgentConfiguration {
  /// The ID of the System AI prompt used for generating structured email
  /// conversation summaries.
  final String? emailOverviewAIPromptId;

  /// The locale setting for language-specific email overview processing (for
  /// example, en_US, es_ES).
  final String? locale;

  EmailOverviewAIAgentConfiguration({
    this.emailOverviewAIPromptId,
    this.locale,
  });

  factory EmailOverviewAIAgentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return EmailOverviewAIAgentConfiguration(
      emailOverviewAIPromptId: json['emailOverviewAIPromptId'] as String?,
      locale: json['locale'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailOverviewAIPromptId = this.emailOverviewAIPromptId;
    final locale = this.locale;
    return {
      if (emailOverviewAIPromptId != null)
        'emailOverviewAIPromptId': emailOverviewAIPromptId,
      if (locale != null) 'locale': locale,
    };
  }
}

/// Configuration settings for the EMAIL_GENERATIVE_ANSWER AI agent including
/// prompts, locale, and knowledge base associations.
///
/// @nodoc
class EmailGenerativeAnswerAIAgentConfiguration {
  /// Configuration settings for knowledge base associations used by the email
  /// generative answer agent.
  final List<AssociationConfiguration>? associationConfigurations;

  /// The ID of the System AI prompt used for generating comprehensive
  /// knowledge-based answers from email queries.
  final String? emailGenerativeAnswerAIPromptId;

  /// The ID of the System AI prompt used for reformulating email queries to
  /// optimize knowledge base search results.
  final String? emailQueryReformulationAIPromptId;

  /// The locale setting for language-specific email processing and response
  /// generation (for example, en_US, es_ES).
  final String? locale;

  EmailGenerativeAnswerAIAgentConfiguration({
    this.associationConfigurations,
    this.emailGenerativeAnswerAIPromptId,
    this.emailQueryReformulationAIPromptId,
    this.locale,
  });

  factory EmailGenerativeAnswerAIAgentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return EmailGenerativeAnswerAIAgentConfiguration(
      associationConfigurations: (json['associationConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              AssociationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      emailGenerativeAnswerAIPromptId:
          json['emailGenerativeAnswerAIPromptId'] as String?,
      emailQueryReformulationAIPromptId:
          json['emailQueryReformulationAIPromptId'] as String?,
      locale: json['locale'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationConfigurations = this.associationConfigurations;
    final emailGenerativeAnswerAIPromptId =
        this.emailGenerativeAnswerAIPromptId;
    final emailQueryReformulationAIPromptId =
        this.emailQueryReformulationAIPromptId;
    final locale = this.locale;
    return {
      if (associationConfigurations != null)
        'associationConfigurations': associationConfigurations,
      if (emailGenerativeAnswerAIPromptId != null)
        'emailGenerativeAnswerAIPromptId': emailGenerativeAnswerAIPromptId,
      if (emailQueryReformulationAIPromptId != null)
        'emailQueryReformulationAIPromptId': emailQueryReformulationAIPromptId,
      if (locale != null) 'locale': locale,
    };
  }
}

/// The configuration for AI Agents of type <code>ORCHESTRATION</code>.
///
/// @nodoc
class OrchestrationAIAgentConfiguration {
  /// The AI Prompt identifier used by the Orchestration AI Agent.
  final String orchestrationAIPromptId;

  /// The Amazon Resource Name (ARN) of the Amazon Connect instance used by the
  /// Orchestration AI Agent.
  final String? connectInstanceArn;

  /// The locale setting for the Orchestration AI Agent.
  final String? locale;

  /// The AI Guardrail identifier used by the Orchestration AI Agent.
  final String? orchestrationAIGuardrailId;

  /// The tool configurations used by the Orchestration AI Agent.
  final List<ToolConfiguration>? toolConfigurations;

  OrchestrationAIAgentConfiguration({
    required this.orchestrationAIPromptId,
    this.connectInstanceArn,
    this.locale,
    this.orchestrationAIGuardrailId,
    this.toolConfigurations,
  });

  factory OrchestrationAIAgentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return OrchestrationAIAgentConfiguration(
      orchestrationAIPromptId:
          (json['orchestrationAIPromptId'] as String?) ?? '',
      connectInstanceArn: json['connectInstanceArn'] as String?,
      locale: json['locale'] as String?,
      orchestrationAIGuardrailId: json['orchestrationAIGuardrailId'] as String?,
      toolConfigurations: (json['toolConfigurations'] as List?)
          ?.nonNulls
          .map((e) => ToolConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final orchestrationAIPromptId = this.orchestrationAIPromptId;
    final connectInstanceArn = this.connectInstanceArn;
    final locale = this.locale;
    final orchestrationAIGuardrailId = this.orchestrationAIGuardrailId;
    final toolConfigurations = this.toolConfigurations;
    return {
      'orchestrationAIPromptId': orchestrationAIPromptId,
      if (connectInstanceArn != null) 'connectInstanceArn': connectInstanceArn,
      if (locale != null) 'locale': locale,
      if (orchestrationAIGuardrailId != null)
        'orchestrationAIGuardrailId': orchestrationAIGuardrailId,
      if (toolConfigurations != null) 'toolConfigurations': toolConfigurations,
    };
  }
}

/// The configuration for AI Agents of type <code>NOTE_TAKING</code>.
///
/// @nodoc
class NoteTakingAIAgentConfiguration {
  /// The locale setting for language-specific case summarization generation (for
  /// example, en_US, es_ES).
  final String? locale;

  /// The AI Guardrail identifier used by the Note Taking AI Agent.
  final String? noteTakingAIGuardrailId;

  /// The AI Prompt identifier used by the Note Taking AI Agent.
  final String? noteTakingAIPromptId;

  NoteTakingAIAgentConfiguration({
    this.locale,
    this.noteTakingAIGuardrailId,
    this.noteTakingAIPromptId,
  });

  factory NoteTakingAIAgentConfiguration.fromJson(Map<String, dynamic> json) {
    return NoteTakingAIAgentConfiguration(
      locale: json['locale'] as String?,
      noteTakingAIGuardrailId: json['noteTakingAIGuardrailId'] as String?,
      noteTakingAIPromptId: json['noteTakingAIPromptId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final locale = this.locale;
    final noteTakingAIGuardrailId = this.noteTakingAIGuardrailId;
    final noteTakingAIPromptId = this.noteTakingAIPromptId;
    return {
      if (locale != null) 'locale': locale,
      if (noteTakingAIGuardrailId != null)
        'noteTakingAIGuardrailId': noteTakingAIGuardrailId,
      if (noteTakingAIPromptId != null)
        'noteTakingAIPromptId': noteTakingAIPromptId,
    };
  }
}

/// The configuration for AI Agents of type <code>CASE_SUMMARIZATION</code>.
///
/// @nodoc
class CaseSummarizationAIAgentConfiguration {
  /// The AI Guardrail identifier used by the Case Summarization AI Agent.
  final String? caseSummarizationAIGuardrailId;

  /// The AI Prompt identifier used by the Case Summarization AI Agent.
  final String? caseSummarizationAIPromptId;

  /// The locale setting for the Case Summarization AI Agent.
  final String? locale;

  CaseSummarizationAIAgentConfiguration({
    this.caseSummarizationAIGuardrailId,
    this.caseSummarizationAIPromptId,
    this.locale,
  });

  factory CaseSummarizationAIAgentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CaseSummarizationAIAgentConfiguration(
      caseSummarizationAIGuardrailId:
          json['caseSummarizationAIGuardrailId'] as String?,
      caseSummarizationAIPromptId:
          json['caseSummarizationAIPromptId'] as String?,
      locale: json['locale'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final caseSummarizationAIGuardrailId = this.caseSummarizationAIGuardrailId;
    final caseSummarizationAIPromptId = this.caseSummarizationAIPromptId;
    final locale = this.locale;
    return {
      if (caseSummarizationAIGuardrailId != null)
        'caseSummarizationAIGuardrailId': caseSummarizationAIGuardrailId,
      if (caseSummarizationAIPromptId != null)
        'caseSummarizationAIPromptId': caseSummarizationAIPromptId,
      if (locale != null) 'locale': locale,
    };
  }
}

/// Configuration settings for a tool used by AI Agents.
///
/// @nodoc
class ToolConfiguration {
  /// The name of the tool.
  final String toolName;

  /// The type of the tool.
  final ToolType toolType;

  /// Annotations for the tool configuration.
  final Annotation? annotations;

  /// The description of the tool configuration.
  final String? description;

  /// The input schema for the tool configuration.
  final Object? inputSchema;

  /// Instructions for using the tool.
  final ToolInstruction? instruction;

  /// Output filters applies to the tool result.
  final List<ToolOutputFilter>? outputFilters;

  /// The output schema for the tool configuration.
  final Object? outputSchema;

  /// Override input values for the tool configuration.
  final List<ToolOverrideInputValue>? overrideInputValues;

  /// The title of the tool configuration.
  final String? title;

  /// The identifier of the tool, for example toolName from Model Context Provider
  /// server.
  final String? toolId;

  /// Configuration for user interaction with the tool.
  final UserInteractionConfiguration? userInteractionConfiguration;

  ToolConfiguration({
    required this.toolName,
    required this.toolType,
    this.annotations,
    this.description,
    this.inputSchema,
    this.instruction,
    this.outputFilters,
    this.outputSchema,
    this.overrideInputValues,
    this.title,
    this.toolId,
    this.userInteractionConfiguration,
  });

  factory ToolConfiguration.fromJson(Map<String, dynamic> json) {
    return ToolConfiguration(
      toolName: (json['toolName'] as String?) ?? '',
      toolType: ToolType.fromString((json['toolType'] as String?) ?? ''),
      annotations: json['annotations'] != null
          ? Annotation.fromJson(json['annotations'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      inputSchema: json['inputSchema'],
      instruction: json['instruction'] != null
          ? ToolInstruction.fromJson(
              json['instruction'] as Map<String, dynamic>)
          : null,
      outputFilters: (json['outputFilters'] as List?)
          ?.nonNulls
          .map((e) => ToolOutputFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputSchema: json['outputSchema'],
      overrideInputValues: (json['overrideInputValues'] as List?)
          ?.nonNulls
          .map(
              (e) => ToolOverrideInputValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      toolId: json['toolId'] as String?,
      userInteractionConfiguration: json['userInteractionConfiguration'] != null
          ? UserInteractionConfiguration.fromJson(
              json['userInteractionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final toolName = this.toolName;
    final toolType = this.toolType;
    final annotations = this.annotations;
    final description = this.description;
    final inputSchema = this.inputSchema;
    final instruction = this.instruction;
    final outputFilters = this.outputFilters;
    final outputSchema = this.outputSchema;
    final overrideInputValues = this.overrideInputValues;
    final title = this.title;
    final toolId = this.toolId;
    final userInteractionConfiguration = this.userInteractionConfiguration;
    return {
      'toolName': toolName,
      'toolType': toolType.value,
      if (annotations != null) 'annotations': annotations,
      if (description != null) 'description': description,
      if (inputSchema != null) 'inputSchema': inputSchema,
      if (instruction != null) 'instruction': instruction,
      if (outputFilters != null) 'outputFilters': outputFilters,
      if (outputSchema != null) 'outputSchema': outputSchema,
      if (overrideInputValues != null)
        'overrideInputValues': overrideInputValues,
      if (title != null) 'title': title,
      if (toolId != null) 'toolId': toolId,
      if (userInteractionConfiguration != null)
        'userInteractionConfiguration': userInteractionConfiguration,
    };
  }
}

/// @nodoc
class ToolType {
  static const modelContextProtocol = ToolType._('MODEL_CONTEXT_PROTOCOL');
  static const returnToControl = ToolType._('RETURN_TO_CONTROL');
  static const constant = ToolType._('CONSTANT');

  final String value;

  const ToolType._(this.value);

  static const values = [modelContextProtocol, returnToControl, constant];

  static ToolType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ToolType._(value));

  @override
  bool operator ==(other) => other is ToolType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Instructions for using a tool.
///
/// @nodoc
class ToolInstruction {
  /// Examples for using the tool.
  final List<String>? examples;

  /// The instruction text for the tool.
  final String? instruction;

  ToolInstruction({
    this.examples,
    this.instruction,
  });

  factory ToolInstruction.fromJson(Map<String, dynamic> json) {
    return ToolInstruction(
      examples: (json['examples'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      instruction: json['instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final examples = this.examples;
    final instruction = this.instruction;
    return {
      if (examples != null) 'examples': examples,
      if (instruction != null) 'instruction': instruction,
    };
  }
}

/// An annotation that provides additional context or metadata.
///
/// @nodoc
class Annotation {
  /// A hint indicating that the annotation contains potentially destructive
  /// content.
  final bool? destructiveHint;

  /// The title of the annotation.
  final String? title;

  Annotation({
    this.destructiveHint,
    this.title,
  });

  factory Annotation.fromJson(Map<String, dynamic> json) {
    return Annotation(
      destructiveHint: json['destructiveHint'] as bool?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destructiveHint = this.destructiveHint;
    final title = this.title;
    return {
      if (destructiveHint != null) 'destructiveHint': destructiveHint,
      if (title != null) 'title': title,
    };
  }
}

/// Configuration for user interaction settings.
///
/// @nodoc
class UserInteractionConfiguration {
  /// Indicates whether user confirmation is required for the interaction.
  final bool? isUserConfirmationRequired;

  UserInteractionConfiguration({
    this.isUserConfirmationRequired,
  });

  factory UserInteractionConfiguration.fromJson(Map<String, dynamic> json) {
    return UserInteractionConfiguration(
      isUserConfirmationRequired: json['isUserConfirmationRequired'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final isUserConfirmationRequired = this.isUserConfirmationRequired;
    return {
      if (isUserConfirmationRequired != null)
        'isUserConfirmationRequired': isUserConfirmationRequired,
    };
  }
}

/// Filter configuration for tool output.
///
/// @nodoc
class ToolOutputFilter {
  /// The JSON path for filtering tool output.
  final String jsonPath;

  /// The output configuration for the filter.
  final ToolOutputConfiguration? outputConfiguration;

  ToolOutputFilter({
    required this.jsonPath,
    this.outputConfiguration,
  });

  factory ToolOutputFilter.fromJson(Map<String, dynamic> json) {
    return ToolOutputFilter(
      jsonPath: (json['jsonPath'] as String?) ?? '',
      outputConfiguration: json['outputConfiguration'] != null
          ? ToolOutputConfiguration.fromJson(
              json['outputConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jsonPath = this.jsonPath;
    final outputConfiguration = this.outputConfiguration;
    return {
      'jsonPath': jsonPath,
      if (outputConfiguration != null)
        'outputConfiguration': outputConfiguration,
    };
  }
}

/// Configuration for tool output handling.
///
/// @nodoc
class ToolOutputConfiguration {
  /// Override the tool output results to different variable name.
  final String? outputVariableNameOverride;

  /// The session data namespace for tool output.
  final String? sessionDataNamespace;

  ToolOutputConfiguration({
    this.outputVariableNameOverride,
    this.sessionDataNamespace,
  });

  factory ToolOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return ToolOutputConfiguration(
      outputVariableNameOverride: json['outputVariableNameOverride'] as String?,
      sessionDataNamespace: json['sessionDataNamespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputVariableNameOverride = this.outputVariableNameOverride;
    final sessionDataNamespace = this.sessionDataNamespace;
    return {
      if (outputVariableNameOverride != null)
        'outputVariableNameOverride': outputVariableNameOverride,
      if (sessionDataNamespace != null)
        'sessionDataNamespace': sessionDataNamespace,
    };
  }
}

/// An input value override for tools.
///
/// @nodoc
class ToolOverrideInputValue {
  /// The JSON path for the input value override.
  final String jsonPath;

  /// The override input value.
  final ToolOverrideInputValueConfiguration value;

  ToolOverrideInputValue({
    required this.jsonPath,
    required this.value,
  });

  factory ToolOverrideInputValue.fromJson(Map<String, dynamic> json) {
    return ToolOverrideInputValue(
      jsonPath: (json['jsonPath'] as String?) ?? '',
      value: ToolOverrideInputValueConfiguration.fromJson(
          (json['value'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final jsonPath = this.jsonPath;
    final value = this.value;
    return {
      'jsonPath': jsonPath,
      'value': value,
    };
  }
}

/// Configuration for overriding tool input values.
///
/// @nodoc
class ToolOverrideInputValueConfiguration {
  /// Constant input value configuration for tool override.
  final ToolOverrideConstantInputValue? constant;

  ToolOverrideInputValueConfiguration({
    this.constant,
  });

  factory ToolOverrideInputValueConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ToolOverrideInputValueConfiguration(
      constant: json['constant'] != null
          ? ToolOverrideConstantInputValue.fromJson(
              json['constant'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final constant = this.constant;
    return {
      if (constant != null) 'constant': constant,
    };
  }
}

/// A constant input value for tool override.
///
/// @nodoc
class ToolOverrideConstantInputValue {
  /// Override tool input value with constant values
  final ToolOverrideInputValueType type;

  /// The constant input override value.
  final String value;

  ToolOverrideConstantInputValue({
    required this.type,
    required this.value,
  });

  factory ToolOverrideConstantInputValue.fromJson(Map<String, dynamic> json) {
    return ToolOverrideConstantInputValue(
      type: ToolOverrideInputValueType.fromString(
          (json['type'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.value,
      'value': value,
    };
  }
}

/// @nodoc
class ToolOverrideInputValueType {
  static const string = ToolOverrideInputValueType._('STRING');
  static const number = ToolOverrideInputValueType._('NUMBER');
  static const jsonString = ToolOverrideInputValueType._('JSON_STRING');

  final String value;

  const ToolOverrideInputValueType._(this.value);

  static const values = [string, number, jsonString];

  static ToolOverrideInputValueType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ToolOverrideInputValueType._(value));

  @override
  bool operator ==(other) =>
      other is ToolOverrideInputValueType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration for an Amazon Q in Connect Assistant Association.
///
/// @nodoc
class AssociationConfiguration {
  /// The data of the configuration for an Amazon Q in Connect Assistant
  /// Association.
  final AssociationConfigurationData? associationConfigurationData;

  /// The identifier of the association for this Association Configuration.
  final String? associationId;

  /// The type of the association for this Association Configuration.
  final AIAgentAssociationConfigurationType? associationType;

  AssociationConfiguration({
    this.associationConfigurationData,
    this.associationId,
    this.associationType,
  });

  factory AssociationConfiguration.fromJson(Map<String, dynamic> json) {
    return AssociationConfiguration(
      associationConfigurationData: json['associationConfigurationData'] != null
          ? AssociationConfigurationData.fromJson(
              json['associationConfigurationData'] as Map<String, dynamic>)
          : null,
      associationId: json['associationId'] as String?,
      associationType: (json['associationType'] as String?)
          ?.let(AIAgentAssociationConfigurationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final associationConfigurationData = this.associationConfigurationData;
    final associationId = this.associationId;
    final associationType = this.associationType;
    return {
      if (associationConfigurationData != null)
        'associationConfigurationData': associationConfigurationData,
      if (associationId != null) 'associationId': associationId,
      if (associationType != null) 'associationType': associationType.value,
    };
  }
}

/// @nodoc
class AIAgentAssociationConfigurationType {
  static const knowledgeBase =
      AIAgentAssociationConfigurationType._('KNOWLEDGE_BASE');

  final String value;

  const AIAgentAssociationConfigurationType._(this.value);

  static const values = [knowledgeBase];

  static AIAgentAssociationConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AIAgentAssociationConfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is AIAgentAssociationConfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A typed union of the data of the configuration for an Amazon Q in Connect
/// Assistant Association.
///
/// @nodoc
class AssociationConfigurationData {
  /// The data of the configuration for a <code>KNOWLEDGE_BASE</code> type Amazon
  /// Q in Connect Assistant Association.
  final KnowledgeBaseAssociationConfigurationData?
      knowledgeBaseAssociationConfigurationData;

  AssociationConfigurationData({
    this.knowledgeBaseAssociationConfigurationData,
  });

  factory AssociationConfigurationData.fromJson(Map<String, dynamic> json) {
    return AssociationConfigurationData(
      knowledgeBaseAssociationConfigurationData:
          json['knowledgeBaseAssociationConfigurationData'] != null
              ? KnowledgeBaseAssociationConfigurationData.fromJson(
                  json['knowledgeBaseAssociationConfigurationData']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseAssociationConfigurationData =
        this.knowledgeBaseAssociationConfigurationData;
    return {
      if (knowledgeBaseAssociationConfigurationData != null)
        'knowledgeBaseAssociationConfigurationData':
            knowledgeBaseAssociationConfigurationData,
    };
  }
}

/// The data of the configuration for a <code>KNOWLEDGE_BASE</code> type Amazon
/// Q in Connect Assistant Association.
///
/// @nodoc
class KnowledgeBaseAssociationConfigurationData {
  final TagFilter? contentTagFilter;

  /// The maximum number of results to return per page.
  final int? maxResults;

  /// The search type to be used against the Knowledge Base for this request. The
  /// values can be <code>SEMANTIC</code> which uses vector embeddings or
  /// <code>HYBRID</code> which use vector embeddings and raw text
  final KnowledgeBaseSearchType? overrideKnowledgeBaseSearchType;

  KnowledgeBaseAssociationConfigurationData({
    this.contentTagFilter,
    this.maxResults,
    this.overrideKnowledgeBaseSearchType,
  });

  factory KnowledgeBaseAssociationConfigurationData.fromJson(
      Map<String, dynamic> json) {
    return KnowledgeBaseAssociationConfigurationData(
      contentTagFilter: json['contentTagFilter'] != null
          ? TagFilter.fromJson(json['contentTagFilter'] as Map<String, dynamic>)
          : null,
      maxResults: json['maxResults'] as int?,
      overrideKnowledgeBaseSearchType:
          (json['overrideKnowledgeBaseSearchType'] as String?)
              ?.let(KnowledgeBaseSearchType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final contentTagFilter = this.contentTagFilter;
    final maxResults = this.maxResults;
    final overrideKnowledgeBaseSearchType =
        this.overrideKnowledgeBaseSearchType;
    return {
      if (contentTagFilter != null) 'contentTagFilter': contentTagFilter,
      if (maxResults != null) 'maxResults': maxResults,
      if (overrideKnowledgeBaseSearchType != null)
        'overrideKnowledgeBaseSearchType':
            overrideKnowledgeBaseSearchType.value,
    };
  }
}

/// @nodoc
class KnowledgeBaseSearchType {
  static const hybrid = KnowledgeBaseSearchType._('HYBRID');
  static const semantic = KnowledgeBaseSearchType._('SEMANTIC');

  final String value;

  const KnowledgeBaseSearchType._(this.value);

  static const values = [hybrid, semantic];

  static KnowledgeBaseSearchType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KnowledgeBaseSearchType._(value));

  @override
  bool operator ==(other) =>
      other is KnowledgeBaseSearchType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The data for the AI Agent.
///
/// @nodoc
class AIAgentData {
  /// The Amazon Resource Name (ARN) of the AI agent.
  final String aiAgentArn;

  /// The identifier of the AI Agent.
  final String aiAgentId;

  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The identifier of the Amazon Q in Connect assistant. Can be either the ID or
  /// the ARN. URLs cannot contain the ARN.
  final String assistantId;

  /// Configuration for the AI Agent.
  final AIAgentConfiguration configuration;

  /// The name of the AI Agent.
  final String name;

  /// The type of the AI Agent.
  final AIAgentType type;

  /// The visibility status of the AI Agent.
  final VisibilityStatus visibilityStatus;

  /// The description of the AI Agent.
  final String? description;

  /// The time the AI Agent was last modified.
  final DateTime? modifiedTime;

  /// Specifies the origin of the AI Agent. <code>SYSTEM</code> for a default AI
  /// Agent created by Q in Connect or <code>CUSTOMER</code> for an AI Agent
  /// created by calling AI Agent creation APIs.
  final Origin? origin;

  /// The status of the AI Agent.
  final Status? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AIAgentData({
    required this.aiAgentArn,
    required this.aiAgentId,
    required this.assistantArn,
    required this.assistantId,
    required this.configuration,
    required this.name,
    required this.type,
    required this.visibilityStatus,
    this.description,
    this.modifiedTime,
    this.origin,
    this.status,
    this.tags,
  });

  factory AIAgentData.fromJson(Map<String, dynamic> json) {
    return AIAgentData(
      aiAgentArn: (json['aiAgentArn'] as String?) ?? '',
      aiAgentId: (json['aiAgentId'] as String?) ?? '',
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      configuration: AIAgentConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      type: AIAgentType.fromString((json['type'] as String?) ?? ''),
      visibilityStatus: VisibilityStatus.fromString(
          (json['visibilityStatus'] as String?) ?? ''),
      description: json['description'] as String?,
      modifiedTime: timeStampFromJson(json['modifiedTime']),
      origin: (json['origin'] as String?)?.let(Origin.fromString),
      status: (json['status'] as String?)?.let(Status.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgentArn = this.aiAgentArn;
    final aiAgentId = this.aiAgentId;
    final assistantArn = this.assistantArn;
    final assistantId = this.assistantId;
    final configuration = this.configuration;
    final name = this.name;
    final type = this.type;
    final visibilityStatus = this.visibilityStatus;
    final description = this.description;
    final modifiedTime = this.modifiedTime;
    final origin = this.origin;
    final status = this.status;
    final tags = this.tags;
    return {
      'aiAgentArn': aiAgentArn,
      'aiAgentId': aiAgentId,
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'configuration': configuration,
      'name': name,
      'type': type.value,
      'visibilityStatus': visibilityStatus.value,
      if (description != null) 'description': description,
      if (modifiedTime != null)
        'modifiedTime': unixTimestampToJson(modifiedTime),
      if (origin != null) 'origin': origin.value,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The assistant data.
///
/// @nodoc
class AssistantData {
  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The identifier of the Amazon Q in Connect assistant.
  final String assistantId;

  /// The name.
  final String name;

  /// The status of the assistant.
  final AssistantStatus status;

  /// The type of assistant.
  final AssistantType type;

  /// The configuration of the AI Agents (mapped by AI Agent Type to AI Agent
  /// version) that is set on the Amazon Q in Connect Assistant.
  final Map<AIAgentType, AIAgentConfigurationData>? aiAgentConfiguration;

  /// The configuration information for the Amazon Q in Connect assistant
  /// capability.
  final AssistantCapabilityConfiguration? capabilityConfiguration;

  /// The description.
  final String? description;

  /// The configuration information for the Amazon Q in Connect assistant
  /// integration.
  final AssistantIntegrationConfiguration? integrationConfiguration;

  /// The list of orchestrator configurations for the assistant.
  final List<OrchestratorConfigurationEntry>? orchestratorConfigurationList;

  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// This KMS key must have a policy that allows <code>kms:CreateGrant</code>,
  /// <code>kms:DescribeKey</code>, <code>kms:Decrypt</code>, and
  /// <code>kms:GenerateDataKey*</code> permissions to the IAM identity using the
  /// key to invoke Amazon Q in Connect. To use Amazon Q in Connect with chat, the
  /// key policy must also allow <code>kms:Decrypt</code>,
  /// <code>kms:GenerateDataKey*</code>, and <code>kms:DescribeKey</code>
  /// permissions to the <code>connect.amazonaws.com</code> service principal.
  ///
  /// For more information about setting up a customer managed key for Amazon Q in
  /// Connect, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-q.html">Enable
  /// Amazon Q in Connect for your instance</a>.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AssistantData({
    required this.assistantArn,
    required this.assistantId,
    required this.name,
    required this.status,
    required this.type,
    this.aiAgentConfiguration,
    this.capabilityConfiguration,
    this.description,
    this.integrationConfiguration,
    this.orchestratorConfigurationList,
    this.serverSideEncryptionConfiguration,
    this.tags,
  });

  factory AssistantData.fromJson(Map<String, dynamic> json) {
    return AssistantData(
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: AssistantStatus.fromString((json['status'] as String?) ?? ''),
      type: AssistantType.fromString((json['type'] as String?) ?? ''),
      aiAgentConfiguration: (json['aiAgentConfiguration']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(AIAgentType.fromString(k),
              AIAgentConfigurationData.fromJson(e as Map<String, dynamic>))),
      capabilityConfiguration: json['capabilityConfiguration'] != null
          ? AssistantCapabilityConfiguration.fromJson(
              json['capabilityConfiguration'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      integrationConfiguration: json['integrationConfiguration'] != null
          ? AssistantIntegrationConfiguration.fromJson(
              json['integrationConfiguration'] as Map<String, dynamic>)
          : null,
      orchestratorConfigurationList:
          (json['orchestratorConfigurationList'] as List?)
              ?.nonNulls
              .map((e) => OrchestratorConfigurationEntry.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      serverSideEncryptionConfiguration:
          json['serverSideEncryptionConfiguration'] != null
              ? ServerSideEncryptionConfiguration.fromJson(
                  json['serverSideEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final assistantArn = this.assistantArn;
    final assistantId = this.assistantId;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final aiAgentConfiguration = this.aiAgentConfiguration;
    final capabilityConfiguration = this.capabilityConfiguration;
    final description = this.description;
    final integrationConfiguration = this.integrationConfiguration;
    final orchestratorConfigurationList = this.orchestratorConfigurationList;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final tags = this.tags;
    return {
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'name': name,
      'status': status.value,
      'type': type.value,
      if (aiAgentConfiguration != null)
        'aiAgentConfiguration':
            aiAgentConfiguration.map((k, e) => MapEntry(k.value, e)),
      if (capabilityConfiguration != null)
        'capabilityConfiguration': capabilityConfiguration,
      if (description != null) 'description': description,
      if (integrationConfiguration != null)
        'integrationConfiguration': integrationConfiguration,
      if (orchestratorConfigurationList != null)
        'orchestratorConfigurationList': orchestratorConfigurationList,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class AssistantType {
  static const agent = AssistantType._('AGENT');

  final String value;

  const AssistantType._(this.value);

  static const values = [agent];

  static AssistantType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssistantType._(value));

  @override
  bool operator ==(other) => other is AssistantType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AssistantStatus {
  static const createInProgress = AssistantStatus._('CREATE_IN_PROGRESS');
  static const createFailed = AssistantStatus._('CREATE_FAILED');
  static const active = AssistantStatus._('ACTIVE');
  static const deleteInProgress = AssistantStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = AssistantStatus._('DELETE_FAILED');
  static const deleted = AssistantStatus._('DELETED');

  final String value;

  const AssistantStatus._(this.value);

  static const values = [
    createInProgress,
    createFailed,
    active,
    deleteInProgress,
    deleteFailed,
    deleted
  ];

  static AssistantStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssistantStatus._(value));

  @override
  bool operator ==(other) => other is AssistantStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration information for the Amazon Q in Connect assistant
/// integration.
///
/// @nodoc
class AssistantIntegrationConfiguration {
  /// The Amazon Resource Name (ARN) of the integrated Amazon SNS topic used for
  /// streaming chat messages.
  final String? topicIntegrationArn;

  AssistantIntegrationConfiguration({
    this.topicIntegrationArn,
  });

  factory AssistantIntegrationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AssistantIntegrationConfiguration(
      topicIntegrationArn: json['topicIntegrationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final topicIntegrationArn = this.topicIntegrationArn;
    return {
      if (topicIntegrationArn != null)
        'topicIntegrationArn': topicIntegrationArn,
    };
  }
}

/// The capability configuration for an Amazon Q in Connect assistant.
///
/// @nodoc
class AssistantCapabilityConfiguration {
  /// The type of Amazon Q in Connect assistant capability.
  final AssistantCapabilityType? type;

  AssistantCapabilityConfiguration({
    this.type,
  });

  factory AssistantCapabilityConfiguration.fromJson(Map<String, dynamic> json) {
    return AssistantCapabilityConfiguration(
      type: (json['type'] as String?)?.let(AssistantCapabilityType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class AssistantCapabilityType {
  static const v1 = AssistantCapabilityType._('V1');
  static const v2 = AssistantCapabilityType._('V2');

  final String value;

  const AssistantCapabilityType._(this.value);

  static const values = [v1, v2];

  static AssistantCapabilityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssistantCapabilityType._(value));

  @override
  bool operator ==(other) =>
      other is AssistantCapabilityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about the session.
///
/// @nodoc
class SessionSummary {
  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The identifier of the Amazon Q in Connect assistant.
  final String assistantId;

  /// The Amazon Resource Name (ARN) of the session.
  final String sessionArn;

  /// The identifier of the session.
  final String sessionId;

  SessionSummary({
    required this.assistantArn,
    required this.assistantId,
    required this.sessionArn,
    required this.sessionId,
  });

  factory SessionSummary.fromJson(Map<String, dynamic> json) {
    return SessionSummary(
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      sessionArn: (json['sessionArn'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final assistantArn = this.assistantArn;
    final assistantId = this.assistantId;
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    return {
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'sessionArn': sessionArn,
      'sessionId': sessionId,
    };
  }
}

/// A single result from a content retrieval operation.
///
/// @nodoc
class RetrieveResult {
  /// The identifier of the assistant association for the retrieved result.
  final String associationId;

  /// The text content of the retrieved result.
  final String contentText;

  /// A type to define the KB origin of a retrieved content.
  final ReferenceType referenceType;

  /// The URL, URI, or ID of the retrieved content when available, or a UUID when
  /// unavailable.
  final String sourceId;

  RetrieveResult({
    required this.associationId,
    required this.contentText,
    required this.referenceType,
    required this.sourceId,
  });

  factory RetrieveResult.fromJson(Map<String, dynamic> json) {
    return RetrieveResult(
      associationId: (json['associationId'] as String?) ?? '',
      contentText: (json['contentText'] as String?) ?? '',
      referenceType:
          ReferenceType.fromString((json['referenceType'] as String?) ?? ''),
      sourceId: (json['sourceId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    final contentText = this.contentText;
    final referenceType = this.referenceType;
    final sourceId = this.sourceId;
    return {
      'associationId': associationId,
      'contentText': contentText,
      'referenceType': referenceType.value,
      'sourceId': sourceId,
    };
  }
}

/// Configuration for content retrieval operations.
///
/// @nodoc
class RetrievalConfiguration {
  /// The knowledge source configuration for content retrieval.
  final KnowledgeSource knowledgeSource;

  /// The filter configuration for content retrieval.
  final RetrievalFilterConfiguration? filter;

  /// The number of results to retrieve.
  final int? numberOfResults;

  /// Override setting for the knowledge base search type during retrieval.
  final KnowledgeBaseSearchType? overrideKnowledgeBaseSearchType;

  RetrievalConfiguration({
    required this.knowledgeSource,
    this.filter,
    this.numberOfResults,
    this.overrideKnowledgeBaseSearchType,
  });

  Map<String, dynamic> toJson() {
    final knowledgeSource = this.knowledgeSource;
    final filter = this.filter;
    final numberOfResults = this.numberOfResults;
    final overrideKnowledgeBaseSearchType =
        this.overrideKnowledgeBaseSearchType;
    return {
      'knowledgeSource': knowledgeSource,
      if (filter != null) 'filter': filter,
      if (numberOfResults != null) 'numberOfResults': numberOfResults,
      if (overrideKnowledgeBaseSearchType != null)
        'overrideKnowledgeBaseSearchType':
            overrideKnowledgeBaseSearchType.value,
    };
  }
}

/// A knowledge source that provides content for recommendations.
///
/// @nodoc
class KnowledgeSource {
  /// The list of assistant association identifiers for the knowledge source.
  final List<String>? assistantAssociationIds;

  KnowledgeSource({
    this.assistantAssociationIds,
  });

  Map<String, dynamic> toJson() {
    final assistantAssociationIds = this.assistantAssociationIds;
    return {
      if (assistantAssociationIds != null)
        'assistantAssociationIds': assistantAssociationIds,
    };
  }
}

/// Configuration for filtering content during retrieval operations.
///
/// @nodoc
class RetrievalFilterConfiguration {
  /// Filter configuration that requires all conditions to be met.
  final List<RetrievalFilterConfiguration>? andAll;

  /// Filter configuration for exact equality matching.
  final FilterAttribute? equals;

  /// Filter configuration for greater than comparison.
  final FilterAttribute? greaterThan;

  /// Filter configuration for greater than or equal comparison.
  final FilterAttribute? greaterThanOrEquals;

  /// Filter configuration for membership in a set of values.
  final FilterAttribute? inValue;

  /// Filter configuration for less than comparison.
  final FilterAttribute? lessThan;

  /// Filter configuration for less than or equal comparison.
  final FilterAttribute? lessThanOrEquals;

  /// Filter configuration for checking if a list contains a value.
  final FilterAttribute? listContains;

  /// Filter configuration for inequality matching.
  final FilterAttribute? notEquals;

  /// Filter configuration for exclusion from a set of values.
  final FilterAttribute? notIn;

  /// Filter configuration where any condition can be met.
  final List<RetrievalFilterConfiguration>? orAll;

  /// Filter configuration for prefix matching.
  final FilterAttribute? startsWith;

  /// Filter configuration for substring matching.
  final FilterAttribute? stringContains;

  RetrievalFilterConfiguration({
    this.andAll,
    this.equals,
    this.greaterThan,
    this.greaterThanOrEquals,
    this.inValue,
    this.lessThan,
    this.lessThanOrEquals,
    this.listContains,
    this.notEquals,
    this.notIn,
    this.orAll,
    this.startsWith,
    this.stringContains,
  });

  Map<String, dynamic> toJson() {
    final andAll = this.andAll;
    final equals = this.equals;
    final greaterThan = this.greaterThan;
    final greaterThanOrEquals = this.greaterThanOrEquals;
    final inValue = this.inValue;
    final lessThan = this.lessThan;
    final lessThanOrEquals = this.lessThanOrEquals;
    final listContains = this.listContains;
    final notEquals = this.notEquals;
    final notIn = this.notIn;
    final orAll = this.orAll;
    final startsWith = this.startsWith;
    final stringContains = this.stringContains;
    return {
      if (andAll != null) 'andAll': andAll,
      if (equals != null) 'equals': equals,
      if (greaterThan != null) 'greaterThan': greaterThan,
      if (greaterThanOrEquals != null)
        'greaterThanOrEquals': greaterThanOrEquals,
      if (inValue != null) 'in': inValue,
      if (lessThan != null) 'lessThan': lessThan,
      if (lessThanOrEquals != null) 'lessThanOrEquals': lessThanOrEquals,
      if (listContains != null) 'listContains': listContains,
      if (notEquals != null) 'notEquals': notEquals,
      if (notIn != null) 'notIn': notIn,
      if (orAll != null) 'orAll': orAll,
      if (startsWith != null) 'startsWith': startsWith,
      if (stringContains != null) 'stringContains': stringContains,
    };
  }
}

/// An attribute used for filtering.
///
/// @nodoc
class FilterAttribute {
  /// The key of the filter attribute.
  final String key;

  /// The value of the filter attribute.
  final Object value;

  FilterAttribute({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Information about the result.
///
/// @nodoc
class ResultData {
  /// The identifier of the result data.
  final String resultId;

  /// Summary of the recommended content.
  final DataSummary? data;

  /// The document.
  final Document? document;

  /// The relevance score of the results.
  final double? relevanceScore;

  /// The type of the query result.
  final QueryResultType? type;

  ResultData({
    required this.resultId,
    this.data,
    this.document,
    this.relevanceScore,
    this.type,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) {
    return ResultData(
      resultId: (json['resultId'] as String?) ?? '',
      data: json['data'] != null
          ? DataSummary.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      document: json['document'] != null
          ? Document.fromJson(json['document'] as Map<String, dynamic>)
          : null,
      relevanceScore: _s.parseJsonDouble(json['relevanceScore']),
      type: (json['type'] as String?)?.let(QueryResultType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final resultId = this.resultId;
    final data = this.data;
    final document = this.document;
    final relevanceScore = this.relevanceScore;
    final type = this.type;
    return {
      'resultId': resultId,
      if (data != null) 'data': data,
      if (document != null) 'document': document,
      if (relevanceScore != null)
        'relevanceScore': _s.encodeJsonDouble(relevanceScore),
      if (type != null) 'type': type.value,
    };
  }
}

/// The document.
///
/// @nodoc
class Document {
  /// A reference to the content resource.
  final ContentReference contentReference;

  /// The excerpt from the document.
  final DocumentText? excerpt;

  /// The title of the document.
  final DocumentText? title;

  Document({
    required this.contentReference,
    this.excerpt,
    this.title,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      contentReference: ContentReference.fromJson(
          (json['contentReference'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      excerpt: json['excerpt'] != null
          ? DocumentText.fromJson(json['excerpt'] as Map<String, dynamic>)
          : null,
      title: json['title'] != null
          ? DocumentText.fromJson(json['title'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentReference = this.contentReference;
    final excerpt = this.excerpt;
    final title = this.title;
    return {
      'contentReference': contentReference,
      if (excerpt != null) 'excerpt': excerpt,
      if (title != null) 'title': title,
    };
  }
}

/// Summary of the data.
///
/// @nodoc
class DataSummary {
  /// Details about the data.
  final DataDetails details;

  /// Reference information about the content.
  final DataReference reference;

  DataSummary({
    required this.details,
    required this.reference,
  });

  factory DataSummary.fromJson(Map<String, dynamic> json) {
    return DataSummary(
      details: DataDetails.fromJson(
          (json['details'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      reference: DataReference.fromJson(
          (json['reference'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final reference = this.reference;
    return {
      'details': details,
      'reference': reference,
    };
  }
}

/// @nodoc
class QueryResultType {
  static const knowledgeContent = QueryResultType._('KNOWLEDGE_CONTENT');
  static const intentAnswer = QueryResultType._('INTENT_ANSWER');
  static const generativeAnswer = QueryResultType._('GENERATIVE_ANSWER');
  static const generativeAnswerChunk =
      QueryResultType._('GENERATIVE_ANSWER_CHUNK');
  static const blockedGenerativeAnswerChunk =
      QueryResultType._('BLOCKED_GENERATIVE_ANSWER_CHUNK');
  static const intentAnswerChunk = QueryResultType._('INTENT_ANSWER_CHUNK');
  static const blockedIntentAnswerChunk =
      QueryResultType._('BLOCKED_INTENT_ANSWER_CHUNK');
  static const emailResponseChunk = QueryResultType._('EMAIL_RESPONSE_CHUNK');
  static const emailOverviewChunk = QueryResultType._('EMAIL_OVERVIEW_CHUNK');
  static const emailGenerativeAnswerChunk =
      QueryResultType._('EMAIL_GENERATIVE_ANSWER_CHUNK');
  static const caseSummarizationChunk =
      QueryResultType._('CASE_SUMMARIZATION_CHUNK');
  static const blockedCaseSummarizationChunk =
      QueryResultType._('BLOCKED_CASE_SUMMARIZATION_CHUNK');
  static const notes = QueryResultType._('NOTES');
  static const notesChunk = QueryResultType._('NOTES_CHUNK');
  static const blockedNotesChunk = QueryResultType._('BLOCKED_NOTES_CHUNK');

  final String value;

  const QueryResultType._(this.value);

  static const values = [
    knowledgeContent,
    intentAnswer,
    generativeAnswer,
    generativeAnswerChunk,
    blockedGenerativeAnswerChunk,
    intentAnswerChunk,
    blockedIntentAnswerChunk,
    emailResponseChunk,
    emailOverviewChunk,
    emailGenerativeAnswerChunk,
    caseSummarizationChunk,
    blockedCaseSummarizationChunk,
    notes,
    notesChunk,
    blockedNotesChunk
  ];

  static QueryResultType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryResultType._(value));

  @override
  bool operator ==(other) => other is QueryResultType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Reference data.
///
/// @nodoc
class DataReference {
  final ContentReference? contentReference;

  /// Reference information about the generative content.
  final GenerativeReference? generativeReference;

  /// Reference information for suggested messages.
  final SuggestedMessageReference? suggestedMessageReference;

  DataReference({
    this.contentReference,
    this.generativeReference,
    this.suggestedMessageReference,
  });

  factory DataReference.fromJson(Map<String, dynamic> json) {
    return DataReference(
      contentReference: json['contentReference'] != null
          ? ContentReference.fromJson(
              json['contentReference'] as Map<String, dynamic>)
          : null,
      generativeReference: json['generativeReference'] != null
          ? GenerativeReference.fromJson(
              json['generativeReference'] as Map<String, dynamic>)
          : null,
      suggestedMessageReference: json['suggestedMessageReference'] != null
          ? SuggestedMessageReference.fromJson(
              json['suggestedMessageReference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentReference = this.contentReference;
    final generativeReference = this.generativeReference;
    final suggestedMessageReference = this.suggestedMessageReference;
    return {
      if (contentReference != null) 'contentReference': contentReference,
      if (generativeReference != null)
        'generativeReference': generativeReference,
      if (suggestedMessageReference != null)
        'suggestedMessageReference': suggestedMessageReference,
    };
  }
}

/// Details about the data.
///
/// @nodoc
class DataDetails {
  /// Details about case summarization chunk data.
  final CaseSummarizationChunkDataDetails? caseSummarizationChunkData;

  /// Details about the content data.
  final ContentDataDetails? contentData;

  /// Streaming chunk data for email generative answers containing partial
  /// knowledge-based response content.
  final EmailGenerativeAnswerChunkDataDetails? emailGenerativeAnswerChunkData;

  /// Streaming chunk data for email overview containing partial overview content.
  final EmailOverviewChunkDataDetails? emailOverviewChunkData;

  /// Streaming chunk data for email response generation containing partial
  /// response content.
  final EmailResponseChunkDataDetails? emailResponseChunkData;

  /// Details about the generative chunk data.
  final GenerativeChunkDataDetails? generativeChunkData;

  /// Details about the generative data.
  final GenerativeDataDetails? generativeData;

  /// Details about the intent data.
  final IntentDetectedDataDetails? intentDetectedData;

  /// Details about notes chunk data.
  final NotesChunkDataDetails? notesChunkData;

  /// Details about notes data.
  final NotesDataDetails? notesData;

  /// Details about the content data.
  final SourceContentDataDetails? sourceContentData;

  /// Details about suggested message data.
  final SuggestedMessageDataDetails? suggestedMessageData;

  DataDetails({
    this.caseSummarizationChunkData,
    this.contentData,
    this.emailGenerativeAnswerChunkData,
    this.emailOverviewChunkData,
    this.emailResponseChunkData,
    this.generativeChunkData,
    this.generativeData,
    this.intentDetectedData,
    this.notesChunkData,
    this.notesData,
    this.sourceContentData,
    this.suggestedMessageData,
  });

  factory DataDetails.fromJson(Map<String, dynamic> json) {
    return DataDetails(
      caseSummarizationChunkData: json['caseSummarizationChunkData'] != null
          ? CaseSummarizationChunkDataDetails.fromJson(
              json['caseSummarizationChunkData'] as Map<String, dynamic>)
          : null,
      contentData: json['contentData'] != null
          ? ContentDataDetails.fromJson(
              json['contentData'] as Map<String, dynamic>)
          : null,
      emailGenerativeAnswerChunkData: json['emailGenerativeAnswerChunkData'] !=
              null
          ? EmailGenerativeAnswerChunkDataDetails.fromJson(
              json['emailGenerativeAnswerChunkData'] as Map<String, dynamic>)
          : null,
      emailOverviewChunkData: json['emailOverviewChunkData'] != null
          ? EmailOverviewChunkDataDetails.fromJson(
              json['emailOverviewChunkData'] as Map<String, dynamic>)
          : null,
      emailResponseChunkData: json['emailResponseChunkData'] != null
          ? EmailResponseChunkDataDetails.fromJson(
              json['emailResponseChunkData'] as Map<String, dynamic>)
          : null,
      generativeChunkData: json['generativeChunkData'] != null
          ? GenerativeChunkDataDetails.fromJson(
              json['generativeChunkData'] as Map<String, dynamic>)
          : null,
      generativeData: json['generativeData'] != null
          ? GenerativeDataDetails.fromJson(
              json['generativeData'] as Map<String, dynamic>)
          : null,
      intentDetectedData: json['intentDetectedData'] != null
          ? IntentDetectedDataDetails.fromJson(
              json['intentDetectedData'] as Map<String, dynamic>)
          : null,
      notesChunkData: json['notesChunkData'] != null
          ? NotesChunkDataDetails.fromJson(
              json['notesChunkData'] as Map<String, dynamic>)
          : null,
      notesData: json['notesData'] != null
          ? NotesDataDetails.fromJson(json['notesData'] as Map<String, dynamic>)
          : null,
      sourceContentData: json['sourceContentData'] != null
          ? SourceContentDataDetails.fromJson(
              json['sourceContentData'] as Map<String, dynamic>)
          : null,
      suggestedMessageData: json['suggestedMessageData'] != null
          ? SuggestedMessageDataDetails.fromJson(
              json['suggestedMessageData'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final caseSummarizationChunkData = this.caseSummarizationChunkData;
    final contentData = this.contentData;
    final emailGenerativeAnswerChunkData = this.emailGenerativeAnswerChunkData;
    final emailOverviewChunkData = this.emailOverviewChunkData;
    final emailResponseChunkData = this.emailResponseChunkData;
    final generativeChunkData = this.generativeChunkData;
    final generativeData = this.generativeData;
    final intentDetectedData = this.intentDetectedData;
    final notesChunkData = this.notesChunkData;
    final notesData = this.notesData;
    final sourceContentData = this.sourceContentData;
    final suggestedMessageData = this.suggestedMessageData;
    return {
      if (caseSummarizationChunkData != null)
        'caseSummarizationChunkData': caseSummarizationChunkData,
      if (contentData != null) 'contentData': contentData,
      if (emailGenerativeAnswerChunkData != null)
        'emailGenerativeAnswerChunkData': emailGenerativeAnswerChunkData,
      if (emailOverviewChunkData != null)
        'emailOverviewChunkData': emailOverviewChunkData,
      if (emailResponseChunkData != null)
        'emailResponseChunkData': emailResponseChunkData,
      if (generativeChunkData != null)
        'generativeChunkData': generativeChunkData,
      if (generativeData != null) 'generativeData': generativeData,
      if (intentDetectedData != null) 'intentDetectedData': intentDetectedData,
      if (notesChunkData != null) 'notesChunkData': notesChunkData,
      if (notesData != null) 'notesData': notesData,
      if (sourceContentData != null) 'sourceContentData': sourceContentData,
      if (suggestedMessageData != null)
        'suggestedMessageData': suggestedMessageData,
    };
  }
}

/// Details about the content data.
///
/// @nodoc
class ContentDataDetails {
  /// Details about the content ranking data.
  final RankingData rankingData;

  /// Details about the content text data.
  final TextData textData;

  ContentDataDetails({
    required this.rankingData,
    required this.textData,
  });

  factory ContentDataDetails.fromJson(Map<String, dynamic> json) {
    return ContentDataDetails(
      rankingData: RankingData.fromJson(
          (json['rankingData'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      textData: TextData.fromJson((json['textData'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final rankingData = this.rankingData;
    final textData = this.textData;
    return {
      'rankingData': rankingData,
      'textData': textData,
    };
  }
}

/// Details about generative data.
///
/// @nodoc
class GenerativeDataDetails {
  /// The LLM response.
  final String completion;

  /// Details about the generative content ranking data.
  final RankingData rankingData;

  /// The references used to generative the LLM response.
  final List<DataSummary> references;

  GenerativeDataDetails({
    required this.completion,
    required this.rankingData,
    required this.references,
  });

  factory GenerativeDataDetails.fromJson(Map<String, dynamic> json) {
    return GenerativeDataDetails(
      completion: (json['completion'] as String?) ?? '',
      rankingData: RankingData.fromJson(
          (json['rankingData'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      references: ((json['references'] as List?) ?? const [])
          .nonNulls
          .map((e) => DataSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final completion = this.completion;
    final rankingData = this.rankingData;
    final references = this.references;
    return {
      'completion': completion,
      'rankingData': rankingData,
      'references': references,
    };
  }
}

/// Details about the detected intent.
///
/// @nodoc
class IntentDetectedDataDetails {
  /// The detected intent.
  final String intent;

  /// The identifier of the detected intent.
  final String intentId;

  /// The relevance level of the detected intent.
  final RelevanceLevel? relevanceLevel;

  IntentDetectedDataDetails({
    required this.intent,
    required this.intentId,
    this.relevanceLevel,
  });

  factory IntentDetectedDataDetails.fromJson(Map<String, dynamic> json) {
    return IntentDetectedDataDetails(
      intent: (json['intent'] as String?) ?? '',
      intentId: (json['intentId'] as String?) ?? '',
      relevanceLevel:
          (json['relevanceLevel'] as String?)?.let(RelevanceLevel.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intent = this.intent;
    final intentId = this.intentId;
    final relevanceLevel = this.relevanceLevel;
    return {
      'intent': intent,
      'intentId': intentId,
      if (relevanceLevel != null) 'relevanceLevel': relevanceLevel.value,
    };
  }
}

/// Details about the source content data.
///
/// @nodoc
class SourceContentDataDetails {
  /// The identifier of the source content.
  final String id;

  /// Details about the source content ranking data.
  final RankingData rankingData;

  /// Details about the source content text data.
  final TextData textData;

  /// The type of the source content.
  final SourceContentType type;

  /// Contains information about where the text with a citation begins and ends in
  /// the generated output.
  final CitationSpan? citationSpan;

  SourceContentDataDetails({
    required this.id,
    required this.rankingData,
    required this.textData,
    required this.type,
    this.citationSpan,
  });

  factory SourceContentDataDetails.fromJson(Map<String, dynamic> json) {
    return SourceContentDataDetails(
      id: (json['id'] as String?) ?? '',
      rankingData: RankingData.fromJson(
          (json['rankingData'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      textData: TextData.fromJson((json['textData'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      type: SourceContentType.fromString((json['type'] as String?) ?? ''),
      citationSpan: json['citationSpan'] != null
          ? CitationSpan.fromJson(json['citationSpan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final rankingData = this.rankingData;
    final textData = this.textData;
    final type = this.type;
    final citationSpan = this.citationSpan;
    return {
      'id': id,
      'rankingData': rankingData,
      'textData': textData,
      'type': type.value,
      if (citationSpan != null) 'citationSpan': citationSpan,
    };
  }
}

/// Details about the generative chunk data.
///
/// @nodoc
class GenerativeChunkDataDetails {
  /// A chunk of the LLM response.
  final String? completion;

  /// The token for the next set of chunks. Use the value returned in the previous
  /// response in the next request to retrieve the next set of chunks.
  final String? nextChunkToken;

  /// The references used to generate the LLM response.
  final List<DataSummary>? references;

  GenerativeChunkDataDetails({
    this.completion,
    this.nextChunkToken,
    this.references,
  });

  factory GenerativeChunkDataDetails.fromJson(Map<String, dynamic> json) {
    return GenerativeChunkDataDetails(
      completion: json['completion'] as String?,
      nextChunkToken: json['nextChunkToken'] as String?,
      references: (json['references'] as List?)
          ?.nonNulls
          .map((e) => DataSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final completion = this.completion;
    final nextChunkToken = this.nextChunkToken;
    final references = this.references;
    return {
      if (completion != null) 'completion': completion,
      if (nextChunkToken != null) 'nextChunkToken': nextChunkToken,
      if (references != null) 'references': references,
    };
  }
}

/// Details of streaming chunk data for email responses including completion
/// text and pagination tokens.
///
/// @nodoc
class EmailResponseChunkDataDetails {
  /// The partial or complete professional email response text with appropriate
  /// greetings and closings.
  final String? completion;

  /// Token for retrieving the next chunk of streaming response data, if
  /// available.
  final String? nextChunkToken;

  EmailResponseChunkDataDetails({
    this.completion,
    this.nextChunkToken,
  });

  factory EmailResponseChunkDataDetails.fromJson(Map<String, dynamic> json) {
    return EmailResponseChunkDataDetails(
      completion: json['completion'] as String?,
      nextChunkToken: json['nextChunkToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completion = this.completion;
    final nextChunkToken = this.nextChunkToken;
    return {
      if (completion != null) 'completion': completion,
      if (nextChunkToken != null) 'nextChunkToken': nextChunkToken,
    };
  }
}

/// Details of streaming chunk data for email overview including completion text
/// and pagination tokens.
///
/// @nodoc
class EmailOverviewChunkDataDetails {
  /// The partial or complete overview text content in structured HTML format with
  /// customer issues, resolutions, and next steps.
  final String? completion;

  /// Token for retrieving the next chunk of streaming overview data, if
  /// available.
  final String? nextChunkToken;

  EmailOverviewChunkDataDetails({
    this.completion,
    this.nextChunkToken,
  });

  factory EmailOverviewChunkDataDetails.fromJson(Map<String, dynamic> json) {
    return EmailOverviewChunkDataDetails(
      completion: json['completion'] as String?,
      nextChunkToken: json['nextChunkToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completion = this.completion;
    final nextChunkToken = this.nextChunkToken;
    return {
      if (completion != null) 'completion': completion,
      if (nextChunkToken != null) 'nextChunkToken': nextChunkToken,
    };
  }
}

/// Details of streaming chunk data for email generative answers including
/// completion text and references.
///
/// @nodoc
class EmailGenerativeAnswerChunkDataDetails {
  /// The partial or complete text content of the generative answer response.
  final String? completion;

  /// Token for retrieving the next chunk of streaming response data, if
  /// available.
  final String? nextChunkToken;

  /// Source references and citations from knowledge base articles used to
  /// generate the answer.
  final List<DataSummary>? references;

  EmailGenerativeAnswerChunkDataDetails({
    this.completion,
    this.nextChunkToken,
    this.references,
  });

  factory EmailGenerativeAnswerChunkDataDetails.fromJson(
      Map<String, dynamic> json) {
    return EmailGenerativeAnswerChunkDataDetails(
      completion: json['completion'] as String?,
      nextChunkToken: json['nextChunkToken'] as String?,
      references: (json['references'] as List?)
          ?.nonNulls
          .map((e) => DataSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final completion = this.completion;
    final nextChunkToken = this.nextChunkToken;
    final references = this.references;
    return {
      if (completion != null) 'completion': completion,
      if (nextChunkToken != null) 'nextChunkToken': nextChunkToken,
      if (references != null) 'references': references,
    };
  }
}

/// Details about case summarization chunk data.
///
/// @nodoc
class CaseSummarizationChunkDataDetails {
  /// A chunk of the case summarization completion.
  final String? completion;

  /// Token for retrieving the next chunk of streaming summarization data, if
  /// available.
  final String? nextChunkToken;

  CaseSummarizationChunkDataDetails({
    this.completion,
    this.nextChunkToken,
  });

  factory CaseSummarizationChunkDataDetails.fromJson(
      Map<String, dynamic> json) {
    return CaseSummarizationChunkDataDetails(
      completion: json['completion'] as String?,
      nextChunkToken: json['nextChunkToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completion = this.completion;
    final nextChunkToken = this.nextChunkToken;
    return {
      if (completion != null) 'completion': completion,
      if (nextChunkToken != null) 'nextChunkToken': nextChunkToken,
    };
  }
}

/// Details about suggested message data.
///
/// @nodoc
class SuggestedMessageDataDetails {
  /// The text content of the suggested message.
  final String messageText;

  SuggestedMessageDataDetails({
    required this.messageText,
  });

  factory SuggestedMessageDataDetails.fromJson(Map<String, dynamic> json) {
    return SuggestedMessageDataDetails(
      messageText: (json['messageText'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final messageText = this.messageText;
    return {
      'messageText': messageText,
    };
  }
}

/// Details about notes data.
///
/// @nodoc
class NotesDataDetails {
  /// The completion data for notes.
  final String? completion;

  NotesDataDetails({
    this.completion,
  });

  factory NotesDataDetails.fromJson(Map<String, dynamic> json) {
    return NotesDataDetails(
      completion: json['completion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completion = this.completion;
    return {
      if (completion != null) 'completion': completion,
    };
  }
}

/// Details about notes chunk data.
///
/// @nodoc
class NotesChunkDataDetails {
  /// A chunk of the notes completion.
  final String? completion;

  /// The token for the next chunk of notes data.
  final String? nextChunkToken;

  NotesChunkDataDetails({
    this.completion,
    this.nextChunkToken,
  });

  factory NotesChunkDataDetails.fromJson(Map<String, dynamic> json) {
    return NotesChunkDataDetails(
      completion: json['completion'] as String?,
      nextChunkToken: json['nextChunkToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completion = this.completion;
    final nextChunkToken = this.nextChunkToken;
    return {
      if (completion != null) 'completion': completion,
      if (nextChunkToken != null) 'nextChunkToken': nextChunkToken,
    };
  }
}

/// @nodoc
class SourceContentType {
  static const knowledgeContent = SourceContentType._('KNOWLEDGE_CONTENT');

  final String value;

  const SourceContentType._(this.value);

  static const values = [knowledgeContent];

  static SourceContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SourceContentType._(value));

  @override
  bool operator ==(other) => other is SourceContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the source content text data.
///
/// @nodoc
class TextData {
  final DocumentText? excerpt;
  final DocumentText? title;

  TextData({
    this.excerpt,
    this.title,
  });

  factory TextData.fromJson(Map<String, dynamic> json) {
    return TextData(
      excerpt: json['excerpt'] != null
          ? DocumentText.fromJson(json['excerpt'] as Map<String, dynamic>)
          : null,
      title: json['title'] != null
          ? DocumentText.fromJson(json['title'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final excerpt = this.excerpt;
    final title = this.title;
    return {
      if (excerpt != null) 'excerpt': excerpt,
      if (title != null) 'title': title,
    };
  }
}

/// Details about the source content ranking data.
///
/// @nodoc
class RankingData {
  /// The relevance score of the content.
  final RelevanceLevel? relevanceLevel;

  /// The relevance level of the recommendation.
  final double? relevanceScore;

  RankingData({
    this.relevanceLevel,
    this.relevanceScore,
  });

  factory RankingData.fromJson(Map<String, dynamic> json) {
    return RankingData(
      relevanceLevel:
          (json['relevanceLevel'] as String?)?.let(RelevanceLevel.fromString),
      relevanceScore: _s.parseJsonDouble(json['relevanceScore']),
    );
  }

  Map<String, dynamic> toJson() {
    final relevanceLevel = this.relevanceLevel;
    final relevanceScore = this.relevanceScore;
    return {
      if (relevanceLevel != null) 'relevanceLevel': relevanceLevel.value,
      if (relevanceScore != null)
        'relevanceScore': _s.encodeJsonDouble(relevanceScore),
    };
  }
}

/// @nodoc
class RelevanceLevel {
  static const high = RelevanceLevel._('HIGH');
  static const medium = RelevanceLevel._('MEDIUM');
  static const low = RelevanceLevel._('LOW');

  final String value;

  const RelevanceLevel._(this.value);

  static const values = [high, medium, low];

  static RelevanceLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RelevanceLevel._(value));

  @override
  bool operator ==(other) => other is RelevanceLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The text of the document.
///
/// @nodoc
class DocumentText {
  /// Highlights in the document text.
  final List<Highlight>? highlights;

  /// Text in the document.
  final String? text;

  DocumentText({
    this.highlights,
    this.text,
  });

  factory DocumentText.fromJson(Map<String, dynamic> json) {
    return DocumentText(
      highlights: (json['highlights'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final highlights = this.highlights;
    final text = this.text;
    return {
      if (highlights != null) 'highlights': highlights,
      if (text != null) 'text': text,
    };
  }
}

/// Offset specification to describe highlighting of document excerpts for
/// rendering search results and recommendations.
///
/// @nodoc
class Highlight {
  /// The offset for the start of the highlight.
  final int? beginOffsetInclusive;

  /// The offset for the end of the highlight.
  final int? endOffsetExclusive;

  Highlight({
    this.beginOffsetInclusive,
    this.endOffsetExclusive,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) {
    return Highlight(
      beginOffsetInclusive: json['beginOffsetInclusive'] as int?,
      endOffsetExclusive: json['endOffsetExclusive'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffsetInclusive = this.beginOffsetInclusive;
    final endOffsetExclusive = this.endOffsetExclusive;
    return {
      if (beginOffsetInclusive != null)
        'beginOffsetInclusive': beginOffsetInclusive,
      if (endOffsetExclusive != null) 'endOffsetExclusive': endOffsetExclusive,
    };
  }
}

/// Reference information about the content.
///
/// @nodoc
class ContentReference {
  /// The Amazon Resource Name (ARN) of the content.
  final String? contentArn;

  /// The identifier of the content.
  final String? contentId;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String? knowledgeBaseArn;

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base.
  final String? knowledgeBaseId;

  /// The type of reference content.
  final ReferenceType? referenceType;

  /// The web URL of the source content.
  final String? sourceURL;

  ContentReference({
    this.contentArn,
    this.contentId,
    this.knowledgeBaseArn,
    this.knowledgeBaseId,
    this.referenceType,
    this.sourceURL,
  });

  factory ContentReference.fromJson(Map<String, dynamic> json) {
    return ContentReference(
      contentArn: json['contentArn'] as String?,
      contentId: json['contentId'] as String?,
      knowledgeBaseArn: json['knowledgeBaseArn'] as String?,
      knowledgeBaseId: json['knowledgeBaseId'] as String?,
      referenceType:
          (json['referenceType'] as String?)?.let(ReferenceType.fromString),
      sourceURL: json['sourceURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentArn = this.contentArn;
    final contentId = this.contentId;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final referenceType = this.referenceType;
    final sourceURL = this.sourceURL;
    return {
      if (contentArn != null) 'contentArn': contentArn,
      if (contentId != null) 'contentId': contentId,
      if (knowledgeBaseArn != null) 'knowledgeBaseArn': knowledgeBaseArn,
      if (knowledgeBaseId != null) 'knowledgeBaseId': knowledgeBaseId,
      if (referenceType != null) 'referenceType': referenceType.value,
      if (sourceURL != null) 'sourceURL': sourceURL,
    };
  }
}

/// Reference information about generative content.
///
/// @nodoc
class GenerativeReference {
  /// The identifier of the LLM model.
  final String? generationId;

  /// The identifier of the LLM model.
  final String? modelId;

  GenerativeReference({
    this.generationId,
    this.modelId,
  });

  factory GenerativeReference.fromJson(Map<String, dynamic> json) {
    return GenerativeReference(
      generationId: json['generationId'] as String?,
      modelId: json['modelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final generationId = this.generationId;
    final modelId = this.modelId;
    return {
      if (generationId != null) 'generationId': generationId,
      if (modelId != null) 'modelId': modelId,
    };
  }
}

/// Reference information for a suggested message.
///
/// @nodoc
class SuggestedMessageReference {
  /// The Amazon Resource Name (ARN) of the AI Agent that generated the suggested
  /// message.
  final String aiAgentArn;

  /// The identifier of the AI Agent that generated the suggested message.
  final String aiAgentId;

  SuggestedMessageReference({
    required this.aiAgentArn,
    required this.aiAgentId,
  });

  factory SuggestedMessageReference.fromJson(Map<String, dynamic> json) {
    return SuggestedMessageReference(
      aiAgentArn: (json['aiAgentArn'] as String?) ?? '',
      aiAgentId: (json['aiAgentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final aiAgentArn = this.aiAgentArn;
    final aiAgentId = this.aiAgentId;
    return {
      'aiAgentArn': aiAgentArn,
      'aiAgentId': aiAgentId,
    };
  }
}

/// Input information for the query.
///
/// @nodoc
class QueryInputData {
  /// Input data for case summarization queries.
  final CaseSummarizationInputData? caseSummarizationInputData;

  /// Input information for the intent.
  final IntentInputData? intentInputData;

  /// Input information for the query.
  final QueryTextInputData? queryTextInputData;

  QueryInputData({
    this.caseSummarizationInputData,
    this.intentInputData,
    this.queryTextInputData,
  });

  Map<String, dynamic> toJson() {
    final caseSummarizationInputData = this.caseSummarizationInputData;
    final intentInputData = this.intentInputData;
    final queryTextInputData = this.queryTextInputData;
    return {
      if (caseSummarizationInputData != null)
        'caseSummarizationInputData': caseSummarizationInputData,
      if (intentInputData != null) 'intentInputData': intentInputData,
      if (queryTextInputData != null) 'queryTextInputData': queryTextInputData,
    };
  }
}

/// Information about the text to search for.
///
/// @nodoc
class QueryTextInputData {
  /// The text to search for.
  final String text;

  QueryTextInputData({
    required this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'text': text,
    };
  }
}

/// Information about the Amazon Q intent.
///
/// @nodoc
class IntentInputData {
  /// The identifier of the Amazon Q intent.
  final String intentId;

  IntentInputData({
    required this.intentId,
  });

  Map<String, dynamic> toJson() {
    final intentId = this.intentId;
    return {
      'intentId': intentId,
    };
  }
}

/// Input data for case summarization.
///
/// @nodoc
class CaseSummarizationInputData {
  /// The Amazon Resource Name (ARN) of the case for summarization.
  final String caseArn;

  CaseSummarizationInputData({
    required this.caseArn,
  });

  Map<String, dynamic> toJson() {
    final caseArn = this.caseArn;
    return {
      'caseArn': caseArn,
    };
  }
}

/// Information about how to query content.
///
/// @nodoc
class QueryCondition {
  /// The condition for the query.
  final QueryConditionItem? single;

  QueryCondition({
    this.single,
  });

  Map<String, dynamic> toJson() {
    final single = this.single;
    return {
      if (single != null) 'single': single,
    };
  }
}

/// The condition for the query.
///
/// @nodoc
class QueryConditionItem {
  /// The comparison operator for query condition to query on.
  final QueryConditionComparisonOperator comparator;

  /// The name of the field for query condition to query on.
  final QueryConditionFieldName field;

  /// The value for the query condition to query on.
  final String value;

  QueryConditionItem({
    required this.comparator,
    required this.field,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final field = this.field;
    final value = this.value;
    return {
      'comparator': comparator.value,
      'field': field.value,
      'value': value,
    };
  }
}

/// @nodoc
class QueryConditionFieldName {
  static const resultType = QueryConditionFieldName._('RESULT_TYPE');

  final String value;

  const QueryConditionFieldName._(this.value);

  static const values = [resultType];

  static QueryConditionFieldName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryConditionFieldName._(value));

  @override
  bool operator ==(other) =>
      other is QueryConditionFieldName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class QueryConditionComparisonOperator {
  static const equals = QueryConditionComparisonOperator._('EQUALS');

  final String value;

  const QueryConditionComparisonOperator._(this.value);

  static const values = [equals];

  static QueryConditionComparisonOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryConditionComparisonOperator._(value));

  @override
  bool operator ==(other) =>
      other is QueryConditionComparisonOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TargetType {
  static const recommendation = TargetType._('RECOMMENDATION');
  static const result = TargetType._('RESULT');
  static const message = TargetType._('MESSAGE');

  final String value;

  const TargetType._(this.value);

  static const values = [recommendation, result, message];

  static TargetType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TargetType._(value));

  @override
  bool operator ==(other) => other is TargetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the feedback.
///
/// @nodoc
class ContentFeedbackData {
  /// Information about the feedback for a generative target type.
  final GenerativeContentFeedbackData? generativeContentFeedbackData;

  ContentFeedbackData({
    this.generativeContentFeedbackData,
  });

  factory ContentFeedbackData.fromJson(Map<String, dynamic> json) {
    return ContentFeedbackData(
      generativeContentFeedbackData:
          json['generativeContentFeedbackData'] != null
              ? GenerativeContentFeedbackData.fromJson(
                  json['generativeContentFeedbackData'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final generativeContentFeedbackData = this.generativeContentFeedbackData;
    return {
      if (generativeContentFeedbackData != null)
        'generativeContentFeedbackData': generativeContentFeedbackData,
    };
  }
}

/// The feedback information for a generative target type.
///
/// @nodoc
class GenerativeContentFeedbackData {
  /// The relevance of the feedback.
  final Relevance relevance;

  GenerativeContentFeedbackData({
    required this.relevance,
  });

  factory GenerativeContentFeedbackData.fromJson(Map<String, dynamic> json) {
    return GenerativeContentFeedbackData(
      relevance: Relevance.fromString((json['relevance'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final relevance = this.relevance;
    return {
      'relevance': relevance.value,
    };
  }
}

/// @nodoc
class Relevance {
  static const helpful = Relevance._('HELPFUL');
  static const notHelpful = Relevance._('NOT_HELPFUL');

  final String value;

  const Relevance._(this.value);

  static const values = [helpful, notHelpful];

  static Relevance fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Relevance._(value));

  @override
  bool operator ==(other) => other is Relevance && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An error occurred when creating a recommendation.
///
/// @nodoc
class NotifyRecommendationsReceivedError {
  /// A recommendation is causing an error.
  final String? message;

  /// The identifier of the recommendation that is in error.
  final String? recommendationId;

  NotifyRecommendationsReceivedError({
    this.message,
    this.recommendationId,
  });

  factory NotifyRecommendationsReceivedError.fromJson(
      Map<String, dynamic> json) {
    return NotifyRecommendationsReceivedError(
      message: json['message'] as String?,
      recommendationId: json['recommendationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final recommendationId = this.recommendationId;
    return {
      if (message != null) 'message': message,
      if (recommendationId != null) 'recommendationId': recommendationId,
    };
  }
}

/// The summary of a model available to an Amazon Q in Connect assistant.
///
/// @nodoc
class ModelSummary {
  /// The display name of the model.
  final String displayName;

  /// The identifier of the model.
  final String modelId;

  /// The cross-region availability status of the model. <code>NONE</code>
  /// indicates the model is only available in a single region,
  /// <code>REGIONAL</code> indicates the model is available through regional
  /// inference, and <code>GLOBAL</code> indicates the model is available through
  /// global cross-region inference.
  final CrossRegionStatus? crossRegionStatus;

  /// The timestamp when the model will reach end of life and no longer be
  /// available for use.
  final DateTime? endOfLifeTimestamp;

  /// The timestamp when the model lifecycle will transition from
  /// <code>ACTIVE</code> to <code>LEGACY</code>.
  final DateTime? legacyTimestamp;

  /// The current lifecycle of the model. <code>ACTIVE</code> indicates the model
  /// is recommended for use and <code>LEGACY</code> indicates the model is still
  /// usable but is deprecated.
  final ModelLifecycle? modelLifecycle;

  /// The list of AI Prompt types that the model supports.
  final List<AIPromptType>? supportedAIPromptTypes;

  /// Whether the model supports prompt caching.
  final bool? supportsPromptCaching;

  ModelSummary({
    required this.displayName,
    required this.modelId,
    this.crossRegionStatus,
    this.endOfLifeTimestamp,
    this.legacyTimestamp,
    this.modelLifecycle,
    this.supportedAIPromptTypes,
    this.supportsPromptCaching,
  });

  factory ModelSummary.fromJson(Map<String, dynamic> json) {
    return ModelSummary(
      displayName: (json['displayName'] as String?) ?? '',
      modelId: (json['modelId'] as String?) ?? '',
      crossRegionStatus: (json['crossRegionStatus'] as String?)
          ?.let(CrossRegionStatus.fromString),
      endOfLifeTimestamp: timeStampFromJson(json['endOfLifeTimestamp']),
      legacyTimestamp: timeStampFromJson(json['legacyTimestamp']),
      modelLifecycle:
          (json['modelLifecycle'] as String?)?.let(ModelLifecycle.fromString),
      supportedAIPromptTypes: (json['supportedAIPromptTypes'] as List?)
          ?.nonNulls
          .map((e) => AIPromptType.fromString((e as String)))
          .toList(),
      supportsPromptCaching: json['supportsPromptCaching'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final modelId = this.modelId;
    final crossRegionStatus = this.crossRegionStatus;
    final endOfLifeTimestamp = this.endOfLifeTimestamp;
    final legacyTimestamp = this.legacyTimestamp;
    final modelLifecycle = this.modelLifecycle;
    final supportedAIPromptTypes = this.supportedAIPromptTypes;
    final supportsPromptCaching = this.supportsPromptCaching;
    return {
      'displayName': displayName,
      'modelId': modelId,
      if (crossRegionStatus != null)
        'crossRegionStatus': crossRegionStatus.value,
      if (endOfLifeTimestamp != null)
        'endOfLifeTimestamp': unixTimestampToJson(endOfLifeTimestamp),
      if (legacyTimestamp != null)
        'legacyTimestamp': unixTimestampToJson(legacyTimestamp),
      if (modelLifecycle != null) 'modelLifecycle': modelLifecycle.value,
      if (supportedAIPromptTypes != null)
        'supportedAIPromptTypes':
            supportedAIPromptTypes.map((e) => e.value).toList(),
      if (supportsPromptCaching != null)
        'supportsPromptCaching': supportsPromptCaching,
    };
  }
}

/// @nodoc
class CrossRegionStatus {
  static const none = CrossRegionStatus._('NONE');
  static const regional = CrossRegionStatus._('REGIONAL');
  static const global = CrossRegionStatus._('GLOBAL');

  final String value;

  const CrossRegionStatus._(this.value);

  static const values = [none, regional, global];

  static CrossRegionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CrossRegionStatus._(value));

  @override
  bool operator ==(other) => other is CrossRegionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ModelLifecycle {
  static const active = ModelLifecycle._('ACTIVE');
  static const legacy = ModelLifecycle._('LEGACY');

  final String value;

  const ModelLifecycle._(this.value);

  static const values = [active, legacy];

  static ModelLifecycle fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ModelLifecycle._(value));

  @override
  bool operator ==(other) => other is ModelLifecycle && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A recommendation trigger provides context on the event that produced the
/// referenced recommendations. Recommendations are only referenced in
/// <code>recommendationIds</code> by a single RecommendationTrigger.
///
/// @nodoc
class RecommendationTrigger {
  /// A union type containing information related to the trigger.
  final RecommendationTriggerData data;

  /// The identifier of the recommendation trigger.
  final String id;

  /// The identifiers of the recommendations.
  final List<String> recommendationIds;

  /// The source of the recommendation trigger.
  ///
  /// <ul>
  /// <li>
  /// ISSUE_DETECTION: The corresponding recommendations were triggered by a
  /// Contact Lens issue.
  /// </li>
  /// <li>
  /// RULE_EVALUATION: The corresponding recommendations were triggered by a
  /// Contact Lens rule.
  /// </li>
  /// </ul>
  final RecommendationSourceType source;

  /// The type of recommendation trigger.
  final RecommendationTriggerType type;

  RecommendationTrigger({
    required this.data,
    required this.id,
    required this.recommendationIds,
    required this.source,
    required this.type,
  });

  factory RecommendationTrigger.fromJson(Map<String, dynamic> json) {
    return RecommendationTrigger(
      data: RecommendationTriggerData.fromJson(
          (json['data'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
      id: (json['id'] as String?) ?? '',
      recommendationIds: ((json['recommendationIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      source: RecommendationSourceType.fromString(
          (json['source'] as String?) ?? ''),
      type:
          RecommendationTriggerType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final id = this.id;
    final recommendationIds = this.recommendationIds;
    final source = this.source;
    final type = this.type;
    return {
      'data': data,
      'id': id,
      'recommendationIds': recommendationIds,
      'source': source.value,
      'type': type.value,
    };
  }
}

/// @nodoc
class RecommendationTriggerType {
  static const query = RecommendationTriggerType._('QUERY');
  static const generative = RecommendationTriggerType._('GENERATIVE');

  final String value;

  const RecommendationTriggerType._(this.value);

  static const values = [query, generative];

  static RecommendationTriggerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationTriggerType._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationTriggerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RecommendationSourceType {
  static const issueDetection = RecommendationSourceType._('ISSUE_DETECTION');
  static const ruleEvaluation = RecommendationSourceType._('RULE_EVALUATION');
  static const other = RecommendationSourceType._('OTHER');

  final String value;

  const RecommendationSourceType._(this.value);

  static const values = [issueDetection, ruleEvaluation, other];

  static RecommendationSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationSourceType._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A union type containing information related to the trigger.
///
/// @nodoc
class RecommendationTriggerData {
  /// Data associated with the QUERY RecommendationTriggerType.
  final QueryRecommendationTriggerData? query;

  RecommendationTriggerData({
    this.query,
  });

  factory RecommendationTriggerData.fromJson(Map<String, dynamic> json) {
    return RecommendationTriggerData(
      query: json['query'] != null
          ? QueryRecommendationTriggerData.fromJson(
              json['query'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final query = this.query;
    return {
      if (query != null) 'query': query,
    };
  }
}

/// Data associated with the QUERY RecommendationTriggerType.
///
/// @nodoc
class QueryRecommendationTriggerData {
  /// The text associated with the recommendation trigger.
  final String? text;

  QueryRecommendationTriggerData({
    this.text,
  });

  factory QueryRecommendationTriggerData.fromJson(Map<String, dynamic> json) {
    return QueryRecommendationTriggerData(
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// Information about the recommendation.
///
/// @nodoc
class RecommendationData {
  /// The identifier of the recommendation.
  final String recommendationId;

  /// Summary of the recommended content.
  final DataSummary? data;

  /// The recommended document.
  final Document? document;

  /// The relevance level of the recommendation.
  final RelevanceLevel? relevanceLevel;

  /// The relevance score of the recommendation.
  final double? relevanceScore;

  /// The type of recommendation.
  final RecommendationType? type;

  RecommendationData({
    required this.recommendationId,
    this.data,
    this.document,
    this.relevanceLevel,
    this.relevanceScore,
    this.type,
  });

  factory RecommendationData.fromJson(Map<String, dynamic> json) {
    return RecommendationData(
      recommendationId: (json['recommendationId'] as String?) ?? '',
      data: json['data'] != null
          ? DataSummary.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      document: json['document'] != null
          ? Document.fromJson(json['document'] as Map<String, dynamic>)
          : null,
      relevanceLevel:
          (json['relevanceLevel'] as String?)?.let(RelevanceLevel.fromString),
      relevanceScore: _s.parseJsonDouble(json['relevanceScore']),
      type: (json['type'] as String?)?.let(RecommendationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationId = this.recommendationId;
    final data = this.data;
    final document = this.document;
    final relevanceLevel = this.relevanceLevel;
    final relevanceScore = this.relevanceScore;
    final type = this.type;
    return {
      'recommendationId': recommendationId,
      if (data != null) 'data': data,
      if (document != null) 'document': document,
      if (relevanceLevel != null) 'relevanceLevel': relevanceLevel.value,
      if (relevanceScore != null)
        'relevanceScore': _s.encodeJsonDouble(relevanceScore),
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class RecommendationType {
  static const knowledgeContent = RecommendationType._('KNOWLEDGE_CONTENT');
  static const generativeResponse = RecommendationType._('GENERATIVE_RESPONSE');
  static const generativeAnswer = RecommendationType._('GENERATIVE_ANSWER');
  static const detectedIntent = RecommendationType._('DETECTED_INTENT');
  static const generativeAnswerChunk =
      RecommendationType._('GENERATIVE_ANSWER_CHUNK');
  static const blockedGenerativeAnswerChunk =
      RecommendationType._('BLOCKED_GENERATIVE_ANSWER_CHUNK');
  static const intentAnswerChunk = RecommendationType._('INTENT_ANSWER_CHUNK');
  static const blockedIntentAnswerChunk =
      RecommendationType._('BLOCKED_INTENT_ANSWER_CHUNK');
  static const emailResponseChunk =
      RecommendationType._('EMAIL_RESPONSE_CHUNK');
  static const emailOverviewChunk =
      RecommendationType._('EMAIL_OVERVIEW_CHUNK');
  static const emailGenerativeAnswerChunk =
      RecommendationType._('EMAIL_GENERATIVE_ANSWER_CHUNK');
  static const caseSummarizationChunk =
      RecommendationType._('CASE_SUMMARIZATION_CHUNK');
  static const blockedCaseSummarizationChunk =
      RecommendationType._('BLOCKED_CASE_SUMMARIZATION_CHUNK');
  static const suggestedMessage = RecommendationType._('SUGGESTED_MESSAGE');
  static const notesChunk = RecommendationType._('NOTES_CHUNK');
  static const blockedNotesChunk = RecommendationType._('BLOCKED_NOTES_CHUNK');

  final String value;

  const RecommendationType._(this.value);

  static const values = [
    knowledgeContent,
    generativeResponse,
    generativeAnswer,
    detectedIntent,
    generativeAnswerChunk,
    blockedGenerativeAnswerChunk,
    intentAnswerChunk,
    blockedIntentAnswerChunk,
    emailResponseChunk,
    emailOverviewChunk,
    emailGenerativeAnswerChunk,
    caseSummarizationChunk,
    blockedCaseSummarizationChunk,
    suggestedMessage,
    notesChunk,
    blockedNotesChunk
  ];

  static RecommendationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationType._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about the assistant.
///
/// @nodoc
class AssistantSummary {
  /// The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.
  final String assistantArn;

  /// The identifier of the Amazon Q in Connect assistant.
  final String assistantId;

  /// The name of the assistant.
  final String name;

  /// The status of the assistant.
  final AssistantStatus status;

  /// The type of the assistant.
  final AssistantType type;

  /// The configuration of the AI Agents (mapped by AI Agent Type to AI Agent
  /// version) that is set on the Amazon Q in Connect Assistant.
  final Map<AIAgentType, AIAgentConfigurationData>? aiAgentConfiguration;

  /// The configuration information for the Amazon Q in Connect assistant
  /// capability.
  final AssistantCapabilityConfiguration? capabilityConfiguration;

  /// The description of the assistant.
  final String? description;

  /// The configuration information for the Amazon Q in Connect assistant
  /// integration.
  final AssistantIntegrationConfiguration? integrationConfiguration;

  /// The list of orchestrator configurations for the assistant.
  final List<OrchestratorConfigurationEntry>? orchestratorConfigurationList;

  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// This KMS key must have a policy that allows <code>kms:CreateGrant</code>,
  /// <code>kms:DescribeKey</code>, <code>kms:Decrypt</code>, and
  /// <code>kms:GenerateDataKey*</code> permissions to the IAM identity using the
  /// key to invoke Amazon Q in Connect. To use Amazon Q in Connect with chat, the
  /// key policy must also allow <code>kms:Decrypt</code>,
  /// <code>kms:GenerateDataKey*</code>, and <code>kms:DescribeKey</code>
  /// permissions to the <code>connect.amazonaws.com</code> service principal.
  ///
  /// For more information about setting up a customer managed key for Amazon Q in
  /// Connect, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-q.html">Enable
  /// Amazon Q in Connect for your instance</a>.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AssistantSummary({
    required this.assistantArn,
    required this.assistantId,
    required this.name,
    required this.status,
    required this.type,
    this.aiAgentConfiguration,
    this.capabilityConfiguration,
    this.description,
    this.integrationConfiguration,
    this.orchestratorConfigurationList,
    this.serverSideEncryptionConfiguration,
    this.tags,
  });

  factory AssistantSummary.fromJson(Map<String, dynamic> json) {
    return AssistantSummary(
      assistantArn: (json['assistantArn'] as String?) ?? '',
      assistantId: (json['assistantId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: AssistantStatus.fromString((json['status'] as String?) ?? ''),
      type: AssistantType.fromString((json['type'] as String?) ?? ''),
      aiAgentConfiguration: (json['aiAgentConfiguration']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(AIAgentType.fromString(k),
              AIAgentConfigurationData.fromJson(e as Map<String, dynamic>))),
      capabilityConfiguration: json['capabilityConfiguration'] != null
          ? AssistantCapabilityConfiguration.fromJson(
              json['capabilityConfiguration'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      integrationConfiguration: json['integrationConfiguration'] != null
          ? AssistantIntegrationConfiguration.fromJson(
              json['integrationConfiguration'] as Map<String, dynamic>)
          : null,
      orchestratorConfigurationList:
          (json['orchestratorConfigurationList'] as List?)
              ?.nonNulls
              .map((e) => OrchestratorConfigurationEntry.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      serverSideEncryptionConfiguration:
          json['serverSideEncryptionConfiguration'] != null
              ? ServerSideEncryptionConfiguration.fromJson(
                  json['serverSideEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final assistantArn = this.assistantArn;
    final assistantId = this.assistantId;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final aiAgentConfiguration = this.aiAgentConfiguration;
    final capabilityConfiguration = this.capabilityConfiguration;
    final description = this.description;
    final integrationConfiguration = this.integrationConfiguration;
    final orchestratorConfigurationList = this.orchestratorConfigurationList;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final tags = this.tags;
    return {
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'name': name,
      'status': status.value,
      'type': type.value,
      if (aiAgentConfiguration != null)
        'aiAgentConfiguration':
            aiAgentConfiguration.map((k, e) => MapEntry(k.value, e)),
      if (capabilityConfiguration != null)
        'capabilityConfiguration': capabilityConfiguration,
      if (description != null) 'description': description,
      if (integrationConfiguration != null)
        'integrationConfiguration': integrationConfiguration,
      if (orchestratorConfigurationList != null)
        'orchestratorConfigurationList': orchestratorConfigurationList,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class DependencyFailedException extends _s.GenericAwsException {
  DependencyFailedException({String? type, String? message})
      : super(type: type, code: 'DependencyFailedException', message: message);
}

/// @nodoc
class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
}

/// @nodoc
class RequestTimeoutException extends _s.GenericAwsException {
  RequestTimeoutException({String? type, String? message})
      : super(type: type, code: 'RequestTimeoutException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

/// @nodoc
class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

/// @nodoc
class UnprocessableContentException extends _s.GenericAwsException {
  UnprocessableContentException({String? type, String? message})
      : super(
            type: type,
            code: 'UnprocessableContentException',
            message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DependencyFailedException': (type, message) =>
      DependencyFailedException(type: type, message: message),
  'PreconditionFailedException': (type, message) =>
      PreconditionFailedException(type: type, message: message),
  'RequestTimeoutException': (type, message) =>
      RequestTimeoutException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'UnprocessableContentException': (type, message) =>
      UnprocessableContentException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
