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
/// You can use the following AWS SDKs to access Amazon Q Business APIs:
///
/// <ul>
/// <li>
/// <a href="https://docs.aws.amazon.com/sdk-for-cpp">AWS SDK for C++</a>
/// </li>
/// <li>
/// <a href="https://docs.aws.amazon.com/sdk-for-go">AWS SDK for Go</a>
/// </li>
/// <li>
/// <a href="https://docs.aws.amazon.com/sdk-for-java">AWS SDK for Java</a>
/// </li>
/// <li>
/// <a href="https://docs.aws.amazon.com/sdk-for-javascript">AWS SDK for
/// JavaScript</a>
/// </li>
/// <li>
/// <a href="https://docs.aws.amazon.com/sdk-for-net">AWS SDK for .NET</a>
/// </li>
/// <li>
/// <a href="https://docs.aws.amazon.com/pythonsdk">AWS SDK for Python
/// (Boto3)</a>
/// </li>
/// <li>
/// <a href="https://docs.aws.amazon.com/sdk-for-ruby">AWS SDK for Ruby</a>
/// </li>
/// </ul>
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
            signingName: 'qbusiness',
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

  /// Asynchronously deletes one or more documents added using the
  /// <code>BatchPutDocument</code> API from an Amazon Q Business index.
  ///
  /// You can see the progress of the deletion, and any error messages related
  /// to the process, by using CloudWatch.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application.
  ///
  /// Parameter [documents] :
  /// One or more documents to add to the index.
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

  /// Starts or continues a non-streaming Amazon Q Business conversation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
  /// The chat modes available to an Amazon Q Business end user.
  ///
  /// <ul>
  /// <li>
  /// <code>RETRIEVAL_MODE</code> - The default chat mode for an Amazon Q
  /// Business application. When this mode is enabled, Amazon Q Business
  /// generates responses only from data sources connected to an Amazon Q
  /// Business application.
  /// </li>
  /// <li>
  /// <code>CREATOR_MODE</code> - By selecting this mode, users can choose to
  /// generate responses only from the LLM knowledge, without consulting
  /// connected data sources, for a chat request.
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
  /// The identifier of the previous end user text input message in a
  /// conversation.
  ///
  /// Parameter [userGroups] :
  /// The groups that a user associated with the chat input belongs to.
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
      if (chatMode != null) 'chatMode': chatMode.toValue(),
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

  /// Creates an Amazon Q Business application.
  /// <note>
  /// There are new tiers for Amazon Q Business. Not all features in Amazon Q
  /// Business Pro are also available in Amazon Q Business Lite. For information
  /// on what's included in Amazon Q Business Lite and what's included in Amazon
  /// Q Business Pro, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/what-is.html#tiers">Amazon
  /// Q Business tiers</a>. You must use the Amazon Q Business console to assign
  /// subscription tiers to users.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [displayName] :
  /// A name for the Amazon Q Business application.
  ///
  /// Parameter [attachmentsConfiguration] :
  /// An option to allow end users to upload files directly during chat.
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
  /// Parameter [identityCenterInstanceArn] :
  /// The Amazon Resource Name (ARN) of the IAM Identity Center instance you are
  /// either creating for—or connecting to—your Amazon Q Business application.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permissions to access
  /// your Amazon CloudWatch logs and metrics.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize your Amazon Q
  /// Business application. You can also use tags to help control access to the
  /// application. Tag keys and values can consist of Unicode letters, digits,
  /// white space, and any of the following symbols: _ . : / = + - @.
  Future<CreateApplicationResponse> createApplication({
    required String displayName,
    AttachmentsConfiguration? attachmentsConfiguration,
    String? clientToken,
    String? description,
    EncryptionConfiguration? encryptionConfiguration,
    String? identityCenterInstanceArn,
    String? roleArn,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'displayName': displayName,
      if (attachmentsConfiguration != null)
        'attachmentsConfiguration': attachmentsConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (identityCenterInstanceArn != null)
        'identityCenterInstanceArn': identityCenterInstanceArn,
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

  /// Creates a data source connector for an Amazon Q Business application.
  ///
  /// <code>CreateDataSource</code> is a synchronous operation. The operation
  /// returns 200 if the data source was successfully created. Otherwise, an
  /// exception is raised.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application the data source will
  /// be attached to.
  ///
  /// Parameter [configuration] :
  /// Configuration information to connect to your data source repository. For
  /// configuration templates for your specific data source, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/connectors-list.html">Supported
  /// connectors</a>.
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
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// the data source and required resources.
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
    required DataSourceConfiguration configuration,
    required String displayName,
    required String indexId,
    String? clientToken,
    String? description,
    DocumentEnrichmentConfiguration? documentEnrichmentConfiguration,
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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
  /// what's included in each type of index or index tier, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/qbusiness-ug/what-is.html#tiers">Amazon
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
      if (type != null) 'type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/indices',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIndexResponse.fromJson(response);
  }

  /// Creates an Amazon Q Business plugin.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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
      'type': type.toValue(),
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

  /// Adds a retriever to your Amazon Q Business application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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
      'type': type.toValue(),
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

  /// Creates a universally unique identifier (UUID) mapped to a list of local
  /// user ids within an application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Creates an Amazon Q Business web experience.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business web experience.
  ///
  /// Parameter [clientToken] :
  /// A token you provide to identify a request to create an Amazon Q Business
  /// web experience.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the service role attached to your web
  /// experience.
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
    String? clientToken,
    String? roleArn,
    WebExperienceSamplePromptsControlMode? samplePromptsControlMode,
    String? subtitle,
    List<Tag>? tags,
    String? title,
    String? welcomeMessage,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (roleArn != null) 'roleArn': roleArn,
      if (samplePromptsControlMode != null)
        'samplePromptsControlMode': samplePromptsControlMode.toValue(),
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

  /// Deletes an Amazon Q Business application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Deletes chat controls configured for an existing Amazon Q Business
  /// application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Deletes an Amazon Q Business web experience conversation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Deletes an Amazon Q Business data source connector. While the data source
  /// is being deleted, the <code>Status</code> field returned by a call to the
  /// <code>DescribeDataSource</code> API is set to <code>DELETING</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Deletes an Amazon Q Business index.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Deletes an Amazon Q Business plugin.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Deletes the retriever used by an Amazon Q Business application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Deletes a user by email id.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Deletes an Amazon Q Business web experience.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Gets information about an existing Amazon Q Business application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Gets information about an chat controls configured for an existing Amazon
  /// Q Business application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Gets information about an existing Amazon Q Business data source
  /// connector.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Describes a group by group name.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Gets information about an existing Amazon Q Business index.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Gets information about an existing Amazon Q Business plugin.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Gets information about an existing retriever used by an Amazon Q Business
  /// application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Describes the universally unique identifier (UUID) associated with a local
  /// user in a data source.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Gets information about an existing Amazon Q Business web experience.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Lists Amazon Q Business applications.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Lists one or more Amazon Q Business conversations.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
      if (statusFilter != null) 'syncStatus': [statusFilter.toValue()],
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

  /// Lists the Amazon Q Business data source connectors that you have created.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// A list of documents attached to an index.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Lists the Amazon Q Business indices you have created.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Gets a list of messages associated with an Amazon Q Business web
  /// experience.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [LicenseNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
  /// If the number of retrievers returned exceeds <code>maxResults</code>,
  /// Amazon Q Business returns a next token as a pagination token to retrieve
  /// the next set of messages.
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

  /// Lists configured Amazon Q Business plugins.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Lists the retriever used by an Amazon Q Business application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Gets a list of tags associated with a specified resource. Amazon Q
  /// Business applications and data sources can have tags associated with them.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Lists one or more Amazon Q Business Web Experiences.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Enables your end user to provide feedback on their Amazon Q Business
  /// generated chat responses.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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
  /// If you have more than 1000 users and/or sub groups for a single group, you
  /// need to provide the path to the S3 file that lists your users and sub
  /// groups for a group. Your sub groups can contain more than 1000 users, but
  /// the list of sub groups that belong to a group (and/or users) must be no
  /// more than 1000.
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
  Future<void> putGroup({
    required String applicationId,
    required GroupMembers groupMembers,
    required String groupName,
    required String indexId,
    required MembershipType type,
    String? dataSourceId,
  }) async {
    final $payload = <String, dynamic>{
      'groupMembers': groupMembers,
      'groupName': groupName,
      'type': type.toValue(),
      if (dataSourceId != null) 'dataSourceId': dataSourceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/indices/${Uri.encodeComponent(indexId)}/groups',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a data source connector synchronization job. If a synchronization
  /// job is already in progress, Amazon Q Business returns a
  /// <code>ConflictException</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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

  /// Updates an existing Amazon Q Business application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the Amazon Q Business application.
  ///
  /// Parameter [attachmentsConfiguration] :
  /// An option to allow end users to upload files directly during chat.
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
  /// Parameter [roleArn] :
  /// An Amazon Web Services Identity and Access Management (IAM) role that
  /// gives Amazon Q Business permission to access Amazon CloudWatch logs and
  /// metrics.
  Future<void> updateApplication({
    required String applicationId,
    AttachmentsConfiguration? attachmentsConfiguration,
    String? description,
    String? displayName,
    String? identityCenterInstanceArn,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (attachmentsConfiguration != null)
        'attachmentsConfiguration': attachmentsConfiguration,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (identityCenterInstanceArn != null)
        'identityCenterInstanceArn': identityCenterInstanceArn,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an set of chat controls configured for an existing Amazon Q
  /// Business application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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
      if (responseScope != null) 'responseScope': responseScope.toValue(),
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

  /// Updates an existing Amazon Q Business data source connector.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
    DataSourceConfiguration? configuration,
    String? description,
    String? displayName,
    DocumentEnrichmentConfiguration? documentEnrichmentConfiguration,
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

  /// Updates an Amazon Q Business index.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Updates an Amazon Q Business plugin.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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
      if (state != null) 'state': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/plugins/${Uri.encodeComponent(pluginId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the retriever used for your Amazon Q Business application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Updates a information associated with a user id.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Updates an Amazon Q Business web experience.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
    String? roleArn,
    WebExperienceSamplePromptsControlMode? samplePromptsControlMode,
    String? subtitle,
    String? title,
    String? welcomeMessage,
  }) async {
    final $payload = <String, dynamic>{
      if (authenticationConfiguration != null)
        'authenticationConfiguration': authenticationConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
      if (samplePromptsControlMode != null)
        'samplePromptsControlMode': samplePromptsControlMode.toValue(),
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

enum APISchemaType {
  openApiV3,
}

extension APISchemaTypeValueExtension on APISchemaType {
  String toValue() {
    switch (this) {
      case APISchemaType.openApiV3:
        return 'OPEN_API_V3';
    }
  }
}

extension APISchemaTypeFromString on String {
  APISchemaType toAPISchemaType() {
    switch (this) {
      case 'OPEN_API_V3':
        return APISchemaType.openApiV3;
    }
    throw Exception('$this is not known in enum APISchemaType');
  }
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
      if (memberRelation != null) 'memberRelation': memberRelation.toValue(),
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
      if (memberRelation != null) 'memberRelation': memberRelation.toValue(),
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
      payload: (json['payload'] as Map<String, dynamic>).map((k, e) => MapEntry(
          k, ActionExecutionPayloadField.fromJson(e as Map<String, dynamic>))),
      payloadFieldNameSeparator: json['payloadFieldNameSeparator'] as String,
      pluginId: json['pluginId'] as String,
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
  final ActionPayloadFieldValue value;

  ActionExecutionPayloadField({
    required this.value,
  });

  factory ActionExecutionPayloadField.fromJson(Map<String, dynamic> json) {
    return ActionExecutionPayloadField(
      value: ActionPayloadFieldValue.fromJson(
          json['value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

enum ActionPayloadFieldType {
  string,
  number,
  array,
  boolean,
}

extension ActionPayloadFieldTypeValueExtension on ActionPayloadFieldType {
  String toValue() {
    switch (this) {
      case ActionPayloadFieldType.string:
        return 'STRING';
      case ActionPayloadFieldType.number:
        return 'NUMBER';
      case ActionPayloadFieldType.array:
        return 'ARRAY';
      case ActionPayloadFieldType.boolean:
        return 'BOOLEAN';
    }
  }
}

extension ActionPayloadFieldTypeFromString on String {
  ActionPayloadFieldType toActionPayloadFieldType() {
    switch (this) {
      case 'STRING':
        return ActionPayloadFieldType.string;
      case 'NUMBER':
        return ActionPayloadFieldType.number;
      case 'ARRAY':
        return ActionPayloadFieldType.array;
      case 'BOOLEAN':
        return ActionPayloadFieldType.boolean;
    }
    throw Exception('$this is not known in enum ActionPayloadFieldType');
  }
}

class ActionPayloadFieldValue {
  ActionPayloadFieldValue();

  factory ActionPayloadFieldValue.fromJson(Map<String, dynamic> _) {
    return ActionPayloadFieldValue();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
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
      pluginType: (json['pluginType'] as String?)?.toPluginType(),
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
      if (pluginType != null) 'pluginType': pluginType.toValue(),
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
  final ActionPayloadFieldValue? value;

  ActionReviewPayloadField({
    this.allowedFormat,
    this.allowedValues,
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
          ?.whereNotNull()
          .map((e) => ActionReviewPayloadFieldAllowedValue.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      displayDescription: json['displayDescription'] as String?,
      displayName: json['displayName'] as String?,
      displayOrder: json['displayOrder'] as int?,
      required: json['required'] as bool?,
      type: (json['type'] as String?)?.toActionPayloadFieldType(),
      value: json['value'] != null
          ? ActionPayloadFieldValue.fromJson(
              json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedFormat = this.allowedFormat;
    final allowedValues = this.allowedValues;
    final displayDescription = this.displayDescription;
    final displayName = this.displayName;
    final displayOrder = this.displayOrder;
    final required = this.required;
    final type = this.type;
    final value = this.value;
    return {
      if (allowedFormat != null) 'allowedFormat': allowedFormat,
      if (allowedValues != null) 'allowedValues': allowedValues,
      if (displayDescription != null) 'displayDescription': displayDescription,
      if (displayName != null) 'displayName': displayName,
      if (displayOrder != null) 'displayOrder': displayOrder,
      if (required != null) 'required': required,
      if (type != null) 'type': type.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// Information about the field values that an end user can use to provide to
/// Amazon Q Business for Amazon Q Business to perform the requested plugin
/// action.
class ActionReviewPayloadFieldAllowedValue {
  /// The name of the field.
  final ActionPayloadFieldValue? displayValue;

  /// The field value.
  final ActionPayloadFieldValue? value;

  ActionReviewPayloadFieldAllowedValue({
    this.displayValue,
    this.value,
  });

  factory ActionReviewPayloadFieldAllowedValue.fromJson(
      Map<String, dynamic> json) {
    return ActionReviewPayloadFieldAllowedValue(
      displayValue: json['displayValue'] != null
          ? ActionPayloadFieldValue.fromJson(
              json['displayValue'] as Map<String, dynamic>)
          : null,
      value: json['value'] != null
          ? ActionPayloadFieldValue.fromJson(
              json['value'] as Map<String, dynamic>)
          : null,
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

/// Summary information for an Amazon Q Business application.
class Application {
  /// The identifier for the Amazon Q Business application.
  final String? applicationId;

  /// The Unix timestamp when the Amazon Q Business application was created.
  final DateTime? createdAt;

  /// The name of the Amazon Q Business application.
  final String? displayName;

  /// The status of the Amazon Q Business application. The application is ready to
  /// use when the status is <code>ACTIVE</code>.
  final ApplicationStatus? status;

  /// The Unix timestamp when the Amazon Q Business application was last updated.
  final DateTime? updatedAt;

  Application({
    this.applicationId,
    this.createdAt,
    this.displayName,
    this.status,
    this.updatedAt,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      applicationId: json['applicationId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      status: (json['status'] as String?)?.toApplicationStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final createdAt = this.createdAt;
    final displayName = this.displayName;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum ApplicationStatus {
  creating,
  active,
  deleting,
  failed,
  updating,
}

extension ApplicationStatusValueExtension on ApplicationStatus {
  String toValue() {
    switch (this) {
      case ApplicationStatus.creating:
        return 'CREATING';
      case ApplicationStatus.active:
        return 'ACTIVE';
      case ApplicationStatus.deleting:
        return 'DELETING';
      case ApplicationStatus.failed:
        return 'FAILED';
      case ApplicationStatus.updating:
        return 'UPDATING';
    }
  }
}

extension ApplicationStatusFromString on String {
  ApplicationStatus toApplicationStatus() {
    switch (this) {
      case 'CREATING':
        return ApplicationStatus.creating;
      case 'ACTIVE':
        return ApplicationStatus.active;
      case 'DELETING':
        return ApplicationStatus.deleting;
      case 'FAILED':
        return ApplicationStatus.failed;
      case 'UPDATING':
        return ApplicationStatus.updating;
    }
    throw Exception('$this is not known in enum ApplicationStatus');
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
          ?.toAttachmentsControlMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentsControlMode = this.attachmentsControlMode;
    return {
      if (attachmentsControlMode != null)
        'attachmentsControlMode': attachmentsControlMode.toValue(),
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
      creatorModeControl:
          (json['creatorModeControl'] as String).toCreatorModeControl(),
    );
  }

  Map<String, dynamic> toJson() {
    final creatorModeControl = this.creatorModeControl;
    return {
      'creatorModeControl': creatorModeControl.toValue(),
    };
  }
}

/// A file directly uploaded into a web experience chat.
class AttachmentInput {
  /// The data contained within the uploaded file.
  final Uint8List data;

  /// The name of the file.
  final String name;

  AttachmentInput({
    required this.data,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final name = this.name;
    return {
      'data': base64Encode(data),
      'name': name,
    };
  }
}

/// The details of a file uploaded during chat.
class AttachmentOutput {
  /// An error associated with a file uploaded during chat.
  final ErrorDetail? error;

  /// The name of a file uploaded during chat.
  final String? name;

  /// The status of a file uploaded during chat.
  final AttachmentStatus? status;

  AttachmentOutput({
    this.error,
    this.name,
    this.status,
  });

  factory AttachmentOutput.fromJson(Map<String, dynamic> json) {
    return AttachmentOutput(
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toAttachmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final name = this.name;
    final status = this.status;
    return {
      if (error != null) 'error': error,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum AttachmentStatus {
  failed,
  succeeded,
}

extension AttachmentStatusValueExtension on AttachmentStatus {
  String toValue() {
    switch (this) {
      case AttachmentStatus.failed:
        return 'FAILED';
      case AttachmentStatus.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension AttachmentStatusFromString on String {
  AttachmentStatus toAttachmentStatus() {
    switch (this) {
      case 'FAILED':
        return AttachmentStatus.failed;
      case 'SUCCEEDED':
        return AttachmentStatus.succeeded;
    }
    throw Exception('$this is not known in enum AttachmentStatus');
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
      'attachmentsControlMode': attachmentsControlMode.toValue(),
    };
  }
}

enum AttachmentsControlMode {
  enabled,
  disabled,
}

extension AttachmentsControlModeValueExtension on AttachmentsControlMode {
  String toValue() {
    switch (this) {
      case AttachmentsControlMode.enabled:
        return 'ENABLED';
      case AttachmentsControlMode.disabled:
        return 'DISABLED';
    }
  }
}

extension AttachmentsControlModeFromString on String {
  AttachmentsControlMode toAttachmentsControlMode() {
    switch (this) {
      case 'ENABLED':
        return AttachmentsControlMode.enabled;
      case 'DISABLED':
        return AttachmentsControlMode.disabled;
    }
    throw Exception('$this is not known in enum AttachmentsControlMode');
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
  /// attribute value types</a>: <code>dateValue</code>, <code>longValue</code>,
  /// <code>stringListValue</code> and <code>stringValue</code>.
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

enum AttributeType {
  string,
  stringList,
  number,
  date,
}

extension AttributeTypeValueExtension on AttributeType {
  String toValue() {
    switch (this) {
      case AttributeType.string:
        return 'STRING';
      case AttributeType.stringList:
        return 'STRING_LIST';
      case AttributeType.number:
        return 'NUMBER';
      case AttributeType.date:
        return 'DATE';
    }
  }
}

extension AttributeTypeFromString on String {
  AttributeType toAttributeType() {
    switch (this) {
      case 'STRING':
        return AttributeType.string;
      case 'STRING_LIST':
        return AttributeType.stringList;
      case 'NUMBER':
        return AttributeType.number;
      case 'DATE':
        return AttributeType.date;
    }
    throw Exception('$this is not known in enum AttributeType');
  }
}

enum AttributeValueOperator {
  delete,
}

extension AttributeValueOperatorValueExtension on AttributeValueOperator {
  String toValue() {
    switch (this) {
      case AttributeValueOperator.delete:
        return 'DELETE';
    }
  }
}

extension AttributeValueOperatorFromString on String {
  AttributeValueOperator toAttributeValueOperator() {
    switch (this) {
      case 'DELETE':
        return AttributeValueOperator.delete;
    }
    throw Exception('$this is not known in enum AttributeValueOperator');
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
      authorizationUrl: json['authorizationUrl'] as String,
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
      roleArn: json['roleArn'] as String,
      secretArn: json['secretArn'] as String,
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

/// Provides information about the phrases blocked from chat by your chat
/// control configuration.
class BlockedPhrasesConfiguration {
  /// A list of phrases blocked from a Amazon Q Business web experience chat.
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
          ?.whereNotNull()
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

enum ChatMode {
  retrievalMode,
  creatorMode,
  pluginMode,
}

extension ChatModeValueExtension on ChatMode {
  String toValue() {
    switch (this) {
      case ChatMode.retrievalMode:
        return 'RETRIEVAL_MODE';
      case ChatMode.creatorMode:
        return 'CREATOR_MODE';
      case ChatMode.pluginMode:
        return 'PLUGIN_MODE';
    }
  }
}

extension ChatModeFromString on String {
  ChatMode toChatMode() {
    switch (this) {
      case 'RETRIEVAL_MODE':
        return ChatMode.retrievalMode;
      case 'CREATOR_MODE':
        return ChatMode.creatorMode;
      case 'PLUGIN_MODE':
        return ChatMode.pluginMode;
    }
    throw Exception('$this is not known in enum ChatMode');
  }
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
          ?.whereNotNull()
          .map((e) => AttachmentOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceAttributions: (json['sourceAttributions'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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

enum ContentType {
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
  md,
}

extension ContentTypeValueExtension on ContentType {
  String toValue() {
    switch (this) {
      case ContentType.pdf:
        return 'PDF';
      case ContentType.html:
        return 'HTML';
      case ContentType.msWord:
        return 'MS_WORD';
      case ContentType.plainText:
        return 'PLAIN_TEXT';
      case ContentType.ppt:
        return 'PPT';
      case ContentType.rtf:
        return 'RTF';
      case ContentType.xml:
        return 'XML';
      case ContentType.xslt:
        return 'XSLT';
      case ContentType.msExcel:
        return 'MS_EXCEL';
      case ContentType.csv:
        return 'CSV';
      case ContentType.json:
        return 'JSON';
      case ContentType.md:
        return 'MD';
    }
  }
}

extension ContentTypeFromString on String {
  ContentType toContentType() {
    switch (this) {
      case 'PDF':
        return ContentType.pdf;
      case 'HTML':
        return ContentType.html;
      case 'MS_WORD':
        return ContentType.msWord;
      case 'PLAIN_TEXT':
        return ContentType.plainText;
      case 'PPT':
        return ContentType.ppt;
      case 'RTF':
        return ContentType.rtf;
      case 'XML':
        return ContentType.xml;
      case 'XSLT':
        return ContentType.xslt;
      case 'MS_EXCEL':
        return ContentType.msExcel;
      case 'CSV':
        return ContentType.csv;
      case 'JSON':
        return ContentType.json;
      case 'MD':
        return ContentType.md;
    }
    throw Exception('$this is not known in enum ContentType');
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
      buildStatus: (json['buildStatus'] as String?)?.toPluginBuildStatus(),
      pluginArn: json['pluginArn'] as String?,
      pluginId: json['pluginId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final buildStatus = this.buildStatus;
    final pluginArn = this.pluginArn;
    final pluginId = this.pluginId;
    return {
      if (buildStatus != null) 'buildStatus': buildStatus.toValue(),
      if (pluginArn != null) 'pluginArn': pluginArn,
      if (pluginId != null) 'pluginId': pluginId,
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

class CreateUserResponse {
  CreateUserResponse();

  factory CreateUserResponse.fromJson(Map<String, dynamic> _) {
    return CreateUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
      'creatorModeControl': creatorModeControl.toValue(),
    };
  }
}

enum CreatorModeControl {
  enabled,
  disabled,
}

extension CreatorModeControlValueExtension on CreatorModeControl {
  String toValue() {
    switch (this) {
      case CreatorModeControl.enabled:
        return 'ENABLED';
      case CreatorModeControl.disabled:
        return 'DISABLED';
    }
  }
}

extension CreatorModeControlFromString on String {
  CreatorModeControl toCreatorModeControl() {
    switch (this) {
      case 'ENABLED':
        return CreatorModeControl.enabled;
      case 'DISABLED':
        return CreatorModeControl.disabled;
    }
    throw Exception('$this is not known in enum CreatorModeControl');
  }
}

/// Configuration information required to create a custom plugin.
class CustomPluginConfiguration {
  /// Contains either details about the S3 object containing the OpenAPI schema
  /// for the action group or the JSON or YAML-formatted payload defining the
  /// schema.
  final APISchema apiSchema;

  /// The type of OpenAPI schema to use.
  final APISchemaType apiSchemaType;

  /// A description for your custom plugin configuration.
  final String description;

  CustomPluginConfiguration({
    required this.apiSchema,
    required this.apiSchemaType,
    required this.description,
  });

  factory CustomPluginConfiguration.fromJson(Map<String, dynamic> json) {
    return CustomPluginConfiguration(
      apiSchema: APISchema.fromJson(json['apiSchema'] as Map<String, dynamic>),
      apiSchemaType: (json['apiSchemaType'] as String).toAPISchemaType(),
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final apiSchema = this.apiSchema;
    final apiSchemaType = this.apiSchemaType;
    final description = this.description;
    return {
      'apiSchema': apiSchema,
      'apiSchemaType': apiSchemaType.toValue(),
      'description': description,
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
      status: (json['status'] as String?)?.toDataSourceStatus(),
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
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Provides the configuration information for an Amazon Q Business data source.
class DataSourceConfiguration {
  DataSourceConfiguration();

  factory DataSourceConfiguration.fromJson(Map<String, dynamic> _) {
    return DataSourceConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DataSourceStatus {
  pendingCreation,
  creating,
  active,
  deleting,
  failed,
  updating,
}

extension DataSourceStatusValueExtension on DataSourceStatus {
  String toValue() {
    switch (this) {
      case DataSourceStatus.pendingCreation:
        return 'PENDING_CREATION';
      case DataSourceStatus.creating:
        return 'CREATING';
      case DataSourceStatus.active:
        return 'ACTIVE';
      case DataSourceStatus.deleting:
        return 'DELETING';
      case DataSourceStatus.failed:
        return 'FAILED';
      case DataSourceStatus.updating:
        return 'UPDATING';
    }
  }
}

extension DataSourceStatusFromString on String {
  DataSourceStatus toDataSourceStatus() {
    switch (this) {
      case 'PENDING_CREATION':
        return DataSourceStatus.pendingCreation;
      case 'CREATING':
        return DataSourceStatus.creating;
      case 'ACTIVE':
        return DataSourceStatus.active;
      case 'DELETING':
        return DataSourceStatus.deleting;
      case 'FAILED':
        return DataSourceStatus.failed;
      case 'UPDATING':
        return DataSourceStatus.updating;
    }
    throw Exception('$this is not known in enum DataSourceStatus');
  }
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
      status: (json['status'] as String?)?.toDataSourceSyncJobStatus(),
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
      if (status != null) 'status': status.toValue(),
    };
  }
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

enum DataSourceSyncJobStatus {
  failed,
  succeeded,
  syncing,
  incomplete,
  stopping,
  aborted,
  syncingIndexing,
}

extension DataSourceSyncJobStatusValueExtension on DataSourceSyncJobStatus {
  String toValue() {
    switch (this) {
      case DataSourceSyncJobStatus.failed:
        return 'FAILED';
      case DataSourceSyncJobStatus.succeeded:
        return 'SUCCEEDED';
      case DataSourceSyncJobStatus.syncing:
        return 'SYNCING';
      case DataSourceSyncJobStatus.incomplete:
        return 'INCOMPLETE';
      case DataSourceSyncJobStatus.stopping:
        return 'STOPPING';
      case DataSourceSyncJobStatus.aborted:
        return 'ABORTED';
      case DataSourceSyncJobStatus.syncingIndexing:
        return 'SYNCING_INDEXING';
    }
  }
}

extension DataSourceSyncJobStatusFromString on String {
  DataSourceSyncJobStatus toDataSourceSyncJobStatus() {
    switch (this) {
      case 'FAILED':
        return DataSourceSyncJobStatus.failed;
      case 'SUCCEEDED':
        return DataSourceSyncJobStatus.succeeded;
      case 'SYNCING':
        return DataSourceSyncJobStatus.syncing;
      case 'INCOMPLETE':
        return DataSourceSyncJobStatus.incomplete;
      case 'STOPPING':
        return DataSourceSyncJobStatus.stopping;
      case 'ABORTED':
        return DataSourceSyncJobStatus.aborted;
      case 'SYNCING_INDEXING':
        return DataSourceSyncJobStatus.syncingIndexing;
    }
    throw Exception('$this is not known in enum DataSourceSyncJobStatus');
  }
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
      securityGroupIds: (json['securityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
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

/// Provides information on boosting <code>DATE</code> type document attributes.
///
/// For more information on how boosting document attributes work in Amazon Q
/// Business, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/metadata-boosting.html">Boosting
/// using document attributes</a>.
class DateAttributeBoostingConfiguration {
  /// Specifies how much a document attribute is boosted.
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
      boostingLevel:
          (json['boostingLevel'] as String).toDocumentAttributeBoostingLevel(),
      boostingDurationInSeconds: json['boostingDurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final boostingLevel = this.boostingLevel;
    final boostingDurationInSeconds = this.boostingDurationInSeconds;
    return {
      'boostingLevel': boostingLevel.toValue(),
      if (boostingDurationInSeconds != null)
        'boostingDurationInSeconds': boostingDurationInSeconds,
    };
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

class DeleteConversationResponse {
  DeleteConversationResponse();

  factory DeleteConversationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteConversationResponse();
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

class DeleteGroupResponse {
  DeleteGroupResponse();

  factory DeleteGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGroupResponse();
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

class DeletePluginResponse {
  DeletePluginResponse();

  factory DeletePluginResponse.fromJson(Map<String, dynamic> _) {
    return DeletePluginResponse();
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

class DeleteUserResponse {
  DeleteUserResponse();

  factory DeleteUserResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserResponse();
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

  /// The title of the document.
  final String? title;

  Document({
    required this.id,
    this.accessConfiguration,
    this.attributes,
    this.content,
    this.contentType,
    this.documentEnrichmentConfiguration,
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
    final title = this.title;
    return {
      'id': id,
      if (accessConfiguration != null)
        'accessConfiguration': accessConfiguration,
      if (attributes != null) 'attributes': attributes,
      if (content != null) 'content': content,
      if (contentType != null) 'contentType': contentType.toValue(),
      if (documentEnrichmentConfiguration != null)
        'documentEnrichmentConfiguration': documentEnrichmentConfiguration,
      if (title != null) 'title': title,
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// Provides information on boosting supported Amazon Q Business document
/// attribute types. When an end user chat query matches document attributes
/// that have been boosted, Amazon Q Business prioritizes generating responses
/// from content that matches the boosted document attributes.
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
  final DateAttributeBoostingConfiguration? dateConfiguration;

  /// Provides information on boosting <code>NUMBER</code> type document
  /// attributes.
  final NumberAttributeBoostingConfiguration? numberConfiguration;

  /// Provides information on boosting <code>STRING</code> type document
  /// attributes.
  final StringAttributeBoostingConfiguration? stringConfiguration;

  /// Provides information on boosting <code>STRING_LIST</code> type document
  /// attributes.
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

enum DocumentAttributeBoostingLevel {
  none,
  low,
  medium,
  high,
  veryHigh,
}

extension DocumentAttributeBoostingLevelValueExtension
    on DocumentAttributeBoostingLevel {
  String toValue() {
    switch (this) {
      case DocumentAttributeBoostingLevel.none:
        return 'NONE';
      case DocumentAttributeBoostingLevel.low:
        return 'LOW';
      case DocumentAttributeBoostingLevel.medium:
        return 'MEDIUM';
      case DocumentAttributeBoostingLevel.high:
        return 'HIGH';
      case DocumentAttributeBoostingLevel.veryHigh:
        return 'VERY_HIGH';
    }
  }
}

extension DocumentAttributeBoostingLevelFromString on String {
  DocumentAttributeBoostingLevel toDocumentAttributeBoostingLevel() {
    switch (this) {
      case 'NONE':
        return DocumentAttributeBoostingLevel.none;
      case 'LOW':
        return DocumentAttributeBoostingLevel.low;
      case 'MEDIUM':
        return DocumentAttributeBoostingLevel.medium;
      case 'HIGH':
        return DocumentAttributeBoostingLevel.high;
      case 'VERY_HIGH':
        return DocumentAttributeBoostingLevel.veryHigh;
    }
    throw Exception(
        '$this is not known in enum DocumentAttributeBoostingLevel');
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
      key: json['key'] as String,
      operator:
          (json['operator'] as String).toDocumentEnrichmentConditionOperator(),
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
      'operator': operator.toValue(),
      if (value != null) 'value': value,
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
      search: (json['search'] as String?)?.toStatus(),
      type: (json['type'] as String?)?.toAttributeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final search = this.search;
    final type = this.type;
    return {
      if (name != null) 'name': name,
      if (search != null) 'search': search.toValue(),
      if (type != null) 'type': type.toValue(),
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
      key: json['key'] as String,
      attributeValueOperator: (json['attributeValueOperator'] as String?)
          ?.toAttributeValueOperator(),
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
        'attributeValueOperator': attributeValueOperator.toValue(),
      if (value != null) 'value': value,
    };
  }
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
          ?.whereNotNull()
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

/// The contents of a document.
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

enum DocumentContentOperator {
  delete,
}

extension DocumentContentOperatorValueExtension on DocumentContentOperator {
  String toValue() {
    switch (this) {
      case DocumentContentOperator.delete:
        return 'DELETE';
    }
  }
}

extension DocumentContentOperatorFromString on String {
  DocumentContentOperator toDocumentContentOperator() {
    switch (this) {
      case 'DELETE':
        return DocumentContentOperator.delete;
    }
    throw Exception('$this is not known in enum DocumentContentOperator');
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
      status: (json['status'] as String?)?.toDocumentStatus(),
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
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum DocumentEnrichmentConditionOperator {
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
  beginsWith,
}

extension DocumentEnrichmentConditionOperatorValueExtension
    on DocumentEnrichmentConditionOperator {
  String toValue() {
    switch (this) {
      case DocumentEnrichmentConditionOperator.greaterThan:
        return 'GREATER_THAN';
      case DocumentEnrichmentConditionOperator.greaterThanOrEquals:
        return 'GREATER_THAN_OR_EQUALS';
      case DocumentEnrichmentConditionOperator.lessThan:
        return 'LESS_THAN';
      case DocumentEnrichmentConditionOperator.lessThanOrEquals:
        return 'LESS_THAN_OR_EQUALS';
      case DocumentEnrichmentConditionOperator.equals:
        return 'EQUALS';
      case DocumentEnrichmentConditionOperator.notEquals:
        return 'NOT_EQUALS';
      case DocumentEnrichmentConditionOperator.contains:
        return 'CONTAINS';
      case DocumentEnrichmentConditionOperator.notContains:
        return 'NOT_CONTAINS';
      case DocumentEnrichmentConditionOperator.exists:
        return 'EXISTS';
      case DocumentEnrichmentConditionOperator.notExists:
        return 'NOT_EXISTS';
      case DocumentEnrichmentConditionOperator.beginsWith:
        return 'BEGINS_WITH';
    }
  }
}

extension DocumentEnrichmentConditionOperatorFromString on String {
  DocumentEnrichmentConditionOperator toDocumentEnrichmentConditionOperator() {
    switch (this) {
      case 'GREATER_THAN':
        return DocumentEnrichmentConditionOperator.greaterThan;
      case 'GREATER_THAN_OR_EQUALS':
        return DocumentEnrichmentConditionOperator.greaterThanOrEquals;
      case 'LESS_THAN':
        return DocumentEnrichmentConditionOperator.lessThan;
      case 'LESS_THAN_OR_EQUALS':
        return DocumentEnrichmentConditionOperator.lessThanOrEquals;
      case 'EQUALS':
        return DocumentEnrichmentConditionOperator.equals;
      case 'NOT_EQUALS':
        return DocumentEnrichmentConditionOperator.notEquals;
      case 'CONTAINS':
        return DocumentEnrichmentConditionOperator.contains;
      case 'NOT_CONTAINS':
        return DocumentEnrichmentConditionOperator.notContains;
      case 'EXISTS':
        return DocumentEnrichmentConditionOperator.exists;
      case 'NOT_EXISTS':
        return DocumentEnrichmentConditionOperator.notExists;
      case 'BEGINS_WITH':
        return DocumentEnrichmentConditionOperator.beginsWith;
    }
    throw Exception(
        '$this is not known in enum DocumentEnrichmentConditionOperator');
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
          ?.whereNotNull()
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

enum DocumentStatus {
  received,
  processing,
  indexed,
  updated,
  failed,
  deleting,
  deleted,
  documentFailedToIndex,
}

extension DocumentStatusValueExtension on DocumentStatus {
  String toValue() {
    switch (this) {
      case DocumentStatus.received:
        return 'RECEIVED';
      case DocumentStatus.processing:
        return 'PROCESSING';
      case DocumentStatus.indexed:
        return 'INDEXED';
      case DocumentStatus.updated:
        return 'UPDATED';
      case DocumentStatus.failed:
        return 'FAILED';
      case DocumentStatus.deleting:
        return 'DELETING';
      case DocumentStatus.deleted:
        return 'DELETED';
      case DocumentStatus.documentFailedToIndex:
        return 'DOCUMENT_FAILED_TO_INDEX';
    }
  }
}

extension DocumentStatusFromString on String {
  DocumentStatus toDocumentStatus() {
    switch (this) {
      case 'RECEIVED':
        return DocumentStatus.received;
      case 'PROCESSING':
        return DocumentStatus.processing;
      case 'INDEXED':
        return DocumentStatus.indexed;
      case 'UPDATED':
        return DocumentStatus.updated;
      case 'FAILED':
        return DocumentStatus.failed;
      case 'DELETING':
        return DocumentStatus.deleting;
      case 'DELETED':
        return DocumentStatus.deleted;
      case 'DOCUMENT_FAILED_TO_INDEX':
        return DocumentStatus.documentFailedToIndex;
    }
    throw Exception('$this is not known in enum DocumentStatus');
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

enum ErrorCode {
  internalError,
  invalidRequest,
  resourceInactive,
  resourceNotFound,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.internalError:
        return 'InternalError';
      case ErrorCode.invalidRequest:
        return 'InvalidRequest';
      case ErrorCode.resourceInactive:
        return 'ResourceInactive';
      case ErrorCode.resourceNotFound:
        return 'ResourceNotFound';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'InternalError':
        return ErrorCode.internalError;
      case 'InvalidRequest':
        return ErrorCode.invalidRequest;
      case 'ResourceInactive':
        return ErrorCode.resourceInactive;
      case 'ResourceNotFound':
        return ErrorCode.resourceNotFound;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Provides information about a data source sync error.
class ErrorDetail {
  /// The code associated with the data source sync error.
  final ErrorCode? errorCode;

  /// The message explaining the data source sync error.
  final String? errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      errorCode: (json['errorCode'] as String?)?.toErrorCode(),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
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

class GetApplicationResponse {
  /// The Amazon Resource Name (ARN) of the Amazon Q Business application.
  final String? applicationArn;

  /// The identifier of the Amazon Q Business application.
  final String? applicationId;

  /// Settings for whether end users can upload files directly during chat.
  final AppliedAttachmentsConfiguration? attachmentsConfiguration;

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

  /// The Amazon Resource Name (ARN) of the AWS IAM Identity Center instance
  /// attached to your Amazon Q Business application.
  final String? identityCenterApplicationArn;

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
    this.createdAt,
    this.description,
    this.displayName,
    this.encryptionConfiguration,
    this.error,
    this.identityCenterApplicationArn,
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
      identityCenterApplicationArn:
          json['identityCenterApplicationArn'] as String?,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.toApplicationStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationId = this.applicationId;
    final attachmentsConfiguration = this.attachmentsConfiguration;
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final encryptionConfiguration = this.encryptionConfiguration;
    final error = this.error;
    final identityCenterApplicationArn = this.identityCenterApplicationArn;
    final roleArn = this.roleArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (applicationId != null) 'applicationId': applicationId,
      if (attachmentsConfiguration != null)
        'attachmentsConfiguration': attachmentsConfiguration,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (error != null) 'error': error,
      if (identityCenterApplicationArn != null)
        'identityCenterApplicationArn': identityCenterApplicationArn,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class GetChatControlsConfigurationResponse {
  /// The phrases blocked from chat by your chat control configuration.
  final BlockedPhrasesConfiguration? blockedPhrases;

  /// The configuration details for <code>CREATOR_MODE</code>.
  final AppliedCreatorModeConfiguration? creatorModeConfiguration;

  /// If the <code>maxResults</code> response was incomplete because there is more
  /// data to retrieve, Amazon Q Business returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// Amazon Q Business chat controls configured.
  final String? nextToken;

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
    this.nextToken,
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
      nextToken: json['nextToken'] as String?,
      responseScope: (json['responseScope'] as String?)?.toResponseScope(),
      topicConfigurations: (json['topicConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => TopicConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final blockedPhrases = this.blockedPhrases;
    final creatorModeConfiguration = this.creatorModeConfiguration;
    final nextToken = this.nextToken;
    final responseScope = this.responseScope;
    final topicConfigurations = this.topicConfigurations;
    return {
      if (blockedPhrases != null) 'blockedPhrases': blockedPhrases,
      if (creatorModeConfiguration != null)
        'creatorModeConfiguration': creatorModeConfiguration,
      if (nextToken != null) 'nextToken': nextToken,
      if (responseScope != null) 'responseScope': responseScope.toValue(),
      if (topicConfigurations != null)
        'topicConfigurations': topicConfigurations,
    };
  }
}

class GetDataSourceResponse {
  /// The identifier of the Amazon Q Business application.
  final String? applicationId;

  /// The details of how the data source connector is configured.
  final DataSourceConfiguration? configuration;

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
      configuration: json['configuration'] != null
          ? DataSourceConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
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
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.toDataSourceStatus(),
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
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
      if (syncSchedule != null) 'syncSchedule': syncSchedule,
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
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
          ?.whereNotNull()
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
              ?.whereNotNull()
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
      status: (json['status'] as String?)?.toIndexStatus(),
      type: (json['type'] as String?)?.toIndexType(),
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
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
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
      buildStatus: (json['buildStatus'] as String?)?.toPluginBuildStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      customPluginConfiguration: json['customPluginConfiguration'] != null
          ? CustomPluginConfiguration.fromJson(
              json['customPluginConfiguration'] as Map<String, dynamic>)
          : null,
      displayName: json['displayName'] as String?,
      pluginArn: json['pluginArn'] as String?,
      pluginId: json['pluginId'] as String?,
      serverUrl: json['serverUrl'] as String?,
      state: (json['state'] as String?)?.toPluginState(),
      type: (json['type'] as String?)?.toPluginType(),
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
      if (buildStatus != null) 'buildStatus': buildStatus.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (customPluginConfiguration != null)
        'customPluginConfiguration': customPluginConfiguration,
      if (displayName != null) 'displayName': displayName,
      if (pluginArn != null) 'pluginArn': pluginArn,
      if (pluginId != null) 'pluginId': pluginId,
      if (serverUrl != null) 'serverUrl': serverUrl,
      if (state != null) 'state': state.toValue(),
      if (type != null) 'type': type.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
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
      status: (json['status'] as String?)?.toRetrieverStatus(),
      type: (json['type'] as String?)?.toRetrieverType(),
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
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
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
          ?.whereNotNull()
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

class GetWebExperienceResponse {
  /// The identifier of the Amazon Q Business application linked to the web
  /// experience.
  final String? applicationId;

  /// The authentication configuration information for your Amazon Q Business web
  /// experience.
  final WebExperienceAuthConfiguration? authenticationConfiguration;

  /// The Unix timestamp when the Amazon Q Business web experience was last
  /// created.
  final DateTime? createdAt;

  /// The endpoint of your Amazon Q Business web experience.
  final String? defaultEndpoint;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the data source connector to fail.
  final ErrorDetail? error;

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
    this.createdAt,
    this.defaultEndpoint,
    this.error,
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
      createdAt: timeStampFromJson(json['createdAt']),
      defaultEndpoint: json['defaultEndpoint'] as String?,
      error: json['error'] != null
          ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
      samplePromptsControlMode: (json['samplePromptsControlMode'] as String?)
          ?.toWebExperienceSamplePromptsControlMode(),
      status: (json['status'] as String?)?.toWebExperienceStatus(),
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
    final createdAt = this.createdAt;
    final defaultEndpoint = this.defaultEndpoint;
    final error = this.error;
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
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (defaultEndpoint != null) 'defaultEndpoint': defaultEndpoint,
      if (error != null) 'error': error,
      if (roleArn != null) 'roleArn': roleArn,
      if (samplePromptsControlMode != null)
        'samplePromptsControlMode': samplePromptsControlMode.toValue(),
      if (status != null) 'status': status.toValue(),
      if (subtitle != null) 'subtitle': subtitle,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (webExperienceArn != null) 'webExperienceArn': webExperienceArn,
      if (webExperienceId != null) 'webExperienceId': webExperienceId,
      if (welcomeMessage != null) 'welcomeMessage': welcomeMessage,
    };
  }
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

  GroupMembers({
    this.memberGroups,
    this.memberUsers,
  });

  Map<String, dynamic> toJson() {
    final memberGroups = this.memberGroups;
    final memberUsers = this.memberUsers;
    return {
      if (memberGroups != null) 'memberGroups': memberGroups,
      if (memberUsers != null) 'memberUsers': memberUsers,
    };
  }
}

enum GroupStatus {
  failed,
  succeeded,
  processing,
  deleting,
  deleted,
}

extension GroupStatusValueExtension on GroupStatus {
  String toValue() {
    switch (this) {
      case GroupStatus.failed:
        return 'FAILED';
      case GroupStatus.succeeded:
        return 'SUCCEEDED';
      case GroupStatus.processing:
        return 'PROCESSING';
      case GroupStatus.deleting:
        return 'DELETING';
      case GroupStatus.deleted:
        return 'DELETED';
    }
  }
}

extension GroupStatusFromString on String {
  GroupStatus toGroupStatus() {
    switch (this) {
      case 'FAILED':
        return GroupStatus.failed;
      case 'SUCCEEDED':
        return GroupStatus.succeeded;
      case 'PROCESSING':
        return GroupStatus.processing;
      case 'DELETING':
        return GroupStatus.deleting;
      case 'DELETED':
        return GroupStatus.deleted;
    }
    throw Exception('$this is not known in enum GroupStatus');
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
      status: (json['status'] as String?)?.toGroupStatus(),
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
      if (status != null) 'status': status.toValue(),
    };
  }
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

  /// The Amazon Resource Name (ARN) of a role with permission to run a Lambda
  /// function during ingestion. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/iam-roles.html#cde-iam-role">IAM
  /// roles for Custom Document Enrichment (CDE)</a>.
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
      status: (json['status'] as String?)?.toIndexStatus(),
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
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
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

enum IndexStatus {
  creating,
  active,
  deleting,
  failed,
  updating,
}

extension IndexStatusValueExtension on IndexStatus {
  String toValue() {
    switch (this) {
      case IndexStatus.creating:
        return 'CREATING';
      case IndexStatus.active:
        return 'ACTIVE';
      case IndexStatus.deleting:
        return 'DELETING';
      case IndexStatus.failed:
        return 'FAILED';
      case IndexStatus.updating:
        return 'UPDATING';
    }
  }
}

extension IndexStatusFromString on String {
  IndexStatus toIndexStatus() {
    switch (this) {
      case 'CREATING':
        return IndexStatus.creating;
      case 'ACTIVE':
        return IndexStatus.active;
      case 'DELETING':
        return IndexStatus.deleting;
      case 'FAILED':
        return IndexStatus.failed;
      case 'UPDATING':
        return IndexStatus.updating;
    }
    throw Exception('$this is not known in enum IndexStatus');
  }
}

enum IndexType {
  enterprise,
  starter,
}

extension IndexTypeValueExtension on IndexType {
  String toValue() {
    switch (this) {
      case IndexType.enterprise:
        return 'ENTERPRISE';
      case IndexType.starter:
        return 'STARTER';
    }
  }
}

extension IndexTypeFromString on String {
  IndexType toIndexType() {
    switch (this) {
      case 'ENTERPRISE':
        return IndexType.enterprise;
      case 'STARTER':
        return IndexType.starter;
    }
    throw Exception('$this is not known in enum IndexType');
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
          ?.toDocumentContentOperator(),
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
        'documentContentOperator': documentContentOperator.toValue(),
      if (target != null) 'target': target,
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
      indexId: json['indexId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final indexId = this.indexId;
    return {
      'indexId': indexId,
    };
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum MemberRelation {
  and,
  or,
}

extension MemberRelationValueExtension on MemberRelation {
  String toValue() {
    switch (this) {
      case MemberRelation.and:
        return 'AND';
      case MemberRelation.or:
        return 'OR';
    }
  }
}

extension MemberRelationFromString on String {
  MemberRelation toMemberRelation() {
    switch (this) {
      case 'AND':
        return MemberRelation.and;
      case 'OR':
        return MemberRelation.or;
    }
    throw Exception('$this is not known in enum MemberRelation');
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
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum MembershipType {
  $index,
  datasource,
}

extension MembershipTypeValueExtension on MembershipType {
  String toValue() {
    switch (this) {
      case MembershipType.$index:
        return 'INDEX';
      case MembershipType.datasource:
        return 'DATASOURCE';
    }
  }
}

extension MembershipTypeFromString on String {
  MembershipType toMembershipType() {
    switch (this) {
      case 'INDEX':
        return MembershipType.$index;
      case 'DATASOURCE':
        return MembershipType.datasource;
    }
    throw Exception('$this is not known in enum MembershipType');
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
          ?.whereNotNull()
          .map((e) => AttachmentOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      body: json['body'] as String?,
      messageId: json['messageId'] as String?,
      sourceAttribution: (json['sourceAttribution'] as List?)
          ?.whereNotNull()
          .map((e) => SourceAttribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: timeStampFromJson(json['time']),
      type: (json['type'] as String?)?.toMessageType(),
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
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum MessageType {
  user,
  system,
}

extension MessageTypeValueExtension on MessageType {
  String toValue() {
    switch (this) {
      case MessageType.user:
        return 'USER';
      case MessageType.system:
        return 'SYSTEM';
    }
  }
}

extension MessageTypeFromString on String {
  MessageType toMessageType() {
    switch (this) {
      case 'USER':
        return MessageType.user;
      case 'SYSTEM':
        return MessageType.system;
    }
    throw Exception('$this is not known in enum MessageType');
  }
}

enum MessageUsefulness {
  useful,
  notUseful,
}

extension MessageUsefulnessValueExtension on MessageUsefulness {
  String toValue() {
    switch (this) {
      case MessageUsefulness.useful:
        return 'USEFUL';
      case MessageUsefulness.notUseful:
        return 'NOT_USEFUL';
    }
  }
}

extension MessageUsefulnessFromString on String {
  MessageUsefulness toMessageUsefulness() {
    switch (this) {
      case 'USEFUL':
        return MessageUsefulness.useful;
      case 'NOT_USEFUL':
        return MessageUsefulness.notUseful;
    }
    throw Exception('$this is not known in enum MessageUsefulness');
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
      'usefulness': usefulness.toValue(),
      if (comment != null) 'comment': comment,
      if (reason != null) 'reason': reason.toValue(),
    };
  }
}

enum MessageUsefulnessReason {
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
  other,
}

extension MessageUsefulnessReasonValueExtension on MessageUsefulnessReason {
  String toValue() {
    switch (this) {
      case MessageUsefulnessReason.notFactuallyCorrect:
        return 'NOT_FACTUALLY_CORRECT';
      case MessageUsefulnessReason.harmfulOrUnsafe:
        return 'HARMFUL_OR_UNSAFE';
      case MessageUsefulnessReason.incorrectOrMissingSources:
        return 'INCORRECT_OR_MISSING_SOURCES';
      case MessageUsefulnessReason.notHelpful:
        return 'NOT_HELPFUL';
      case MessageUsefulnessReason.factuallyCorrect:
        return 'FACTUALLY_CORRECT';
      case MessageUsefulnessReason.complete:
        return 'COMPLETE';
      case MessageUsefulnessReason.relevantSources:
        return 'RELEVANT_SOURCES';
      case MessageUsefulnessReason.helpful:
        return 'HELPFUL';
      case MessageUsefulnessReason.notBasedOnDocuments:
        return 'NOT_BASED_ON_DOCUMENTS';
      case MessageUsefulnessReason.notComplete:
        return 'NOT_COMPLETE';
      case MessageUsefulnessReason.notConcise:
        return 'NOT_CONCISE';
      case MessageUsefulnessReason.other:
        return 'OTHER';
    }
  }
}

extension MessageUsefulnessReasonFromString on String {
  MessageUsefulnessReason toMessageUsefulnessReason() {
    switch (this) {
      case 'NOT_FACTUALLY_CORRECT':
        return MessageUsefulnessReason.notFactuallyCorrect;
      case 'HARMFUL_OR_UNSAFE':
        return MessageUsefulnessReason.harmfulOrUnsafe;
      case 'INCORRECT_OR_MISSING_SOURCES':
        return MessageUsefulnessReason.incorrectOrMissingSources;
      case 'NOT_HELPFUL':
        return MessageUsefulnessReason.notHelpful;
      case 'FACTUALLY_CORRECT':
        return MessageUsefulnessReason.factuallyCorrect;
      case 'COMPLETE':
        return MessageUsefulnessReason.complete;
      case 'RELEVANT_SOURCES':
        return MessageUsefulnessReason.relevantSources;
      case 'HELPFUL':
        return MessageUsefulnessReason.helpful;
      case 'NOT_BASED_ON_DOCUMENTS':
        return MessageUsefulnessReason.notBasedOnDocuments;
      case 'NOT_COMPLETE':
        return MessageUsefulnessReason.notComplete;
      case 'NOT_CONCISE':
        return MessageUsefulnessReason.notConcise;
      case 'OTHER':
        return MessageUsefulnessReason.other;
    }
    throw Exception('$this is not known in enum MessageUsefulnessReason');
  }
}

/// Configuration information for an Amazon Q Business index.
class NativeIndexConfiguration {
  /// The identifier for the Amazon Q Business index.
  final String indexId;

  /// Overrides the default boosts applied by Amazon Q Business to supported
  /// document attribute data types.
  final Map<String, DocumentAttributeBoostingConfiguration>? boostingOverride;

  NativeIndexConfiguration({
    required this.indexId,
    this.boostingOverride,
  });

  factory NativeIndexConfiguration.fromJson(Map<String, dynamic> json) {
    return NativeIndexConfiguration(
      indexId: json['indexId'] as String,
      boostingOverride: (json['boostingOverride'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              DocumentAttributeBoostingConfiguration.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final indexId = this.indexId;
    final boostingOverride = this.boostingOverride;
    return {
      'indexId': indexId,
      if (boostingOverride != null) 'boostingOverride': boostingOverride,
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

/// Provides information on boosting <code>NUMBER</code> type document
/// attributes.
///
/// For more information on how boosting document attributes work in Amazon Q
/// Business, see <a
/// href="https://docs.aws.amazon.com/amazonq/latest/business-use-dg/metadata-boosting.html">Boosting
/// using document attributes</a>.
class NumberAttributeBoostingConfiguration {
  /// Specifies the duration, in seconds, of a boost applies to a
  /// <code>NUMBER</code> type document attribute.
  final DocumentAttributeBoostingLevel boostingLevel;

  /// Specifies how much a document attribute is boosted.
  final NumberAttributeBoostingType? boostingType;

  NumberAttributeBoostingConfiguration({
    required this.boostingLevel,
    this.boostingType,
  });

  factory NumberAttributeBoostingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return NumberAttributeBoostingConfiguration(
      boostingLevel:
          (json['boostingLevel'] as String).toDocumentAttributeBoostingLevel(),
      boostingType:
          (json['boostingType'] as String?)?.toNumberAttributeBoostingType(),
    );
  }

  Map<String, dynamic> toJson() {
    final boostingLevel = this.boostingLevel;
    final boostingType = this.boostingType;
    return {
      'boostingLevel': boostingLevel.toValue(),
      if (boostingType != null) 'boostingType': boostingType.toValue(),
    };
  }
}

enum NumberAttributeBoostingType {
  prioritizeLargerValues,
  prioritizeSmallerValues,
}

extension NumberAttributeBoostingTypeValueExtension
    on NumberAttributeBoostingType {
  String toValue() {
    switch (this) {
      case NumberAttributeBoostingType.prioritizeLargerValues:
        return 'PRIORITIZE_LARGER_VALUES';
      case NumberAttributeBoostingType.prioritizeSmallerValues:
        return 'PRIORITIZE_SMALLER_VALUES';
    }
  }
}

extension NumberAttributeBoostingTypeFromString on String {
  NumberAttributeBoostingType toNumberAttributeBoostingType() {
    switch (this) {
      case 'PRIORITIZE_LARGER_VALUES':
        return NumberAttributeBoostingType.prioritizeLargerValues;
      case 'PRIORITIZE_SMALLER_VALUES':
        return NumberAttributeBoostingType.prioritizeSmallerValues;
    }
    throw Exception('$this is not known in enum NumberAttributeBoostingType');
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

  OAuth2ClientCredentialConfiguration({
    required this.roleArn,
    required this.secretArn,
  });

  factory OAuth2ClientCredentialConfiguration.fromJson(
      Map<String, dynamic> json) {
    return OAuth2ClientCredentialConfiguration(
      roleArn: json['roleArn'] as String,
      secretArn: json['secretArn'] as String,
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
      buildStatus: (json['buildStatus'] as String?)?.toPluginBuildStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      pluginId: json['pluginId'] as String?,
      serverUrl: json['serverUrl'] as String?,
      state: (json['state'] as String?)?.toPluginState(),
      type: (json['type'] as String?)?.toPluginType(),
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
      if (buildStatus != null) 'buildStatus': buildStatus.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (pluginId != null) 'pluginId': pluginId,
      if (serverUrl != null) 'serverUrl': serverUrl,
      if (state != null) 'state': state.toValue(),
      if (type != null) 'type': type.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Authentication configuration information for an Amazon Q Business plugin.
class PluginAuthConfiguration {
  /// Information about the basic authentication credentials used to configure a
  /// plugin.
  final BasicAuthConfiguration? basicAuthConfiguration;

  /// Information about invoking a custom plugin without any authentication.
  final NoAuthConfiguration? noAuthConfiguration;

  /// Information about the OAuth 2.0 authentication credential/token used to
  /// configure a plugin.
  final OAuth2ClientCredentialConfiguration?
      oAuth2ClientCredentialConfiguration;

  PluginAuthConfiguration({
    this.basicAuthConfiguration,
    this.noAuthConfiguration,
    this.oAuth2ClientCredentialConfiguration,
  });

  factory PluginAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return PluginAuthConfiguration(
      basicAuthConfiguration: json['basicAuthConfiguration'] != null
          ? BasicAuthConfiguration.fromJson(
              json['basicAuthConfiguration'] as Map<String, dynamic>)
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
    final noAuthConfiguration = this.noAuthConfiguration;
    final oAuth2ClientCredentialConfiguration =
        this.oAuth2ClientCredentialConfiguration;
    return {
      if (basicAuthConfiguration != null)
        'basicAuthConfiguration': basicAuthConfiguration,
      if (noAuthConfiguration != null)
        'noAuthConfiguration': noAuthConfiguration,
      if (oAuth2ClientCredentialConfiguration != null)
        'oAuth2ClientCredentialConfiguration':
            oAuth2ClientCredentialConfiguration,
    };
  }
}

enum PluginBuildStatus {
  ready,
  createInProgress,
  createFailed,
  updateInProgress,
  updateFailed,
  deleteInProgress,
  deleteFailed,
}

extension PluginBuildStatusValueExtension on PluginBuildStatus {
  String toValue() {
    switch (this) {
      case PluginBuildStatus.ready:
        return 'READY';
      case PluginBuildStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case PluginBuildStatus.createFailed:
        return 'CREATE_FAILED';
      case PluginBuildStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case PluginBuildStatus.updateFailed:
        return 'UPDATE_FAILED';
      case PluginBuildStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case PluginBuildStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension PluginBuildStatusFromString on String {
  PluginBuildStatus toPluginBuildStatus() {
    switch (this) {
      case 'READY':
        return PluginBuildStatus.ready;
      case 'CREATE_IN_PROGRESS':
        return PluginBuildStatus.createInProgress;
      case 'CREATE_FAILED':
        return PluginBuildStatus.createFailed;
      case 'UPDATE_IN_PROGRESS':
        return PluginBuildStatus.updateInProgress;
      case 'UPDATE_FAILED':
        return PluginBuildStatus.updateFailed;
      case 'DELETE_IN_PROGRESS':
        return PluginBuildStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return PluginBuildStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum PluginBuildStatus');
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

enum PluginState {
  enabled,
  disabled,
}

extension PluginStateValueExtension on PluginState {
  String toValue() {
    switch (this) {
      case PluginState.enabled:
        return 'ENABLED';
      case PluginState.disabled:
        return 'DISABLED';
    }
  }
}

extension PluginStateFromString on String {
  PluginState toPluginState() {
    switch (this) {
      case 'ENABLED':
        return PluginState.enabled;
      case 'DISABLED':
        return PluginState.disabled;
    }
    throw Exception('$this is not known in enum PluginState');
  }
}

enum PluginType {
  serviceNow,
  salesforce,
  jira,
  zendesk,
  custom,
}

extension PluginTypeValueExtension on PluginType {
  String toValue() {
    switch (this) {
      case PluginType.serviceNow:
        return 'SERVICE_NOW';
      case PluginType.salesforce:
        return 'SALESFORCE';
      case PluginType.jira:
        return 'JIRA';
      case PluginType.zendesk:
        return 'ZENDESK';
      case PluginType.custom:
        return 'CUSTOM';
    }
  }
}

extension PluginTypeFromString on String {
  PluginType toPluginType() {
    switch (this) {
      case 'SERVICE_NOW':
        return PluginType.serviceNow;
      case 'SALESFORCE':
        return PluginType.salesforce;
      case 'JIRA':
        return PluginType.jira;
      case 'ZENDESK':
        return PluginType.zendesk;
      case 'CUSTOM':
        return PluginType.custom;
    }
    throw Exception('$this is not known in enum PluginType');
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
      'access': access.toValue(),
      if (membershipType != null) 'membershipType': membershipType.toValue(),
      if (name != null) 'name': name,
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
      'access': access.toValue(),
      if (id != null) 'id': id,
      if (membershipType != null) 'membershipType': membershipType.toValue(),
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

enum ReadAccessType {
  allow,
  deny,
}

extension ReadAccessTypeValueExtension on ReadAccessType {
  String toValue() {
    switch (this) {
      case ReadAccessType.allow:
        return 'ALLOW';
      case ReadAccessType.deny:
        return 'DENY';
    }
  }
}

extension ReadAccessTypeFromString on String {
  ReadAccessType toReadAccessType() {
    switch (this) {
      case 'ALLOW':
        return ReadAccessType.allow;
      case 'DENY':
        return ReadAccessType.deny;
    }
    throw Exception('$this is not known in enum ReadAccessType');
  }
}

enum ResponseScope {
  enterpriseContentOnly,
  extendedKnowledgeEnabled,
}

extension ResponseScopeValueExtension on ResponseScope {
  String toValue() {
    switch (this) {
      case ResponseScope.enterpriseContentOnly:
        return 'ENTERPRISE_CONTENT_ONLY';
      case ResponseScope.extendedKnowledgeEnabled:
        return 'EXTENDED_KNOWLEDGE_ENABLED';
    }
  }
}

extension ResponseScopeFromString on String {
  ResponseScope toResponseScope() {
    switch (this) {
      case 'ENTERPRISE_CONTENT_ONLY':
        return ResponseScope.enterpriseContentOnly;
      case 'EXTENDED_KNOWLEDGE_ENABLED':
        return ResponseScope.extendedKnowledgeEnabled;
    }
    throw Exception('$this is not known in enum ResponseScope');
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
      status: (json['status'] as String?)?.toRetrieverStatus(),
      type: (json['type'] as String?)?.toRetrieverType(),
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
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
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

enum RetrieverStatus {
  creating,
  active,
  failed,
}

extension RetrieverStatusValueExtension on RetrieverStatus {
  String toValue() {
    switch (this) {
      case RetrieverStatus.creating:
        return 'CREATING';
      case RetrieverStatus.active:
        return 'ACTIVE';
      case RetrieverStatus.failed:
        return 'FAILED';
    }
  }
}

extension RetrieverStatusFromString on String {
  RetrieverStatus toRetrieverStatus() {
    switch (this) {
      case 'CREATING':
        return RetrieverStatus.creating;
      case 'ACTIVE':
        return RetrieverStatus.active;
      case 'FAILED':
        return RetrieverStatus.failed;
    }
    throw Exception('$this is not known in enum RetrieverStatus');
  }
}

enum RetrieverType {
  nativeIndex,
  kendraIndex,
}

extension RetrieverTypeValueExtension on RetrieverType {
  String toValue() {
    switch (this) {
      case RetrieverType.nativeIndex:
        return 'NATIVE_INDEX';
      case RetrieverType.kendraIndex:
        return 'KENDRA_INDEX';
    }
  }
}

extension RetrieverTypeFromString on String {
  RetrieverType toRetrieverType() {
    switch (this) {
      case 'NATIVE_INDEX':
        return RetrieverType.nativeIndex;
      case 'KENDRA_INDEX':
        return RetrieverType.kendraIndex;
    }
    throw Exception('$this is not known in enum RetrieverType');
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
      ruleType: (json['ruleType'] as String).toRuleType(),
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
      'ruleType': ruleType.toValue(),
      if (excludedUsersAndGroups != null)
        'excludedUsersAndGroups': excludedUsersAndGroups,
      if (includedUsersAndGroups != null)
        'includedUsersAndGroups': includedUsersAndGroups,
      if (ruleConfiguration != null) 'ruleConfiguration': ruleConfiguration,
    };
  }
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

enum RuleType {
  contentBlockerRule,
  contentRetrievalRule,
}

extension RuleTypeValueExtension on RuleType {
  String toValue() {
    switch (this) {
      case RuleType.contentBlockerRule:
        return 'CONTENT_BLOCKER_RULE';
      case RuleType.contentRetrievalRule:
        return 'CONTENT_RETRIEVAL_RULE';
    }
  }
}

extension RuleTypeFromString on String {
  RuleType toRuleType() {
    switch (this) {
      case 'CONTENT_BLOCKER_RULE':
        return RuleType.contentBlockerRule;
      case 'CONTENT_RETRIEVAL_RULE':
        return RuleType.contentRetrievalRule;
    }
    throw Exception('$this is not known in enum RuleType');
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
      bucket: json['bucket'] as String,
      key: json['key'] as String,
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
      metadataXML: json['metadataXML'] as String,
      roleArn: json['roleArn'] as String,
      userIdAttribute: json['userIdAttribute'] as String,
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

/// The documents used to generate an Amazon Q Business web experience response.
class SourceAttribution {
  /// The number attached to a citation in an Amazon Q Business generated
  /// response.
  final int? citationNumber;

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
    this.snippet,
    this.textMessageSegments,
    this.title,
    this.updatedAt,
    this.url,
  });

  factory SourceAttribution.fromJson(Map<String, dynamic> json) {
    return SourceAttribution(
      citationNumber: json['citationNumber'] as int?,
      snippet: json['snippet'] as String?,
      textMessageSegments: (json['textMessageSegments'] as List?)
          ?.whereNotNull()
          .map((e) => TextSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final citationNumber = this.citationNumber;
    final snippet = this.snippet;
    final textMessageSegments = this.textMessageSegments;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final url = this.url;
    return {
      if (citationNumber != null) 'citationNumber': citationNumber,
      if (snippet != null) 'snippet': snippet,
      if (textMessageSegments != null)
        'textMessageSegments': textMessageSegments,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (url != null) 'url': url,
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

enum Status {
  enabled,
  disabled,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.enabled:
        return 'ENABLED';
      case Status.disabled:
        return 'DISABLED';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'ENABLED':
        return Status.enabled;
      case 'DISABLED':
        return Status.disabled;
    }
    throw Exception('$this is not known in enum Status');
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
  /// Specifies how much a document attribute is boosted.
  final DocumentAttributeBoostingLevel boostingLevel;

  /// Specifies specific values of a <code>STRING</code> type document attribute
  /// being boosted.
  final Map<String, StringAttributeValueBoostingLevel>? attributeValueBoosting;

  StringAttributeBoostingConfiguration({
    required this.boostingLevel,
    this.attributeValueBoosting,
  });

  factory StringAttributeBoostingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return StringAttributeBoostingConfiguration(
      boostingLevel:
          (json['boostingLevel'] as String).toDocumentAttributeBoostingLevel(),
      attributeValueBoosting: (json['attributeValueBoosting']
              as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, (e as String).toStringAttributeValueBoostingLevel())),
    );
  }

  Map<String, dynamic> toJson() {
    final boostingLevel = this.boostingLevel;
    final attributeValueBoosting = this.attributeValueBoosting;
    return {
      'boostingLevel': boostingLevel.toValue(),
      if (attributeValueBoosting != null)
        'attributeValueBoosting':
            attributeValueBoosting.map((k, e) => MapEntry(k, e.toValue())),
    };
  }
}

enum StringAttributeValueBoostingLevel {
  low,
  medium,
  high,
  veryHigh,
}

extension StringAttributeValueBoostingLevelValueExtension
    on StringAttributeValueBoostingLevel {
  String toValue() {
    switch (this) {
      case StringAttributeValueBoostingLevel.low:
        return 'LOW';
      case StringAttributeValueBoostingLevel.medium:
        return 'MEDIUM';
      case StringAttributeValueBoostingLevel.high:
        return 'HIGH';
      case StringAttributeValueBoostingLevel.veryHigh:
        return 'VERY_HIGH';
    }
  }
}

extension StringAttributeValueBoostingLevelFromString on String {
  StringAttributeValueBoostingLevel toStringAttributeValueBoostingLevel() {
    switch (this) {
      case 'LOW':
        return StringAttributeValueBoostingLevel.low;
      case 'MEDIUM':
        return StringAttributeValueBoostingLevel.medium;
      case 'HIGH':
        return StringAttributeValueBoostingLevel.high;
      case 'VERY_HIGH':
        return StringAttributeValueBoostingLevel.veryHigh;
    }
    throw Exception(
        '$this is not known in enum StringAttributeValueBoostingLevel');
  }
}

/// Provides information on boosting <code>STRING_LIST</code> type document
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
class StringListAttributeBoostingConfiguration {
  /// Specifies how much a document attribute is boosted.
  final DocumentAttributeBoostingLevel boostingLevel;

  StringListAttributeBoostingConfiguration({
    required this.boostingLevel,
  });

  factory StringListAttributeBoostingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return StringListAttributeBoostingConfiguration(
      boostingLevel:
          (json['boostingLevel'] as String).toDocumentAttributeBoostingLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final boostingLevel = this.boostingLevel;
    return {
      'boostingLevel': boostingLevel.toValue(),
    };
  }
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
      key: json['key'] as String,
      value: json['value'] as String,
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

/// Provides information about a text extract in a chat response that can be
/// attributed to a source document.
class TextSegment {
  /// The zero-based location in the response string where the source attribution
  /// starts.
  final int? beginOffset;

  /// The zero-based location in the response string where the source attribution
  /// ends.
  final int? endOffset;

  /// The relevant text excerpt from a source that was used to generate a citation
  /// text segment in an Amazon Q Business chat response.
  final SnippetExcerpt? snippetExcerpt;

  TextSegment({
    this.beginOffset,
    this.endOffset,
    this.snippetExcerpt,
  });

  factory TextSegment.fromJson(Map<String, dynamic> json) {
    return TextSegment(
      beginOffset: json['beginOffset'] as int?,
      endOffset: json['endOffset'] as int?,
      snippetExcerpt: json['snippetExcerpt'] != null
          ? SnippetExcerpt.fromJson(
              json['snippetExcerpt'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final endOffset = this.endOffset;
    final snippetExcerpt = this.snippetExcerpt;
    return {
      if (beginOffset != null) 'beginOffset': beginOffset,
      if (endOffset != null) 'endOffset': endOffset,
      if (snippetExcerpt != null) 'snippetExcerpt': snippetExcerpt,
    };
  }
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
      name: json['name'] as String,
      rules: (json['rules'] as List)
          .whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      exampleChatMessages: (json['exampleChatMessages'] as List?)
          ?.whereNotNull()
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UpdateDataSourceResponse {
  UpdateDataSourceResponse();

  factory UpdateDataSourceResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDataSourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UpdatePluginResponse {
  UpdatePluginResponse();

  factory UpdatePluginResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePluginResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
          ?.whereNotNull()
          .map((e) => UserAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      userAliasesDeleted: (json['userAliasesDeleted'] as List?)
          ?.whereNotNull()
          .map((e) => UserAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      userAliasesUpdated: (json['userAliasesUpdated'] as List?)
          ?.whereNotNull()
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

class UpdateWebExperienceResponse {
  UpdateWebExperienceResponse();

  factory UpdateWebExperienceResponse.fromJson(Map<String, dynamic> _) {
    return UpdateWebExperienceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
      userId: json['userId'] as String,
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

/// Provides information about users and groups associated with a topic control
/// rule.
class UsersAndGroups {
  /// The user groups associated with a topic control rule.
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      userIds: (json['userIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
      status: (json['status'] as String?)?.toWebExperienceStatus(),
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
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (webExperienceId != null) 'webExperienceId': webExperienceId,
    };
  }
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

enum WebExperienceSamplePromptsControlMode {
  enabled,
  disabled,
}

extension WebExperienceSamplePromptsControlModeValueExtension
    on WebExperienceSamplePromptsControlMode {
  String toValue() {
    switch (this) {
      case WebExperienceSamplePromptsControlMode.enabled:
        return 'ENABLED';
      case WebExperienceSamplePromptsControlMode.disabled:
        return 'DISABLED';
    }
  }
}

extension WebExperienceSamplePromptsControlModeFromString on String {
  WebExperienceSamplePromptsControlMode
      toWebExperienceSamplePromptsControlMode() {
    switch (this) {
      case 'ENABLED':
        return WebExperienceSamplePromptsControlMode.enabled;
      case 'DISABLED':
        return WebExperienceSamplePromptsControlMode.disabled;
    }
    throw Exception(
        '$this is not known in enum WebExperienceSamplePromptsControlMode');
  }
}

enum WebExperienceStatus {
  creating,
  active,
  deleting,
  failed,
  pendingAuthConfig,
}

extension WebExperienceStatusValueExtension on WebExperienceStatus {
  String toValue() {
    switch (this) {
      case WebExperienceStatus.creating:
        return 'CREATING';
      case WebExperienceStatus.active:
        return 'ACTIVE';
      case WebExperienceStatus.deleting:
        return 'DELETING';
      case WebExperienceStatus.failed:
        return 'FAILED';
      case WebExperienceStatus.pendingAuthConfig:
        return 'PENDING_AUTH_CONFIG';
    }
  }
}

extension WebExperienceStatusFromString on String {
  WebExperienceStatus toWebExperienceStatus() {
    switch (this) {
      case 'CREATING':
        return WebExperienceStatus.creating;
      case 'ACTIVE':
        return WebExperienceStatus.active;
      case 'DELETING':
        return WebExperienceStatus.deleting;
      case 'FAILED':
        return WebExperienceStatus.failed;
      case 'PENDING_AUTH_CONFIG':
        return WebExperienceStatus.pendingAuthConfig;
    }
    throw Exception('$this is not known in enum WebExperienceStatus');
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

class LicenseNotFoundException extends _s.GenericAwsException {
  LicenseNotFoundException({String? type, String? message})
      : super(type: type, code: 'LicenseNotFoundException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'LicenseNotFoundException': (type, message) =>
      LicenseNotFoundException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
