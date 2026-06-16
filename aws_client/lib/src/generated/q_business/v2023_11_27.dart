// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// This is the <i>Amazon Q Business</i> API Reference. Amazon Q Business is a
/// fully managed, generative-AI powered enterprise chat assistant that you can
/// deploy within your organization. Amazon Q Business enhances employee
/// productivity by supporting key tasks such as question-answering, knowledge
/// discovery, writing email messages, summarizing text, drafting document
/// outlines, and brainstorming ideas. Users ask questions of Amazon Q Business
/// and get answers that are presented in a conversational manner. For an
/// introduction to the service, see the <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/what-is.html">
/// <i>Amazon Q Business User Guide</i> </a>.
///
/// For an overview of the Amazon Q Business APIs, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/api-ref.html#api-overview">Overview
/// of Amazon Q Business API operations</a>.
///
/// For information about the IAM access control permissions you need to use
/// this API, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/iam-roles.html">IAM
/// roles for Amazon Q Business</a> in the <i>Amazon Q Business User Guide</i>.
///
/// The following resources provide additional information about using the
/// Amazon Q Business API:
///
/// <ul>
/// <li>
/// <i> <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/setting-up.html">Setting
/// up for Amazon Q Business</a> </i>
/// </li>
/// <li>
/// <i> <a
/// href="https://awscli.amazonaws.com/v2/documentation/api/latest/reference/qbusiness/index.html">Amazon
/// Q Business CLI Reference</a> </i>
/// </li>
/// <li>
/// <i> <a
/// href="https://docs.aws.amazon.com/general/latest/gr/amazonq.html">Amazon Web
/// Services General Reference</a> </i>
/// </li>
/// </ul>
class QBusiness {
  final _s.RestJsonProtocol _protocol;
  QBusiness({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'qbusiness',
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

  /// Adds or updates a permission policy for a Amazon Q Business application,
  /// allowing cross-account access for an ISV. This operation creates a new
  /// policy statement for the specified Amazon Q Business application. The
  /// policy statement defines the IAM actions that the ISV is allowed to
  /// perform on the Amazon Q Business application's resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actions] :
  /// The list of Amazon Q Business actions that the ISV is allowed to perform.
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application.
  ///
  /// Parameter [principal] :
  /// The Amazon Resource Name of the IAM role for the ISV that is being granted
  /// permission.
  ///
  /// Parameter [statementId] :
  /// A unique identifier for the policy statement.
  ///
  /// Parameter [conditions] :
  /// The conditions that restrict when the permission is effective. These
  /// conditions can be used to limit the permission based on specific
  /// attributes of the request.
  Future<AssociatePermissionResponse> associatePermission({
    required List<String> actions,
    required String applicationId,
    required String principal,
    required String statementId,
    List<PermissionCondition>? conditions,
  }) async {
    final $payload = <String, dynamic>{
      'actions': actions,
      'principal': principal,
      'statementId': statementId,
      if (conditions != null) 'conditions': conditions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return AssociatePermissionResponse.fromJson(response);
  }

  /// Asynchronously deletes one or more documents added using the
  /// <code>BatchPutDocument</code> API from an Amazon Q Business index.
  ///
  /// You can see the progress of the deletion, and any error messages related
  /// to the process, by using CloudWatch.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application.
  ///
  /// Parameter [documents] :
  /// Documents deleted from the Amazon Q Business index.
  ///
  /// Parameter [indexId] :
  /// The identifier of the Amazon Q Business index that contains the documents
  /// to delete.
  ///
  /// Parameter [dataSourceSyncId] :
  /// The identifier of the data source sync during which the documents were
  /// deleted.
  Future<BatchDeleteDocumentResponse> batchDeleteDocument({
    required String applicationId,
    required List<DeleteDocument> documents,
    required String indexId,
    String? dataSourceSyncId,
  }) async {
    final $payload = <String, dynamic>{
      'documents': documents,
      if (dataSourceSyncId != null) 'dataSourceSyncId': dataSourceSyncId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/documents/delete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteDocumentResponse.fromJson(response);
  }

  /// Adds one or more documents to an Amazon Q Business index.
  ///
  /// You use this API to:
  ///
  /// <ul>
  /// <li>
  /// ingest your structured and unstructured documents and documents stored in
  /// an Amazon S3 bucket into an Amazon Q Business index.
  /// </li>
  /// <li>
  /// add custom attributes to documents in an Amazon Q Business index.
  /// </li>
  /// <li>
  /// attach an access control list to the documents added to an Amazon Q
  /// Business index.
  /// </li>
  /// </ul>
  /// You can see the progress of the deletion, and any error messages related
  /// to the process, by using CloudWatch.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application.
  ///
  /// Parameter [documents] :
  /// One or more documents to add to the index.
  /// <important>
  /// Ensure that the name of your document doesn't contain any confidential
  /// information. Amazon Q Business returns document names in chat responses
  /// and citations when relevant.
  /// </important>
  ///
  /// Parameter [indexId] :
  /// The identifier of the Amazon Q Business index to add the documents to.
  ///
  /// Parameter [dataSourceSyncId] :
  /// The identifier of the data source sync during which the documents were
  /// added.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// your S3 bucket.
  Future<BatchPutDocumentResponse> batchPutDocument({
    required String applicationId,
    required List<Document> documents,
    required String indexId,
    String? dataSourceSyncId,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'documents': documents,
      if (dataSourceSyncId != null) 'dataSourceSyncId': dataSourceSyncId,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/documents',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutDocumentResponse.fromJson(response);
  }

  /// Unsubscribes a user or a group from their pricing tier in an Amazon Q
  /// Business application. An unsubscribed user or group loses all Amazon Q
  /// Business feature access at the start of next month.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application for which the
  /// subscription is being cancelled.
  ///
  /// Parameter [subscriptionId] :
  /// The identifier of the Amazon Q Business subscription being cancelled.
  Future<CancelSubscriptionResponse> cancelSubscription({
    required String applicationId,
    required String subscriptionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/subscriptions/${Uri.encodeComponent(subscriptionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelSubscriptionResponse.fromJson(response);
  }

  /// Starts or continues a streaming Amazon Q Business conversation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ExternalResourceException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application linked to a streaming
  /// Amazon Q Business conversation.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the chat input.
  ///
  /// Parameter [conversationId] :
  /// The identifier of the Amazon Q Business conversation.
  ///
  /// Parameter [inputStream] :
  /// The streaming input for the <code>Chat</code> API.
  ///
  /// Parameter [parentMessageId] :
  /// The identifier used to associate a user message with a AI generated
  /// response.
  ///
  /// Parameter [userGroups] :
  /// The group names that a user associated with the chat input belongs to.
  ///
  /// Parameter [userId] :
  /// The identifier of the user attached to the chat input.
  Future<ChatOutput> chat({
    required String applicationId,
    String? clientToken,
    String? conversationId,
    ChatInputStream? inputStream,
    String? parentMessageId,
    List<String>? userGroups,
    String? userId,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
      if (conversationId != null) 'conversationId': [conversationId],
      if (parentMessageId != null) 'parentMessageId': [parentMessageId],
      if (userGroups != null) 'userGroups': userGroups,
      if (userId != null) 'userId': [userId],
    };
    final response = await _protocol.sendRaw(
      payload: inputStream,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/conversations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ChatOutput(
      outputStream: ChatOutputStream.fromJson($json),
    );
  }

  /// Starts or continues a non-streaming Amazon Q Business conversation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ExternalResourceException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application linked to the Amazon Q
  /// Business conversation.
  ///
  /// Parameter [actionExecution] :
  /// A request from an end user to perform an Amazon Q Business plugin action.
  ///
  /// Parameter [attachments] :
  /// A list of files uploaded directly during chat. You can upload a maximum of
  /// 5 files of upto 10 MB each.
  ///
  /// Parameter [attributeFilter] :
  /// Enables filtering of Amazon Q Business web experience responses based on
  /// document attributes or metadata fields.
  ///
  /// Parameter [authChallengeResponse] :
  /// An authentication verification event response by a third party
  /// authentication server to Amazon Q Business.
  ///
  /// Parameter [chatMode] :
  /// The <code>chatMode</code> parameter determines the chat modes available to
  /// Amazon Q Business users:
  ///
  /// <ul>
  /// <li>
  /// <code>RETRIEVAL_MODE</code> - If you choose this mode, Amazon Q generates
  /// responses solely from the data sources connected and indexed by the
  /// application. If an answer is not found in the data sources or there are no
  /// data sources available, Amazon Q will respond with a "<i>No Answer
  /// Found</i>" message, unless LLM knowledge has been enabled. In that case,
  /// Amazon Q will generate a response from the LLM knowledge
  /// </li>
  /// <li>
  /// <code>CREATOR_MODE</code> - By selecting this mode, you can choose to
  /// generate responses only from the LLM knowledge. You can also attach files
  /// and have Amazon Q generate a response based on the data in those files. If
  /// the attached files do not contain an answer for the query, Amazon Q will
  /// automatically fall back to generating a response from the LLM knowledge.
  /// </li>
  /// <li>
  /// <code>PLUGIN_MODE</code> - By selecting this mode, users can choose to use
  /// plugins in chat to get their responses.
  /// </li>
  /// </ul> <note>
  /// If none of the modes are selected, Amazon Q will only respond using the
  /// information from the attached files.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/guardrails.html">Admin
  /// controls and guardrails</a>, <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/plugins.html">Plugins</a>,
  /// and <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/using-web-experience.html#chat-source-scope">Response
  /// sources</a>.
  ///
  /// Parameter [chatModeConfiguration] :
  /// The chat mode configuration for an Amazon Q Business application.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify a chat request.
  ///
  /// Parameter [conversationId] :
  /// The identifier of the Amazon Q Business conversation.
  ///
  /// Parameter [parentMessageId] :
  /// The identifier of the previous system message in a conversation.
  ///
  /// Parameter [userGroups] :
  /// The group names that a user associated with the chat input belongs to.
  ///
  /// Parameter [userId] :
  /// The identifier of the user attached to the chat input.
  ///
  /// Parameter [userMessage] :
  /// A end user message in a conversation.
  Future<ChatSyncOutput> chatSync({
    required String applicationId,
    ActionExecution? actionExecution,
    List<AttachmentInput>? attachments,
    AttributeFilter? attributeFilter,
    AuthChallengeResponse? authChallengeResponse,
    ChatMode? chatMode,
    ChatModeConfiguration? chatModeConfiguration,
    String? clientToken,
    String? conversationId,
    String? parentMessageId,
    List<String>? userGroups,
    String? userId,
    String? userMessage,
  }) async {
    final $query = <String, List<String>>{
      if (userGroups != null) 'userGroups': userGroups,
      if (userId != null) 'userId': [userId],
    };
    final $payload = <String, dynamic>{
      if (actionExecution != null) 'actionExecution': actionExecution,
      if (attachments != null) 'attachments': attachments,
      if (attributeFilter != null) 'attributeFilter': attributeFilter,
      if (authChallengeResponse != null)
        'authChallengeResponse': authChallengeResponse,
      if (chatMode != null) 'chatMode': chatMode.value,
      if (chatModeConfiguration != null)
        'chatModeConfiguration': chatModeConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (conversationId != null) 'conversationId': conversationId,
      if (parentMessageId != null) 'parentMessageId': parentMessageId,
      if (userMessage != null) 'userMessage': userMessage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/conversations?sync',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ChatSyncOutput.fromJson(response);
  }

  /// Verifies if a user has access permissions for a specified document and
  /// returns the actual ACL attached to the document. Resolves user access on
  /// the document via user aliases and groups when verifying user access.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application. This is required to identify the
  /// specific Amazon Q Business application context for the document access
  /// check.
  ///
  /// Parameter [documentId] :
  /// The unique identifier of the document. Specifies which document's access
  /// permissions are being checked.
  ///
  /// Parameter [indexId] :
  /// The unique identifier of the index. Used to locate the correct index
  /// within the application where the document is stored.
  ///
  /// Parameter [userId] :
  /// The unique identifier of the user. Used to check the access permissions
  /// for this specific user against the document's ACL.
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source. Identifies the specific data
  /// source from which the document originates. Should not be used when a
  /// document is uploaded directly with BatchPutDocument, as no dataSourceId is
  /// available or necessary.
  Future<CheckDocumentAccessResponse> checkDocumentAccess({
    required String applicationId,
    required String documentId,
    required String indexId,
    required String userId,
    String? dataSourceId,
  }) async {
    final $query = <String, List<String>>{
      if (dataSourceId != null) 'dataSourceId': [dataSourceId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/index/${Uri.encodeComponent(indexId)}/users/${Uri.encodeComponent(userId)}/documents/${Uri.encodeComponent(documentId)}/check-document-access',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CheckDocumentAccessResponse.fromJson(response);
  }

  /// Creates a unique URL for anonymous Amazon Q Business web experience. This
  /// URL can only be used once and must be used within 5 minutes after it's
  /// generated.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application environment attached
  /// to the web experience.
  ///
  /// Parameter [webExperienceId] :
  /// The identifier of the web experience.
  ///
  /// Parameter [sessionDurationInMinutes] :
  /// The duration of the session associated with the unique URL for the web
  /// experience.
  Future<CreateAnonymousWebExperienceUrlResponse>
      createAnonymousWebExperienceUrl({
    required String applicationId,
    required String webExperienceId,
    int? sessionDurationInMinutes,
  }) async {
    _s.validateNumRange(
      'sessionDurationInMinutes',
      sessionDurationInMinutes,
      15,
      60,
    );
    final $payload = <String, dynamic>{
      if (sessionDurationInMinutes != null)
        'sessionDurationInMinutes': sessionDurationInMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/experiences/${Uri.encodeComponent(webExperienceId)}/anonymous-url',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAnonymousWebExperienceUrlResponse.fromJson(response);
  }

  /// Creates a new chat response configuration for an Amazon Q Business
  /// application. This operation establishes a set of parameters that define
  /// how the system generates and formats responses to user queries in chat
  /// interactions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application for which to
  /// create the new chat response configuration.
  ///
  /// Parameter [displayName] :
  /// A human-readable name for the new chat response configuration, making it
  /// easier to identify and manage among multiple configurations.
  ///
  /// Parameter [responseConfigurations] :
  /// A collection of response configuration settings that define how Amazon Q
  /// Business will generate and format responses to user queries in chat
  /// interactions.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  /// This helps prevent the same configuration from being created multiple
  /// times if retries occur.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to apply as tags to the new chat response
  /// configuration, enabling categorization and management of resources across
  /// Amazon Web Services services.
  Future<CreateChatResponseConfigurationResponse>
      createChatResponseConfiguration({
    required String applicationId,
    required String displayName,
    required Map<ResponseConfigurationType, ResponseConfiguration>
        responseConfigurations,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'displayName': displayName,
      'responseConfigurations':
          responseConfigurations.map((k, e) => MapEntry(k.value, e)),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/chatresponseconfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChatResponseConfigurationResponse.fromJson(response);
  }

  /// Subscribes an IAM Identity Center user or a group to a pricing tier for an
  /// Amazon Q Business application.
  ///
  /// Amazon Q Business offers two subscription tiers: <code>Q_LITE</code> and
  /// <code>Q_BUSINESS</code>. Subscription tier determines feature access for
  /// the user. For more information on subscriptions and pricing tiers, see <a
  /// href="https://aws.amazon.com/q/business/pricing/">Amazon Q Business
  /// pricing</a>.
  /// <note>
  /// For an example IAM role policy for assigning subscriptions, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/setting-up.html#permissions">Set
  /// up required permissions</a> in the Amazon Q Business User Guide.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application the subscription
  /// should be added to.
  ///
  /// Parameter [principal] :
  /// The IAM Identity Center <code>UserId</code> or <code>GroupId</code> of a
  /// user or group in the IAM Identity Center instance connected to the Amazon
  /// Q Business application.
  ///
  /// Parameter [type] :
  /// The type of Amazon Q Business subscription you want to create.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create a subscription
  /// for your Amazon Q Business application.
  Future<CreateSubscriptionResponse> createSubscription({
    required String applicationId,
    required SubscriptionPrincipal principal,
    required SubscriptionType type,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'principal': principal,
      'type': type.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/subscriptions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSubscriptionResponse.fromJson(response);
  }

  /// Creates a universally unique identifier (UUID) mapped to a list of local
  /// user ids within an application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application for which the user mapping will be
  /// created.
  ///
  /// Parameter [userId] :
  /// The user emails attached to a user mapping.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create your Amazon Q
  /// Business user mapping.
  ///
  /// Parameter [userAliases] :
  /// The list of user aliases in the mapping.
  Future<void> createUser({
    required String applicationId,
    required String userId,
    String? clientToken,
    List<UserAlias>? userAliases,
  }) async {
    final $payload = <String, dynamic>{
      'userId': userId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (userAliases != null) 'userAliases': userAliases,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/users',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an attachment associated with a specific Amazon Q Business
  /// conversation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the Amazon Q Business application environment.
  ///
  /// Parameter [attachmentId] :
  /// The unique identifier for the attachment.
  ///
  /// Parameter [conversationId] :
  /// The unique identifier of the conversation.
  ///
  /// Parameter [userId] :
  /// The unique identifier of the user involved in the conversation.
  Future<void> deleteAttachment({
    required String applicationId,
    required String attachmentId,
    required String conversationId,
    String? userId,
  }) async {
    final $query = <String, List<String>>{
      if (userId != null) 'userId': [userId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/conversations/${Uri.encodeComponent(conversationId)}/attachments/${Uri.encodeComponent(attachmentId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes chat controls configured for an existing Amazon Q Business
  /// application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application the chat controls have been configured
  /// for.
  Future<void> deleteChatControlsConfiguration({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/chatcontrols',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specified chat response configuration from an Amazon Q Business
  /// application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of theAmazon Q Business application from which to
  /// delete the chat response configuration.
  ///
  /// Parameter [chatResponseConfigurationId] :
  /// The unique identifier of the chat response configuration to delete from
  /// the specified application.
  Future<void> deleteChatResponseConfiguration({
    required String applicationId,
    required String chatResponseConfigurationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/chatresponseconfigurations/${Uri.encodeComponent(chatResponseConfigurationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Q Business web experience conversation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application associated with the
  /// conversation.
  ///
  /// Parameter [conversationId] :
  /// The identifier of the Amazon Q Business web experience conversation being
  /// deleted.
  ///
  /// Parameter [userId] :
  /// The identifier of the user who is deleting the conversation.
  Future<void> deleteConversation({
    required String applicationId,
    required String conversationId,
    String? userId,
  }) async {
    final $query = <String, List<String>>{
      if (userId != null) 'userId': [userId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/conversations/${Uri.encodeComponent(conversationId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a group so that all users and sub groups that belong to the group
  /// can no longer access documents only available to that group. For example,
  /// after deleting the group "Summer Interns", all interns who belonged to
  /// that group no longer see intern-only documents in their chat results.
  ///
  /// If you want to delete, update, or replace users or sub groups of a group,
  /// you need to use the <code>PutGroup</code> operation. For example, if a
  /// user in the group "Engineering" leaves the engineering team and another
  /// user takes their place, you provide an updated list of users or sub groups
  /// that belong to the "Engineering" group when calling <code>PutGroup</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application in which the group mapping belongs.
  ///
  /// Parameter [groupName] :
  /// The name of the group you want to delete.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index you want to delete the group from.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source linked to the group
  ///
  /// A group can be tied to multiple data sources. You can delete a group from
  /// accessing documents in a certain data source. For example, the groups
  /// "Research", "Engineering", and "Sales and Marketing" are all tied to the
  /// company's documents stored in the data sources Confluence and Salesforce.
  /// You want to delete "Research" and "Engineering" groups from Salesforce, so
  /// that these groups cannot access customer-related documents stored in
  /// Salesforce. Only "Sales and Marketing" should access documents in the
  /// Salesforce data source.
  Future<void> deleteGroup({
    required String applicationId,
    required String groupName,
    required String indexId,
    String? dataSourceId,
  }) async {
    final $query = <String, List<String>>{
      if (dataSourceId != null) 'dataSourceId': [dataSourceId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/groups/${Uri.encodeComponent(groupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a user by email id.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application from which the user is being deleted.
  ///
  /// Parameter [userId] :
  /// The user email being deleted.
  Future<void> deleteUser({
    required String applicationId,
    required String userId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/users/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a permission policy from a Amazon Q Business application, revoking
  /// the cross-account access that was previously granted to an ISV. This
  /// operation deletes the specified policy statement from the application's
  /// permission policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application.
  ///
  /// Parameter [statementId] :
  /// The statement ID of the permission to remove.
  Future<void> disassociatePermission({
    required String applicationId,
    required String statementId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/policy/${Uri.encodeComponent(statementId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about chat controls configured for an existing Amazon Q
  /// Business application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application for which the chat controls are
  /// configured.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of configured chat controls to return.
  ///
  /// Parameter [nextToken] :
  /// If the <code>maxResults</code> response was incomplete because there is
  /// more data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// Amazon Q Business chat controls configured.
  Future<GetChatControlsConfigurationResponse> getChatControlsConfiguration({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/chatcontrols',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetChatControlsConfigurationResponse.fromJson(response);
  }

  /// Retrieves detailed information about a specific chat response
  /// configuration from an Amazon Q Business application. This operation
  /// returns the complete configuration settings and metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application containing the
  /// chat response configuration to retrieve.
  ///
  /// Parameter [chatResponseConfigurationId] :
  /// The unique identifier of the chat response configuration to retrieve from
  /// the specified application.
  Future<GetChatResponseConfigurationResponse> getChatResponseConfiguration({
    required String applicationId,
    required String chatResponseConfigurationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/chatresponseconfigurations/${Uri.encodeComponent(chatResponseConfigurationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetChatResponseConfigurationResponse.fromJson(response);
  }

  /// Retrieves the content of a document that was ingested into Amazon Q
  /// Business. This API validates user authorization against document ACLs
  /// before returning a pre-signed URL for secure document access. You can
  /// download or view source documents referenced in chat responses through the
  /// URL.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application containing the
  /// document. This ensures the request is scoped to the correct application
  /// environment and its associated security policies.
  ///
  /// Parameter [documentId] :
  /// The unique identifier of the document that is indexed via BatchPutDocument
  /// API or file-upload or connector sync. It is also found in chat or chatSync
  /// response.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index where documents are indexed.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source from which the document was ingested.
  /// This field is not present if the document is ingested by directly calling
  /// the BatchPutDocument API. If the document is from a file-upload data
  /// source, the datasource will be "uploaded-docs-file-stat-datasourceid".
  ///
  /// Parameter [outputFormat] :
  /// Document outputFormat. Defaults to RAW if not selected.
  Future<GetDocumentContentResponse> getDocumentContent({
    required String applicationId,
    required String documentId,
    required String indexId,
    String? dataSourceId,
    OutputFormat? outputFormat,
  }) async {
    final $query = <String, List<String>>{
      if (dataSourceId != null) 'dataSourceId': [dataSourceId],
      if (outputFormat != null) 'outputFormat': [outputFormat.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/index/${Uri.encodeComponent(indexId)}/documents/${Uri.encodeComponent(documentId)}/content',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDocumentContentResponse.fromJson(response);
  }

  /// Describes a group by group name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application id the group is attached to.
  ///
  /// Parameter [groupName] :
  /// The name of the group.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index the group is attached to.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source the group is attached to.
  Future<GetGroupResponse> getGroup({
    required String applicationId,
    required String groupName,
    required String indexId,
    String? dataSourceId,
  }) async {
    final $query = <String, List<String>>{
      if (dataSourceId != null) 'dataSourceId': [dataSourceId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/groups/${Uri.encodeComponent(groupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupResponse.fromJson(response);
  }

  /// Returns the image bytes corresponding to a media object. If you have
  /// implemented your own application with the Chat and ChatSync APIs, and have
  /// enabled content extraction from visual data in Amazon Q Business, you use
  /// the GetMedia API operation to download the images so you can show them in
  /// your UI with responses.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/extracting-meaning-from-images.html">Extracting
  /// semantic meaning from images and visuals</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [MediaTooLargeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business which contains the media object.
  ///
  /// Parameter [conversationId] :
  /// The identifier of the Amazon Q Business conversation.
  ///
  /// Parameter [mediaId] :
  /// The identifier of the media object. You can find this in the
  /// <code>sourceAttributions</code> returned by the <code>Chat</code>,
  /// <code>ChatSync</code>, and <code>ListMessages</code> API responses.
  ///
  /// Parameter [messageId] :
  /// The identifier of the Amazon Q Business message.
  Future<GetMediaResponse> getMedia({
    required String applicationId,
    required String conversationId,
    required String mediaId,
    required String messageId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/conversations/${Uri.encodeComponent(conversationId)}/messages/${Uri.encodeComponent(messageId)}/media/${Uri.encodeComponent(mediaId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMediaResponse.fromJson(response);
  }

  /// Retrieves the current permission policy for a Amazon Q Business
  /// application. The policy is returned as a JSON-formatted string and defines
  /// the IAM actions that are allowed or denied for the application's
  /// resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application.
  Future<GetPolicyResponse> getPolicy({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyResponse.fromJson(response);
  }

  /// Describes the universally unique identifier (UUID) associated with a local
  /// user in a data source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application connected to the user.
  ///
  /// Parameter [userId] :
  /// The user email address attached to the user.
  Future<GetUserResponse> getUser({
    required String applicationId,
    required String userId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/users/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetUserResponse.fromJson(response);
  }

  /// Gets a list of attachments associated with an Amazon Q Business web
  /// experience or a list of attachements associated with a specific Amazon Q
  /// Business conversation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the Amazon Q Business application.
  ///
  /// Parameter [conversationId] :
  /// The unique identifier of the Amazon Q Business web experience
  /// conversation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of attachements to return.
  ///
  /// Parameter [nextToken] :
  /// If the number of attachments returned exceeds <code>maxResults</code>,
  /// Amazon Q Business returns a next token as a pagination token to retrieve
  /// the next set of attachments.
  ///
  /// Parameter [userId] :
  /// The unique identifier of the user involved in the Amazon Q Business web
  /// experience conversation.
  Future<ListAttachmentsResponse> listAttachments({
    required String applicationId,
    String? conversationId,
    int? maxResults,
    String? nextToken,
    String? userId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (conversationId != null) 'conversationId': [conversationId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (userId != null) 'userId': [userId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/attachments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAttachmentsResponse.fromJson(response);
  }

  /// Retrieves a list of all chat response configurations available in a
  /// specified Amazon Q Business application. This operation returns summary
  /// information about each configuration to help administrators manage and
  /// select appropriate response settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application for which to
  /// list available chat response configurations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of chat response configurations to return in a single
  /// response. This parameter helps control pagination of results when many
  /// configurations exist.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used to retrieve the next set of results when the
  /// number of configurations exceeds the specified <code>maxResults</code>
  /// value.
  Future<ListChatResponseConfigurationsResponse>
      listChatResponseConfigurations({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/chatresponseconfigurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChatResponseConfigurationsResponse.fromJson(response);
  }

  /// Lists one or more Amazon Q Business conversations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Amazon Q Business conversations to return.
  ///
  /// Parameter [nextToken] :
  /// If the <code>maxResults</code> response was incomplete because there is
  /// more data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// Amazon Q Business conversations.
  ///
  /// Parameter [userId] :
  /// The identifier of the user involved in the Amazon Q Business web
  /// experience conversation.
  Future<ListConversationsResponse> listConversations({
    required String applicationId,
    int? maxResults,
    String? nextToken,
    String? userId,
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
      if (userId != null) 'userId': [userId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/conversations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConversationsResponse.fromJson(response);
  }

  /// Get information about an Amazon Q Business data source connector
  /// synchronization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application connected to the data
  /// source.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source connector.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with the Amazon Q Business data source
  /// connector.
  ///
  /// Parameter [endTime] :
  /// The end time of the data source connector sync.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of synchronization jobs to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the <code>maxResults</code> response was incpmplete because there is
  /// more data to retriever, Amazon Q Business returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set
  /// of responses.
  ///
  /// Parameter [startTime] :
  /// The start time of the data source connector sync.
  ///
  /// Parameter [statusFilter] :
  /// Only returns synchronization jobs with the <code>Status</code> field equal
  /// to the specified status.
  Future<ListDataSourceSyncJobsResponse> listDataSourceSyncJobs({
    required String applicationId,
    required String dataSourceId,
    required String indexId,
    DateTime? endTime,
    int? maxResults,
    String? nextToken,
    DateTime? startTime,
    DataSourceSyncJobStatus? statusFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (statusFilter != null) 'syncStatus': [statusFilter.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/datasources/${Uri.encodeComponent(dataSourceId)}/syncjobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSourceSyncJobsResponse.fromJson(response);
  }

  /// A list of documents attached to an index.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application id the documents are attached to.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index the documents are attached to.
  ///
  /// Parameter [dataSourceIds] :
  /// The identifier of the data sources the documents are attached to.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of documents to return.
  ///
  /// Parameter [nextToken] :
  /// If the <code>maxResults</code> response was incomplete because there is
  /// more data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// documents.
  Future<ListDocumentsResponse> listDocuments({
    required String applicationId,
    required String indexId,
    List<String>? dataSourceIds,
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
      if (dataSourceIds != null) 'dataSourceIds': dataSourceIds,
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/index/${Uri.encodeComponent(indexId)}/documents',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDocumentsResponse.fromJson(response);
  }

  /// Provides a list of groups that are mapped to users.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application for getting a list of groups mapped to
  /// users.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for getting a list of groups mapped to users.
  ///
  /// Parameter [updatedEarlierThan] :
  /// The timestamp identifier used for the latest <code>PUT</code> or
  /// <code>DELETE</code> action for mapping users to their groups.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source for getting a list of groups mapped to
  /// users.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of returned groups that are mapped to users.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Q Business returns a pagination token in the response.
  /// You can use this pagination token to retrieve the next set of groups that
  /// are mapped to users.
  Future<ListGroupsResponse> listGroups({
    required String applicationId,
    required String indexId,
    required DateTime updatedEarlierThan,
    String? dataSourceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      'updatedEarlierThan': [_s.iso8601ToJson(updatedEarlierThan).toString()],
      if (dataSourceId != null) 'dataSourceId': [dataSourceId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupsResponse.fromJson(response);
  }

  /// Gets a list of messages associated with an Amazon Q Business web
  /// experience.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier for the Amazon Q Business application.
  ///
  /// Parameter [conversationId] :
  /// The identifier of the Amazon Q Business web experience conversation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of messages to return.
  ///
  /// Parameter [nextToken] :
  /// If the number of messages returned exceeds <code>maxResults</code>, Amazon
  /// Q Business returns a next token as a pagination token to retrieve the next
  /// set of messages.
  ///
  /// Parameter [userId] :
  /// The identifier of the user involved in the Amazon Q Business web
  /// experience conversation.
  Future<ListMessagesResponse> listMessages({
    required String applicationId,
    required String conversationId,
    int? maxResults,
    String? nextToken,
    String? userId,
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
      if (userId != null) 'userId': [userId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/conversations/${Uri.encodeComponent(conversationId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMessagesResponse.fromJson(response);
  }

  /// Lists configured Amazon Q Business actions for a specific plugin in an
  /// Amazon Q Business application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application the plugin is attached
  /// to.
  ///
  /// Parameter [pluginId] :
  /// The identifier of the Amazon Q Business plugin.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of plugin actions to return.
  ///
  /// Parameter [nextToken] :
  /// If the number of plugin actions returned exceeds <code>maxResults</code>,
  /// Amazon Q Business returns a next token as a pagination token to retrieve
  /// the next set of plugin actions.
  Future<ListPluginActionsResponse> listPluginActions({
    required String applicationId,
    required String pluginId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/plugins/${Uri.encodeComponent(pluginId)}/actions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPluginActionsResponse.fromJson(response);
  }

  /// Lists configured Amazon Q Business actions for any plugin type—both
  /// built-in and custom.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pluginType] :
  /// The type of the plugin.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of plugins to return.
  ///
  /// Parameter [nextToken] :
  /// If the number of plugins returned exceeds <code>maxResults</code>, Amazon
  /// Q Business returns a next token as a pagination token to retrieve the next
  /// set of plugins.
  Future<ListPluginTypeActionsResponse> listPluginTypeActions({
    required PluginType pluginType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/pluginTypes/${Uri.encodeComponent(pluginType.value)}/actions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPluginTypeActionsResponse.fromJson(response);
  }

  /// Lists metadata for all Amazon Q Business plugin types.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of plugin metadata items to return.
  ///
  /// Parameter [nextToken] :
  /// If the metadata returned exceeds <code>maxResults</code>, Amazon Q
  /// Business returns a next token as a pagination token to retrieve the next
  /// set of metadata.
  Future<ListPluginTypeMetadataResponse> listPluginTypeMetadata({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/pluginTypeMetadata',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPluginTypeMetadataResponse.fromJson(response);
  }

  /// Lists all subscriptions created in an Amazon Q Business application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application linked to the
  /// subscription.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Amazon Q Business subscriptions to return.
  ///
  /// Parameter [nextToken] :
  /// If the <code>maxResults</code> response was incomplete because there is
  /// more data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// Amazon Q Business subscriptions.
  Future<ListSubscriptionsResponse> listSubscriptions({
    required String applicationId,
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
          '/applications/${Uri.encodeComponent(applicationId)}/subscriptions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscriptionsResponse.fromJson(response);
  }

  /// Gets a list of tags associated with a specified resource. Amazon Q
  /// Business applications and data sources can have tags associated with them.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the Amazon Q Business application or
  /// data source to get a list of tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceARN)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Enables your end user to provide feedback on their Amazon Q Business
  /// generated chat responses.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application associated with the feedback.
  ///
  /// Parameter [conversationId] :
  /// The identifier of the conversation the feedback is attached to.
  ///
  /// Parameter [messageId] :
  /// The identifier of the chat message that the feedback was given for.
  ///
  /// Parameter [messageCopiedAt] :
  /// The timestamp for when the feedback was recorded.
  ///
  /// Parameter [messageUsefulness] :
  /// The feedback usefulness value given by the user to the chat message.
  ///
  /// Parameter [userId] :
  /// The identifier of the user giving the feedback.
  Future<void> putFeedback({
    required String applicationId,
    required String conversationId,
    required String messageId,
    DateTime? messageCopiedAt,
    MessageUsefulnessFeedback? messageUsefulness,
    String? userId,
  }) async {
    final $query = <String, List<String>>{
      if (userId != null) 'userId': [userId],
    };
    final $payload = <String, dynamic>{
      if (messageCopiedAt != null)
        'messageCopiedAt': unixTimestampToJson(messageCopiedAt),
      if (messageUsefulness != null) 'messageUsefulness': messageUsefulness,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/conversations/${Uri.encodeComponent(conversationId)}/messages/${Uri.encodeComponent(messageId)}/feedback',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Create, or updates, a mapping of users—who have access to a document—to
  /// groups.
  ///
  /// You can also map sub groups to groups. For example, the group "Company
  /// Intellectual Property Teams" includes sub groups "Research" and
  /// "Engineering". These sub groups include their own list of users or people
  /// who work in these teams. Only users who work in research and engineering,
  /// and therefore belong in the intellectual property group, can see
  /// top-secret company documents in their Amazon Q Business chat results.
  ///
  /// There are two options for creating groups, either passing group members
  /// inline or using an S3 file via the S3PathForGroupMembers field. For inline
  /// groups, there is a limit of 1000 members per group and for provided S3
  /// files there is a limit of 100 thousand members. When creating a group
  /// using an S3 file, you provide both an S3 file and a <code>RoleArn</code>
  /// for Amazon Q Buisness to access the file.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application in which the user and group mapping
  /// belongs.
  ///
  /// Parameter [groupName] :
  /// The list that contains your users or sub groups that belong the same
  /// group. For example, the group "Company" includes the user "CEO" and the
  /// sub groups "Research", "Engineering", and "Sales and Marketing".
  ///
  /// Parameter [indexId] :
  /// The identifier of the index in which you want to map users to their
  /// groups.
  ///
  /// Parameter [type] :
  /// The type of the group.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source for which you want to map users to their
  /// groups. This is useful if a group is tied to multiple data sources, but
  /// you only want the group to access documents of a certain data source. For
  /// example, the groups "Research", "Engineering", and "Sales and Marketing"
  /// are all tied to the company's documents stored in the data sources
  /// Confluence and Salesforce. However, "Sales and Marketing" team only needs
  /// access to customer-related documents stored in Salesforce.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that has access to the S3
  /// file that contains your list of users that belong to a group.
  Future<void> putGroup({
    required String applicationId,
    required GroupMembers groupMembers,
    required String groupName,
    required String indexId,
    required MembershipType type,
    String? dataSourceId,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'groupMembers': groupMembers,
      'groupName': groupName,
      'type': type.value,
      if (dataSourceId != null) 'dataSourceId': dataSourceId,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/groups',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Searches for relevant content in a Amazon Q Business application based on
  /// a query. This operation takes a search query text, the Amazon Q Business
  /// application identifier, and optional filters (such as content source and
  /// maximum results) as input. It returns a list of relevant content items,
  /// where each item includes the content text, the unique document identifier,
  /// the document title, the document URI, any relevant document attributes,
  /// and score attributes indicating the confidence level of the relevance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application to search.
  ///
  /// Parameter [contentSource] :
  /// The source of content to search in.
  ///
  /// Parameter [queryText] :
  /// The text to search for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. (You received this token from a
  /// previous call.)
  Future<SearchRelevantContentResponse> searchRelevantContent({
    required String applicationId,
    required ContentSource contentSource,
    required String queryText,
    AttributeFilter? attributeFilter,
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
      'contentSource': contentSource,
      'queryText': queryText,
      if (attributeFilter != null) 'attributeFilter': attributeFilter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/relevant-content',
      exceptionFnMap: _exceptionFns,
    );
    return SearchRelevantContentResponse.fromJson(response);
  }

  /// Starts a data source connector synchronization job. If a synchronization
  /// job is already in progress, Amazon Q Business returns a
  /// <code>ConflictException</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of Amazon Q Business application the data source is
  /// connected to.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source connector.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with the data source connector.
  Future<StartDataSourceSyncJobResponse> startDataSourceSyncJob({
    required String applicationId,
    required String dataSourceId,
    required String indexId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/datasources/${Uri.encodeComponent(dataSourceId)}/startsync',
      exceptionFnMap: _exceptionFns,
    );
    return StartDataSourceSyncJobResponse.fromJson(response);
  }

  /// Stops an Amazon Q Business data source connector synchronization job
  /// already in progress.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application that the data source
  /// is connected to.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source connector.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with the Amazon Q Business data source
  /// connector.
  Future<void> stopDataSourceSyncJob({
    required String applicationId,
    required String dataSourceId,
    required String indexId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/datasources/${Uri.encodeComponent(dataSourceId)}/stopsync',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds the specified tag to the specified Amazon Q Business application or
  /// data source resource. If the tag already exists, the existing value is
  /// replaced with the new value.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the Amazon Q Business application or
  /// data source to tag.
  ///
  /// Parameter [tags] :
  /// A list of tag keys to add to the Amazon Q Business application or data
  /// source. If a tag already exists, the existing value is replaced with the
  /// new value.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceARN)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag from an Amazon Q Business application or a data source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the Amazon Q Business application, or
  /// data source to remove the tag from.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the Amazon Q Business application or
  /// data source. If a tag key does not exist on the resource, it is ignored.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceARN)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a set of chat controls configured for an existing Amazon Q
  /// Business application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application for which the chat controls are
  /// configured.
  ///
  /// Parameter [blockedPhrasesConfigurationUpdate] :
  /// The phrases blocked from chat by your chat control configuration.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to update a Amazon Q
  /// Business application chat configuration.
  ///
  /// Parameter [creatorModeConfiguration] :
  /// The configuration details for <code>CREATOR_MODE</code>.
  ///
  /// Parameter [hallucinationReductionConfiguration] :
  /// The hallucination reduction settings for your application.
  ///
  /// Parameter [orchestrationConfiguration] :
  /// The chat response orchestration settings for your application.
  ///
  /// Parameter [responseScope] :
  /// The response scope configured for your application. This determines
  /// whether your application uses its retrieval augmented generation (RAG)
  /// system to generate answers only from your enterprise data, or also uses
  /// the large language models (LLM) knowledge to respons to end user questions
  /// in chat.
  ///
  /// Parameter [topicConfigurationsToCreateOrUpdate] :
  /// The configured topic specific chat controls you want to update.
  ///
  /// Parameter [topicConfigurationsToDelete] :
  /// The configured topic specific chat controls you want to delete.
  Future<void> updateChatControlsConfiguration({
    required String applicationId,
    BlockedPhrasesConfigurationUpdate? blockedPhrasesConfigurationUpdate,
    String? clientToken,
    CreatorModeConfiguration? creatorModeConfiguration,
    HallucinationReductionConfiguration? hallucinationReductionConfiguration,
    OrchestrationConfiguration? orchestrationConfiguration,
    ResponseScope? responseScope,
    List<TopicConfiguration>? topicConfigurationsToCreateOrUpdate,
    List<TopicConfiguration>? topicConfigurationsToDelete,
  }) async {
    final $payload = <String, dynamic>{
      if (blockedPhrasesConfigurationUpdate != null)
        'blockedPhrasesConfigurationUpdate': blockedPhrasesConfigurationUpdate,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (creatorModeConfiguration != null)
        'creatorModeConfiguration': creatorModeConfiguration,
      if (hallucinationReductionConfiguration != null)
        'hallucinationReductionConfiguration':
            hallucinationReductionConfiguration,
      if (orchestrationConfiguration != null)
        'orchestrationConfiguration': orchestrationConfiguration,
      if (responseScope != null) 'responseScope': responseScope.value,
      if (topicConfigurationsToCreateOrUpdate != null)
        'topicConfigurationsToCreateOrUpdate':
            topicConfigurationsToCreateOrUpdate,
      if (topicConfigurationsToDelete != null)
        'topicConfigurationsToDelete': topicConfigurationsToDelete,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/chatcontrols',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing chat response configuration in an Amazon Q Business
  /// application. This operation allows administrators to modify configuration
  /// settings, display name, and response parameters to refine how the system
  /// generates responses.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application containing the
  /// chat response configuration to update.
  ///
  /// Parameter [chatResponseConfigurationId] :
  /// The unique identifier of the chat response configuration to update within
  /// the specified application.
  ///
  /// Parameter [responseConfigurations] :
  /// The updated collection of response configuration settings that define how
  /// Amazon Q Business generates and formats responses to user queries.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  /// This helps prevent the same update from being processed multiple times if
  /// retries occur.
  ///
  /// Parameter [displayName] :
  /// The new human-readable name to assign to the chat response configuration,
  /// making it easier to identify among multiple configurations.
  Future<void> updateChatResponseConfiguration({
    required String applicationId,
    required String chatResponseConfigurationId,
    required Map<ResponseConfigurationType, ResponseConfiguration>
        responseConfigurations,
    String? clientToken,
    String? displayName,
  }) async {
    final $payload = <String, dynamic>{
      'responseConfigurations':
          responseConfigurations.map((k, e) => MapEntry(k.value, e)),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (displayName != null) 'displayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/chatresponseconfigurations/${Uri.encodeComponent(chatResponseConfigurationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the pricing tier for an Amazon Q Business subscription. Upgrades
  /// are instant. Downgrades apply at the start of the next month. Subscription
  /// tier determines feature access for the user. For more information on
  /// subscriptions and pricing tiers, see <a
  /// href="https://aws.amazon.com/q/business/pricing/">Amazon Q Business
  /// pricing</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application where the subscription
  /// update should take effect.
  ///
  /// Parameter [subscriptionId] :
  /// The identifier of the Amazon Q Business subscription to be updated.
  ///
  /// Parameter [type] :
  /// The type of the Amazon Q Business subscription to be updated.
  Future<UpdateSubscriptionResponse> updateSubscription({
    required String applicationId,
    required String subscriptionId,
    required SubscriptionType type,
  }) async {
    final $payload = <String, dynamic>{
      'type': type.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/subscriptions/${Uri.encodeComponent(subscriptionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSubscriptionResponse.fromJson(response);
  }

  /// Updates a information associated with a user id.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application the user is attached to.
  ///
  /// Parameter [userId] :
  /// The email id attached to the user.
  ///
  /// Parameter [userAliasesToDelete] :
  /// The user aliases attached to the user id that are to be deleted.
  ///
  /// Parameter [userAliasesToUpdate] :
  /// The user aliases attached to the user id that are to be updated.
  Future<UpdateUserResponse> updateUser({
    required String applicationId,
    required String userId,
    List<UserAlias>? userAliasesToDelete,
    List<UserAlias>? userAliasesToUpdate,
  }) async {
    final $payload = <String, dynamic>{
      if (userAliasesToDelete != null)
        'userAliasesToDelete': userAliasesToDelete,
      if (userAliasesToUpdate != null)
        'userAliasesToUpdate': userAliasesToUpdate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/users/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserResponse.fromJson(response);
  }

  /// Creates an Amazon Q Business application.
  /// <note>
  /// There are new tiers for Amazon Q Business. Not all features in Amazon Q
  /// Business Pro are also available in Amazon Q Business Lite. For information
  /// on what's included in Amazon Q Business Lite and what's included in Amazon
  /// Q Business Pro, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/tiers.html#user-sub-tiers">Amazon
  /// Q Business tiers</a>. You must use the Amazon Q Business console to assign
  /// subscription tiers to users.
  ///
  /// An Amazon Q Apps service linked role will be created if it's absent in the
  /// Amazon Web Services account when <code>QAppsConfiguration</code> is
  /// enabled in the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/using-service-linked-roles-qapps.html">
  /// Using service-linked roles for Q Apps</a>.
  ///
  /// When you create an application, Amazon Q Business may securely transmit
  /// data for processing from your selected Amazon Web Services region, but
  /// within your geography. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/cross-region-inference.html">Cross
  /// region inference in Amazon Q Business</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [displayName] :
  /// A name for the Amazon Q Business application.
  ///
  /// Parameter [attachmentsConfiguration] :
  /// An option to allow end users to upload files directly during chat.
  ///
  /// Parameter [clientIdsForOIDC] :
  /// The OIDC client ID for a Amazon Q Business application.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create your Amazon Q
  /// Business application.
  ///
  /// Parameter [description] :
  /// A description for the Amazon Q Business application.
  ///
  /// Parameter [encryptionConfiguration] :
  /// The identifier of the KMS key that is used to encrypt your data. Amazon Q
  /// Business doesn't support asymmetric keys.
  ///
  /// Parameter [iamIdentityProviderArn] :
  /// The Amazon Resource Name (ARN) of an identity provider being used by an
  /// Amazon Q Business application.
  ///
  /// Parameter [identityCenterInstanceArn] :
  /// The Amazon Resource Name (ARN) of the IAM Identity Center instance you are
  /// either creating for—or connecting to—your Amazon Q Business application.
  ///
  /// Parameter [identityType] :
  /// The authentication type being used by a Amazon Q Business application.
  ///
  /// Parameter [personalizationConfiguration] :
  /// Configuration information about chat response personalization. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/personalizing-chat-responses.html">Personalizing
  /// chat responses</a>
  ///
  /// Parameter [qAppsConfiguration] :
  /// An option to allow end users to create and use Amazon Q Apps in the web
  /// experience.
  ///
  /// Parameter [quickSightConfiguration] :
  /// The Amazon Quick Suite configuration for an Amazon Q Business application
  /// that uses Quick Suite for authentication. This configuration is required
  /// if your application uses Quick Suite as the identity provider. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/create-quicksight-integrated-application.html">Creating
  /// an Amazon Quick Suite integrated application</a>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permissions to access
  /// your Amazon CloudWatch logs and metrics. If this property is not
  /// specified, Amazon Q Business will create a <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/using-service-linked-roles.html#slr-permissions">service
  /// linked role (SLR)</a> and use it as the application's role.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize your Amazon Q
  /// Business application. You can also use tags to help control access to the
  /// application. Tag keys and values can consist of Unicode letters, digits,
  /// white space, and any of the following symbols: _ . : / = + - @.
  Future<CreateApplicationResponse> createApplication({
    required String displayName,
    AttachmentsConfiguration? attachmentsConfiguration,
    List<String>? clientIdsForOIDC,
    String? clientToken,
    String? description,
    EncryptionConfiguration? encryptionConfiguration,
    String? iamIdentityProviderArn,
    String? identityCenterInstanceArn,
    IdentityType? identityType,
    PersonalizationConfiguration? personalizationConfiguration,
    QAppsConfiguration? qAppsConfiguration,
    QuickSightConfiguration? quickSightConfiguration,
    String? roleArn,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'displayName': displayName,
      if (attachmentsConfiguration != null)
        'attachmentsConfiguration': attachmentsConfiguration,
      if (clientIdsForOIDC != null) 'clientIdsForOIDC': clientIdsForOIDC,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (iamIdentityProviderArn != null)
        'iamIdentityProviderArn': iamIdentityProviderArn,
      if (identityCenterInstanceArn != null)
        'identityCenterInstanceArn': identityCenterInstanceArn,
      if (identityType != null) 'identityType': identityType.value,
      if (personalizationConfiguration != null)
        'personalizationConfiguration': personalizationConfiguration,
      if (qAppsConfiguration != null) 'qAppsConfiguration': qAppsConfiguration,
      if (quickSightConfiguration != null)
        'quickSightConfiguration': quickSightConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationResponse.fromJson(response);
  }

  /// Gets information about an existing Amazon Q Business application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application.
  Future<GetApplicationResponse> getApplication({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationResponse.fromJson(response);
  }

  /// Updates an existing Amazon Q Business application.
  /// <note>
  /// Amazon Q Business applications may securely transmit data for processing
  /// across Amazon Web Services Regions within your geography. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/cross-region-inference.html">Cross
  /// region inference in Amazon Q Business</a>.
  /// </note> <note>
  /// An Amazon Q Apps service-linked role will be created if it's absent in the
  /// Amazon Web Services account when <code>QAppsConfiguration</code> is
  /// enabled in the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/using-service-linked-roles-qapps.html">Using
  /// service-linked roles for Q Apps</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application.
  ///
  /// Parameter [attachmentsConfiguration] :
  /// An option to allow end users to upload files directly during chat.
  ///
  /// Parameter [autoSubscriptionConfiguration] :
  /// An option to enable updating the default subscription type assigned to an
  /// Amazon Q Business application using IAM identity federation for user
  /// management.
  ///
  /// Parameter [description] :
  /// A description for the Amazon Q Business application.
  ///
  /// Parameter [displayName] :
  /// A name for the Amazon Q Business application.
  ///
  /// Parameter [identityCenterInstanceArn] :
  /// The Amazon Resource Name (ARN) of the IAM Identity Center instance you are
  /// either creating for—or connecting to—your Amazon Q Business application.
  ///
  /// Parameter [personalizationConfiguration] :
  /// Configuration information about chat response personalization. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/personalizing-chat-responses.html">Personalizing
  /// chat responses</a>.
  ///
  /// Parameter [qAppsConfiguration] :
  /// An option to allow end users to create and use Amazon Q Apps in the web
  /// experience.
  ///
  /// Parameter [roleArn] :
  /// An Amazon Web Services Identity and Access Management (IAM) role that
  /// gives Amazon Q Business permission to access Amazon CloudWatch logs and
  /// metrics.
  Future<void> updateApplication({
    required String applicationId,
    AttachmentsConfiguration? attachmentsConfiguration,
    AutoSubscriptionConfiguration? autoSubscriptionConfiguration,
    String? description,
    String? displayName,
    String? identityCenterInstanceArn,
    PersonalizationConfiguration? personalizationConfiguration,
    QAppsConfiguration? qAppsConfiguration,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (attachmentsConfiguration != null)
        'attachmentsConfiguration': attachmentsConfiguration,
      if (autoSubscriptionConfiguration != null)
        'autoSubscriptionConfiguration': autoSubscriptionConfiguration,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (identityCenterInstanceArn != null)
        'identityCenterInstanceArn': identityCenterInstanceArn,
      if (personalizationConfiguration != null)
        'personalizationConfiguration': personalizationConfiguration,
      if (qAppsConfiguration != null) 'qAppsConfiguration': qAppsConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Q Business application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application.
  Future<void> deleteApplication({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists Amazon Q Business applications.
  /// <note>
  /// Amazon Q Business applications may securely transmit data for processing
  /// across Amazon Web Services Regions within your geography. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/cross-region-inference.html">Cross
  /// region inference in Amazon Q Business</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Amazon Q Business applications to return.
  ///
  /// Parameter [nextToken] :
  /// If the <code>maxResults</code> response was incomplete because there is
  /// more data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// Amazon Q Business applications.
  Future<ListApplicationsResponse> listApplications({
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
      requestUri: '/applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsResponse.fromJson(response);
  }

  /// Creates a new data accessor for an ISV to access data from a Amazon Q
  /// Business application. The data accessor is an entity that represents the
  /// ISV's access to the Amazon Q Business application's data. It includes the
  /// IAM role ARN for the ISV, a friendly name, and a set of action
  /// configurations that define the specific actions the ISV is allowed to
  /// perform and any associated data filters. When the data accessor is
  /// created, an IAM Identity Center application is also created to manage the
  /// ISV's identity and authentication for accessing the Amazon Q Business
  /// application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionConfigurations] :
  /// A list of action configurations specifying the allowed actions and any
  /// associated filters.
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application.
  ///
  /// Parameter [displayName] :
  /// A friendly name for the data accessor.
  ///
  /// Parameter [principal] :
  /// The Amazon Resource Name (ARN) of the IAM role for the ISV that will be
  /// accessing the data.
  ///
  /// Parameter [authenticationDetail] :
  /// The authentication configuration details for the data accessor. This
  /// specifies how the ISV will authenticate when accessing data through this
  /// data accessor.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier you provide to ensure idempotency of
  /// the request.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the data accessor.
  Future<CreateDataAccessorResponse> createDataAccessor({
    required List<ActionConfiguration> actionConfigurations,
    required String applicationId,
    required String displayName,
    required String principal,
    DataAccessorAuthenticationDetail? authenticationDetail,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'actionConfigurations': actionConfigurations,
      'displayName': displayName,
      'principal': principal,
      if (authenticationDetail != null)
        'authenticationDetail': authenticationDetail,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/dataaccessors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataAccessorResponse.fromJson(response);
  }

  /// Retrieves information about a specified data accessor. This operation
  /// returns details about the data accessor, including its display name,
  /// unique identifier, Amazon Resource Name (ARN), the associated Amazon Q
  /// Business application and IAM Identity Center application, the IAM role for
  /// the ISV, the action configurations, and the timestamps for when the data
  /// accessor was created and last updated.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application.
  ///
  /// Parameter [dataAccessorId] :
  /// The unique identifier of the data accessor to retrieve.
  Future<GetDataAccessorResponse> getDataAccessor({
    required String applicationId,
    required String dataAccessorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/dataaccessors/${Uri.encodeComponent(dataAccessorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataAccessorResponse.fromJson(response);
  }

  /// Updates an existing data accessor. This operation allows modifying the
  /// action configurations (the allowed actions and associated filters) and the
  /// display name of the data accessor. It does not allow changing the IAM role
  /// associated with the data accessor or other core properties of the data
  /// accessor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionConfigurations] :
  /// The updated list of action configurations specifying the allowed actions
  /// and any associated filters.
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application.
  ///
  /// Parameter [dataAccessorId] :
  /// The unique identifier of the data accessor to update.
  ///
  /// Parameter [authenticationDetail] :
  /// The updated authentication configuration details for the data accessor.
  /// This specifies how the ISV will authenticate when accessing data through
  /// this data accessor.
  ///
  /// Parameter [displayName] :
  /// The updated friendly name for the data accessor.
  Future<void> updateDataAccessor({
    required List<ActionConfiguration> actionConfigurations,
    required String applicationId,
    required String dataAccessorId,
    DataAccessorAuthenticationDetail? authenticationDetail,
    String? displayName,
  }) async {
    final $payload = <String, dynamic>{
      'actionConfigurations': actionConfigurations,
      if (authenticationDetail != null)
        'authenticationDetail': authenticationDetail,
      if (displayName != null) 'displayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/dataaccessors/${Uri.encodeComponent(dataAccessorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specified data accessor. This operation permanently removes the
  /// data accessor and its associated IAM Identity Center application. Any
  /// access granted to the ISV through this data accessor will be revoked.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application.
  ///
  /// Parameter [dataAccessorId] :
  /// The unique identifier of the data accessor to delete.
  Future<void> deleteDataAccessor({
    required String applicationId,
    required String dataAccessorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/dataaccessors/${Uri.encodeComponent(dataAccessorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the data accessors for a Amazon Q Business application. This
  /// operation returns a paginated list of data accessor summaries, including
  /// the friendly name, unique identifier, ARN, associated IAM role, and
  /// creation/update timestamps for each data accessor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the Amazon Q Business application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. (You received this token from a
  /// previous call.)
  Future<ListDataAccessorsResponse> listDataAccessors({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/dataaccessors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataAccessorsResponse.fromJson(response);
  }

  /// Creates an Amazon Q Business index.
  ///
  /// To determine if index creation has completed, check the
  /// <code>Status</code> field returned from a call to
  /// <code>DescribeIndex</code>. The <code>Status</code> field is set to
  /// <code>ACTIVE</code> when the index is ready to use.
  ///
  /// Once the index is active, you can index your documents using the <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_BatchPutDocument.html">
  /// <code>BatchPutDocument</code> </a> API or the <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_CreateDataSource.html">
  /// <code>CreateDataSource</code> </a> API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application using the index.
  ///
  /// Parameter [displayName] :
  /// A name for the Amazon Q Business index.
  ///
  /// Parameter [capacityConfiguration] :
  /// The capacity units you want to provision for your index. You can add and
  /// remove capacity to fit your usage needs.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create an index.
  /// Multiple calls to the <code>CreateIndex</code> API with the same client
  /// token will create only one index.
  ///
  /// Parameter [description] :
  /// A description for the Amazon Q Business index.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize the index. You can
  /// also use tags to help control access to the index. Tag keys and values can
  /// consist of Unicode letters, digits, white space, and any of the following
  /// symbols: _ . : / = + - @.
  ///
  /// Parameter [type] :
  /// The index type that's suitable for your needs. For more information on
  /// what's included in each type of index, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/tiers.html#index-tiers">Amazon
  /// Q Business tiers</a>.
  Future<CreateIndexResponse> createIndex({
    required String applicationId,
    required String displayName,
    IndexCapacityConfiguration? capacityConfiguration,
    String? clientToken,
    String? description,
    List<Tag>? tags,
    IndexType? type,
  }) async {
    final $payload = <String, dynamic>{
      'displayName': displayName,
      if (capacityConfiguration != null)
        'capacityConfiguration': capacityConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/indices',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIndexResponse.fromJson(response);
  }

  /// Gets information about an existing Amazon Q Business index.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application connected to the
  /// index.
  ///
  /// Parameter [indexId] :
  /// The identifier of the Amazon Q Business index you want information on.
  Future<GetIndexResponse> getIndex({
    required String applicationId,
    required String indexId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIndexResponse.fromJson(response);
  }

  /// Updates an Amazon Q Business index.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application connected to the
  /// index.
  ///
  /// Parameter [indexId] :
  /// The identifier of the Amazon Q Business index.
  ///
  /// Parameter [capacityConfiguration] :
  /// The storage capacity units you want to provision for your Amazon Q
  /// Business index. You can add and remove capacity to fit your usage needs.
  ///
  /// Parameter [description] :
  /// The description of the Amazon Q Business index.
  ///
  /// Parameter [displayName] :
  /// The name of the Amazon Q Business index.
  ///
  /// Parameter [documentAttributeConfigurations] :
  /// Configuration information for document metadata or fields. Document
  /// metadata are fields or attributes associated with your documents. For
  /// example, the company department name associated with each document. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/doc-attributes-types.html#doc-attributes">Understanding
  /// document attributes</a>.
  Future<void> updateIndex({
    required String applicationId,
    required String indexId,
    IndexCapacityConfiguration? capacityConfiguration,
    String? description,
    String? displayName,
    List<DocumentAttributeConfiguration>? documentAttributeConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      if (capacityConfiguration != null)
        'capacityConfiguration': capacityConfiguration,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (documentAttributeConfigurations != null)
        'documentAttributeConfigurations': documentAttributeConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Q Business index.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application the Amazon Q Business
  /// index is linked to.
  ///
  /// Parameter [indexId] :
  /// The identifier of the Amazon Q Business index.
  Future<void> deleteIndex({
    required String applicationId,
    required String indexId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the Amazon Q Business indices you have created.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application connected to the
  /// index.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of indices to return.
  ///
  /// Parameter [nextToken] :
  /// If the maxResults response was incomplete because there is more data to
  /// retrieve, Amazon Q Business returns a pagination token in the response.
  /// You can use this pagination token to retrieve the next set of Amazon Q
  /// Business indices.
  Future<ListIndicesResponse> listIndices({
    required String applicationId,
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
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/indices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIndicesResponse.fromJson(response);
  }

  /// Creates a data source connector for an Amazon Q Business application.
  ///
  /// <code>CreateDataSource</code> is a synchronous operation. The operation
  /// returns 200 if the data source was successfully created. Otherwise, an
  /// exception is raised.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application the data source will
  /// be attached to.
  ///
  /// Parameter [configuration] :
  /// Configuration information to connect your data source repository to Amazon
  /// Q Business. Use this parameter to provide a JSON schema with configuration
  /// information specific to your data source connector.
  ///
  /// Each data source has a JSON schema provided by Amazon Q Business that you
  /// must use. For example, the Amazon S3 and Web Crawler connectors require
  /// the following JSON schemas:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/s3-api.html">Amazon
  /// S3 JSON schema</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/web-crawler-api.html">Web
  /// Crawler JSON schema</a>
  /// </li>
  /// </ul>
  /// You can find configuration templates for your specific data source using
  /// the following steps:
  /// <ol>
  /// <li>
  /// Navigate to the <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/connectors-list.html">Supported
  /// connectors</a> page in the Amazon Q Business User Guide, and select the
  /// data source of your choice.
  /// </li>
  /// <li>
  /// Then, from your specific data source connector page, select <b>Using the
  /// API</b>. You will find the JSON schema for your data source, including
  /// parameter descriptions, in this section.
  /// </li> </ol>
  ///
  /// Parameter [displayName] :
  /// A name for the data source connector.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that you want to use with the data source
  /// connector.
  ///
  /// Parameter [clientToken] :
  /// A token you provide to identify a request to create a data source
  /// connector. Multiple calls to the <code>CreateDataSource</code> API with
  /// the same client token will create only one data source connector.
  ///
  /// Parameter [description] :
  /// A description for the data source connector.
  ///
  /// Parameter [mediaExtractionConfiguration] :
  /// The configuration for extracting information from media in documents
  /// during ingestion.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// the data source and required resources. This field is required for all
  /// connector types except custom connectors, where it is optional.
  ///
  /// Parameter [syncSchedule] :
  /// Sets the frequency for Amazon Q Business to check the documents in your
  /// data source repository and update your index. If you don't set a schedule,
  /// Amazon Q Business won't periodically update the index.
  ///
  /// Specify a <code>cron-</code> format schedule string or an empty string to
  /// indicate that the index is updated on demand. You can't specify the
  /// <code>Schedule</code> parameter when the <code>Type</code> parameter is
  /// set to <code>CUSTOM</code>. If you do, you receive a
  /// <code>ValidationException</code> exception.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize the data source
  /// connector. You can also use tags to help control access to the data source
  /// connector. Tag keys and values can consist of Unicode letters, digits,
  /// white space, and any of the following symbols: _ . : / = + - @.
  ///
  /// Parameter [vpcConfiguration] :
  /// Configuration information for an Amazon VPC (Virtual Private Cloud) to
  /// connect to your data source. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/connector-vpc.html">Using
  /// Amazon VPC with Amazon Q Business connectors</a>.
  Future<CreateDataSourceResponse> createDataSource({
    required String applicationId,
    required Object configuration,
    required String displayName,
    required String indexId,
    String? clientToken,
    String? description,
    DocumentEnrichmentConfiguration? documentEnrichmentConfiguration,
    MediaExtractionConfiguration? mediaExtractionConfiguration,
    String? roleArn,
    String? syncSchedule,
    List<Tag>? tags,
    DataSourceVpcConfiguration? vpcConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'displayName': displayName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (documentEnrichmentConfiguration != null)
        'documentEnrichmentConfiguration': documentEnrichmentConfiguration,
      if (mediaExtractionConfiguration != null)
        'mediaExtractionConfiguration': mediaExtractionConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
      if (syncSchedule != null) 'syncSchedule': syncSchedule,
      if (tags != null) 'tags': tags,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/datasources',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataSourceResponse.fromJson(response);
  }

  /// Gets information about an existing Amazon Q Business data source
  /// connector.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source connector.
  ///
  /// Parameter [indexId] :
  /// The identfier of the index used with the data source connector.
  Future<GetDataSourceResponse> getDataSource({
    required String applicationId,
    required String dataSourceId,
    required String indexId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/datasources/${Uri.encodeComponent(dataSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataSourceResponse.fromJson(response);
  }

  /// Updates an existing Amazon Q Business data source connector.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application the data source is
  /// attached to.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source connector.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index attached to the data source connector.
  ///
  /// Parameter [description] :
  /// The description of the data source connector.
  ///
  /// Parameter [displayName] :
  /// A name of the data source connector.
  ///
  /// Parameter [mediaExtractionConfiguration] :
  /// The configuration for extracting information from media in documents for
  /// your data source.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// the data source and required resources.
  ///
  /// Parameter [syncSchedule] :
  /// The chosen update frequency for your data source.
  Future<void> updateDataSource({
    required String applicationId,
    required String dataSourceId,
    required String indexId,
    Object? configuration,
    String? description,
    String? displayName,
    DocumentEnrichmentConfiguration? documentEnrichmentConfiguration,
    MediaExtractionConfiguration? mediaExtractionConfiguration,
    String? roleArn,
    String? syncSchedule,
    DataSourceVpcConfiguration? vpcConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (configuration != null) 'configuration': configuration,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (documentEnrichmentConfiguration != null)
        'documentEnrichmentConfiguration': documentEnrichmentConfiguration,
      if (mediaExtractionConfiguration != null)
        'mediaExtractionConfiguration': mediaExtractionConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
      if (syncSchedule != null) 'syncSchedule': syncSchedule,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/datasources/${Uri.encodeComponent(dataSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Q Business data source connector. While the data source
  /// is being deleted, the <code>Status</code> field returned by a call to the
  /// <code>DescribeDataSource</code> API is set to <code>DELETING</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application used with the data
  /// source connector.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source connector that you want to delete.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with the data source connector.
  Future<void> deleteDataSource({
    required String applicationId,
    required String dataSourceId,
    required String indexId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/datasources/${Uri.encodeComponent(dataSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the Amazon Q Business data source connectors that you have created.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application linked to the data
  /// source connectors.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with one or more data source connectors.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of data source connectors to return.
  ///
  /// Parameter [nextToken] :
  /// If the <code>maxResults</code> response was incomplete because there is
  /// more data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// Amazon Q Business data source connectors.
  Future<ListDataSourcesResponse> listDataSources({
    required String applicationId,
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/datasources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSourcesResponse.fromJson(response);
  }

  /// Creates an Amazon Q Business plugin.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application that will contain the plugin.
  ///
  /// Parameter [displayName] :
  /// A the name for your plugin.
  ///
  /// Parameter [type] :
  /// The type of plugin you want to create.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create your Amazon Q
  /// Business plugin.
  ///
  /// Parameter [customPluginConfiguration] :
  /// Contains configuration for a custom plugin.
  ///
  /// Parameter [serverUrl] :
  /// The source URL used for plugin configuration.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize the data source
  /// connector. You can also use tags to help control access to the data source
  /// connector. Tag keys and values can consist of Unicode letters, digits,
  /// white space, and any of the following symbols: _ . : / = + - @.
  Future<CreatePluginResponse> createPlugin({
    required String applicationId,
    required PluginAuthConfiguration authConfiguration,
    required String displayName,
    required PluginType type,
    String? clientToken,
    CustomPluginConfiguration? customPluginConfiguration,
    String? serverUrl,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'authConfiguration': authConfiguration,
      'displayName': displayName,
      'type': type.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customPluginConfiguration != null)
        'customPluginConfiguration': customPluginConfiguration,
      if (serverUrl != null) 'serverUrl': serverUrl,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/plugins',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePluginResponse.fromJson(response);
  }

  /// Gets information about an existing Amazon Q Business plugin.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application which contains the plugin.
  ///
  /// Parameter [pluginId] :
  /// The identifier of the plugin.
  Future<GetPluginResponse> getPlugin({
    required String applicationId,
    required String pluginId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/plugins/${Uri.encodeComponent(pluginId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPluginResponse.fromJson(response);
  }

  /// Updates an Amazon Q Business plugin.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application the plugin is attached to.
  ///
  /// Parameter [pluginId] :
  /// The identifier of the plugin.
  ///
  /// Parameter [authConfiguration] :
  /// The authentication configuration the plugin is using.
  ///
  /// Parameter [customPluginConfiguration] :
  /// The configuration for a custom plugin.
  ///
  /// Parameter [displayName] :
  /// The name of the plugin.
  ///
  /// Parameter [serverUrl] :
  /// The source URL used for plugin configuration.
  ///
  /// Parameter [state] :
  /// The status of the plugin.
  Future<void> updatePlugin({
    required String applicationId,
    required String pluginId,
    PluginAuthConfiguration? authConfiguration,
    CustomPluginConfiguration? customPluginConfiguration,
    String? displayName,
    String? serverUrl,
    PluginState? state,
  }) async {
    final $payload = <String, dynamic>{
      if (authConfiguration != null) 'authConfiguration': authConfiguration,
      if (customPluginConfiguration != null)
        'customPluginConfiguration': customPluginConfiguration,
      if (displayName != null) 'displayName': displayName,
      if (serverUrl != null) 'serverUrl': serverUrl,
      if (state != null) 'state': state.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/plugins/${Uri.encodeComponent(pluginId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Q Business plugin.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier the application attached to the Amazon Q Business plugin.
  ///
  /// Parameter [pluginId] :
  /// The identifier of the plugin being deleted.
  Future<void> deletePlugin({
    required String applicationId,
    required String pluginId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/plugins/${Uri.encodeComponent(pluginId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists configured Amazon Q Business plugins.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application the plugin is attached to.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of documents to return.
  ///
  /// Parameter [nextToken] :
  /// If the <code>maxResults</code> response was incomplete because there is
  /// more data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// plugins.
  Future<ListPluginsResponse> listPlugins({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/plugins',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPluginsResponse.fromJson(response);
  }

  /// Adds a retriever to your Amazon Q Business application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of your Amazon Q Business application.
  ///
  /// Parameter [displayName] :
  /// The name of your retriever.
  ///
  /// Parameter [type] :
  /// The type of retriever you are using.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create your Amazon Q
  /// Business application retriever.
  ///
  /// Parameter [roleArn] :
  /// The ARN of an IAM role used by Amazon Q Business to access the basic
  /// authentication credentials stored in a Secrets Manager secret.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize the retriever. You
  /// can also use tags to help control access to the retriever. Tag keys and
  /// values can consist of Unicode letters, digits, white space, and any of the
  /// following symbols: _ . : / = + - @.
  Future<CreateRetrieverResponse> createRetriever({
    required String applicationId,
    required RetrieverConfiguration configuration,
    required String displayName,
    required RetrieverType type,
    String? clientToken,
    String? roleArn,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'displayName': displayName,
      'type': type.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/retrievers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRetrieverResponse.fromJson(response);
  }

  /// Gets information about an existing retriever used by an Amazon Q Business
  /// application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application using the retriever.
  ///
  /// Parameter [retrieverId] :
  /// The identifier of the retriever.
  Future<GetRetrieverResponse> getRetriever({
    required String applicationId,
    required String retrieverId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/retrievers/${Uri.encodeComponent(retrieverId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRetrieverResponse.fromJson(response);
  }

  /// Updates the retriever used for your Amazon Q Business application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of your Amazon Q Business application.
  ///
  /// Parameter [retrieverId] :
  /// The identifier of your retriever.
  ///
  /// Parameter [displayName] :
  /// The name of your retriever.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// the retriever and required resources.
  Future<void> updateRetriever({
    required String applicationId,
    required String retrieverId,
    RetrieverConfiguration? configuration,
    String? displayName,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (configuration != null) 'configuration': configuration,
      if (displayName != null) 'displayName': displayName,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/retrievers/${Uri.encodeComponent(retrieverId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the retriever used by an Amazon Q Business application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application using the retriever.
  ///
  /// Parameter [retrieverId] :
  /// The identifier of the retriever being deleted.
  Future<void> deleteRetriever({
    required String applicationId,
    required String retrieverId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/retrievers/${Uri.encodeComponent(retrieverId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the retriever used by an Amazon Q Business application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application using the retriever.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of retrievers returned.
  ///
  /// Parameter [nextToken] :
  /// If the number of retrievers returned exceeds <code>maxResults</code>,
  /// Amazon Q Business returns a next token as a pagination token to retrieve
  /// the next set of retrievers.
  Future<ListRetrieversResponse> listRetrievers({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/retrievers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRetrieversResponse.fromJson(response);
  }

  /// Creates an Amazon Q Business web experience.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business web experience.
  ///
  /// Parameter [browserExtensionConfiguration] :
  /// The browser extension configuration for an Amazon Q Business web
  /// experience.
  /// <note>
  /// For Amazon Q Business application using external OIDC-compliant identity
  /// providers (IdPs). The IdP administrator must add the browser extension
  /// sign-in redirect URLs to the IdP application. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/browser-extensions.html">Configure
  /// external OIDC identity provider for your browser extensions.</a>.
  /// </note>
  ///
  /// Parameter [clientToken] :
  /// A token you provide to identify a request to create an Amazon Q Business
  /// web experience.
  ///
  /// Parameter [customizationConfiguration] :
  /// Sets the custom logo, favicon, font, and color used in the Amazon Q web
  /// experience.
  ///
  /// Parameter [identityProviderConfiguration] :
  /// Information about the identity provider (IdP) used to authenticate end
  /// users of an Amazon Q Business web experience.
  ///
  /// Parameter [origins] :
  /// Sets the website domain origins that are allowed to embed the Amazon Q
  /// Business web experience. The <i>domain origin</i> refers to the base URL
  /// for accessing a website including the protocol (<code>http/https</code>),
  /// the domain name, and the port number (if specified).
  /// <note>
  /// You must only submit a <i>base URL</i> and not a full path. For example,
  /// <code>https://docs.aws.amazon.com</code>.
  /// </note>
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the service role attached to your web
  /// experience.
  /// <note>
  /// The <code>roleArn</code> parameter is required when your Amazon Q Business
  /// application is created with IAM Identity Center. It is not required for
  /// SAML-based applications.
  /// </note>
  ///
  /// Parameter [samplePromptsControlMode] :
  /// Determines whether sample prompts are enabled in the web experience for an
  /// end user.
  ///
  /// Parameter [subtitle] :
  /// A subtitle to personalize your Amazon Q Business web experience.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize your Amazon Q
  /// Business web experience. You can also use tags to help control access to
  /// the web experience. Tag keys and values can consist of Unicode letters,
  /// digits, white space, and any of the following symbols: _ . : / = + - @.
  ///
  /// Parameter [title] :
  /// The title for your Amazon Q Business web experience.
  ///
  /// Parameter [welcomeMessage] :
  /// The customized welcome message for end users of an Amazon Q Business web
  /// experience.
  Future<CreateWebExperienceResponse> createWebExperience({
    required String applicationId,
    BrowserExtensionConfiguration? browserExtensionConfiguration,
    String? clientToken,
    CustomizationConfiguration? customizationConfiguration,
    IdentityProviderConfiguration? identityProviderConfiguration,
    List<String>? origins,
    String? roleArn,
    WebExperienceSamplePromptsControlMode? samplePromptsControlMode,
    String? subtitle,
    List<Tag>? tags,
    String? title,
    String? welcomeMessage,
  }) async {
    final $payload = <String, dynamic>{
      if (browserExtensionConfiguration != null)
        'browserExtensionConfiguration': browserExtensionConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customizationConfiguration != null)
        'customizationConfiguration': customizationConfiguration,
      if (identityProviderConfiguration != null)
        'identityProviderConfiguration': identityProviderConfiguration,
      if (origins != null) 'origins': origins,
      if (roleArn != null) 'roleArn': roleArn,
      if (samplePromptsControlMode != null)
        'samplePromptsControlMode': samplePromptsControlMode.value,
      if (subtitle != null) 'subtitle': subtitle,
      if (tags != null) 'tags': tags,
      if (title != null) 'title': title,
      if (welcomeMessage != null) 'welcomeMessage': welcomeMessage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/experiences',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWebExperienceResponse.fromJson(response);
  }

  /// Gets information about an existing Amazon Q Business web experience.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application linked to the web
  /// experience.
  ///
  /// Parameter [webExperienceId] :
  /// The identifier of the Amazon Q Business web experience.
  Future<GetWebExperienceResponse> getWebExperience({
    required String applicationId,
    required String webExperienceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/experiences/${Uri.encodeComponent(webExperienceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWebExperienceResponse.fromJson(response);
  }

  /// Updates an Amazon Q Business web experience.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application attached to the web
  /// experience.
  ///
  /// Parameter [webExperienceId] :
  /// The identifier of the Amazon Q Business web experience.
  ///
  /// Parameter [authenticationConfiguration] :
  /// The authentication configuration of the Amazon Q Business web experience.
  ///
  /// Parameter [browserExtensionConfiguration] :
  /// The browser extension configuration for an Amazon Q Business web
  /// experience.
  /// <note>
  /// For Amazon Q Business application using external OIDC-compliant identity
  /// providers (IdPs). The IdP administrator must add the browser extension
  /// sign-in redirect URLs to the IdP application. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/browser-extensions.html">Configure
  /// external OIDC identity provider for your browser extensions.</a>.
  /// </note>
  ///
  /// Parameter [customizationConfiguration] :
  /// Updates the custom logo, favicon, font, and color used in the Amazon Q web
  /// experience.
  ///
  /// Parameter [identityProviderConfiguration] :
  /// Information about the identity provider (IdP) used to authenticate end
  /// users of an Amazon Q Business web experience.
  ///
  /// Parameter [origins] :
  /// Updates the website domain origins that are allowed to embed the Amazon Q
  /// Business web experience. The <i>domain origin</i> refers to the <i>base
  /// URL</i> for accessing a website including the protocol
  /// (<code>http/https</code>), the domain name, and the port number (if
  /// specified).
  /// <note>
  /// <ul>
  /// <li>
  /// Any values except <code>null</code> submitted as part of this update will
  /// replace all previous values.
  /// </li>
  /// <li>
  /// You must only submit a <i>base URL</i> and not a full path. For example,
  /// <code>https://docs.aws.amazon.com</code>.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role with permission to access the
  /// Amazon Q Business web experience and required resources.
  ///
  /// Parameter [samplePromptsControlMode] :
  /// Determines whether sample prompts are enabled in the web experience for an
  /// end user.
  ///
  /// Parameter [subtitle] :
  /// The subtitle of the Amazon Q Business web experience.
  ///
  /// Parameter [title] :
  /// The title of the Amazon Q Business web experience.
  ///
  /// Parameter [welcomeMessage] :
  /// A customized welcome message for an end user in an Amazon Q Business web
  /// experience.
  Future<void> updateWebExperience({
    required String applicationId,
    required String webExperienceId,
    WebExperienceAuthConfiguration? authenticationConfiguration,
    BrowserExtensionConfiguration? browserExtensionConfiguration,
    CustomizationConfiguration? customizationConfiguration,
    IdentityProviderConfiguration? identityProviderConfiguration,
    List<String>? origins,
    String? roleArn,
    WebExperienceSamplePromptsControlMode? samplePromptsControlMode,
    String? subtitle,
    String? title,
    String? welcomeMessage,
  }) async {
    final $payload = <String, dynamic>{
      if (authenticationConfiguration != null)
        'authenticationConfiguration': authenticationConfiguration,
      if (browserExtensionConfiguration != null)
        'browserExtensionConfiguration': browserExtensionConfiguration,
      if (customizationConfiguration != null)
        'customizationConfiguration': customizationConfiguration,
      if (identityProviderConfiguration != null)
        'identityProviderConfiguration': identityProviderConfiguration,
      if (origins != null) 'origins': origins,
      if (roleArn != null) 'roleArn': roleArn,
      if (samplePromptsControlMode != null)
        'samplePromptsControlMode': samplePromptsControlMode.value,
      if (subtitle != null) 'subtitle': subtitle,
      if (title != null) 'title': title,
      if (welcomeMessage != null) 'welcomeMessage': welcomeMessage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/experiences/${Uri.encodeComponent(webExperienceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Q Business web experience.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application linked to the Amazon Q
  /// Business web experience.
  ///
  /// Parameter [webExperienceId] :
  /// The identifier of the Amazon Q Business web experience being deleted.
  Future<void> deleteWebExperience({
    required String applicationId,
    required String webExperienceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/experiences/${Uri.encodeComponent(webExperienceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists one or more Amazon Q Business Web Experiences.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application linked to the listed
  /// web experiences.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Amazon Q Business Web Experiences to return.
  ///
  /// Parameter [nextToken] :
  /// If the <code>maxResults</code> response was incomplete because there is
  /// more data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// Amazon Q Business conversations.
  Future<ListWebExperiencesResponse> listWebExperiences({
    required String applicationId,
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
          '/applications/${Uri.encodeComponent(applicationId)}/experiences',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWebExperiencesResponse.fromJson(response);
  }
}

class AssociatePermissionResponse {
  /// The JSON representation of the added permission statement.
  final String? statement;

  AssociatePermissionResponse({
    this.statement,
  });

  factory AssociatePermissionResponse.fromJson(Map<String, dynamic> json) {
    return AssociatePermissionResponse(
      statement: json['statement'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    return {
      if (statement != null) 'statement': statement,
    };
  }
}

class BatchDeleteDocumentResponse {
  /// A list of documents that couldn't be removed from the Amazon Q Business
  /// index. Each entry contains an error message that indicates why the document
  /// couldn't be removed from the index.
  final List<FailedDocument>? failedDocuments;

  BatchDeleteDocumentResponse({
    this.failedDocuments,
  });

  factory BatchDeleteDocumentResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteDocumentResponse(
      failedDocuments: (json['failedDocuments'] as List?)
          ?.nonNulls
          .map((e) => FailedDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedDocuments = this.failedDocuments;
    return {
      if (failedDocuments != null) 'failedDocuments': failedDocuments,
    };
  }
}

class BatchPutDocumentResponse {
  /// A list of documents that were not added to the Amazon Q Business index
  /// because the document failed a validation check. Each document contains an
  /// error message that indicates why the document couldn't be added to the
  /// index.
  final List<FailedDocument>? failedDocuments;

  BatchPutDocumentResponse({
    this.failedDocuments,
  });

  factory BatchPutDocumentResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutDocumentResponse(
      failedDocuments: (json['failedDocuments'] as List?)
          ?.nonNulls
          .map((e) => FailedDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedDocuments = this.failedDocuments;
    return {
      if (failedDocuments != null) 'failedDocuments': failedDocuments,
    };
  }
}

class CancelSubscriptionResponse {
  /// The type of your current Amazon Q Business subscription.
  final SubscriptionDetails? currentSubscription;

  /// The type of the Amazon Q Business subscription for the next month.
  final SubscriptionDetails? nextSubscription;

  /// The Amazon Resource Name (ARN) of the Amazon Q Business subscription being
  /// cancelled.
  final String? subscriptionArn;

  CancelSubscriptionResponse({
    this.currentSubscription,
    this.nextSubscription,
    this.subscriptionArn,
  });

  factory CancelSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return CancelSubscriptionResponse(
      currentSubscription: json['currentSubscription'] != null
          ? SubscriptionDetails.fromJson(
              json['currentSubscription'] as Map<String, dynamic>)
          : null,
      nextSubscription: json['nextSubscription'] != null
          ? SubscriptionDetails.fromJson(
              json['nextSubscription'] as Map<String, dynamic>)
          : null,
      subscriptionArn: json['subscriptionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentSubscription = this.currentSubscription;
    final nextSubscription = this.nextSubscription;
    final subscriptionArn = this.subscriptionArn;
    return {
      if (currentSubscription != null)
        'currentSubscription': currentSubscription,
      if (nextSubscription != null) 'nextSubscription': nextSubscription,
      if (subscriptionArn != null) 'subscriptionArn': subscriptionArn,
    };
  }
}

class ChatOutput {
  /// The streaming output for the <code>Chat</code> API.
  final ChatOutputStream? outputStream;

  ChatOutput({
    this.outputStream,
  });

  Map<String, dynamic> toJson() {
    final outputStream = this.outputStream;
    return {
      if (outputStream != null) 'outputStream': outputStream,
    };
  }
}

class ChatSyncOutput {
  /// A request from Amazon Q Business to the end user for information Amazon Q
  /// Business needs to successfully complete a requested plugin action.
  final ActionReview? actionReview;

  /// An authentication verification event activated by an end user request to use
  /// a custom plugin.
  final AuthChallengeRequest? authChallengeRequest;

  /// The identifier of the Amazon Q Business conversation.
  final String? conversationId;

  /// A list of files which failed to upload during chat.
  final List<AttachmentOutput>? failedAttachments;

  /// The source documents used to generate the conversation response.
  final List<SourceAttribution>? sourceAttributions;

  /// An AI-generated message in a conversation.
  final String? systemMessage;

  /// The identifier of an Amazon Q Business AI generated message within the
  /// conversation.
  final String? systemMessageId;

  /// The identifier of an Amazon Q Business end user text input message within
  /// the conversation.
  final String? userMessageId;

  ChatSyncOutput({
    this.actionReview,
    this.authChallengeRequest,
    this.conversationId,
    this.failedAttachments,
    this.sourceAttributions,
    this.systemMessage,
    this.systemMessageId,
    this.userMessageId,
  });

  factory ChatSyncOutput.fromJson(Map<String, dynamic> json) {
    return ChatSyncOutput(
      actionReview: json['actionReview'] != null
          ? ActionReview.fromJson(json['actionReview'] as Map<String, dynamic>)
          : null,
      authChallengeRequest: json['authChallengeRequest'] != null
          ? AuthChallengeRequest.fromJson(
              json['authChallengeRequest'] as Map<String, dynamic>)
          : null,
      conversationId: json['conversationId'] as String?,
      failedAttachments: (json['failedAttachments'] as List?)
          ?.nonNulls
          .map((e) => AttachmentOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceAttributions: (json['sourceAttributions'] as List?)
          ?.nonNulls
          .map((e) => SourceAttribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      systemMessage: json['systemMessage'] as String?,
      systemMessageId: json['systemMessageId'] as String?,
      userMessageId: json['userMessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionReview = this.actionReview;
    final authChallengeRequest = this.authChallengeRequest;
    final conversationId = this.conversationId;
    final failedAttachments = this.failedAttachments;
    final sourceAttributions = this.sourceAttributions;
    final systemMessage = this.systemMessage;
    final systemMessageId = this.systemMessageId;
    final userMessageId = this.userMessageId;
    return {
      if (actionReview != null) 'actionReview': actionReview,
      if (authChallengeRequest != null)
        'authChallengeRequest': authChallengeRequest,
      if (conversationId != null) 'conversationId': conversationId,
      if (failedAttachments != null) 'failedAttachments': failedAttachments,
      if (sourceAttributions != null) 'sourceAttributions': sourceAttributions,
      if (systemMessage != null) 'systemMessage': systemMessage,
      if (systemMessageId != null) 'systemMessageId': systemMessageId,
      if (userMessageId != null) 'userMessageId': userMessageId,
    };
  }
}

class CheckDocumentAccessResponse {
  /// The Access Control List (ACL) associated with the document. Includes
  /// allowlist and denylist conditions that determine user access.
  final DocumentAcl? documentAcl;

  /// A boolean value indicating whether the specified user has access to the
  /// document, either direct access or transitive access via groups and aliases
  /// attached to the document.
  final bool? hasAccess;

  /// An array of aliases associated with the user. This includes both global and
  /// local aliases, each with a name and type.
  final List<AssociatedUser>? userAliases;

  /// An array of groups the user is part of for the specified data source. Each
  /// group has a name and type.
  final List<AssociatedGroup>? userGroups;

  CheckDocumentAccessResponse({
    this.documentAcl,
    this.hasAccess,
    this.userAliases,
    this.userGroups,
  });

  factory CheckDocumentAccessResponse.fromJson(Map<String, dynamic> json) {
    return CheckDocumentAccessResponse(
      documentAcl: json['documentAcl'] != null
          ? DocumentAcl.fromJson(json['documentAcl'] as Map<String, dynamic>)
          : null,
      hasAccess: json['hasAccess'] as bool?,
      userAliases: (json['userAliases'] as List?)
          ?.nonNulls
          .map((e) => AssociatedUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      userGroups: (json['userGroups'] as List?)
          ?.nonNulls
          .map((e) => AssociatedGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentAcl = this.documentAcl;
    final hasAccess = this.hasAccess;
    final userAliases = this.userAliases;
    final userGroups = this.userGroups;
    return {
      if (documentAcl != null) 'documentAcl': documentAcl,
      if (hasAccess != null) 'hasAccess': hasAccess,
      if (userAliases != null) 'userAliases': userAliases,
      if (userGroups != null) 'userGroups': userGroups,
    };
  }
}

class CreateAnonymousWebExperienceUrlResponse {
  /// The unique URL for accessing the web experience.
  /// <important>
  /// This URL can only be used once and must be used within 5 minutes after it's
  /// generated.
  /// </important>
  final String? anonymousUrl;

  CreateAnonymousWebExperienceUrlResponse({
    this.anonymousUrl,
  });

  factory CreateAnonymousWebExperienceUrlResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAnonymousWebExperienceUrlResponse(
      anonymousUrl: json['anonymousUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anonymousUrl = this.anonymousUrl;
    return {
      if (anonymousUrl != null) 'anonymousUrl': anonymousUrl,
    };
  }
}

class CreateChatResponseConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the newly created chat response
  /// configuration, which uniquely identifies the resource across all Amazon Web
  /// Services services.
  final String chatResponseConfigurationArn;

  /// The unique identifier assigned to a newly created chat response
  /// configuration, used for subsequent operations on this resource.
  final String chatResponseConfigurationId;

  CreateChatResponseConfigurationResponse({
    required this.chatResponseConfigurationArn,
    required this.chatResponseConfigurationId,
  });

  factory CreateChatResponseConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateChatResponseConfigurationResponse(
      chatResponseConfigurationArn:
          (json['chatResponseConfigurationArn'] as String?) ?? '',
      chatResponseConfigurationId:
          (json['chatResponseConfigurationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final chatResponseConfigurationArn = this.chatResponseConfigurationArn;
    final chatResponseConfigurationId = this.chatResponseConfigurationId;
    return {
      'chatResponseConfigurationArn': chatResponseConfigurationArn,
      'chatResponseConfigurationId': chatResponseConfigurationId,
    };
  }
}

class CreateSubscriptionResponse {
  /// The type of your current Amazon Q Business subscription.
  final SubscriptionDetails? currentSubscription;

  /// The type of the Amazon Q Business subscription for the next month.
  final SubscriptionDetails? nextSubscription;

  /// The Amazon Resource Name (ARN) of the Amazon Q Business subscription
  /// created.
  final String? subscriptionArn;

  /// The identifier of the Amazon Q Business subscription created.
  final String? subscriptionId;

  CreateSubscriptionResponse({
    this.currentSubscription,
    this.nextSubscription,
    this.subscriptionArn,
    this.subscriptionId,
  });

  factory CreateSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return CreateSubscriptionResponse(
      currentSubscription: json['currentSubscription'] != null
          ? SubscriptionDetails.fromJson(
              json['currentSubscription'] as Map<String, dynamic>)
          : null,
      nextSubscription: json['nextSubscription'] != null
          ? SubscriptionDetails.fromJson(
              json['nextSubscription'] as Map<String, dynamic>)
          : null,
      subscriptionArn: json['subscriptionArn'] as String?,
      subscriptionId: json['subscriptionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentSubscription = this.currentSubscription;
    final nextSubscription = this.nextSubscription;
    final subscriptionArn = this.subscriptionArn;
    final subscriptionId = this.subscriptionId;
    return {
      if (currentSubscription != null)
        'currentSubscription': currentSubscription,
      if (nextSubscription != null) 'nextSubscription': nextSubscription,
      if (subscriptionArn != null) 'subscriptionArn': subscriptionArn,
      if (subscriptionId != null) 'subscriptionId': subscriptionId,
    };
  }
}

class CreateUserResponse {
  CreateUserResponse();

  factory CreateUserResponse.fromJson(Map<String, dynamic> _) {
    return CreateUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAttachmentResponse {
  DeleteAttachmentResponse();

  factory DeleteAttachmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAttachmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteChatControlsConfigurationResponse {
  DeleteChatControlsConfigurationResponse();

  factory DeleteChatControlsConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteChatControlsConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteChatResponseConfigurationResponse {
  DeleteChatResponseConfigurationResponse();

  factory DeleteChatResponseConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteChatResponseConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteConversationResponse {
  DeleteConversationResponse();

  factory DeleteConversationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteConversationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteGroupResponse {
  DeleteGroupResponse();

  factory DeleteGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteUserResponse {
  DeleteUserResponse();

  factory DeleteUserResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociatePermissionResponse {
  DisassociatePermissionResponse();

  factory DisassociatePermissionResponse.fromJson(Map<String, dynamic> _) {
    return DisassociatePermissionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetChatControlsConfigurationResponse {
  /// The phrases blocked from chat by your chat control configuration.
  final BlockedPhrasesConfiguration? blockedPhrases;

  /// The configuration details for <code>CREATOR_MODE</code>.
  final AppliedCreatorModeConfiguration? creatorModeConfiguration;

  /// The hallucination reduction settings for your application.
  final HallucinationReductionConfiguration?
      hallucinationReductionConfiguration;

  /// If the <code>maxResults</code> response was incomplete because there is more
  /// data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// Amazon Q Business chat controls configured.
  final String? nextToken;

  /// The chat response orchestration settings for your application.
  /// <note>
  /// Chat orchestration is optimized to work for English language content. For
  /// more details on language support in Amazon Q Business, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/supported-languages.html">Supported
  /// languages</a>.
  /// </note>
  final AppliedOrchestrationConfiguration? orchestrationConfiguration;

  /// The response scope configured for a Amazon Q Business application. This
  /// determines whether your application uses its retrieval augmented generation
  /// (RAG) system to generate answers only from your enterprise data, or also
  /// uses the large language models (LLM) knowledge to respons to end user
  /// questions in chat.
  final ResponseScope? responseScope;

  /// The topic specific controls configured for a Amazon Q Business application.
  final List<TopicConfiguration>? topicConfigurations;

  GetChatControlsConfigurationResponse({
    this.blockedPhrases,
    this.creatorModeConfiguration,
    this.hallucinationReductionConfiguration,
    this.nextToken,
    this.orchestrationConfiguration,
    this.responseScope,
    this.topicConfigurations,
  });

  factory GetChatControlsConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetChatControlsConfigurationResponse(
      blockedPhrases: json['blockedPhrases'] != null
          ? BlockedPhrasesConfiguration.fromJson(
              json['blockedPhrases'] as Map<String, dynamic>)
          : null,
      creatorModeConfiguration: json['creatorModeConfiguration'] != null
          ? AppliedCreatorModeConfiguration.fromJson(
              json['creatorModeConfiguration'] as Map<String, dynamic>)
          : null,
      hallucinationReductionConfiguration:
          json['hallucinationReductionConfiguration'] != null
              ? HallucinationReductionConfiguration.fromJson(
                  json['hallucinationReductionConfiguration']
                      as Map<String, dynamic>)
              : null,
      nextToken: json['nextToken'] as String?,
      orchestrationConfiguration: json['orchestrationConfiguration'] != null
          ? AppliedOrchestrationConfiguration.fromJson(
              json['orchestrationConfiguration'] as Map<String, dynamic>)
          : null,
      responseScope:
          (json['responseScope'] as String?)?.let(ResponseScope.fromString),
      topicConfigurations: (json['topicConfigurations'] as List?)
          ?.nonNulls
          .map((e) => TopicConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final blockedPhrases = this.blockedPhrases;
    final creatorModeConfiguration = this.creatorModeConfiguration;
    final hallucinationReductionConfiguration =
        this.hallucinationReductionConfiguration;
    final nextToken = this.nextToken;
    final orchestrationConfiguration = this.orchestrationConfiguration;
    final responseScope = this.responseScope;
    final topicConfigurations = this.topicConfigurations;
    return {
      if (blockedPhrases != null) 'blockedPhrases': blockedPhrases,
      if (creatorModeConfiguration != null)
        'creatorModeConfiguration': creatorModeConfiguration,
      if (hallucinationReductionConfiguration != null)
        'hallucinationReductionConfiguration':
            hallucinationReductionConfiguration,
      if (nextToken != null) 'nextToken': nextToken,
      if (orchestrationConfiguration != null)
        'orchestrationConfiguration': orchestrationConfiguration,
      if (responseScope != null) 'responseScope': responseScope.value,
      if (topicConfigurations != null)
        'topicConfigurations': topicConfigurations,
    };
  }
}

class GetChatResponseConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the retrieved chat response configuration,
  /// which uniquely identifies the resource across all Amazon Web Services
  /// services.
  final String? chatResponseConfigurationArn;

  /// The unique identifier of the retrieved chat response configuration.
  final String? chatResponseConfigurationId;

  /// The timestamp indicating when the chat response configuration was initially
  /// created.
  final DateTime? createdAt;

  /// The human-readable name of the retrieved chat response configuration, making
  /// it easier to identify among multiple configurations.
  final String? displayName;

  /// The currently active configuration settings that are being used to generate
  /// responses in the Amazon Q Business application.
  final ChatResponseConfigurationDetail? inUseConfiguration;

  /// Information about the most recent update to the configuration, including
  /// timestamp and modification details.
  final ChatResponseConfigurationDetail? lastUpdateConfiguration;

  GetChatResponseConfigurationResponse({
    this.chatResponseConfigurationArn,
    this.chatResponseConfigurationId,
    this.createdAt,
    this.displayName,
    this.inUseConfiguration,
    this.lastUpdateConfiguration,
  });

  factory GetChatResponseConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetChatResponseConfigurationResponse(
      chatResponseConfigurationArn:
          json['chatResponseConfigurationArn'] as String?,
      chatResponseConfigurationId:
          json['chatResponseConfigurationId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      inUseConfiguration: json['inUseConfiguration'] != null
          ? ChatResponseConfigurationDetail.fromJson(
              json['inUseConfiguration'] as Map<String, dynamic>)
          : null,
      lastUpdateConfiguration: json['lastUpdateConfiguration'] != null
          ? ChatResponseConfigurationDetail.fromJson(
              json['lastUpdateConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final chatResponseConfigurationArn = this.chatResponseConfigurationArn;
    final chatResponseConfigurationId = this.chatResponseConfigurationId;
    final createdAt = this.createdAt;
    final displayName = this.displayName;
    final inUseConfiguration = this.inUseConfiguration;
    final lastUpdateConfiguration = this.lastUpdateConfiguration;
    return {
      if (chatResponseConfigurationArn != null)
        'chatResponseConfigurationArn': chatResponseConfigurationArn,
      if (chatResponseConfigurationId != null)
        'chatResponseConfigurationId': chatResponseConfigurationId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (inUseConfiguration != null) 'inUseConfiguration': inUseConfiguration,
      if (lastUpdateConfiguration != null)
        'lastUpdateConfiguration': lastUpdateConfiguration,
    };
  }
}

class GetDocumentContentResponse {
  /// The MIME type of the document content. When outputFormat is RAW, this
  /// corresponds to the original document's MIME type (e.g., application/pdf,
  /// text/plain,
  /// application/vnd.openxmlformats-officedocument.wordprocessingml.document).
  /// When outputFormat is EXTRACTED, the MIME type is always application/json.
  final String mimeType;

  /// A pre-signed URL that provides temporary access to download the document
  /// content directly from Amazon Q Business. The URL expires after 5 minutes for
  /// security purposes. This URL is generated only after successful ACL
  /// validation.
  final String presignedUrl;

  GetDocumentContentResponse({
    required this.mimeType,
    required this.presignedUrl,
  });

  factory GetDocumentContentResponse.fromJson(Map<String, dynamic> json) {
    return GetDocumentContentResponse(
      mimeType: (json['mimeType'] as String?) ?? '',
      presignedUrl: (json['presignedUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final mimeType = this.mimeType;
    final presignedUrl = this.presignedUrl;
    return {
      'mimeType': mimeType,
      'presignedUrl': presignedUrl,
    };
  }
}

class GetGroupResponse {
  /// The current status of the group.
  final GroupStatusDetail? status;

  /// The status history of the group.
  final List<GroupStatusDetail>? statusHistory;

  GetGroupResponse({
    this.status,
    this.statusHistory,
  });

  factory GetGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetGroupResponse(
      status: json['status'] != null
          ? GroupStatusDetail.fromJson(json['status'] as Map<String, dynamic>)
          : null,
      statusHistory: (json['statusHistory'] as List?)
          ?.nonNulls
          .map((e) => GroupStatusDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusHistory = this.statusHistory;
    return {
      if (status != null) 'status': status,
      if (statusHistory != null) 'statusHistory': statusHistory,
    };
  }
}

class GetMediaResponse {
  /// The base64-encoded bytes of the media object.
  final Uint8List? mediaBytes;

  /// The MIME type of the media object (image/png).
  final String? mediaMimeType;

  GetMediaResponse({
    this.mediaBytes,
    this.mediaMimeType,
  });

  factory GetMediaResponse.fromJson(Map<String, dynamic> json) {
    return GetMediaResponse(
      mediaBytes: _s.decodeNullableUint8List(json['mediaBytes'] as String?),
      mediaMimeType: json['mediaMimeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaBytes = this.mediaBytes;
    final mediaMimeType = this.mediaMimeType;
    return {
      if (mediaBytes != null) 'mediaBytes': base64Encode(mediaBytes),
      if (mediaMimeType != null) 'mediaMimeType': mediaMimeType,
    };
  }
}

class GetPolicyResponse {
  /// The JSON representation of the permission policy.
  final String? policy;

  GetPolicyResponse({
    this.policy,
  });

  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetPolicyResponse(
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

class GetUserResponse {
  /// A list of user aliases attached to a user.
  final List<UserAlias>? userAliases;

  GetUserResponse({
    this.userAliases,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) {
    return GetUserResponse(
      userAliases: (json['userAliases'] as List?)
          ?.nonNulls
          .map((e) => UserAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final userAliases = this.userAliases;
    return {
      if (userAliases != null) 'userAliases': userAliases,
    };
  }
}

class ListAttachmentsResponse {
  /// An array of information on one or more attachments.
  final List<Attachment>? attachments;

  /// If the response is truncated, Amazon Q Business returns this token, which
  /// you can use in a later request to list the next set of attachments.
  final String? nextToken;

  ListAttachmentsResponse({
    this.attachments,
    this.nextToken,
  });

  factory ListAttachmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListAttachmentsResponse(
      attachments: (json['attachments'] as List?)
          ?.nonNulls
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachments = this.attachments;
    final nextToken = this.nextToken;
    return {
      if (attachments != null) 'attachments': attachments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListChatResponseConfigurationsResponse {
  /// A list of chat response configuration summaries, each containing key
  /// information about an available configuration in the specified application.
  final List<ChatResponseConfiguration>? chatResponseConfigurations;

  /// A pagination token that can be used in a subsequent request to retrieve
  /// additional chat response configurations if the results were truncated due to
  /// the <code>maxResults</code> parameter.
  final String? nextToken;

  ListChatResponseConfigurationsResponse({
    this.chatResponseConfigurations,
    this.nextToken,
  });

  factory ListChatResponseConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListChatResponseConfigurationsResponse(
      chatResponseConfigurations: (json['chatResponseConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              ChatResponseConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final chatResponseConfigurations = this.chatResponseConfigurations;
    final nextToken = this.nextToken;
    return {
      if (chatResponseConfigurations != null)
        'chatResponseConfigurations': chatResponseConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListConversationsResponse {
  /// An array of summary information on the configuration of one or more Amazon Q
  /// Business web experiences.
  final List<Conversation>? conversations;

  /// If the response is truncated, Amazon Q Business returns this token, which
  /// you can use in a later request to list the next set of messages.
  final String? nextToken;

  ListConversationsResponse({
    this.conversations,
    this.nextToken,
  });

  factory ListConversationsResponse.fromJson(Map<String, dynamic> json) {
    return ListConversationsResponse(
      conversations: (json['conversations'] as List?)
          ?.nonNulls
          .map((e) => Conversation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conversations = this.conversations;
    final nextToken = this.nextToken;
    return {
      if (conversations != null) 'conversations': conversations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDataSourceSyncJobsResponse {
  /// A history of synchronization jobs for the data source connector.
  final List<DataSourceSyncJob>? history;

  /// If the response is truncated, Amazon Q Business returns this token. You can
  /// use this token in any subsequent request to retrieve the next set of jobs.
  final String? nextToken;

  ListDataSourceSyncJobsResponse({
    this.history,
    this.nextToken,
  });

  factory ListDataSourceSyncJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSourceSyncJobsResponse(
      history: (json['history'] as List?)
          ?.nonNulls
          .map((e) => DataSourceSyncJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final history = this.history;
    final nextToken = this.nextToken;
    return {
      if (history != null) 'history': history,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDocumentsResponse {
  /// A list of document details.
  final List<DocumentDetails>? documentDetailList;

  /// If the <code>maxResults</code> response was incomplete because there is more
  /// data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// documents.
  final String? nextToken;

  ListDocumentsResponse({
    this.documentDetailList,
    this.nextToken,
  });

  factory ListDocumentsResponse.fromJson(Map<String, dynamic> json) {
    return ListDocumentsResponse(
      documentDetailList: (json['documentDetailList'] as List?)
          ?.nonNulls
          .map((e) => DocumentDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentDetailList = this.documentDetailList;
    final nextToken = this.nextToken;
    return {
      if (documentDetailList != null) 'documentDetailList': documentDetailList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListGroupsResponse {
  /// Summary information for list of groups that are mapped to users.
  final List<GroupSummary>? items;

  /// If the response is truncated, Amazon Q Business returns this token that you
  /// can use in the subsequent request to retrieve the next set of groups that
  /// are mapped to users.
  final String? nextToken;

  ListGroupsResponse({
    this.items,
    this.nextToken,
  });

  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => GroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListMessagesResponse {
  /// An array of information on one or more messages.
  final List<Message>? messages;

  /// If the response is truncated, Amazon Q Business returns this token, which
  /// you can use in a later request to list the next set of messages.
  final String? nextToken;

  ListMessagesResponse({
    this.messages,
    this.nextToken,
  });

  factory ListMessagesResponse.fromJson(Map<String, dynamic> json) {
    return ListMessagesResponse(
      messages: (json['messages'] as List?)
          ?.nonNulls
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messages = this.messages;
    final nextToken = this.nextToken;
    return {
      if (messages != null) 'messages': messages,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPluginActionsResponse {
  /// An array of information on one or more plugin actions.
  final List<ActionSummary>? items;

  /// If the response is truncated, Amazon Q Business returns this token, which
  /// you can use in a later request to list the next set of plugin actions.
  final String? nextToken;

  ListPluginActionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListPluginActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPluginActionsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ActionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPluginTypeActionsResponse {
  /// An array of information on one or more plugins.
  final List<ActionSummary>? items;

  /// If the response is truncated, Amazon Q Business returns this token, which
  /// you can use in a later request to list the next set of plugins.
  final String? nextToken;

  ListPluginTypeActionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListPluginTypeActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPluginTypeActionsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ActionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPluginTypeMetadataResponse {
  /// An array of information on plugin metadata.
  final List<PluginTypeMetadataSummary>? items;

  /// If the response is truncated, Amazon Q Business returns this token, which
  /// you can use in a later request to list the next set of plugin metadata.
  final String? nextToken;

  ListPluginTypeMetadataResponse({
    this.items,
    this.nextToken,
  });

  factory ListPluginTypeMetadataResponse.fromJson(Map<String, dynamic> json) {
    return ListPluginTypeMetadataResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              PluginTypeMetadataSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSubscriptionsResponse {
  /// If the response is truncated, Amazon Q Business returns this token. You can
  /// use this token in a subsequent request to retrieve the next set of
  /// subscriptions.
  final String? nextToken;

  /// An array of summary information on the subscriptions configured for an
  /// Amazon Q Business application.
  final List<Subscription>? subscriptions;

  ListSubscriptionsResponse({
    this.nextToken,
    this.subscriptions,
  });

  factory ListSubscriptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSubscriptionsResponse(
      nextToken: json['nextToken'] as String?,
      subscriptions: (json['subscriptions'] as List?)
          ?.nonNulls
          .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subscriptions = this.subscriptions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (subscriptions != null) 'subscriptions': subscriptions,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags associated with the Amazon Q Business application or data
  /// source.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class PutGroupResponse {
  PutGroupResponse();

  factory PutGroupResponse.fromJson(Map<String, dynamic> _) {
    return PutGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class SearchRelevantContentResponse {
  /// The token to use to retrieve the next set of results, if there are any.
  final String? nextToken;

  /// The list of relevant content items found.
  final List<RelevantContent>? relevantContent;

  SearchRelevantContentResponse({
    this.nextToken,
    this.relevantContent,
  });

  factory SearchRelevantContentResponse.fromJson(Map<String, dynamic> json) {
    return SearchRelevantContentResponse(
      nextToken: json['nextToken'] as String?,
      relevantContent: (json['relevantContent'] as List?)
          ?.nonNulls
          .map((e) => RelevantContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final relevantContent = this.relevantContent;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (relevantContent != null) 'relevantContent': relevantContent,
    };
  }
}

class StartDataSourceSyncJobResponse {
  /// The identifier for a particular synchronization job.
  final String? executionId;

  StartDataSourceSyncJobResponse({
    this.executionId,
  });

  factory StartDataSourceSyncJobResponse.fromJson(Map<String, dynamic> json) {
    return StartDataSourceSyncJobResponse(
      executionId: json['executionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    return {
      if (executionId != null) 'executionId': executionId,
    };
  }
}

class StopDataSourceSyncJobResponse {
  StopDataSourceSyncJobResponse();

  factory StopDataSourceSyncJobResponse.fromJson(Map<String, dynamic> _) {
    return StopDataSourceSyncJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UpdateChatControlsConfigurationResponse {
  UpdateChatControlsConfigurationResponse();

  factory UpdateChatControlsConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateChatControlsConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateChatResponseConfigurationResponse {
  UpdateChatResponseConfigurationResponse();

  factory UpdateChatResponseConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateChatResponseConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateSubscriptionResponse {
  /// The type of your current Amazon Q Business subscription.
  final SubscriptionDetails? currentSubscription;

  /// The type of the Amazon Q Business subscription for the next month.
  final SubscriptionDetails? nextSubscription;

  /// The Amazon Resource Name (ARN) of the Amazon Q Business subscription that
  /// was updated.
  final String? subscriptionArn;

  UpdateSubscriptionResponse({
    this.currentSubscription,
    this.nextSubscription,
    this.subscriptionArn,
  });

  factory UpdateSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSubscriptionResponse(
      currentSubscription: json['currentSubscription'] != null
          ? SubscriptionDetails.fromJson(
              json['currentSubscription'] as Map<String, dynamic>)
          : null,
      nextSubscription: json['nextSubscription'] != null
          ? SubscriptionDetails.fromJson(
              json['nextSubscription'] as Map<String, dynamic>)
          : null,
      subscriptionArn: json['subscriptionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentSubscription = this.currentSubscription;
    final nextSubscription = this.nextSubscription;
    final subscriptionArn = this.subscriptionArn;
    return {
      if (currentSubscription != null)
        'currentSubscription': currentSubscription,
      if (nextSubscription != null) 'nextSubscription': nextSubscription,
      if (subscriptionArn != null) 'subscriptionArn': subscriptionArn,
    };
  }
}

class UpdateUserResponse {
  /// The user aliases that have been to be added to a user id.
  final List<UserAlias>? userAliasesAdded;

  /// The user aliases that have been deleted from a user id.
  final List<UserAlias>? userAliasesDeleted;

  /// The user aliases attached to a user id that have been updated.
  final List<UserAlias>? userAliasesUpdated;

  UpdateUserResponse({
    this.userAliasesAdded,
    this.userAliasesDeleted,
    this.userAliasesUpdated,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      userAliasesAdded: (json['userAliasesAdded'] as List?)
          ?.nonNulls
          .map((e) => UserAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      userAliasesDeleted: (json['userAliasesDeleted'] as List?)
          ?.nonNulls
          .map((e) => UserAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      userAliasesUpdated: (json['userAliasesUpdated'] as List?)
          ?.nonNulls
          .map((e) => UserAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final userAliasesAdded = this.userAliasesAdded;
    final userAliasesDeleted = this.userAliasesDeleted;
    final userAliasesUpdated = this.userAliasesUpdated;
    return {
      if (userAliasesAdded != null) 'userAliasesAdded': userAliasesAdded,
      if (userAliasesDeleted != null) 'userAliasesDeleted': userAliasesDeleted,
      if (userAliasesUpdated != null) 'userAliasesUpdated': userAliasesUpdated,
    };
  }
}

class CreateApplicationResponse {
  /// The Amazon Resource Name (ARN) of the Amazon Q Business application.
  final String? applicationArn;

  /// The identifier of the Amazon Q Business application.
  final String? applicationId;

  CreateApplicationResponse({
    this.applicationArn,
    this.applicationId,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      applicationArn: json['applicationArn'] as String?,
      applicationId: json['applicationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationId = this.applicationId;
    return {
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (applicationId != null) 'applicationId': applicationId,
    };
  }
}

class GetApplicationResponse {
  /// The Amazon Resource Name (ARN) of the Amazon Q Business application.
  final String? applicationArn;

  /// The identifier of the Amazon Q Business application.
  final String? applicationId;

  /// Settings for whether end users can upload files directly during chat.
  final AppliedAttachmentsConfiguration? attachmentsConfiguration;

  /// Settings for auto-subscription behavior for this application. This is only
  /// applicable to SAML and OIDC applications.
  final AutoSubscriptionConfiguration? autoSubscriptionConfiguration;

  /// The OIDC client ID for a Amazon Q Business application.
  final List<String>? clientIdsForOIDC;

  /// The Unix timestamp when the Amazon Q Business application was last updated.
  final DateTime? createdAt;

  /// A description for the Amazon Q Business application.
  final String? description;

  /// The name of the Amazon Q Business application.
  final String? displayName;

  /// The identifier of the Amazon Web Services KMS key that is used to encrypt
  /// your data. Amazon Q Business doesn't support asymmetric keys.
  final EncryptionConfiguration? encryptionConfiguration;

  /// If the <code>Status</code> field is set to <code>ERROR</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the synchronization to fail.
  final ErrorDetail? error;

  /// The Amazon Resource Name (ARN) of an identity provider being used by an
  /// Amazon Q Business application.
  final String? iamIdentityProviderArn;

  /// The Amazon Resource Name (ARN) of the AWS IAM Identity Center instance
  /// attached to your Amazon Q Business application.
  final String? identityCenterApplicationArn;

  /// The authentication type being used by a Amazon Q Business application.
  final IdentityType? identityType;

  /// Configuration information about chat response personalization. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/personalizing-chat-responses.html">Personalizing
  /// chat responses</a>.
  final PersonalizationConfiguration? personalizationConfiguration;

  /// Settings for whether end users can create and use Amazon Q Apps in the web
  /// experience.
  final QAppsConfiguration? qAppsConfiguration;

  /// The Amazon Quick Suite authentication configuration for the Amazon Q
  /// Business application.
  final QuickSightConfiguration? quickSightConfiguration;

  /// The Amazon Resource Name (ARN) of the IAM with permissions to access your
  /// CloudWatch logs and metrics.
  final String? roleArn;

  /// The status of the Amazon Q Business application.
  final ApplicationStatus? status;

  /// The Unix timestamp when the Amazon Q Business application was last updated.
  final DateTime? updatedAt;

  GetApplicationResponse({
    this.applicationArn,
    this.applicationId,
    this.attachmentsConfiguration,
    this.autoSubscriptionConfiguration,
    this.clientIdsForOIDC,
    this.createdAt,
    this.description,
    this.displayName,
    this.encryptionConfiguration,
    this.error,
    this.iamIdentityProviderArn,
    this.identityCenterApplicationArn,
    this.identityType,
    this.personalizationConfiguration,
    this.qAppsConfiguration,
    this.quickSightConfiguration,
    this.roleArn,
    this.status,
    this.updatedAt,
  });

  factory GetApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationResponse(
      applicationArn: json['applicationArn'] as String?,
      applicationId: json['applicationId'] as String?,
      attachmentsConfiguration: json['attachmentsConfiguration'] != null
          ? AppliedAttachmentsConfiguration.fromJson(
              json['attachmentsConfiguration'] as Map<String, dynamic>)
          : null,
      autoSubscriptionConfiguration:
          json['autoSubscriptionConfiguration'] != null
              ? AutoSubscriptionConfiguration.fromJson(
                  json['autoSubscriptionConfiguration'] as Map<String, dynamic>)
              : null,
      clientIdsForOIDC: (json['clientIdsForOIDC'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      iamIdentityProviderArn: json['iamIdentityProviderArn'] as String?,
      identityCenterApplicationArn:
          json['identityCenterApplicationArn'] as String?,
      identityType:
          (json['identityType'] as String?)?.let(IdentityType.fromString),
      personalizationConfiguration: json['personalizationConfiguration'] != null
          ? PersonalizationConfiguration.fromJson(
              json['personalizationConfiguration'] as Map<String, dynamic>)
          : null,
      qAppsConfiguration: json['qAppsConfiguration'] != null
          ? QAppsConfiguration.fromJson(
              json['qAppsConfiguration'] as Map<String, dynamic>)
          : null,
      quickSightConfiguration: json['quickSightConfiguration'] != null
          ? QuickSightConfiguration.fromJson(
              json['quickSightConfiguration'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.let(ApplicationStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationId = this.applicationId;
    final attachmentsConfiguration = this.attachmentsConfiguration;
    final autoSubscriptionConfiguration = this.autoSubscriptionConfiguration;
    final clientIdsForOIDC = this.clientIdsForOIDC;
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final encryptionConfiguration = this.encryptionConfiguration;
    final error = this.error;
    final iamIdentityProviderArn = this.iamIdentityProviderArn;
    final identityCenterApplicationArn = this.identityCenterApplicationArn;
    final identityType = this.identityType;
    final personalizationConfiguration = this.personalizationConfiguration;
    final qAppsConfiguration = this.qAppsConfiguration;
    final quickSightConfiguration = this.quickSightConfiguration;
    final roleArn = this.roleArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (applicationId != null) 'applicationId': applicationId,
      if (attachmentsConfiguration != null)
        'attachmentsConfiguration': attachmentsConfiguration,
      if (autoSubscriptionConfiguration != null)
        'autoSubscriptionConfiguration': autoSubscriptionConfiguration,
      if (clientIdsForOIDC != null) 'clientIdsForOIDC': clientIdsForOIDC,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (error != null) 'error': error,
      if (iamIdentityProviderArn != null)
        'iamIdentityProviderArn': iamIdentityProviderArn,
      if (identityCenterApplicationArn != null)
        'identityCenterApplicationArn': identityCenterApplicationArn,
      if (identityType != null) 'identityType': identityType.value,
      if (personalizationConfiguration != null)
        'personalizationConfiguration': personalizationConfiguration,
      if (qAppsConfiguration != null) 'qAppsConfiguration': qAppsConfiguration,
      if (quickSightConfiguration != null)
        'quickSightConfiguration': quickSightConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class UpdateApplicationResponse {
  UpdateApplicationResponse();

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListApplicationsResponse {
  /// An array of summary information on the configuration of one or more Amazon Q
  /// Business applications.
  final List<Application>? applications;

  /// If the response is truncated, Amazon Q Business returns this token. You can
  /// use this token in a subsequent request to retrieve the next set of
  /// applications.
  final String? nextToken;

  ListApplicationsResponse({
    this.applications,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applications: (json['applications'] as List?)
          ?.nonNulls
          .map((e) => Application.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final nextToken = this.nextToken;
    return {
      if (applications != null) 'applications': applications,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateDataAccessorResponse {
  /// The Amazon Resource Name (ARN) of the created data accessor.
  final String dataAccessorArn;

  /// The unique identifier of the created data accessor.
  final String dataAccessorId;

  /// The Amazon Resource Name (ARN) of the IAM Identity Center application
  /// created for this data accessor.
  final String idcApplicationArn;

  CreateDataAccessorResponse({
    required this.dataAccessorArn,
    required this.dataAccessorId,
    required this.idcApplicationArn,
  });

  factory CreateDataAccessorResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataAccessorResponse(
      dataAccessorArn: (json['dataAccessorArn'] as String?) ?? '',
      dataAccessorId: (json['dataAccessorId'] as String?) ?? '',
      idcApplicationArn: (json['idcApplicationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessorArn = this.dataAccessorArn;
    final dataAccessorId = this.dataAccessorId;
    final idcApplicationArn = this.idcApplicationArn;
    return {
      'dataAccessorArn': dataAccessorArn,
      'dataAccessorId': dataAccessorId,
      'idcApplicationArn': idcApplicationArn,
    };
  }
}

class GetDataAccessorResponse {
  /// The list of action configurations specifying the allowed actions and any
  /// associated filters.
  final List<ActionConfiguration>? actionConfigurations;

  /// The unique identifier of the Amazon Q Business application associated with
  /// this data accessor.
  final String? applicationId;

  /// The authentication configuration details for the data accessor. This
  /// specifies how the ISV authenticates when accessing data through this data
  /// accessor.
  final DataAccessorAuthenticationDetail? authenticationDetail;

  /// The timestamp when the data accessor was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the data accessor.
  final String? dataAccessorArn;

  /// The unique identifier of the data accessor.
  final String? dataAccessorId;

  /// The friendly name of the data accessor.
  final String? displayName;

  /// The Amazon Resource Name (ARN) of the IAM Identity Center application
  /// associated with this data accessor.
  final String? idcApplicationArn;

  /// The Amazon Resource Name (ARN) of the IAM role for the ISV associated with
  /// this data accessor.
  final String? principal;

  /// The timestamp when the data accessor was last updated.
  final DateTime? updatedAt;

  GetDataAccessorResponse({
    this.actionConfigurations,
    this.applicationId,
    this.authenticationDetail,
    this.createdAt,
    this.dataAccessorArn,
    this.dataAccessorId,
    this.displayName,
    this.idcApplicationArn,
    this.principal,
    this.updatedAt,
  });

  factory GetDataAccessorResponse.fromJson(Map<String, dynamic> json) {
    return GetDataAccessorResponse(
      actionConfigurations: (json['actionConfigurations'] as List?)
          ?.nonNulls
          .map((e) => ActionConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      applicationId: json['applicationId'] as String?,
      authenticationDetail: json['authenticationDetail'] != null
          ? DataAccessorAuthenticationDetail.fromJson(
              json['authenticationDetail'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      dataAccessorArn: json['dataAccessorArn'] as String?,
      dataAccessorId: json['dataAccessorId'] as String?,
      displayName: json['displayName'] as String?,
      idcApplicationArn: json['idcApplicationArn'] as String?,
      principal: json['principal'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final actionConfigurations = this.actionConfigurations;
    final applicationId = this.applicationId;
    final authenticationDetail = this.authenticationDetail;
    final createdAt = this.createdAt;
    final dataAccessorArn = this.dataAccessorArn;
    final dataAccessorId = this.dataAccessorId;
    final displayName = this.displayName;
    final idcApplicationArn = this.idcApplicationArn;
    final principal = this.principal;
    final updatedAt = this.updatedAt;
    return {
      if (actionConfigurations != null)
        'actionConfigurations': actionConfigurations,
      if (applicationId != null) 'applicationId': applicationId,
      if (authenticationDetail != null)
        'authenticationDetail': authenticationDetail,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dataAccessorArn != null) 'dataAccessorArn': dataAccessorArn,
      if (dataAccessorId != null) 'dataAccessorId': dataAccessorId,
      if (displayName != null) 'displayName': displayName,
      if (idcApplicationArn != null) 'idcApplicationArn': idcApplicationArn,
      if (principal != null) 'principal': principal,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class UpdateDataAccessorResponse {
  UpdateDataAccessorResponse();

  factory UpdateDataAccessorResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDataAccessorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDataAccessorResponse {
  DeleteDataAccessorResponse();

  factory DeleteDataAccessorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDataAccessorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListDataAccessorsResponse {
  /// The list of data accessors.
  final List<DataAccessor>? dataAccessors;

  /// The token to use to retrieve the next set of results, if there are any.
  final String? nextToken;

  ListDataAccessorsResponse({
    this.dataAccessors,
    this.nextToken,
  });

  factory ListDataAccessorsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataAccessorsResponse(
      dataAccessors: (json['dataAccessors'] as List?)
          ?.nonNulls
          .map((e) => DataAccessor.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessors = this.dataAccessors;
    final nextToken = this.nextToken;
    return {
      if (dataAccessors != null) 'dataAccessors': dataAccessors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateIndexResponse {
  /// The Amazon Resource Name (ARN) of an Amazon Q Business index.
  final String? indexArn;

  /// The identifier for the Amazon Q Business index.
  final String? indexId;

  CreateIndexResponse({
    this.indexArn,
    this.indexId,
  });

  factory CreateIndexResponse.fromJson(Map<String, dynamic> json) {
    return CreateIndexResponse(
      indexArn: json['indexArn'] as String?,
      indexId: json['indexId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexArn = this.indexArn;
    final indexId = this.indexId;
    return {
      if (indexArn != null) 'indexArn': indexArn,
      if (indexId != null) 'indexId': indexId,
    };
  }
}

class GetIndexResponse {
  /// The identifier of the Amazon Q Business application associated with the
  /// index.
  final String? applicationId;

  /// The storage capacity units chosen for your Amazon Q Business index.
  final IndexCapacityConfiguration? capacityConfiguration;

  /// The Unix timestamp when the Amazon Q Business index was created.
  final DateTime? createdAt;

  /// The description for the Amazon Q Business index.
  final String? description;

  /// The name of the Amazon Q Business index.
  final String? displayName;

  /// Configuration information for document attributes or metadata. Document
  /// metadata are fields associated with your documents. For example, the company
  /// department name associated with each document. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/doc-attributes-types.html#doc-attributes">Understanding
  /// document attributes</a>.
  final List<DocumentAttributeConfiguration>? documentAttributeConfigurations;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a message that explains why.
  final ErrorDetail? error;

  /// The Amazon Resource Name (ARN) of the Amazon Q Business index.
  final String? indexArn;

  /// The identifier of the Amazon Q Business index.
  final String? indexId;

  /// Provides information about the number of documents indexed.
  final IndexStatistics? indexStatistics;

  /// The current status of the index. When the value is <code>ACTIVE</code>, the
  /// index is ready for use. If the <code>Status</code> field value is
  /// <code>FAILED</code>, the <code>ErrorMessage</code> field contains a message
  /// that explains why.
  final IndexStatus? status;

  /// The type of index attached to your Amazon Q Business application.
  final IndexType? type;

  /// The Unix timestamp when the Amazon Q Business index was last updated.
  final DateTime? updatedAt;

  GetIndexResponse({
    this.applicationId,
    this.capacityConfiguration,
    this.createdAt,
    this.description,
    this.displayName,
    this.documentAttributeConfigurations,
    this.error,
    this.indexArn,
    this.indexId,
    this.indexStatistics,
    this.status,
    this.type,
    this.updatedAt,
  });

  factory GetIndexResponse.fromJson(Map<String, dynamic> json) {
    return GetIndexResponse(
      applicationId: json['applicationId'] as String?,
      capacityConfiguration: json['capacityConfiguration'] != null
          ? IndexCapacityConfiguration.fromJson(
              json['capacityConfiguration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      documentAttributeConfigurations:
          (json['documentAttributeConfigurations'] as List?)
              ?.nonNulls
              .map((e) => DocumentAttributeConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      indexArn: json['indexArn'] as String?,
      indexId: json['indexId'] as String?,
      indexStatistics: json['indexStatistics'] != null
          ? IndexStatistics.fromJson(
              json['indexStatistics'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(IndexStatus.fromString),
      type: (json['type'] as String?)?.let(IndexType.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final capacityConfiguration = this.capacityConfiguration;
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final documentAttributeConfigurations =
        this.documentAttributeConfigurations;
    final error = this.error;
    final indexArn = this.indexArn;
    final indexId = this.indexId;
    final indexStatistics = this.indexStatistics;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (capacityConfiguration != null)
        'capacityConfiguration': capacityConfiguration,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (documentAttributeConfigurations != null)
        'documentAttributeConfigurations': documentAttributeConfigurations,
      if (error != null) 'error': error,
      if (indexArn != null) 'indexArn': indexArn,
      if (indexId != null) 'indexId': indexId,
      if (indexStatistics != null) 'indexStatistics': indexStatistics,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class UpdateIndexResponse {
  UpdateIndexResponse();

  factory UpdateIndexResponse.fromJson(Map<String, dynamic> _) {
    return UpdateIndexResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteIndexResponse {
  DeleteIndexResponse();

  factory DeleteIndexResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIndexResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListIndicesResponse {
  /// An array of information on the items in one or more indexes.
  final List<Index>? indices;

  /// If the response is truncated, Amazon Q Business returns this token that you
  /// can use in the subsequent request to retrieve the next set of indexes.
  final String? nextToken;

  ListIndicesResponse({
    this.indices,
    this.nextToken,
  });

  factory ListIndicesResponse.fromJson(Map<String, dynamic> json) {
    return ListIndicesResponse(
      indices: (json['indices'] as List?)
          ?.nonNulls
          .map((e) => Index.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indices = this.indices;
    final nextToken = this.nextToken;
    return {
      if (indices != null) 'indices': indices,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateDataSourceResponse {
  /// The Amazon Resource Name (ARN) of a data source in an Amazon Q Business
  /// application.
  final String? dataSourceArn;

  /// The identifier of the data source connector.
  final String? dataSourceId;

  CreateDataSourceResponse({
    this.dataSourceArn,
    this.dataSourceId,
  });

  factory CreateDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataSourceResponse(
      dataSourceArn: json['dataSourceArn'] as String?,
      dataSourceId: json['dataSourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceArn = this.dataSourceArn;
    final dataSourceId = this.dataSourceId;
    return {
      if (dataSourceArn != null) 'dataSourceArn': dataSourceArn,
      if (dataSourceId != null) 'dataSourceId': dataSourceId,
    };
  }
}

class GetDataSourceResponse {
  /// The identifier of the Amazon Q Business application.
  final String? applicationId;

  /// The details of how the data source connector is configured.
  final Object? configuration;

  /// The Unix timestamp when the data source connector was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the data source.
  final String? dataSourceArn;

  /// The identifier of the data source connector.
  final String? dataSourceId;

  /// The description for the data source connector.
  final String? description;

  /// The name for the data source connector.
  final String? displayName;
  final DocumentEnrichmentConfiguration? documentEnrichmentConfiguration;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the data source connector to fail.
  final ErrorDetail? error;

  /// The identifier of the index linked to the data source connector.
  final String? indexId;

  /// The configuration for extracting information from media in documents for the
  /// data source.
  final MediaExtractionConfiguration? mediaExtractionConfiguration;

  /// The Amazon Resource Name (ARN) of the role with permission to access the
  /// data source and required resources.
  final String? roleArn;

  /// The current status of the data source connector. When the
  /// <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the data source connector to fail.
  final DataSourceStatus? status;

  /// The schedule for Amazon Q Business to update the index.
  final String? syncSchedule;

  /// The type of the data source connector. For example, <code>S3</code>.
  final String? type;

  /// The Unix timestamp when the data source connector was last updated.
  final DateTime? updatedAt;

  /// Configuration information for an Amazon VPC (Virtual Private Cloud) to
  /// connect to your data source.
  final DataSourceVpcConfiguration? vpcConfiguration;

  GetDataSourceResponse({
    this.applicationId,
    this.configuration,
    this.createdAt,
    this.dataSourceArn,
    this.dataSourceId,
    this.description,
    this.displayName,
    this.documentEnrichmentConfiguration,
    this.error,
    this.indexId,
    this.mediaExtractionConfiguration,
    this.roleArn,
    this.status,
    this.syncSchedule,
    this.type,
    this.updatedAt,
    this.vpcConfiguration,
  });

  factory GetDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return GetDataSourceResponse(
      applicationId: json['applicationId'] as String?,
      configuration: json['configuration'],
      createdAt: timeStampFromJson(json['createdAt']),
      dataSourceArn: json['dataSourceArn'] as String?,
      dataSourceId: json['dataSourceId'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      documentEnrichmentConfiguration:
          json['documentEnrichmentConfiguration'] != null
              ? DocumentEnrichmentConfiguration.fromJson(
                  json['documentEnrichmentConfiguration']
                      as Map<String, dynamic>)
              : null,
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      indexId: json['indexId'] as String?,
      mediaExtractionConfiguration: json['mediaExtractionConfiguration'] != null
          ? MediaExtractionConfiguration.fromJson(
              json['mediaExtractionConfiguration'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.let(DataSourceStatus.fromString),
      syncSchedule: json['syncSchedule'] as String?,
      type: json['type'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      vpcConfiguration: json['vpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['vpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final dataSourceArn = this.dataSourceArn;
    final dataSourceId = this.dataSourceId;
    final description = this.description;
    final displayName = this.displayName;
    final documentEnrichmentConfiguration =
        this.documentEnrichmentConfiguration;
    final error = this.error;
    final indexId = this.indexId;
    final mediaExtractionConfiguration = this.mediaExtractionConfiguration;
    final roleArn = this.roleArn;
    final status = this.status;
    final syncSchedule = this.syncSchedule;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (configuration != null) 'configuration': configuration,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dataSourceArn != null) 'dataSourceArn': dataSourceArn,
      if (dataSourceId != null) 'dataSourceId': dataSourceId,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (documentEnrichmentConfiguration != null)
        'documentEnrichmentConfiguration': documentEnrichmentConfiguration,
      if (error != null) 'error': error,
      if (indexId != null) 'indexId': indexId,
      if (mediaExtractionConfiguration != null)
        'mediaExtractionConfiguration': mediaExtractionConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.value,
      if (syncSchedule != null) 'syncSchedule': syncSchedule,
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
    };
  }
}

class UpdateDataSourceResponse {
  UpdateDataSourceResponse();

  factory UpdateDataSourceResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDataSourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDataSourceResponse {
  DeleteDataSourceResponse();

  factory DeleteDataSourceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDataSourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListDataSourcesResponse {
  /// An array of summary information for one or more data source connector.
  final List<DataSource>? dataSources;

  /// If the response is truncated, Amazon Q Business returns this token. You can
  /// use this token in a subsequent request to retrieve the next set of data
  /// source connectors.
  final String? nextToken;

  ListDataSourcesResponse({
    this.dataSources,
    this.nextToken,
  });

  factory ListDataSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSourcesResponse(
      dataSources: (json['dataSources'] as List?)
          ?.nonNulls
          .map((e) => DataSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSources = this.dataSources;
    final nextToken = this.nextToken;
    return {
      if (dataSources != null) 'dataSources': dataSources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreatePluginResponse {
  /// The current status of a plugin. A plugin is modified asynchronously.
  final PluginBuildStatus? buildStatus;

  /// The Amazon Resource Name (ARN) of a plugin.
  final String? pluginArn;

  /// The identifier of the plugin created.
  final String? pluginId;

  CreatePluginResponse({
    this.buildStatus,
    this.pluginArn,
    this.pluginId,
  });

  factory CreatePluginResponse.fromJson(Map<String, dynamic> json) {
    return CreatePluginResponse(
      buildStatus:
          (json['buildStatus'] as String?)?.let(PluginBuildStatus.fromString),
      pluginArn: json['pluginArn'] as String?,
      pluginId: json['pluginId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final buildStatus = this.buildStatus;
    final pluginArn = this.pluginArn;
    final pluginId = this.pluginId;
    return {
      if (buildStatus != null) 'buildStatus': buildStatus.value,
      if (pluginArn != null) 'pluginArn': pluginArn,
      if (pluginId != null) 'pluginId': pluginId,
    };
  }
}

class GetPluginResponse {
  /// The identifier of the application which contains the plugin.
  final String? applicationId;
  final PluginAuthConfiguration? authConfiguration;

  /// The current status of a plugin. A plugin is modified asynchronously.
  final PluginBuildStatus? buildStatus;

  /// The timestamp for when the plugin was created.
  final DateTime? createdAt;

  /// Configuration information required to create a custom plugin.
  final CustomPluginConfiguration? customPluginConfiguration;

  /// The name of the plugin.
  final String? displayName;

  /// The Amazon Resource Name (ARN) of the role with permission to access
  /// resources needed to create the plugin.
  final String? pluginArn;

  /// The identifier of the plugin.
  final String? pluginId;

  /// The source URL used for plugin configuration.
  final String? serverUrl;

  /// The current state of the plugin.
  final PluginState? state;

  /// The type of the plugin.
  final PluginType? type;

  /// The timestamp for when the plugin was last updated.
  final DateTime? updatedAt;

  GetPluginResponse({
    this.applicationId,
    this.authConfiguration,
    this.buildStatus,
    this.createdAt,
    this.customPluginConfiguration,
    this.displayName,
    this.pluginArn,
    this.pluginId,
    this.serverUrl,
    this.state,
    this.type,
    this.updatedAt,
  });

  factory GetPluginResponse.fromJson(Map<String, dynamic> json) {
    return GetPluginResponse(
      applicationId: json['applicationId'] as String?,
      authConfiguration: json['authConfiguration'] != null
          ? PluginAuthConfiguration.fromJson(
              json['authConfiguration'] as Map<String, dynamic>)
          : null,
      buildStatus:
          (json['buildStatus'] as String?)?.let(PluginBuildStatus.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      customPluginConfiguration: json['customPluginConfiguration'] != null
          ? CustomPluginConfiguration.fromJson(
              json['customPluginConfiguration'] as Map<String, dynamic>)
          : null,
      displayName: json['displayName'] as String?,
      pluginArn: json['pluginArn'] as String?,
      pluginId: json['pluginId'] as String?,
      serverUrl: json['serverUrl'] as String?,
      state: (json['state'] as String?)?.let(PluginState.fromString),
      type: (json['type'] as String?)?.let(PluginType.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final authConfiguration = this.authConfiguration;
    final buildStatus = this.buildStatus;
    final createdAt = this.createdAt;
    final customPluginConfiguration = this.customPluginConfiguration;
    final displayName = this.displayName;
    final pluginArn = this.pluginArn;
    final pluginId = this.pluginId;
    final serverUrl = this.serverUrl;
    final state = this.state;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (authConfiguration != null) 'authConfiguration': authConfiguration,
      if (buildStatus != null) 'buildStatus': buildStatus.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (customPluginConfiguration != null)
        'customPluginConfiguration': customPluginConfiguration,
      if (displayName != null) 'displayName': displayName,
      if (pluginArn != null) 'pluginArn': pluginArn,
      if (pluginId != null) 'pluginId': pluginId,
      if (serverUrl != null) 'serverUrl': serverUrl,
      if (state != null) 'state': state.value,
      if (type != null) 'type': type.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class UpdatePluginResponse {
  UpdatePluginResponse();

  factory UpdatePluginResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePluginResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePluginResponse {
  DeletePluginResponse();

  factory DeletePluginResponse.fromJson(Map<String, dynamic> _) {
    return DeletePluginResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListPluginsResponse {
  /// If the <code>maxResults</code> response was incomplete because there is more
  /// data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// plugins.
  final String? nextToken;

  /// Information about a configured plugin.
  final List<Plugin>? plugins;

  ListPluginsResponse({
    this.nextToken,
    this.plugins,
  });

  factory ListPluginsResponse.fromJson(Map<String, dynamic> json) {
    return ListPluginsResponse(
      nextToken: json['nextToken'] as String?,
      plugins: (json['plugins'] as List?)
          ?.nonNulls
          .map((e) => Plugin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final plugins = this.plugins;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (plugins != null) 'plugins': plugins,
    };
  }
}

class CreateRetrieverResponse {
  /// The Amazon Resource Name (ARN) of an IAM role associated with a retriever.
  final String? retrieverArn;

  /// The identifier of the retriever you are using.
  final String? retrieverId;

  CreateRetrieverResponse({
    this.retrieverArn,
    this.retrieverId,
  });

  factory CreateRetrieverResponse.fromJson(Map<String, dynamic> json) {
    return CreateRetrieverResponse(
      retrieverArn: json['retrieverArn'] as String?,
      retrieverId: json['retrieverId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final retrieverArn = this.retrieverArn;
    final retrieverId = this.retrieverId;
    return {
      if (retrieverArn != null) 'retrieverArn': retrieverArn,
      if (retrieverId != null) 'retrieverId': retrieverId,
    };
  }
}

class GetRetrieverResponse {
  /// The identifier of the Amazon Q Business application using the retriever.
  final String? applicationId;
  final RetrieverConfiguration? configuration;

  /// The Unix timestamp when the retriever was created.
  final DateTime? createdAt;

  /// The name of the retriever.
  final String? displayName;

  /// The Amazon Resource Name (ARN) of the IAM role associated with the
  /// retriever.
  final String? retrieverArn;

  /// The identifier of the retriever.
  final String? retrieverId;

  /// The Amazon Resource Name (ARN) of the role with the permission to access the
  /// retriever and required resources.
  final String? roleArn;

  /// The status of the retriever.
  final RetrieverStatus? status;

  /// The type of the retriever.
  final RetrieverType? type;

  /// The Unix timestamp when the retriever was last updated.
  final DateTime? updatedAt;

  GetRetrieverResponse({
    this.applicationId,
    this.configuration,
    this.createdAt,
    this.displayName,
    this.retrieverArn,
    this.retrieverId,
    this.roleArn,
    this.status,
    this.type,
    this.updatedAt,
  });

  factory GetRetrieverResponse.fromJson(Map<String, dynamic> json) {
    return GetRetrieverResponse(
      applicationId: json['applicationId'] as String?,
      configuration: json['configuration'] != null
          ? RetrieverConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      retrieverArn: json['retrieverArn'] as String?,
      retrieverId: json['retrieverId'] as String?,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.let(RetrieverStatus.fromString),
      type: (json['type'] as String?)?.let(RetrieverType.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final displayName = this.displayName;
    final retrieverArn = this.retrieverArn;
    final retrieverId = this.retrieverId;
    final roleArn = this.roleArn;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (configuration != null) 'configuration': configuration,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (retrieverArn != null) 'retrieverArn': retrieverArn,
      if (retrieverId != null) 'retrieverId': retrieverId,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class UpdateRetrieverResponse {
  UpdateRetrieverResponse();

  factory UpdateRetrieverResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRetrieverResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRetrieverResponse {
  DeleteRetrieverResponse();

  factory DeleteRetrieverResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRetrieverResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListRetrieversResponse {
  /// If the response is truncated, Amazon Q Business returns this token, which
  /// you can use in a later request to list the next set of retrievers.
  final String? nextToken;

  /// An array of summary information for one or more retrievers.
  final List<Retriever>? retrievers;

  ListRetrieversResponse({
    this.nextToken,
    this.retrievers,
  });

  factory ListRetrieversResponse.fromJson(Map<String, dynamic> json) {
    return ListRetrieversResponse(
      nextToken: json['nextToken'] as String?,
      retrievers: (json['retrievers'] as List?)
          ?.nonNulls
          .map((e) => Retriever.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final retrievers = this.retrievers;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (retrievers != null) 'retrievers': retrievers,
    };
  }
}

class CreateWebExperienceResponse {
  /// The Amazon Resource Name (ARN) of an Amazon Q Business web experience.
  final String? webExperienceArn;

  /// The identifier of the Amazon Q Business web experience.
  final String? webExperienceId;

  CreateWebExperienceResponse({
    this.webExperienceArn,
    this.webExperienceId,
  });

  factory CreateWebExperienceResponse.fromJson(Map<String, dynamic> json) {
    return CreateWebExperienceResponse(
      webExperienceArn: json['webExperienceArn'] as String?,
      webExperienceId: json['webExperienceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final webExperienceArn = this.webExperienceArn;
    final webExperienceId = this.webExperienceId;
    return {
      if (webExperienceArn != null) 'webExperienceArn': webExperienceArn,
      if (webExperienceId != null) 'webExperienceId': webExperienceId,
    };
  }
}

class GetWebExperienceResponse {
  /// The identifier of the Amazon Q Business application linked to the web
  /// experience.
  final String? applicationId;

  /// The authentication configuration information for your Amazon Q Business web
  /// experience.
  final WebExperienceAuthConfiguration? authenticationConfiguration;

  /// The browser extension configuration for an Amazon Q Business web experience.
  final BrowserExtensionConfiguration? browserExtensionConfiguration;

  /// The Unix timestamp when the Amazon Q Business web experience was last
  /// created.
  final DateTime? createdAt;

  /// Gets the custom logo, favicon, font, and color used in the Amazon Q web
  /// experience.
  final CustomizationConfiguration? customizationConfiguration;

  /// The endpoint of your Amazon Q Business web experience.
  final String? defaultEndpoint;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the data source connector to fail.
  final ErrorDetail? error;

  /// Information about the identity provider (IdP) used to authenticate end users
  /// of an Amazon Q Business web experience.
  final IdentityProviderConfiguration? identityProviderConfiguration;

  /// Gets the website domain origins that are allowed to embed the Amazon Q
  /// Business web experience. The <i>domain origin</i> refers to the base URL for
  /// accessing a website including the protocol (<code>http/https</code>), the
  /// domain name, and the port number (if specified).
  final List<String>? origins;

  /// The Amazon Resource Name (ARN) of the service role attached to your web
  /// experience.
  final String? roleArn;

  /// Determines whether sample prompts are enabled in the web experience for an
  /// end user.
  final WebExperienceSamplePromptsControlMode? samplePromptsControlMode;

  /// The current status of the Amazon Q Business web experience. When the
  /// <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the data source connector to fail.
  final WebExperienceStatus? status;

  /// The subtitle for your Amazon Q Business web experience.
  final String? subtitle;

  /// The title for your Amazon Q Business web experience.
  final String? title;

  /// The Unix timestamp when the Amazon Q Business web experience was last
  /// updated.
  final DateTime? updatedAt;

  /// The Amazon Resource Name (ARN) of the role with the permission to access the
  /// Amazon Q Business web experience and required resources.
  final String? webExperienceArn;

  /// The identifier of the Amazon Q Business web experience.
  final String? webExperienceId;

  /// The customized welcome message for end users of an Amazon Q Business web
  /// experience.
  final String? welcomeMessage;

  GetWebExperienceResponse({
    this.applicationId,
    this.authenticationConfiguration,
    this.browserExtensionConfiguration,
    this.createdAt,
    this.customizationConfiguration,
    this.defaultEndpoint,
    this.error,
    this.identityProviderConfiguration,
    this.origins,
    this.roleArn,
    this.samplePromptsControlMode,
    this.status,
    this.subtitle,
    this.title,
    this.updatedAt,
    this.webExperienceArn,
    this.webExperienceId,
    this.welcomeMessage,
  });

  factory GetWebExperienceResponse.fromJson(Map<String, dynamic> json) {
    return GetWebExperienceResponse(
      applicationId: json['applicationId'] as String?,
      authenticationConfiguration: json['authenticationConfiguration'] != null
          ? WebExperienceAuthConfiguration.fromJson(
              json['authenticationConfiguration'] as Map<String, dynamic>)
          : null,
      browserExtensionConfiguration:
          json['browserExtensionConfiguration'] != null
              ? BrowserExtensionConfiguration.fromJson(
                  json['browserExtensionConfiguration'] as Map<String, dynamic>)
              : null,
      createdAt: timeStampFromJson(json['createdAt']),
      customizationConfiguration: json['customizationConfiguration'] != null
          ? CustomizationConfiguration.fromJson(
              json['customizationConfiguration'] as Map<String, dynamic>)
          : null,
      defaultEndpoint: json['defaultEndpoint'] as String?,
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      identityProviderConfiguration:
          json['identityProviderConfiguration'] != null
              ? IdentityProviderConfiguration.fromJson(
                  json['identityProviderConfiguration'] as Map<String, dynamic>)
              : null,
      origins:
          (json['origins'] as List?)?.nonNulls.map((e) => e as String).toList(),
      roleArn: json['roleArn'] as String?,
      samplePromptsControlMode: (json['samplePromptsControlMode'] as String?)
          ?.let(WebExperienceSamplePromptsControlMode.fromString),
      status: (json['status'] as String?)?.let(WebExperienceStatus.fromString),
      subtitle: json['subtitle'] as String?,
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      webExperienceArn: json['webExperienceArn'] as String?,
      webExperienceId: json['webExperienceId'] as String?,
      welcomeMessage: json['welcomeMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final authenticationConfiguration = this.authenticationConfiguration;
    final browserExtensionConfiguration = this.browserExtensionConfiguration;
    final createdAt = this.createdAt;
    final customizationConfiguration = this.customizationConfiguration;
    final defaultEndpoint = this.defaultEndpoint;
    final error = this.error;
    final identityProviderConfiguration = this.identityProviderConfiguration;
    final origins = this.origins;
    final roleArn = this.roleArn;
    final samplePromptsControlMode = this.samplePromptsControlMode;
    final status = this.status;
    final subtitle = this.subtitle;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final webExperienceArn = this.webExperienceArn;
    final webExperienceId = this.webExperienceId;
    final welcomeMessage = this.welcomeMessage;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (authenticationConfiguration != null)
        'authenticationConfiguration': authenticationConfiguration,
      if (browserExtensionConfiguration != null)
        'browserExtensionConfiguration': browserExtensionConfiguration,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (customizationConfiguration != null)
        'customizationConfiguration': customizationConfiguration,
      if (defaultEndpoint != null) 'defaultEndpoint': defaultEndpoint,
      if (error != null) 'error': error,
      if (identityProviderConfiguration != null)
        'identityProviderConfiguration': identityProviderConfiguration,
      if (origins != null) 'origins': origins,
      if (roleArn != null) 'roleArn': roleArn,
      if (samplePromptsControlMode != null)
        'samplePromptsControlMode': samplePromptsControlMode.value,
      if (status != null) 'status': status.value,
      if (subtitle != null) 'subtitle': subtitle,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (webExperienceArn != null) 'webExperienceArn': webExperienceArn,
      if (webExperienceId != null) 'webExperienceId': webExperienceId,
      if (welcomeMessage != null) 'welcomeMessage': welcomeMessage,
    };
  }
}

class UpdateWebExperienceResponse {
  UpdateWebExperienceResponse();

  factory UpdateWebExperienceResponse.fromJson(Map<String, dynamic> _) {
    return UpdateWebExperienceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWebExperienceResponse {
  DeleteWebExperienceResponse();

  factory DeleteWebExperienceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWebExperienceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListWebExperiencesResponse {
  /// If the response is truncated, Amazon Q Business returns this token, which
  /// you can use in a later request to list the next set of messages.
  final String? nextToken;

  /// An array of summary information for one or more Amazon Q Business
  /// experiences.
  final List<WebExperience>? webExperiences;

  ListWebExperiencesResponse({
    this.nextToken,
    this.webExperiences,
  });

  factory ListWebExperiencesResponse.fromJson(Map<String, dynamic> json) {
    return ListWebExperiencesResponse(
      nextToken: json['nextToken'] as String?,
      webExperiences: (json['webExperiences'] as List?)
          ?.nonNulls
          .map((e) => WebExperience.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final webExperiences = this.webExperiences;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (webExperiences != null) 'webExperiences': webExperiences,
    };
  }
}

/// Provides information for an Amazon Q Business web experience.
class WebExperience {
  /// The Unix timestamp when the Amazon Q Business application was last updated.
  final DateTime? createdAt;

  /// The endpoint URLs for your Amazon Q Business web experience. The URLs are
  /// unique and fully hosted by Amazon Web Services.
  final String? defaultEndpoint;

  /// The status of your Amazon Q Business web experience.
  final WebExperienceStatus? status;

  /// The Unix timestamp when your Amazon Q Business web experience was updated.
  final DateTime? updatedAt;

  /// The identifier of your Amazon Q Business web experience.
  final String? webExperienceId;

  WebExperience({
    this.createdAt,
    this.defaultEndpoint,
    this.status,
    this.updatedAt,
    this.webExperienceId,
  });

  factory WebExperience.fromJson(Map<String, dynamic> json) {
    return WebExperience(
      createdAt: timeStampFromJson(json['createdAt']),
      defaultEndpoint: json['defaultEndpoint'] as String?,
      status: (json['status'] as String?)?.let(WebExperienceStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
      webExperienceId: json['webExperienceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final defaultEndpoint = this.defaultEndpoint;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final webExperienceId = this.webExperienceId;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (defaultEndpoint != null) 'defaultEndpoint': defaultEndpoint,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (webExperienceId != null) 'webExperienceId': webExperienceId,
    };
  }
}

class WebExperienceStatus {
  static const creating = WebExperienceStatus._('CREATING');
  static const active = WebExperienceStatus._('ACTIVE');
  static const deleting = WebExperienceStatus._('DELETING');
  static const failed = WebExperienceStatus._('FAILED');
  static const pendingAuthConfig = WebExperienceStatus._('PENDING_AUTH_CONFIG');

  final String value;

  const WebExperienceStatus._(this.value);

  static const values = [creating, active, deleting, failed, pendingAuthConfig];

  static WebExperienceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WebExperienceStatus._(value));

  @override
  bool operator ==(other) =>
      other is WebExperienceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides the authorization configuration information needed to deploy a
/// Amazon Q Business web experience to end users.
class WebExperienceAuthConfiguration {
  final SamlConfiguration? samlConfiguration;

  WebExperienceAuthConfiguration({
    this.samlConfiguration,
  });

  factory WebExperienceAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return WebExperienceAuthConfiguration(
      samlConfiguration: json['samlConfiguration'] != null
          ? SamlConfiguration.fromJson(
              json['samlConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final samlConfiguration = this.samlConfiguration;
    return {
      if (samlConfiguration != null) 'samlConfiguration': samlConfiguration,
    };
  }
}

class WebExperienceSamplePromptsControlMode {
  static const enabled = WebExperienceSamplePromptsControlMode._('ENABLED');
  static const disabled = WebExperienceSamplePromptsControlMode._('DISABLED');

  final String value;

  const WebExperienceSamplePromptsControlMode._(this.value);

  static const values = [enabled, disabled];

  static WebExperienceSamplePromptsControlMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WebExperienceSamplePromptsControlMode._(value));

  @override
  bool operator ==(other) =>
      other is WebExperienceSamplePromptsControlMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information about the identity provider (IdP) used to authenticate
/// end users of an Amazon Q Business web experience.
class IdentityProviderConfiguration {
  final OpenIDConnectProviderConfiguration? openIDConnectConfiguration;
  final SamlProviderConfiguration? samlConfiguration;

  IdentityProviderConfiguration({
    this.openIDConnectConfiguration,
    this.samlConfiguration,
  });

  factory IdentityProviderConfiguration.fromJson(Map<String, dynamic> json) {
    return IdentityProviderConfiguration(
      openIDConnectConfiguration: json['openIDConnectConfiguration'] != null
          ? OpenIDConnectProviderConfiguration.fromJson(
              json['openIDConnectConfiguration'] as Map<String, dynamic>)
          : null,
      samlConfiguration: json['samlConfiguration'] != null
          ? SamlProviderConfiguration.fromJson(
              json['samlConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final openIDConnectConfiguration = this.openIDConnectConfiguration;
    final samlConfiguration = this.samlConfiguration;
    return {
      if (openIDConnectConfiguration != null)
        'openIDConnectConfiguration': openIDConnectConfiguration,
      if (samlConfiguration != null) 'samlConfiguration': samlConfiguration,
    };
  }
}

/// The container for browser extension configuration for an Amazon Q Business
/// web experience.
class BrowserExtensionConfiguration {
  /// Specify the browser extensions allowed for your Amazon Q web experience.
  ///
  /// <ul>
  /// <li>
  /// <code>CHROME</code> — Enables the extension for Chromium-based browsers
  /// (Google Chrome, Microsoft Edge, Opera, etc.).
  /// </li>
  /// <li>
  /// <code>FIREFOX</code> — Enables the extension for Mozilla Firefox.
  /// </li>
  /// <li>
  /// <code>CHROME</code> and <code>FIREFOX</code> — Enable the extension for
  /// Chromium-based browsers and Mozilla Firefox.
  /// </li>
  /// </ul>
  final List<BrowserExtension> enabledBrowserExtensions;

  BrowserExtensionConfiguration({
    required this.enabledBrowserExtensions,
  });

  factory BrowserExtensionConfiguration.fromJson(Map<String, dynamic> json) {
    return BrowserExtensionConfiguration(
      enabledBrowserExtensions:
          ((json['enabledBrowserExtensions'] as List?) ?? const [])
              .nonNulls
              .map((e) => BrowserExtension.fromString((e as String)))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabledBrowserExtensions = this.enabledBrowserExtensions;
    return {
      'enabledBrowserExtensions':
          enabledBrowserExtensions.map((e) => e.value).toList(),
    };
  }
}

/// Contains the configuration information to customize the logo, font, and
/// color of an Amazon Q Business web experience with individual files for each
/// property or a CSS file for them all.
class CustomizationConfiguration {
  /// Provides the URL where the custom CSS file is hosted for an Amazon Q web
  /// experience.
  final String? customCSSUrl;

  /// Provides the URL where the custom favicon file is hosted for an Amazon Q web
  /// experience.
  final String? faviconUrl;

  /// Provides the URL where the custom font file is hosted for an Amazon Q web
  /// experience.
  final String? fontUrl;

  /// Provides the URL where the custom logo file is hosted for an Amazon Q web
  /// experience.
  final String? logoUrl;

  CustomizationConfiguration({
    this.customCSSUrl,
    this.faviconUrl,
    this.fontUrl,
    this.logoUrl,
  });

  factory CustomizationConfiguration.fromJson(Map<String, dynamic> json) {
    return CustomizationConfiguration(
      customCSSUrl: json['customCSSUrl'] as String?,
      faviconUrl: json['faviconUrl'] as String?,
      fontUrl: json['fontUrl'] as String?,
      logoUrl: json['logoUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customCSSUrl = this.customCSSUrl;
    final faviconUrl = this.faviconUrl;
    final fontUrl = this.fontUrl;
    final logoUrl = this.logoUrl;
    return {
      if (customCSSUrl != null) 'customCSSUrl': customCSSUrl,
      if (faviconUrl != null) 'faviconUrl': faviconUrl,
      if (fontUrl != null) 'fontUrl': fontUrl,
      if (logoUrl != null) 'logoUrl': logoUrl,
    };
  }
}

class BrowserExtension {
  static const firefox = BrowserExtension._('FIREFOX');
  static const chrome = BrowserExtension._('CHROME');

  final String value;

  const BrowserExtension._(this.value);

  static const values = [firefox, chrome];

  static BrowserExtension fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BrowserExtension._(value));

  @override
  bool operator ==(other) => other is BrowserExtension && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the SAML 2.0-compliant identity provider (IdP) used to
/// authenticate end users of an Amazon Q Business web experience.
class SamlProviderConfiguration {
  /// The URL where Amazon Q Business end users will be redirected for
  /// authentication.
  final String authenticationUrl;

  SamlProviderConfiguration({
    required this.authenticationUrl,
  });

  factory SamlProviderConfiguration.fromJson(Map<String, dynamic> json) {
    return SamlProviderConfiguration(
      authenticationUrl: (json['authenticationUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationUrl = this.authenticationUrl;
    return {
      'authenticationUrl': authenticationUrl,
    };
  }
}

/// Information about the OIDC-compliant identity provider (IdP) used to
/// authenticate end users of an Amazon Q Business web experience.
class OpenIDConnectProviderConfiguration {
  /// The Amazon Resource Name (ARN) of a Secrets Manager secret containing the
  /// OIDC client secret.
  final String secretsArn;

  /// An IAM role with permissions to access KMS to decrypt the Secrets Manager
  /// secret containing your OIDC client secret.
  final String secretsRole;

  OpenIDConnectProviderConfiguration({
    required this.secretsArn,
    required this.secretsRole,
  });

  factory OpenIDConnectProviderConfiguration.fromJson(
      Map<String, dynamic> json) {
    return OpenIDConnectProviderConfiguration(
      secretsArn: (json['secretsArn'] as String?) ?? '',
      secretsRole: (json['secretsRole'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final secretsArn = this.secretsArn;
    final secretsRole = this.secretsRole;
    return {
      'secretsArn': secretsArn,
      'secretsRole': secretsRole,
    };
  }
}

/// Provides the SAML 2.0 compliant identity provider (IdP) configuration
/// information Amazon Q Business needs to deploy a Amazon Q Business web
/// experience.
class SamlConfiguration {
  /// The metadata XML that your IdP generated.
  final String metadataXML;

  /// The Amazon Resource Name (ARN) of an IAM role assumed by users when they
  /// authenticate into their Amazon Q Business web experience, containing the
  /// relevant Amazon Q Business permissions for conversing with Amazon Q
  /// Business.
  final String roleArn;

  /// The user attribute name in your IdP that maps to the user email.
  final String userIdAttribute;

  /// The group attribute name in your IdP that maps to user groups.
  final String? userGroupAttribute;

  SamlConfiguration({
    required this.metadataXML,
    required this.roleArn,
    required this.userIdAttribute,
    this.userGroupAttribute,
  });

  factory SamlConfiguration.fromJson(Map<String, dynamic> json) {
    return SamlConfiguration(
      metadataXML: (json['metadataXML'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      userIdAttribute: (json['userIdAttribute'] as String?) ?? '',
      userGroupAttribute: json['userGroupAttribute'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataXML = this.metadataXML;
    final roleArn = this.roleArn;
    final userIdAttribute = this.userIdAttribute;
    final userGroupAttribute = this.userGroupAttribute;
    return {
      'metadataXML': metadataXML,
      'roleArn': roleArn,
      'userIdAttribute': userIdAttribute,
      if (userGroupAttribute != null) 'userGroupAttribute': userGroupAttribute,
    };
  }
}

/// Provides information about a Amazon Q Business request error.
class ErrorDetail {
  /// The code associated with the Amazon Q Business request error.
  final ErrorCode? errorCode;

  /// The message explaining the Amazon Q Business request error.
  final String? errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      errorCode: (json['errorCode'] as String?)?.let(ErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

class ErrorCode {
  static const internalError = ErrorCode._('InternalError');
  static const invalidRequest = ErrorCode._('InvalidRequest');
  static const resourceInactive = ErrorCode._('ResourceInactive');
  static const resourceNotFound = ErrorCode._('ResourceNotFound');

  final String value;

  const ErrorCode._(this.value);

  static const values = [
    internalError,
    invalidRequest,
    resourceInactive,
    resourceNotFound
  ];

  static ErrorCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ErrorCode._(value));

  @override
  bool operator ==(other) => other is ErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A list of key/value pairs that identify an index, FAQ, or data source. Tag
/// keys and values can consist of Unicode letters, digits, white space, and any
/// of the following symbols: _ . : / = + - @.
class Tag {
  /// The key for the tag. Keys are not case sensitive and must be unique for the
  /// Amazon Q Business application or data source.
  final String key;

  /// The value associated with the tag. The value may be an empty string but it
  /// can't be null.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
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

/// Summary information for the retriever used for your Amazon Q Business
/// application.
class Retriever {
  /// The identifier of the Amazon Q Business application using the retriever.
  final String? applicationId;

  /// The name of your retriever.
  final String? displayName;

  /// The identifier of the retriever used by your Amazon Q Business application.
  final String? retrieverId;

  /// The status of your retriever.
  final RetrieverStatus? status;

  /// The type of your retriever.
  final RetrieverType? type;

  Retriever({
    this.applicationId,
    this.displayName,
    this.retrieverId,
    this.status,
    this.type,
  });

  factory Retriever.fromJson(Map<String, dynamic> json) {
    return Retriever(
      applicationId: json['applicationId'] as String?,
      displayName: json['displayName'] as String?,
      retrieverId: json['retrieverId'] as String?,
      status: (json['status'] as String?)?.let(RetrieverStatus.fromString),
      type: (json['type'] as String?)?.let(RetrieverType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final displayName = this.displayName;
    final retrieverId = this.retrieverId;
    final status = this.status;
    final type = this.type;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (displayName != null) 'displayName': displayName,
      if (retrieverId != null) 'retrieverId': retrieverId,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

class RetrieverType {
  static const nativeIndex = RetrieverType._('NATIVE_INDEX');
  static const kendraIndex = RetrieverType._('KENDRA_INDEX');

  final String value;

  const RetrieverType._(this.value);

  static const values = [nativeIndex, kendraIndex];

  static RetrieverType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RetrieverType._(value));

  @override
  bool operator ==(other) => other is RetrieverType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class RetrieverStatus {
  static const creating = RetrieverStatus._('CREATING');
  static const active = RetrieverStatus._('ACTIVE');
  static const failed = RetrieverStatus._('FAILED');

  final String value;

  const RetrieverStatus._(this.value);

  static const values = [creating, active, failed];

  static RetrieverStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RetrieverStatus._(value));

  @override
  bool operator ==(other) => other is RetrieverStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information on how the retriever used for your Amazon Q Business
/// application is configured.
class RetrieverConfiguration {
  /// Provides information on how the Amazon Kendra index used as a retriever for
  /// your Amazon Q Business application is configured.
  final KendraIndexConfiguration? kendraIndexConfiguration;

  /// Provides information on how a Amazon Q Business index used as a retriever
  /// for your Amazon Q Business application is configured.
  final NativeIndexConfiguration? nativeIndexConfiguration;

  RetrieverConfiguration({
    this.kendraIndexConfiguration,
    this.nativeIndexConfiguration,
  });

  factory RetrieverConfiguration.fromJson(Map<String, dynamic> json) {
    return RetrieverConfiguration(
      kendraIndexConfiguration: json['kendraIndexConfiguration'] != null
          ? KendraIndexConfiguration.fromJson(
              json['kendraIndexConfiguration'] as Map<String, dynamic>)
          : null,
      nativeIndexConfiguration: json['nativeIndexConfiguration'] != null
          ? NativeIndexConfiguration.fromJson(
              json['nativeIndexConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kendraIndexConfiguration = this.kendraIndexConfiguration;
    final nativeIndexConfiguration = this.nativeIndexConfiguration;
    return {
      if (kendraIndexConfiguration != null)
        'kendraIndexConfiguration': kendraIndexConfiguration,
      if (nativeIndexConfiguration != null)
        'nativeIndexConfiguration': nativeIndexConfiguration,
    };
  }
}

/// Configuration information for an Amazon Q Business index.
class NativeIndexConfiguration {
  /// The identifier for the Amazon Q Business index.
  final String indexId;

  /// Overrides the default boosts applied by Amazon Q Business to supported
  /// document attribute data types.
  final Map<String, DocumentAttributeBoostingConfiguration>? boostingOverride;

  /// A read-only field that specifies the version of the
  /// <code>NativeIndexConfiguration</code>.
  ///
  /// Amazon Q Business introduces enhanced document retrieval capabilities in
  /// version 2 of <code>NativeIndexConfiguration</code>, focusing on streamlined
  /// metadata boosting that prioritizes recency and source relevance to deliver
  /// more accurate responses to your queries. Version 2 has the following
  /// differences from version 1:
  ///
  /// <ul>
  /// <li>
  /// Version 2 supports a single Date field (created_at OR last_updated_at) for
  /// recency boosting
  /// </li>
  /// <li>
  /// Version 2 supports a single String field with an ordered list of up to 5
  /// values
  /// </li>
  /// <li>
  /// Version 2 introduces number-based boost levels (ONE, TWO) alongside the
  /// text-based levels
  /// </li>
  /// <li>
  /// Version 2 allows specifying prioritization between Date and String fields
  /// </li>
  /// <li>
  /// Version 2 maintains backward compatibility with existing configurations
  /// </li>
  /// </ul>
  final int? version;

  NativeIndexConfiguration({
    required this.indexId,
    this.boostingOverride,
    this.version,
  });

  factory NativeIndexConfiguration.fromJson(Map<String, dynamic> json) {
    return NativeIndexConfiguration(
      indexId: (json['indexId'] as String?) ?? '',
      boostingOverride: (json['boostingOverride'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              DocumentAttributeBoostingConfiguration.fromJson(
                  e as Map<String, dynamic>))),
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexId = this.indexId;
    final boostingOverride = this.boostingOverride;
    final version = this.version;
    return {
      'indexId': indexId,
      if (boostingOverride != null) 'boostingOverride': boostingOverride,
      if (version != null) 'version': version,
    };
  }
}

/// Stores an Amazon Kendra index as a retriever.
class KendraIndexConfiguration {
  /// The identifier of the Amazon Kendra index.
  final String indexId;

  KendraIndexConfiguration({
    required this.indexId,
  });

  factory KendraIndexConfiguration.fromJson(Map<String, dynamic> json) {
    return KendraIndexConfiguration(
      indexId: (json['indexId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final indexId = this.indexId;
    return {
      'indexId': indexId,
    };
  }
}

/// Provides information on boosting supported Amazon Q Business document
/// attribute types. When an end user chat query matches document attributes
/// that have been boosted, Amazon Q Business prioritizes generating responses
/// from content that matches the boosted document attributes.
///
/// In version 2, boosting uses numeric values (ONE, TWO) to indicate priority
/// tiers that establish clear hierarchical relationships between boosted
/// attributes. This allows for more precise control over how different
/// attributes influence search results.
/// <note>
/// For <code>STRING</code> and <code>STRING_LIST</code> type document
/// attributes to be used for boosting on the console and the API, they must be
/// enabled for search using the <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeConfiguration.html">DocumentAttributeConfiguration</a>
/// object of the <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_UpdateIndex.html">UpdateIndex</a>
/// API. If you haven't enabled searching on these attributes, you can't boost
/// attributes of these data types on either the console or the API.
/// </note>
/// For more information on how boosting document attributes work in Amazon Q
/// Business, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/metadata-boosting.html">Boosting
/// using document attributes</a>.
class DocumentAttributeBoostingConfiguration {
  /// Provides information on boosting <code>DATE</code> type document attributes.
  ///
  /// Version 2 assigns priority tiers to <code>DATE</code> attributes,
  /// establishing clear hierarchical relationships with other boosted attributes.
  final DateAttributeBoostingConfiguration? dateConfiguration;

  /// Provides information on boosting <code>NUMBER</code> type document
  /// attributes.
  ///
  /// <code>NUMBER</code> attributes are not supported when using
  /// <code>NativeIndexConfiguration</code> version 2, which focuses on
  /// <code>DATE</code> attributes for recency and <code>STRING</code> attributes
  /// for source prioritization.
  final NumberAttributeBoostingConfiguration? numberConfiguration;

  /// Provides information on boosting <code>STRING</code> type document
  /// attributes.
  ///
  /// Version 2 assigns priority tiers to <code>STRING</code> attributes,
  /// establishing clear hierarchical relationships with other boosted attributes.
  final StringAttributeBoostingConfiguration? stringConfiguration;

  /// Provides information on boosting <code>STRING_LIST</code> type document
  /// attributes.
  ///
  /// <code>STRING_LIST</code> attributes are not supported when using
  /// <code>NativeIndexConfiguration</code> version 2, which focuses on
  /// <code>DATE</code> attributes for recency and <code>STRING</code> attributes
  /// for source prioritization.
  final StringListAttributeBoostingConfiguration? stringListConfiguration;

  DocumentAttributeBoostingConfiguration({
    this.dateConfiguration,
    this.numberConfiguration,
    this.stringConfiguration,
    this.stringListConfiguration,
  });

  factory DocumentAttributeBoostingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DocumentAttributeBoostingConfiguration(
      dateConfiguration: json['dateConfiguration'] != null
          ? DateAttributeBoostingConfiguration.fromJson(
              json['dateConfiguration'] as Map<String, dynamic>)
          : null,
      numberConfiguration: json['numberConfiguration'] != null
          ? NumberAttributeBoostingConfiguration.fromJson(
              json['numberConfiguration'] as Map<String, dynamic>)
          : null,
      stringConfiguration: json['stringConfiguration'] != null
          ? StringAttributeBoostingConfiguration.fromJson(
              json['stringConfiguration'] as Map<String, dynamic>)
          : null,
      stringListConfiguration: json['stringListConfiguration'] != null
          ? StringListAttributeBoostingConfiguration.fromJson(
              json['stringListConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dateConfiguration = this.dateConfiguration;
    final numberConfiguration = this.numberConfiguration;
    final stringConfiguration = this.stringConfiguration;
    final stringListConfiguration = this.stringListConfiguration;
    return {
      if (dateConfiguration != null) 'dateConfiguration': dateConfiguration,
      if (numberConfiguration != null)
        'numberConfiguration': numberConfiguration,
      if (stringConfiguration != null)
        'stringConfiguration': stringConfiguration,
      if (stringListConfiguration != null)
        'stringListConfiguration': stringListConfiguration,
    };
  }
}

/// Provides information on boosting <code>NUMBER</code> type document
/// attributes.
///
/// In the current boosting implementation, boosting focuses primarily on
/// <code>DATE</code> attributes for recency and <code>STRING</code> attributes
/// for source prioritization. <code>NUMBER</code> attributes can serve as
/// additional boosting factors when needed, but are not supported when using
/// <code>NativeIndexConfiguration</code> version 2.
///
/// For more information on how boosting document attributes work in Amazon Q
/// Business, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/metadata-boosting.html">Boosting
/// using document attributes</a>.
class NumberAttributeBoostingConfiguration {
  /// Specifies the priority of boosted document attributes in relation to other
  /// boosted attributes. This parameter determines how strongly the attribute
  /// influences document ranking in search results. <code>NUMBER</code>
  /// attributes can serve as additional boosting factors when needed, but are not
  /// supported when using <code>NativeIndexConfiguration</code> version 2.
  final DocumentAttributeBoostingLevel boostingLevel;

  /// Specifies whether higher or lower numeric values should be prioritized when
  /// boosting. Valid values are ASCENDING (higher numbers are more important) and
  /// DESCENDING (lower numbers are more important).
  final NumberAttributeBoostingType? boostingType;

  NumberAttributeBoostingConfiguration({
    required this.boostingLevel,
    this.boostingType,
  });

  factory NumberAttributeBoostingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return NumberAttributeBoostingConfiguration(
      boostingLevel: DocumentAttributeBoostingLevel.fromString(
          (json['boostingLevel'] as String?) ?? ''),
      boostingType: (json['boostingType'] as String?)
          ?.let(NumberAttributeBoostingType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final boostingLevel = this.boostingLevel;
    final boostingType = this.boostingType;
    return {
      'boostingLevel': boostingLevel.value,
      if (boostingType != null) 'boostingType': boostingType.value,
    };
  }
}

/// Provides information on boosting <code>STRING</code> type document
/// attributes.
/// <note>
/// For <code>STRING</code> and <code>STRING_LIST</code> type document
/// attributes to be used for boosting on the console and the API, they must be
/// enabled for search using the <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeConfiguration.html">DocumentAttributeConfiguration</a>
/// object of the <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_UpdateIndex.html">UpdateIndex</a>
/// API. If you haven't enabled searching on these attributes, you can't boost
/// attributes of these data types on either the console or the API.
/// </note>
/// For more information on how boosting document attributes work in Amazon Q
/// Business, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/metadata-boosting.html">Boosting
/// using document attributes</a>.
class StringAttributeBoostingConfiguration {
  /// Specifies the priority tier ranking of boosting applied to document
  /// attributes. For version 2, this parameter indicates the relative ranking
  /// between boosted fields (ONE being highest priority, TWO being second
  /// highest, etc.) and determines the order in which attributes influence
  /// document ranking in search results. For version 1, this parameter specifies
  /// the boosting intensity. For version 2, boosting intensity (VERY HIGH, HIGH,
  /// MEDIUM, LOW, NONE) are not supported. Note that in version 2, you are not
  /// allowed to boost on only one field and make this value TWO.
  final DocumentAttributeBoostingLevel boostingLevel;

  /// Specifies specific values of a <code>STRING</code> type document attribute
  /// being boosted. When using <code>NativeIndexConfiguration</code> version 2,
  /// you can specify up to five values in order of priority.
  final Map<String, StringAttributeValueBoostingLevel>? attributeValueBoosting;

  StringAttributeBoostingConfiguration({
    required this.boostingLevel,
    this.attributeValueBoosting,
  });

  factory StringAttributeBoostingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return StringAttributeBoostingConfiguration(
      boostingLevel: DocumentAttributeBoostingLevel.fromString(
          (json['boostingLevel'] as String?) ?? ''),
      attributeValueBoosting: (json['attributeValueBoosting']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, StringAttributeValueBoostingLevel.fromString((e as String)))),
    );
  }

  Map<String, dynamic> toJson() {
    final boostingLevel = this.boostingLevel;
    final attributeValueBoosting = this.attributeValueBoosting;
    return {
      'boostingLevel': boostingLevel.value,
      if (attributeValueBoosting != null)
        'attributeValueBoosting':
            attributeValueBoosting.map((k, e) => MapEntry(k, e.value)),
    };
  }
}

/// Provides information on boosting <code>DATE</code> type document attributes.
///
/// For more information on how boosting document attributes work in Amazon Q
/// Business, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/metadata-boosting.html">Boosting
/// using document attributes</a>.
class DateAttributeBoostingConfiguration {
  /// Specifies the priority tier ranking of boosting applied to document
  /// attributes. For version 2, this parameter indicates the relative ranking
  /// between boosted fields (ONE being highest priority, TWO being second
  /// highest, etc.) and determines the order in which attributes influence
  /// document ranking in search results. For version 1, this parameter specifies
  /// the boosting intensity. For version 2, boosting intensity (VERY HIGH, HIGH,
  /// MEDIUM, LOW, NONE) are not supported. Note that in version 2, you are not
  /// allowed to boost on only one field and make this value TWO.
  final DocumentAttributeBoostingLevel boostingLevel;

  /// Specifies the duration, in seconds, of a boost applies to a
  /// <code>DATE</code> type document attribute.
  final int? boostingDurationInSeconds;

  DateAttributeBoostingConfiguration({
    required this.boostingLevel,
    this.boostingDurationInSeconds,
  });

  factory DateAttributeBoostingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DateAttributeBoostingConfiguration(
      boostingLevel: DocumentAttributeBoostingLevel.fromString(
          (json['boostingLevel'] as String?) ?? ''),
      boostingDurationInSeconds: json['boostingDurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final boostingLevel = this.boostingLevel;
    final boostingDurationInSeconds = this.boostingDurationInSeconds;
    return {
      'boostingLevel': boostingLevel.value,
      if (boostingDurationInSeconds != null)
        'boostingDurationInSeconds': boostingDurationInSeconds,
    };
  }
}

/// Provides information on boosting <code>STRING_LIST</code> type document
/// attributes.
///
/// In the current boosting implementation, boosting focuses primarily on
/// <code>DATE</code> attributes for recency and <code>STRING</code> attributes
/// for source prioritization. <code>STRING_LIST</code> attributes can serve as
/// additional boosting factors when needed, but are not supported when using
/// <code>NativeIndexConfiguration</code> version 2.
/// <note>
/// For <code>STRING</code> and <code>STRING_LIST</code> type document
/// attributes to be used for boosting on the console and the API, they must be
/// enabled for search using the <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeConfiguration.html">DocumentAttributeConfiguration</a>
/// object of the <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_UpdateIndex.html">UpdateIndex</a>
/// API. If you haven't enabled searching on these attributes, you can't boost
/// attributes of these data types on either the console or the API.
/// </note>
/// For more information on how boosting document attributes work in Amazon Q
/// Business, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/metadata-boosting.html">Boosting
/// using document attributes</a>.
class StringListAttributeBoostingConfiguration {
  /// Specifies the priority of boosted document attributes in relation to other
  /// boosted attributes. This parameter determines how strongly the attribute
  /// influences document ranking in search results. <code>STRING_LIST</code>
  /// attributes can serve as additional boosting factors when needed, but are not
  /// supported when using <code>NativeIndexConfiguration</code> version 2.
  final DocumentAttributeBoostingLevel boostingLevel;

  StringListAttributeBoostingConfiguration({
    required this.boostingLevel,
  });

  factory StringListAttributeBoostingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return StringListAttributeBoostingConfiguration(
      boostingLevel: DocumentAttributeBoostingLevel.fromString(
          (json['boostingLevel'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final boostingLevel = this.boostingLevel;
    return {
      'boostingLevel': boostingLevel.value,
    };
  }
}

class DocumentAttributeBoostingLevel {
  static const none = DocumentAttributeBoostingLevel._('NONE');
  static const low = DocumentAttributeBoostingLevel._('LOW');
  static const medium = DocumentAttributeBoostingLevel._('MEDIUM');
  static const high = DocumentAttributeBoostingLevel._('HIGH');
  static const veryHigh = DocumentAttributeBoostingLevel._('VERY_HIGH');
  static const one = DocumentAttributeBoostingLevel._('ONE');
  static const two = DocumentAttributeBoostingLevel._('TWO');

  final String value;

  const DocumentAttributeBoostingLevel._(this.value);

  static const values = [none, low, medium, high, veryHigh, one, two];

  static DocumentAttributeBoostingLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentAttributeBoostingLevel._(value));

  @override
  bool operator ==(other) =>
      other is DocumentAttributeBoostingLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class StringAttributeValueBoostingLevel {
  static const low = StringAttributeValueBoostingLevel._('LOW');
  static const medium = StringAttributeValueBoostingLevel._('MEDIUM');
  static const high = StringAttributeValueBoostingLevel._('HIGH');
  static const veryHigh = StringAttributeValueBoostingLevel._('VERY_HIGH');
  static const one = StringAttributeValueBoostingLevel._('ONE');
  static const two = StringAttributeValueBoostingLevel._('TWO');
  static const three = StringAttributeValueBoostingLevel._('THREE');
  static const four = StringAttributeValueBoostingLevel._('FOUR');
  static const five = StringAttributeValueBoostingLevel._('FIVE');

  final String value;

  const StringAttributeValueBoostingLevel._(this.value);

  static const values = [
    low,
    medium,
    high,
    veryHigh,
    one,
    two,
    three,
    four,
    five
  ];

  static StringAttributeValueBoostingLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StringAttributeValueBoostingLevel._(value));

  @override
  bool operator ==(other) =>
      other is StringAttributeValueBoostingLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class NumberAttributeBoostingType {
  static const prioritizeLargerValues =
      NumberAttributeBoostingType._('PRIORITIZE_LARGER_VALUES');
  static const prioritizeSmallerValues =
      NumberAttributeBoostingType._('PRIORITIZE_SMALLER_VALUES');

  final String value;

  const NumberAttributeBoostingType._(this.value);

  static const values = [prioritizeLargerValues, prioritizeSmallerValues];

  static NumberAttributeBoostingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NumberAttributeBoostingType._(value));

  @override
  bool operator ==(other) =>
      other is NumberAttributeBoostingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about an Amazon Q Business plugin and its configuration.
class Plugin {
  /// The status of the plugin.
  final PluginBuildStatus? buildStatus;

  /// The timestamp for when the plugin was created.
  final DateTime? createdAt;

  /// The name of the plugin.
  final String? displayName;

  /// The identifier of the plugin.
  final String? pluginId;

  /// The plugin server URL used for configuration.
  final String? serverUrl;

  /// The current status of the plugin.
  final PluginState? state;

  /// The type of the plugin.
  final PluginType? type;

  /// The timestamp for when the plugin was last updated.
  final DateTime? updatedAt;

  Plugin({
    this.buildStatus,
    this.createdAt,
    this.displayName,
    this.pluginId,
    this.serverUrl,
    this.state,
    this.type,
    this.updatedAt,
  });

  factory Plugin.fromJson(Map<String, dynamic> json) {
    return Plugin(
      buildStatus:
          (json['buildStatus'] as String?)?.let(PluginBuildStatus.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      pluginId: json['pluginId'] as String?,
      serverUrl: json['serverUrl'] as String?,
      state: (json['state'] as String?)?.let(PluginState.fromString),
      type: (json['type'] as String?)?.let(PluginType.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final buildStatus = this.buildStatus;
    final createdAt = this.createdAt;
    final displayName = this.displayName;
    final pluginId = this.pluginId;
    final serverUrl = this.serverUrl;
    final state = this.state;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (buildStatus != null) 'buildStatus': buildStatus.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (pluginId != null) 'pluginId': pluginId,
      if (serverUrl != null) 'serverUrl': serverUrl,
      if (state != null) 'state': state.value,
      if (type != null) 'type': type.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class PluginType {
  static const serviceNow = PluginType._('SERVICE_NOW');
  static const salesforce = PluginType._('SALESFORCE');
  static const jira = PluginType._('JIRA');
  static const zendesk = PluginType._('ZENDESK');
  static const custom = PluginType._('CUSTOM');
  static const quicksight = PluginType._('QUICKSIGHT');
  static const servicenowNowPlatform = PluginType._('SERVICENOW_NOW_PLATFORM');
  static const jiraCloud = PluginType._('JIRA_CLOUD');
  static const salesforceCrm = PluginType._('SALESFORCE_CRM');
  static const zendeskSuite = PluginType._('ZENDESK_SUITE');
  static const atlassianConfluence = PluginType._('ATLASSIAN_CONFLUENCE');
  static const googleCalendar = PluginType._('GOOGLE_CALENDAR');
  static const microsoftTeams = PluginType._('MICROSOFT_TEAMS');
  static const microsoftExchange = PluginType._('MICROSOFT_EXCHANGE');
  static const pagerdutyAdvance = PluginType._('PAGERDUTY_ADVANCE');
  static const smartsheet = PluginType._('SMARTSHEET');
  static const asana = PluginType._('ASANA');

  final String value;

  const PluginType._(this.value);

  static const values = [
    serviceNow,
    salesforce,
    jira,
    zendesk,
    custom,
    quicksight,
    servicenowNowPlatform,
    jiraCloud,
    salesforceCrm,
    zendeskSuite,
    atlassianConfluence,
    googleCalendar,
    microsoftTeams,
    microsoftExchange,
    pagerdutyAdvance,
    smartsheet,
    asana
  ];

  static PluginType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PluginType._(value));

  @override
  bool operator ==(other) => other is PluginType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PluginState {
  static const enabled = PluginState._('ENABLED');
  static const disabled = PluginState._('DISABLED');

  final String value;

  const PluginState._(this.value);

  static const values = [enabled, disabled];

  static PluginState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PluginState._(value));

  @override
  bool operator ==(other) => other is PluginState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PluginBuildStatus {
  static const ready = PluginBuildStatus._('READY');
  static const createInProgress = PluginBuildStatus._('CREATE_IN_PROGRESS');
  static const createFailed = PluginBuildStatus._('CREATE_FAILED');
  static const updateInProgress = PluginBuildStatus._('UPDATE_IN_PROGRESS');
  static const updateFailed = PluginBuildStatus._('UPDATE_FAILED');
  static const deleteInProgress = PluginBuildStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = PluginBuildStatus._('DELETE_FAILED');

  final String value;

  const PluginBuildStatus._(this.value);

  static const values = [
    ready,
    createInProgress,
    createFailed,
    updateInProgress,
    updateFailed,
    deleteInProgress,
    deleteFailed
  ];

  static PluginBuildStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PluginBuildStatus._(value));

  @override
  bool operator ==(other) => other is PluginBuildStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration information required to create a custom plugin.
class CustomPluginConfiguration {
  /// The type of OpenAPI schema to use.
  final APISchemaType apiSchemaType;

  /// A description for your custom plugin configuration.
  final String description;

  /// Contains either details about the S3 object containing the OpenAPI schema
  /// for the action group or the JSON or YAML-formatted payload defining the
  /// schema.
  final APISchema? apiSchema;

  CustomPluginConfiguration({
    required this.apiSchemaType,
    required this.description,
    this.apiSchema,
  });

  factory CustomPluginConfiguration.fromJson(Map<String, dynamic> json) {
    return CustomPluginConfiguration(
      apiSchemaType:
          APISchemaType.fromString((json['apiSchemaType'] as String?) ?? ''),
      description: (json['description'] as String?) ?? '',
      apiSchema: json['apiSchema'] != null
          ? APISchema.fromJson(json['apiSchema'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiSchemaType = this.apiSchemaType;
    final description = this.description;
    final apiSchema = this.apiSchema;
    return {
      'apiSchemaType': apiSchemaType.value,
      'description': description,
      if (apiSchema != null) 'apiSchema': apiSchema,
    };
  }
}

/// Authentication configuration information for an Amazon Q Business plugin.
class PluginAuthConfiguration {
  /// Information about the basic authentication credentials used to configure a
  /// plugin.
  final BasicAuthConfiguration? basicAuthConfiguration;

  /// Information about the IAM Identity Center Application used to configure
  /// authentication for a plugin.
  final IdcAuthConfiguration? idcAuthConfiguration;

  /// Information about invoking a custom plugin without any authentication.
  final NoAuthConfiguration? noAuthConfiguration;

  /// Information about the OAuth 2.0 authentication credential/token used to
  /// configure a plugin.
  final OAuth2ClientCredentialConfiguration?
      oAuth2ClientCredentialConfiguration;

  PluginAuthConfiguration({
    this.basicAuthConfiguration,
    this.idcAuthConfiguration,
    this.noAuthConfiguration,
    this.oAuth2ClientCredentialConfiguration,
  });

  factory PluginAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return PluginAuthConfiguration(
      basicAuthConfiguration: json['basicAuthConfiguration'] != null
          ? BasicAuthConfiguration.fromJson(
              json['basicAuthConfiguration'] as Map<String, dynamic>)
          : null,
      idcAuthConfiguration: json['idcAuthConfiguration'] != null
          ? IdcAuthConfiguration.fromJson(
              json['idcAuthConfiguration'] as Map<String, dynamic>)
          : null,
      noAuthConfiguration: json['noAuthConfiguration'] != null
          ? NoAuthConfiguration.fromJson(
              json['noAuthConfiguration'] as Map<String, dynamic>)
          : null,
      oAuth2ClientCredentialConfiguration:
          json['oAuth2ClientCredentialConfiguration'] != null
              ? OAuth2ClientCredentialConfiguration.fromJson(
                  json['oAuth2ClientCredentialConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final basicAuthConfiguration = this.basicAuthConfiguration;
    final idcAuthConfiguration = this.idcAuthConfiguration;
    final noAuthConfiguration = this.noAuthConfiguration;
    final oAuth2ClientCredentialConfiguration =
        this.oAuth2ClientCredentialConfiguration;
    return {
      if (basicAuthConfiguration != null)
        'basicAuthConfiguration': basicAuthConfiguration,
      if (idcAuthConfiguration != null)
        'idcAuthConfiguration': idcAuthConfiguration,
      if (noAuthConfiguration != null)
        'noAuthConfiguration': noAuthConfiguration,
      if (oAuth2ClientCredentialConfiguration != null)
        'oAuth2ClientCredentialConfiguration':
            oAuth2ClientCredentialConfiguration,
    };
  }
}

/// Information about the basic authentication credentials used to configure a
/// plugin.
class BasicAuthConfiguration {
  /// The ARN of an IAM role used by Amazon Q Business to access the basic
  /// authentication credentials stored in a Secrets Manager secret.
  final String roleArn;

  /// The ARN of the Secrets Manager secret that stores the basic authentication
  /// credentials used for plugin configuration..
  final String secretArn;

  BasicAuthConfiguration({
    required this.roleArn,
    required this.secretArn,
  });

  factory BasicAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return BasicAuthConfiguration(
      roleArn: (json['roleArn'] as String?) ?? '',
      secretArn: (json['secretArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final secretArn = this.secretArn;
    return {
      'roleArn': roleArn,
      'secretArn': secretArn,
    };
  }
}

/// Information about the OAuth 2.0 authentication credential/token used to
/// configure a plugin.
class OAuth2ClientCredentialConfiguration {
  /// The ARN of an IAM role used by Amazon Q Business to access the OAuth 2.0
  /// authentication credentials stored in a Secrets Manager secret.
  final String roleArn;

  /// The ARN of the Secrets Manager secret that stores the OAuth 2.0
  /// credentials/token used for plugin configuration.
  final String secretArn;

  /// The redirect URL required by the OAuth 2.0 protocol for Amazon Q Business to
  /// authenticate a plugin user through a third party authentication server.
  final String? authorizationUrl;

  /// The URL required by the OAuth 2.0 protocol to exchange an end user
  /// authorization code for an access token.
  final String? tokenUrl;

  OAuth2ClientCredentialConfiguration({
    required this.roleArn,
    required this.secretArn,
    this.authorizationUrl,
    this.tokenUrl,
  });

  factory OAuth2ClientCredentialConfiguration.fromJson(
      Map<String, dynamic> json) {
    return OAuth2ClientCredentialConfiguration(
      roleArn: (json['roleArn'] as String?) ?? '',
      secretArn: (json['secretArn'] as String?) ?? '',
      authorizationUrl: json['authorizationUrl'] as String?,
      tokenUrl: json['tokenUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final secretArn = this.secretArn;
    final authorizationUrl = this.authorizationUrl;
    final tokenUrl = this.tokenUrl;
    return {
      'roleArn': roleArn,
      'secretArn': secretArn,
      if (authorizationUrl != null) 'authorizationUrl': authorizationUrl,
      if (tokenUrl != null) 'tokenUrl': tokenUrl,
    };
  }
}

/// Information about invoking a custom plugin without any authentication or
/// authorization requirement.
class NoAuthConfiguration {
  NoAuthConfiguration();

  factory NoAuthConfiguration.fromJson(Map<String, dynamic> _) {
    return NoAuthConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about the IAM Identity Center Application used to configure
/// authentication for a plugin.
class IdcAuthConfiguration {
  /// The Amazon Resource Name (ARN) of the IAM Identity Center Application used
  /// to configure authentication.
  final String idcApplicationArn;

  /// The Amazon Resource Name (ARN) of the IAM role with permissions to perform
  /// actions on Amazon Web Services services on your behalf.
  final String roleArn;

  IdcAuthConfiguration({
    required this.idcApplicationArn,
    required this.roleArn,
  });

  factory IdcAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return IdcAuthConfiguration(
      idcApplicationArn: (json['idcApplicationArn'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final idcApplicationArn = this.idcApplicationArn;
    final roleArn = this.roleArn;
    return {
      'idcApplicationArn': idcApplicationArn,
      'roleArn': roleArn,
    };
  }
}

class APISchemaType {
  static const openApiV3 = APISchemaType._('OPEN_API_V3');

  final String value;

  const APISchemaType._(this.value);

  static const values = [openApiV3];

  static APISchemaType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => APISchemaType._(value));

  @override
  bool operator ==(other) => other is APISchemaType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about the OpenAPI schema for a custom plugin. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/custom-plugin.html#plugins-api-schema">custom
/// plugin OpenAPI schemas</a>. You can either include the schema directly in
/// the payload field or you can upload it to an S3 bucket and specify the S3
/// bucket location in the <code>s3</code> field.
class APISchema {
  /// The JSON or YAML-formatted payload defining the OpenAPI schema for a custom
  /// plugin.
  final String? payload;

  /// Contains details about the S3 object containing the OpenAPI schema for a
  /// custom plugin. The schema could be in either JSON or YAML format.
  final S3? s3;

  APISchema({
    this.payload,
    this.s3,
  });

  factory APISchema.fromJson(Map<String, dynamic> json) {
    return APISchema(
      payload: json['payload'] as String?,
      s3: json['s3'] != null
          ? S3.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final s3 = this.s3;
    return {
      if (payload != null) 'payload': payload,
      if (s3 != null) 's3': s3,
    };
  }
}

/// Information required for Amazon Q Business to find a specific file in an
/// Amazon S3 bucket.
class S3 {
  /// The name of the S3 bucket that contains the file.
  final String bucket;

  /// The name of the file.
  final String key;

  S3({
    required this.bucket,
    required this.key,
  });

  factory S3.fromJson(Map<String, dynamic> json) {
    return S3(
      bucket: (json['bucket'] as String?) ?? '',
      key: (json['key'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      'bucket': bucket,
      'key': key,
    };
  }
}

/// A data source in an Amazon Q Business application.
class DataSource {
  /// The Unix timestamp when the Amazon Q Business data source was created.
  final DateTime? createdAt;

  /// The identifier of the Amazon Q Business data source.
  final String? dataSourceId;

  /// The name of the Amazon Q Business data source.
  final String? displayName;

  /// The status of the Amazon Q Business data source.
  final DataSourceStatus? status;

  /// The type of the Amazon Q Business data source.
  final String? type;

  /// The Unix timestamp when the Amazon Q Business data source was last updated.
  final DateTime? updatedAt;

  DataSource({
    this.createdAt,
    this.dataSourceId,
    this.displayName,
    this.status,
    this.type,
    this.updatedAt,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      createdAt: timeStampFromJson(json['createdAt']),
      dataSourceId: json['dataSourceId'] as String?,
      displayName: json['displayName'] as String?,
      status: (json['status'] as String?)?.let(DataSourceStatus.fromString),
      type: json['type'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataSourceId = this.dataSourceId;
    final displayName = this.displayName;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dataSourceId != null) 'dataSourceId': dataSourceId,
      if (displayName != null) 'displayName': displayName,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DataSourceStatus {
  static const pendingCreation = DataSourceStatus._('PENDING_CREATION');
  static const creating = DataSourceStatus._('CREATING');
  static const active = DataSourceStatus._('ACTIVE');
  static const deleting = DataSourceStatus._('DELETING');
  static const failed = DataSourceStatus._('FAILED');
  static const updating = DataSourceStatus._('UPDATING');

  final String value;

  const DataSourceStatus._(this.value);

  static const values = [
    pendingCreation,
    creating,
    active,
    deleting,
    failed,
    updating
  ];

  static DataSourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataSourceStatus._(value));

  @override
  bool operator ==(other) => other is DataSourceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides configuration information needed to connect to an Amazon VPC
/// (Virtual Private Cloud).
class DataSourceVpcConfiguration {
  /// A list of identifiers of security groups within your Amazon VPC. The
  /// security groups should enable Amazon Q Business to connect to the data
  /// source.
  final List<String> securityGroupIds;

  /// A list of identifiers for subnets within your Amazon VPC. The subnets should
  /// be able to connect to each other in the VPC, and they should have outgoing
  /// access to the Internet through a NAT device.
  final List<String> subnetIds;

  DataSourceVpcConfiguration({
    required this.securityGroupIds,
    required this.subnetIds,
  });

  factory DataSourceVpcConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSourceVpcConfiguration(
      securityGroupIds: ((json['securityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
    };
  }
}

/// Provides the configuration information for altering document metadata and
/// content during the document ingestion process.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/custom-document-enrichment.html">Custom
/// document enrichment</a>.
class DocumentEnrichmentConfiguration {
  /// Configuration information to alter document attributes or metadata fields
  /// and content when ingesting documents into Amazon Q Business.
  final List<InlineDocumentEnrichmentConfiguration>? inlineConfigurations;
  final HookConfiguration? postExtractionHookConfiguration;
  final HookConfiguration? preExtractionHookConfiguration;

  DocumentEnrichmentConfiguration({
    this.inlineConfigurations,
    this.postExtractionHookConfiguration,
    this.preExtractionHookConfiguration,
  });

  factory DocumentEnrichmentConfiguration.fromJson(Map<String, dynamic> json) {
    return DocumentEnrichmentConfiguration(
      inlineConfigurations: (json['inlineConfigurations'] as List?)
          ?.nonNulls
          .map((e) => InlineDocumentEnrichmentConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      postExtractionHookConfiguration:
          json['postExtractionHookConfiguration'] != null
              ? HookConfiguration.fromJson(
                  json['postExtractionHookConfiguration']
                      as Map<String, dynamic>)
              : null,
      preExtractionHookConfiguration: json['preExtractionHookConfiguration'] !=
              null
          ? HookConfiguration.fromJson(
              json['preExtractionHookConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inlineConfigurations = this.inlineConfigurations;
    final postExtractionHookConfiguration =
        this.postExtractionHookConfiguration;
    final preExtractionHookConfiguration = this.preExtractionHookConfiguration;
    return {
      if (inlineConfigurations != null)
        'inlineConfigurations': inlineConfigurations,
      if (postExtractionHookConfiguration != null)
        'postExtractionHookConfiguration': postExtractionHookConfiguration,
      if (preExtractionHookConfiguration != null)
        'preExtractionHookConfiguration': preExtractionHookConfiguration,
    };
  }
}

/// The configuration for extracting information from media in documents.
class MediaExtractionConfiguration {
  /// Configuration settings for extracting and processing audio content from
  /// media files.
  final AudioExtractionConfiguration? audioExtractionConfiguration;

  /// The configuration for extracting semantic meaning from images in documents.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/extracting-meaning-from-images.html">Extracting
  /// semantic meaning from images and visuals</a>.
  final ImageExtractionConfiguration? imageExtractionConfiguration;

  /// Configuration settings for extracting and processing video content from
  /// media files.
  final VideoExtractionConfiguration? videoExtractionConfiguration;

  MediaExtractionConfiguration({
    this.audioExtractionConfiguration,
    this.imageExtractionConfiguration,
    this.videoExtractionConfiguration,
  });

  factory MediaExtractionConfiguration.fromJson(Map<String, dynamic> json) {
    return MediaExtractionConfiguration(
      audioExtractionConfiguration: json['audioExtractionConfiguration'] != null
          ? AudioExtractionConfiguration.fromJson(
              json['audioExtractionConfiguration'] as Map<String, dynamic>)
          : null,
      imageExtractionConfiguration: json['imageExtractionConfiguration'] != null
          ? ImageExtractionConfiguration.fromJson(
              json['imageExtractionConfiguration'] as Map<String, dynamic>)
          : null,
      videoExtractionConfiguration: json['videoExtractionConfiguration'] != null
          ? VideoExtractionConfiguration.fromJson(
              json['videoExtractionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioExtractionConfiguration = this.audioExtractionConfiguration;
    final imageExtractionConfiguration = this.imageExtractionConfiguration;
    final videoExtractionConfiguration = this.videoExtractionConfiguration;
    return {
      if (audioExtractionConfiguration != null)
        'audioExtractionConfiguration': audioExtractionConfiguration,
      if (imageExtractionConfiguration != null)
        'imageExtractionConfiguration': imageExtractionConfiguration,
      if (videoExtractionConfiguration != null)
        'videoExtractionConfiguration': videoExtractionConfiguration,
    };
  }
}

/// The configuration for extracting semantic meaning from images in documents.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/extracting-meaning-from-images.html">Extracting
/// semantic meaning from images and visuals</a>.
class ImageExtractionConfiguration {
  /// Specify whether to extract semantic meaning from images and visuals from
  /// documents.
  final ImageExtractionStatus imageExtractionStatus;

  ImageExtractionConfiguration({
    required this.imageExtractionStatus,
  });

  factory ImageExtractionConfiguration.fromJson(Map<String, dynamic> json) {
    return ImageExtractionConfiguration(
      imageExtractionStatus: ImageExtractionStatus.fromString(
          (json['imageExtractionStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final imageExtractionStatus = this.imageExtractionStatus;
    return {
      'imageExtractionStatus': imageExtractionStatus.value,
    };
  }
}

/// Configuration settings for audio content extraction and processing.
class AudioExtractionConfiguration {
  /// The status of audio extraction (ENABLED or DISABLED) for processing audio
  /// content from files.
  final AudioExtractionStatus audioExtractionStatus;

  AudioExtractionConfiguration({
    required this.audioExtractionStatus,
  });

  factory AudioExtractionConfiguration.fromJson(Map<String, dynamic> json) {
    return AudioExtractionConfiguration(
      audioExtractionStatus: AudioExtractionStatus.fromString(
          (json['audioExtractionStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final audioExtractionStatus = this.audioExtractionStatus;
    return {
      'audioExtractionStatus': audioExtractionStatus.value,
    };
  }
}

/// Configuration settings for video content extraction and processing.
class VideoExtractionConfiguration {
  /// The status of video extraction (ENABLED or DISABLED) for processing video
  /// content from files.
  final VideoExtractionStatus videoExtractionStatus;

  VideoExtractionConfiguration({
    required this.videoExtractionStatus,
  });

  factory VideoExtractionConfiguration.fromJson(Map<String, dynamic> json) {
    return VideoExtractionConfiguration(
      videoExtractionStatus: VideoExtractionStatus.fromString(
          (json['videoExtractionStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final videoExtractionStatus = this.videoExtractionStatus;
    return {
      'videoExtractionStatus': videoExtractionStatus.value,
    };
  }
}

class VideoExtractionStatus {
  static const enabled = VideoExtractionStatus._('ENABLED');
  static const disabled = VideoExtractionStatus._('DISABLED');

  final String value;

  const VideoExtractionStatus._(this.value);

  static const values = [enabled, disabled];

  static VideoExtractionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VideoExtractionStatus._(value));

  @override
  bool operator ==(other) =>
      other is VideoExtractionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AudioExtractionStatus {
  static const enabled = AudioExtractionStatus._('ENABLED');
  static const disabled = AudioExtractionStatus._('DISABLED');

  final String value;

  const AudioExtractionStatus._(this.value);

  static const values = [enabled, disabled];

  static AudioExtractionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AudioExtractionStatus._(value));

  @override
  bool operator ==(other) =>
      other is AudioExtractionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ImageExtractionStatus {
  static const enabled = ImageExtractionStatus._('ENABLED');
  static const disabled = ImageExtractionStatus._('DISABLED');

  final String value;

  const ImageExtractionStatus._(this.value);

  static const values = [enabled, disabled];

  static ImageExtractionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageExtractionStatus._(value));

  @override
  bool operator ==(other) =>
      other is ImageExtractionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides the configuration information for invoking a Lambda function in
/// Lambda to alter document metadata and content when ingesting documents into
/// Amazon Q Business.
///
/// You can configure your Lambda function using the
/// <code>PreExtractionHookConfiguration</code> parameter if you want to apply
/// advanced alterations on the original or raw documents.
///
/// If you want to apply advanced alterations on the Amazon Q Business
/// structured documents, you must configure your Lambda function using
/// <code>PostExtractionHookConfiguration</code>.
///
/// You can only invoke one Lambda function. However, this function can invoke
/// other functions it requires.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/custom-document-enrichment.html">Custom
/// document enrichment</a>.
class HookConfiguration {
  /// The condition used for when a Lambda function should be invoked.
  ///
  /// For example, you can specify a condition that if there are empty date-time
  /// values, then Amazon Q Business should invoke a function that inserts the
  /// current date-time.
  final DocumentAttributeCondition? invocationCondition;

  /// The Amazon Resource Name (ARN) of the Lambda function during ingestion. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/cde-lambda-operations.html">Using
  /// Lambda functions for Amazon Q Business document enrichment</a>.
  final String? lambdaArn;

  /// The Amazon Resource Name (ARN) of a role with permission to run
  /// <code>PreExtractionHookConfiguration</code> and
  /// <code>PostExtractionHookConfiguration</code> for altering document metadata
  /// and content during the document ingestion process.
  final String? roleArn;

  /// Stores the original, raw documents or the structured, parsed documents
  /// before and after altering them. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/cde-lambda-operations.html#cde-lambda-operations-data-contracts">Data
  /// contracts for Lambda functions</a>.
  final String? s3BucketName;

  HookConfiguration({
    this.invocationCondition,
    this.lambdaArn,
    this.roleArn,
    this.s3BucketName,
  });

  factory HookConfiguration.fromJson(Map<String, dynamic> json) {
    return HookConfiguration(
      invocationCondition: json['invocationCondition'] != null
          ? DocumentAttributeCondition.fromJson(
              json['invocationCondition'] as Map<String, dynamic>)
          : null,
      lambdaArn: json['lambdaArn'] as String?,
      roleArn: json['roleArn'] as String?,
      s3BucketName: json['s3BucketName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invocationCondition = this.invocationCondition;
    final lambdaArn = this.lambdaArn;
    final roleArn = this.roleArn;
    final s3BucketName = this.s3BucketName;
    return {
      if (invocationCondition != null)
        'invocationCondition': invocationCondition,
      if (lambdaArn != null) 'lambdaArn': lambdaArn,
      if (roleArn != null) 'roleArn': roleArn,
      if (s3BucketName != null) 's3BucketName': s3BucketName,
    };
  }
}

/// The condition used for the target document attribute or metadata field when
/// ingesting documents into Amazon Q Business. You use this with <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeTarget.html">
/// <code>DocumentAttributeTarget</code> </a> to apply the condition.
///
/// For example, you can create the 'Department' target field and have it
/// prefill department names associated with the documents based on information
/// in the 'Source_URI' field. Set the condition that if the 'Source_URI' field
/// contains 'financial' in its URI value, then prefill the target field
/// 'Department' with the target value 'Finance' for the document.
///
/// Amazon Q Business can't create a target field if it has not already been
/// created as an index field. After you create your index field, you can create
/// a document metadata field using <code>DocumentAttributeTarget</code>. Amazon
/// Q Business then will map your newly created metadata field to your index
/// field.
class DocumentAttributeCondition {
  /// The identifier of the document attribute used for the condition.
  ///
  /// For example, 'Source_URI' could be an identifier for the attribute or
  /// metadata field that contains source URIs associated with the documents.
  ///
  /// Amazon Q Business currently doesn't support <code>_document_body</code> as
  /// an attribute key used for the condition.
  final String key;

  /// The identifier of the document attribute used for the condition.
  ///
  /// For example, 'Source_URI' could be an identifier for the attribute or
  /// metadata field that contains source URIs associated with the documents.
  ///
  /// Amazon Q Business currently does not support <code>_document_body</code> as
  /// an attribute key used for the condition.
  final DocumentEnrichmentConditionOperator operator;
  final DocumentAttributeValue? value;

  DocumentAttributeCondition({
    required this.key,
    required this.operator,
    this.value,
  });

  factory DocumentAttributeCondition.fromJson(Map<String, dynamic> json) {
    return DocumentAttributeCondition(
      key: (json['key'] as String?) ?? '',
      operator: DocumentEnrichmentConditionOperator.fromString(
          (json['operator'] as String?) ?? ''),
      value: json['value'] != null
          ? DocumentAttributeValue.fromJson(
              json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final operator = this.operator;
    final value = this.value;
    return {
      'key': key,
      'operator': operator.value,
      if (value != null) 'value': value,
    };
  }
}

class DocumentEnrichmentConditionOperator {
  static const greaterThan =
      DocumentEnrichmentConditionOperator._('GREATER_THAN');
  static const greaterThanOrEquals =
      DocumentEnrichmentConditionOperator._('GREATER_THAN_OR_EQUALS');
  static const lessThan = DocumentEnrichmentConditionOperator._('LESS_THAN');
  static const lessThanOrEquals =
      DocumentEnrichmentConditionOperator._('LESS_THAN_OR_EQUALS');
  static const equals = DocumentEnrichmentConditionOperator._('EQUALS');
  static const notEquals = DocumentEnrichmentConditionOperator._('NOT_EQUALS');
  static const contains = DocumentEnrichmentConditionOperator._('CONTAINS');
  static const notContains =
      DocumentEnrichmentConditionOperator._('NOT_CONTAINS');
  static const exists = DocumentEnrichmentConditionOperator._('EXISTS');
  static const notExists = DocumentEnrichmentConditionOperator._('NOT_EXISTS');
  static const beginsWith =
      DocumentEnrichmentConditionOperator._('BEGINS_WITH');

  final String value;

  const DocumentEnrichmentConditionOperator._(this.value);

  static const values = [
    greaterThan,
    greaterThanOrEquals,
    lessThan,
    lessThanOrEquals,
    equals,
    notEquals,
    contains,
    notContains,
    exists,
    notExists,
    beginsWith
  ];

  static DocumentEnrichmentConditionOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentEnrichmentConditionOperator._(value));

  @override
  bool operator ==(other) =>
      other is DocumentEnrichmentConditionOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The value of a document attribute. You can only provide one value for a
/// document attribute.
class DocumentAttributeValue {
  /// A date expressed as an ISO 8601 string.
  ///
  /// It's important for the time zone to be included in the ISO 8601 date-time
  /// format. For example, 2012-03-25T12:30:10+01:00 is the ISO 8601 date-time
  /// format for March 25th 2012 at 12:30PM (plus 10 seconds) in Central European
  /// Time.
  final DateTime? dateValue;

  /// A long integer value.
  final int? longValue;

  /// A list of strings.
  final List<String>? stringListValue;

  /// A string.
  final String? stringValue;

  DocumentAttributeValue({
    this.dateValue,
    this.longValue,
    this.stringListValue,
    this.stringValue,
  });

  factory DocumentAttributeValue.fromJson(Map<String, dynamic> json) {
    return DocumentAttributeValue(
      dateValue: timeStampFromJson(json['dateValue']),
      longValue: json['longValue'] as int?,
      stringListValue: (json['stringListValue'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dateValue = this.dateValue;
    final longValue = this.longValue;
    final stringListValue = this.stringListValue;
    final stringValue = this.stringValue;
    return {
      if (dateValue != null) 'dateValue': unixTimestampToJson(dateValue),
      if (longValue != null) 'longValue': longValue,
      if (stringListValue != null) 'stringListValue': stringListValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// Provides the configuration information for applying basic logic to alter
/// document metadata and content when ingesting documents into Amazon Q
/// Business.
///
/// To apply advanced logic, to go beyond what you can do with basic logic, see
/// <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_HookConfiguration.html">
/// <code>HookConfiguration</code> </a>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/custom-document-enrichment.html">Custom
/// document enrichment</a>.
class InlineDocumentEnrichmentConfiguration {
  final DocumentAttributeCondition? condition;

  /// <code>TRUE</code> to delete content if the condition used for the target
  /// attribute is met.
  final DocumentContentOperator? documentContentOperator;
  final DocumentAttributeTarget? target;

  InlineDocumentEnrichmentConfiguration({
    this.condition,
    this.documentContentOperator,
    this.target,
  });

  factory InlineDocumentEnrichmentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return InlineDocumentEnrichmentConfiguration(
      condition: json['condition'] != null
          ? DocumentAttributeCondition.fromJson(
              json['condition'] as Map<String, dynamic>)
          : null,
      documentContentOperator: (json['documentContentOperator'] as String?)
          ?.let(DocumentContentOperator.fromString),
      target: json['target'] != null
          ? DocumentAttributeTarget.fromJson(
              json['target'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final documentContentOperator = this.documentContentOperator;
    final target = this.target;
    return {
      if (condition != null) 'condition': condition,
      if (documentContentOperator != null)
        'documentContentOperator': documentContentOperator.value,
      if (target != null) 'target': target,
    };
  }
}

/// The target document attribute or metadata field you want to alter when
/// ingesting documents into Amazon Q Business.
///
/// For example, you can delete all customer identification numbers associated
/// with the documents, stored in the document metadata field called
/// 'Customer_ID' by setting the target key as 'Customer_ID' and the deletion
/// flag to <code>TRUE</code>. This removes all customer ID values in the field
/// 'Customer_ID'. This would scrub personally identifiable information from
/// each document's metadata.
///
/// Amazon Q Business can't create a target field if it has not already been
/// created as an index field. After you create your index field, you can create
/// a document metadata field using <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeTarget.html">
/// <code>DocumentAttributeTarget</code> </a>. Amazon Q Business will then map
/// your newly created document attribute to your index field.
///
/// You can also use this with <a
/// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeCondition.html">
/// <code>DocumentAttributeCondition</code> </a>.
class DocumentAttributeTarget {
  /// The identifier of the target document attribute or metadata field. For
  /// example, 'Department' could be an identifier for the target attribute or
  /// metadata field that includes the department names associated with the
  /// documents.
  final String key;

  /// <code>TRUE</code> to delete the existing target value for your specified
  /// target attribute key. You cannot create a target value and set this to
  /// <code>TRUE</code>.
  final AttributeValueOperator? attributeValueOperator;
  final DocumentAttributeValue? value;

  DocumentAttributeTarget({
    required this.key,
    this.attributeValueOperator,
    this.value,
  });

  factory DocumentAttributeTarget.fromJson(Map<String, dynamic> json) {
    return DocumentAttributeTarget(
      key: (json['key'] as String?) ?? '',
      attributeValueOperator: (json['attributeValueOperator'] as String?)
          ?.let(AttributeValueOperator.fromString),
      value: json['value'] != null
          ? DocumentAttributeValue.fromJson(
              json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final attributeValueOperator = this.attributeValueOperator;
    final value = this.value;
    return {
      'key': key,
      if (attributeValueOperator != null)
        'attributeValueOperator': attributeValueOperator.value,
      if (value != null) 'value': value,
    };
  }
}

class DocumentContentOperator {
  static const delete = DocumentContentOperator._('DELETE');

  final String value;

  const DocumentContentOperator._(this.value);

  static const values = [delete];

  static DocumentContentOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentContentOperator._(value));

  @override
  bool operator ==(other) =>
      other is DocumentContentOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AttributeValueOperator {
  static const delete = AttributeValueOperator._('DELETE');

  final String value;

  const AttributeValueOperator._(this.value);

  static const values = [delete];

  static AttributeValueOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttributeValueOperator._(value));

  @override
  bool operator ==(other) =>
      other is AttributeValueOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information for your Amazon Q Business index.
class Index {
  /// The Unix timestamp when the index was created.
  final DateTime? createdAt;

  /// The name of the index.
  final String? displayName;

  /// The identifier for the index.
  final String? indexId;

  /// The current status of the index. When the status is <code>ACTIVE</code>, the
  /// index is ready.
  final IndexStatus? status;

  /// The Unix timestamp when the index was last updated.
  final DateTime? updatedAt;

  Index({
    this.createdAt,
    this.displayName,
    this.indexId,
    this.status,
    this.updatedAt,
  });

  factory Index.fromJson(Map<String, dynamic> json) {
    return Index(
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      indexId: json['indexId'] as String?,
      status: (json['status'] as String?)?.let(IndexStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final displayName = this.displayName;
    final indexId = this.indexId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (indexId != null) 'indexId': indexId,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class IndexStatus {
  static const creating = IndexStatus._('CREATING');
  static const active = IndexStatus._('ACTIVE');
  static const deleting = IndexStatus._('DELETING');
  static const failed = IndexStatus._('FAILED');
  static const updating = IndexStatus._('UPDATING');

  final String value;

  const IndexStatus._(this.value);

  static const values = [creating, active, deleting, failed, updating];

  static IndexStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => IndexStatus._(value));

  @override
  bool operator ==(other) => other is IndexStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information about index capacity configuration.
class IndexCapacityConfiguration {
  /// The number of storage units configured for an Amazon Q Business index.
  final int? units;

  IndexCapacityConfiguration({
    this.units,
  });

  factory IndexCapacityConfiguration.fromJson(Map<String, dynamic> json) {
    return IndexCapacityConfiguration(
      units: json['units'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final units = this.units;
    return {
      if (units != null) 'units': units,
    };
  }
}

/// Configuration information for document attributes. Document attributes are
/// metadata or fields associated with your documents. For example, the company
/// department name associated with each document.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/doc-attributes.html">Understanding
/// document attributes</a>.
class DocumentAttributeConfiguration {
  /// The name of the document attribute.
  final String? name;

  /// Information about whether the document attribute can be used by an end user
  /// to search for information on their web experience.
  final Status? search;

  /// The type of document attribute.
  final AttributeType? type;

  DocumentAttributeConfiguration({
    this.name,
    this.search,
    this.type,
  });

  factory DocumentAttributeConfiguration.fromJson(Map<String, dynamic> json) {
    return DocumentAttributeConfiguration(
      name: json['name'] as String?,
      search: (json['search'] as String?)?.let(Status.fromString),
      type: (json['type'] as String?)?.let(AttributeType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final search = this.search;
    final type = this.type;
    return {
      if (name != null) 'name': name,
      if (search != null) 'search': search.value,
      if (type != null) 'type': type.value,
    };
  }
}

class AttributeType {
  static const string = AttributeType._('STRING');
  static const stringList = AttributeType._('STRING_LIST');
  static const number = AttributeType._('NUMBER');
  static const date = AttributeType._('DATE');

  final String value;

  const AttributeType._(this.value);

  static const values = [string, stringList, number, date];

  static AttributeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttributeType._(value));

  @override
  bool operator ==(other) => other is AttributeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Status {
  static const enabled = Status._('ENABLED');
  static const disabled = Status._('DISABLED');

  final String value;

  const Status._(this.value);

  static const values = [enabled, disabled];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IndexType {
  static const enterprise = IndexType._('ENTERPRISE');
  static const starter = IndexType._('STARTER');

  final String value;

  const IndexType._(this.value);

  static const values = [enterprise, starter];

  static IndexType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => IndexType._(value));

  @override
  bool operator ==(other) => other is IndexType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information about the number of documents in an index.
class IndexStatistics {
  /// The number of documents indexed.
  final TextDocumentStatistics? textDocumentStatistics;

  IndexStatistics({
    this.textDocumentStatistics,
  });

  factory IndexStatistics.fromJson(Map<String, dynamic> json) {
    return IndexStatistics(
      textDocumentStatistics: json['textDocumentStatistics'] != null
          ? TextDocumentStatistics.fromJson(
              json['textDocumentStatistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final textDocumentStatistics = this.textDocumentStatistics;
    return {
      if (textDocumentStatistics != null)
        'textDocumentStatistics': textDocumentStatistics,
    };
  }
}

/// Provides information about text documents in an index.
class TextDocumentStatistics {
  /// The total size, in bytes, of the indexed documents.
  final int? indexedTextBytes;

  /// The number of text documents indexed.
  final int? indexedTextDocumentCount;

  TextDocumentStatistics({
    this.indexedTextBytes,
    this.indexedTextDocumentCount,
  });

  factory TextDocumentStatistics.fromJson(Map<String, dynamic> json) {
    return TextDocumentStatistics(
      indexedTextBytes: json['indexedTextBytes'] as int?,
      indexedTextDocumentCount: json['indexedTextDocumentCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexedTextBytes = this.indexedTextBytes;
    final indexedTextDocumentCount = this.indexedTextDocumentCount;
    return {
      if (indexedTextBytes != null) 'indexedTextBytes': indexedTextBytes,
      if (indexedTextDocumentCount != null)
        'indexedTextDocumentCount': indexedTextDocumentCount,
    };
  }
}

/// Provides summary information about a data accessor.
class DataAccessor {
  /// The authentication configuration details for the data accessor. This
  /// specifies how the ISV authenticates when accessing data through this data
  /// accessor.
  final DataAccessorAuthenticationDetail? authenticationDetail;

  /// The timestamp when the data accessor was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the data accessor.
  final String? dataAccessorArn;

  /// The unique identifier of the data accessor.
  final String? dataAccessorId;

  /// The friendly name of the data accessor.
  final String? displayName;

  /// The Amazon Resource Name (ARN) of the associated IAM Identity Center
  /// application.
  final String? idcApplicationArn;

  /// The Amazon Resource Name (ARN) of the IAM role for the ISV associated with
  /// this data accessor.
  final String? principal;

  /// The timestamp when the data accessor was last updated.
  final DateTime? updatedAt;

  DataAccessor({
    this.authenticationDetail,
    this.createdAt,
    this.dataAccessorArn,
    this.dataAccessorId,
    this.displayName,
    this.idcApplicationArn,
    this.principal,
    this.updatedAt,
  });

  factory DataAccessor.fromJson(Map<String, dynamic> json) {
    return DataAccessor(
      authenticationDetail: json['authenticationDetail'] != null
          ? DataAccessorAuthenticationDetail.fromJson(
              json['authenticationDetail'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      dataAccessorArn: json['dataAccessorArn'] as String?,
      dataAccessorId: json['dataAccessorId'] as String?,
      displayName: json['displayName'] as String?,
      idcApplicationArn: json['idcApplicationArn'] as String?,
      principal: json['principal'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationDetail = this.authenticationDetail;
    final createdAt = this.createdAt;
    final dataAccessorArn = this.dataAccessorArn;
    final dataAccessorId = this.dataAccessorId;
    final displayName = this.displayName;
    final idcApplicationArn = this.idcApplicationArn;
    final principal = this.principal;
    final updatedAt = this.updatedAt;
    return {
      if (authenticationDetail != null)
        'authenticationDetail': authenticationDetail,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dataAccessorArn != null) 'dataAccessorArn': dataAccessorArn,
      if (dataAccessorId != null) 'dataAccessorId': dataAccessorId,
      if (displayName != null) 'displayName': displayName,
      if (idcApplicationArn != null) 'idcApplicationArn': idcApplicationArn,
      if (principal != null) 'principal': principal,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Contains the authentication configuration details for a data accessor. This
/// structure defines how the ISV authenticates when accessing data through the
/// data accessor.
class DataAccessorAuthenticationDetail {
  /// The type of authentication to use for the data accessor. This determines how
  /// the ISV authenticates when accessing data. You can use one of two
  /// authentication types:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS_IAM_IDC_TTI</code> - Authentication using IAM Identity Center
  /// Trusted Token Issuer (TTI). This authentication type allows the ISV to use a
  /// trusted token issuer to generate tokens for accessing the data.
  /// </li>
  /// <li>
  /// <code>AWS_IAM_IDC_AUTH_CODE</code> - Authentication using IAM Identity
  /// Center authorization code flow. This authentication type uses the standard
  /// OAuth 2.0 authorization code flow for authentication.
  /// </li>
  /// </ul>
  final DataAccessorAuthenticationType authenticationType;

  /// The specific authentication configuration based on the authentication type.
  final DataAccessorAuthenticationConfiguration? authenticationConfiguration;

  /// A list of external identifiers associated with this authentication
  /// configuration. These are used to correlate the data accessor with external
  /// systems.
  final List<String>? externalIds;

  DataAccessorAuthenticationDetail({
    required this.authenticationType,
    this.authenticationConfiguration,
    this.externalIds,
  });

  factory DataAccessorAuthenticationDetail.fromJson(Map<String, dynamic> json) {
    return DataAccessorAuthenticationDetail(
      authenticationType: DataAccessorAuthenticationType.fromString(
          (json['authenticationType'] as String?) ?? ''),
      authenticationConfiguration: json['authenticationConfiguration'] != null
          ? DataAccessorAuthenticationConfiguration.fromJson(
              json['authenticationConfiguration'] as Map<String, dynamic>)
          : null,
      externalIds: (json['externalIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationType = this.authenticationType;
    final authenticationConfiguration = this.authenticationConfiguration;
    final externalIds = this.externalIds;
    return {
      'authenticationType': authenticationType.value,
      if (authenticationConfiguration != null)
        'authenticationConfiguration': authenticationConfiguration,
      if (externalIds != null) 'externalIds': externalIds,
    };
  }
}

/// The type of authentication mechanism used by the data accessor.
class DataAccessorAuthenticationType {
  static const awsIamIdcTti =
      DataAccessorAuthenticationType._('AWS_IAM_IDC_TTI');
  static const awsIamIdcAuthCode =
      DataAccessorAuthenticationType._('AWS_IAM_IDC_AUTH_CODE');

  final String value;

  const DataAccessorAuthenticationType._(this.value);

  static const values = [awsIamIdcTti, awsIamIdcAuthCode];

  static DataAccessorAuthenticationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataAccessorAuthenticationType._(value));

  @override
  bool operator ==(other) =>
      other is DataAccessorAuthenticationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A union type that contains the specific authentication configuration based
/// on the authentication type selected.
class DataAccessorAuthenticationConfiguration {
  /// Configuration for IAM Identity Center Trusted Token Issuer (TTI)
  /// authentication used when the authentication type is
  /// <code>AWS_IAM_IDC_TTI</code>.
  final DataAccessorIdcTrustedTokenIssuerConfiguration?
      idcTrustedTokenIssuerConfiguration;

  DataAccessorAuthenticationConfiguration({
    this.idcTrustedTokenIssuerConfiguration,
  });

  factory DataAccessorAuthenticationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataAccessorAuthenticationConfiguration(
      idcTrustedTokenIssuerConfiguration:
          json['idcTrustedTokenIssuerConfiguration'] != null
              ? DataAccessorIdcTrustedTokenIssuerConfiguration.fromJson(
                  json['idcTrustedTokenIssuerConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final idcTrustedTokenIssuerConfiguration =
        this.idcTrustedTokenIssuerConfiguration;
    return {
      if (idcTrustedTokenIssuerConfiguration != null)
        'idcTrustedTokenIssuerConfiguration':
            idcTrustedTokenIssuerConfiguration,
    };
  }
}

/// Configuration details for IAM Identity Center Trusted Token Issuer (TTI)
/// authentication.
class DataAccessorIdcTrustedTokenIssuerConfiguration {
  /// The Amazon Resource Name (ARN) of the IAM Identity Center Trusted Token
  /// Issuer that will be used for authentication.
  final String idcTrustedTokenIssuerArn;

  DataAccessorIdcTrustedTokenIssuerConfiguration({
    required this.idcTrustedTokenIssuerArn,
  });

  factory DataAccessorIdcTrustedTokenIssuerConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataAccessorIdcTrustedTokenIssuerConfiguration(
      idcTrustedTokenIssuerArn:
          (json['idcTrustedTokenIssuerArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final idcTrustedTokenIssuerArn = this.idcTrustedTokenIssuerArn;
    return {
      'idcTrustedTokenIssuerArn': idcTrustedTokenIssuerArn,
    };
  }
}

/// Specifies an allowed action and its associated filter configuration.
class ActionConfiguration {
  /// The Amazon Q Business action that is allowed.
  final String action;

  /// The filter configuration for the action, if any.
  final ActionFilterConfiguration? filterConfiguration;

  ActionConfiguration({
    required this.action,
    this.filterConfiguration,
  });

  factory ActionConfiguration.fromJson(Map<String, dynamic> json) {
    return ActionConfiguration(
      action: (json['action'] as String?) ?? '',
      filterConfiguration: json['filterConfiguration'] != null
          ? ActionFilterConfiguration.fromJson(
              json['filterConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final filterConfiguration = this.filterConfiguration;
    return {
      'action': action,
      if (filterConfiguration != null)
        'filterConfiguration': filterConfiguration,
    };
  }
}

/// Specifies filters to apply to an allowed action.
class ActionFilterConfiguration {
  final AttributeFilter documentAttributeFilter;

  ActionFilterConfiguration({
    required this.documentAttributeFilter,
  });

  factory ActionFilterConfiguration.fromJson(Map<String, dynamic> json) {
    return ActionFilterConfiguration(
      documentAttributeFilter: AttributeFilter.fromJson(
          (json['documentAttributeFilter'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final documentAttributeFilter = this.documentAttributeFilter;
    return {
      'documentAttributeFilter': documentAttributeFilter,
    };
  }
}

/// Enables filtering of responses based on document attributes or metadata
/// fields.
class AttributeFilter {
  /// Performs a logical <code>AND</code> operation on all supplied filters.
  final List<AttributeFilter>? andAllFilters;

  /// Returns <code>true</code> when a document contains all the specified
  /// document attributes or metadata fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>stringListValue</code>.
  final DocumentAttribute? containsAll;

  /// Returns <code>true</code> when a document contains any of the specified
  /// document attributes or metadata fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>stringListValue</code>.
  final DocumentAttribute? containsAny;

  /// Performs an equals operation on two document attributes or metadata fields.
  /// Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>dateValue</code>, <code>longValue</code>,
  /// <code>stringListValue</code> and <code>stringValue</code>.
  final DocumentAttribute? equalsTo;

  /// Performs a greater than operation on two document attributes or metadata
  /// fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>dateValue</code> and
  /// <code>longValue</code>.
  final DocumentAttribute? greaterThan;

  /// Performs a greater or equals than operation on two document attributes or
  /// metadata fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>dateValue</code> and
  /// <code>longValue</code>.
  final DocumentAttribute? greaterThanOrEquals;

  /// Performs a less than operation on two document attributes or metadata
  /// fields. Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value types</a>: <code>dateValue</code> and
  /// <code>longValue</code>.
  final DocumentAttribute? lessThan;

  /// Performs a less than or equals operation on two document attributes or
  /// metadata fields.Supported for the following <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/api-reference/API_DocumentAttributeValue.html">document
  /// attribute value type</a>: <code>dateValue</code> and <code>longValue</code>.
  final DocumentAttribute? lessThanOrEquals;

  /// Performs a logical <code>NOT</code> operation on all supplied filters.
  final AttributeFilter? notFilter;

  /// Performs a logical <code>OR</code> operation on all supplied filters.
  final List<AttributeFilter>? orAllFilters;

  AttributeFilter({
    this.andAllFilters,
    this.containsAll,
    this.containsAny,
    this.equalsTo,
    this.greaterThan,
    this.greaterThanOrEquals,
    this.lessThan,
    this.lessThanOrEquals,
    this.notFilter,
    this.orAllFilters,
  });

  factory AttributeFilter.fromJson(Map<String, dynamic> json) {
    return AttributeFilter(
      andAllFilters: (json['andAllFilters'] as List?)
          ?.nonNulls
          .map((e) => AttributeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      containsAll: json['containsAll'] != null
          ? DocumentAttribute.fromJson(
              json['containsAll'] as Map<String, dynamic>)
          : null,
      containsAny: json['containsAny'] != null
          ? DocumentAttribute.fromJson(
              json['containsAny'] as Map<String, dynamic>)
          : null,
      equalsTo: json['equalsTo'] != null
          ? DocumentAttribute.fromJson(json['equalsTo'] as Map<String, dynamic>)
          : null,
      greaterThan: json['greaterThan'] != null
          ? DocumentAttribute.fromJson(
              json['greaterThan'] as Map<String, dynamic>)
          : null,
      greaterThanOrEquals: json['greaterThanOrEquals'] != null
          ? DocumentAttribute.fromJson(
              json['greaterThanOrEquals'] as Map<String, dynamic>)
          : null,
      lessThan: json['lessThan'] != null
          ? DocumentAttribute.fromJson(json['lessThan'] as Map<String, dynamic>)
          : null,
      lessThanOrEquals: json['lessThanOrEquals'] != null
          ? DocumentAttribute.fromJson(
              json['lessThanOrEquals'] as Map<String, dynamic>)
          : null,
      notFilter: json['notFilter'] != null
          ? AttributeFilter.fromJson(json['notFilter'] as Map<String, dynamic>)
          : null,
      orAllFilters: (json['orAllFilters'] as List?)
          ?.nonNulls
          .map((e) => AttributeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final andAllFilters = this.andAllFilters;
    final containsAll = this.containsAll;
    final containsAny = this.containsAny;
    final equalsTo = this.equalsTo;
    final greaterThan = this.greaterThan;
    final greaterThanOrEquals = this.greaterThanOrEquals;
    final lessThan = this.lessThan;
    final lessThanOrEquals = this.lessThanOrEquals;
    final notFilter = this.notFilter;
    final orAllFilters = this.orAllFilters;
    return {
      if (andAllFilters != null) 'andAllFilters': andAllFilters,
      if (containsAll != null) 'containsAll': containsAll,
      if (containsAny != null) 'containsAny': containsAny,
      if (equalsTo != null) 'equalsTo': equalsTo,
      if (greaterThan != null) 'greaterThan': greaterThan,
      if (greaterThanOrEquals != null)
        'greaterThanOrEquals': greaterThanOrEquals,
      if (lessThan != null) 'lessThan': lessThan,
      if (lessThanOrEquals != null) 'lessThanOrEquals': lessThanOrEquals,
      if (notFilter != null) 'notFilter': notFilter,
      if (orAllFilters != null) 'orAllFilters': orAllFilters,
    };
  }
}

/// A document attribute or metadata field.
class DocumentAttribute {
  /// The identifier for the attribute.
  final String name;

  /// The value of the attribute.
  final DocumentAttributeValue value;

  DocumentAttribute({
    required this.name,
    required this.value,
  });

  factory DocumentAttribute.fromJson(Map<String, dynamic> json) {
    return DocumentAttribute(
      name: (json['name'] as String?) ?? '',
      value: DocumentAttributeValue.fromJson(
          (json['value'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// Summary information for an Amazon Q Business application.
class Application {
  /// The identifier for the Amazon Q Business application.
  final String? applicationId;

  /// The Unix timestamp when the Amazon Q Business application was created.
  final DateTime? createdAt;

  /// The name of the Amazon Q Business application.
  final String? displayName;

  /// The authentication type being used by a Amazon Q Business application.
  final IdentityType? identityType;

  /// The Amazon Quick Suite configuration for an Amazon Q Business application
  /// that uses Quick Suite as the identity provider.
  final QuickSightConfiguration? quickSightConfiguration;

  /// The status of the Amazon Q Business application. The application is ready to
  /// use when the status is <code>ACTIVE</code>.
  final ApplicationStatus? status;

  /// The Unix timestamp when the Amazon Q Business application was last updated.
  final DateTime? updatedAt;

  Application({
    this.applicationId,
    this.createdAt,
    this.displayName,
    this.identityType,
    this.quickSightConfiguration,
    this.status,
    this.updatedAt,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      applicationId: json['applicationId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      identityType:
          (json['identityType'] as String?)?.let(IdentityType.fromString),
      quickSightConfiguration: json['quickSightConfiguration'] != null
          ? QuickSightConfiguration.fromJson(
              json['quickSightConfiguration'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(ApplicationStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final createdAt = this.createdAt;
    final displayName = this.displayName;
    final identityType = this.identityType;
    final quickSightConfiguration = this.quickSightConfiguration;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (identityType != null) 'identityType': identityType.value,
      if (quickSightConfiguration != null)
        'quickSightConfiguration': quickSightConfiguration,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class ApplicationStatus {
  static const creating = ApplicationStatus._('CREATING');
  static const active = ApplicationStatus._('ACTIVE');
  static const deleting = ApplicationStatus._('DELETING');
  static const failed = ApplicationStatus._('FAILED');
  static const updating = ApplicationStatus._('UPDATING');

  final String value;

  const ApplicationStatus._(this.value);

  static const values = [creating, active, deleting, failed, updating];

  static ApplicationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationStatus._(value));

  @override
  bool operator ==(other) => other is ApplicationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IdentityType {
  static const awsIamIdpSaml = IdentityType._('AWS_IAM_IDP_SAML');
  static const awsIamIdpOidc = IdentityType._('AWS_IAM_IDP_OIDC');
  static const awsIamIdc = IdentityType._('AWS_IAM_IDC');
  static const awsQuicksightIdp = IdentityType._('AWS_QUICKSIGHT_IDP');
  static const anonymous = IdentityType._('ANONYMOUS');

  final String value;

  const IdentityType._(this.value);

  static const values = [
    awsIamIdpSaml,
    awsIamIdpOidc,
    awsIamIdc,
    awsQuicksightIdp,
    anonymous
  ];

  static IdentityType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => IdentityType._(value));

  @override
  bool operator ==(other) => other is IdentityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon Quick Suite configuration for an Amazon Q Business application
/// that uses Quick Suite as the identity provider. For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/create-quicksight-integrated-application.html">Creating
/// an Amazon Quick Suite integrated application</a>.
class QuickSightConfiguration {
  /// The Amazon Quick Suite namespace that is used as the identity provider. For
  /// more information about Quick Suite namespaces, see <a
  /// href="https://docs.aws.amazon.com/quicksight/latest/developerguide/namespace-operations.html">Namespace
  /// operations</a>.
  final String clientNamespace;

  QuickSightConfiguration({
    required this.clientNamespace,
  });

  factory QuickSightConfiguration.fromJson(Map<String, dynamic> json) {
    return QuickSightConfiguration(
      clientNamespace: (json['clientNamespace'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final clientNamespace = this.clientNamespace;
    return {
      'clientNamespace': clientNamespace,
    };
  }
}

/// Configuration information for the file upload during chat feature.
class AttachmentsConfiguration {
  /// Status information about whether file upload functionality is activated or
  /// deactivated for your end user.
  final AttachmentsControlMode attachmentsControlMode;

  AttachmentsConfiguration({
    required this.attachmentsControlMode,
  });

  Map<String, dynamic> toJson() {
    final attachmentsControlMode = this.attachmentsControlMode;
    return {
      'attachmentsControlMode': attachmentsControlMode.value,
    };
  }
}

/// Configuration information about Amazon Q Apps.
class QAppsConfiguration {
  /// Status information about whether end users can create and use Amazon Q Apps
  /// in the web experience.
  final QAppsControlMode qAppsControlMode;

  QAppsConfiguration({
    required this.qAppsControlMode,
  });

  factory QAppsConfiguration.fromJson(Map<String, dynamic> json) {
    return QAppsConfiguration(
      qAppsControlMode: QAppsControlMode.fromString(
          (json['qAppsControlMode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final qAppsControlMode = this.qAppsControlMode;
    return {
      'qAppsControlMode': qAppsControlMode.value,
    };
  }
}

/// Configuration information about chat response personalization. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/personalizing-chat-responses.html">Personalizing
/// chat responses</a>.
class PersonalizationConfiguration {
  /// An option to allow Amazon Q Business to customize chat responses using user
  /// specific metadata—specifically, location and job information—in your IAM
  /// Identity Center instance.
  final PersonalizationControlMode personalizationControlMode;

  PersonalizationConfiguration({
    required this.personalizationControlMode,
  });

  factory PersonalizationConfiguration.fromJson(Map<String, dynamic> json) {
    return PersonalizationConfiguration(
      personalizationControlMode: PersonalizationControlMode.fromString(
          (json['personalizationControlMode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final personalizationControlMode = this.personalizationControlMode;
    return {
      'personalizationControlMode': personalizationControlMode.value,
    };
  }
}

/// Subscription configuration information for an Amazon Q Business application
/// using IAM identity federation for user management.
class AutoSubscriptionConfiguration {
  /// Describes whether automatic subscriptions are enabled for an Amazon Q
  /// Business application using IAM identity federation for user management.
  final AutoSubscriptionStatus autoSubscribe;

  /// Describes the default subscription type assigned to an Amazon Q Business
  /// application using IAM identity federation for user management. If the value
  /// for <code>autoSubscribe</code> is set to <code>ENABLED</code> you must
  /// select a value for this field.
  final SubscriptionType? defaultSubscriptionType;

  AutoSubscriptionConfiguration({
    required this.autoSubscribe,
    this.defaultSubscriptionType,
  });

  factory AutoSubscriptionConfiguration.fromJson(Map<String, dynamic> json) {
    return AutoSubscriptionConfiguration(
      autoSubscribe: AutoSubscriptionStatus.fromString(
          (json['autoSubscribe'] as String?) ?? ''),
      defaultSubscriptionType: (json['defaultSubscriptionType'] as String?)
          ?.let(SubscriptionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final autoSubscribe = this.autoSubscribe;
    final defaultSubscriptionType = this.defaultSubscriptionType;
    return {
      'autoSubscribe': autoSubscribe.value,
      if (defaultSubscriptionType != null)
        'defaultSubscriptionType': defaultSubscriptionType.value,
    };
  }
}

class AutoSubscriptionStatus {
  static const enabled = AutoSubscriptionStatus._('ENABLED');
  static const disabled = AutoSubscriptionStatus._('DISABLED');

  final String value;

  const AutoSubscriptionStatus._(this.value);

  static const values = [enabled, disabled];

  static AutoSubscriptionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoSubscriptionStatus._(value));

  @override
  bool operator ==(other) =>
      other is AutoSubscriptionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SubscriptionType {
  static const qLite = SubscriptionType._('Q_LITE');
  static const qBusiness = SubscriptionType._('Q_BUSINESS');

  final String value;

  const SubscriptionType._(this.value);

  static const values = [qLite, qBusiness];

  static SubscriptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SubscriptionType._(value));

  @override
  bool operator ==(other) => other is SubscriptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PersonalizationControlMode {
  static const enabled = PersonalizationControlMode._('ENABLED');
  static const disabled = PersonalizationControlMode._('DISABLED');

  final String value;

  const PersonalizationControlMode._(this.value);

  static const values = [enabled, disabled];

  static PersonalizationControlMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PersonalizationControlMode._(value));

  @override
  bool operator ==(other) =>
      other is PersonalizationControlMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class QAppsControlMode {
  static const enabled = QAppsControlMode._('ENABLED');
  static const disabled = QAppsControlMode._('DISABLED');

  final String value;

  const QAppsControlMode._(this.value);

  static const values = [enabled, disabled];

  static QAppsControlMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QAppsControlMode._(value));

  @override
  bool operator ==(other) => other is QAppsControlMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AttachmentsControlMode {
  static const enabled = AttachmentsControlMode._('ENABLED');
  static const disabled = AttachmentsControlMode._('DISABLED');

  final String value;

  const AttachmentsControlMode._(this.value);

  static const values = [enabled, disabled];

  static AttachmentsControlMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttachmentsControlMode._(value));

  @override
  bool operator ==(other) =>
      other is AttachmentsControlMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides the identifier of the KMS key used to encrypt data indexed by
/// Amazon Q Business. Amazon Q Business doesn't support asymmetric keys.
class EncryptionConfiguration {
  /// The identifier of the KMS key. Amazon Q Business doesn't support asymmetric
  /// keys.
  final String? kmsKeyId;

  EncryptionConfiguration({
    this.kmsKeyId,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
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

/// Configuration information about the file upload during chat feature for your
/// application.
class AppliedAttachmentsConfiguration {
  /// Information about whether file upload during chat functionality is activated
  /// for your application.
  final AttachmentsControlMode? attachmentsControlMode;

  AppliedAttachmentsConfiguration({
    this.attachmentsControlMode,
  });

  factory AppliedAttachmentsConfiguration.fromJson(Map<String, dynamic> json) {
    return AppliedAttachmentsConfiguration(
      attachmentsControlMode: (json['attachmentsControlMode'] as String?)
          ?.let(AttachmentsControlMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentsControlMode = this.attachmentsControlMode;
    return {
      if (attachmentsControlMode != null)
        'attachmentsControlMode': attachmentsControlMode.value,
    };
  }
}

/// Aliases attached to a user id within an Amazon Q Business application.
class UserAlias {
  /// The identifier of the user id associated with the user aliases.
  final String userId;

  /// The identifier of the data source that the user aliases are associated with.
  final String? dataSourceId;

  /// The identifier of the index that the user aliases are associated with.
  final String? indexId;

  UserAlias({
    required this.userId,
    this.dataSourceId,
    this.indexId,
  });

  factory UserAlias.fromJson(Map<String, dynamic> json) {
    return UserAlias(
      userId: (json['userId'] as String?) ?? '',
      dataSourceId: json['dataSourceId'] as String?,
      indexId: json['indexId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final dataSourceId = this.dataSourceId;
    final indexId = this.indexId;
    return {
      'userId': userId,
      if (dataSourceId != null) 'dataSourceId': dataSourceId,
      if (indexId != null) 'indexId': indexId,
    };
  }
}

/// The details of an Amazon Q Business subscription.
class SubscriptionDetails {
  /// The type of an Amazon Q Business subscription.
  final SubscriptionType? type;

  SubscriptionDetails({
    this.type,
  });

  factory SubscriptionDetails.fromJson(Map<String, dynamic> json) {
    return SubscriptionDetails(
      type: (json['type'] as String?)?.let(SubscriptionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type.value,
    };
  }
}

class ResponseConfigurationType {
  static const all = ResponseConfigurationType._('ALL');

  final String value;

  const ResponseConfigurationType._(this.value);

  static const values = [all];

  static ResponseConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResponseConfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is ResponseConfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration settings to define how Amazon Q Business generates and formats
/// responses to user queries. This includes customization options for response
/// style, tone, length, and other characteristics.
class ResponseConfiguration {
  /// A collection of instructions that guide how Amazon Q Business generates
  /// responses, including parameters for response length, target audience,
  /// perspective, output style, identity, tone, and custom instructions.
  final InstructionCollection? instructionCollection;

  ResponseConfiguration({
    this.instructionCollection,
  });

  factory ResponseConfiguration.fromJson(Map<String, dynamic> json) {
    return ResponseConfiguration(
      instructionCollection: json['instructionCollection'] != null
          ? InstructionCollection.fromJson(
              json['instructionCollection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instructionCollection = this.instructionCollection;
    return {
      if (instructionCollection != null)
        'instructionCollection': instructionCollection,
    };
  }
}

/// A set of instructions that define how Amazon Q Business should generate and
/// format responses to user queries. This collection includes parameters for
/// controlling response characteristics such as length, audience targeting,
/// perspective, style, identity, tone, and custom instructions.
class InstructionCollection {
  /// Allows administrators to provide specific, custom instructions that guide
  /// how Amazon Q Business should respond in particular scenarios or to certain
  /// types of queries, enabling fine-grained control over response generation.
  final String? customInstructions;

  /// Provides sample responses or templates that Amazon Q Business can reference
  /// when generating responses, helping to establish consistent patterns and
  /// formats for different types of user queries.
  final String? examples;

  /// Defines the persona or identity that Amazon Q Business should adopt when
  /// responding to users, allowing for customization of the assistant's
  /// character, role, or representation within an organization.
  final String? identity;

  /// Specifies the formatting and structural style of responses, such as bullet
  /// points, paragraphs, step-by-step instructions, or other organizational
  /// formats that enhance readability and comprehension.
  final String? outputStyle;

  /// Determines the point of view or perspective from which Amazon Q Business
  /// generates responses, such as first-person, second-person, or third-person
  /// perspective, affecting how information is presented to users.
  final String? perspective;

  /// Specifies the desired length of responses generated by Amazon Q Business.
  /// This parameter allows administrators to control whether responses are
  /// concise and brief or more detailed and comprehensive.
  final String? responseLength;

  /// Defines the intended audience for the responses, allowing Amazon Q Business
  /// to tailor its language, terminology, and explanations appropriately. This
  /// could range from technical experts to general users with varying levels of
  /// domain knowledge.
  final String? targetAudience;

  /// Controls the emotional tone and communication style of responses, such as
  /// formal, casual, technical, friendly, or professional, to align with
  /// organizational communication standards and user expectations.
  final String? tone;

  InstructionCollection({
    this.customInstructions,
    this.examples,
    this.identity,
    this.outputStyle,
    this.perspective,
    this.responseLength,
    this.targetAudience,
    this.tone,
  });

  factory InstructionCollection.fromJson(Map<String, dynamic> json) {
    return InstructionCollection(
      customInstructions: json['customInstructions'] as String?,
      examples: json['examples'] as String?,
      identity: json['identity'] as String?,
      outputStyle: json['outputStyle'] as String?,
      perspective: json['perspective'] as String?,
      responseLength: json['responseLength'] as String?,
      targetAudience: json['targetAudience'] as String?,
      tone: json['tone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customInstructions = this.customInstructions;
    final examples = this.examples;
    final identity = this.identity;
    final outputStyle = this.outputStyle;
    final perspective = this.perspective;
    final responseLength = this.responseLength;
    final targetAudience = this.targetAudience;
    final tone = this.tone;
    return {
      if (customInstructions != null) 'customInstructions': customInstructions,
      if (examples != null) 'examples': examples,
      if (identity != null) 'identity': identity,
      if (outputStyle != null) 'outputStyle': outputStyle,
      if (perspective != null) 'perspective': perspective,
      if (responseLength != null) 'responseLength': responseLength,
      if (targetAudience != null) 'targetAudience': targetAudience,
      if (tone != null) 'tone': tone,
    };
  }
}

class ResponseScope {
  static const enterpriseContentOnly =
      ResponseScope._('ENTERPRISE_CONTENT_ONLY');
  static const extendedKnowledgeEnabled =
      ResponseScope._('EXTENDED_KNOWLEDGE_ENABLED');

  final String value;

  const ResponseScope._(this.value);

  static const values = [enterpriseContentOnly, extendedKnowledgeEnabled];

  static ResponseScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResponseScope._(value));

  @override
  bool operator ==(other) => other is ResponseScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration information required to enable chat orchestration for your
/// Amazon Q Business application.
/// <note>
/// Chat orchestration is optimized to work for English language content. For
/// more details on language support in Amazon Q Business, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/supported-languages.html">Supported
/// languages</a>.
/// </note>
class OrchestrationConfiguration {
  /// Status information about whether chat orchestration is activated or
  /// deactivated for your Amazon Q Business application.
  final OrchestrationControl control;

  OrchestrationConfiguration({
    required this.control,
  });

  Map<String, dynamic> toJson() {
    final control = this.control;
    return {
      'control': control.value,
    };
  }
}

/// Updates a blocked phrases configuration in your Amazon Q Business
/// application.
class BlockedPhrasesConfigurationUpdate {
  /// Creates or updates a blocked phrases configuration in your Amazon Q Business
  /// application.
  final List<String>? blockedPhrasesToCreateOrUpdate;

  /// Deletes a blocked phrases configuration in your Amazon Q Business
  /// application.
  final List<String>? blockedPhrasesToDelete;

  /// The configured custom message displayed to your end user when they use
  /// blocked phrase during chat.
  final String? systemMessageOverride;

  BlockedPhrasesConfigurationUpdate({
    this.blockedPhrasesToCreateOrUpdate,
    this.blockedPhrasesToDelete,
    this.systemMessageOverride,
  });

  Map<String, dynamic> toJson() {
    final blockedPhrasesToCreateOrUpdate = this.blockedPhrasesToCreateOrUpdate;
    final blockedPhrasesToDelete = this.blockedPhrasesToDelete;
    final systemMessageOverride = this.systemMessageOverride;
    return {
      if (blockedPhrasesToCreateOrUpdate != null)
        'blockedPhrasesToCreateOrUpdate': blockedPhrasesToCreateOrUpdate,
      if (blockedPhrasesToDelete != null)
        'blockedPhrasesToDelete': blockedPhrasesToDelete,
      if (systemMessageOverride != null)
        'systemMessageOverride': systemMessageOverride,
    };
  }
}

/// Configuration information required to invoke chat in
/// <code>CREATOR_MODE</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/guardrails.html">Admin
/// controls and guardrails</a> and <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/using-web-experience.html#chat-source-scope">Conversation
/// settings</a>.
class CreatorModeConfiguration {
  /// Status information about whether <code>CREATOR_MODE</code> has been enabled
  /// or disabled. The default status is <code>DISABLED</code>.
  final CreatorModeControl creatorModeControl;

  CreatorModeConfiguration({
    required this.creatorModeControl,
  });

  Map<String, dynamic> toJson() {
    final creatorModeControl = this.creatorModeControl;
    return {
      'creatorModeControl': creatorModeControl.value,
    };
  }
}

/// Configuration information required to setup hallucination reduction. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/hallucination-reduction.html">
/// hallucination reduction</a>.
/// <note>
/// The hallucination reduction feature won't work if chat orchestration
/// controls are enabled for your application.
/// </note>
class HallucinationReductionConfiguration {
  /// Controls whether hallucination reduction has been enabled or disabled for
  /// your application. The default status is <code>DISABLED</code>.
  final HallucinationReductionControl? hallucinationReductionControl;

  HallucinationReductionConfiguration({
    this.hallucinationReductionControl,
  });

  factory HallucinationReductionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return HallucinationReductionConfiguration(
      hallucinationReductionControl:
          (json['hallucinationReductionControl'] as String?)
              ?.let(HallucinationReductionControl.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final hallucinationReductionControl = this.hallucinationReductionControl;
    return {
      if (hallucinationReductionControl != null)
        'hallucinationReductionControl': hallucinationReductionControl.value,
    };
  }
}

class HallucinationReductionControl {
  static const enabled = HallucinationReductionControl._('ENABLED');
  static const disabled = HallucinationReductionControl._('DISABLED');

  final String value;

  const HallucinationReductionControl._(this.value);

  static const values = [enabled, disabled];

  static HallucinationReductionControl fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HallucinationReductionControl._(value));

  @override
  bool operator ==(other) =>
      other is HallucinationReductionControl && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class CreatorModeControl {
  static const enabled = CreatorModeControl._('ENABLED');
  static const disabled = CreatorModeControl._('DISABLED');

  final String value;

  const CreatorModeControl._(this.value);

  static const values = [enabled, disabled];

  static CreatorModeControl fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CreatorModeControl._(value));

  @override
  bool operator ==(other) =>
      other is CreatorModeControl && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The topic specific controls configured for an Amazon Q Business application.
class TopicConfiguration {
  /// A name for your topic control configuration.
  final String name;

  /// Rules defined for a topic configuration.
  final List<Rule> rules;

  /// A description for your topic control configuration. Use this to outline how
  /// the large language model (LLM) should use this topic control configuration.
  final String? description;

  /// A list of example phrases that you expect the end user to use in relation to
  /// the topic.
  final List<String>? exampleChatMessages;

  TopicConfiguration({
    required this.name,
    required this.rules,
    this.description,
    this.exampleChatMessages,
  });

  factory TopicConfiguration.fromJson(Map<String, dynamic> json) {
    return TopicConfiguration(
      name: (json['name'] as String?) ?? '',
      rules: ((json['rules'] as List?) ?? const [])
          .nonNulls
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      exampleChatMessages: (json['exampleChatMessages'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final rules = this.rules;
    final description = this.description;
    final exampleChatMessages = this.exampleChatMessages;
    return {
      'name': name,
      'rules': rules,
      if (description != null) 'description': description,
      if (exampleChatMessages != null)
        'exampleChatMessages': exampleChatMessages,
    };
  }
}

/// Guardrail rules for an Amazon Q Business application. Amazon Q Business
/// supports only one rule at a time.
class Rule {
  /// The type of rule.
  final RuleType ruleType;

  /// Users and groups to be excluded from a rule.
  final UsersAndGroups? excludedUsersAndGroups;

  /// Users and groups to be included in a rule.
  final UsersAndGroups? includedUsersAndGroups;

  /// The configuration information for a rule.
  final RuleConfiguration? ruleConfiguration;

  Rule({
    required this.ruleType,
    this.excludedUsersAndGroups,
    this.includedUsersAndGroups,
    this.ruleConfiguration,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      ruleType: RuleType.fromString((json['ruleType'] as String?) ?? ''),
      excludedUsersAndGroups: json['excludedUsersAndGroups'] != null
          ? UsersAndGroups.fromJson(
              json['excludedUsersAndGroups'] as Map<String, dynamic>)
          : null,
      includedUsersAndGroups: json['includedUsersAndGroups'] != null
          ? UsersAndGroups.fromJson(
              json['includedUsersAndGroups'] as Map<String, dynamic>)
          : null,
      ruleConfiguration: json['ruleConfiguration'] != null
          ? RuleConfiguration.fromJson(
              json['ruleConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleType = this.ruleType;
    final excludedUsersAndGroups = this.excludedUsersAndGroups;
    final includedUsersAndGroups = this.includedUsersAndGroups;
    final ruleConfiguration = this.ruleConfiguration;
    return {
      'ruleType': ruleType.value,
      if (excludedUsersAndGroups != null)
        'excludedUsersAndGroups': excludedUsersAndGroups,
      if (includedUsersAndGroups != null)
        'includedUsersAndGroups': includedUsersAndGroups,
      if (ruleConfiguration != null) 'ruleConfiguration': ruleConfiguration,
    };
  }
}

/// Provides information about users and group names associated with a topic
/// control rule.
class UsersAndGroups {
  /// The user group names associated with a topic control rule.
  final List<String>? userGroups;

  /// The user ids associated with a topic control rule.
  final List<String>? userIds;

  UsersAndGroups({
    this.userGroups,
    this.userIds,
  });

  factory UsersAndGroups.fromJson(Map<String, dynamic> json) {
    return UsersAndGroups(
      userGroups: (json['userGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      userIds:
          (json['userIds'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final userGroups = this.userGroups;
    final userIds = this.userIds;
    return {
      if (userGroups != null) 'userGroups': userGroups,
      if (userIds != null) 'userIds': userIds,
    };
  }
}

class RuleType {
  static const contentBlockerRule = RuleType._('CONTENT_BLOCKER_RULE');
  static const contentRetrievalRule = RuleType._('CONTENT_RETRIEVAL_RULE');

  final String value;

  const RuleType._(this.value);

  static const values = [contentBlockerRule, contentRetrievalRule];

  static RuleType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RuleType._(value));

  @override
  bool operator ==(other) => other is RuleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides configuration information about a rule.
class RuleConfiguration {
  /// A rule for configuring how Amazon Q Business responds when it encounters a a
  /// blocked topic.
  final ContentBlockerRule? contentBlockerRule;
  final ContentRetrievalRule? contentRetrievalRule;

  RuleConfiguration({
    this.contentBlockerRule,
    this.contentRetrievalRule,
  });

  factory RuleConfiguration.fromJson(Map<String, dynamic> json) {
    return RuleConfiguration(
      contentBlockerRule: json['contentBlockerRule'] != null
          ? ContentBlockerRule.fromJson(
              json['contentBlockerRule'] as Map<String, dynamic>)
          : null,
      contentRetrievalRule: json['contentRetrievalRule'] != null
          ? ContentRetrievalRule.fromJson(
              json['contentRetrievalRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentBlockerRule = this.contentBlockerRule;
    final contentRetrievalRule = this.contentRetrievalRule;
    return {
      if (contentBlockerRule != null) 'contentBlockerRule': contentBlockerRule,
      if (contentRetrievalRule != null)
        'contentRetrievalRule': contentRetrievalRule,
    };
  }
}

/// A rule for configuring how Amazon Q Business responds when it encounters a a
/// blocked topic. You can configure a custom message to inform your end users
/// that they have asked about a restricted topic and suggest any next steps
/// they should take.
class ContentBlockerRule {
  /// The configured custom message displayed to an end user informing them that
  /// they've used a blocked phrase during chat.
  final String? systemMessageOverride;

  ContentBlockerRule({
    this.systemMessageOverride,
  });

  factory ContentBlockerRule.fromJson(Map<String, dynamic> json) {
    return ContentBlockerRule(
      systemMessageOverride: json['systemMessageOverride'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final systemMessageOverride = this.systemMessageOverride;
    return {
      if (systemMessageOverride != null)
        'systemMessageOverride': systemMessageOverride,
    };
  }
}

/// Rules for retrieving content from data sources connected to a Amazon Q
/// Business application for a specific topic control configuration.
class ContentRetrievalRule {
  /// Specifies data sources in a Amazon Q Business application to use for content
  /// generation.
  final List<EligibleDataSource>? eligibleDataSources;

  ContentRetrievalRule({
    this.eligibleDataSources,
  });

  factory ContentRetrievalRule.fromJson(Map<String, dynamic> json) {
    return ContentRetrievalRule(
      eligibleDataSources: (json['eligibleDataSources'] as List?)
          ?.nonNulls
          .map((e) => EligibleDataSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eligibleDataSources = this.eligibleDataSources;
    return {
      if (eligibleDataSources != null)
        'eligibleDataSources': eligibleDataSources,
    };
  }
}

/// The identifier of the data source Amazon Q Business will generate responses
/// from.
class EligibleDataSource {
  /// The identifier of the data source.
  final String? dataSourceId;

  /// The identifier of the index the data source is attached to.
  final String? indexId;

  EligibleDataSource({
    this.dataSourceId,
    this.indexId,
  });

  factory EligibleDataSource.fromJson(Map<String, dynamic> json) {
    return EligibleDataSource(
      dataSourceId: json['dataSourceId'] as String?,
      indexId: json['indexId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final indexId = this.indexId;
    return {
      if (dataSourceId != null) 'dataSourceId': dataSourceId,
      if (indexId != null) 'indexId': indexId,
    };
  }
}

class OrchestrationControl {
  static const enabled = OrchestrationControl._('ENABLED');
  static const disabled = OrchestrationControl._('DISABLED');

  final String value;

  const OrchestrationControl._(this.value);

  static const values = [enabled, disabled];

  static OrchestrationControl fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OrchestrationControl._(value));

  @override
  bool operator ==(other) =>
      other is OrchestrationControl && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a piece of content that is relevant to a search query.
class RelevantContent {
  /// The actual content of the relevant item.
  final String? content;

  /// Additional attributes of the document containing the relevant content.
  final List<DocumentAttribute>? documentAttributes;

  /// The unique identifier of the document containing the relevant content.
  final String? documentId;

  /// The title of the document containing the relevant content.
  final String? documentTitle;

  /// The URI of the document containing the relevant content.
  final String? documentUri;

  /// Attributes related to the relevance score of the content.
  final ScoreAttributes? scoreAttributes;

  RelevantContent({
    this.content,
    this.documentAttributes,
    this.documentId,
    this.documentTitle,
    this.documentUri,
    this.scoreAttributes,
  });

  factory RelevantContent.fromJson(Map<String, dynamic> json) {
    return RelevantContent(
      content: json['content'] as String?,
      documentAttributes: (json['documentAttributes'] as List?)
          ?.nonNulls
          .map((e) => DocumentAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentId: json['documentId'] as String?,
      documentTitle: json['documentTitle'] as String?,
      documentUri: json['documentUri'] as String?,
      scoreAttributes: json['scoreAttributes'] != null
          ? ScoreAttributes.fromJson(
              json['scoreAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final documentAttributes = this.documentAttributes;
    final documentId = this.documentId;
    final documentTitle = this.documentTitle;
    final documentUri = this.documentUri;
    final scoreAttributes = this.scoreAttributes;
    return {
      if (content != null) 'content': content,
      if (documentAttributes != null) 'documentAttributes': documentAttributes,
      if (documentId != null) 'documentId': documentId,
      if (documentTitle != null) 'documentTitle': documentTitle,
      if (documentUri != null) 'documentUri': documentUri,
      if (scoreAttributes != null) 'scoreAttributes': scoreAttributes,
    };
  }
}

/// Provides information about the relevance score of content.
class ScoreAttributes {
  /// The confidence level of the relevance score.
  final ScoreConfidence? scoreConfidence;

  ScoreAttributes({
    this.scoreConfidence,
  });

  factory ScoreAttributes.fromJson(Map<String, dynamic> json) {
    return ScoreAttributes(
      scoreConfidence:
          (json['scoreConfidence'] as String?)?.let(ScoreConfidence.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final scoreConfidence = this.scoreConfidence;
    return {
      if (scoreConfidence != null) 'scoreConfidence': scoreConfidence.value,
    };
  }
}

class ScoreConfidence {
  static const veryHigh = ScoreConfidence._('VERY_HIGH');
  static const high = ScoreConfidence._('HIGH');
  static const medium = ScoreConfidence._('MEDIUM');
  static const low = ScoreConfidence._('LOW');
  static const notAvailable = ScoreConfidence._('NOT_AVAILABLE');

  final String value;

  const ScoreConfidence._(this.value);

  static const values = [veryHigh, high, medium, low, notAvailable];

  static ScoreConfidence fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScoreConfidence._(value));

  @override
  bool operator ==(other) => other is ScoreConfidence && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the source of content to search in.
class ContentSource {
  /// The retriever to use as the content source.
  final RetrieverContentSource? retriever;

  ContentSource({
    this.retriever,
  });

  Map<String, dynamic> toJson() {
    final retriever = this.retriever;
    return {
      if (retriever != null) 'retriever': retriever,
    };
  }
}

/// Specifies a retriever as the content source for a search.
class RetrieverContentSource {
  /// The unique identifier of the retriever to use as the content source.
  final String retrieverId;

  RetrieverContentSource({
    required this.retrieverId,
  });

  Map<String, dynamic> toJson() {
    final retrieverId = this.retrieverId;
    return {
      'retrieverId': retrieverId,
    };
  }
}

class MembershipType {
  static const $index = MembershipType._('INDEX');
  static const datasource = MembershipType._('DATASOURCE');

  final String value;

  const MembershipType._(this.value);

  static const values = [$index, datasource];

  static MembershipType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipType._(value));

  @override
  bool operator ==(other) => other is MembershipType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A list of users or sub groups that belong to a group. This is for generating
/// Amazon Q Business chat results only from document a user has access to.
class GroupMembers {
  /// A list of sub groups that belong to a group. For example, the sub groups
  /// "Research", "Engineering", and "Sales and Marketing" all belong to the group
  /// "Company".
  final List<MemberGroup>? memberGroups;

  /// A list of users that belong to a group. For example, a list of interns all
  /// belong to the "Interns" group.
  final List<MemberUser>? memberUsers;
  final S3? s3PathForGroupMembers;

  GroupMembers({
    this.memberGroups,
    this.memberUsers,
    this.s3PathForGroupMembers,
  });

  Map<String, dynamic> toJson() {
    final memberGroups = this.memberGroups;
    final memberUsers = this.memberUsers;
    final s3PathForGroupMembers = this.s3PathForGroupMembers;
    return {
      if (memberGroups != null) 'memberGroups': memberGroups,
      if (memberUsers != null) 'memberUsers': memberUsers,
      if (s3PathForGroupMembers != null)
        's3PathForGroupMembers': s3PathForGroupMembers,
    };
  }
}

/// The users that belong to a group.
class MemberUser {
  /// The identifier of the user you want to map to a group.
  final String userId;

  /// The type of the user.
  final MembershipType? type;

  MemberUser({
    required this.userId,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final type = this.type;
    return {
      'userId': userId,
      if (type != null) 'type': type.value,
    };
  }
}

/// The sub groups that belong to a group.
class MemberGroup {
  /// The name of the sub group.
  final String groupName;

  /// The type of the sub group.
  final MembershipType? type;

  MemberGroup({
    required this.groupName,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final groupName = this.groupName;
    final type = this.type;
    return {
      'groupName': groupName,
      if (type != null) 'type': type.value,
    };
  }
}

/// End user feedback on an AI-generated web experience chat message usefulness.
class MessageUsefulnessFeedback {
  /// The timestamp for when the feedback was submitted.
  final DateTime submittedAt;

  /// The usefulness value assigned by an end user to a message.
  final MessageUsefulness usefulness;

  /// A comment given by an end user on the usefulness of an AI-generated chat
  /// message.
  final String? comment;

  /// The reason for a usefulness rating.
  final MessageUsefulnessReason? reason;

  MessageUsefulnessFeedback({
    required this.submittedAt,
    required this.usefulness,
    this.comment,
    this.reason,
  });

  Map<String, dynamic> toJson() {
    final submittedAt = this.submittedAt;
    final usefulness = this.usefulness;
    final comment = this.comment;
    final reason = this.reason;
    return {
      'submittedAt': unixTimestampToJson(submittedAt),
      'usefulness': usefulness.value,
      if (comment != null) 'comment': comment,
      if (reason != null) 'reason': reason.value,
    };
  }
}

class MessageUsefulness {
  static const useful = MessageUsefulness._('USEFUL');
  static const notUseful = MessageUsefulness._('NOT_USEFUL');

  final String value;

  const MessageUsefulness._(this.value);

  static const values = [useful, notUseful];

  static MessageUsefulness fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MessageUsefulness._(value));

  @override
  bool operator ==(other) => other is MessageUsefulness && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class MessageUsefulnessReason {
  static const notFactuallyCorrect =
      MessageUsefulnessReason._('NOT_FACTUALLY_CORRECT');
  static const harmfulOrUnsafe = MessageUsefulnessReason._('HARMFUL_OR_UNSAFE');
  static const incorrectOrMissingSources =
      MessageUsefulnessReason._('INCORRECT_OR_MISSING_SOURCES');
  static const notHelpful = MessageUsefulnessReason._('NOT_HELPFUL');
  static const factuallyCorrect =
      MessageUsefulnessReason._('FACTUALLY_CORRECT');
  static const complete = MessageUsefulnessReason._('COMPLETE');
  static const relevantSources = MessageUsefulnessReason._('RELEVANT_SOURCES');
  static const helpful = MessageUsefulnessReason._('HELPFUL');
  static const notBasedOnDocuments =
      MessageUsefulnessReason._('NOT_BASED_ON_DOCUMENTS');
  static const notComplete = MessageUsefulnessReason._('NOT_COMPLETE');
  static const notConcise = MessageUsefulnessReason._('NOT_CONCISE');
  static const other = MessageUsefulnessReason._('OTHER');

  final String value;

  const MessageUsefulnessReason._(this.value);

  static const values = [
    notFactuallyCorrect,
    harmfulOrUnsafe,
    incorrectOrMissingSources,
    notHelpful,
    factuallyCorrect,
    complete,
    relevantSources,
    helpful,
    notBasedOnDocuments,
    notComplete,
    notConcise,
    other
  ];

  static MessageUsefulnessReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MessageUsefulnessReason._(value));

  @override
  bool operator ==(other) =>
      other is MessageUsefulnessReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about an Amazon Q Business subscription.
///
/// Subscriptions are used to provide access for an IAM Identity Center user or
/// a group to an Amazon Q Business application.
///
/// Amazon Q Business offers two subscription tiers: <code>Q_LITE</code> and
/// <code>Q_BUSINESS</code>. Subscription tier determines feature access for the
/// user. For more information on subscriptions and pricing tiers, see <a
/// href="https://aws.amazon.com/q/business/pricing/">Amazon Q Business
/// pricing</a>.
class Subscription {
  /// The type of your current Amazon Q Business subscription.
  final SubscriptionDetails? currentSubscription;

  /// The type of the Amazon Q Business subscription for the next month.
  final SubscriptionDetails? nextSubscription;

  /// The IAM Identity Center <code>UserId</code> or <code>GroupId</code> of a
  /// user or group in the IAM Identity Center instance connected to the Amazon Q
  /// Business application.
  final SubscriptionPrincipal? principal;

  /// The Amazon Resource Name (ARN) of the Amazon Q Business subscription that
  /// was updated.
  final String? subscriptionArn;

  /// The identifier of the Amazon Q Business subscription to be updated.
  final String? subscriptionId;

  Subscription({
    this.currentSubscription,
    this.nextSubscription,
    this.principal,
    this.subscriptionArn,
    this.subscriptionId,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      currentSubscription: json['currentSubscription'] != null
          ? SubscriptionDetails.fromJson(
              json['currentSubscription'] as Map<String, dynamic>)
          : null,
      nextSubscription: json['nextSubscription'] != null
          ? SubscriptionDetails.fromJson(
              json['nextSubscription'] as Map<String, dynamic>)
          : null,
      principal: json['principal'] != null
          ? SubscriptionPrincipal.fromJson(
              json['principal'] as Map<String, dynamic>)
          : null,
      subscriptionArn: json['subscriptionArn'] as String?,
      subscriptionId: json['subscriptionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentSubscription = this.currentSubscription;
    final nextSubscription = this.nextSubscription;
    final principal = this.principal;
    final subscriptionArn = this.subscriptionArn;
    final subscriptionId = this.subscriptionId;
    return {
      if (currentSubscription != null)
        'currentSubscription': currentSubscription,
      if (nextSubscription != null) 'nextSubscription': nextSubscription,
      if (principal != null) 'principal': principal,
      if (subscriptionArn != null) 'subscriptionArn': subscriptionArn,
      if (subscriptionId != null) 'subscriptionId': subscriptionId,
    };
  }
}

/// A user or group in the IAM Identity Center instance connected to the Amazon
/// Q Business application.
class SubscriptionPrincipal {
  /// The identifier of a group in the IAM Identity Center instance connected to
  /// the Amazon Q Business application.
  final String? group;

  /// The identifier of a user in the IAM Identity Center instance connected to
  /// the Amazon Q Business application.
  final String? user;

  SubscriptionPrincipal({
    this.group,
    this.user,
  });

  factory SubscriptionPrincipal.fromJson(Map<String, dynamic> json) {
    return SubscriptionPrincipal(
      group: json['group'] as String?,
      user: json['user'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final user = this.user;
    return {
      if (group != null) 'group': group,
      if (user != null) 'user': user,
    };
  }
}

/// Summary metadata information for a Amazon Q Business plugin.
class PluginTypeMetadataSummary {
  /// The category of the plugin type.
  final PluginTypeCategory? category;

  /// The description assigned by Amazon Q Business to a plugin. You can't modify
  /// this value.
  final String? description;

  /// The type of the plugin.
  final PluginType? type;

  PluginTypeMetadataSummary({
    this.category,
    this.description,
    this.type,
  });

  factory PluginTypeMetadataSummary.fromJson(Map<String, dynamic> json) {
    return PluginTypeMetadataSummary(
      category:
          (json['category'] as String?)?.let(PluginTypeCategory.fromString),
      description: json['description'] as String?,
      type: (json['type'] as String?)?.let(PluginType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final description = this.description;
    final type = this.type;
    return {
      if (category != null) 'category': category.value,
      if (description != null) 'description': description,
      if (type != null) 'type': type.value,
    };
  }
}

class PluginTypeCategory {
  static const customerRelationshipManagementCrm =
      PluginTypeCategory._('Customer relationship management (CRM)');
  static const projectManagement = PluginTypeCategory._('Project management');
  static const communication = PluginTypeCategory._('Communication');
  static const productivity = PluginTypeCategory._('Productivity');
  static const ticketingAndIncidentManagement =
      PluginTypeCategory._('Ticketing and incident management');

  final String value;

  const PluginTypeCategory._(this.value);

  static const values = [
    customerRelationshipManagementCrm,
    projectManagement,
    communication,
    productivity,
    ticketingAndIncidentManagement
  ];

  static PluginTypeCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PluginTypeCategory._(value));

  @override
  bool operator ==(other) =>
      other is PluginTypeCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information for an Amazon Q Business plugin action.
class ActionSummary {
  /// The identifier of an Amazon Q Business plugin action.
  final String? actionIdentifier;

  /// The description of an Amazon Q Business plugin action.
  final String? description;

  /// The display name assigned by Amazon Q Business to a plugin action. You can't
  /// modify this value.
  final String? displayName;

  /// An Amazon Q Business suggested prompt and end user can use to invoke a
  /// plugin action. This value can be modified and sent as input to initiate an
  /// action. For example:
  ///
  /// <ul>
  /// <li>
  /// Create a Jira task
  /// </li>
  /// <li>
  /// Create a chat assistant task to find the root cause of a specific incident
  /// </li>
  /// </ul>
  final String? instructionExample;

  ActionSummary({
    this.actionIdentifier,
    this.description,
    this.displayName,
    this.instructionExample,
  });

  factory ActionSummary.fromJson(Map<String, dynamic> json) {
    return ActionSummary(
      actionIdentifier: json['actionIdentifier'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      instructionExample: json['instructionExample'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionIdentifier = this.actionIdentifier;
    final description = this.description;
    final displayName = this.displayName;
    final instructionExample = this.instructionExample;
    return {
      if (actionIdentifier != null) 'actionIdentifier': actionIdentifier,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (instructionExample != null) 'instructionExample': instructionExample,
    };
  }
}

/// A message in an Amazon Q Business web experience.
class Message {
  final ActionExecution? actionExecution;
  final ActionReview? actionReview;

  /// A file directly uploaded into an Amazon Q Business web experience chat.
  final List<AttachmentOutput>? attachments;

  /// The content of the Amazon Q Business web experience message.
  final String? body;

  /// The identifier of the Amazon Q Business web experience message.
  final String? messageId;

  /// The source documents used to generate Amazon Q Business web experience
  /// message.
  final List<SourceAttribution>? sourceAttribution;

  /// The timestamp of the first Amazon Q Business web experience message.
  final DateTime? time;

  /// The type of Amazon Q Business message, whether <code>HUMAN</code> or
  /// <code>AI</code> generated.
  final MessageType? type;

  Message({
    this.actionExecution,
    this.actionReview,
    this.attachments,
    this.body,
    this.messageId,
    this.sourceAttribution,
    this.time,
    this.type,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      actionExecution: json['actionExecution'] != null
          ? ActionExecution.fromJson(
              json['actionExecution'] as Map<String, dynamic>)
          : null,
      actionReview: json['actionReview'] != null
          ? ActionReview.fromJson(json['actionReview'] as Map<String, dynamic>)
          : null,
      attachments: (json['attachments'] as List?)
          ?.nonNulls
          .map((e) => AttachmentOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      body: json['body'] as String?,
      messageId: json['messageId'] as String?,
      sourceAttribution: (json['sourceAttribution'] as List?)
          ?.nonNulls
          .map((e) => SourceAttribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: timeStampFromJson(json['time']),
      type: (json['type'] as String?)?.let(MessageType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final actionExecution = this.actionExecution;
    final actionReview = this.actionReview;
    final attachments = this.attachments;
    final body = this.body;
    final messageId = this.messageId;
    final sourceAttribution = this.sourceAttribution;
    final time = this.time;
    final type = this.type;
    return {
      if (actionExecution != null) 'actionExecution': actionExecution,
      if (actionReview != null) 'actionReview': actionReview,
      if (attachments != null) 'attachments': attachments,
      if (body != null) 'body': body,
      if (messageId != null) 'messageId': messageId,
      if (sourceAttribution != null) 'sourceAttribution': sourceAttribution,
      if (time != null) 'time': unixTimestampToJson(time),
      if (type != null) 'type': type.value,
    };
  }
}

class MessageType {
  static const user = MessageType._('USER');
  static const system = MessageType._('SYSTEM');

  final String value;

  const MessageType._(this.value);

  static const values = [user, system];

  static MessageType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MessageType._(value));

  @override
  bool operator ==(other) => other is MessageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An output event that Amazon Q Business returns to an user who wants to
/// perform a plugin action during a non-streaming chat conversation. It
/// contains information about the selected action with a list of possible user
/// input fields, some pre-populated by Amazon Q Business.
class ActionReview {
  /// Field values that an end user needs to provide to Amazon Q Business for
  /// Amazon Q Business to perform the requested plugin action.
  final Map<String, ActionReviewPayloadField>? payload;

  /// A string used to retain information about the hierarchical contexts within
  /// an action review payload.
  final String? payloadFieldNameSeparator;

  /// The identifier of the plugin associated with the action review.
  final String? pluginId;

  /// The type of plugin.
  final PluginType? pluginType;

  ActionReview({
    this.payload,
    this.payloadFieldNameSeparator,
    this.pluginId,
    this.pluginType,
  });

  factory ActionReview.fromJson(Map<String, dynamic> json) {
    return ActionReview(
      payload: (json['payload'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, ActionReviewPayloadField.fromJson(e as Map<String, dynamic>))),
      payloadFieldNameSeparator: json['payloadFieldNameSeparator'] as String?,
      pluginId: json['pluginId'] as String?,
      pluginType: (json['pluginType'] as String?)?.let(PluginType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final payloadFieldNameSeparator = this.payloadFieldNameSeparator;
    final pluginId = this.pluginId;
    final pluginType = this.pluginType;
    return {
      if (payload != null) 'payload': payload,
      if (payloadFieldNameSeparator != null)
        'payloadFieldNameSeparator': payloadFieldNameSeparator,
      if (pluginId != null) 'pluginId': pluginId,
      if (pluginType != null) 'pluginType': pluginType.value,
    };
  }
}

/// Performs an Amazon Q Business plugin action during a non-streaming chat
/// conversation.
class ActionExecution {
  /// A mapping of field names to the field values in input that an end user
  /// provides to Amazon Q Business requests to perform their plugin action.
  final Map<String, ActionExecutionPayloadField> payload;

  /// A string used to retain information about the hierarchical contexts within
  /// an action execution event payload.
  final String payloadFieldNameSeparator;

  /// The identifier of the plugin the action is attached to.
  final String pluginId;

  ActionExecution({
    required this.payload,
    required this.payloadFieldNameSeparator,
    required this.pluginId,
  });

  factory ActionExecution.fromJson(Map<String, dynamic> json) {
    return ActionExecution(
      payload: ((json['payload'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k,
              ActionExecutionPayloadField.fromJson(e as Map<String, dynamic>))),
      payloadFieldNameSeparator:
          (json['payloadFieldNameSeparator'] as String?) ?? '',
      pluginId: (json['pluginId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final payloadFieldNameSeparator = this.payloadFieldNameSeparator;
    final pluginId = this.pluginId;
    return {
      'payload': payload,
      'payloadFieldNameSeparator': payloadFieldNameSeparator,
      'pluginId': pluginId,
    };
  }
}

/// A user input field in an plugin action execution payload.
class ActionExecutionPayloadField {
  /// The content of a user input field in an plugin action execution payload.
  final Object value;

  ActionExecutionPayloadField({
    required this.value,
  });

  factory ActionExecutionPayloadField.fromJson(Map<String, dynamic> json) {
    return ActionExecutionPayloadField(
      value: json['value'] as Object,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

/// A user input field in an plugin action review payload.
class ActionReviewPayloadField {
  /// The expected data format for the action review input field value. For
  /// example, in PTO request, <code>from</code> and <code>to</code> would be of
  /// <code>datetime</code> allowed format.
  final String? allowedFormat;

  /// Information about the field values that an end user can use to provide to
  /// Amazon Q Business for Amazon Q Business to perform the requested plugin
  /// action.
  final List<ActionReviewPayloadFieldAllowedValue>? allowedValues;

  /// Use to create a custom form with array fields (fields with nested objects
  /// inside an array).
  final Object? arrayItemJsonSchema;

  /// The field level description of each action review input field. This could be
  /// an explanation of the field. In the Amazon Q Business web experience, these
  /// descriptions could be used to display as tool tips to help users understand
  /// the field.
  final String? displayDescription;

  /// The name of the field.
  final String? displayName;

  /// The display order of fields in a payload.
  final int? displayOrder;

  /// Information about whether the field is required.
  final bool? required;

  /// The type of field.
  final ActionPayloadFieldType? type;

  /// The field value.
  final Object? value;

  ActionReviewPayloadField({
    this.allowedFormat,
    this.allowedValues,
    this.arrayItemJsonSchema,
    this.displayDescription,
    this.displayName,
    this.displayOrder,
    this.required,
    this.type,
    this.value,
  });

  factory ActionReviewPayloadField.fromJson(Map<String, dynamic> json) {
    return ActionReviewPayloadField(
      allowedFormat: json['allowedFormat'] as String?,
      allowedValues: (json['allowedValues'] as List?)
          ?.nonNulls
          .map((e) => ActionReviewPayloadFieldAllowedValue.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      arrayItemJsonSchema: json['arrayItemJsonSchema'],
      displayDescription: json['displayDescription'] as String?,
      displayName: json['displayName'] as String?,
      displayOrder: json['displayOrder'] as int?,
      required: json['required'] as bool?,
      type: (json['type'] as String?)?.let(ActionPayloadFieldType.fromString),
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final allowedFormat = this.allowedFormat;
    final allowedValues = this.allowedValues;
    final arrayItemJsonSchema = this.arrayItemJsonSchema;
    final displayDescription = this.displayDescription;
    final displayName = this.displayName;
    final displayOrder = this.displayOrder;
    final required = this.required;
    final type = this.type;
    final value = this.value;
    return {
      if (allowedFormat != null) 'allowedFormat': allowedFormat,
      if (allowedValues != null) 'allowedValues': allowedValues,
      if (arrayItemJsonSchema != null)
        'arrayItemJsonSchema': arrayItemJsonSchema,
      if (displayDescription != null) 'displayDescription': displayDescription,
      if (displayName != null) 'displayName': displayName,
      if (displayOrder != null) 'displayOrder': displayOrder,
      if (required != null) 'required': required,
      if (type != null) 'type': type.value,
      if (value != null) 'value': value,
    };
  }
}

class ActionPayloadFieldType {
  static const string = ActionPayloadFieldType._('STRING');
  static const number = ActionPayloadFieldType._('NUMBER');
  static const array = ActionPayloadFieldType._('ARRAY');
  static const boolean = ActionPayloadFieldType._('BOOLEAN');

  final String value;

  const ActionPayloadFieldType._(this.value);

  static const values = [string, number, array, boolean];

  static ActionPayloadFieldType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ActionPayloadFieldType._(value));

  @override
  bool operator ==(other) =>
      other is ActionPayloadFieldType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the field values that an end user can use to provide to
/// Amazon Q Business for Amazon Q Business to perform the requested plugin
/// action.
class ActionReviewPayloadFieldAllowedValue {
  /// The name of the field.
  final Object? displayValue;

  /// The field value.
  final Object? value;

  ActionReviewPayloadFieldAllowedValue({
    this.displayValue,
    this.value,
  });

  factory ActionReviewPayloadFieldAllowedValue.fromJson(
      Map<String, dynamic> json) {
    return ActionReviewPayloadFieldAllowedValue(
      displayValue: json['displayValue'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final displayValue = this.displayValue;
    final value = this.value;
    return {
      if (displayValue != null) 'displayValue': displayValue,
      if (value != null) 'value': value,
    };
  }
}

/// The documents used to generate an Amazon Q Business web experience response.
class SourceAttribution {
  /// The number attached to a citation in an Amazon Q Business generated
  /// response.
  final int? citationNumber;

  /// The identifier of the data source from which the document was ingested. This
  /// field is not present if the document is ingested by directly calling the
  /// BatchPutDocument API (similar to checkDocumentAccess). If the document is
  /// from a file-upload data source, the datasource will be
  /// "uploaded-docs-file-stat-datasourceid".
  final String? datasourceId;

  /// The unique identifier of the source document used in the citation, obtained
  /// from the Amazon Q Business index during chat response generation. This ID is
  /// used as input to the <code>GetDocumentContent</code> API to retrieve the
  /// actual document content for user verification.
  final String? documentId;

  /// The identifier of the index containing the source document's metadata and
  /// access control information. This links the citation back to the specific
  /// Amazon Q Business index where the document's searchable content and
  /// permissions are stored.
  final String? indexId;

  /// The content extract from the document on which the generated response is
  /// based.
  final String? snippet;

  /// A text extract from a source document that is used for source attribution.
  final List<TextSegment>? textMessageSegments;

  /// The title of the document which is the source for the Amazon Q Business
  /// generated response.
  final String? title;

  /// The Unix timestamp when the Amazon Q Business application was last updated.
  final DateTime? updatedAt;

  /// The URL of the document which is the source for the Amazon Q Business
  /// generated response.
  final String? url;

  SourceAttribution({
    this.citationNumber,
    this.datasourceId,
    this.documentId,
    this.indexId,
    this.snippet,
    this.textMessageSegments,
    this.title,
    this.updatedAt,
    this.url,
  });

  factory SourceAttribution.fromJson(Map<String, dynamic> json) {
    return SourceAttribution(
      citationNumber: json['citationNumber'] as int?,
      datasourceId: json['datasourceId'] as String?,
      documentId: json['documentId'] as String?,
      indexId: json['indexId'] as String?,
      snippet: json['snippet'] as String?,
      textMessageSegments: (json['textMessageSegments'] as List?)
          ?.nonNulls
          .map((e) => TextSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final citationNumber = this.citationNumber;
    final datasourceId = this.datasourceId;
    final documentId = this.documentId;
    final indexId = this.indexId;
    final snippet = this.snippet;
    final textMessageSegments = this.textMessageSegments;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final url = this.url;
    return {
      if (citationNumber != null) 'citationNumber': citationNumber,
      if (datasourceId != null) 'datasourceId': datasourceId,
      if (documentId != null) 'documentId': documentId,
      if (indexId != null) 'indexId': indexId,
      if (snippet != null) 'snippet': snippet,
      if (textMessageSegments != null)
        'textMessageSegments': textMessageSegments,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (url != null) 'url': url,
    };
  }
}

/// Provides information about a text extract in a chat response that can be
/// attributed to a source document.
class TextSegment {
  /// The zero-based location in the response string where the source attribution
  /// starts.
  final int? beginOffset;

  /// The zero-based location in the response string where the source attribution
  /// ends.
  final int? endOffset;

  /// The identifier of the media object associated with the text segment in the
  /// source attribution.
  final String? mediaId;

  /// The MIME type (image/png) of the media object associated with the text
  /// segment in the source attribution.
  final String? mediaMimeType;

  /// The relevant text excerpt from a source that was used to generate a citation
  /// text segment in an Amazon Q Business chat response.
  final SnippetExcerpt? snippetExcerpt;

  /// Source information for a segment of extracted text, including its media
  /// type.
  final SourceDetails? sourceDetails;

  TextSegment({
    this.beginOffset,
    this.endOffset,
    this.mediaId,
    this.mediaMimeType,
    this.snippetExcerpt,
    this.sourceDetails,
  });

  factory TextSegment.fromJson(Map<String, dynamic> json) {
    return TextSegment(
      beginOffset: json['beginOffset'] as int?,
      endOffset: json['endOffset'] as int?,
      mediaId: json['mediaId'] as String?,
      mediaMimeType: json['mediaMimeType'] as String?,
      snippetExcerpt: json['snippetExcerpt'] != null
          ? SnippetExcerpt.fromJson(
              json['snippetExcerpt'] as Map<String, dynamic>)
          : null,
      sourceDetails: json['sourceDetails'] != null
          ? SourceDetails.fromJson(
              json['sourceDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final endOffset = this.endOffset;
    final mediaId = this.mediaId;
    final mediaMimeType = this.mediaMimeType;
    final snippetExcerpt = this.snippetExcerpt;
    final sourceDetails = this.sourceDetails;
    return {
      if (beginOffset != null) 'beginOffset': beginOffset,
      if (endOffset != null) 'endOffset': endOffset,
      if (mediaId != null) 'mediaId': mediaId,
      if (mediaMimeType != null) 'mediaMimeType': mediaMimeType,
      if (snippetExcerpt != null) 'snippetExcerpt': snippetExcerpt,
      if (sourceDetails != null) 'sourceDetails': sourceDetails,
    };
  }
}

/// Contains the relevant text excerpt from a source that was used to generate a
/// citation text segment in an Amazon Q Business chat response.
class SnippetExcerpt {
  /// The relevant text excerpt from a source that was used to generate a citation
  /// text segment in an Amazon Q chat response.
  final String? text;

  SnippetExcerpt({
    this.text,
  });

  factory SnippetExcerpt.fromJson(Map<String, dynamic> json) {
    return SnippetExcerpt(
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

/// Container for details about different types of media sources (image, audio,
/// or video).
class SourceDetails {
  /// Details specific to audio content within the source.
  final AudioSourceDetails? audioSourceDetails;

  /// Details specific to image content within the source.
  final ImageSourceDetails? imageSourceDetails;

  /// Details specific to video content within the source.
  final VideoSourceDetails? videoSourceDetails;

  SourceDetails({
    this.audioSourceDetails,
    this.imageSourceDetails,
    this.videoSourceDetails,
  });

  factory SourceDetails.fromJson(Map<String, dynamic> json) {
    return SourceDetails(
      audioSourceDetails: json['audioSourceDetails'] != null
          ? AudioSourceDetails.fromJson(
              json['audioSourceDetails'] as Map<String, dynamic>)
          : null,
      imageSourceDetails: json['imageSourceDetails'] != null
          ? ImageSourceDetails.fromJson(
              json['imageSourceDetails'] as Map<String, dynamic>)
          : null,
      videoSourceDetails: json['videoSourceDetails'] != null
          ? VideoSourceDetails.fromJson(
              json['videoSourceDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioSourceDetails = this.audioSourceDetails;
    final imageSourceDetails = this.imageSourceDetails;
    final videoSourceDetails = this.videoSourceDetails;
    return {
      if (audioSourceDetails != null) 'audioSourceDetails': audioSourceDetails,
      if (imageSourceDetails != null) 'imageSourceDetails': imageSourceDetails,
      if (videoSourceDetails != null) 'videoSourceDetails': videoSourceDetails,
    };
  }
}

/// Details about an image source, including its identifier and format.
class ImageSourceDetails {
  /// Unique identifier for the image file.
  final String? mediaId;

  /// The MIME type of the image file.
  final String? mediaMimeType;

  ImageSourceDetails({
    this.mediaId,
    this.mediaMimeType,
  });

  factory ImageSourceDetails.fromJson(Map<String, dynamic> json) {
    return ImageSourceDetails(
      mediaId: json['mediaId'] as String?,
      mediaMimeType: json['mediaMimeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaId = this.mediaId;
    final mediaMimeType = this.mediaMimeType;
    return {
      if (mediaId != null) 'mediaId': mediaId,
      if (mediaMimeType != null) 'mediaMimeType': mediaMimeType,
    };
  }
}

/// Details about an audio source, including its identifier, format, and time
/// information.
class AudioSourceDetails {
  /// The type of audio extraction performed on the content.
  final AudioExtractionType? audioExtractionType;

  /// The ending timestamp in milliseconds for the relevant audio segment.
  final int? endTimeMilliseconds;

  /// Unique identifier for the audio media file.
  final String? mediaId;

  /// The MIME type of the audio file (e.g., audio/mp3, audio/wav).
  final String? mediaMimeType;

  /// The starting timestamp in milliseconds for the relevant audio segment.
  final int? startTimeMilliseconds;

  AudioSourceDetails({
    this.audioExtractionType,
    this.endTimeMilliseconds,
    this.mediaId,
    this.mediaMimeType,
    this.startTimeMilliseconds,
  });

  factory AudioSourceDetails.fromJson(Map<String, dynamic> json) {
    return AudioSourceDetails(
      audioExtractionType: (json['audioExtractionType'] as String?)
          ?.let(AudioExtractionType.fromString),
      endTimeMilliseconds: json['endTimeMilliseconds'] as int?,
      mediaId: json['mediaId'] as String?,
      mediaMimeType: json['mediaMimeType'] as String?,
      startTimeMilliseconds: json['startTimeMilliseconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioExtractionType = this.audioExtractionType;
    final endTimeMilliseconds = this.endTimeMilliseconds;
    final mediaId = this.mediaId;
    final mediaMimeType = this.mediaMimeType;
    final startTimeMilliseconds = this.startTimeMilliseconds;
    return {
      if (audioExtractionType != null)
        'audioExtractionType': audioExtractionType.value,
      if (endTimeMilliseconds != null)
        'endTimeMilliseconds': endTimeMilliseconds,
      if (mediaId != null) 'mediaId': mediaId,
      if (mediaMimeType != null) 'mediaMimeType': mediaMimeType,
      if (startTimeMilliseconds != null)
        'startTimeMilliseconds': startTimeMilliseconds,
    };
  }
}

/// Details about a video source, including its identifier, format, and time
/// information.
class VideoSourceDetails {
  /// The ending timestamp in milliseconds for the relevant video segment.
  final int? endTimeMilliseconds;

  /// Unique identifier for the video media file.
  final String? mediaId;

  /// The MIME type of the video file (e.g., video/mp4, video/avi).
  final String? mediaMimeType;

  /// The starting timestamp in milliseconds for the relevant video segment.
  final int? startTimeMilliseconds;

  /// The type of video extraction performed on the content.
  final VideoExtractionType? videoExtractionType;

  VideoSourceDetails({
    this.endTimeMilliseconds,
    this.mediaId,
    this.mediaMimeType,
    this.startTimeMilliseconds,
    this.videoExtractionType,
  });

  factory VideoSourceDetails.fromJson(Map<String, dynamic> json) {
    return VideoSourceDetails(
      endTimeMilliseconds: json['endTimeMilliseconds'] as int?,
      mediaId: json['mediaId'] as String?,
      mediaMimeType: json['mediaMimeType'] as String?,
      startTimeMilliseconds: json['startTimeMilliseconds'] as int?,
      videoExtractionType: (json['videoExtractionType'] as String?)
          ?.let(VideoExtractionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final endTimeMilliseconds = this.endTimeMilliseconds;
    final mediaId = this.mediaId;
    final mediaMimeType = this.mediaMimeType;
    final startTimeMilliseconds = this.startTimeMilliseconds;
    final videoExtractionType = this.videoExtractionType;
    return {
      if (endTimeMilliseconds != null)
        'endTimeMilliseconds': endTimeMilliseconds,
      if (mediaId != null) 'mediaId': mediaId,
      if (mediaMimeType != null) 'mediaMimeType': mediaMimeType,
      if (startTimeMilliseconds != null)
        'startTimeMilliseconds': startTimeMilliseconds,
      if (videoExtractionType != null)
        'videoExtractionType': videoExtractionType.value,
    };
  }
}

class VideoExtractionType {
  static const transcript = VideoExtractionType._('TRANSCRIPT');
  static const summary = VideoExtractionType._('SUMMARY');

  final String value;

  const VideoExtractionType._(this.value);

  static const values = [transcript, summary];

  static VideoExtractionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VideoExtractionType._(value));

  @override
  bool operator ==(other) =>
      other is VideoExtractionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AudioExtractionType {
  static const transcript = AudioExtractionType._('TRANSCRIPT');
  static const summary = AudioExtractionType._('SUMMARY');

  final String value;

  const AudioExtractionType._(this.value);

  static const values = [transcript, summary];

  static AudioExtractionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AudioExtractionType._(value));

  @override
  bool operator ==(other) =>
      other is AudioExtractionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a file uploaded during chat.
class AttachmentOutput {
  /// The unique identifier of the Amazon Q Business attachment.
  final String? attachmentId;

  /// The unique identifier of the Amazon Q Business conversation.
  final String? conversationId;

  /// An error associated with a file uploaded during chat.
  final ErrorDetail? error;

  /// The name of a file uploaded during chat.
  final String? name;

  /// The status of a file uploaded during chat.
  final AttachmentStatus? status;

  AttachmentOutput({
    this.attachmentId,
    this.conversationId,
    this.error,
    this.name,
    this.status,
  });

  factory AttachmentOutput.fromJson(Map<String, dynamic> json) {
    return AttachmentOutput(
      attachmentId: json['attachmentId'] as String?,
      conversationId: json['conversationId'] as String?,
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(AttachmentStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final conversationId = this.conversationId;
    final error = this.error;
    final name = this.name;
    final status = this.status;
    return {
      if (attachmentId != null) 'attachmentId': attachmentId,
      if (conversationId != null) 'conversationId': conversationId,
      if (error != null) 'error': error,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

class AttachmentStatus {
  static const failed = AttachmentStatus._('FAILED');
  static const success = AttachmentStatus._('SUCCESS');

  final String value;

  const AttachmentStatus._(this.value);

  static const values = [failed, success];

  static AttachmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttachmentStatus._(value));

  @override
  bool operator ==(other) => other is AttachmentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information for groups.
class GroupSummary {
  /// The name of the group the summary information is for.
  final String? groupName;

  GroupSummary({
    this.groupName,
  });

  factory GroupSummary.fromJson(Map<String, dynamic> json) {
    return GroupSummary(
      groupName: json['groupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupName = this.groupName;
    return {
      if (groupName != null) 'groupName': groupName,
    };
  }
}

/// The details of a document within an Amazon Q Business index.
class DocumentDetails {
  /// The timestamp for when the document was created.
  final DateTime? createdAt;

  /// The identifier of the document.
  final String? documentId;

  /// An error message associated with the document.
  final ErrorDetail? error;

  /// The current status of the document.
  final DocumentStatus? status;

  /// The timestamp for when the document was last updated.
  final DateTime? updatedAt;

  DocumentDetails({
    this.createdAt,
    this.documentId,
    this.error,
    this.status,
    this.updatedAt,
  });

  factory DocumentDetails.fromJson(Map<String, dynamic> json) {
    return DocumentDetails(
      createdAt: timeStampFromJson(json['createdAt']),
      documentId: json['documentId'] as String?,
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(DocumentStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final documentId = this.documentId;
    final error = this.error;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (documentId != null) 'documentId': documentId,
      if (error != null) 'error': error,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DocumentStatus {
  static const received = DocumentStatus._('RECEIVED');
  static const processing = DocumentStatus._('PROCESSING');
  static const indexed = DocumentStatus._('INDEXED');
  static const updated = DocumentStatus._('UPDATED');
  static const failed = DocumentStatus._('FAILED');
  static const deleting = DocumentStatus._('DELETING');
  static const deleted = DocumentStatus._('DELETED');
  static const documentFailedToIndex =
      DocumentStatus._('DOCUMENT_FAILED_TO_INDEX');

  final String value;

  const DocumentStatus._(this.value);

  static const values = [
    received,
    processing,
    indexed,
    updated,
    failed,
    deleting,
    deleted,
    documentFailedToIndex
  ];

  static DocumentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentStatus._(value));

  @override
  bool operator ==(other) => other is DocumentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information about an Amazon Q Business data source connector
/// synchronization job.
class DataSourceSyncJob {
  /// If the reason that the synchronization failed is due to an error with the
  /// underlying data source, this field contains a code that identifies the
  /// error.
  final String? dataSourceErrorCode;

  /// The Unix timestamp when the synchronization job completed.
  final DateTime? endTime;

  /// If the <code>Status</code> field is set to <code>FAILED</code>, the
  /// <code>ErrorCode</code> field indicates the reason the synchronization
  /// failed.
  final ErrorDetail? error;

  /// The identifier of a data source synchronization job.
  final String? executionId;

  /// Maps a batch delete document request to a specific data source sync job.
  /// This is optional and should only be supplied when documents are deleted by a
  /// data source connector.
  final DataSourceSyncJobMetrics? metrics;

  /// The Unix time stamp when the data source synchronization job started.
  final DateTime? startTime;

  /// The status of the synchronization job. When the <code>Status</code> field is
  /// set to <code>SUCCEEDED</code>, the synchronization job is done. If the
  /// status code is <code>FAILED</code>, the <code>ErrorCode</code> and
  /// <code>ErrorMessage</code> fields give you the reason for the failure.
  final DataSourceSyncJobStatus? status;

  DataSourceSyncJob({
    this.dataSourceErrorCode,
    this.endTime,
    this.error,
    this.executionId,
    this.metrics,
    this.startTime,
    this.status,
  });

  factory DataSourceSyncJob.fromJson(Map<String, dynamic> json) {
    return DataSourceSyncJob(
      dataSourceErrorCode: json['dataSourceErrorCode'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      executionId: json['executionId'] as String?,
      metrics: json['metrics'] != null
          ? DataSourceSyncJobMetrics.fromJson(
              json['metrics'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
      status:
          (json['status'] as String?)?.let(DataSourceSyncJobStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceErrorCode = this.dataSourceErrorCode;
    final endTime = this.endTime;
    final error = this.error;
    final executionId = this.executionId;
    final metrics = this.metrics;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (dataSourceErrorCode != null)
        'dataSourceErrorCode': dataSourceErrorCode,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (error != null) 'error': error,
      if (executionId != null) 'executionId': executionId,
      if (metrics != null) 'metrics': metrics,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
    };
  }
}

class DataSourceSyncJobStatus {
  static const failed = DataSourceSyncJobStatus._('FAILED');
  static const succeeded = DataSourceSyncJobStatus._('SUCCEEDED');
  static const syncing = DataSourceSyncJobStatus._('SYNCING');
  static const incomplete = DataSourceSyncJobStatus._('INCOMPLETE');
  static const stopping = DataSourceSyncJobStatus._('STOPPING');
  static const aborted = DataSourceSyncJobStatus._('ABORTED');
  static const syncingIndexing = DataSourceSyncJobStatus._('SYNCING_INDEXING');

  final String value;

  const DataSourceSyncJobStatus._(this.value);

  static const values = [
    failed,
    succeeded,
    syncing,
    incomplete,
    stopping,
    aborted,
    syncingIndexing
  ];

  static DataSourceSyncJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataSourceSyncJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is DataSourceSyncJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Maps a batch delete document request to a specific Amazon Q Business data
/// source connector sync job.
class DataSourceSyncJobMetrics {
  /// The current count of documents added from the data source during the data
  /// source sync.
  final String? documentsAdded;

  /// The current count of documents deleted from the data source during the data
  /// source sync.
  final String? documentsDeleted;

  /// The current count of documents that failed to sync from the data source
  /// during the data source sync.
  final String? documentsFailed;

  /// The current count of documents modified in the data source during the data
  /// source sync.
  final String? documentsModified;

  /// The current count of documents crawled by the ongoing sync job in the data
  /// source.
  final String? documentsScanned;

  DataSourceSyncJobMetrics({
    this.documentsAdded,
    this.documentsDeleted,
    this.documentsFailed,
    this.documentsModified,
    this.documentsScanned,
  });

  factory DataSourceSyncJobMetrics.fromJson(Map<String, dynamic> json) {
    return DataSourceSyncJobMetrics(
      documentsAdded: json['documentsAdded'] as String?,
      documentsDeleted: json['documentsDeleted'] as String?,
      documentsFailed: json['documentsFailed'] as String?,
      documentsModified: json['documentsModified'] as String?,
      documentsScanned: json['documentsScanned'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentsAdded = this.documentsAdded;
    final documentsDeleted = this.documentsDeleted;
    final documentsFailed = this.documentsFailed;
    final documentsModified = this.documentsModified;
    final documentsScanned = this.documentsScanned;
    return {
      if (documentsAdded != null) 'documentsAdded': documentsAdded,
      if (documentsDeleted != null) 'documentsDeleted': documentsDeleted,
      if (documentsFailed != null) 'documentsFailed': documentsFailed,
      if (documentsModified != null) 'documentsModified': documentsModified,
      if (documentsScanned != null) 'documentsScanned': documentsScanned,
    };
  }
}

/// A conversation in an Amazon Q Business application.
class Conversation {
  /// The identifier of the Amazon Q Business conversation.
  final String? conversationId;

  /// The start time of the conversation.
  final DateTime? startTime;

  /// The title of the conversation.
  final String? title;

  Conversation({
    this.conversationId,
    this.startTime,
    this.title,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      conversationId: json['conversationId'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conversationId = this.conversationId;
    final startTime = this.startTime;
    final title = this.title;
    return {
      if (conversationId != null) 'conversationId': conversationId,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (title != null) 'title': title,
    };
  }
}

/// Configuration details that define how Amazon Q Business generates and
/// formats responses to user queries in chat interactions. This configuration
/// allows administrators to customize response characteristics to meet specific
/// organizational needs and communication standards.
class ChatResponseConfiguration {
  /// The Amazon Resource Name (ARN) of the chat response configuration, which
  /// uniquely identifies the resource across all Amazon Web Services services and
  /// accounts.
  final String chatResponseConfigurationArn;

  /// A unique identifier for your chat response configuration settings, used to
  /// reference and manage the configuration within the Amazon Q Business service.
  final String chatResponseConfigurationId;

  /// A human-readable name for the chat response configuration, making it easier
  /// to identify and manage multiple configurations within an organization.
  final String displayName;

  /// The current status of the chat response configuration, indicating whether it
  /// is active, pending, or in another state that affects its availability for
  /// use in chat interactions.
  final ChatResponseConfigurationStatus status;

  /// The timestamp indicating when the chat response configuration was initially
  /// created, useful for tracking the lifecycle of configuration resources.
  final DateTime? createdAt;

  /// A summary of the response configuration settings, providing a concise
  /// overview of the key parameters that define how responses are generated and
  /// formatted.
  final String? responseConfigurationSummary;

  /// The timestamp indicating when the chat response configuration was last
  /// modified, helping administrators track changes and maintain version
  /// awareness.
  final DateTime? updatedAt;

  ChatResponseConfiguration({
    required this.chatResponseConfigurationArn,
    required this.chatResponseConfigurationId,
    required this.displayName,
    required this.status,
    this.createdAt,
    this.responseConfigurationSummary,
    this.updatedAt,
  });

  factory ChatResponseConfiguration.fromJson(Map<String, dynamic> json) {
    return ChatResponseConfiguration(
      chatResponseConfigurationArn:
          (json['chatResponseConfigurationArn'] as String?) ?? '',
      chatResponseConfigurationId:
          (json['chatResponseConfigurationId'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      status: ChatResponseConfigurationStatus.fromString(
          (json['status'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['createdAt']),
      responseConfigurationSummary:
          json['responseConfigurationSummary'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final chatResponseConfigurationArn = this.chatResponseConfigurationArn;
    final chatResponseConfigurationId = this.chatResponseConfigurationId;
    final displayName = this.displayName;
    final status = this.status;
    final createdAt = this.createdAt;
    final responseConfigurationSummary = this.responseConfigurationSummary;
    final updatedAt = this.updatedAt;
    return {
      'chatResponseConfigurationArn': chatResponseConfigurationArn,
      'chatResponseConfigurationId': chatResponseConfigurationId,
      'displayName': displayName,
      'status': status.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (responseConfigurationSummary != null)
        'responseConfigurationSummary': responseConfigurationSummary,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class ChatResponseConfigurationStatus {
  static const creating = ChatResponseConfigurationStatus._('CREATING');
  static const updating = ChatResponseConfigurationStatus._('UPDATING');
  static const failed = ChatResponseConfigurationStatus._('FAILED');
  static const active = ChatResponseConfigurationStatus._('ACTIVE');

  final String value;

  const ChatResponseConfigurationStatus._(this.value);

  static const values = [creating, updating, failed, active];

  static ChatResponseConfigurationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChatResponseConfigurationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ChatResponseConfigurationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An attachment in an Amazon Q Business conversation.
class Attachment {
  /// The identifier of the Amazon Q Business attachment.
  final String? attachmentId;

  /// The identifier of the Amazon Q Business conversation the attachment is
  /// associated with.
  final String? conversationId;

  /// A CopyFromSource containing a reference to the original source of the Amazon
  /// Q Business attachment.
  final CopyFromSource? copyFrom;

  /// The Unix timestamp when the Amazon Q Business attachment was created.
  final DateTime? createdAt;

  /// ErrorDetail providing information about a Amazon Q Business attachment
  /// error.
  final ErrorDetail? error;

  /// Size in bytes of the Amazon Q Business attachment.
  final int? fileSize;

  /// Filetype of the Amazon Q Business attachment.
  final String? fileType;

  /// MD5 checksum of the Amazon Q Business attachment contents.
  final String? md5chksum;

  /// Filename of the Amazon Q Business attachment.
  final String? name;

  /// AttachmentStatus of the Amazon Q Business attachment.
  final AttachmentStatus? status;

  Attachment({
    this.attachmentId,
    this.conversationId,
    this.copyFrom,
    this.createdAt,
    this.error,
    this.fileSize,
    this.fileType,
    this.md5chksum,
    this.name,
    this.status,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      attachmentId: json['attachmentId'] as String?,
      conversationId: json['conversationId'] as String?,
      copyFrom: json['copyFrom'] != null
          ? CopyFromSource.fromJson(json['copyFrom'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      fileSize: json['fileSize'] as int?,
      fileType: json['fileType'] as String?,
      md5chksum: json['md5chksum'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(AttachmentStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final conversationId = this.conversationId;
    final copyFrom = this.copyFrom;
    final createdAt = this.createdAt;
    final error = this.error;
    final fileSize = this.fileSize;
    final fileType = this.fileType;
    final md5chksum = this.md5chksum;
    final name = this.name;
    final status = this.status;
    return {
      if (attachmentId != null) 'attachmentId': attachmentId,
      if (conversationId != null) 'conversationId': conversationId,
      if (copyFrom != null) 'copyFrom': copyFrom,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (error != null) 'error': error,
      if (fileSize != null) 'fileSize': fileSize,
      if (fileType != null) 'fileType': fileType,
      if (md5chksum != null) 'md5chksum': md5chksum,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// The source reference for an existing attachment.
class CopyFromSource {
  /// A reference to an attachment in an existing conversation.
  final ConversationSource? conversation;

  CopyFromSource({
    this.conversation,
  });

  factory CopyFromSource.fromJson(Map<String, dynamic> json) {
    return CopyFromSource(
      conversation: json['conversation'] != null
          ? ConversationSource.fromJson(
              json['conversation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final conversation = this.conversation;
    return {
      if (conversation != null) 'conversation': conversation,
    };
  }
}

/// The source reference for an existing attachment in an existing conversation.
class ConversationSource {
  /// The unique identifier of the Amazon Q Business attachment.
  final String attachmentId;

  /// The unique identifier of the Amazon Q Business conversation.
  final String conversationId;

  ConversationSource({
    required this.attachmentId,
    required this.conversationId,
  });

  factory ConversationSource.fromJson(Map<String, dynamic> json) {
    return ConversationSource(
      attachmentId: (json['attachmentId'] as String?) ?? '',
      conversationId: (json['conversationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final conversationId = this.conversationId;
    return {
      'attachmentId': attachmentId,
      'conversationId': conversationId,
    };
  }
}

/// Provides the details of a group's status.
class GroupStatusDetail {
  /// The details of an error associated a group status.
  final ErrorDetail? errorDetail;

  /// The Unix timestamp when the Amazon Q Business application was last updated.
  final DateTime? lastUpdatedAt;

  /// The status of a group.
  final GroupStatus? status;

  GroupStatusDetail({
    this.errorDetail,
    this.lastUpdatedAt,
    this.status,
  });

  factory GroupStatusDetail.fromJson(Map<String, dynamic> json) {
    return GroupStatusDetail(
      errorDetail: json['errorDetail'] != null
          ? ErrorDetail.fromJson(json['errorDetail'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      status: (json['status'] as String?)?.let(GroupStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorDetail = this.errorDetail;
    final lastUpdatedAt = this.lastUpdatedAt;
    final status = this.status;
    return {
      if (errorDetail != null) 'errorDetail': errorDetail,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (status != null) 'status': status.value,
    };
  }
}

class GroupStatus {
  static const failed = GroupStatus._('FAILED');
  static const succeeded = GroupStatus._('SUCCEEDED');
  static const processing = GroupStatus._('PROCESSING');
  static const deleting = GroupStatus._('DELETING');
  static const deleted = GroupStatus._('DELETED');

  final String value;

  const GroupStatus._(this.value);

  static const values = [failed, succeeded, processing, deleting, deleted];

  static GroupStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => GroupStatus._(value));

  @override
  bool operator ==(other) => other is GroupStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class OutputFormat {
  static const raw = OutputFormat._('RAW');
  static const extracted = OutputFormat._('EXTRACTED');

  final String value;

  const OutputFormat._(this.value);

  static const values = [raw, extracted];

  static OutputFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OutputFormat._(value));

  @override
  bool operator ==(other) => other is OutputFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Detailed information about a chat response configuration, including
/// comprehensive settings and parameters that define how Amazon Q Business
/// generates and formats responses.
class ChatResponseConfigurationDetail {
  final ErrorDetail? error;

  /// A summary of the response configuration details, providing a concise
  /// overview of the key parameters and settings that define the response
  /// generation behavior.
  final String? responseConfigurationSummary;

  /// A collection of specific response configuration settings that collectively
  /// define how responses are generated, formatted, and presented to users in
  /// chat interactions.
  final Map<ResponseConfigurationType, ResponseConfiguration>?
      responseConfigurations;

  /// The current status of the chat response configuration, indicating whether it
  /// is active, pending, or in another state that affects its availability for
  /// use.
  final ChatResponseConfigurationStatus? status;

  /// The timestamp indicating when the detailed chat response configuration was
  /// last modified, helping administrators track changes and maintain version
  /// awareness.
  final DateTime? updatedAt;

  ChatResponseConfigurationDetail({
    this.error,
    this.responseConfigurationSummary,
    this.responseConfigurations,
    this.status,
    this.updatedAt,
  });

  factory ChatResponseConfigurationDetail.fromJson(Map<String, dynamic> json) {
    return ChatResponseConfigurationDetail(
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      responseConfigurationSummary:
          json['responseConfigurationSummary'] as String?,
      responseConfigurations:
          (json['responseConfigurations'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(ResponseConfigurationType.fromString(k),
                  ResponseConfiguration.fromJson(e as Map<String, dynamic>))),
      status: (json['status'] as String?)
          ?.let(ChatResponseConfigurationStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final responseConfigurationSummary = this.responseConfigurationSummary;
    final responseConfigurations = this.responseConfigurations;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (error != null) 'error': error,
      if (responseConfigurationSummary != null)
        'responseConfigurationSummary': responseConfigurationSummary,
      if (responseConfigurations != null)
        'responseConfigurations':
            responseConfigurations.map((k, e) => MapEntry(k.value, e)),
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// The chat orchestration specific admin controls configured for an Amazon Q
/// Business application. Determines whether Amazon Q Business automatically
/// routes chat requests across configured plugins and data sources in your
/// Amazon Q Business application.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/guardrails-global-controls.html#guardrails-global-orchestration">Chat
/// orchestration settings</a>.
class AppliedOrchestrationConfiguration {
  /// Information about whether chat orchestration is enabled or disabled for an
  /// Amazon Q Business application.
  final OrchestrationControl control;

  AppliedOrchestrationConfiguration({
    required this.control,
  });

  factory AppliedOrchestrationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AppliedOrchestrationConfiguration(
      control:
          OrchestrationControl.fromString((json['control'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final control = this.control;
    return {
      'control': control.value,
    };
  }
}

/// Provides information about the phrases blocked from chat by your chat
/// control configuration.
class BlockedPhrasesConfiguration {
  /// A list of phrases blocked from a Amazon Q Business web experience chat.
  /// <note>
  /// Each phrase can contain a maximum of 36 characters. The list can contain a
  /// maximum of 20 phrases.
  /// </note>
  final List<String>? blockedPhrases;

  /// The configured custom message displayed to an end user informing them that
  /// they've used a blocked phrase during chat.
  final String? systemMessageOverride;

  BlockedPhrasesConfiguration({
    this.blockedPhrases,
    this.systemMessageOverride,
  });

  factory BlockedPhrasesConfiguration.fromJson(Map<String, dynamic> json) {
    return BlockedPhrasesConfiguration(
      blockedPhrases: (json['blockedPhrases'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      systemMessageOverride: json['systemMessageOverride'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockedPhrases = this.blockedPhrases;
    final systemMessageOverride = this.systemMessageOverride;
    return {
      if (blockedPhrases != null) 'blockedPhrases': blockedPhrases,
      if (systemMessageOverride != null)
        'systemMessageOverride': systemMessageOverride,
    };
  }
}

/// The creator mode specific admin controls configured for an Amazon Q Business
/// application. Determines whether an end user can generate LLM-only responses
/// when they use the web experience.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/guardrails.html">Admin
/// controls and guardrails</a> and <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/using-web-experience.html#chat-source-scope">Conversation
/// settings</a>.
class AppliedCreatorModeConfiguration {
  /// Information about whether creator mode is enabled or disabled for an Amazon
  /// Q Business application.
  final CreatorModeControl creatorModeControl;

  AppliedCreatorModeConfiguration({
    required this.creatorModeControl,
  });

  factory AppliedCreatorModeConfiguration.fromJson(Map<String, dynamic> json) {
    return AppliedCreatorModeConfiguration(
      creatorModeControl: CreatorModeControl.fromString(
          (json['creatorModeControl'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final creatorModeControl = this.creatorModeControl;
    return {
      'creatorModeControl': creatorModeControl.value,
    };
  }
}

/// Represents the Access Control List (ACL) for a document, containing both
/// allowlist and denylist conditions.
class DocumentAcl {
  /// The allowlist conditions for the document. Users or groups matching these
  /// conditions are granted access to the document.
  final DocumentAclMembership? allowlist;

  /// The denylist conditions for the document. Users or groups matching these
  /// conditions are denied access to the document, overriding allowlist
  /// permissions.
  final DocumentAclMembership? denyList;

  DocumentAcl({
    this.allowlist,
    this.denyList,
  });

  factory DocumentAcl.fromJson(Map<String, dynamic> json) {
    return DocumentAcl(
      allowlist: json['allowlist'] != null
          ? DocumentAclMembership.fromJson(
              json['allowlist'] as Map<String, dynamic>)
          : null,
      denyList: json['denyList'] != null
          ? DocumentAclMembership.fromJson(
              json['denyList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allowlist = this.allowlist;
    final denyList = this.denyList;
    return {
      if (allowlist != null) 'allowlist': allowlist,
      if (denyList != null) 'denyList': denyList,
    };
  }
}

/// Represents membership rules in the document's ACL, defining how users or
/// groups are associated with access permissions.
class DocumentAclMembership {
  /// An array of conditions that define the membership rules. Each condition
  /// specifies criteria for users or groups to be included in this membership.
  final List<DocumentAclCondition>? conditions;

  /// The logical relation between members in the membership rule, determining how
  /// multiple conditions are combined.
  final MemberRelation? memberRelation;

  DocumentAclMembership({
    this.conditions,
    this.memberRelation,
  });

  factory DocumentAclMembership.fromJson(Map<String, dynamic> json) {
    return DocumentAclMembership(
      conditions: (json['conditions'] as List?)
          ?.nonNulls
          .map((e) => DocumentAclCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      memberRelation:
          (json['memberRelation'] as String?)?.let(MemberRelation.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final conditions = this.conditions;
    final memberRelation = this.memberRelation;
    return {
      if (conditions != null) 'conditions': conditions,
      if (memberRelation != null) 'memberRelation': memberRelation.value,
    };
  }
}

class MemberRelation {
  static const and = MemberRelation._('AND');
  static const or = MemberRelation._('OR');

  final String value;

  const MemberRelation._(this.value);

  static const values = [and, or];

  static MemberRelation fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MemberRelation._(value));

  @override
  bool operator ==(other) => other is MemberRelation && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a condition in the document's ACL, specifying access rules for
/// users and groups.
class DocumentAclCondition {
  /// An array of group identifiers that this condition applies to. Groups listed
  /// here are subject to the access rule defined by this condition.
  final List<DocumentAclGroup>? groups;

  /// The logical relation between members in the condition, determining how
  /// multiple user or group conditions are combined.
  final MemberRelation? memberRelation;

  /// An array of user identifiers that this condition applies to. Users listed
  /// here are subject to the access rule defined by this condition.
  final List<DocumentAclUser>? users;

  DocumentAclCondition({
    this.groups,
    this.memberRelation,
    this.users,
  });

  factory DocumentAclCondition.fromJson(Map<String, dynamic> json) {
    return DocumentAclCondition(
      groups: (json['groups'] as List?)
          ?.nonNulls
          .map((e) => DocumentAclGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      memberRelation:
          (json['memberRelation'] as String?)?.let(MemberRelation.fromString),
      users: (json['users'] as List?)
          ?.nonNulls
          .map((e) => DocumentAclUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final memberRelation = this.memberRelation;
    final users = this.users;
    return {
      if (groups != null) 'groups': groups,
      if (memberRelation != null) 'memberRelation': memberRelation.value,
      if (users != null) 'users': users,
    };
  }
}

/// Represents a group in the document's ACL, used to define access permissions
/// for multiple users collectively.
class DocumentAclGroup {
  /// The name of the group in the document's ACL. This is used to identify the
  /// group when applying access rules.
  final String? name;

  /// The type of the group. This indicates the scope of the group's applicability
  /// in access control.
  final MembershipType? type;

  DocumentAclGroup({
    this.name,
    this.type,
  });

  factory DocumentAclGroup.fromJson(Map<String, dynamic> json) {
    return DocumentAclGroup(
      name: json['name'] as String?,
      type: (json['type'] as String?)?.let(MembershipType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      if (name != null) 'name': name,
      if (type != null) 'type': type.value,
    };
  }
}

/// Represents a user in the document's ACL, used to define access permissions
/// for individual users.
class DocumentAclUser {
  /// The unique identifier of the user in the document's ACL. This is used to
  /// identify the user when applying access rules.
  final String? id;

  /// The type of the user. This indicates the scope of the user's applicability
  /// in access control.
  final MembershipType? type;

  DocumentAclUser({
    this.id,
    this.type,
  });

  factory DocumentAclUser.fromJson(Map<String, dynamic> json) {
    return DocumentAclUser(
      id: json['id'] as String?,
      type: (json['type'] as String?)?.let(MembershipType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      if (id != null) 'id': id,
      if (type != null) 'type': type.value,
    };
  }
}

/// Represents an associated user in the access control system.
class AssociatedUser {
  /// The unique identifier of the associated user. This is used to identify the
  /// user in access control decisions.
  final String? id;

  /// The type of the associated user. This indicates the scope of the user's
  /// association.
  final MembershipType? type;

  AssociatedUser({
    this.id,
    this.type,
  });

  factory AssociatedUser.fromJson(Map<String, dynamic> json) {
    return AssociatedUser(
      id: json['id'] as String?,
      type: (json['type'] as String?)?.let(MembershipType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      if (id != null) 'id': id,
      if (type != null) 'type': type.value,
    };
  }
}

/// Represents a group associated with a given user in the access control
/// system.
class AssociatedGroup {
  /// The name of the group associated with the user. This is used to identify the
  /// group in access control decisions.
  final String? name;

  /// The type of the associated group. This indicates the scope of the group's
  /// applicability.
  final MembershipType? type;

  AssociatedGroup({
    this.name,
    this.type,
  });

  factory AssociatedGroup.fromJson(Map<String, dynamic> json) {
    return AssociatedGroup(
      name: json['name'] as String?,
      type: (json['type'] as String?)?.let(MembershipType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      if (name != null) 'name': name,
      if (type != null) 'type': type.value,
    };
  }
}

/// A request made by Amazon Q Business to a third paty authentication server to
/// authenticate a custom plugin user.
class AuthChallengeRequest {
  /// The URL sent by Amazon Q Business to the third party authentication server
  /// to authenticate a custom plugin user through an OAuth protocol.
  final String authorizationUrl;

  AuthChallengeRequest({
    required this.authorizationUrl,
  });

  factory AuthChallengeRequest.fromJson(Map<String, dynamic> json) {
    return AuthChallengeRequest(
      authorizationUrl: (json['authorizationUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationUrl = this.authorizationUrl;
    return {
      'authorizationUrl': authorizationUrl,
    };
  }
}

/// Contains details of the authentication information received from a third
/// party authentication server in response to an authentication challenge.
class AuthChallengeResponse {
  /// The mapping of key-value pairs in an authentication challenge response.
  final Map<String, String> responseMap;

  AuthChallengeResponse({
    required this.responseMap,
  });

  Map<String, dynamic> toJson() {
    final responseMap = this.responseMap;
    return {
      'responseMap': responseMap,
    };
  }
}

class ChatMode {
  static const retrievalMode = ChatMode._('RETRIEVAL_MODE');
  static const creatorMode = ChatMode._('CREATOR_MODE');
  static const pluginMode = ChatMode._('PLUGIN_MODE');

  final String value;

  const ChatMode._(this.value);

  static const values = [retrievalMode, creatorMode, pluginMode];

  static ChatMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ChatMode._(value));

  @override
  bool operator ==(other) => other is ChatMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration information for Amazon Q Business conversation modes.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/guardrails.html">Admin
/// controls and guardrails</a> and <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/using-web-experience.html#chat-source-scope">Conversation
/// settings</a>.
class ChatModeConfiguration {
  /// Configuration information required to invoke chat in
  /// <code>PLUGIN_MODE</code>.
  final PluginConfiguration? pluginConfiguration;

  ChatModeConfiguration({
    this.pluginConfiguration,
  });

  Map<String, dynamic> toJson() {
    final pluginConfiguration = this.pluginConfiguration;
    return {
      if (pluginConfiguration != null)
        'pluginConfiguration': pluginConfiguration,
    };
  }
}

/// Configuration information required to invoke chat in
/// <code>PLUGIN_MODE</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/guardrails.html">Admin
/// controls and guardrails</a>, <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/plugins.html">Plugins</a>,
/// and <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/using-web-experience.html#chat-source-scope">Conversation
/// settings</a>.
class PluginConfiguration {
  /// The identifier of the plugin you want to use.
  final String pluginId;

  PluginConfiguration({
    required this.pluginId,
  });

  Map<String, dynamic> toJson() {
    final pluginId = this.pluginId;
    return {
      'pluginId': pluginId,
    };
  }
}

/// This is either a file directly uploaded into a web experience chat or a
/// reference to an existing attachment that is part of a web experience chat.
class AttachmentInput {
  /// A reference to an existing attachment.
  final CopyFromSource? copyFrom;

  /// The contents of the attachment.
  final Uint8List? data;

  /// The filename of the attachment.
  final String? name;

  AttachmentInput({
    this.copyFrom,
    this.data,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final copyFrom = this.copyFrom;
    final data = this.data;
    final name = this.name;
    return {
      if (copyFrom != null) 'copyFrom': copyFrom,
      if (data != null) 'data': base64Encode(data),
      if (name != null) 'name': name,
    };
  }
}

/// The streaming output for the <code>Chat</code> API.
class ChatOutputStream {
  /// A request from Amazon Q Business to the end user for information Amazon Q
  /// Business needs to successfully complete a requested plugin action.
  final ActionReviewEvent? actionReviewEvent;

  /// An authentication verification event activated by an end user request to use
  /// a custom plugin.
  final AuthChallengeRequestEvent? authChallengeRequestEvent;

  /// A failed file upload event during a web experience chat.
  final FailedAttachmentEvent? failedAttachmentEvent;

  /// A metadata event for a AI-generated text output message in a Amazon Q
  /// Business conversation.
  final MetadataEvent? metadataEvent;

  /// Information about the payload of the <code>ChatOutputStream</code> event
  /// containing the AI-generated message output.
  final TextOutputEvent? textEvent;

  ChatOutputStream({
    this.actionReviewEvent,
    this.authChallengeRequestEvent,
    this.failedAttachmentEvent,
    this.metadataEvent,
    this.textEvent,
  });

  factory ChatOutputStream.fromJson(Map<String, dynamic> json) {
    return ChatOutputStream(
      actionReviewEvent: json['actionReviewEvent'] != null
          ? ActionReviewEvent.fromJson(
              json['actionReviewEvent'] as Map<String, dynamic>)
          : null,
      authChallengeRequestEvent: json['authChallengeRequestEvent'] != null
          ? AuthChallengeRequestEvent.fromJson(
              json['authChallengeRequestEvent'] as Map<String, dynamic>)
          : null,
      failedAttachmentEvent: json['failedAttachmentEvent'] != null
          ? FailedAttachmentEvent.fromJson(
              json['failedAttachmentEvent'] as Map<String, dynamic>)
          : null,
      metadataEvent: json['metadataEvent'] != null
          ? MetadataEvent.fromJson(
              json['metadataEvent'] as Map<String, dynamic>)
          : null,
      textEvent: json['textEvent'] != null
          ? TextOutputEvent.fromJson(json['textEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionReviewEvent = this.actionReviewEvent;
    final authChallengeRequestEvent = this.authChallengeRequestEvent;
    final failedAttachmentEvent = this.failedAttachmentEvent;
    final metadataEvent = this.metadataEvent;
    final textEvent = this.textEvent;
    return {
      if (actionReviewEvent != null) 'actionReviewEvent': actionReviewEvent,
      if (authChallengeRequestEvent != null)
        'authChallengeRequestEvent': authChallengeRequestEvent,
      if (failedAttachmentEvent != null)
        'failedAttachmentEvent': failedAttachmentEvent,
      if (metadataEvent != null) 'metadataEvent': metadataEvent,
      if (textEvent != null) 'textEvent': textEvent,
    };
  }
}

/// An output event for an AI-generated response in an Amazon Q Business web
/// experience.
class TextOutputEvent {
  /// The identifier of the conversation with which the text output event is
  /// associated.
  final String? conversationId;

  /// An AI-generated message in a <code>TextOutputEvent</code>.
  final String? systemMessage;

  /// The identifier of an AI-generated message in a <code>TextOutputEvent</code>.
  final String? systemMessageId;

  /// The type of AI-generated message in a <code>TextOutputEvent</code>. Amazon Q
  /// Business currently supports two types of messages:
  ///
  /// <ul>
  /// <li>
  /// <code>RESPONSE</code> - The Amazon Q Business system response.
  /// </li>
  /// <li>
  /// <code>GROUNDED_RESPONSE</code> - The corrected, hallucination-reduced,
  /// response returned by Amazon Q Business. Available only if hallucination
  /// reduction is supported and configured for the application and detected in
  /// the end user chat query by Amazon Q Business.
  /// </li>
  /// </ul>
  final SystemMessageType? systemMessageType;

  /// The identifier of an end user message in a <code>TextOutputEvent</code>.
  final String? userMessageId;

  TextOutputEvent({
    this.conversationId,
    this.systemMessage,
    this.systemMessageId,
    this.systemMessageType,
    this.userMessageId,
  });

  factory TextOutputEvent.fromJson(Map<String, dynamic> json) {
    return TextOutputEvent(
      conversationId: json['conversationId'] as String?,
      systemMessage: json['systemMessage'] as String?,
      systemMessageId: json['systemMessageId'] as String?,
      systemMessageType: (json['systemMessageType'] as String?)
          ?.let(SystemMessageType.fromString),
      userMessageId: json['userMessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conversationId = this.conversationId;
    final systemMessage = this.systemMessage;
    final systemMessageId = this.systemMessageId;
    final systemMessageType = this.systemMessageType;
    final userMessageId = this.userMessageId;
    return {
      if (conversationId != null) 'conversationId': conversationId,
      if (systemMessage != null) 'systemMessage': systemMessage,
      if (systemMessageId != null) 'systemMessageId': systemMessageId,
      if (systemMessageType != null)
        'systemMessageType': systemMessageType.value,
      if (userMessageId != null) 'userMessageId': userMessageId,
    };
  }
}

/// A metadata event for a AI-generated text output message in a Amazon Q
/// Business conversation, containing associated metadata generated.
class MetadataEvent {
  /// The identifier of the conversation with which the generated metadata is
  /// associated.
  final String? conversationId;

  /// The final text output message generated by the system.
  final String? finalTextMessage;

  /// The source documents used to generate the conversation response.
  final List<SourceAttribution>? sourceAttributions;

  /// The identifier of an Amazon Q Business AI generated message within the
  /// conversation.
  final String? systemMessageId;

  /// The identifier of an Amazon Q Business end user text input message within
  /// the conversation.
  final String? userMessageId;

  MetadataEvent({
    this.conversationId,
    this.finalTextMessage,
    this.sourceAttributions,
    this.systemMessageId,
    this.userMessageId,
  });

  factory MetadataEvent.fromJson(Map<String, dynamic> json) {
    return MetadataEvent(
      conversationId: json['conversationId'] as String?,
      finalTextMessage: json['finalTextMessage'] as String?,
      sourceAttributions: (json['sourceAttributions'] as List?)
          ?.nonNulls
          .map((e) => SourceAttribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      systemMessageId: json['systemMessageId'] as String?,
      userMessageId: json['userMessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conversationId = this.conversationId;
    final finalTextMessage = this.finalTextMessage;
    final sourceAttributions = this.sourceAttributions;
    final systemMessageId = this.systemMessageId;
    final userMessageId = this.userMessageId;
    return {
      if (conversationId != null) 'conversationId': conversationId,
      if (finalTextMessage != null) 'finalTextMessage': finalTextMessage,
      if (sourceAttributions != null) 'sourceAttributions': sourceAttributions,
      if (systemMessageId != null) 'systemMessageId': systemMessageId,
      if (userMessageId != null) 'userMessageId': userMessageId,
    };
  }
}

/// An output event that Amazon Q Business returns to an user who wants to
/// perform a plugin action during a streaming chat conversation. It contains
/// information about the selected action with a list of possible user input
/// fields, some pre-populated by Amazon Q Business.
class ActionReviewEvent {
  /// The identifier of the conversation with which the action review event is
  /// associated.
  final String? conversationId;

  /// Field values that an end user needs to provide to Amazon Q Business for
  /// Amazon Q Business to perform the requested plugin action.
  final Map<String, ActionReviewPayloadField>? payload;

  /// A string used to retain information about the hierarchical contexts within
  /// an action review event payload.
  final String? payloadFieldNameSeparator;

  /// The identifier of the plugin associated with the action review event.
  final String? pluginId;

  /// The type of plugin.
  final PluginType? pluginType;

  /// The identifier of an Amazon Q Business AI generated associated with the
  /// action review event.
  final String? systemMessageId;

  /// The identifier of the conversation with which the plugin action is
  /// associated.
  final String? userMessageId;

  ActionReviewEvent({
    this.conversationId,
    this.payload,
    this.payloadFieldNameSeparator,
    this.pluginId,
    this.pluginType,
    this.systemMessageId,
    this.userMessageId,
  });

  factory ActionReviewEvent.fromJson(Map<String, dynamic> json) {
    return ActionReviewEvent(
      conversationId: json['conversationId'] as String?,
      payload: (json['payload'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, ActionReviewPayloadField.fromJson(e as Map<String, dynamic>))),
      payloadFieldNameSeparator: json['payloadFieldNameSeparator'] as String?,
      pluginId: json['pluginId'] as String?,
      pluginType: (json['pluginType'] as String?)?.let(PluginType.fromString),
      systemMessageId: json['systemMessageId'] as String?,
      userMessageId: json['userMessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conversationId = this.conversationId;
    final payload = this.payload;
    final payloadFieldNameSeparator = this.payloadFieldNameSeparator;
    final pluginId = this.pluginId;
    final pluginType = this.pluginType;
    final systemMessageId = this.systemMessageId;
    final userMessageId = this.userMessageId;
    return {
      if (conversationId != null) 'conversationId': conversationId,
      if (payload != null) 'payload': payload,
      if (payloadFieldNameSeparator != null)
        'payloadFieldNameSeparator': payloadFieldNameSeparator,
      if (pluginId != null) 'pluginId': pluginId,
      if (pluginType != null) 'pluginType': pluginType.value,
      if (systemMessageId != null) 'systemMessageId': systemMessageId,
      if (userMessageId != null) 'userMessageId': userMessageId,
    };
  }
}

/// A failed file upload during web experience chat.
class FailedAttachmentEvent {
  final AttachmentOutput? attachment;

  /// The identifier of the conversation associated with the failed file upload.
  final String? conversationId;

  /// The identifier of the AI-generated message associated with the file upload.
  final String? systemMessageId;

  /// The identifier of the end user chat message associated with the file upload.
  final String? userMessageId;

  FailedAttachmentEvent({
    this.attachment,
    this.conversationId,
    this.systemMessageId,
    this.userMessageId,
  });

  factory FailedAttachmentEvent.fromJson(Map<String, dynamic> json) {
    return FailedAttachmentEvent(
      attachment: json['attachment'] != null
          ? AttachmentOutput.fromJson(
              json['attachment'] as Map<String, dynamic>)
          : null,
      conversationId: json['conversationId'] as String?,
      systemMessageId: json['systemMessageId'] as String?,
      userMessageId: json['userMessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    final conversationId = this.conversationId;
    final systemMessageId = this.systemMessageId;
    final userMessageId = this.userMessageId;
    return {
      if (attachment != null) 'attachment': attachment,
      if (conversationId != null) 'conversationId': conversationId,
      if (systemMessageId != null) 'systemMessageId': systemMessageId,
      if (userMessageId != null) 'userMessageId': userMessageId,
    };
  }
}

/// An authentication verification event activated by an end user request to use
/// a custom plugin.
class AuthChallengeRequestEvent {
  /// The URL sent by Amazon Q Business to a third party authentication server in
  /// response to an authentication verification event activated by an end user
  /// request to use a custom plugin.
  final String authorizationUrl;

  AuthChallengeRequestEvent({
    required this.authorizationUrl,
  });

  factory AuthChallengeRequestEvent.fromJson(Map<String, dynamic> json) {
    return AuthChallengeRequestEvent(
      authorizationUrl: (json['authorizationUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationUrl = this.authorizationUrl;
    return {
      'authorizationUrl': authorizationUrl,
    };
  }
}

class SystemMessageType {
  static const response = SystemMessageType._('RESPONSE');
  static const groundedResponse = SystemMessageType._('GROUNDED_RESPONSE');

  final String value;

  const SystemMessageType._(this.value);

  static const values = [response, groundedResponse];

  static SystemMessageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SystemMessageType._(value));

  @override
  bool operator ==(other) => other is SystemMessageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The streaming input for the <code>Chat</code> API.
class ChatInputStream {
  /// A request from an end user to perform an Amazon Q Business plugin action.
  final ActionExecutionEvent? actionExecutionEvent;

  /// A request by an end user to upload a file during chat.
  final AttachmentInputEvent? attachmentEvent;

  /// An authentication verification event response by a third party
  /// authentication server to Amazon Q Business.
  final AuthChallengeResponseEvent? authChallengeResponseEvent;

  /// A configuration event activated by an end user request to select a specific
  /// chat mode.
  final ConfigurationEvent? configurationEvent;

  /// The end of the streaming input for the <code>Chat</code> API.
  final EndOfInputEvent? endOfInputEvent;

  /// Information about the payload of the <code>ChatInputStream</code> event
  /// containing the end user message input.
  final TextInputEvent? textEvent;

  ChatInputStream({
    this.actionExecutionEvent,
    this.attachmentEvent,
    this.authChallengeResponseEvent,
    this.configurationEvent,
    this.endOfInputEvent,
    this.textEvent,
  });

  Map<String, dynamic> toJson() {
    final actionExecutionEvent = this.actionExecutionEvent;
    final attachmentEvent = this.attachmentEvent;
    final authChallengeResponseEvent = this.authChallengeResponseEvent;
    final configurationEvent = this.configurationEvent;
    final endOfInputEvent = this.endOfInputEvent;
    final textEvent = this.textEvent;
    return {
      if (actionExecutionEvent != null)
        'actionExecutionEvent': actionExecutionEvent,
      if (attachmentEvent != null) 'attachmentEvent': attachmentEvent,
      if (authChallengeResponseEvent != null)
        'authChallengeResponseEvent': authChallengeResponseEvent,
      if (configurationEvent != null) 'configurationEvent': configurationEvent,
      if (endOfInputEvent != null) 'endOfInputEvent': endOfInputEvent,
      if (textEvent != null) 'textEvent': textEvent,
    };
  }
}

/// A configuration event activated by an end user request to select a specific
/// chat mode.
class ConfigurationEvent {
  final AttributeFilter? attributeFilter;

  /// The chat modes available to an Amazon Q Business end user.
  ///
  /// <ul>
  /// <li>
  /// <code>RETRIEVAL_MODE</code> - The default chat mode for an Amazon Q Business
  /// application. When this mode is enabled, Amazon Q Business generates
  /// responses only from data sources connected to an Amazon Q Business
  /// application.
  /// </li>
  /// <li>
  /// <code>CREATOR_MODE</code> - By selecting this mode, users can choose to
  /// generate responses only from the LLM knowledge, without consulting connected
  /// data sources, for a chat request.
  /// </li>
  /// <li>
  /// <code>PLUGIN_MODE</code> - By selecting this mode, users can choose to use
  /// plugins in chat.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/guardrails.html">Admin
  /// controls and guardrails</a>, <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/plugins.html">Plugins</a>,
  /// and <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/using-web-experience.html#chat-source-scope">Conversation
  /// settings</a>.
  final ChatMode? chatMode;
  final ChatModeConfiguration? chatModeConfiguration;

  ConfigurationEvent({
    this.attributeFilter,
    this.chatMode,
    this.chatModeConfiguration,
  });

  Map<String, dynamic> toJson() {
    final attributeFilter = this.attributeFilter;
    final chatMode = this.chatMode;
    final chatModeConfiguration = this.chatModeConfiguration;
    return {
      if (attributeFilter != null) 'attributeFilter': attributeFilter,
      if (chatMode != null) 'chatMode': chatMode.value,
      if (chatModeConfiguration != null)
        'chatModeConfiguration': chatModeConfiguration,
    };
  }
}

/// An input event for a end user message in an Amazon Q Business web
/// experience.
class TextInputEvent {
  /// A user message in a text message input event.
  final String userMessage;

  TextInputEvent({
    required this.userMessage,
  });

  Map<String, dynamic> toJson() {
    final userMessage = this.userMessage;
    return {
      'userMessage': userMessage,
    };
  }
}

/// A file input event activated by a end user request to upload files into
/// their web experience chat.
class AttachmentInputEvent {
  final AttachmentInput? attachment;

  AttachmentInputEvent({
    this.attachment,
  });

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    return {
      if (attachment != null) 'attachment': attachment,
    };
  }
}

/// A request from an end user signalling an intent to perform an Amazon Q
/// Business plugin action during a streaming chat.
class ActionExecutionEvent {
  /// A mapping of field names to the field values in input that an end user
  /// provides to Amazon Q Business requests to perform their plugin action.
  final Map<String, ActionExecutionPayloadField> payload;

  /// A string used to retain information about the hierarchical contexts within a
  /// action execution event payload.
  final String payloadFieldNameSeparator;

  /// The identifier of the plugin for which the action is being requested.
  final String pluginId;

  ActionExecutionEvent({
    required this.payload,
    required this.payloadFieldNameSeparator,
    required this.pluginId,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final payloadFieldNameSeparator = this.payloadFieldNameSeparator;
    final pluginId = this.pluginId;
    return {
      'payload': payload,
      'payloadFieldNameSeparator': payloadFieldNameSeparator,
      'pluginId': pluginId,
    };
  }
}

/// The end of the streaming input for the <code>Chat</code> API.
class EndOfInputEvent {
  EndOfInputEvent();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An authentication verification event response by a third party
/// authentication server to Amazon Q Business.
class AuthChallengeResponseEvent {
  /// The mapping of key-value pairs in an authentication challenge response.
  final Map<String, String> responseMap;

  AuthChallengeResponseEvent({
    required this.responseMap,
  });

  Map<String, dynamic> toJson() {
    final responseMap = this.responseMap;
    return {
      'responseMap': responseMap,
    };
  }
}

/// A list of documents that could not be removed from an Amazon Q Business
/// index. Each entry contains an error message that indicates why the document
/// couldn't be removed from the index.
class FailedDocument {
  /// The identifier of the Amazon Q Business data source connector that contains
  /// the failed document.
  final String? dataSourceId;

  /// An explanation for why the document couldn't be removed from the index.
  final ErrorDetail? error;

  /// The identifier of the document that couldn't be removed from the Amazon Q
  /// Business index.
  final String? id;

  FailedDocument({
    this.dataSourceId,
    this.error,
    this.id,
  });

  factory FailedDocument.fromJson(Map<String, dynamic> json) {
    return FailedDocument(
      dataSourceId: json['dataSourceId'] as String?,
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final error = this.error;
    final id = this.id;
    return {
      if (dataSourceId != null) 'dataSourceId': dataSourceId,
      if (error != null) 'error': error,
      if (id != null) 'id': id,
    };
  }
}

/// A document in an Amazon Q Business application.
class Document {
  /// The identifier of the document.
  final String id;

  /// Configuration information for access permission to a document.
  final AccessConfiguration? accessConfiguration;

  /// Custom attributes to apply to the document for refining Amazon Q Business
  /// web experience responses.
  final List<DocumentAttribute>? attributes;

  /// The contents of the document.
  final DocumentContent? content;

  /// The file type of the document in the Blob field.
  ///
  /// If you want to index snippets or subsets of HTML documents instead of the
  /// entirety of the HTML documents, you add the <code>HTML</code> start and
  /// closing tags (<code>&lt;HTML&gt;content&lt;/HTML&gt;</code>) around the
  /// content.
  final ContentType? contentType;

  /// The configuration information for altering document metadata and content
  /// during the document ingestion process.
  final DocumentEnrichmentConfiguration? documentEnrichmentConfiguration;

  /// The configuration for extracting information from media in the document.
  final MediaExtractionConfiguration? mediaExtractionConfiguration;

  /// The title of the document.
  final String? title;

  Document({
    required this.id,
    this.accessConfiguration,
    this.attributes,
    this.content,
    this.contentType,
    this.documentEnrichmentConfiguration,
    this.mediaExtractionConfiguration,
    this.title,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final accessConfiguration = this.accessConfiguration;
    final attributes = this.attributes;
    final content = this.content;
    final contentType = this.contentType;
    final documentEnrichmentConfiguration =
        this.documentEnrichmentConfiguration;
    final mediaExtractionConfiguration = this.mediaExtractionConfiguration;
    final title = this.title;
    return {
      'id': id,
      if (accessConfiguration != null)
        'accessConfiguration': accessConfiguration,
      if (attributes != null) 'attributes': attributes,
      if (content != null) 'content': content,
      if (contentType != null) 'contentType': contentType.value,
      if (documentEnrichmentConfiguration != null)
        'documentEnrichmentConfiguration': documentEnrichmentConfiguration,
      if (mediaExtractionConfiguration != null)
        'mediaExtractionConfiguration': mediaExtractionConfiguration,
      if (title != null) 'title': title,
    };
  }
}

/// The contents of a document.
/// <note>
/// Documents have size limitations. The maximum file size for a document is 50
/// MB. The maximum amount of text that can be extracted from a single document
/// is 5 MB. For more information, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/doc-types.html">Supported
/// document formats in Amazon Q Business</a>.
/// </note>
class DocumentContent {
  /// The contents of the document. Documents passed to the <code>blob</code>
  /// parameter must be base64 encoded. Your code might not need to encode the
  /// document file bytes if you're using an Amazon Web Services SDK to call
  /// Amazon Q Business APIs. If you are calling the Amazon Q Business endpoint
  /// directly using REST, you must base64 encode the contents before sending.
  final Uint8List? blob;

  /// The path to the document in an Amazon S3 bucket.
  final S3? s3;

  DocumentContent({
    this.blob,
    this.s3,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final s3 = this.s3;
    return {
      if (blob != null) 'blob': base64Encode(blob),
      if (s3 != null) 's3': s3,
    };
  }
}

class ContentType {
  static const pdf = ContentType._('PDF');
  static const html = ContentType._('HTML');
  static const msWord = ContentType._('MS_WORD');
  static const plainText = ContentType._('PLAIN_TEXT');
  static const ppt = ContentType._('PPT');
  static const rtf = ContentType._('RTF');
  static const xml = ContentType._('XML');
  static const xslt = ContentType._('XSLT');
  static const msExcel = ContentType._('MS_EXCEL');
  static const csv = ContentType._('CSV');
  static const json = ContentType._('JSON');
  static const md = ContentType._('MD');

  final String value;

  const ContentType._(this.value);

  static const values = [
    pdf,
    html,
    msWord,
    plainText,
    ppt,
    rtf,
    xml,
    xslt,
    msExcel,
    csv,
    json,
    md
  ];

  static ContentType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ContentType._(value));

  @override
  bool operator ==(other) => other is ContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Used to configure access permissions for a document.
class AccessConfiguration {
  /// A list of <code>AccessControlList</code> objects.
  final List<AccessControl> accessControls;

  /// Describes the member relation within the <code>AccessControlList</code>
  /// object.
  final MemberRelation? memberRelation;

  AccessConfiguration({
    required this.accessControls,
    this.memberRelation,
  });

  Map<String, dynamic> toJson() {
    final accessControls = this.accessControls;
    final memberRelation = this.memberRelation;
    return {
      'accessControls': accessControls,
      if (memberRelation != null) 'memberRelation': memberRelation.value,
    };
  }
}

/// A list of principals. Each principal can be either a <code>USER</code> or a
/// <code>GROUP</code> and can be designated document access permissions of
/// either <code>ALLOW</code> or <code>DENY</code>.
class AccessControl {
  /// Contains a list of principals, where a principal can be either a
  /// <code>USER</code> or a <code>GROUP</code>. Each principal can be have the
  /// following type of document access: <code>ALLOW</code> or <code>DENY</code>.
  final List<Principal> principals;

  /// Describes the member relation within a principal list.
  final MemberRelation? memberRelation;

  AccessControl({
    required this.principals,
    this.memberRelation,
  });

  Map<String, dynamic> toJson() {
    final principals = this.principals;
    final memberRelation = this.memberRelation;
    return {
      'principals': principals,
      if (memberRelation != null) 'memberRelation': memberRelation.value,
    };
  }
}

/// Provides user and group information used for filtering documents to use for
/// generating Amazon Q Business conversation responses.
class Principal {
  /// The group associated with the principal.
  final PrincipalGroup? group;

  /// The user associated with the principal.
  final PrincipalUser? user;

  Principal({
    this.group,
    this.user,
  });

  Map<String, dynamic> toJson() {
    final group = this.group;
    final user = this.user;
    return {
      if (group != null) 'group': group,
      if (user != null) 'user': user,
    };
  }
}

/// Provides information about a user associated with a principal.
class PrincipalUser {
  /// Provides information about whether to allow or deny access to the principal.
  final ReadAccessType access;

  /// The identifier of the user.
  final String? id;

  /// The type of group.
  final MembershipType? membershipType;

  PrincipalUser({
    required this.access,
    this.id,
    this.membershipType,
  });

  Map<String, dynamic> toJson() {
    final access = this.access;
    final id = this.id;
    final membershipType = this.membershipType;
    return {
      'access': access.value,
      if (id != null) 'id': id,
      if (membershipType != null) 'membershipType': membershipType.value,
    };
  }
}

/// Provides information about a group associated with the principal.
class PrincipalGroup {
  /// Provides information about whether to allow or deny access to the principal.
  final ReadAccessType access;

  /// The type of group.
  final MembershipType? membershipType;

  /// The name of the group.
  final String? name;

  PrincipalGroup({
    required this.access,
    this.membershipType,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final access = this.access;
    final membershipType = this.membershipType;
    final name = this.name;
    return {
      'access': access.value,
      if (membershipType != null) 'membershipType': membershipType.value,
      if (name != null) 'name': name,
    };
  }
}

class ReadAccessType {
  static const allow = ReadAccessType._('ALLOW');
  static const deny = ReadAccessType._('DENY');

  final String value;

  const ReadAccessType._(this.value);

  static const values = [allow, deny];

  static ReadAccessType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReadAccessType._(value));

  @override
  bool operator ==(other) => other is ReadAccessType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A document deleted from an Amazon Q Business data source connector.
class DeleteDocument {
  /// The identifier of the deleted document.
  final String documentId;

  DeleteDocument({
    required this.documentId,
  });

  Map<String, dynamic> toJson() {
    final documentId = this.documentId;
    return {
      'documentId': documentId,
    };
  }
}

/// Defines a condition that restricts when a permission is effective.
/// Conditions allow you to control access based on specific attributes of the
/// request.
class PermissionCondition {
  /// The key for the condition. This identifies the attribute that the condition
  /// applies to.
  final String conditionKey;

  /// The operator to use for the condition evaluation. This determines how the
  /// condition values are compared.
  final PermissionConditionOperator conditionOperator;

  /// The values to compare against using the specified condition operator.
  final List<String> conditionValues;

  PermissionCondition({
    required this.conditionKey,
    required this.conditionOperator,
    required this.conditionValues,
  });

  Map<String, dynamic> toJson() {
    final conditionKey = this.conditionKey;
    final conditionOperator = this.conditionOperator;
    final conditionValues = this.conditionValues;
    return {
      'conditionKey': conditionKey,
      'conditionOperator': conditionOperator.value,
      'conditionValues': conditionValues,
    };
  }
}

class PermissionConditionOperator {
  static const stringEquals = PermissionConditionOperator._('StringEquals');

  final String value;

  const PermissionConditionOperator._(this.value);

  static const values = [stringEquals];

  static PermissionConditionOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PermissionConditionOperator._(value));

  @override
  bool operator ==(other) =>
      other is PermissionConditionOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ExternalResourceException extends _s.GenericAwsException {
  ExternalResourceException({String? type, String? message})
      : super(type: type, code: 'ExternalResourceException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class LicenseNotFoundException extends _s.GenericAwsException {
  LicenseNotFoundException({String? type, String? message})
      : super(type: type, code: 'LicenseNotFoundException', message: message);
}

class MediaTooLargeException extends _s.GenericAwsException {
  MediaTooLargeException({String? type, String? message})
      : super(type: type, code: 'MediaTooLargeException', message: message);
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
  'ExternalResourceException': (type, message) =>
      ExternalResourceException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'LicenseNotFoundException': (type, message) =>
      LicenseNotFoundException(type: type, message: message),
  'MediaTooLargeException': (type, message) =>
      MediaTooLargeException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
