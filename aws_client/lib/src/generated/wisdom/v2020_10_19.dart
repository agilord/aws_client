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

/// Amazon Connect Wisdom delivers agents the information they need to solve
/// customer issues as they're actively speaking with customers. Agents can
/// search across connected repositories from within their agent desktop to find
/// answers quickly. Use Amazon Connect Wisdom to create an assistant and a
/// knowledge base, for example, or manage content by uploading custom files.
class ConnectWisdom {
  final _s.RestJsonProtocol _protocol;
  ConnectWisdom({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'wisdom',
            signingName: 'wisdom',
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

  /// Creates an Amazon Connect Wisdom assistant.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
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
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [description] :
  /// The description of the assistant.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// The KMS key used for encryption.
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
      'type': type.toValue(),
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

  /// Creates an association between an Amazon Connect Wisdom assistant and
  /// another resource. Currently, the only supported association is with a
  /// knowledge base. An assistant can have only a single association.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
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
      'associationType': associationType.toValue(),
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

  /// Creates Wisdom content. Before to calling this API, use <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>
  /// to upload an asset.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [name] :
  /// The name of the content. Each piece of content in a knowledge base must
  /// have a unique name. You can retrieve a piece of content using only its
  /// knowledge base and its name with the <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_SearchContent.html">SearchContent</a>
  /// API.
  ///
  /// Parameter [uploadId] :
  /// A pointer to the uploaded asset. This value is returned by <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [metadata] :
  /// A key/value map to store attributes without affecting tagging or
  /// recommendations. For example, when synchronizing data between an external
  /// system and Wisdom, you can store an external version identifier as
  /// metadata to utilize for determining drift.
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
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_DeleteKnowledgeBase.html">DeleteKnowledgeBase</a>.
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
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
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
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [renderingConfiguration] :
  /// Information about how to render the content.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// The KMS key used for encryption.
  ///
  /// Parameter [sourceConfiguration] :
  /// The source of the knowledge base content. Only set this argument for
  /// EXTERNAL knowledge bases.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateKnowledgeBaseResponse> createKnowledgeBase({
    required KnowledgeBaseType knowledgeBaseType,
    required String name,
    String? clientToken,
    String? description,
    RenderingConfiguration? renderingConfiguration,
    ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration,
    SourceConfiguration? sourceConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'knowledgeBaseType': knowledgeBaseType.toValue(),
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
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/knowledgeBases',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKnowledgeBaseResponse.fromJson(response);
  }

  /// Creates a session. A session is a contextual container used for generating
  /// recommendations. Amazon Connect creates a new Wisdom session for each
  /// contact on which Wisdom is enabled.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [name] :
  /// The name of the session.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateSessionResponse> createSession({
    required String assistantId,
    required String name,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
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

  /// Deletes an assistant.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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

  /// Deletes an assistant association.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantAssociationId] :
  /// The identifier of the assistant association. Can be either the ID or the
  /// ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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

  /// Deletes the content.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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

  /// Retrieves information about an assistant.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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

  /// Retrieves information about an assistant association.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantAssociationId] :
  /// The identifier of the assistant association. Can be either the ID or the
  /// ARN. URLs cannot contain the ARN.
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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

  /// Retrieves content, including a pre-signed URL to download the content.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [contentId] :
  /// The identifier of the content. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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

  /// Retrieves summary information about the content.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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

  /// Retrieves information about the knowledge base.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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

  /// Retrieves recommendations for the specified session. To avoid retrieving
  /// the same recommendations in subsequent calls, use <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_NotifyRecommendationsReceived.html">NotifyRecommendationsReceived</a>.
  /// This API supports long-polling behavior with the
  /// <code>waitTimeSeconds</code> parameter. Short poll is the default behavior
  /// and only returns recommendations already available. To perform a manual
  /// query against an assistant, use <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_QueryAssistant.html">QueryAssistant</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
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

  /// Retrieves information for a specified session.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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

  /// Lists information about assistant associations.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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

  /// Lists information about assistants.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Lists the content.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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

  /// Lists the knowledge bases.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Removes the specified recommendations from the specified assistant's queue
  /// of newly available recommendations. You can use this API in conjunction
  /// with <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_GetRecommendations.html">GetRecommendations</a>
  /// and a <code>waitTimeSeconds</code> input for long-polling behavior and
  /// avoiding duplicate recommendations.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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

  /// Performs a manual search against the specified assistant. To retrieve
  /// recommendations for an assistant, use <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_GetRecommendations.html">GetRecommendations</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  ///
  /// Parameter [queryText] :
  /// The text to search for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<QueryAssistantResponse> queryAssistant({
    required String assistantId,
    required String queryText,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'queryText': queryText,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assistants/${Uri.encodeComponent(assistantId)}/query',
      exceptionFnMap: _exceptionFns,
    );
    return QueryAssistantResponse.fromJson(response);
  }

  /// Removes a URI template from a knowledge base.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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

  /// Searches for sessions.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assistantId] :
  /// The identifier of the Wisdom assistant. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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

  /// Get a URL to upload content to a knowledge base. To upload content, first
  /// make a PUT request to the returned URL with your file, making sure to
  /// include the required headers. Then use <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_CreateContent.html">CreateContent</a>
  /// to finalize the content creation process or <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_UpdateContent.html">UpdateContent</a>
  /// to modify an existing resource. You can only upload content to a knowledge
  /// base of type CUSTOM.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [contentType] :
  /// The type of content to upload.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
  Future<StartContentUploadResponse> startContentUpload({
    required String contentType,
    required String knowledgeBaseId,
  }) async {
    final $payload = <String, dynamic>{
      'contentType': contentType,
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

  /// Adds the specified tags to the specified resource.
  ///
  /// May throw [TooManyTagsException].
  /// May throw [ResourceNotFoundException].
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

  /// Updates information about the content.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [contentId] :
  /// The identifier of the content. Can be either the ID or the ARN. URLs
  /// cannot contain the ARN.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN
  ///
  /// Parameter [metadata] :
  /// A key/value map to store attributes without affecting tagging or
  /// recommendations. For example, when synchronizing data between an external
  /// system and Wisdom, you can store an external version identifier as
  /// metadata to utilize for determining drift.
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
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>.
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

  /// Updates the template URI of a knowledge base. This is only supported for
  /// knowledge bases of type EXTERNAL. Include a single variable in
  /// <code>${variable}</code> format; this interpolated by Wisdom using
  /// ingested content. For example, if you ingest a Salesforce article, it has
  /// an <code>Id</code> value, and you can set the template URI to
  /// <code>https://myInstanceName.lightning.force.com/lightning/r/Knowledge__kav/*${Id}*/view</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. Can be either the ID or the ARN.
  /// URLs cannot contain the ARN.
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
}

/// Configuration information for Amazon AppIntegrations to automatically ingest
/// content.
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
  /// href="https://learn.microsoft.com/en-us/sharepoint/dev/sp-add-ins/sharepoint-net-server-csom-jsom-and-rest-api-index">
  /// SharePoint</a>, your AppIntegrations DataIntegration must have a
  /// FileConfiguration, including only file extensions that are among
  /// <code>docx</code>, <code>pdf</code>, <code>html</code>, <code>htm</code>,
  /// and <code>txt</code>.
  /// </li>
  /// </ul>
  final String appIntegrationArn;

  /// The fields from the source that are made available to your agents in Wisdom.
  /// Optional if ObjectConfiguration is included in the provided DataIntegration.
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
      appIntegrationArn: json['appIntegrationArn'] as String,
      objectFields: (json['objectFields'] as List?)
          ?.whereNotNull()
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

/// Information about the assistant association.
class AssistantAssociationData {
  /// The Amazon Resource Name (ARN) of the Wisdom assistant.
  final String assistantArn;

  /// The Amazon Resource Name (ARN) of the assistant association.
  final String assistantAssociationArn;

  /// The identifier of the assistant association.
  final String assistantAssociationId;

  /// The identifier of the Wisdom assistant.
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
      assistantArn: json['assistantArn'] as String,
      assistantAssociationArn: json['assistantAssociationArn'] as String,
      assistantAssociationId: json['assistantAssociationId'] as String,
      assistantId: json['assistantId'] as String,
      associationData: AssistantAssociationOutputData.fromJson(
          json['associationData'] as Map<String, dynamic>),
      associationType: (json['associationType'] as String).toAssociationType(),
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
      'associationType': associationType.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// The data that is input into Wisdom as a result of the assistant association.
class AssistantAssociationInputData {
  /// The identifier of the knowledge base.
  final String? knowledgeBaseId;

  AssistantAssociationInputData({
    this.knowledgeBaseId,
  });

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    return {
      if (knowledgeBaseId != null) 'knowledgeBaseId': knowledgeBaseId,
    };
  }
}

/// The data that is output as a result of the assistant association.
class AssistantAssociationOutputData {
  /// The knowledge base where output data is sent.
  final KnowledgeBaseAssociationData? knowledgeBaseAssociation;

  AssistantAssociationOutputData({
    this.knowledgeBaseAssociation,
  });

  factory AssistantAssociationOutputData.fromJson(Map<String, dynamic> json) {
    return AssistantAssociationOutputData(
      knowledgeBaseAssociation: json['knowledgeBaseAssociation'] != null
          ? KnowledgeBaseAssociationData.fromJson(
              json['knowledgeBaseAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseAssociation = this.knowledgeBaseAssociation;
    return {
      if (knowledgeBaseAssociation != null)
        'knowledgeBaseAssociation': knowledgeBaseAssociation,
    };
  }
}

/// Summary information about the assistant association.
class AssistantAssociationSummary {
  /// The Amazon Resource Name (ARN) of the Wisdom assistant.
  final String assistantArn;

  /// The Amazon Resource Name (ARN) of the assistant association.
  final String assistantAssociationArn;

  /// The identifier of the assistant association.
  final String assistantAssociationId;

  /// The identifier of the Wisdom assistant.
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
      assistantArn: json['assistantArn'] as String,
      assistantAssociationArn: json['assistantAssociationArn'] as String,
      assistantAssociationId: json['assistantAssociationId'] as String,
      assistantId: json['assistantId'] as String,
      associationData: AssistantAssociationOutputData.fromJson(
          json['associationData'] as Map<String, dynamic>),
      associationType: (json['associationType'] as String).toAssociationType(),
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
      'associationType': associationType.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// The assistant data.
class AssistantData {
  /// The Amazon Resource Name (ARN) of the Wisdom assistant.
  final String assistantArn;

  /// The identifier of the Wisdom assistant.
  final String assistantId;

  /// The name.
  final String name;

  /// The status of the assistant.
  final AssistantStatus status;

  /// The type of assistant.
  final AssistantType type;

  /// The description.
  final String? description;

  /// The KMS key used for encryption.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AssistantData({
    required this.assistantArn,
    required this.assistantId,
    required this.name,
    required this.status,
    required this.type,
    this.description,
    this.serverSideEncryptionConfiguration,
    this.tags,
  });

  factory AssistantData.fromJson(Map<String, dynamic> json) {
    return AssistantData(
      assistantArn: json['assistantArn'] as String,
      assistantId: json['assistantId'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toAssistantStatus(),
      type: (json['type'] as String).toAssistantType(),
      description: json['description'] as String?,
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
    final description = this.description;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final tags = this.tags;
    return {
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'name': name,
      'status': status.toValue(),
      'type': type.toValue(),
      if (description != null) 'description': description,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

enum AssistantStatus {
  createInProgress,
  createFailed,
  active,
  deleteInProgress,
  deleteFailed,
  deleted,
}

extension AssistantStatusValueExtension on AssistantStatus {
  String toValue() {
    switch (this) {
      case AssistantStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case AssistantStatus.createFailed:
        return 'CREATE_FAILED';
      case AssistantStatus.active:
        return 'ACTIVE';
      case AssistantStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case AssistantStatus.deleteFailed:
        return 'DELETE_FAILED';
      case AssistantStatus.deleted:
        return 'DELETED';
    }
  }
}

extension AssistantStatusFromString on String {
  AssistantStatus toAssistantStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return AssistantStatus.createInProgress;
      case 'CREATE_FAILED':
        return AssistantStatus.createFailed;
      case 'ACTIVE':
        return AssistantStatus.active;
      case 'DELETE_IN_PROGRESS':
        return AssistantStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return AssistantStatus.deleteFailed;
      case 'DELETED':
        return AssistantStatus.deleted;
    }
    throw Exception('$this is not known in enum AssistantStatus');
  }
}

/// Summary information about the assistant.
class AssistantSummary {
  /// The Amazon Resource Name (ARN) of the Wisdom assistant.
  final String assistantArn;

  /// The identifier of the Wisdom assistant.
  final String assistantId;

  /// The name of the assistant.
  final String name;

  /// The status of the assistant.
  final AssistantStatus status;

  /// The type of the assistant.
  final AssistantType type;

  /// The description of the assistant.
  final String? description;

  /// The KMS key used for encryption.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  AssistantSummary({
    required this.assistantArn,
    required this.assistantId,
    required this.name,
    required this.status,
    required this.type,
    this.description,
    this.serverSideEncryptionConfiguration,
    this.tags,
  });

  factory AssistantSummary.fromJson(Map<String, dynamic> json) {
    return AssistantSummary(
      assistantArn: json['assistantArn'] as String,
      assistantId: json['assistantId'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toAssistantStatus(),
      type: (json['type'] as String).toAssistantType(),
      description: json['description'] as String?,
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
    final description = this.description;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final tags = this.tags;
    return {
      'assistantArn': assistantArn,
      'assistantId': assistantId,
      'name': name,
      'status': status.toValue(),
      'type': type.toValue(),
      if (description != null) 'description': description,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

enum AssistantType {
  agent,
}

extension AssistantTypeValueExtension on AssistantType {
  String toValue() {
    switch (this) {
      case AssistantType.agent:
        return 'AGENT';
    }
  }
}

extension AssistantTypeFromString on String {
  AssistantType toAssistantType() {
    switch (this) {
      case 'AGENT':
        return AssistantType.agent;
    }
    throw Exception('$this is not known in enum AssistantType');
  }
}

enum AssociationType {
  knowledgeBase,
}

extension AssociationTypeValueExtension on AssociationType {
  String toValue() {
    switch (this) {
      case AssociationType.knowledgeBase:
        return 'KNOWLEDGE_BASE';
    }
  }
}

extension AssociationTypeFromString on String {
  AssociationType toAssociationType() {
    switch (this) {
      case 'KNOWLEDGE_BASE':
        return AssociationType.knowledgeBase;
    }
    throw Exception('$this is not known in enum AssociationType');
  }
}

/// Information about the content.
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
  /// system and Wisdom, you can store an external version identifier as metadata
  /// to utilize for determining drift.
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
      contentArn: json['contentArn'] as String,
      contentId: json['contentId'] as String,
      contentType: json['contentType'] as String,
      knowledgeBaseArn: json['knowledgeBaseArn'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      metadata: (json['metadata'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      name: json['name'] as String,
      revisionId: json['revisionId'] as String,
      status: (json['status'] as String).toContentStatus(),
      title: json['title'] as String,
      url: json['url'] as String,
      urlExpiry: nonNullableTimeStampFromJson(json['urlExpiry'] as Object),
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
      'status': status.toValue(),
      'title': title,
      'url': url,
      'urlExpiry': unixTimestampToJson(urlExpiry),
      if (linkOutUri != null) 'linkOutUri': linkOutUri,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Reference information about the content.
class ContentReference {
  /// The Amazon Resource Name (ARN) of the content.
  final String? contentArn;

  /// The identifier of the content.
  final String? contentId;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String? knowledgeBaseArn;

  /// The identifier of the knowledge base.
  final String? knowledgeBaseId;

  ContentReference({
    this.contentArn,
    this.contentId,
    this.knowledgeBaseArn,
    this.knowledgeBaseId,
  });

  factory ContentReference.fromJson(Map<String, dynamic> json) {
    return ContentReference(
      contentArn: json['contentArn'] as String?,
      contentId: json['contentId'] as String?,
      knowledgeBaseArn: json['knowledgeBaseArn'] as String?,
      knowledgeBaseId: json['knowledgeBaseId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentArn = this.contentArn;
    final contentId = this.contentId;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    return {
      if (contentArn != null) 'contentArn': contentArn,
      if (contentId != null) 'contentId': contentId,
      if (knowledgeBaseArn != null) 'knowledgeBaseArn': knowledgeBaseArn,
      if (knowledgeBaseId != null) 'knowledgeBaseId': knowledgeBaseId,
    };
  }
}

enum ContentStatus {
  createInProgress,
  createFailed,
  active,
  deleteInProgress,
  deleteFailed,
  deleted,
  updateFailed,
}

extension ContentStatusValueExtension on ContentStatus {
  String toValue() {
    switch (this) {
      case ContentStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case ContentStatus.createFailed:
        return 'CREATE_FAILED';
      case ContentStatus.active:
        return 'ACTIVE';
      case ContentStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case ContentStatus.deleteFailed:
        return 'DELETE_FAILED';
      case ContentStatus.deleted:
        return 'DELETED';
      case ContentStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension ContentStatusFromString on String {
  ContentStatus toContentStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return ContentStatus.createInProgress;
      case 'CREATE_FAILED':
        return ContentStatus.createFailed;
      case 'ACTIVE':
        return ContentStatus.active;
      case 'DELETE_IN_PROGRESS':
        return ContentStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return ContentStatus.deleteFailed;
      case 'DELETED':
        return ContentStatus.deleted;
      case 'UPDATE_FAILED':
        return ContentStatus.updateFailed;
    }
    throw Exception('$this is not known in enum ContentStatus');
  }
}

/// Summary information about the content.
class ContentSummary {
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
  /// system and Wisdom, you can store an external version identifier as metadata
  /// to utilize for determining drift.
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
      contentArn: json['contentArn'] as String,
      contentId: json['contentId'] as String,
      contentType: json['contentType'] as String,
      knowledgeBaseArn: json['knowledgeBaseArn'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      metadata: (json['metadata'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      name: json['name'] as String,
      revisionId: json['revisionId'] as String,
      status: (json['status'] as String).toContentStatus(),
      title: json['title'] as String,
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
      'status': status.toValue(),
      'title': title,
      if (tags != null) 'tags': tags,
    };
  }
}

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

class DeleteAssistantAssociationResponse {
  DeleteAssistantAssociationResponse();

  factory DeleteAssistantAssociationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAssistantAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAssistantResponse {
  DeleteAssistantResponse();

  factory DeleteAssistantResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAssistantResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteContentResponse {
  DeleteContentResponse();

  factory DeleteContentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteContentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteKnowledgeBaseResponse {
  DeleteKnowledgeBaseResponse();

  factory DeleteKnowledgeBaseResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKnowledgeBaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The document.
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
          json['contentReference'] as Map<String, dynamic>),
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

/// The text of the document.
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
          ?.whereNotNull()
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

/// A search filter.
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
      'field': field.toValue(),
      'operator': operator.toValue(),
      'value': value,
    };
  }
}

enum FilterField {
  name,
}

extension FilterFieldValueExtension on FilterField {
  String toValue() {
    switch (this) {
      case FilterField.name:
        return 'NAME';
    }
  }
}

extension FilterFieldFromString on String {
  FilterField toFilterField() {
    switch (this) {
      case 'NAME':
        return FilterField.name;
    }
    throw Exception('$this is not known in enum FilterField');
  }
}

enum FilterOperator {
  equals,
}

extension FilterOperatorValueExtension on FilterOperator {
  String toValue() {
    switch (this) {
      case FilterOperator.equals:
        return 'EQUALS';
    }
  }
}

extension FilterOperatorFromString on String {
  FilterOperator toFilterOperator() {
    switch (this) {
      case 'EQUALS':
        return FilterOperator.equals;
    }
    throw Exception('$this is not known in enum FilterOperator');
  }
}

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
      recommendations: (json['recommendations'] as List)
          .whereNotNull()
          .map((e) => RecommendationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      triggers: (json['triggers'] as List?)
          ?.whereNotNull()
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

/// Offset specification to describe highlighting of document excerpts for
/// rendering search results and recommendations.
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

/// Association information about the knowledge base.
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

/// Information about the knowledge base.
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

  /// An epoch timestamp indicating the most recent content modification inside
  /// the knowledge base. If no content exists in a knowledge base, this value is
  /// unset.
  final DateTime? lastContentModificationTime;

  /// Information about how to render the content.
  final RenderingConfiguration? renderingConfiguration;

  /// The KMS key used for encryption.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// Source configuration information about the knowledge base.
  final SourceConfiguration? sourceConfiguration;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  KnowledgeBaseData({
    required this.knowledgeBaseArn,
    required this.knowledgeBaseId,
    required this.knowledgeBaseType,
    required this.name,
    required this.status,
    this.description,
    this.lastContentModificationTime,
    this.renderingConfiguration,
    this.serverSideEncryptionConfiguration,
    this.sourceConfiguration,
    this.tags,
  });

  factory KnowledgeBaseData.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseData(
      knowledgeBaseArn: json['knowledgeBaseArn'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      knowledgeBaseType:
          (json['knowledgeBaseType'] as String).toKnowledgeBaseType(),
      name: json['name'] as String,
      status: (json['status'] as String).toKnowledgeBaseStatus(),
      description: json['description'] as String?,
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
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseId = this.knowledgeBaseId;
    final knowledgeBaseType = this.knowledgeBaseType;
    final name = this.name;
    final status = this.status;
    final description = this.description;
    final lastContentModificationTime = this.lastContentModificationTime;
    final renderingConfiguration = this.renderingConfiguration;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final sourceConfiguration = this.sourceConfiguration;
    final tags = this.tags;
    return {
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'knowledgeBaseType': knowledgeBaseType.toValue(),
      'name': name,
      'status': status.toValue(),
      if (description != null) 'description': description,
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
    };
  }
}

enum KnowledgeBaseStatus {
  createInProgress,
  createFailed,
  active,
  deleteInProgress,
  deleteFailed,
  deleted,
}

extension KnowledgeBaseStatusValueExtension on KnowledgeBaseStatus {
  String toValue() {
    switch (this) {
      case KnowledgeBaseStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case KnowledgeBaseStatus.createFailed:
        return 'CREATE_FAILED';
      case KnowledgeBaseStatus.active:
        return 'ACTIVE';
      case KnowledgeBaseStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case KnowledgeBaseStatus.deleteFailed:
        return 'DELETE_FAILED';
      case KnowledgeBaseStatus.deleted:
        return 'DELETED';
    }
  }
}

extension KnowledgeBaseStatusFromString on String {
  KnowledgeBaseStatus toKnowledgeBaseStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return KnowledgeBaseStatus.createInProgress;
      case 'CREATE_FAILED':
        return KnowledgeBaseStatus.createFailed;
      case 'ACTIVE':
        return KnowledgeBaseStatus.active;
      case 'DELETE_IN_PROGRESS':
        return KnowledgeBaseStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return KnowledgeBaseStatus.deleteFailed;
      case 'DELETED':
        return KnowledgeBaseStatus.deleted;
    }
    throw Exception('$this is not known in enum KnowledgeBaseStatus');
  }
}

/// Summary information about the knowledge base.
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

  /// The KMS key used for encryption.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// Configuration information about the external data source.
  final SourceConfiguration? sourceConfiguration;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

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
  });

  factory KnowledgeBaseSummary.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseSummary(
      knowledgeBaseArn: json['knowledgeBaseArn'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      knowledgeBaseType:
          (json['knowledgeBaseType'] as String).toKnowledgeBaseType(),
      name: json['name'] as String,
      status: (json['status'] as String).toKnowledgeBaseStatus(),
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
    return {
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'knowledgeBaseType': knowledgeBaseType.toValue(),
      'name': name,
      'status': status.toValue(),
      if (description != null) 'description': description,
      if (renderingConfiguration != null)
        'renderingConfiguration': renderingConfiguration,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (sourceConfiguration != null)
        'sourceConfiguration': sourceConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

enum KnowledgeBaseType {
  external,
  custom,
}

extension KnowledgeBaseTypeValueExtension on KnowledgeBaseType {
  String toValue() {
    switch (this) {
      case KnowledgeBaseType.external:
        return 'EXTERNAL';
      case KnowledgeBaseType.custom:
        return 'CUSTOM';
    }
  }
}

extension KnowledgeBaseTypeFromString on String {
  KnowledgeBaseType toKnowledgeBaseType() {
    switch (this) {
      case 'EXTERNAL':
        return KnowledgeBaseType.external;
      case 'CUSTOM':
        return KnowledgeBaseType.custom;
    }
    throw Exception('$this is not known in enum KnowledgeBaseType');
  }
}

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
      assistantAssociationSummaries: (json['assistantAssociationSummaries']
              as List)
          .whereNotNull()
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
      assistantSummaries: (json['assistantSummaries'] as List)
          .whereNotNull()
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
      contentSummaries: (json['contentSummaries'] as List)
          .whereNotNull()
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
      knowledgeBaseSummaries: (json['knowledgeBaseSummaries'] as List)
          .whereNotNull()
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

/// An error occurred when creating a recommendation.
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
          ?.whereNotNull()
          .map((e) => NotifyRecommendationsReceivedError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      recommendationIds: (json['recommendationIds'] as List?)
          ?.whereNotNull()
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
      results: (json['results'] as List)
          .whereNotNull()
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

/// Data associated with the QUERY RecommendationTriggerType.
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
class RecommendationData {
  /// The recommended document.
  final Document document;

  /// The identifier of the recommendation.
  final String recommendationId;

  /// The relevance level of the recommendation.
  final RelevanceLevel? relevanceLevel;

  /// The relevance score of the recommendation.
  final double? relevanceScore;

  /// The type of recommendation.
  final RecommendationType? type;

  RecommendationData({
    required this.document,
    required this.recommendationId,
    this.relevanceLevel,
    this.relevanceScore,
    this.type,
  });

  factory RecommendationData.fromJson(Map<String, dynamic> json) {
    return RecommendationData(
      document: Document.fromJson(json['document'] as Map<String, dynamic>),
      recommendationId: json['recommendationId'] as String,
      relevanceLevel: (json['relevanceLevel'] as String?)?.toRelevanceLevel(),
      relevanceScore: json['relevanceScore'] as double?,
      type: (json['type'] as String?)?.toRecommendationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    final recommendationId = this.recommendationId;
    final relevanceLevel = this.relevanceLevel;
    final relevanceScore = this.relevanceScore;
    final type = this.type;
    return {
      'document': document,
      'recommendationId': recommendationId,
      if (relevanceLevel != null) 'relevanceLevel': relevanceLevel.toValue(),
      if (relevanceScore != null) 'relevanceScore': relevanceScore,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum RecommendationSourceType {
  issueDetection,
  ruleEvaluation,
  other,
}

extension RecommendationSourceTypeValueExtension on RecommendationSourceType {
  String toValue() {
    switch (this) {
      case RecommendationSourceType.issueDetection:
        return 'ISSUE_DETECTION';
      case RecommendationSourceType.ruleEvaluation:
        return 'RULE_EVALUATION';
      case RecommendationSourceType.other:
        return 'OTHER';
    }
  }
}

extension RecommendationSourceTypeFromString on String {
  RecommendationSourceType toRecommendationSourceType() {
    switch (this) {
      case 'ISSUE_DETECTION':
        return RecommendationSourceType.issueDetection;
      case 'RULE_EVALUATION':
        return RecommendationSourceType.ruleEvaluation;
      case 'OTHER':
        return RecommendationSourceType.other;
    }
    throw Exception('$this is not known in enum RecommendationSourceType');
  }
}

/// A recommendation trigger provides context on the event that produced the
/// referenced recommendations. Recommendations are only referenced in
/// <code>recommendationIds</code> by a single RecommendationTrigger.
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
          json['data'] as Map<String, dynamic>),
      id: json['id'] as String,
      recommendationIds: (json['recommendationIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      source: (json['source'] as String).toRecommendationSourceType(),
      type: (json['type'] as String).toRecommendationTriggerType(),
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
      'source': source.toValue(),
      'type': type.toValue(),
    };
  }
}

/// A union type containing information related to the trigger.
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

enum RecommendationTriggerType {
  query,
}

extension RecommendationTriggerTypeValueExtension on RecommendationTriggerType {
  String toValue() {
    switch (this) {
      case RecommendationTriggerType.query:
        return 'QUERY';
    }
  }
}

extension RecommendationTriggerTypeFromString on String {
  RecommendationTriggerType toRecommendationTriggerType() {
    switch (this) {
      case 'QUERY':
        return RecommendationTriggerType.query;
    }
    throw Exception('$this is not known in enum RecommendationTriggerType');
  }
}

enum RecommendationType {
  knowledgeContent,
}

extension RecommendationTypeValueExtension on RecommendationType {
  String toValue() {
    switch (this) {
      case RecommendationType.knowledgeContent:
        return 'KNOWLEDGE_CONTENT';
    }
  }
}

extension RecommendationTypeFromString on String {
  RecommendationType toRecommendationType() {
    switch (this) {
      case 'KNOWLEDGE_CONTENT':
        return RecommendationType.knowledgeContent;
    }
    throw Exception('$this is not known in enum RecommendationType');
  }
}

enum RelevanceLevel {
  high,
  medium,
  low,
}

extension RelevanceLevelValueExtension on RelevanceLevel {
  String toValue() {
    switch (this) {
      case RelevanceLevel.high:
        return 'HIGH';
      case RelevanceLevel.medium:
        return 'MEDIUM';
      case RelevanceLevel.low:
        return 'LOW';
    }
  }
}

extension RelevanceLevelFromString on String {
  RelevanceLevel toRelevanceLevel() {
    switch (this) {
      case 'HIGH':
        return RelevanceLevel.high;
      case 'MEDIUM':
        return RelevanceLevel.medium;
      case 'LOW':
        return RelevanceLevel.low;
    }
    throw Exception('$this is not known in enum RelevanceLevel');
  }
}

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

/// Information about how to render the content.
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
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_GetContent.html">GetContent</a>.
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

/// Information about the result.
class ResultData {
  /// The document.
  final Document document;

  /// The identifier of the result data.
  final String resultId;

  /// The relevance score of the results.
  final double? relevanceScore;

  ResultData({
    required this.document,
    required this.resultId,
    this.relevanceScore,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) {
    return ResultData(
      document: Document.fromJson(json['document'] as Map<String, dynamic>),
      resultId: json['resultId'] as String,
      relevanceScore: json['relevanceScore'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    final resultId = this.resultId;
    final relevanceScore = this.relevanceScore;
    return {
      'document': document,
      'resultId': resultId,
      if (relevanceScore != null) 'relevanceScore': relevanceScore,
    };
  }
}

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
      contentSummaries: (json['contentSummaries'] as List)
          .whereNotNull()
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

/// The search expression.
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
      sessionSummaries: (json['sessionSummaries'] as List)
          .whereNotNull()
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

/// The KMS key used for encryption.
class ServerSideEncryptionConfiguration {
  /// The KMS key. For information about valid ID values, see <a
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

/// Information about the session.
class SessionData {
  /// The name of the session.
  final String name;

  /// The Amazon Resource Name (ARN) of the session.
  final String sessionArn;

  /// The identifier of the session.
  final String sessionId;

  /// The description of the session.
  final String? description;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  SessionData({
    required this.name,
    required this.sessionArn,
    required this.sessionId,
    this.description,
    this.tags,
  });

  factory SessionData.fromJson(Map<String, dynamic> json) {
    return SessionData(
      name: json['name'] as String,
      sessionArn: json['sessionArn'] as String,
      sessionId: json['sessionId'] as String,
      description: json['description'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    final description = this.description;
    final tags = this.tags;
    return {
      'name': name,
      'sessionArn': sessionArn,
      'sessionId': sessionId,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Summary information about the session.
class SessionSummary {
  /// The Amazon Resource Name (ARN) of the Wisdom assistant.
  final String assistantArn;

  /// The identifier of the Wisdom assistant.
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
      assistantArn: json['assistantArn'] as String,
      assistantId: json['assistantId'] as String,
      sessionArn: json['sessionArn'] as String,
      sessionId: json['sessionId'] as String,
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

/// Configuration information about the external data source.
class SourceConfiguration {
  /// Configuration information for Amazon AppIntegrations to automatically ingest
  /// content.
  final AppIntegrationsConfiguration? appIntegrations;

  SourceConfiguration({
    this.appIntegrations,
  });

  factory SourceConfiguration.fromJson(Map<String, dynamic> json) {
    return SourceConfiguration(
      appIntegrations: json['appIntegrations'] != null
          ? AppIntegrationsConfiguration.fromJson(
              json['appIntegrations'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appIntegrations = this.appIntegrations;
    return {
      if (appIntegrations != null) 'appIntegrations': appIntegrations,
    };
  }
}

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
      headersToInclude: (json['headersToInclude'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      uploadId: json['uploadId'] as String,
      url: json['url'] as String,
      urlExpiry: nonNullableTimeStampFromJson(json['urlExpiry'] as Object),
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
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
  'PreconditionFailedException': (type, message) =>
      PreconditionFailedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
