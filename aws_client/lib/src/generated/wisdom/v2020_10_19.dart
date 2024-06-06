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
  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// The customer managed key must have a policy that allows
  /// <code>kms:CreateGrant</code>, <code> kms:DescribeKey</code>, and
  /// <code>kms:Decrypt/kms:GenerateDataKey</code> permissions to the IAM
  /// identity using the key to invoke Wisdom. To use Wisdom with chat, the key
  /// policy must also allow <code>kms:Decrypt</code>,
  /// <code>kms:GenerateDataKey*</code>, and <code>kms:DescribeKey</code>
  /// permissions to the <code>connect.amazonaws.com</code> service principal.
  ///
  /// For more information about setting up a customer managed key for Wisdom,
  /// see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-wisdom.html">Enable
  /// Amazon Connect Wisdom for your instance</a>.
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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
  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// This KMS key must have a policy that allows <code>kms:CreateGrant</code>,
  /// <code>kms:DescribeKey</code>, and
  /// <code>kms:Decrypt/kms:GenerateDataKey</code> permissions to the IAM
  /// identity using the key to invoke Wisdom.
  ///
  /// For more information about setting up a customer managed key for Wisdom,
  /// see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-wisdom.html">Enable
  /// Amazon Connect Wisdom for your instance</a>.
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

  /// Creates a Wisdom quick response.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [content] :
  /// The content of the quick response.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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

  /// Deletes the quick response import job.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [importJobId] :
  /// The identifier of the import job to be deleted.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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

  /// Deletes a quick response.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The knowledge base from which the quick response is deleted. The
  /// identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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

  /// Retrieves the started import job.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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

  /// Retrieves information about the knowledge base.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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

  /// Retrieves the quick response.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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
  @Deprecated(
      'GetRecommendations API will be discontinued starting June 1, 2024. To receive generative responses after March 1, 2024 you will need to create a new Assistant in the Connect console and integrate the Amazon Q in Connect JavaScript library (amazon-q-connectjs) into your applications.')
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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

  /// Lists information about import jobs.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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

  /// Lists information about quick response.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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
  /// May throw [RequestTimeoutException].
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
  @Deprecated(
      'QueryAssistant API will be discontinued starting June 1, 2024. To receive generative responses after March 1, 2024 you will need to create a new Assistant in the Connect console and integrate the Amazon Q in Connect JavaScript library (amazon-q-connectjs) into your applications.')
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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

  /// Searches existing Wisdom quick responses in a Wisdom knowledge base.
  ///
  /// May throw [RequestTimeoutException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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

  /// Start an asynchronous job to import Wisdom resources from an uploaded
  /// source file. Before calling this API, use <a
  /// href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_StartContentUpload.html">StartContentUpload</a>
  /// to upload an asset that contains the resource data.
  ///
  /// <ul>
  /// <li>
  /// For importing Wisdom quick responses, you need to upload a csv file
  /// including the quick responses. For information about how to format the csv
  /// file for importing quick responses, see <a
  /// href="https://docs.aws.amazon.com/console/connect/quick-responses/add-data">Import
  /// quick responses</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
  ///
  /// <ul>
  /// <li>
  /// For importing Wisdom quick responses, this should be a
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
  /// The metadata fields of the imported Wisdom resources.
  Future<StartImportJobResponse> startImportJob({
    required ImportJobType importJobType,
    required String knowledgeBaseId,
    required String uploadId,
    String? clientToken,
    ExternalSourceConfiguration? externalSourceConfiguration,
    Map<String, String>? metadata,
  }) async {
    final $payload = <String, dynamic>{
      'importJobType': importJobType.toValue(),
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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

  /// Updates an existing Wisdom quick response.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can
  /// be either the ID or the ARN. URLs cannot contain the ARN.
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
  /// href="https://learn.microsoft.com/en-us/sharepoint/dev/sp-add-ins/sharepoint-net-server-csom-jsom-and-rest-api-index">SharePoint</a>,
  /// your AppIntegrations DataIntegration must have a FileConfiguration,
  /// including only file extensions that are among <code>docx</code>,
  /// <code>pdf</code>, <code>html</code>, <code>htm</code>, and <code>txt</code>.
  /// </li>
  /// <li>
  /// For <a href="https://aws.amazon.com/s3/">Amazon S3</a>, the
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
  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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

  /// The configuration information for the Wisdom assistant integration.
  final AssistantIntegrationConfiguration? integrationConfiguration;

  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// This KMS key must have a policy that allows <code>kms:CreateGrant</code>,
  /// <code>kms:DescribeKey</code>, and
  /// <code>kms:Decrypt/kms:GenerateDataKey</code> permissions to the IAM identity
  /// using the key to invoke Wisdom. To use Wisdom with chat, the key policy must
  /// also allow <code>kms:Decrypt</code>, <code>kms:GenerateDataKey*</code>, and
  /// <code>kms:DescribeKey</code> permissions to the
  /// <code>connect.amazonaws.com</code> service principal.
  ///
  /// For more information about setting up a customer managed key for Wisdom, see
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-wisdom.html">Enable
  /// Amazon Connect Wisdom for your instance</a>.
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
    this.integrationConfiguration,
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
      integrationConfiguration: json['integrationConfiguration'] != null
          ? AssistantIntegrationConfiguration.fromJson(
              json['integrationConfiguration'] as Map<String, dynamic>)
          : null,
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
    final integrationConfiguration = this.integrationConfiguration;
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
      if (integrationConfiguration != null)
        'integrationConfiguration': integrationConfiguration,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The configuration information for the Wisdom assistant integration.
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

  /// The configuration information for the Wisdom assistant integration.
  final AssistantIntegrationConfiguration? integrationConfiguration;

  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// This KMS key must have a policy that allows <code>kms:CreateGrant</code>,
  /// <code>kms:DescribeKey</code>, and
  /// <code>kms:Decrypt/kms:GenerateDataKey</code> permissions to the IAM identity
  /// using the key to invoke Wisdom. To use Wisdom with chat, the key policy must
  /// also allow <code>kms:Decrypt</code>, <code>kms:GenerateDataKey*</code>, and
  /// <code>kms:DescribeKey</code> permissions to the
  /// <code>connect.amazonaws.com</code> service principal.
  ///
  /// For more information about setting up a customer managed key for Wisdom, see
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-wisdom.html">Enable
  /// Amazon Connect Wisdom for your instance</a>.
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
    this.integrationConfiguration,
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
      integrationConfiguration: json['integrationConfiguration'] != null
          ? AssistantIntegrationConfiguration.fromJson(
              json['integrationConfiguration'] as Map<String, dynamic>)
          : null,
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
    final integrationConfiguration = this.integrationConfiguration;
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
      if (integrationConfiguration != null)
        'integrationConfiguration': integrationConfiguration,
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

/// The configuration information of the external data source.
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

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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

class DeleteImportJobResponse {
  DeleteImportJobResponse();

  factory DeleteImportJobResponse.fromJson(Map<String, dynamic> _) {
    return DeleteImportJobResponse();
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

class DeleteQuickResponseResponse {
  DeleteQuickResponseResponse();

  factory DeleteQuickResponseResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQuickResponseResponse();
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

enum ExternalSource {
  amazonConnect,
}

extension ExternalSourceValueExtension on ExternalSource {
  String toValue() {
    switch (this) {
      case ExternalSource.amazonConnect:
        return 'AMAZON_CONNECT';
    }
  }
}

extension ExternalSourceFromString on String {
  ExternalSource toExternalSource() {
    switch (this) {
      case 'AMAZON_CONNECT':
        return ExternalSource.amazonConnect;
    }
    throw Exception('$this is not known in enum ExternalSource');
  }
}

/// The configuration information of the external data source.
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
      configuration:
          Configuration.fromJson(json['configuration'] as Map<String, dynamic>),
      source: (json['source'] as String).toExternalSource(),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final source = this.source;
    return {
      'configuration': configuration,
      'source': source.toValue(),
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

/// The configuration information of the grouping of Wisdom users.
class GroupingConfiguration {
  /// The criteria used for grouping Wisdom users.
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

  /// The list of values that define different groups of Wisdom users.
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
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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

/// Summary information about the import job.
class ImportJobData {
  /// The timestamp when the import job was created.
  final DateTime createdTime;

  /// The identifier of the import job.
  final String importJobId;

  /// The type of the import job.
  final ImportJobType importJobType;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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

  /// The link to donwload the information of resource data that failed to be
  /// imported.
  final String? failedRecordReport;

  /// The metadata fields of the imported Wisdom resources.
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
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      importJobId: json['importJobId'] as String,
      importJobType: (json['importJobType'] as String).toImportJobType(),
      knowledgeBaseArn: json['knowledgeBaseArn'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
      status: (json['status'] as String).toImportJobStatus(),
      uploadId: json['uploadId'] as String,
      url: json['url'] as String,
      urlExpiry: nonNullableTimeStampFromJson(json['urlExpiry'] as Object),
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
      'importJobType': importJobType.toValue(),
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'status': status.toValue(),
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

enum ImportJobStatus {
  startInProgress,
  failed,
  complete,
  deleteInProgress,
  deleteFailed,
  deleted,
}

extension ImportJobStatusValueExtension on ImportJobStatus {
  String toValue() {
    switch (this) {
      case ImportJobStatus.startInProgress:
        return 'START_IN_PROGRESS';
      case ImportJobStatus.failed:
        return 'FAILED';
      case ImportJobStatus.complete:
        return 'COMPLETE';
      case ImportJobStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case ImportJobStatus.deleteFailed:
        return 'DELETE_FAILED';
      case ImportJobStatus.deleted:
        return 'DELETED';
    }
  }
}

extension ImportJobStatusFromString on String {
  ImportJobStatus toImportJobStatus() {
    switch (this) {
      case 'START_IN_PROGRESS':
        return ImportJobStatus.startInProgress;
      case 'FAILED':
        return ImportJobStatus.failed;
      case 'COMPLETE':
        return ImportJobStatus.complete;
      case 'DELETE_IN_PROGRESS':
        return ImportJobStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return ImportJobStatus.deleteFailed;
      case 'DELETED':
        return ImportJobStatus.deleted;
    }
    throw Exception('$this is not known in enum ImportJobStatus');
  }
}

/// Summary information about the import job.
class ImportJobSummary {
  /// The timestamp when the import job was created.
  final DateTime createdTime;

  /// The identifier of the import job.
  final String importJobId;

  /// The type of import job.
  final ImportJobType importJobType;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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

  /// The metadata fields of the imported Wisdom resources.
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
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      importJobId: json['importJobId'] as String,
      importJobType: (json['importJobType'] as String).toImportJobType(),
      knowledgeBaseArn: json['knowledgeBaseArn'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
      status: (json['status'] as String).toImportJobStatus(),
      uploadId: json['uploadId'] as String,
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
      'importJobType': importJobType.toValue(),
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseId': knowledgeBaseId,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'status': status.toValue(),
      'uploadId': uploadId,
      if (externalSourceConfiguration != null)
        'externalSourceConfiguration': externalSourceConfiguration,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

enum ImportJobType {
  quickResponses,
}

extension ImportJobTypeValueExtension on ImportJobType {
  String toValue() {
    switch (this) {
      case ImportJobType.quickResponses:
        return 'QUICK_RESPONSES';
    }
  }
}

extension ImportJobTypeFromString on String {
  ImportJobType toImportJobType() {
    switch (this) {
      case 'QUICK_RESPONSES':
        return ImportJobType.quickResponses;
    }
    throw Exception('$this is not known in enum ImportJobType');
  }
}

/// Association information about the knowledge base.
class KnowledgeBaseAssociationData {
  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String? knowledgeBaseArn;

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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

  /// The configuration information for the customer managed key used for
  /// encryption.
  ///
  /// This KMS key must have a policy that allows <code>kms:CreateGrant</code>,
  /// <code>kms:DescribeKey</code>, and
  /// <code>kms:Decrypt/kms:GenerateDataKey</code> permissions to the IAM identity
  /// using the key to invoke Wisdom.
  ///
  /// For more information about setting up a customer managed key for Wisdom, see
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-wisdom.html">Enable
  /// Amazon Connect Wisdom for your instance</a>.
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

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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
  /// <code>kms:DescribeKey</code>, <code>kms:Decrypt/kms:GenerateDataKey</code>
  /// permissions to the IAM identity using the key to invoke Wisdom.
  ///
  /// For more information about setting up a customer managed key for Wisdom, see
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-wisdom.html">Enable
  /// Amazon Connect Wisdom for your instance</a>.
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
  quickResponses,
}

extension KnowledgeBaseTypeValueExtension on KnowledgeBaseType {
  String toValue() {
    switch (this) {
      case KnowledgeBaseType.external:
        return 'EXTERNAL';
      case KnowledgeBaseType.custom:
        return 'CUSTOM';
      case KnowledgeBaseType.quickResponses:
        return 'QUICK_RESPONSES';
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
      case 'QUICK_RESPONSES':
        return KnowledgeBaseType.quickResponses;
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
      importJobSummaries: (json['importJobSummaries'] as List)
          .whereNotNull()
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
      quickResponseSummaries: (json['quickResponseSummaries'] as List)
          .whereNotNull()
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

enum Order {
  asc,
  desc,
}

extension OrderValueExtension on Order {
  String toValue() {
    switch (this) {
      case Order.asc:
        return 'ASC';
      case Order.desc:
        return 'DESC';
    }
  }
}

extension OrderFromString on String {
  Order toOrder() {
    switch (this) {
      case 'ASC':
        return Order.asc;
      case 'DESC':
        return Order.desc;
    }
    throw Exception('$this is not known in enum Order');
  }
}

enum Priority {
  high,
  medium,
  low,
}

extension PriorityValueExtension on Priority {
  String toValue() {
    switch (this) {
      case Priority.high:
        return 'HIGH';
      case Priority.medium:
        return 'MEDIUM';
      case Priority.low:
        return 'LOW';
    }
  }
}

extension PriorityFromString on String {
  Priority toPriority() {
    switch (this) {
      case 'HIGH':
        return Priority.high;
      case 'MEDIUM':
        return Priority.medium;
      case 'LOW':
        return Priority.low;
    }
    throw Exception('$this is not known in enum Priority');
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

/// The container quick response content.
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

/// The content of the quick response stored in different media types.
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

/// Information about the quick response.
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

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can be
  /// either the ID or the ARN. URLs cannot contain the ARN.
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
  /// written.
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
      contentType: json['contentType'] as String,
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      knowledgeBaseArn: json['knowledgeBaseArn'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
      name: json['name'] as String,
      quickResponseArn: json['quickResponseArn'] as String,
      quickResponseId: json['quickResponseId'] as String,
      status: (json['status'] as String).toQuickResponseStatus(),
      channels: (json['channels'] as List?)
          ?.whereNotNull()
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
      'status': status.toValue(),
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

/// The container of quick response data.
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
      'operator': operator.toValue(),
      if (includeNoExistence != null) 'includeNoExistence': includeNoExistence,
      if (values != null) 'values': values,
    };
  }
}

enum QuickResponseFilterOperator {
  equals,
  prefix,
}

extension QuickResponseFilterOperatorValueExtension
    on QuickResponseFilterOperator {
  String toValue() {
    switch (this) {
      case QuickResponseFilterOperator.equals:
        return 'EQUALS';
      case QuickResponseFilterOperator.prefix:
        return 'PREFIX';
    }
  }
}

extension QuickResponseFilterOperatorFromString on String {
  QuickResponseFilterOperator toQuickResponseFilterOperator() {
    switch (this) {
      case 'EQUALS':
        return QuickResponseFilterOperator.equals;
      case 'PREFIX':
        return QuickResponseFilterOperator.prefix;
    }
    throw Exception('$this is not known in enum QuickResponseFilterOperator');
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
      if (order != null) 'order': order.toValue(),
    };
  }
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
      'operator': operator.toValue(),
      'values': values,
      if (allowFuzziness != null) 'allowFuzziness': allowFuzziness,
      if (priority != null) 'priority': priority.toValue(),
    };
  }
}

enum QuickResponseQueryOperator {
  contains,
  containsAndPrefix,
}

extension QuickResponseQueryOperatorValueExtension
    on QuickResponseQueryOperator {
  String toValue() {
    switch (this) {
      case QuickResponseQueryOperator.contains:
        return 'CONTAINS';
      case QuickResponseQueryOperator.containsAndPrefix:
        return 'CONTAINS_AND_PREFIX';
    }
  }
}

extension QuickResponseQueryOperatorFromString on String {
  QuickResponseQueryOperator toQuickResponseQueryOperator() {
    switch (this) {
      case 'CONTAINS':
        return QuickResponseQueryOperator.contains;
      case 'CONTAINS_AND_PREFIX':
        return QuickResponseQueryOperator.containsAndPrefix;
    }
    throw Exception('$this is not known in enum QuickResponseQueryOperator');
  }
}

/// Information about the import job.
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

/// The result of quick response search.
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

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it. Can be
  /// either the ID or the ARN. URLs cannot contain the ARN.
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
      contentType: json['contentType'] as String,
      contents: QuickResponseContents.fromJson(
          json['contents'] as Map<String, dynamic>),
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      isActive: json['isActive'] as bool,
      knowledgeBaseArn: json['knowledgeBaseArn'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
      name: json['name'] as String,
      quickResponseArn: json['quickResponseArn'] as String,
      quickResponseId: json['quickResponseId'] as String,
      status: (json['status'] as String).toQuickResponseStatus(),
      attributesInterpolated: (json['attributesInterpolated'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      attributesNotInterpolated: (json['attributesNotInterpolated'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      channels: (json['channels'] as List?)
          ?.whereNotNull()
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
      'status': status.toValue(),
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

enum QuickResponseStatus {
  createInProgress,
  createFailed,
  created,
  deleteInProgress,
  deleteFailed,
  deleted,
  updateInProgress,
  updateFailed,
}

extension QuickResponseStatusValueExtension on QuickResponseStatus {
  String toValue() {
    switch (this) {
      case QuickResponseStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case QuickResponseStatus.createFailed:
        return 'CREATE_FAILED';
      case QuickResponseStatus.created:
        return 'CREATED';
      case QuickResponseStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case QuickResponseStatus.deleteFailed:
        return 'DELETE_FAILED';
      case QuickResponseStatus.deleted:
        return 'DELETED';
      case QuickResponseStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case QuickResponseStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension QuickResponseStatusFromString on String {
  QuickResponseStatus toQuickResponseStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return QuickResponseStatus.createInProgress;
      case 'CREATE_FAILED':
        return QuickResponseStatus.createFailed;
      case 'CREATED':
        return QuickResponseStatus.created;
      case 'DELETE_IN_PROGRESS':
        return QuickResponseStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return QuickResponseStatus.deleteFailed;
      case 'DELETED':
        return QuickResponseStatus.deleted;
      case 'UPDATE_IN_PROGRESS':
        return QuickResponseStatus.updateInProgress;
      case 'UPDATE_FAILED':
        return QuickResponseStatus.updateFailed;
    }
    throw Exception('$this is not known in enum QuickResponseStatus');
  }
}

/// The summary information about the quick response.
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

  /// The identifier of the knowledge base. This should not be a QUICK_RESPONSES
  /// type knowledge base if you're storing Wisdom Content resource to it.
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
      contentType: json['contentType'] as String,
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      knowledgeBaseArn: json['knowledgeBaseArn'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
      name: json['name'] as String,
      quickResponseArn: json['quickResponseArn'] as String,
      quickResponseId: json['quickResponseId'] as String,
      status: (json['status'] as String).toQuickResponseStatus(),
      channels: (json['channels'] as List?)
          ?.whereNotNull()
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
      'status': status.toValue(),
      if (channels != null) 'channels': channels,
      if (description != null) 'description': description,
      if (isActive != null) 'isActive': isActive,
      if (lastModifiedBy != null) 'lastModifiedBy': lastModifiedBy,
      if (tags != null) 'tags': tags,
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
      results: (json['results'] as List)
          .whereNotNull()
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

/// The configuration information for the customer managed key used for
/// encryption.
class ServerSideEncryptionConfiguration {
  /// The customer managed key used for encryption. For more information about
  /// setting up a customer managed key for Wisdom, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-wisdom.html">Enable
  /// Amazon Connect Wisdom for your instance</a>. For information about valid ID
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

  /// The configuration information for the session integration.
  final SessionIntegrationConfiguration? integrationConfiguration;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  SessionData({
    required this.name,
    required this.sessionArn,
    required this.sessionId,
    this.description,
    this.integrationConfiguration,
    this.tags,
  });

  factory SessionData.fromJson(Map<String, dynamic> json) {
    return SessionData(
      name: json['name'] as String,
      sessionArn: json['sessionArn'] as String,
      sessionId: json['sessionId'] as String,
      description: json['description'] as String?,
      integrationConfiguration: json['integrationConfiguration'] != null
          ? SessionIntegrationConfiguration.fromJson(
              json['integrationConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    final description = this.description;
    final integrationConfiguration = this.integrationConfiguration;
    final tags = this.tags;
    return {
      'name': name,
      'sessionArn': sessionArn,
      'sessionId': sessionId,
      if (description != null) 'description': description,
      if (integrationConfiguration != null)
        'integrationConfiguration': integrationConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The configuration information for the session integration.
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

class RequestTimeoutException extends _s.GenericAwsException {
  RequestTimeoutException({String? type, String? message})
      : super(type: type, code: 'RequestTimeoutException', message: message);
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
  'RequestTimeoutException': (type, message) =>
      RequestTimeoutException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
