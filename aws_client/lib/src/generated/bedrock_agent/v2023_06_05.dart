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

/// Describes the API operations for creating and managing Amazon Bedrock
/// agents.
class AgentsForAmazonBedrock {
  final _s.RestJsonProtocol _protocol;
  AgentsForAmazonBedrock({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'bedrock-agent',
            signingName: 'bedrock',
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

  /// Associates a knowledge base with an agent. If a knowledge base is
  /// associated and its <code>indexState</code> is set to <code>Enabled</code>,
  /// the agent queries the knowledge base for information to augment its
  /// response to the user.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent with which you want to associate the
  /// knowledge base.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent with which you want to associate the knowledge
  /// base.
  ///
  /// Parameter [description] :
  /// A description of what the agent should use the knowledge base for.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base to associate with the agent.
  ///
  /// Parameter [knowledgeBaseState] :
  /// Specifies whether to use the knowledge base or not when sending an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html">InvokeAgent</a>
  /// request.
  Future<AssociateAgentKnowledgeBaseResponse> associateAgentKnowledgeBase({
    required String agentId,
    required String agentVersion,
    required String description,
    required String knowledgeBaseId,
    KnowledgeBaseState? knowledgeBaseState,
  }) async {
    final $payload = <String, dynamic>{
      'description': description,
      'knowledgeBaseId': knowledgeBaseId,
      if (knowledgeBaseState != null)
        'knowledgeBaseState': knowledgeBaseState.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/knowledgebases/',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateAgentKnowledgeBaseResponse.fromJson(response);
  }

  /// Creates an agent that orchestrates interactions between foundation models,
  /// data sources, software applications, user conversations, and APIs to carry
  /// out tasks to help customers.
  ///
  /// <ul>
  /// <li>
  /// Specify the following fields for security purposes.
  ///
  /// <ul>
  /// <li>
  /// <code>agentResourceRoleArn</code> – The Amazon Resource Name (ARN) of the
  /// role with permissions to invoke API operations on an agent.
  /// </li>
  /// <li>
  /// (Optional) <code>customerEncryptionKeyArn</code> – The Amazon Resource
  /// Name (ARN) of a KMS key to encrypt the creation of the agent.
  /// </li>
  /// <li>
  /// (Optional) <code>idleSessionTTLinSeconds</code> – Specify the number of
  /// seconds for which the agent should maintain session information. After
  /// this time expires, the subsequent <code>InvokeAgent</code> request begins
  /// a new session.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// To override the default prompt behavior for agent orchestration and to use
  /// advanced prompts, include a <code>promptOverrideConfiguration</code>
  /// object. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
  /// prompts</a>.
  /// </li>
  /// <li>
  /// If you agent fails to be created, the response returns a list of
  /// <code>failureReasons</code> alongside a list of
  /// <code>recommendedActions</code> for you to troubleshoot.
  /// </li>
  /// </ul>
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [agentName] :
  /// A name for the agent that you create.
  ///
  /// Parameter [agentResourceRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role with permissions to invoke
  /// API operations on the agent.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [customerEncryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key with which to encrypt the
  /// agent.
  ///
  /// Parameter [description] :
  /// A description of the agent.
  ///
  /// Parameter [foundationModel] :
  /// The foundation model to be used for orchestration by the agent you create.
  ///
  /// Parameter [guardrailConfiguration] :
  /// The unique Guardrail configuration assigned to the agent when it is
  /// created.
  ///
  /// Parameter [idleSessionTTLInSeconds] :
  /// The number of seconds for which Amazon Bedrock keeps information about a
  /// user's conversation with the agent.
  ///
  /// A user interaction remains active for the amount of time specified. If no
  /// conversation occurs during this time, the session expires and Amazon
  /// Bedrock deletes any data provided before the timeout.
  ///
  /// Parameter [instruction] :
  /// Instructions that tell the agent what it should do and how it should
  /// interact with users.
  ///
  /// Parameter [promptOverrideConfiguration] :
  /// Contains configurations to override prompts in different parts of an agent
  /// sequence. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
  /// prompts</a>.
  ///
  /// Parameter [tags] :
  /// Any tags that you want to attach to the agent.
  Future<CreateAgentResponse> createAgent({
    required String agentName,
    String? agentResourceRoleArn,
    String? clientToken,
    String? customerEncryptionKeyArn,
    String? description,
    String? foundationModel,
    GuardrailConfiguration? guardrailConfiguration,
    int? idleSessionTTLInSeconds,
    String? instruction,
    PromptOverrideConfiguration? promptOverrideConfiguration,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'idleSessionTTLInSeconds',
      idleSessionTTLInSeconds,
      60,
      3600,
    );
    final $payload = <String, dynamic>{
      'agentName': agentName,
      if (agentResourceRoleArn != null)
        'agentResourceRoleArn': agentResourceRoleArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (description != null) 'description': description,
      if (foundationModel != null) 'foundationModel': foundationModel,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (instruction != null) 'instruction': instruction,
      if (promptOverrideConfiguration != null)
        'promptOverrideConfiguration': promptOverrideConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/agents/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAgentResponse.fromJson(response);
  }

  /// Creates an action group for an agent. An action group represents the
  /// actions that an agent can carry out for the customer by defining the APIs
  /// that an agent can call and the logic for calling them.
  ///
  /// To allow your agent to request the user for additional information when
  /// trying to complete a task, add an action group with the
  /// <code>parentActionGroupSignature</code> field set to
  /// <code>AMAZON.UserInput</code>. You must leave the
  /// <code>description</code>, <code>apiSchema</code>, and
  /// <code>actionGroupExecutor</code> fields blank for this action group.
  /// During orchestration, if your agent determines that it needs to invoke an
  /// API in an action group, but doesn't have enough information to complete
  /// the API request, it will invoke this action group instead and return an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Observation.html">Observation</a>
  /// reprompting the user for more information.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [actionGroupName] :
  /// The name to give the action group.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent for which to create the action group.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent for which to create the action group.
  ///
  /// Parameter [actionGroupExecutor] :
  /// The Amazon Resource Name (ARN) of the Lambda function containing the
  /// business logic that is carried out upon invoking the action or the custom
  /// control method for handling the information elicited from the user.
  ///
  /// Parameter [actionGroupState] :
  /// Specifies whether the action group is available for the agent to invoke or
  /// not when sending an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html">InvokeAgent</a>
  /// request.
  ///
  /// Parameter [apiSchema] :
  /// Contains either details about the S3 object containing the OpenAPI schema
  /// for the action group or the JSON or YAML-formatted payload defining the
  /// schema. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-api-schema.html">Action
  /// group OpenAPI schemas</a>.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [description] :
  /// A description of the action group.
  ///
  /// Parameter [functionSchema] :
  /// Contains details about the function schema for the action group or the
  /// JSON or YAML-formatted payload defining the schema.
  ///
  /// Parameter [parentActionGroupSignature] :
  /// To allow your agent to request the user for additional information when
  /// trying to complete a task, set this field to
  /// <code>AMAZON.UserInput</code>. You must leave the
  /// <code>description</code>, <code>apiSchema</code>, and
  /// <code>actionGroupExecutor</code> fields blank for this action group.
  ///
  /// During orchestration, if your agent determines that it needs to invoke an
  /// API in an action group, but doesn't have enough information to complete
  /// the API request, it will invoke this action group instead and return an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Observation.html">Observation</a>
  /// reprompting the user for more information.
  Future<CreateAgentActionGroupResponse> createAgentActionGroup({
    required String actionGroupName,
    required String agentId,
    required String agentVersion,
    ActionGroupExecutor? actionGroupExecutor,
    ActionGroupState? actionGroupState,
    APISchema? apiSchema,
    String? clientToken,
    String? description,
    FunctionSchema? functionSchema,
    ActionGroupSignature? parentActionGroupSignature,
  }) async {
    final $payload = <String, dynamic>{
      'actionGroupName': actionGroupName,
      if (actionGroupExecutor != null)
        'actionGroupExecutor': actionGroupExecutor,
      if (actionGroupState != null)
        'actionGroupState': actionGroupState.toValue(),
      if (apiSchema != null) 'apiSchema': apiSchema,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (functionSchema != null) 'functionSchema': functionSchema,
      if (parentActionGroupSignature != null)
        'parentActionGroupSignature': parentActionGroupSignature.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/actiongroups/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAgentActionGroupResponse.fromJson(response);
  }

  /// Creates an alias of an agent that can be used to deploy the agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [agentAliasName] :
  /// The name of the alias.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [description] :
  /// A description of the alias of the agent.
  ///
  /// Parameter [routingConfiguration] :
  /// Contains details about the routing configuration of the alias.
  ///
  /// Parameter [tags] :
  /// Any tags that you want to attach to the alias of the agent.
  Future<CreateAgentAliasResponse> createAgentAlias({
    required String agentAliasName,
    required String agentId,
    String? clientToken,
    String? description,
    List<AgentAliasRoutingConfigurationListItem>? routingConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'agentAliasName': agentAliasName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (routingConfiguration != null)
        'routingConfiguration': routingConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/agents/${Uri.encodeComponent(agentId)}/agentaliases/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAgentAliasResponse.fromJson(response);
  }

  /// Sets up a data source to be added to a knowledge base.
  /// <important>
  /// You can't change the <code>chunkingConfiguration</code> after you create
  /// the data source.
  /// </important>
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [dataSourceConfiguration] :
  /// Contains metadata about where the data source is stored.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base to which to add the data
  /// source.
  ///
  /// Parameter [name] :
  /// The name of the data source.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [dataDeletionPolicy] :
  /// The data deletion policy assigned to the data source.
  ///
  /// Parameter [description] :
  /// A description of the data source.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// Contains details about the server-side encryption for the data source.
  ///
  /// Parameter [vectorIngestionConfiguration] :
  /// Contains details about how to ingest the documents in the data source.
  Future<CreateDataSourceResponse> createDataSource({
    required DataSourceConfiguration dataSourceConfiguration,
    required String knowledgeBaseId,
    required String name,
    String? clientToken,
    DataDeletionPolicy? dataDeletionPolicy,
    String? description,
    ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration,
    VectorIngestionConfiguration? vectorIngestionConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'dataSourceConfiguration': dataSourceConfiguration,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dataDeletionPolicy != null)
        'dataDeletionPolicy': dataDeletionPolicy.toValue(),
      if (description != null) 'description': description,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (vectorIngestionConfiguration != null)
        'vectorIngestionConfiguration': vectorIngestionConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataSourceResponse.fromJson(response);
  }

  /// Creates a knowledge base that contains data sources from which information
  /// can be queried and used by LLMs. To create a knowledge base, you must
  /// first set up your data sources and configure a supported vector store. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup.html">Set
  /// up your data for ingestion</a>.
  /// <note>
  /// If you prefer to let Amazon Bedrock create and manage a vector store for
  /// you in Amazon OpenSearch Service, use the console. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-create">Create
  /// a knowledge base</a>.
  /// </note>
  /// <ul>
  /// <li>
  /// Provide the <code>name</code> and an optional <code>description</code>.
  /// </li>
  /// <li>
  /// Provide the Amazon Resource Name (ARN) with permissions to create a
  /// knowledge base in the <code>roleArn</code> field.
  /// </li>
  /// <li>
  /// Provide the embedding model to use in the <code>embeddingModelArn</code>
  /// field in the <code>knowledgeBaseConfiguration</code> object.
  /// </li>
  /// <li>
  /// Provide the configuration for your vector store in the
  /// <code>storageConfiguration</code> object.
  ///
  /// <ul>
  /// <li>
  /// For an Amazon OpenSearch Service database, use the
  /// <code>opensearchServerlessConfiguration</code> object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-oss.html">Create
  /// a vector store in Amazon OpenSearch Service</a>.
  /// </li>
  /// <li>
  /// For an Amazon Aurora database, use the <code>RdsConfiguration</code>
  /// object. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-rds.html">Create
  /// a vector store in Amazon Aurora</a>.
  /// </li>
  /// <li>
  /// For a Pinecone database, use the <code>pineconeConfiguration</code>
  /// object. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-pinecone.html">Create
  /// a vector store in Pinecone</a>.
  /// </li>
  /// <li>
  /// For a Redis Enterprise Cloud database, use the
  /// <code>redisEnterpriseCloudConfiguration</code> object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-redis.html">Create
  /// a vector store in Redis Enterprise Cloud</a>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [knowledgeBaseConfiguration] :
  /// Contains details about the embeddings model used for the knowledge base.
  ///
  /// Parameter [name] :
  /// A name for the knowledge base.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role with permissions to invoke
  /// API operations on the knowledge base.
  ///
  /// Parameter [storageConfiguration] :
  /// Contains details about the configuration of the vector database used for
  /// the knowledge base.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [description] :
  /// A description of the knowledge base.
  ///
  /// Parameter [tags] :
  /// Specify the key-value pairs for the tags that you want to attach to your
  /// knowledge base in this object.
  Future<CreateKnowledgeBaseResponse> createKnowledgeBase({
    required KnowledgeBaseConfiguration knowledgeBaseConfiguration,
    required String name,
    required String roleArn,
    required StorageConfiguration storageConfiguration,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'knowledgeBaseConfiguration': knowledgeBaseConfiguration,
      'name': name,
      'roleArn': roleArn,
      'storageConfiguration': storageConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/knowledgebases/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKnowledgeBaseResponse.fromJson(response);
  }

  /// Deletes an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent to delete.
  ///
  /// Parameter [skipResourceInUseCheck] :
  /// By default, this value is <code>false</code> and deletion is stopped if
  /// the resource is in use. If you set it to <code>true</code>, the resource
  /// will be deleted even if the resource is in use.
  Future<DeleteAgentResponse> deleteAgent({
    required String agentId,
    bool? skipResourceInUseCheck,
  }) async {
    final $query = <String, List<String>>{
      if (skipResourceInUseCheck != null)
        'skipResourceInUseCheck': [skipResourceInUseCheck.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/agents/${Uri.encodeComponent(agentId)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAgentResponse.fromJson(response);
  }

  /// Deletes an action group in an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [actionGroupId] :
  /// The unique identifier of the action group to delete.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent that the action group belongs to.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent that the action group belongs to.
  ///
  /// Parameter [skipResourceInUseCheck] :
  /// By default, this value is <code>false</code> and deletion is stopped if
  /// the resource is in use. If you set it to <code>true</code>, the resource
  /// will be deleted even if the resource is in use.
  Future<void> deleteAgentActionGroup({
    required String actionGroupId,
    required String agentId,
    required String agentVersion,
    bool? skipResourceInUseCheck,
  }) async {
    final $query = <String, List<String>>{
      if (skipResourceInUseCheck != null)
        'skipResourceInUseCheck': [skipResourceInUseCheck.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/actiongroups/${Uri.encodeComponent(actionGroupId)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an alias of an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentAliasId] :
  /// The unique identifier of the alias to delete.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent that the alias belongs to.
  Future<DeleteAgentAliasResponse> deleteAgentAlias({
    required String agentAliasId,
    required String agentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentaliases/${Uri.encodeComponent(agentAliasId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAgentAliasResponse.fromJson(response);
  }

  /// Deletes a version of an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent that the version belongs to.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent to delete.
  ///
  /// Parameter [skipResourceInUseCheck] :
  /// By default, this value is <code>false</code> and deletion is stopped if
  /// the resource is in use. If you set it to <code>true</code>, the resource
  /// will be deleted even if the resource is in use.
  Future<DeleteAgentVersionResponse> deleteAgentVersion({
    required String agentId,
    required String agentVersion,
    bool? skipResourceInUseCheck,
  }) async {
    final $query = <String, List<String>>{
      if (skipResourceInUseCheck != null)
        'skipResourceInUseCheck': [skipResourceInUseCheck.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAgentVersionResponse.fromJson(response);
  }

  /// Deletes a data source from a knowledge base.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source to delete.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base from which to delete the data
  /// source.
  Future<DeleteDataSourceResponse> deleteDataSource({
    required String dataSourceId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataSourceResponse.fromJson(response);
  }

  /// Deletes a knowledge base. Before deleting a knowledge base, you should
  /// disassociate the knowledge base from any agents that it is associated with
  /// by making a <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_DisassociateAgentKnowledgeBase.html">DisassociateAgentKnowledgeBase</a>
  /// request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base to delete.
  Future<DeleteKnowledgeBaseResponse> deleteKnowledgeBase({
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteKnowledgeBaseResponse.fromJson(response);
  }

  /// Disassociates a knowledge base from an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent from which to disassociate the
  /// knowledge base.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent from which to disassociate the knowledge base.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base to disassociate.
  Future<void> disassociateAgentKnowledgeBase({
    required String agentId,
    required String agentVersion,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent.
  Future<GetAgentResponse> getAgent({
    required String agentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/agents/${Uri.encodeComponent(agentId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetAgentResponse.fromJson(response);
  }

  /// Gets information about an action group for an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [actionGroupId] :
  /// The unique identifier of the action group for which to get information.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent that the action group belongs to.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent that the action group belongs to.
  Future<GetAgentActionGroupResponse> getAgentActionGroup({
    required String actionGroupId,
    required String agentId,
    required String agentVersion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/actiongroups/${Uri.encodeComponent(actionGroupId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetAgentActionGroupResponse.fromJson(response);
  }

  /// Gets information about an alias of an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentAliasId] :
  /// The unique identifier of the alias for which to get information.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent to which the alias to get information
  /// belongs.
  Future<GetAgentAliasResponse> getAgentAlias({
    required String agentAliasId,
    required String agentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentaliases/${Uri.encodeComponent(agentAliasId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetAgentAliasResponse.fromJson(response);
  }

  /// Gets information about a knowledge base associated with an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent with which the knowledge base is
  /// associated.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent with which the knowledge base is associated.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base associated with the agent.
  Future<GetAgentKnowledgeBaseResponse> getAgentKnowledgeBase({
    required String agentId,
    required String agentVersion,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetAgentKnowledgeBaseResponse.fromJson(response);
  }

  /// Gets details about a version of an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent.
  Future<GetAgentVersionResponse> getAgentVersion({
    required String agentId,
    required String agentVersion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetAgentVersionResponse.fromJson(response);
  }

  /// Gets information about a data source.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base that the data source was added
  /// to.
  Future<GetDataSourceResponse> getDataSource({
    required String dataSourceId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataSourceResponse.fromJson(response);
  }

  /// Gets information about a ingestion job, in which a data source is added to
  /// a knowledge base.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source in the ingestion job.
  ///
  /// Parameter [ingestionJobId] :
  /// The unique identifier of the ingestion job.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base for which the ingestion job
  /// applies.
  Future<GetIngestionJobResponse> getIngestionJob({
    required String dataSourceId,
    required String ingestionJobId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}/ingestionjobs/${Uri.encodeComponent(ingestionJobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIngestionJobResponse.fromJson(response);
  }

  /// Gets information about a knoweldge base.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base for which to get information.
  Future<GetKnowledgeBaseResponse> getKnowledgeBase({
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKnowledgeBaseResponse.fromJson(response);
  }

  /// Lists the action groups for an agent and information about each one.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  Future<ListAgentActionGroupsResponse> listAgentActionGroups({
    required String agentId,
    required String agentVersion,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/actiongroups/',
      exceptionFnMap: _exceptionFns,
    );
    return ListAgentActionGroupsResponse.fromJson(response);
  }

  /// Lists the aliases of an agent and information about each one.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  Future<ListAgentAliasesResponse> listAgentAliases({
    required String agentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/agents/${Uri.encodeComponent(agentId)}/agentaliases/',
      exceptionFnMap: _exceptionFns,
    );
    return ListAgentAliasesResponse.fromJson(response);
  }

  /// Lists knowledge bases associated with an agent and information about each
  /// one.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent for which to return information about
  /// knowledge bases associated with it.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent for which to return information about knowledge
  /// bases associated with it.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  Future<ListAgentKnowledgeBasesResponse> listAgentKnowledgeBases({
    required String agentId,
    required String agentVersion,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/knowledgebases/',
      exceptionFnMap: _exceptionFns,
    );
    return ListAgentKnowledgeBasesResponse.fromJson(response);
  }

  /// Lists the versions of an agent and information about each version.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  Future<ListAgentVersionsResponse> listAgentVersions({
    required String agentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/agents/${Uri.encodeComponent(agentId)}/agentversions/',
      exceptionFnMap: _exceptionFns,
    );
    return ListAgentVersionsResponse.fromJson(response);
  }

  /// Lists the agents belonging to an account and information about each agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  Future<ListAgentsResponse> listAgents({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/agents/',
      exceptionFnMap: _exceptionFns,
    );
    return ListAgentsResponse.fromJson(response);
  }

  /// Lists the data sources in a knowledge base and information about each one.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base for which to return a list of
  /// information.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  Future<ListDataSourcesResponse> listDataSources({
    required String knowledgeBaseId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/',
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSourcesResponse.fromJson(response);
  }

  /// Lists the ingestion jobs for a data source and information about each of
  /// them.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source for which to return ingestion
  /// jobs.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base for which to return ingestion
  /// jobs.
  ///
  /// Parameter [filters] :
  /// Contains a definition of a filter for which to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  ///
  /// Parameter [sortBy] :
  /// Contains details about how to sort the results.
  Future<ListIngestionJobsResponse> listIngestionJobs({
    required String dataSourceId,
    required String knowledgeBaseId,
    List<IngestionJobFilter>? filters,
    int? maxResults,
    String? nextToken,
    IngestionJobSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}/ingestionjobs/',
      exceptionFnMap: _exceptionFns,
    );
    return ListIngestionJobsResponse.fromJson(response);
  }

  /// Lists the knowledge bases in an account and information about each of
  /// them.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  Future<ListKnowledgeBasesResponse> listKnowledgeBases({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/knowledgebases/',
      exceptionFnMap: _exceptionFns,
    );
    return ListKnowledgeBasesResponse.fromJson(response);
  }

  /// List all the tags for the resource you specify.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which to list tags.
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

  /// Creates a <code>DRAFT</code> version of the agent that can be used for
  /// internal testing.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent for which to create a
  /// <code>DRAFT</code> version.
  Future<PrepareAgentResponse> prepareAgent({
    required String agentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/agents/${Uri.encodeComponent(agentId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return PrepareAgentResponse.fromJson(response);
  }

  /// Begins an ingestion job, in which a data source is added to a knowledge
  /// base.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source to ingest.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base to which to add the data
  /// source.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [description] :
  /// A description of the ingestion job.
  Future<StartIngestionJobResponse> startIngestionJob({
    required String dataSourceId,
    required String knowledgeBaseId,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}/ingestionjobs/',
      exceptionFnMap: _exceptionFns,
    );
    return StartIngestionJobResponse.fromJson(response);
  }

  /// Associate tags with a resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Tagging
  /// resources</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to tag.
  ///
  /// Parameter [tags] :
  /// An object containing key-value pairs that define the tags to attach to the
  /// resource.
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

  /// Remove tags from a resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which to remove tags.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys of the tags to remove from the resource.
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

  /// Updates the configuration of an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent.
  ///
  /// Parameter [agentName] :
  /// Specifies a new name for the agent.
  ///
  /// Parameter [agentResourceRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role with permissions to invoke
  /// API operations on the agent.
  ///
  /// Parameter [foundationModel] :
  /// Specifies a new foundation model to be used for orchestration by the
  /// agent.
  ///
  /// Parameter [customerEncryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key with which to encrypt the
  /// agent.
  ///
  /// Parameter [description] :
  /// Specifies a new description of the agent.
  ///
  /// Parameter [guardrailConfiguration] :
  /// The unique Guardrail configuration assigned to the agent when it is
  /// updated.
  ///
  /// Parameter [idleSessionTTLInSeconds] :
  /// The number of seconds for which Amazon Bedrock keeps information about a
  /// user's conversation with the agent.
  ///
  /// A user interaction remains active for the amount of time specified. If no
  /// conversation occurs during this time, the session expires and Amazon
  /// Bedrock deletes any data provided before the timeout.
  ///
  /// Parameter [instruction] :
  /// Specifies new instructions that tell the agent what it should do and how
  /// it should interact with users.
  ///
  /// Parameter [promptOverrideConfiguration] :
  /// Contains configurations to override prompts in different parts of an agent
  /// sequence. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
  /// prompts</a>.
  Future<UpdateAgentResponse> updateAgent({
    required String agentId,
    required String agentName,
    required String agentResourceRoleArn,
    required String foundationModel,
    String? customerEncryptionKeyArn,
    String? description,
    GuardrailConfiguration? guardrailConfiguration,
    int? idleSessionTTLInSeconds,
    String? instruction,
    PromptOverrideConfiguration? promptOverrideConfiguration,
  }) async {
    _s.validateNumRange(
      'idleSessionTTLInSeconds',
      idleSessionTTLInSeconds,
      60,
      3600,
    );
    final $payload = <String, dynamic>{
      'agentName': agentName,
      'agentResourceRoleArn': agentResourceRoleArn,
      'foundationModel': foundationModel,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (description != null) 'description': description,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (instruction != null) 'instruction': instruction,
      if (promptOverrideConfiguration != null)
        'promptOverrideConfiguration': promptOverrideConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/agents/${Uri.encodeComponent(agentId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAgentResponse.fromJson(response);
  }

  /// Updates the configuration for an action group for an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [actionGroupId] :
  /// The unique identifier of the action group.
  ///
  /// Parameter [actionGroupName] :
  /// Specifies a new name for the action group.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent for which to update the action group.
  ///
  /// Parameter [agentVersion] :
  /// The unique identifier of the agent version for which to update the action
  /// group.
  ///
  /// Parameter [actionGroupExecutor] :
  /// The Amazon Resource Name (ARN) of the Lambda function containing the
  /// business logic that is carried out upon invoking the action.
  ///
  /// Parameter [actionGroupState] :
  /// Specifies whether the action group is available for the agent to invoke or
  /// not when sending an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html">InvokeAgent</a>
  /// request.
  ///
  /// Parameter [apiSchema] :
  /// Contains either details about the S3 object containing the OpenAPI schema
  /// for the action group or the JSON or YAML-formatted payload defining the
  /// schema. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-api-schema.html">Action
  /// group OpenAPI schemas</a>.
  ///
  /// Parameter [description] :
  /// Specifies a new name for the action group.
  ///
  /// Parameter [functionSchema] :
  /// Contains details about the function schema for the action group or the
  /// JSON or YAML-formatted payload defining the schema.
  ///
  /// Parameter [parentActionGroupSignature] :
  /// To allow your agent to request the user for additional information when
  /// trying to complete a task, set this field to
  /// <code>AMAZON.UserInput</code>. You must leave the
  /// <code>description</code>, <code>apiSchema</code>, and
  /// <code>actionGroupExecutor</code> fields blank for this action group.
  ///
  /// During orchestration, if your agent determines that it needs to invoke an
  /// API in an action group, but doesn't have enough information to complete
  /// the API request, it will invoke this action group instead and return an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Observation.html">Observation</a>
  /// reprompting the user for more information.
  Future<UpdateAgentActionGroupResponse> updateAgentActionGroup({
    required String actionGroupId,
    required String actionGroupName,
    required String agentId,
    required String agentVersion,
    ActionGroupExecutor? actionGroupExecutor,
    ActionGroupState? actionGroupState,
    APISchema? apiSchema,
    String? description,
    FunctionSchema? functionSchema,
    ActionGroupSignature? parentActionGroupSignature,
  }) async {
    final $payload = <String, dynamic>{
      'actionGroupName': actionGroupName,
      if (actionGroupExecutor != null)
        'actionGroupExecutor': actionGroupExecutor,
      if (actionGroupState != null)
        'actionGroupState': actionGroupState.toValue(),
      if (apiSchema != null) 'apiSchema': apiSchema,
      if (description != null) 'description': description,
      if (functionSchema != null) 'functionSchema': functionSchema,
      if (parentActionGroupSignature != null)
        'parentActionGroupSignature': parentActionGroupSignature.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/actiongroups/${Uri.encodeComponent(actionGroupId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAgentActionGroupResponse.fromJson(response);
  }

  /// Updates configurations for an alias of an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [agentAliasId] :
  /// The unique identifier of the alias.
  ///
  /// Parameter [agentAliasName] :
  /// Specifies a new name for the alias.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent.
  ///
  /// Parameter [description] :
  /// Specifies a new description for the alias.
  ///
  /// Parameter [routingConfiguration] :
  /// Contains details about the routing configuration of the alias.
  Future<UpdateAgentAliasResponse> updateAgentAlias({
    required String agentAliasId,
    required String agentAliasName,
    required String agentId,
    String? description,
    List<AgentAliasRoutingConfigurationListItem>? routingConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'agentAliasName': agentAliasName,
      if (description != null) 'description': description,
      if (routingConfiguration != null)
        'routingConfiguration': routingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentaliases/${Uri.encodeComponent(agentAliasId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAgentAliasResponse.fromJson(response);
  }

  /// Updates the configuration for a knowledge base that has been associated
  /// with an agent.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent associated with the knowledge base that
  /// you want to update.
  ///
  /// Parameter [agentVersion] :
  /// The version of the agent associated with the knowledge base that you want
  /// to update.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base that has been associated with
  /// an agent.
  ///
  /// Parameter [description] :
  /// Specifies a new description for the knowledge base associated with an
  /// agent.
  ///
  /// Parameter [knowledgeBaseState] :
  /// Specifies whether the agent uses the knowledge base or not when sending an
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html">InvokeAgent</a>
  /// request.
  Future<UpdateAgentKnowledgeBaseResponse> updateAgentKnowledgeBase({
    required String agentId,
    required String agentVersion,
    required String knowledgeBaseId,
    String? description,
    KnowledgeBaseState? knowledgeBaseState,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (knowledgeBaseState != null)
        'knowledgeBaseState': knowledgeBaseState.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAgentKnowledgeBaseResponse.fromJson(response);
  }

  /// Updates configurations for a data source.
  /// <important>
  /// You can't change the <code>chunkingConfiguration</code> after you create
  /// the data source. Specify the existing <code>chunkingConfiguration</code>.
  /// </important>
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [dataSourceConfiguration] :
  /// Contains details about the storage configuration of the data source.
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base to which the data source
  /// belongs.
  ///
  /// Parameter [name] :
  /// Specifies a new name for the data source.
  ///
  /// Parameter [dataDeletionPolicy] :
  /// The data deletion policy of the updated data source.
  ///
  /// Parameter [description] :
  /// Specifies a new description for the data source.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// Contains details about server-side encryption of the data source.
  ///
  /// Parameter [vectorIngestionConfiguration] :
  /// Contains details about how to ingest the documents in the data source.
  Future<UpdateDataSourceResponse> updateDataSource({
    required DataSourceConfiguration dataSourceConfiguration,
    required String dataSourceId,
    required String knowledgeBaseId,
    required String name,
    DataDeletionPolicy? dataDeletionPolicy,
    String? description,
    ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration,
    VectorIngestionConfiguration? vectorIngestionConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'dataSourceConfiguration': dataSourceConfiguration,
      'name': name,
      if (dataDeletionPolicy != null)
        'dataDeletionPolicy': dataDeletionPolicy.toValue(),
      if (description != null) 'description': description,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (vectorIngestionConfiguration != null)
        'vectorIngestionConfiguration': vectorIngestionConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataSourceResponse.fromJson(response);
  }

  /// Updates the configuration of a knowledge base with the fields that you
  /// specify. Because all fields will be overwritten, you must include the same
  /// values for fields that you want to keep the same.
  ///
  /// You can change the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>name</code>
  /// </li>
  /// <li>
  /// <code>description</code>
  /// </li>
  /// <li>
  /// <code>roleArn</code>
  /// </li>
  /// </ul>
  /// You can't change the <code>knowledgeBaseConfiguration</code> or
  /// <code>storageConfiguration</code> fields, so you must specify the same
  /// configurations as when you created the knowledge base. You can send a <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_GetKnowledgeBase.html">GetKnowledgeBase</a>
  /// request and copy the same configurations.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [knowledgeBaseConfiguration] :
  /// Specifies the configuration for the embeddings model used for the
  /// knowledge base. You must use the same configuration as when the knowledge
  /// base was created.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base to update.
  ///
  /// Parameter [name] :
  /// Specifies a new name for the knowledge base.
  ///
  /// Parameter [roleArn] :
  /// Specifies a different Amazon Resource Name (ARN) of the IAM role with
  /// permissions to invoke API operations on the knowledge base.
  ///
  /// Parameter [storageConfiguration] :
  /// Specifies the configuration for the vector store used for the knowledge
  /// base. You must use the same configuration as when the knowledge base was
  /// created.
  ///
  /// Parameter [description] :
  /// Specifies a new description for the knowledge base.
  Future<UpdateKnowledgeBaseResponse> updateKnowledgeBase({
    required KnowledgeBaseConfiguration knowledgeBaseConfiguration,
    required String knowledgeBaseId,
    required String name,
    required String roleArn,
    required StorageConfiguration storageConfiguration,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'knowledgeBaseConfiguration': knowledgeBaseConfiguration,
      'name': name,
      'roleArn': roleArn,
      'storageConfiguration': storageConfiguration,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKnowledgeBaseResponse.fromJson(response);
  }
}

/// Contains details about the OpenAPI schema for the action group. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-api-schema.html">Action
/// group OpenAPI schemas</a>. You can either include the schema directly in the
/// <code>payload</code> field or you can upload it to an S3 bucket and specify
/// the S3 bucket location in the <code>s3</code> field.
class APISchema {
  /// The JSON or YAML-formatted payload defining the OpenAPI schema for the
  /// action group. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-api-schema.html">Action
  /// group OpenAPI schemas</a>.
  final String? payload;

  /// Contains details about the S3 object containing the OpenAPI schema for the
  /// action group. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-api-schema.html">Action
  /// group OpenAPI schemas</a>.
  final S3Identifier? s3;

  APISchema({
    this.payload,
    this.s3,
  });

  factory APISchema.fromJson(Map<String, dynamic> json) {
    return APISchema(
      payload: json['payload'] as String?,
      s3: json['s3'] != null
          ? S3Identifier.fromJson(json['s3'] as Map<String, dynamic>)
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

/// Contains details about the Lambda function containing the business logic
/// that is carried out upon invoking the action or the custom control method
/// for handling the information elicited from the user.
class ActionGroupExecutor {
  /// To return the action group invocation results directly in the
  /// <code>InvokeAgent</code> response, specify <code>RETURN_CONTROL</code>.
  final CustomControlMethod? customControl;

  /// The Amazon Resource Name (ARN) of the Lambda function containing the
  /// business logic that is carried out upon invoking the action.
  final String? lambda;

  ActionGroupExecutor({
    this.customControl,
    this.lambda,
  });

  factory ActionGroupExecutor.fromJson(Map<String, dynamic> json) {
    return ActionGroupExecutor(
      customControl:
          (json['customControl'] as String?)?.toCustomControlMethod(),
      lambda: json['lambda'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customControl = this.customControl;
    final lambda = this.lambda;
    return {
      if (customControl != null) 'customControl': customControl.toValue(),
      if (lambda != null) 'lambda': lambda,
    };
  }
}

enum ActionGroupSignature {
  amazonUserInput,
}

extension ActionGroupSignatureValueExtension on ActionGroupSignature {
  String toValue() {
    switch (this) {
      case ActionGroupSignature.amazonUserInput:
        return 'AMAZON.UserInput';
    }
  }
}

extension ActionGroupSignatureFromString on String {
  ActionGroupSignature toActionGroupSignature() {
    switch (this) {
      case 'AMAZON.UserInput':
        return ActionGroupSignature.amazonUserInput;
    }
    throw Exception('$this is not known in enum ActionGroupSignature');
  }
}

enum ActionGroupState {
  enabled,
  disabled,
}

extension ActionGroupStateValueExtension on ActionGroupState {
  String toValue() {
    switch (this) {
      case ActionGroupState.enabled:
        return 'ENABLED';
      case ActionGroupState.disabled:
        return 'DISABLED';
    }
  }
}

extension ActionGroupStateFromString on String {
  ActionGroupState toActionGroupState() {
    switch (this) {
      case 'ENABLED':
        return ActionGroupState.enabled;
      case 'DISABLED':
        return ActionGroupState.disabled;
    }
    throw Exception('$this is not known in enum ActionGroupState');
  }
}

/// Contains details about an action group.
class ActionGroupSummary {
  /// The unique identifier of the action group.
  final String actionGroupId;

  /// The name of the action group.
  final String actionGroupName;

  /// Specifies whether the action group is available for the agent to invoke or
  /// not when sending an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html">InvokeAgent</a>
  /// request.
  final ActionGroupState actionGroupState;

  /// The time at which the action group was last updated.
  final DateTime updatedAt;

  /// The description of the action group.
  final String? description;

  ActionGroupSummary({
    required this.actionGroupId,
    required this.actionGroupName,
    required this.actionGroupState,
    required this.updatedAt,
    this.description,
  });

  factory ActionGroupSummary.fromJson(Map<String, dynamic> json) {
    return ActionGroupSummary(
      actionGroupId: json['actionGroupId'] as String,
      actionGroupName: json['actionGroupName'] as String,
      actionGroupState:
          (json['actionGroupState'] as String).toActionGroupState(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroupId = this.actionGroupId;
    final actionGroupName = this.actionGroupName;
    final actionGroupState = this.actionGroupState;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'actionGroupId': actionGroupId,
      'actionGroupName': actionGroupName,
      'actionGroupState': actionGroupState.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

/// Contains details about an agent.
class Agent {
  /// The Amazon Resource Name (ARN) of the agent.
  final String agentArn;

  /// The unique identifier of the agent.
  final String agentId;

  /// The name of the agent.
  final String agentName;

  /// The Amazon Resource Name (ARN) of the IAM role with permissions to invoke
  /// API operations on the agent.
  final String agentResourceRoleArn;

  /// The status of the agent and whether it is ready for use. The following
  /// statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// CREATING – The agent is being created.
  /// </li>
  /// <li>
  /// PREPARING – The agent is being prepared.
  /// </li>
  /// <li>
  /// PREPARED – The agent is prepared and ready to be invoked.
  /// </li>
  /// <li>
  /// NOT_PREPARED – The agent has been created but not yet prepared.
  /// </li>
  /// <li>
  /// FAILED – The agent API operation failed.
  /// </li>
  /// <li>
  /// UPDATING – The agent is being updated.
  /// </li>
  /// <li>
  /// DELETING – The agent is being deleted.
  /// </li>
  /// </ul>
  final AgentStatus agentStatus;

  /// The version of the agent.
  final String agentVersion;

  /// The time at which the agent was created.
  final DateTime createdAt;

  /// The number of seconds for which Amazon Bedrock keeps information about a
  /// user's conversation with the agent.
  ///
  /// A user interaction remains active for the amount of time specified. If no
  /// conversation occurs during this time, the session expires and Amazon Bedrock
  /// deletes any data provided before the timeout.
  final int idleSessionTTLInSeconds;

  /// The time at which the agent was last updated.
  final DateTime updatedAt;

  /// A unique, case-sensitive identifier to ensure that the API request completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the KMS key that encrypts the agent.
  final String? customerEncryptionKeyArn;

  /// The description of the agent.
  final String? description;

  /// Contains reasons that the agent-related API that you invoked failed.
  final List<String>? failureReasons;

  /// The foundation model used for orchestration by the agent.
  final String? foundationModel;

  /// The guardrails configuration assigned to the agent.
  final GuardrailConfiguration? guardrailConfiguration;

  /// Instructions that tell the agent what it should do and how it should
  /// interact with users.
  final String? instruction;

  /// The time at which the agent was last prepared.
  final DateTime? preparedAt;

  /// Contains configurations to override prompt templates in different parts of
  /// an agent sequence. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
  /// prompts</a>.
  final PromptOverrideConfiguration? promptOverrideConfiguration;

  /// Contains recommended actions to take for the agent-related API that you
  /// invoked to succeed.
  final List<String>? recommendedActions;

  Agent({
    required this.agentArn,
    required this.agentId,
    required this.agentName,
    required this.agentResourceRoleArn,
    required this.agentStatus,
    required this.agentVersion,
    required this.createdAt,
    required this.idleSessionTTLInSeconds,
    required this.updatedAt,
    this.clientToken,
    this.customerEncryptionKeyArn,
    this.description,
    this.failureReasons,
    this.foundationModel,
    this.guardrailConfiguration,
    this.instruction,
    this.preparedAt,
    this.promptOverrideConfiguration,
    this.recommendedActions,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      agentArn: json['agentArn'] as String,
      agentId: json['agentId'] as String,
      agentName: json['agentName'] as String,
      agentResourceRoleArn: json['agentResourceRoleArn'] as String,
      agentStatus: (json['agentStatus'] as String).toAgentStatus(),
      agentVersion: json['agentVersion'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      clientToken: json['clientToken'] as String?,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      foundationModel: json['foundationModel'] as String?,
      guardrailConfiguration: json['guardrailConfiguration'] != null
          ? GuardrailConfiguration.fromJson(
              json['guardrailConfiguration'] as Map<String, dynamic>)
          : null,
      instruction: json['instruction'] as String?,
      preparedAt: timeStampFromJson(json['preparedAt']),
      promptOverrideConfiguration: json['promptOverrideConfiguration'] != null
          ? PromptOverrideConfiguration.fromJson(
              json['promptOverrideConfiguration'] as Map<String, dynamic>)
          : null,
      recommendedActions: (json['recommendedActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentArn = this.agentArn;
    final agentId = this.agentId;
    final agentName = this.agentName;
    final agentResourceRoleArn = this.agentResourceRoleArn;
    final agentStatus = this.agentStatus;
    final agentVersion = this.agentVersion;
    final createdAt = this.createdAt;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final updatedAt = this.updatedAt;
    final clientToken = this.clientToken;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final foundationModel = this.foundationModel;
    final guardrailConfiguration = this.guardrailConfiguration;
    final instruction = this.instruction;
    final preparedAt = this.preparedAt;
    final promptOverrideConfiguration = this.promptOverrideConfiguration;
    final recommendedActions = this.recommendedActions;
    return {
      'agentArn': agentArn,
      'agentId': agentId,
      'agentName': agentName,
      'agentResourceRoleArn': agentResourceRoleArn,
      'agentStatus': agentStatus.toValue(),
      'agentVersion': agentVersion,
      'createdAt': iso8601ToJson(createdAt),
      'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      'updatedAt': iso8601ToJson(updatedAt),
      if (clientToken != null) 'clientToken': clientToken,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (foundationModel != null) 'foundationModel': foundationModel,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (instruction != null) 'instruction': instruction,
      if (preparedAt != null) 'preparedAt': iso8601ToJson(preparedAt),
      if (promptOverrideConfiguration != null)
        'promptOverrideConfiguration': promptOverrideConfiguration,
      if (recommendedActions != null) 'recommendedActions': recommendedActions,
    };
  }
}

/// Contains details about an action group.
class AgentActionGroup {
  /// The unique identifier of the action group.
  final String actionGroupId;

  /// The name of the action group.
  final String actionGroupName;

  /// Specifies whether the action group is available for the agent to invoke or
  /// not when sending an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html">InvokeAgent</a>
  /// request.
  final ActionGroupState actionGroupState;

  /// The unique identifier of the agent to which the action group belongs.
  final String agentId;

  /// The version of the agent to which the action group belongs.
  final String agentVersion;

  /// The time at which the action group was created.
  final DateTime createdAt;

  /// The time at which the action group was last updated.
  final DateTime updatedAt;

  /// The Amazon Resource Name (ARN) of the Lambda function containing the
  /// business logic that is carried out upon invoking the action or the custom
  /// control method for handling the information elicited from the user.
  final ActionGroupExecutor? actionGroupExecutor;

  /// Contains either details about the S3 object containing the OpenAPI schema
  /// for the action group or the JSON or YAML-formatted payload defining the
  /// schema. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-api-schema.html">Action
  /// group OpenAPI schemas</a>.
  final APISchema? apiSchema;

  /// A unique, case-sensitive identifier to ensure that the API request completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  final String? clientToken;

  /// The description of the action group.
  final String? description;

  /// Defines functions that each define parameters that the agent needs to invoke
  /// from the user. Each function represents an action in an action group.
  final FunctionSchema? functionSchema;

  /// If this field is set as <code>AMAZON.UserInput</code>, the agent can request
  /// the user for additional information when trying to complete a task. The
  /// <code>description</code>, <code>apiSchema</code>, and
  /// <code>actionGroupExecutor</code> fields must be blank for this action group.
  ///
  /// During orchestration, if the agent determines that it needs to invoke an API
  /// in an action group, but doesn't have enough information to complete the API
  /// request, it will invoke this action group instead and return an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Observation.html">Observation</a>
  /// reprompting the user for more information.
  final ActionGroupSignature? parentActionSignature;

  AgentActionGroup({
    required this.actionGroupId,
    required this.actionGroupName,
    required this.actionGroupState,
    required this.agentId,
    required this.agentVersion,
    required this.createdAt,
    required this.updatedAt,
    this.actionGroupExecutor,
    this.apiSchema,
    this.clientToken,
    this.description,
    this.functionSchema,
    this.parentActionSignature,
  });

  factory AgentActionGroup.fromJson(Map<String, dynamic> json) {
    return AgentActionGroup(
      actionGroupId: json['actionGroupId'] as String,
      actionGroupName: json['actionGroupName'] as String,
      actionGroupState:
          (json['actionGroupState'] as String).toActionGroupState(),
      agentId: json['agentId'] as String,
      agentVersion: json['agentVersion'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      actionGroupExecutor: json['actionGroupExecutor'] != null
          ? ActionGroupExecutor.fromJson(
              json['actionGroupExecutor'] as Map<String, dynamic>)
          : null,
      apiSchema: json['apiSchema'] != null
          ? APISchema.fromJson(json['apiSchema'] as Map<String, dynamic>)
          : null,
      clientToken: json['clientToken'] as String?,
      description: json['description'] as String?,
      functionSchema: json['functionSchema'] != null
          ? FunctionSchema.fromJson(
              json['functionSchema'] as Map<String, dynamic>)
          : null,
      parentActionSignature:
          (json['parentActionSignature'] as String?)?.toActionGroupSignature(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroupId = this.actionGroupId;
    final actionGroupName = this.actionGroupName;
    final actionGroupState = this.actionGroupState;
    final agentId = this.agentId;
    final agentVersion = this.agentVersion;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    final actionGroupExecutor = this.actionGroupExecutor;
    final apiSchema = this.apiSchema;
    final clientToken = this.clientToken;
    final description = this.description;
    final functionSchema = this.functionSchema;
    final parentActionSignature = this.parentActionSignature;
    return {
      'actionGroupId': actionGroupId,
      'actionGroupName': actionGroupName,
      'actionGroupState': actionGroupState.toValue(),
      'agentId': agentId,
      'agentVersion': agentVersion,
      'createdAt': iso8601ToJson(createdAt),
      'updatedAt': iso8601ToJson(updatedAt),
      if (actionGroupExecutor != null)
        'actionGroupExecutor': actionGroupExecutor,
      if (apiSchema != null) 'apiSchema': apiSchema,
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (functionSchema != null) 'functionSchema': functionSchema,
      if (parentActionSignature != null)
        'parentActionSignature': parentActionSignature.toValue(),
    };
  }
}

/// Contains details about an alias of an agent.
class AgentAlias {
  /// The Amazon Resource Name (ARN) of the alias of the agent.
  final String agentAliasArn;

  /// The unique identifier of the alias of the agent.
  final String agentAliasId;

  /// The name of the alias of the agent.
  final String agentAliasName;

  /// The status of the alias of the agent and whether it is ready for use. The
  /// following statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// CREATING – The agent alias is being created.
  /// </li>
  /// <li>
  /// PREPARED – The agent alias is finished being created or updated and is ready
  /// to be invoked.
  /// </li>
  /// <li>
  /// FAILED – The agent alias API operation failed.
  /// </li>
  /// <li>
  /// UPDATING – The agent alias is being updated.
  /// </li>
  /// <li>
  /// DELETING – The agent alias is being deleted.
  /// </li>
  /// </ul>
  final AgentAliasStatus agentAliasStatus;

  /// The unique identifier of the agent.
  final String agentId;

  /// The time at which the alias of the agent was created.
  final DateTime createdAt;

  /// Contains details about the routing configuration of the alias.
  final List<AgentAliasRoutingConfigurationListItem> routingConfiguration;

  /// The time at which the alias was last updated.
  final DateTime updatedAt;

  /// Contains details about the history of the alias.
  final List<AgentAliasHistoryEvent>? agentAliasHistoryEvents;

  /// A unique, case-sensitive identifier to ensure that the API request completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  final String? clientToken;

  /// The description of the alias of the agent.
  final String? description;

  /// Information on the failure of Provisioned Throughput assigned to an agent
  /// alias.
  final List<String>? failureReasons;

  AgentAlias({
    required this.agentAliasArn,
    required this.agentAliasId,
    required this.agentAliasName,
    required this.agentAliasStatus,
    required this.agentId,
    required this.createdAt,
    required this.routingConfiguration,
    required this.updatedAt,
    this.agentAliasHistoryEvents,
    this.clientToken,
    this.description,
    this.failureReasons,
  });

  factory AgentAlias.fromJson(Map<String, dynamic> json) {
    return AgentAlias(
      agentAliasArn: json['agentAliasArn'] as String,
      agentAliasId: json['agentAliasId'] as String,
      agentAliasName: json['agentAliasName'] as String,
      agentAliasStatus:
          (json['agentAliasStatus'] as String).toAgentAliasStatus(),
      agentId: json['agentId'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      routingConfiguration: (json['routingConfiguration'] as List)
          .whereNotNull()
          .map((e) => AgentAliasRoutingConfigurationListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      agentAliasHistoryEvents: (json['agentAliasHistoryEvents'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AgentAliasHistoryEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      clientToken: json['clientToken'] as String?,
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentAliasArn = this.agentAliasArn;
    final agentAliasId = this.agentAliasId;
    final agentAliasName = this.agentAliasName;
    final agentAliasStatus = this.agentAliasStatus;
    final agentId = this.agentId;
    final createdAt = this.createdAt;
    final routingConfiguration = this.routingConfiguration;
    final updatedAt = this.updatedAt;
    final agentAliasHistoryEvents = this.agentAliasHistoryEvents;
    final clientToken = this.clientToken;
    final description = this.description;
    final failureReasons = this.failureReasons;
    return {
      'agentAliasArn': agentAliasArn,
      'agentAliasId': agentAliasId,
      'agentAliasName': agentAliasName,
      'agentAliasStatus': agentAliasStatus.toValue(),
      'agentId': agentId,
      'createdAt': iso8601ToJson(createdAt),
      'routingConfiguration': routingConfiguration,
      'updatedAt': iso8601ToJson(updatedAt),
      if (agentAliasHistoryEvents != null)
        'agentAliasHistoryEvents': agentAliasHistoryEvents,
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
    };
  }
}

/// Contains details about the history of the alias.
class AgentAliasHistoryEvent {
  /// The date that the alias stopped being associated to the version in the
  /// <code>routingConfiguration</code> object
  final DateTime? endDate;

  /// Contains details about the version of the agent with which the alias is
  /// associated.
  final List<AgentAliasRoutingConfigurationListItem>? routingConfiguration;

  /// The date that the alias began being associated to the version in the
  /// <code>routingConfiguration</code> object.
  final DateTime? startDate;

  AgentAliasHistoryEvent({
    this.endDate,
    this.routingConfiguration,
    this.startDate,
  });

  factory AgentAliasHistoryEvent.fromJson(Map<String, dynamic> json) {
    return AgentAliasHistoryEvent(
      endDate: timeStampFromJson(json['endDate']),
      routingConfiguration: (json['routingConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => AgentAliasRoutingConfigurationListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      startDate: timeStampFromJson(json['startDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final endDate = this.endDate;
    final routingConfiguration = this.routingConfiguration;
    final startDate = this.startDate;
    return {
      if (endDate != null) 'endDate': iso8601ToJson(endDate),
      if (routingConfiguration != null)
        'routingConfiguration': routingConfiguration,
      if (startDate != null) 'startDate': iso8601ToJson(startDate),
    };
  }
}

/// Contains details about the routing configuration of the alias.
class AgentAliasRoutingConfigurationListItem {
  /// The version of the agent with which the alias is associated.
  final String? agentVersion;

  /// Information on the Provisioned Throughput assigned to an agent alias.
  final String? provisionedThroughput;

  AgentAliasRoutingConfigurationListItem({
    this.agentVersion,
    this.provisionedThroughput,
  });

  factory AgentAliasRoutingConfigurationListItem.fromJson(
      Map<String, dynamic> json) {
    return AgentAliasRoutingConfigurationListItem(
      agentVersion: json['agentVersion'] as String?,
      provisionedThroughput: json['provisionedThroughput'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentVersion = this.agentVersion;
    final provisionedThroughput = this.provisionedThroughput;
    return {
      if (agentVersion != null) 'agentVersion': agentVersion,
      if (provisionedThroughput != null)
        'provisionedThroughput': provisionedThroughput,
    };
  }
}

enum AgentAliasStatus {
  creating,
  prepared,
  failed,
  updating,
  deleting,
}

extension AgentAliasStatusValueExtension on AgentAliasStatus {
  String toValue() {
    switch (this) {
      case AgentAliasStatus.creating:
        return 'CREATING';
      case AgentAliasStatus.prepared:
        return 'PREPARED';
      case AgentAliasStatus.failed:
        return 'FAILED';
      case AgentAliasStatus.updating:
        return 'UPDATING';
      case AgentAliasStatus.deleting:
        return 'DELETING';
    }
  }
}

extension AgentAliasStatusFromString on String {
  AgentAliasStatus toAgentAliasStatus() {
    switch (this) {
      case 'CREATING':
        return AgentAliasStatus.creating;
      case 'PREPARED':
        return AgentAliasStatus.prepared;
      case 'FAILED':
        return AgentAliasStatus.failed;
      case 'UPDATING':
        return AgentAliasStatus.updating;
      case 'DELETING':
        return AgentAliasStatus.deleting;
    }
    throw Exception('$this is not known in enum AgentAliasStatus');
  }
}

/// Contains details about an alias of an agent.
class AgentAliasSummary {
  /// Contains details about
  final String agentAliasId;

  /// The name of the alias.
  final String agentAliasName;

  /// The status of the alias.
  final AgentAliasStatus agentAliasStatus;

  /// The time at which the alias of the agent was created.
  final DateTime createdAt;

  /// The time at which the alias was last updated.
  final DateTime updatedAt;

  /// The description of the alias.
  final String? description;

  /// Contains details about the version of the agent with which the alias is
  /// associated.
  final List<AgentAliasRoutingConfigurationListItem>? routingConfiguration;

  AgentAliasSummary({
    required this.agentAliasId,
    required this.agentAliasName,
    required this.agentAliasStatus,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.routingConfiguration,
  });

  factory AgentAliasSummary.fromJson(Map<String, dynamic> json) {
    return AgentAliasSummary(
      agentAliasId: json['agentAliasId'] as String,
      agentAliasName: json['agentAliasName'] as String,
      agentAliasStatus:
          (json['agentAliasStatus'] as String).toAgentAliasStatus(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      routingConfiguration: (json['routingConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => AgentAliasRoutingConfigurationListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentAliasId = this.agentAliasId;
    final agentAliasName = this.agentAliasName;
    final agentAliasStatus = this.agentAliasStatus;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final routingConfiguration = this.routingConfiguration;
    return {
      'agentAliasId': agentAliasId,
      'agentAliasName': agentAliasName,
      'agentAliasStatus': agentAliasStatus.toValue(),
      'createdAt': iso8601ToJson(createdAt),
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (routingConfiguration != null)
        'routingConfiguration': routingConfiguration,
    };
  }
}

/// Contains details about a knowledge base that is associated with an agent.
class AgentKnowledgeBase {
  /// The unique identifier of the agent with which the knowledge base is
  /// associated.
  final String agentId;

  /// The version of the agent with which the knowledge base is associated.
  final String agentVersion;

  /// The time at which the association between the agent and the knowledge base
  /// was created.
  final DateTime createdAt;

  /// The description of the association between the agent and the knowledge base.
  final String description;

  /// The unique identifier of the association between the agent and the knowledge
  /// base.
  final String knowledgeBaseId;

  /// Specifies whether to use the knowledge base or not when sending an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html">InvokeAgent</a>
  /// request.
  final KnowledgeBaseState knowledgeBaseState;

  /// The time at which the association between the agent and the knowledge base
  /// was last updated.
  final DateTime updatedAt;

  AgentKnowledgeBase({
    required this.agentId,
    required this.agentVersion,
    required this.createdAt,
    required this.description,
    required this.knowledgeBaseId,
    required this.knowledgeBaseState,
    required this.updatedAt,
  });

  factory AgentKnowledgeBase.fromJson(Map<String, dynamic> json) {
    return AgentKnowledgeBase(
      agentId: json['agentId'] as String,
      agentVersion: json['agentVersion'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      description: json['description'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      knowledgeBaseState:
          (json['knowledgeBaseState'] as String).toKnowledgeBaseState(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final agentVersion = this.agentVersion;
    final createdAt = this.createdAt;
    final description = this.description;
    final knowledgeBaseId = this.knowledgeBaseId;
    final knowledgeBaseState = this.knowledgeBaseState;
    final updatedAt = this.updatedAt;
    return {
      'agentId': agentId,
      'agentVersion': agentVersion,
      'createdAt': iso8601ToJson(createdAt),
      'description': description,
      'knowledgeBaseId': knowledgeBaseId,
      'knowledgeBaseState': knowledgeBaseState.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Contains details about a knowledge base associated with an agent.
class AgentKnowledgeBaseSummary {
  /// The unique identifier of the knowledge base associated with an agent.
  final String knowledgeBaseId;

  /// Specifies whether the agent uses the knowledge base or not when sending an
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html">InvokeAgent</a>
  /// request.
  final KnowledgeBaseState knowledgeBaseState;

  /// The time at which the knowledge base associated with an agent was last
  /// updated.
  final DateTime updatedAt;

  /// The description of the knowledge base associated with an agent.
  final String? description;

  AgentKnowledgeBaseSummary({
    required this.knowledgeBaseId,
    required this.knowledgeBaseState,
    required this.updatedAt,
    this.description,
  });

  factory AgentKnowledgeBaseSummary.fromJson(Map<String, dynamic> json) {
    return AgentKnowledgeBaseSummary(
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      knowledgeBaseState:
          (json['knowledgeBaseState'] as String).toKnowledgeBaseState(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final knowledgeBaseState = this.knowledgeBaseState;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      'knowledgeBaseState': knowledgeBaseState.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

enum AgentStatus {
  creating,
  preparing,
  prepared,
  notPrepared,
  deleting,
  failed,
  versioning,
  updating,
}

extension AgentStatusValueExtension on AgentStatus {
  String toValue() {
    switch (this) {
      case AgentStatus.creating:
        return 'CREATING';
      case AgentStatus.preparing:
        return 'PREPARING';
      case AgentStatus.prepared:
        return 'PREPARED';
      case AgentStatus.notPrepared:
        return 'NOT_PREPARED';
      case AgentStatus.deleting:
        return 'DELETING';
      case AgentStatus.failed:
        return 'FAILED';
      case AgentStatus.versioning:
        return 'VERSIONING';
      case AgentStatus.updating:
        return 'UPDATING';
    }
  }
}

extension AgentStatusFromString on String {
  AgentStatus toAgentStatus() {
    switch (this) {
      case 'CREATING':
        return AgentStatus.creating;
      case 'PREPARING':
        return AgentStatus.preparing;
      case 'PREPARED':
        return AgentStatus.prepared;
      case 'NOT_PREPARED':
        return AgentStatus.notPrepared;
      case 'DELETING':
        return AgentStatus.deleting;
      case 'FAILED':
        return AgentStatus.failed;
      case 'VERSIONING':
        return AgentStatus.versioning;
      case 'UPDATING':
        return AgentStatus.updating;
    }
    throw Exception('$this is not known in enum AgentStatus');
  }
}

/// Contains details about an agent.
class AgentSummary {
  /// The unique identifier of the agent.
  final String agentId;

  /// The name of the agent.
  final String agentName;

  /// The status of the agent.
  final AgentStatus agentStatus;

  /// The time at which the agent was last updated.
  final DateTime updatedAt;

  /// The description of the agent.
  final String? description;

  /// The details of the guardrails configuration in the agent summary.
  final GuardrailConfiguration? guardrailConfiguration;

  /// The latest version of the agent.
  final String? latestAgentVersion;

  AgentSummary({
    required this.agentId,
    required this.agentName,
    required this.agentStatus,
    required this.updatedAt,
    this.description,
    this.guardrailConfiguration,
    this.latestAgentVersion,
  });

  factory AgentSummary.fromJson(Map<String, dynamic> json) {
    return AgentSummary(
      agentId: json['agentId'] as String,
      agentName: json['agentName'] as String,
      agentStatus: (json['agentStatus'] as String).toAgentStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      guardrailConfiguration: json['guardrailConfiguration'] != null
          ? GuardrailConfiguration.fromJson(
              json['guardrailConfiguration'] as Map<String, dynamic>)
          : null,
      latestAgentVersion: json['latestAgentVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final agentName = this.agentName;
    final agentStatus = this.agentStatus;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final guardrailConfiguration = this.guardrailConfiguration;
    final latestAgentVersion = this.latestAgentVersion;
    return {
      'agentId': agentId,
      'agentName': agentName,
      'agentStatus': agentStatus.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (latestAgentVersion != null) 'latestAgentVersion': latestAgentVersion,
    };
  }
}

/// Contains details about a version of an agent.
class AgentVersion {
  /// The Amazon Resource Name (ARN) of the agent that the version belongs to.
  final String agentArn;

  /// The unique identifier of the agent that the version belongs to.
  final String agentId;

  /// The name of the agent that the version belongs to.
  final String agentName;

  /// The Amazon Resource Name (ARN) of the IAM role with permissions to invoke
  /// API operations on the agent.
  final String agentResourceRoleArn;

  /// The status of the agent that the version belongs to.
  final AgentStatus agentStatus;

  /// The time at which the version was created.
  final DateTime createdAt;

  /// The number of seconds for which Amazon Bedrock keeps information about a
  /// user's conversation with the agent.
  ///
  /// A user interaction remains active for the amount of time specified. If no
  /// conversation occurs during this time, the session expires and Amazon Bedrock
  /// deletes any data provided before the timeout.
  final int idleSessionTTLInSeconds;

  /// The time at which the version was last updated.
  final DateTime updatedAt;

  /// The version number.
  final String version;

  /// The Amazon Resource Name (ARN) of the KMS key that encrypts the agent.
  final String? customerEncryptionKeyArn;

  /// The description of the version.
  final String? description;

  /// A list of reasons that the API operation on the version failed.
  final List<String>? failureReasons;

  /// The foundation model that the version invokes.
  final String? foundationModel;

  /// The guardrails configuration assigned to the agent version.
  final GuardrailConfiguration? guardrailConfiguration;

  /// The instructions provided to the agent.
  final String? instruction;

  /// Contains configurations to override prompt templates in different parts of
  /// an agent sequence. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
  /// prompts</a>.
  final PromptOverrideConfiguration? promptOverrideConfiguration;

  /// A list of recommended actions to take for the failed API operation on the
  /// version to succeed.
  final List<String>? recommendedActions;

  AgentVersion({
    required this.agentArn,
    required this.agentId,
    required this.agentName,
    required this.agentResourceRoleArn,
    required this.agentStatus,
    required this.createdAt,
    required this.idleSessionTTLInSeconds,
    required this.updatedAt,
    required this.version,
    this.customerEncryptionKeyArn,
    this.description,
    this.failureReasons,
    this.foundationModel,
    this.guardrailConfiguration,
    this.instruction,
    this.promptOverrideConfiguration,
    this.recommendedActions,
  });

  factory AgentVersion.fromJson(Map<String, dynamic> json) {
    return AgentVersion(
      agentArn: json['agentArn'] as String,
      agentId: json['agentId'] as String,
      agentName: json['agentName'] as String,
      agentResourceRoleArn: json['agentResourceRoleArn'] as String,
      agentStatus: (json['agentStatus'] as String).toAgentStatus(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      foundationModel: json['foundationModel'] as String?,
      guardrailConfiguration: json['guardrailConfiguration'] != null
          ? GuardrailConfiguration.fromJson(
              json['guardrailConfiguration'] as Map<String, dynamic>)
          : null,
      instruction: json['instruction'] as String?,
      promptOverrideConfiguration: json['promptOverrideConfiguration'] != null
          ? PromptOverrideConfiguration.fromJson(
              json['promptOverrideConfiguration'] as Map<String, dynamic>)
          : null,
      recommendedActions: (json['recommendedActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentArn = this.agentArn;
    final agentId = this.agentId;
    final agentName = this.agentName;
    final agentResourceRoleArn = this.agentResourceRoleArn;
    final agentStatus = this.agentStatus;
    final createdAt = this.createdAt;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final foundationModel = this.foundationModel;
    final guardrailConfiguration = this.guardrailConfiguration;
    final instruction = this.instruction;
    final promptOverrideConfiguration = this.promptOverrideConfiguration;
    final recommendedActions = this.recommendedActions;
    return {
      'agentArn': agentArn,
      'agentId': agentId,
      'agentName': agentName,
      'agentResourceRoleArn': agentResourceRoleArn,
      'agentStatus': agentStatus.toValue(),
      'createdAt': iso8601ToJson(createdAt),
      'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (foundationModel != null) 'foundationModel': foundationModel,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (instruction != null) 'instruction': instruction,
      if (promptOverrideConfiguration != null)
        'promptOverrideConfiguration': promptOverrideConfiguration,
      if (recommendedActions != null) 'recommendedActions': recommendedActions,
    };
  }
}

/// Contains details about a version of an agent.
class AgentVersionSummary {
  /// The name of the agent to which the version belongs.
  final String agentName;

  /// The status of the agent to which the version belongs.
  final AgentStatus agentStatus;

  /// The version of the agent.
  final String agentVersion;

  /// The time at which the version was created.
  final DateTime createdAt;

  /// The time at which the version was last updated.
  final DateTime updatedAt;

  /// The description of the version of the agent.
  final String? description;

  /// The details of the guardrails configuration in the agent version summary.
  final GuardrailConfiguration? guardrailConfiguration;

  AgentVersionSummary({
    required this.agentName,
    required this.agentStatus,
    required this.agentVersion,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.guardrailConfiguration,
  });

  factory AgentVersionSummary.fromJson(Map<String, dynamic> json) {
    return AgentVersionSummary(
      agentName: json['agentName'] as String,
      agentStatus: (json['agentStatus'] as String).toAgentStatus(),
      agentVersion: json['agentVersion'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      guardrailConfiguration: json['guardrailConfiguration'] != null
          ? GuardrailConfiguration.fromJson(
              json['guardrailConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentName = this.agentName;
    final agentStatus = this.agentStatus;
    final agentVersion = this.agentVersion;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final guardrailConfiguration = this.guardrailConfiguration;
    return {
      'agentName': agentName,
      'agentStatus': agentStatus.toValue(),
      'agentVersion': agentVersion,
      'createdAt': iso8601ToJson(createdAt),
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
    };
  }
}

class AssociateAgentKnowledgeBaseResponse {
  /// Contains details about the knowledge base that has been associated with the
  /// agent.
  final AgentKnowledgeBase agentKnowledgeBase;

  AssociateAgentKnowledgeBaseResponse({
    required this.agentKnowledgeBase,
  });

  factory AssociateAgentKnowledgeBaseResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateAgentKnowledgeBaseResponse(
      agentKnowledgeBase: AgentKnowledgeBase.fromJson(
          json['agentKnowledgeBase'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agentKnowledgeBase = this.agentKnowledgeBase;
    return {
      'agentKnowledgeBase': agentKnowledgeBase,
    };
  }
}

/// The vector configuration details for the Bedrock embeddings model.
class BedrockEmbeddingModelConfiguration {
  /// The dimensions details for the vector configuration used on the Bedrock
  /// embeddings model.
  final int? dimensions;

  BedrockEmbeddingModelConfiguration({
    this.dimensions,
  });

  factory BedrockEmbeddingModelConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BedrockEmbeddingModelConfiguration(
      dimensions: json['dimensions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    return {
      if (dimensions != null) 'dimensions': dimensions,
    };
  }
}

/// Details about how to chunk the documents in the data source. A <i>chunk</i>
/// refers to an excerpt from a data source that is returned when the knowledge
/// base that it belongs to is queried.
class ChunkingConfiguration {
  /// Knowledge base can split your source data into chunks. A <i>chunk</i> refers
  /// to an excerpt from a data source that is returned when the knowledge base
  /// that it belongs to is queried. You have the following options for chunking
  /// your data. If you opt for <code>NONE</code>, then you may want to
  /// pre-process your files by splitting them up such that each file corresponds
  /// to a chunk.
  ///
  /// <ul>
  /// <li>
  /// <code>FIXED_SIZE</code> – Amazon Bedrock splits your source data into chunks
  /// of the approximate size that you set in the
  /// <code>fixedSizeChunkingConfiguration</code>.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Amazon Bedrock treats each file as one chunk. If you
  /// choose this option, you may want to pre-process your documents by splitting
  /// them into separate files.
  /// </li>
  /// </ul>
  final ChunkingStrategy chunkingStrategy;

  /// Configurations for when you choose fixed-size chunking. If you set the
  /// <code>chunkingStrategy</code> as <code>NONE</code>, exclude this field.
  final FixedSizeChunkingConfiguration? fixedSizeChunkingConfiguration;

  ChunkingConfiguration({
    required this.chunkingStrategy,
    this.fixedSizeChunkingConfiguration,
  });

  factory ChunkingConfiguration.fromJson(Map<String, dynamic> json) {
    return ChunkingConfiguration(
      chunkingStrategy:
          (json['chunkingStrategy'] as String).toChunkingStrategy(),
      fixedSizeChunkingConfiguration: json['fixedSizeChunkingConfiguration'] !=
              null
          ? FixedSizeChunkingConfiguration.fromJson(
              json['fixedSizeChunkingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final chunkingStrategy = this.chunkingStrategy;
    final fixedSizeChunkingConfiguration = this.fixedSizeChunkingConfiguration;
    return {
      'chunkingStrategy': chunkingStrategy.toValue(),
      if (fixedSizeChunkingConfiguration != null)
        'fixedSizeChunkingConfiguration': fixedSizeChunkingConfiguration,
    };
  }
}

enum ChunkingStrategy {
  fixedSize,
  none,
}

extension ChunkingStrategyValueExtension on ChunkingStrategy {
  String toValue() {
    switch (this) {
      case ChunkingStrategy.fixedSize:
        return 'FIXED_SIZE';
      case ChunkingStrategy.none:
        return 'NONE';
    }
  }
}

extension ChunkingStrategyFromString on String {
  ChunkingStrategy toChunkingStrategy() {
    switch (this) {
      case 'FIXED_SIZE':
        return ChunkingStrategy.fixedSize;
      case 'NONE':
        return ChunkingStrategy.none;
    }
    throw Exception('$this is not known in enum ChunkingStrategy');
  }
}

class CreateAgentActionGroupResponse {
  /// Contains details about the action group that was created.
  final AgentActionGroup agentActionGroup;

  CreateAgentActionGroupResponse({
    required this.agentActionGroup,
  });

  factory CreateAgentActionGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateAgentActionGroupResponse(
      agentActionGroup: AgentActionGroup.fromJson(
          json['agentActionGroup'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agentActionGroup = this.agentActionGroup;
    return {
      'agentActionGroup': agentActionGroup,
    };
  }
}

class CreateAgentAliasResponse {
  /// Contains details about the alias that was created.
  final AgentAlias agentAlias;

  CreateAgentAliasResponse({
    required this.agentAlias,
  });

  factory CreateAgentAliasResponse.fromJson(Map<String, dynamic> json) {
    return CreateAgentAliasResponse(
      agentAlias:
          AgentAlias.fromJson(json['agentAlias'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agentAlias = this.agentAlias;
    return {
      'agentAlias': agentAlias,
    };
  }
}

class CreateAgentResponse {
  /// Contains details about the agent created.
  final Agent agent;

  CreateAgentResponse({
    required this.agent,
  });

  factory CreateAgentResponse.fromJson(Map<String, dynamic> json) {
    return CreateAgentResponse(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agent = this.agent;
    return {
      'agent': agent,
    };
  }
}

class CreateDataSourceResponse {
  /// Contains details about the data source.
  final DataSource dataSource;

  CreateDataSourceResponse({
    required this.dataSource,
  });

  factory CreateDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataSourceResponse(
      dataSource:
          DataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    return {
      'dataSource': dataSource,
    };
  }
}

class CreateKnowledgeBaseResponse {
  /// Contains details about the knowledge base.
  final KnowledgeBase knowledgeBase;

  CreateKnowledgeBaseResponse({
    required this.knowledgeBase,
  });

  factory CreateKnowledgeBaseResponse.fromJson(Map<String, dynamic> json) {
    return CreateKnowledgeBaseResponse(
      knowledgeBase:
          KnowledgeBase.fromJson(json['knowledgeBase'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBase = this.knowledgeBase;
    return {
      'knowledgeBase': knowledgeBase,
    };
  }
}

enum CreationMode {
  $default,
  overridden,
}

extension CreationModeValueExtension on CreationMode {
  String toValue() {
    switch (this) {
      case CreationMode.$default:
        return 'DEFAULT';
      case CreationMode.overridden:
        return 'OVERRIDDEN';
    }
  }
}

extension CreationModeFromString on String {
  CreationMode toCreationMode() {
    switch (this) {
      case 'DEFAULT':
        return CreationMode.$default;
      case 'OVERRIDDEN':
        return CreationMode.overridden;
    }
    throw Exception('$this is not known in enum CreationMode');
  }
}

enum CustomControlMethod {
  returnControl,
}

extension CustomControlMethodValueExtension on CustomControlMethod {
  String toValue() {
    switch (this) {
      case CustomControlMethod.returnControl:
        return 'RETURN_CONTROL';
    }
  }
}

extension CustomControlMethodFromString on String {
  CustomControlMethod toCustomControlMethod() {
    switch (this) {
      case 'RETURN_CONTROL':
        return CustomControlMethod.returnControl;
    }
    throw Exception('$this is not known in enum CustomControlMethod');
  }
}

enum DataDeletionPolicy {
  retain,
  delete,
}

extension DataDeletionPolicyValueExtension on DataDeletionPolicy {
  String toValue() {
    switch (this) {
      case DataDeletionPolicy.retain:
        return 'RETAIN';
      case DataDeletionPolicy.delete:
        return 'DELETE';
    }
  }
}

extension DataDeletionPolicyFromString on String {
  DataDeletionPolicy toDataDeletionPolicy() {
    switch (this) {
      case 'RETAIN':
        return DataDeletionPolicy.retain;
      case 'DELETE':
        return DataDeletionPolicy.delete;
    }
    throw Exception('$this is not known in enum DataDeletionPolicy');
  }
}

/// Contains details about a data source.
class DataSource {
  /// The time at which the data source was created.
  final DateTime createdAt;

  /// Contains details about how the data source is stored.
  final DataSourceConfiguration dataSourceConfiguration;

  /// The unique identifier of the data source.
  final String dataSourceId;

  /// The unique identifier of the knowledge base to which the data source
  /// belongs.
  final String knowledgeBaseId;

  /// The name of the data source.
  final String name;

  /// The status of the data source. The following statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// Available – The data source has been created and is ready for ingestion into
  /// the knowledge base.
  /// </li>
  /// <li>
  /// Deleting – The data source is being deleted.
  /// </li>
  /// </ul>
  final DataSourceStatus status;

  /// The time at which the data source was last updated.
  final DateTime updatedAt;

  /// The data deletion policy for a data source.
  final DataDeletionPolicy? dataDeletionPolicy;

  /// The description of the data source.
  final String? description;

  /// The detailed reasons on the failure to delete a data source.
  final List<String>? failureReasons;

  /// Contains details about the configuration of the server-side encryption.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// Contains details about how to ingest the documents in the data source.
  final VectorIngestionConfiguration? vectorIngestionConfiguration;

  DataSource({
    required this.createdAt,
    required this.dataSourceConfiguration,
    required this.dataSourceId,
    required this.knowledgeBaseId,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.dataDeletionPolicy,
    this.description,
    this.failureReasons,
    this.serverSideEncryptionConfiguration,
    this.vectorIngestionConfiguration,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      dataSourceConfiguration: DataSourceConfiguration.fromJson(
          json['dataSourceConfiguration'] as Map<String, dynamic>),
      dataSourceId: json['dataSourceId'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toDataSourceStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      dataDeletionPolicy:
          (json['dataDeletionPolicy'] as String?)?.toDataDeletionPolicy(),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      serverSideEncryptionConfiguration:
          json['serverSideEncryptionConfiguration'] != null
              ? ServerSideEncryptionConfiguration.fromJson(
                  json['serverSideEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      vectorIngestionConfiguration: json['vectorIngestionConfiguration'] != null
          ? VectorIngestionConfiguration.fromJson(
              json['vectorIngestionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataSourceConfiguration = this.dataSourceConfiguration;
    final dataSourceId = this.dataSourceId;
    final knowledgeBaseId = this.knowledgeBaseId;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final dataDeletionPolicy = this.dataDeletionPolicy;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final vectorIngestionConfiguration = this.vectorIngestionConfiguration;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'dataSourceConfiguration': dataSourceConfiguration,
      'dataSourceId': dataSourceId,
      'knowledgeBaseId': knowledgeBaseId,
      'name': name,
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (dataDeletionPolicy != null)
        'dataDeletionPolicy': dataDeletionPolicy.toValue(),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (vectorIngestionConfiguration != null)
        'vectorIngestionConfiguration': vectorIngestionConfiguration,
    };
  }
}

/// Contains details about how a data source is stored.
class DataSourceConfiguration {
  /// The type of storage for the data source.
  final DataSourceType type;

  /// Contains details about the configuration of the S3 object containing the
  /// data source.
  final S3DataSourceConfiguration? s3Configuration;

  DataSourceConfiguration({
    required this.type,
    this.s3Configuration,
  });

  factory DataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSourceConfiguration(
      type: (json['type'] as String).toDataSourceType(),
      s3Configuration: json['s3Configuration'] != null
          ? S3DataSourceConfiguration.fromJson(
              json['s3Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final s3Configuration = this.s3Configuration;
    return {
      'type': type.toValue(),
      if (s3Configuration != null) 's3Configuration': s3Configuration,
    };
  }
}

enum DataSourceStatus {
  available,
  deleting,
  deleteUnsuccessful,
}

extension DataSourceStatusValueExtension on DataSourceStatus {
  String toValue() {
    switch (this) {
      case DataSourceStatus.available:
        return 'AVAILABLE';
      case DataSourceStatus.deleting:
        return 'DELETING';
      case DataSourceStatus.deleteUnsuccessful:
        return 'DELETE_UNSUCCESSFUL';
    }
  }
}

extension DataSourceStatusFromString on String {
  DataSourceStatus toDataSourceStatus() {
    switch (this) {
      case 'AVAILABLE':
        return DataSourceStatus.available;
      case 'DELETING':
        return DataSourceStatus.deleting;
      case 'DELETE_UNSUCCESSFUL':
        return DataSourceStatus.deleteUnsuccessful;
    }
    throw Exception('$this is not known in enum DataSourceStatus');
  }
}

/// Contains details about a data source.
class DataSourceSummary {
  /// The unique identifier of the data source.
  final String dataSourceId;

  /// The unique identifier of the knowledge base to which the data source
  /// belongs.
  final String knowledgeBaseId;

  /// The name of the data source.
  final String name;

  /// The status of the data source.
  final DataSourceStatus status;

  /// The time at which the data source was last updated.
  final DateTime updatedAt;

  /// The description of the data source.
  final String? description;

  DataSourceSummary({
    required this.dataSourceId,
    required this.knowledgeBaseId,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.description,
  });

  factory DataSourceSummary.fromJson(Map<String, dynamic> json) {
    return DataSourceSummary(
      dataSourceId: json['dataSourceId'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toDataSourceStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final knowledgeBaseId = this.knowledgeBaseId;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'dataSourceId': dataSourceId,
      'knowledgeBaseId': knowledgeBaseId,
      'name': name,
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

enum DataSourceType {
  s3,
}

extension DataSourceTypeValueExtension on DataSourceType {
  String toValue() {
    switch (this) {
      case DataSourceType.s3:
        return 'S3';
    }
  }
}

extension DataSourceTypeFromString on String {
  DataSourceType toDataSourceType() {
    switch (this) {
      case 'S3':
        return DataSourceType.s3;
    }
    throw Exception('$this is not known in enum DataSourceType');
  }
}

class DeleteAgentActionGroupResponse {
  DeleteAgentActionGroupResponse();

  factory DeleteAgentActionGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAgentActionGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAgentAliasResponse {
  /// The unique identifier of the alias that was deleted.
  final String agentAliasId;

  /// The status of the alias.
  final AgentAliasStatus agentAliasStatus;

  /// The unique identifier of the agent that the alias belongs to.
  final String agentId;

  DeleteAgentAliasResponse({
    required this.agentAliasId,
    required this.agentAliasStatus,
    required this.agentId,
  });

  factory DeleteAgentAliasResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAgentAliasResponse(
      agentAliasId: json['agentAliasId'] as String,
      agentAliasStatus:
          (json['agentAliasStatus'] as String).toAgentAliasStatus(),
      agentId: json['agentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final agentAliasId = this.agentAliasId;
    final agentAliasStatus = this.agentAliasStatus;
    final agentId = this.agentId;
    return {
      'agentAliasId': agentAliasId,
      'agentAliasStatus': agentAliasStatus.toValue(),
      'agentId': agentId,
    };
  }
}

class DeleteAgentResponse {
  /// The unique identifier of the agent that was deleted.
  final String agentId;

  /// The status of the agent.
  final AgentStatus agentStatus;

  DeleteAgentResponse({
    required this.agentId,
    required this.agentStatus,
  });

  factory DeleteAgentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAgentResponse(
      agentId: json['agentId'] as String,
      agentStatus: (json['agentStatus'] as String).toAgentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final agentStatus = this.agentStatus;
    return {
      'agentId': agentId,
      'agentStatus': agentStatus.toValue(),
    };
  }
}

class DeleteAgentVersionResponse {
  /// The unique identifier of the agent that the version belongs to.
  final String agentId;

  /// The status of the agent version.
  final AgentStatus agentStatus;

  /// The version that was deleted.
  final String agentVersion;

  DeleteAgentVersionResponse({
    required this.agentId,
    required this.agentStatus,
    required this.agentVersion,
  });

  factory DeleteAgentVersionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAgentVersionResponse(
      agentId: json['agentId'] as String,
      agentStatus: (json['agentStatus'] as String).toAgentStatus(),
      agentVersion: json['agentVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final agentStatus = this.agentStatus;
    final agentVersion = this.agentVersion;
    return {
      'agentId': agentId,
      'agentStatus': agentStatus.toValue(),
      'agentVersion': agentVersion,
    };
  }
}

class DeleteDataSourceResponse {
  /// The unique identifier of the data source that was deleted.
  final String dataSourceId;

  /// The unique identifier of the knowledge base to which the data source that
  /// was deleted belonged.
  final String knowledgeBaseId;

  /// The status of the data source.
  final DataSourceStatus status;

  DeleteDataSourceResponse({
    required this.dataSourceId,
    required this.knowledgeBaseId,
    required this.status,
  });

  factory DeleteDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDataSourceResponse(
      dataSourceId: json['dataSourceId'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      status: (json['status'] as String).toDataSourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final knowledgeBaseId = this.knowledgeBaseId;
    final status = this.status;
    return {
      'dataSourceId': dataSourceId,
      'knowledgeBaseId': knowledgeBaseId,
      'status': status.toValue(),
    };
  }
}

class DeleteKnowledgeBaseResponse {
  /// The unique identifier of the knowledge base that was deleted.
  final String knowledgeBaseId;

  /// The status of the knowledge base and whether it has been successfully
  /// deleted.
  final KnowledgeBaseStatus status;

  DeleteKnowledgeBaseResponse({
    required this.knowledgeBaseId,
    required this.status,
  });

  factory DeleteKnowledgeBaseResponse.fromJson(Map<String, dynamic> json) {
    return DeleteKnowledgeBaseResponse(
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      status: (json['status'] as String).toKnowledgeBaseStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final status = this.status;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      'status': status.toValue(),
    };
  }
}

class DisassociateAgentKnowledgeBaseResponse {
  DisassociateAgentKnowledgeBaseResponse();

  factory DisassociateAgentKnowledgeBaseResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateAgentKnowledgeBaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The configuration details for the embeddings model.
class EmbeddingModelConfiguration {
  /// The vector configuration details on the Bedrock embeddings model.
  final BedrockEmbeddingModelConfiguration? bedrockEmbeddingModelConfiguration;

  EmbeddingModelConfiguration({
    this.bedrockEmbeddingModelConfiguration,
  });

  factory EmbeddingModelConfiguration.fromJson(Map<String, dynamic> json) {
    return EmbeddingModelConfiguration(
      bedrockEmbeddingModelConfiguration:
          json['bedrockEmbeddingModelConfiguration'] != null
              ? BedrockEmbeddingModelConfiguration.fromJson(
                  json['bedrockEmbeddingModelConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bedrockEmbeddingModelConfiguration =
        this.bedrockEmbeddingModelConfiguration;
    return {
      if (bedrockEmbeddingModelConfiguration != null)
        'bedrockEmbeddingModelConfiguration':
            bedrockEmbeddingModelConfiguration,
    };
  }
}

/// Configurations for when you choose fixed-size chunking. If you set the
/// <code>chunkingStrategy</code> as <code>NONE</code>, exclude this field.
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
      maxTokens: json['maxTokens'] as int,
      overlapPercentage: json['overlapPercentage'] as int,
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

/// Defines parameters that the agent needs to invoke from the user to complete
/// the function. Corresponds to an action in an action group.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_CreateAgentActionGroup.html#API_agent_CreateAgentActionGroup_RequestSyntax">CreateAgentActionGroup
/// request</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_CreateAgentActionGroup.html#API_agent_CreateAgentActionGroup_ResponseSyntax">CreateAgentActionGroup
/// response</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_UpdateAgentActionGroup.html#API_agent_UpdateAgentActionGroup_RequestSyntax">UpdateAgentActionGroup
/// request</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_UpdateAgentActionGroup.html#API_agent_UpdateAgentActionGroup_ResponseSyntax">UpdateAgentActionGroup
/// response</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_GetAgentActionGroup.html#API_agent_GetAgentActionGroup_ResponseSyntax">GetAgentActionGroup
/// response</a>
/// </li>
/// </ul>
class $Function {
  /// A name for the function.
  final String name;

  /// A description of the function and its purpose.
  final String? description;

  /// The parameters that the agent elicits from the user to fulfill the function.
  final Map<String, ParameterDetail>? parameters;

  $Function({
    required this.name,
    this.description,
    this.parameters,
  });

  factory $Function.fromJson(Map<String, dynamic> json) {
    return $Function(
      name: json['name'] as String,
      description: json['description'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ParameterDetail.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final description = this.description;
    final parameters = this.parameters;
    return {
      'name': name,
      if (description != null) 'description': description,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// Defines functions that each define parameters that the agent needs to invoke
/// from the user. Each function represents an action in an action group.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_CreateAgentActionGroup.html#API_agent_CreateAgentActionGroup_RequestSyntax">CreateAgentActionGroup
/// request</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_CreateAgentActionGroup.html#API_agent_CreateAgentActionGroup_ResponseSyntax">CreateAgentActionGroup
/// response</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_UpdateAgentActionGroup.html#API_agent_UpdateAgentActionGroup_RequestSyntax">UpdateAgentActionGroup
/// request</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_UpdateAgentActionGroup.html#API_agent_UpdateAgentActionGroup_ResponseSyntax">UpdateAgentActionGroup
/// response</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_GetAgentActionGroup.html#API_agent_GetAgentActionGroup_ResponseSyntax">GetAgentActionGroup
/// response</a>
/// </li>
/// </ul>
class FunctionSchema {
  /// A list of functions that each define an action in the action group.
  final List<$Function>? functions;

  FunctionSchema({
    this.functions,
  });

  factory FunctionSchema.fromJson(Map<String, dynamic> json) {
    return FunctionSchema(
      functions: (json['functions'] as List?)
          ?.whereNotNull()
          .map((e) => $Function.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final functions = this.functions;
    return {
      if (functions != null) 'functions': functions,
    };
  }
}

class GetAgentActionGroupResponse {
  /// Contains details about the action group.
  final AgentActionGroup agentActionGroup;

  GetAgentActionGroupResponse({
    required this.agentActionGroup,
  });

  factory GetAgentActionGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentActionGroupResponse(
      agentActionGroup: AgentActionGroup.fromJson(
          json['agentActionGroup'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agentActionGroup = this.agentActionGroup;
    return {
      'agentActionGroup': agentActionGroup,
    };
  }
}

class GetAgentAliasResponse {
  /// Contains information about the alias.
  final AgentAlias agentAlias;

  GetAgentAliasResponse({
    required this.agentAlias,
  });

  factory GetAgentAliasResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentAliasResponse(
      agentAlias:
          AgentAlias.fromJson(json['agentAlias'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agentAlias = this.agentAlias;
    return {
      'agentAlias': agentAlias,
    };
  }
}

class GetAgentKnowledgeBaseResponse {
  /// Contains details about a knowledge base attached to an agent.
  final AgentKnowledgeBase agentKnowledgeBase;

  GetAgentKnowledgeBaseResponse({
    required this.agentKnowledgeBase,
  });

  factory GetAgentKnowledgeBaseResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentKnowledgeBaseResponse(
      agentKnowledgeBase: AgentKnowledgeBase.fromJson(
          json['agentKnowledgeBase'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agentKnowledgeBase = this.agentKnowledgeBase;
    return {
      'agentKnowledgeBase': agentKnowledgeBase,
    };
  }
}

class GetAgentResponse {
  /// Contains details about the agent.
  final Agent agent;

  GetAgentResponse({
    required this.agent,
  });

  factory GetAgentResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentResponse(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agent = this.agent;
    return {
      'agent': agent,
    };
  }
}

class GetAgentVersionResponse {
  /// Contains details about the version of the agent.
  final AgentVersion agentVersion;

  GetAgentVersionResponse({
    required this.agentVersion,
  });

  factory GetAgentVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentVersionResponse(
      agentVersion:
          AgentVersion.fromJson(json['agentVersion'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agentVersion = this.agentVersion;
    return {
      'agentVersion': agentVersion,
    };
  }
}

class GetDataSourceResponse {
  /// Contains details about the data source.
  final DataSource dataSource;

  GetDataSourceResponse({
    required this.dataSource,
  });

  factory GetDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return GetDataSourceResponse(
      dataSource:
          DataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    return {
      'dataSource': dataSource,
    };
  }
}

class GetIngestionJobResponse {
  /// Contains details about the ingestion job.
  final IngestionJob ingestionJob;

  GetIngestionJobResponse({
    required this.ingestionJob,
  });

  factory GetIngestionJobResponse.fromJson(Map<String, dynamic> json) {
    return GetIngestionJobResponse(
      ingestionJob:
          IngestionJob.fromJson(json['ingestionJob'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionJob = this.ingestionJob;
    return {
      'ingestionJob': ingestionJob,
    };
  }
}

class GetKnowledgeBaseResponse {
  /// Contains details about the knowledge base.
  final KnowledgeBase knowledgeBase;

  GetKnowledgeBaseResponse({
    required this.knowledgeBase,
  });

  factory GetKnowledgeBaseResponse.fromJson(Map<String, dynamic> json) {
    return GetKnowledgeBaseResponse(
      knowledgeBase:
          KnowledgeBase.fromJson(json['knowledgeBase'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBase = this.knowledgeBase;
    return {
      'knowledgeBase': knowledgeBase,
    };
  }
}

/// The details of the guardrails configuration.
class GuardrailConfiguration {
  /// The guardrails identifier assigned to the guardrails configuration.
  final String? guardrailIdentifier;

  /// The guardrails version assigned to the guardrails configuration.
  final String? guardrailVersion;

  GuardrailConfiguration({
    this.guardrailIdentifier,
    this.guardrailVersion,
  });

  factory GuardrailConfiguration.fromJson(Map<String, dynamic> json) {
    return GuardrailConfiguration(
      guardrailIdentifier: json['guardrailIdentifier'] as String?,
      guardrailVersion: json['guardrailVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final guardrailIdentifier = this.guardrailIdentifier;
    final guardrailVersion = this.guardrailVersion;
    return {
      if (guardrailIdentifier != null)
        'guardrailIdentifier': guardrailIdentifier,
      if (guardrailVersion != null) 'guardrailVersion': guardrailVersion,
    };
  }
}

/// Contains inference parameters to use when the agent invokes a foundation
/// model in the part of the agent sequence defined by the
/// <code>promptType</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
/// parameters for foundation models</a>.
class InferenceConfiguration {
  /// The maximum number of tokens to allow in the generated response.
  final int? maximumLength;

  /// A list of stop sequences. A stop sequence is a sequence of characters that
  /// causes the model to stop generating the response.
  final List<String>? stopSequences;

  /// The likelihood of the model selecting higher-probability options while
  /// generating a response. A lower value makes the model more likely to choose
  /// higher-probability options, while a higher value makes the model more likely
  /// to choose lower-probability options.
  final double? temperature;

  /// While generating a response, the model determines the probability of the
  /// following token at each point of generation. The value that you set for
  /// <code>topK</code> is the number of most-likely candidates from which the
  /// model chooses the next token in the sequence. For example, if you set
  /// <code>topK</code> to 50, the model selects the next token from among the top
  /// 50 most likely choices.
  final int? topK;

  /// While generating a response, the model determines the probability of the
  /// following token at each point of generation. The value that you set for
  /// <code>Top P</code> determines the number of most-likely candidates from
  /// which the model chooses the next token in the sequence. For example, if you
  /// set <code>topP</code> to 80, the model only selects the next token from the
  /// top 80% of the probability distribution of next tokens.
  final double? topP;

  InferenceConfiguration({
    this.maximumLength,
    this.stopSequences,
    this.temperature,
    this.topK,
    this.topP,
  });

  factory InferenceConfiguration.fromJson(Map<String, dynamic> json) {
    return InferenceConfiguration(
      maximumLength: json['maximumLength'] as int?,
      stopSequences: (json['stopSequences'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      temperature: json['temperature'] as double?,
      topK: json['topK'] as int?,
      topP: json['topP'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumLength = this.maximumLength;
    final stopSequences = this.stopSequences;
    final temperature = this.temperature;
    final topK = this.topK;
    final topP = this.topP;
    return {
      if (maximumLength != null) 'maximumLength': maximumLength,
      if (stopSequences != null) 'stopSequences': stopSequences,
      if (temperature != null) 'temperature': temperature,
      if (topK != null) 'topK': topK,
      if (topP != null) 'topP': topP,
    };
  }
}

/// Contains details about an ingestion job, which converts a data source to
/// embeddings for a vector store in knowledge base.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_StartIngestionJob.html#API_agent_StartIngestionJob_ResponseSyntax">StartIngestionJob
/// response</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_GetIngestionJob.html#API_agent_GetIngestionJob_ResponseSyntax">GetIngestionJob
/// response</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_ListIngestionJobs.html#API_agent_ListIngestionJobs_ResponseSyntax">ListIngestionJob
/// response</a>
/// </li>
/// </ul>
class IngestionJob {
  /// The unique identifier of the ingested data source.
  final String dataSourceId;

  /// The unique identifier of the ingestion job.
  final String ingestionJobId;

  /// The unique identifier of the knowledge base to which the data source is
  /// being added.
  final String knowledgeBaseId;

  /// The time at which the ingestion job started.
  final DateTime startedAt;

  /// The status of the ingestion job.
  final IngestionJobStatus status;

  /// The time at which the ingestion job was last updated.
  final DateTime updatedAt;

  /// The description of the ingestion job.
  final String? description;

  /// A list of reasons that the ingestion job failed.
  final List<String>? failureReasons;

  /// Contains statistics about the ingestion job.
  final IngestionJobStatistics? statistics;

  IngestionJob({
    required this.dataSourceId,
    required this.ingestionJobId,
    required this.knowledgeBaseId,
    required this.startedAt,
    required this.status,
    required this.updatedAt,
    this.description,
    this.failureReasons,
    this.statistics,
  });

  factory IngestionJob.fromJson(Map<String, dynamic> json) {
    return IngestionJob(
      dataSourceId: json['dataSourceId'] as String,
      ingestionJobId: json['ingestionJobId'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] as Object),
      status: (json['status'] as String).toIngestionJobStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      statistics: json['statistics'] != null
          ? IngestionJobStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final ingestionJobId = this.ingestionJobId;
    final knowledgeBaseId = this.knowledgeBaseId;
    final startedAt = this.startedAt;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final statistics = this.statistics;
    return {
      'dataSourceId': dataSourceId,
      'ingestionJobId': ingestionJobId,
      'knowledgeBaseId': knowledgeBaseId,
      'startedAt': iso8601ToJson(startedAt),
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (statistics != null) 'statistics': statistics,
    };
  }
}

/// Defines a filter by which to filter the results.
class IngestionJobFilter {
  /// The attribute by which to filter the results.
  final IngestionJobFilterAttribute attribute;

  /// The operation to carry out between the attribute and the values.
  final IngestionJobFilterOperator operator;

  /// A list of values for the attribute.
  final List<String> values;

  IngestionJobFilter({
    required this.attribute,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final operator = this.operator;
    final values = this.values;
    return {
      'attribute': attribute.toValue(),
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

enum IngestionJobFilterAttribute {
  status,
}

extension IngestionJobFilterAttributeValueExtension
    on IngestionJobFilterAttribute {
  String toValue() {
    switch (this) {
      case IngestionJobFilterAttribute.status:
        return 'STATUS';
    }
  }
}

extension IngestionJobFilterAttributeFromString on String {
  IngestionJobFilterAttribute toIngestionJobFilterAttribute() {
    switch (this) {
      case 'STATUS':
        return IngestionJobFilterAttribute.status;
    }
    throw Exception('$this is not known in enum IngestionJobFilterAttribute');
  }
}

enum IngestionJobFilterOperator {
  eq,
}

extension IngestionJobFilterOperatorValueExtension
    on IngestionJobFilterOperator {
  String toValue() {
    switch (this) {
      case IngestionJobFilterOperator.eq:
        return 'EQ';
    }
  }
}

extension IngestionJobFilterOperatorFromString on String {
  IngestionJobFilterOperator toIngestionJobFilterOperator() {
    switch (this) {
      case 'EQ':
        return IngestionJobFilterOperator.eq;
    }
    throw Exception('$this is not known in enum IngestionJobFilterOperator');
  }
}

/// Parameters by which to sort the results.
class IngestionJobSortBy {
  /// The attribute by which to sort the results.
  final IngestionJobSortByAttribute attribute;

  /// The order by which to sort the results.
  final SortOrder order;

  IngestionJobSortBy({
    required this.attribute,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute.toValue(),
      'order': order.toValue(),
    };
  }
}

enum IngestionJobSortByAttribute {
  status,
  startedAt,
}

extension IngestionJobSortByAttributeValueExtension
    on IngestionJobSortByAttribute {
  String toValue() {
    switch (this) {
      case IngestionJobSortByAttribute.status:
        return 'STATUS';
      case IngestionJobSortByAttribute.startedAt:
        return 'STARTED_AT';
    }
  }
}

extension IngestionJobSortByAttributeFromString on String {
  IngestionJobSortByAttribute toIngestionJobSortByAttribute() {
    switch (this) {
      case 'STATUS':
        return IngestionJobSortByAttribute.status;
      case 'STARTED_AT':
        return IngestionJobSortByAttribute.startedAt;
    }
    throw Exception('$this is not known in enum IngestionJobSortByAttribute');
  }
}

/// Contains the statistics for the ingestion job.
class IngestionJobStatistics {
  /// The number of source documents that was deleted.
  final int? numberOfDocumentsDeleted;

  /// The number of source documents that failed to be ingested.
  final int? numberOfDocumentsFailed;

  /// The total number of source documents that were scanned. Includes new,
  /// updated, and unchanged documents.
  final int? numberOfDocumentsScanned;

  /// The number of metadata files that were updated or deleted.
  final int? numberOfMetadataDocumentsModified;

  /// The total number of metadata files that were scanned. Includes new, updated,
  /// and unchanged files.
  final int? numberOfMetadataDocumentsScanned;

  /// The number of modified source documents in the data source that were
  /// successfully indexed.
  final int? numberOfModifiedDocumentsIndexed;

  /// The number of new source documents in the data source that were successfully
  /// indexed.
  final int? numberOfNewDocumentsIndexed;

  IngestionJobStatistics({
    this.numberOfDocumentsDeleted,
    this.numberOfDocumentsFailed,
    this.numberOfDocumentsScanned,
    this.numberOfMetadataDocumentsModified,
    this.numberOfMetadataDocumentsScanned,
    this.numberOfModifiedDocumentsIndexed,
    this.numberOfNewDocumentsIndexed,
  });

  factory IngestionJobStatistics.fromJson(Map<String, dynamic> json) {
    return IngestionJobStatistics(
      numberOfDocumentsDeleted: json['numberOfDocumentsDeleted'] as int?,
      numberOfDocumentsFailed: json['numberOfDocumentsFailed'] as int?,
      numberOfDocumentsScanned: json['numberOfDocumentsScanned'] as int?,
      numberOfMetadataDocumentsModified:
          json['numberOfMetadataDocumentsModified'] as int?,
      numberOfMetadataDocumentsScanned:
          json['numberOfMetadataDocumentsScanned'] as int?,
      numberOfModifiedDocumentsIndexed:
          json['numberOfModifiedDocumentsIndexed'] as int?,
      numberOfNewDocumentsIndexed: json['numberOfNewDocumentsIndexed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfDocumentsDeleted = this.numberOfDocumentsDeleted;
    final numberOfDocumentsFailed = this.numberOfDocumentsFailed;
    final numberOfDocumentsScanned = this.numberOfDocumentsScanned;
    final numberOfMetadataDocumentsModified =
        this.numberOfMetadataDocumentsModified;
    final numberOfMetadataDocumentsScanned =
        this.numberOfMetadataDocumentsScanned;
    final numberOfModifiedDocumentsIndexed =
        this.numberOfModifiedDocumentsIndexed;
    final numberOfNewDocumentsIndexed = this.numberOfNewDocumentsIndexed;
    return {
      if (numberOfDocumentsDeleted != null)
        'numberOfDocumentsDeleted': numberOfDocumentsDeleted,
      if (numberOfDocumentsFailed != null)
        'numberOfDocumentsFailed': numberOfDocumentsFailed,
      if (numberOfDocumentsScanned != null)
        'numberOfDocumentsScanned': numberOfDocumentsScanned,
      if (numberOfMetadataDocumentsModified != null)
        'numberOfMetadataDocumentsModified': numberOfMetadataDocumentsModified,
      if (numberOfMetadataDocumentsScanned != null)
        'numberOfMetadataDocumentsScanned': numberOfMetadataDocumentsScanned,
      if (numberOfModifiedDocumentsIndexed != null)
        'numberOfModifiedDocumentsIndexed': numberOfModifiedDocumentsIndexed,
      if (numberOfNewDocumentsIndexed != null)
        'numberOfNewDocumentsIndexed': numberOfNewDocumentsIndexed,
    };
  }
}

enum IngestionJobStatus {
  starting,
  inProgress,
  complete,
  failed,
}

extension IngestionJobStatusValueExtension on IngestionJobStatus {
  String toValue() {
    switch (this) {
      case IngestionJobStatus.starting:
        return 'STARTING';
      case IngestionJobStatus.inProgress:
        return 'IN_PROGRESS';
      case IngestionJobStatus.complete:
        return 'COMPLETE';
      case IngestionJobStatus.failed:
        return 'FAILED';
    }
  }
}

extension IngestionJobStatusFromString on String {
  IngestionJobStatus toIngestionJobStatus() {
    switch (this) {
      case 'STARTING':
        return IngestionJobStatus.starting;
      case 'IN_PROGRESS':
        return IngestionJobStatus.inProgress;
      case 'COMPLETE':
        return IngestionJobStatus.complete;
      case 'FAILED':
        return IngestionJobStatus.failed;
    }
    throw Exception('$this is not known in enum IngestionJobStatus');
  }
}

/// Contains details about an ingestion job.
class IngestionJobSummary {
  /// The unique identifier of the data source in the ingestion job.
  final String dataSourceId;

  /// The unique identifier of the ingestion job.
  final String ingestionJobId;

  /// The unique identifier of the knowledge base to which the data source is
  /// added.
  final String knowledgeBaseId;

  /// The time at which the ingestion job was started.
  final DateTime startedAt;

  /// The status of the ingestion job.
  final IngestionJobStatus status;

  /// The time at which the ingestion job was last updated.
  final DateTime updatedAt;

  /// The description of the ingestion job.
  final String? description;

  /// Contains statistics for the ingestion job.
  final IngestionJobStatistics? statistics;

  IngestionJobSummary({
    required this.dataSourceId,
    required this.ingestionJobId,
    required this.knowledgeBaseId,
    required this.startedAt,
    required this.status,
    required this.updatedAt,
    this.description,
    this.statistics,
  });

  factory IngestionJobSummary.fromJson(Map<String, dynamic> json) {
    return IngestionJobSummary(
      dataSourceId: json['dataSourceId'] as String,
      ingestionJobId: json['ingestionJobId'] as String,
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] as Object),
      status: (json['status'] as String).toIngestionJobStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      statistics: json['statistics'] != null
          ? IngestionJobStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final ingestionJobId = this.ingestionJobId;
    final knowledgeBaseId = this.knowledgeBaseId;
    final startedAt = this.startedAt;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final statistics = this.statistics;
    return {
      'dataSourceId': dataSourceId,
      'ingestionJobId': ingestionJobId,
      'knowledgeBaseId': knowledgeBaseId,
      'startedAt': iso8601ToJson(startedAt),
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (statistics != null) 'statistics': statistics,
    };
  }
}

/// Contains information about a knowledge base.
class KnowledgeBase {
  /// The time at which the knowledge base was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the knowledge base.
  final String knowledgeBaseArn;

  /// Contains details about the embeddings configuration of the knowledge base.
  final KnowledgeBaseConfiguration knowledgeBaseConfiguration;

  /// The unique identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The name of the knowledge base.
  final String name;

  /// The Amazon Resource Name (ARN) of the IAM role with permissions to invoke
  /// API operations on the knowledge base.
  final String roleArn;

  /// The status of the knowledge base. The following statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// CREATING – The knowledge base is being created.
  /// </li>
  /// <li>
  /// ACTIVE – The knowledge base is ready to be queried.
  /// </li>
  /// <li>
  /// DELETING – The knowledge base is being deleted.
  /// </li>
  /// <li>
  /// UPDATING – The knowledge base is being updated.
  /// </li>
  /// <li>
  /// FAILED – The knowledge base API operation failed.
  /// </li>
  /// </ul>
  final KnowledgeBaseStatus status;

  /// Contains details about the storage configuration of the knowledge base.
  final StorageConfiguration storageConfiguration;

  /// The time at which the knowledge base was last updated.
  final DateTime updatedAt;

  /// The description of the knowledge base.
  final String? description;

  /// A list of reasons that the API operation on the knowledge base failed.
  final List<String>? failureReasons;

  KnowledgeBase({
    required this.createdAt,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseConfiguration,
    required this.knowledgeBaseId,
    required this.name,
    required this.roleArn,
    required this.status,
    required this.storageConfiguration,
    required this.updatedAt,
    this.description,
    this.failureReasons,
  });

  factory KnowledgeBase.fromJson(Map<String, dynamic> json) {
    return KnowledgeBase(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      knowledgeBaseArn: json['knowledgeBaseArn'] as String,
      knowledgeBaseConfiguration: KnowledgeBaseConfiguration.fromJson(
          json['knowledgeBaseConfiguration'] as Map<String, dynamic>),
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      name: json['name'] as String,
      roleArn: json['roleArn'] as String,
      status: (json['status'] as String).toKnowledgeBaseStatus(),
      storageConfiguration: StorageConfiguration.fromJson(
          json['storageConfiguration'] as Map<String, dynamic>),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final knowledgeBaseArn = this.knowledgeBaseArn;
    final knowledgeBaseConfiguration = this.knowledgeBaseConfiguration;
    final knowledgeBaseId = this.knowledgeBaseId;
    final name = this.name;
    final roleArn = this.roleArn;
    final status = this.status;
    final storageConfiguration = this.storageConfiguration;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final failureReasons = this.failureReasons;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseConfiguration': knowledgeBaseConfiguration,
      'knowledgeBaseId': knowledgeBaseId,
      'name': name,
      'roleArn': roleArn,
      'status': status.toValue(),
      'storageConfiguration': storageConfiguration,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
    };
  }
}

/// Contains details about the embeddings configuration of the knowledge base.
class KnowledgeBaseConfiguration {
  /// The type of data that the data source is converted into for the knowledge
  /// base.
  final KnowledgeBaseType type;

  /// Contains details about the embeddings model that'sused to convert the data
  /// source.
  final VectorKnowledgeBaseConfiguration? vectorKnowledgeBaseConfiguration;

  KnowledgeBaseConfiguration({
    required this.type,
    this.vectorKnowledgeBaseConfiguration,
  });

  factory KnowledgeBaseConfiguration.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseConfiguration(
      type: (json['type'] as String).toKnowledgeBaseType(),
      vectorKnowledgeBaseConfiguration:
          json['vectorKnowledgeBaseConfiguration'] != null
              ? VectorKnowledgeBaseConfiguration.fromJson(
                  json['vectorKnowledgeBaseConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final vectorKnowledgeBaseConfiguration =
        this.vectorKnowledgeBaseConfiguration;
    return {
      'type': type.toValue(),
      if (vectorKnowledgeBaseConfiguration != null)
        'vectorKnowledgeBaseConfiguration': vectorKnowledgeBaseConfiguration,
    };
  }
}

enum KnowledgeBaseState {
  enabled,
  disabled,
}

extension KnowledgeBaseStateValueExtension on KnowledgeBaseState {
  String toValue() {
    switch (this) {
      case KnowledgeBaseState.enabled:
        return 'ENABLED';
      case KnowledgeBaseState.disabled:
        return 'DISABLED';
    }
  }
}

extension KnowledgeBaseStateFromString on String {
  KnowledgeBaseState toKnowledgeBaseState() {
    switch (this) {
      case 'ENABLED':
        return KnowledgeBaseState.enabled;
      case 'DISABLED':
        return KnowledgeBaseState.disabled;
    }
    throw Exception('$this is not known in enum KnowledgeBaseState');
  }
}

enum KnowledgeBaseStatus {
  creating,
  active,
  deleting,
  updating,
  failed,
  deleteUnsuccessful,
}

extension KnowledgeBaseStatusValueExtension on KnowledgeBaseStatus {
  String toValue() {
    switch (this) {
      case KnowledgeBaseStatus.creating:
        return 'CREATING';
      case KnowledgeBaseStatus.active:
        return 'ACTIVE';
      case KnowledgeBaseStatus.deleting:
        return 'DELETING';
      case KnowledgeBaseStatus.updating:
        return 'UPDATING';
      case KnowledgeBaseStatus.failed:
        return 'FAILED';
      case KnowledgeBaseStatus.deleteUnsuccessful:
        return 'DELETE_UNSUCCESSFUL';
    }
  }
}

extension KnowledgeBaseStatusFromString on String {
  KnowledgeBaseStatus toKnowledgeBaseStatus() {
    switch (this) {
      case 'CREATING':
        return KnowledgeBaseStatus.creating;
      case 'ACTIVE':
        return KnowledgeBaseStatus.active;
      case 'DELETING':
        return KnowledgeBaseStatus.deleting;
      case 'UPDATING':
        return KnowledgeBaseStatus.updating;
      case 'FAILED':
        return KnowledgeBaseStatus.failed;
      case 'DELETE_UNSUCCESSFUL':
        return KnowledgeBaseStatus.deleteUnsuccessful;
    }
    throw Exception('$this is not known in enum KnowledgeBaseStatus');
  }
}

enum KnowledgeBaseStorageType {
  opensearchServerless,
  pinecone,
  redisEnterpriseCloud,
  rds,
  mongoDbAtlas,
}

extension KnowledgeBaseStorageTypeValueExtension on KnowledgeBaseStorageType {
  String toValue() {
    switch (this) {
      case KnowledgeBaseStorageType.opensearchServerless:
        return 'OPENSEARCH_SERVERLESS';
      case KnowledgeBaseStorageType.pinecone:
        return 'PINECONE';
      case KnowledgeBaseStorageType.redisEnterpriseCloud:
        return 'REDIS_ENTERPRISE_CLOUD';
      case KnowledgeBaseStorageType.rds:
        return 'RDS';
      case KnowledgeBaseStorageType.mongoDbAtlas:
        return 'MONGO_DB_ATLAS';
    }
  }
}

extension KnowledgeBaseStorageTypeFromString on String {
  KnowledgeBaseStorageType toKnowledgeBaseStorageType() {
    switch (this) {
      case 'OPENSEARCH_SERVERLESS':
        return KnowledgeBaseStorageType.opensearchServerless;
      case 'PINECONE':
        return KnowledgeBaseStorageType.pinecone;
      case 'REDIS_ENTERPRISE_CLOUD':
        return KnowledgeBaseStorageType.redisEnterpriseCloud;
      case 'RDS':
        return KnowledgeBaseStorageType.rds;
      case 'MONGO_DB_ATLAS':
        return KnowledgeBaseStorageType.mongoDbAtlas;
    }
    throw Exception('$this is not known in enum KnowledgeBaseStorageType');
  }
}

/// Contains details about a knowledge base.
class KnowledgeBaseSummary {
  /// The unique identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The name of the knowledge base.
  final String name;

  /// The status of the knowledge base.
  final KnowledgeBaseStatus status;

  /// The time at which the knowledge base was last updated.
  final DateTime updatedAt;

  /// The description of the knowledge base.
  final String? description;

  KnowledgeBaseSummary({
    required this.knowledgeBaseId,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.description,
  });

  factory KnowledgeBaseSummary.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseSummary(
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toKnowledgeBaseStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      'name': name,
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

enum KnowledgeBaseType {
  vector,
}

extension KnowledgeBaseTypeValueExtension on KnowledgeBaseType {
  String toValue() {
    switch (this) {
      case KnowledgeBaseType.vector:
        return 'VECTOR';
    }
  }
}

extension KnowledgeBaseTypeFromString on String {
  KnowledgeBaseType toKnowledgeBaseType() {
    switch (this) {
      case 'VECTOR':
        return KnowledgeBaseType.vector;
    }
    throw Exception('$this is not known in enum KnowledgeBaseType');
  }
}

class ListAgentActionGroupsResponse {
  /// A list of objects, each of which contains information about an action group.
  final List<ActionGroupSummary> actionGroupSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListAgentActionGroupsResponse({
    required this.actionGroupSummaries,
    this.nextToken,
  });

  factory ListAgentActionGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListAgentActionGroupsResponse(
      actionGroupSummaries: (json['actionGroupSummaries'] as List)
          .whereNotNull()
          .map((e) => ActionGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroupSummaries = this.actionGroupSummaries;
    final nextToken = this.nextToken;
    return {
      'actionGroupSummaries': actionGroupSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAgentAliasesResponse {
  /// A list of objects, each of which contains information about an alias of the
  /// agent.
  final List<AgentAliasSummary> agentAliasSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListAgentAliasesResponse({
    required this.agentAliasSummaries,
    this.nextToken,
  });

  factory ListAgentAliasesResponse.fromJson(Map<String, dynamic> json) {
    return ListAgentAliasesResponse(
      agentAliasSummaries: (json['agentAliasSummaries'] as List)
          .whereNotNull()
          .map((e) => AgentAliasSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentAliasSummaries = this.agentAliasSummaries;
    final nextToken = this.nextToken;
    return {
      'agentAliasSummaries': agentAliasSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAgentKnowledgeBasesResponse {
  /// A list of objects, each of which contains information about a knowledge base
  /// associated with the agent.
  final List<AgentKnowledgeBaseSummary> agentKnowledgeBaseSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListAgentKnowledgeBasesResponse({
    required this.agentKnowledgeBaseSummaries,
    this.nextToken,
  });

  factory ListAgentKnowledgeBasesResponse.fromJson(Map<String, dynamic> json) {
    return ListAgentKnowledgeBasesResponse(
      agentKnowledgeBaseSummaries: (json['agentKnowledgeBaseSummaries'] as List)
          .whereNotNull()
          .map((e) =>
              AgentKnowledgeBaseSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentKnowledgeBaseSummaries = this.agentKnowledgeBaseSummaries;
    final nextToken = this.nextToken;
    return {
      'agentKnowledgeBaseSummaries': agentKnowledgeBaseSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAgentVersionsResponse {
  /// A list of objects, each of which contains information about a version of the
  /// agent.
  final List<AgentVersionSummary> agentVersionSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListAgentVersionsResponse({
    required this.agentVersionSummaries,
    this.nextToken,
  });

  factory ListAgentVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAgentVersionsResponse(
      agentVersionSummaries: (json['agentVersionSummaries'] as List)
          .whereNotNull()
          .map((e) => AgentVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentVersionSummaries = this.agentVersionSummaries;
    final nextToken = this.nextToken;
    return {
      'agentVersionSummaries': agentVersionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAgentsResponse {
  /// A list of objects, each of which contains information about an agent.
  final List<AgentSummary> agentSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListAgentsResponse({
    required this.agentSummaries,
    this.nextToken,
  });

  factory ListAgentsResponse.fromJson(Map<String, dynamic> json) {
    return ListAgentsResponse(
      agentSummaries: (json['agentSummaries'] as List)
          .whereNotNull()
          .map((e) => AgentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSummaries = this.agentSummaries;
    final nextToken = this.nextToken;
    return {
      'agentSummaries': agentSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDataSourcesResponse {
  /// A list of objects, each of which contains information about a data source.
  final List<DataSourceSummary> dataSourceSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListDataSourcesResponse({
    required this.dataSourceSummaries,
    this.nextToken,
  });

  factory ListDataSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSourcesResponse(
      dataSourceSummaries: (json['dataSourceSummaries'] as List)
          .whereNotNull()
          .map((e) => DataSourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceSummaries = this.dataSourceSummaries;
    final nextToken = this.nextToken;
    return {
      'dataSourceSummaries': dataSourceSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListIngestionJobsResponse {
  /// A list of objects, each of which contains information about an ingestion
  /// job.
  final List<IngestionJobSummary> ingestionJobSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListIngestionJobsResponse({
    required this.ingestionJobSummaries,
    this.nextToken,
  });

  factory ListIngestionJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListIngestionJobsResponse(
      ingestionJobSummaries: (json['ingestionJobSummaries'] as List)
          .whereNotNull()
          .map((e) => IngestionJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionJobSummaries = this.ingestionJobSummaries;
    final nextToken = this.nextToken;
    return {
      'ingestionJobSummaries': ingestionJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListKnowledgeBasesResponse {
  /// A list of objects, each of which contains information about a knowledge
  /// base.
  final List<KnowledgeBaseSummary> knowledgeBaseSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
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
  /// The key-value pairs for the tags associated with the resource.
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

/// Contains details about the storage configuration of the knowledge base in
/// MongoDB Atlas.
class MongoDbAtlasConfiguration {
  /// The collection name of the knowledge base in MongoDB Atlas.
  final String collectionName;

  /// The Amazon Resource Name (ARN) of the secret that you created in Secrets
  /// Manager that contains user credentials for your MongoDB Atlas cluster.
  final String credentialsSecretArn;

  /// The database name in your MongoDB Atlas cluster for your knowledge base.
  final String databaseName;

  /// The endpoint URL of your MongoDB Atlas cluster for your knowledge base.
  final String endpoint;

  /// Contains the names of the fields to which to map information about the
  /// vector store.
  final MongoDbAtlasFieldMapping fieldMapping;

  /// The name of the MongoDB Atlas vector search index.
  final String vectorIndexName;

  /// The name of the VPC endpoint service in your account that is connected to
  /// your MongoDB Atlas cluster.
  final String? endpointServiceName;

  MongoDbAtlasConfiguration({
    required this.collectionName,
    required this.credentialsSecretArn,
    required this.databaseName,
    required this.endpoint,
    required this.fieldMapping,
    required this.vectorIndexName,
    this.endpointServiceName,
  });

  factory MongoDbAtlasConfiguration.fromJson(Map<String, dynamic> json) {
    return MongoDbAtlasConfiguration(
      collectionName: json['collectionName'] as String,
      credentialsSecretArn: json['credentialsSecretArn'] as String,
      databaseName: json['databaseName'] as String,
      endpoint: json['endpoint'] as String,
      fieldMapping: MongoDbAtlasFieldMapping.fromJson(
          json['fieldMapping'] as Map<String, dynamic>),
      vectorIndexName: json['vectorIndexName'] as String,
      endpointServiceName: json['endpointServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionName = this.collectionName;
    final credentialsSecretArn = this.credentialsSecretArn;
    final databaseName = this.databaseName;
    final endpoint = this.endpoint;
    final fieldMapping = this.fieldMapping;
    final vectorIndexName = this.vectorIndexName;
    final endpointServiceName = this.endpointServiceName;
    return {
      'collectionName': collectionName,
      'credentialsSecretArn': credentialsSecretArn,
      'databaseName': databaseName,
      'endpoint': endpoint,
      'fieldMapping': fieldMapping,
      'vectorIndexName': vectorIndexName,
      if (endpointServiceName != null)
        'endpointServiceName': endpointServiceName,
    };
  }
}

/// Contains the names of the fields to which to map information about the
/// vector store.
class MongoDbAtlasFieldMapping {
  /// The name of the field in which Amazon Bedrock stores metadata about the
  /// vector store.
  final String metadataField;

  /// The name of the field in which Amazon Bedrock stores the raw text from your
  /// data. The text is split according to the chunking strategy you choose.
  final String textField;

  /// The name of the field in which Amazon Bedrock stores the vector embeddings
  /// for your data sources.
  final String vectorField;

  MongoDbAtlasFieldMapping({
    required this.metadataField,
    required this.textField,
    required this.vectorField,
  });

  factory MongoDbAtlasFieldMapping.fromJson(Map<String, dynamic> json) {
    return MongoDbAtlasFieldMapping(
      metadataField: json['metadataField'] as String,
      textField: json['textField'] as String,
      vectorField: json['vectorField'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataField = this.metadataField;
    final textField = this.textField;
    final vectorField = this.vectorField;
    return {
      'metadataField': metadataField,
      'textField': textField,
      'vectorField': vectorField,
    };
  }
}

/// Contains details about the storage configuration of the knowledge base in
/// Amazon OpenSearch Service. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-oss.html">Create
/// a vector index in Amazon OpenSearch Service</a>.
class OpenSearchServerlessConfiguration {
  /// The Amazon Resource Name (ARN) of the OpenSearch Service vector store.
  final String collectionArn;

  /// Contains the names of the fields to which to map information about the
  /// vector store.
  final OpenSearchServerlessFieldMapping fieldMapping;

  /// The name of the vector store.
  final String vectorIndexName;

  OpenSearchServerlessConfiguration({
    required this.collectionArn,
    required this.fieldMapping,
    required this.vectorIndexName,
  });

  factory OpenSearchServerlessConfiguration.fromJson(
      Map<String, dynamic> json) {
    return OpenSearchServerlessConfiguration(
      collectionArn: json['collectionArn'] as String,
      fieldMapping: OpenSearchServerlessFieldMapping.fromJson(
          json['fieldMapping'] as Map<String, dynamic>),
      vectorIndexName: json['vectorIndexName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionArn = this.collectionArn;
    final fieldMapping = this.fieldMapping;
    final vectorIndexName = this.vectorIndexName;
    return {
      'collectionArn': collectionArn,
      'fieldMapping': fieldMapping,
      'vectorIndexName': vectorIndexName,
    };
  }
}

/// Contains the names of the fields to which to map information about the
/// vector store.
class OpenSearchServerlessFieldMapping {
  /// The name of the field in which Amazon Bedrock stores metadata about the
  /// vector store.
  final String metadataField;

  /// The name of the field in which Amazon Bedrock stores the raw text from your
  /// data. The text is split according to the chunking strategy you choose.
  final String textField;

  /// The name of the field in which Amazon Bedrock stores the vector embeddings
  /// for your data sources.
  final String vectorField;

  OpenSearchServerlessFieldMapping({
    required this.metadataField,
    required this.textField,
    required this.vectorField,
  });

  factory OpenSearchServerlessFieldMapping.fromJson(Map<String, dynamic> json) {
    return OpenSearchServerlessFieldMapping(
      metadataField: json['metadataField'] as String,
      textField: json['textField'] as String,
      vectorField: json['vectorField'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataField = this.metadataField;
    final textField = this.textField;
    final vectorField = this.vectorField;
    return {
      'metadataField': metadataField,
      'textField': textField,
      'vectorField': vectorField,
    };
  }
}

/// Contains details about a parameter in a function for an action group.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_CreateAgentActionGroup.html#API_agent_CreateAgentActionGroup_RequestSyntax">CreateAgentActionGroup
/// request</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_CreateAgentActionGroup.html#API_agent_CreateAgentActionGroup_ResponseSyntax">CreateAgentActionGroup
/// response</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_UpdateAgentActionGroup.html#API_agent_UpdateAgentActionGroup_RequestSyntax">UpdateAgentActionGroup
/// request</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_UpdateAgentActionGroup.html#API_agent_UpdateAgentActionGroup_ResponseSyntax">UpdateAgentActionGroup
/// response</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_GetAgentActionGroup.html#API_agent_GetAgentActionGroup_ResponseSyntax">GetAgentActionGroup
/// response</a>
/// </li>
/// </ul>
class ParameterDetail {
  /// The data type of the parameter.
  final Type type;

  /// A description of the parameter. Helps the foundation model determine how to
  /// elicit the parameters from the user.
  final String? description;

  /// Whether the parameter is required for the agent to complete the function for
  /// action group invocation.
  final bool? required;

  ParameterDetail({
    required this.type,
    this.description,
    this.required,
  });

  factory ParameterDetail.fromJson(Map<String, dynamic> json) {
    return ParameterDetail(
      type: (json['type'] as String).toType(),
      description: json['description'] as String?,
      required: json['required'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final description = this.description;
    final required = this.required;
    return {
      'type': type.toValue(),
      if (description != null) 'description': description,
      if (required != null) 'required': required,
    };
  }
}

/// Contains details about the storage configuration of the knowledge base in
/// Pinecone. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-pinecone.html">Create
/// a vector index in Pinecone</a>.
class PineconeConfiguration {
  /// The endpoint URL for your index management page.
  final String connectionString;

  /// The Amazon Resource Name (ARN) of the secret that you created in Secrets
  /// Manager that is linked to your Pinecone API key.
  final String credentialsSecretArn;

  /// Contains the names of the fields to which to map information about the
  /// vector store.
  final PineconeFieldMapping fieldMapping;

  /// The namespace to be used to write new data to your database.
  final String? namespace;

  PineconeConfiguration({
    required this.connectionString,
    required this.credentialsSecretArn,
    required this.fieldMapping,
    this.namespace,
  });

  factory PineconeConfiguration.fromJson(Map<String, dynamic> json) {
    return PineconeConfiguration(
      connectionString: json['connectionString'] as String,
      credentialsSecretArn: json['credentialsSecretArn'] as String,
      fieldMapping: PineconeFieldMapping.fromJson(
          json['fieldMapping'] as Map<String, dynamic>),
      namespace: json['namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionString = this.connectionString;
    final credentialsSecretArn = this.credentialsSecretArn;
    final fieldMapping = this.fieldMapping;
    final namespace = this.namespace;
    return {
      'connectionString': connectionString,
      'credentialsSecretArn': credentialsSecretArn,
      'fieldMapping': fieldMapping,
      if (namespace != null) 'namespace': namespace,
    };
  }
}

/// Contains the names of the fields to which to map information about the
/// vector store.
class PineconeFieldMapping {
  /// The name of the field in which Amazon Bedrock stores metadata about the
  /// vector store.
  final String metadataField;

  /// The name of the field in which Amazon Bedrock stores the raw text from your
  /// data. The text is split according to the chunking strategy you choose.
  final String textField;

  PineconeFieldMapping({
    required this.metadataField,
    required this.textField,
  });

  factory PineconeFieldMapping.fromJson(Map<String, dynamic> json) {
    return PineconeFieldMapping(
      metadataField: json['metadataField'] as String,
      textField: json['textField'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataField = this.metadataField;
    final textField = this.textField;
    return {
      'metadataField': metadataField,
      'textField': textField,
    };
  }
}

class PrepareAgentResponse {
  /// The unique identifier of the agent for which the <code>DRAFT</code> version
  /// was created.
  final String agentId;

  /// The status of the <code>DRAFT</code> version and whether it is ready for
  /// use.
  final AgentStatus agentStatus;

  /// The version of the agent.
  final String agentVersion;

  /// The time at which the <code>DRAFT</code> version of the agent was last
  /// prepared.
  final DateTime preparedAt;

  PrepareAgentResponse({
    required this.agentId,
    required this.agentStatus,
    required this.agentVersion,
    required this.preparedAt,
  });

  factory PrepareAgentResponse.fromJson(Map<String, dynamic> json) {
    return PrepareAgentResponse(
      agentId: json['agentId'] as String,
      agentStatus: (json['agentStatus'] as String).toAgentStatus(),
      agentVersion: json['agentVersion'] as String,
      preparedAt: nonNullableTimeStampFromJson(json['preparedAt'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final agentStatus = this.agentStatus;
    final agentVersion = this.agentVersion;
    final preparedAt = this.preparedAt;
    return {
      'agentId': agentId,
      'agentStatus': agentStatus.toValue(),
      'agentVersion': agentVersion,
      'preparedAt': iso8601ToJson(preparedAt),
    };
  }
}

/// Contains configurations to override a prompt template in one part of an
/// agent sequence. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
/// prompts</a>.
class PromptConfiguration {
  /// Defines the prompt template with which to replace the default prompt
  /// template. You can use placeholder variables in the base prompt template to
  /// customize the prompt. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-placeholders.html">Prompt
  /// template placeholder variables</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts-configure.html">Configure
  /// the prompt templates</a>.
  final String? basePromptTemplate;

  /// Contains inference parameters to use when the agent invokes a foundation
  /// model in the part of the agent sequence defined by the
  /// <code>promptType</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters for foundation models</a>.
  final InferenceConfiguration? inferenceConfiguration;

  /// Specifies whether to override the default parser Lambda function when
  /// parsing the raw foundation model output in the part of the agent sequence
  /// defined by the <code>promptType</code>. If you set the field as
  /// <code>OVERRIDEN</code>, the <code>overrideLambda</code> field in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptOverrideConfiguration.html">PromptOverrideConfiguration</a>
  /// must be specified with the ARN of a Lambda function.
  final CreationMode? parserMode;

  /// Specifies whether to override the default prompt template for this
  /// <code>promptType</code>. Set this value to <code>OVERRIDDEN</code> to use
  /// the prompt that you provide in the <code>basePromptTemplate</code>. If you
  /// leave it as <code>DEFAULT</code>, the agent uses a default prompt template.
  final CreationMode? promptCreationMode;

  /// Specifies whether to allow the agent to carry out the step specified in the
  /// <code>promptType</code>. If you set this value to <code>DISABLED</code>, the
  /// agent skips that step. The default state for each <code>promptType</code> is
  /// as follows.
  ///
  /// <ul>
  /// <li>
  /// <code>PRE_PROCESSING</code> – <code>ENABLED</code>
  /// </li>
  /// <li>
  /// <code>ORCHESTRATION</code> – <code>ENABLED</code>
  /// </li>
  /// <li>
  /// <code>KNOWLEDGE_BASE_RESPONSE_GENERATION</code> – <code>ENABLED</code>
  /// </li>
  /// <li>
  /// <code>POST_PROCESSING</code> – <code>DISABLED</code>
  /// </li>
  /// </ul>
  final PromptState? promptState;

  /// The step in the agent sequence that this prompt configuration applies to.
  final PromptType? promptType;

  PromptConfiguration({
    this.basePromptTemplate,
    this.inferenceConfiguration,
    this.parserMode,
    this.promptCreationMode,
    this.promptState,
    this.promptType,
  });

  factory PromptConfiguration.fromJson(Map<String, dynamic> json) {
    return PromptConfiguration(
      basePromptTemplate: json['basePromptTemplate'] as String?,
      inferenceConfiguration: json['inferenceConfiguration'] != null
          ? InferenceConfiguration.fromJson(
              json['inferenceConfiguration'] as Map<String, dynamic>)
          : null,
      parserMode: (json['parserMode'] as String?)?.toCreationMode(),
      promptCreationMode:
          (json['promptCreationMode'] as String?)?.toCreationMode(),
      promptState: (json['promptState'] as String?)?.toPromptState(),
      promptType: (json['promptType'] as String?)?.toPromptType(),
    );
  }

  Map<String, dynamic> toJson() {
    final basePromptTemplate = this.basePromptTemplate;
    final inferenceConfiguration = this.inferenceConfiguration;
    final parserMode = this.parserMode;
    final promptCreationMode = this.promptCreationMode;
    final promptState = this.promptState;
    final promptType = this.promptType;
    return {
      if (basePromptTemplate != null) 'basePromptTemplate': basePromptTemplate,
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
      if (parserMode != null) 'parserMode': parserMode.toValue(),
      if (promptCreationMode != null)
        'promptCreationMode': promptCreationMode.toValue(),
      if (promptState != null) 'promptState': promptState.toValue(),
      if (promptType != null) 'promptType': promptType.toValue(),
    };
  }
}

/// Contains configurations to override prompts in different parts of an agent
/// sequence. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
/// prompts</a>.
class PromptOverrideConfiguration {
  /// Contains configurations to override a prompt template in one part of an
  /// agent sequence. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
  /// prompts</a>.
  final List<PromptConfiguration> promptConfigurations;

  /// The ARN of the Lambda function to use when parsing the raw foundation model
  /// output in parts of the agent sequence. If you specify this field, at least
  /// one of the <code>promptConfigurations</code> must contain a
  /// <code>parserMode</code> value that is set to <code>OVERRIDDEN</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/lambda-parser.html">Parser
  /// Lambda function in Agents for Amazon Bedrock</a>.
  final String? overrideLambda;

  PromptOverrideConfiguration({
    required this.promptConfigurations,
    this.overrideLambda,
  });

  factory PromptOverrideConfiguration.fromJson(Map<String, dynamic> json) {
    return PromptOverrideConfiguration(
      promptConfigurations: (json['promptConfigurations'] as List)
          .whereNotNull()
          .map((e) => PromptConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      overrideLambda: json['overrideLambda'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final promptConfigurations = this.promptConfigurations;
    final overrideLambda = this.overrideLambda;
    return {
      'promptConfigurations': promptConfigurations,
      if (overrideLambda != null) 'overrideLambda': overrideLambda,
    };
  }
}

enum PromptState {
  enabled,
  disabled,
}

extension PromptStateValueExtension on PromptState {
  String toValue() {
    switch (this) {
      case PromptState.enabled:
        return 'ENABLED';
      case PromptState.disabled:
        return 'DISABLED';
    }
  }
}

extension PromptStateFromString on String {
  PromptState toPromptState() {
    switch (this) {
      case 'ENABLED':
        return PromptState.enabled;
      case 'DISABLED':
        return PromptState.disabled;
    }
    throw Exception('$this is not known in enum PromptState');
  }
}

enum PromptType {
  preProcessing,
  orchestration,
  postProcessing,
  knowledgeBaseResponseGeneration,
}

extension PromptTypeValueExtension on PromptType {
  String toValue() {
    switch (this) {
      case PromptType.preProcessing:
        return 'PRE_PROCESSING';
      case PromptType.orchestration:
        return 'ORCHESTRATION';
      case PromptType.postProcessing:
        return 'POST_PROCESSING';
      case PromptType.knowledgeBaseResponseGeneration:
        return 'KNOWLEDGE_BASE_RESPONSE_GENERATION';
    }
  }
}

extension PromptTypeFromString on String {
  PromptType toPromptType() {
    switch (this) {
      case 'PRE_PROCESSING':
        return PromptType.preProcessing;
      case 'ORCHESTRATION':
        return PromptType.orchestration;
      case 'POST_PROCESSING':
        return PromptType.postProcessing;
      case 'KNOWLEDGE_BASE_RESPONSE_GENERATION':
        return PromptType.knowledgeBaseResponseGeneration;
    }
    throw Exception('$this is not known in enum PromptType');
  }
}

/// Contains details about the storage configuration of the knowledge base in
/// Amazon RDS. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-rds.html">Create
/// a vector index in Amazon RDS</a>.
class RdsConfiguration {
  /// The Amazon Resource Name (ARN) of the secret that you created in Secrets
  /// Manager that is linked to your Amazon RDS database.
  final String credentialsSecretArn;

  /// The name of your Amazon RDS database.
  final String databaseName;

  /// Contains the names of the fields to which to map information about the
  /// vector store.
  final RdsFieldMapping fieldMapping;

  /// The Amazon Resource Name (ARN) of the vector store.
  final String resourceArn;

  /// The name of the table in the database.
  final String tableName;

  RdsConfiguration({
    required this.credentialsSecretArn,
    required this.databaseName,
    required this.fieldMapping,
    required this.resourceArn,
    required this.tableName,
  });

  factory RdsConfiguration.fromJson(Map<String, dynamic> json) {
    return RdsConfiguration(
      credentialsSecretArn: json['credentialsSecretArn'] as String,
      databaseName: json['databaseName'] as String,
      fieldMapping: RdsFieldMapping.fromJson(
          json['fieldMapping'] as Map<String, dynamic>),
      resourceArn: json['resourceArn'] as String,
      tableName: json['tableName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final credentialsSecretArn = this.credentialsSecretArn;
    final databaseName = this.databaseName;
    final fieldMapping = this.fieldMapping;
    final resourceArn = this.resourceArn;
    final tableName = this.tableName;
    return {
      'credentialsSecretArn': credentialsSecretArn,
      'databaseName': databaseName,
      'fieldMapping': fieldMapping,
      'resourceArn': resourceArn,
      'tableName': tableName,
    };
  }
}

/// Contains the names of the fields to which to map information about the
/// vector store.
class RdsFieldMapping {
  /// The name of the field in which Amazon Bedrock stores metadata about the
  /// vector store.
  final String metadataField;

  /// The name of the field in which Amazon Bedrock stores the ID for each entry.
  final String primaryKeyField;

  /// The name of the field in which Amazon Bedrock stores the raw text from your
  /// data. The text is split according to the chunking strategy you choose.
  final String textField;

  /// The name of the field in which Amazon Bedrock stores the vector embeddings
  /// for your data sources.
  final String vectorField;

  RdsFieldMapping({
    required this.metadataField,
    required this.primaryKeyField,
    required this.textField,
    required this.vectorField,
  });

  factory RdsFieldMapping.fromJson(Map<String, dynamic> json) {
    return RdsFieldMapping(
      metadataField: json['metadataField'] as String,
      primaryKeyField: json['primaryKeyField'] as String,
      textField: json['textField'] as String,
      vectorField: json['vectorField'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataField = this.metadataField;
    final primaryKeyField = this.primaryKeyField;
    final textField = this.textField;
    final vectorField = this.vectorField;
    return {
      'metadataField': metadataField,
      'primaryKeyField': primaryKeyField,
      'textField': textField,
      'vectorField': vectorField,
    };
  }
}

/// Contains details about the storage configuration of the knowledge base in
/// Redis Enterprise Cloud. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-oss.html">Create
/// a vector index in Redis Enterprise Cloud</a>.
class RedisEnterpriseCloudConfiguration {
  /// The Amazon Resource Name (ARN) of the secret that you created in Secrets
  /// Manager that is linked to your Redis Enterprise Cloud database.
  final String credentialsSecretArn;

  /// The endpoint URL of the Redis Enterprise Cloud database.
  final String endpoint;

  /// Contains the names of the fields to which to map information about the
  /// vector store.
  final RedisEnterpriseCloudFieldMapping fieldMapping;

  /// The name of the vector index.
  final String vectorIndexName;

  RedisEnterpriseCloudConfiguration({
    required this.credentialsSecretArn,
    required this.endpoint,
    required this.fieldMapping,
    required this.vectorIndexName,
  });

  factory RedisEnterpriseCloudConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RedisEnterpriseCloudConfiguration(
      credentialsSecretArn: json['credentialsSecretArn'] as String,
      endpoint: json['endpoint'] as String,
      fieldMapping: RedisEnterpriseCloudFieldMapping.fromJson(
          json['fieldMapping'] as Map<String, dynamic>),
      vectorIndexName: json['vectorIndexName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final credentialsSecretArn = this.credentialsSecretArn;
    final endpoint = this.endpoint;
    final fieldMapping = this.fieldMapping;
    final vectorIndexName = this.vectorIndexName;
    return {
      'credentialsSecretArn': credentialsSecretArn,
      'endpoint': endpoint,
      'fieldMapping': fieldMapping,
      'vectorIndexName': vectorIndexName,
    };
  }
}

/// Contains the names of the fields to which to map information about the
/// vector store.
class RedisEnterpriseCloudFieldMapping {
  /// The name of the field in which Amazon Bedrock stores metadata about the
  /// vector store.
  final String metadataField;

  /// The name of the field in which Amazon Bedrock stores the raw text from your
  /// data. The text is split according to the chunking strategy you choose.
  final String textField;

  /// The name of the field in which Amazon Bedrock stores the vector embeddings
  /// for your data sources.
  final String vectorField;

  RedisEnterpriseCloudFieldMapping({
    required this.metadataField,
    required this.textField,
    required this.vectorField,
  });

  factory RedisEnterpriseCloudFieldMapping.fromJson(Map<String, dynamic> json) {
    return RedisEnterpriseCloudFieldMapping(
      metadataField: json['metadataField'] as String,
      textField: json['textField'] as String,
      vectorField: json['vectorField'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataField = this.metadataField;
    final textField = this.textField;
    final vectorField = this.vectorField;
    return {
      'metadataField': metadataField,
      'textField': textField,
      'vectorField': vectorField,
    };
  }
}

/// Contains information about the S3 configuration of the data source.
class S3DataSourceConfiguration {
  /// The Amazon Resource Name (ARN) of the bucket that contains the data source.
  final String bucketArn;

  /// The bucket account owner ID for the S3 bucket.
  final String? bucketOwnerAccountId;

  /// A list of S3 prefixes that define the object containing the data sources.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html">Organizing
  /// objects using prefixes</a>.
  final List<String>? inclusionPrefixes;

  S3DataSourceConfiguration({
    required this.bucketArn,
    this.bucketOwnerAccountId,
    this.inclusionPrefixes,
  });

  factory S3DataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DataSourceConfiguration(
      bucketArn: json['bucketArn'] as String,
      bucketOwnerAccountId: json['bucketOwnerAccountId'] as String?,
      inclusionPrefixes: (json['inclusionPrefixes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketArn = this.bucketArn;
    final bucketOwnerAccountId = this.bucketOwnerAccountId;
    final inclusionPrefixes = this.inclusionPrefixes;
    return {
      'bucketArn': bucketArn,
      if (bucketOwnerAccountId != null)
        'bucketOwnerAccountId': bucketOwnerAccountId,
      if (inclusionPrefixes != null) 'inclusionPrefixes': inclusionPrefixes,
    };
  }
}

/// Contains information about the S3 object containing the resource.
class S3Identifier {
  /// The name of the S3 bucket.
  final String? s3BucketName;

  /// The S3 object key containing the resource.
  final String? s3ObjectKey;

  S3Identifier({
    this.s3BucketName,
    this.s3ObjectKey,
  });

  factory S3Identifier.fromJson(Map<String, dynamic> json) {
    return S3Identifier(
      s3BucketName: json['s3BucketName'] as String?,
      s3ObjectKey: json['s3ObjectKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final s3ObjectKey = this.s3ObjectKey;
    return {
      if (s3BucketName != null) 's3BucketName': s3BucketName,
      if (s3ObjectKey != null) 's3ObjectKey': s3ObjectKey,
    };
  }
}

/// Contains the configuration for server-side encryption.
class ServerSideEncryptionConfiguration {
  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the resource.
  final String? kmsKeyArn;

  ServerSideEncryptionConfiguration({
    this.kmsKeyArn,
  });

  factory ServerSideEncryptionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServerSideEncryptionConfiguration(
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

class StartIngestionJobResponse {
  /// An object containing information about the ingestion job.
  final IngestionJob ingestionJob;

  StartIngestionJobResponse({
    required this.ingestionJob,
  });

  factory StartIngestionJobResponse.fromJson(Map<String, dynamic> json) {
    return StartIngestionJobResponse(
      ingestionJob:
          IngestionJob.fromJson(json['ingestionJob'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionJob = this.ingestionJob;
    return {
      'ingestionJob': ingestionJob,
    };
  }
}

/// Contains the storage configuration of the knowledge base.
class StorageConfiguration {
  /// The vector store service in which the knowledge base is stored.
  final KnowledgeBaseStorageType type;

  /// Contains the storage configuration of the knowledge base in MongoDB Atlas.
  final MongoDbAtlasConfiguration? mongoDbAtlasConfiguration;

  /// Contains the storage configuration of the knowledge base in Amazon
  /// OpenSearch Service.
  final OpenSearchServerlessConfiguration? opensearchServerlessConfiguration;

  /// Contains the storage configuration of the knowledge base in Pinecone.
  final PineconeConfiguration? pineconeConfiguration;

  /// Contains details about the storage configuration of the knowledge base in
  /// Amazon RDS. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-rds.html">Create
  /// a vector index in Amazon RDS</a>.
  final RdsConfiguration? rdsConfiguration;

  /// Contains the storage configuration of the knowledge base in Redis Enterprise
  /// Cloud.
  final RedisEnterpriseCloudConfiguration? redisEnterpriseCloudConfiguration;

  StorageConfiguration({
    required this.type,
    this.mongoDbAtlasConfiguration,
    this.opensearchServerlessConfiguration,
    this.pineconeConfiguration,
    this.rdsConfiguration,
    this.redisEnterpriseCloudConfiguration,
  });

  factory StorageConfiguration.fromJson(Map<String, dynamic> json) {
    return StorageConfiguration(
      type: (json['type'] as String).toKnowledgeBaseStorageType(),
      mongoDbAtlasConfiguration: json['mongoDbAtlasConfiguration'] != null
          ? MongoDbAtlasConfiguration.fromJson(
              json['mongoDbAtlasConfiguration'] as Map<String, dynamic>)
          : null,
      opensearchServerlessConfiguration:
          json['opensearchServerlessConfiguration'] != null
              ? OpenSearchServerlessConfiguration.fromJson(
                  json['opensearchServerlessConfiguration']
                      as Map<String, dynamic>)
              : null,
      pineconeConfiguration: json['pineconeConfiguration'] != null
          ? PineconeConfiguration.fromJson(
              json['pineconeConfiguration'] as Map<String, dynamic>)
          : null,
      rdsConfiguration: json['rdsConfiguration'] != null
          ? RdsConfiguration.fromJson(
              json['rdsConfiguration'] as Map<String, dynamic>)
          : null,
      redisEnterpriseCloudConfiguration:
          json['redisEnterpriseCloudConfiguration'] != null
              ? RedisEnterpriseCloudConfiguration.fromJson(
                  json['redisEnterpriseCloudConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final mongoDbAtlasConfiguration = this.mongoDbAtlasConfiguration;
    final opensearchServerlessConfiguration =
        this.opensearchServerlessConfiguration;
    final pineconeConfiguration = this.pineconeConfiguration;
    final rdsConfiguration = this.rdsConfiguration;
    final redisEnterpriseCloudConfiguration =
        this.redisEnterpriseCloudConfiguration;
    return {
      'type': type.toValue(),
      if (mongoDbAtlasConfiguration != null)
        'mongoDbAtlasConfiguration': mongoDbAtlasConfiguration,
      if (opensearchServerlessConfiguration != null)
        'opensearchServerlessConfiguration': opensearchServerlessConfiguration,
      if (pineconeConfiguration != null)
        'pineconeConfiguration': pineconeConfiguration,
      if (rdsConfiguration != null) 'rdsConfiguration': rdsConfiguration,
      if (redisEnterpriseCloudConfiguration != null)
        'redisEnterpriseCloudConfiguration': redisEnterpriseCloudConfiguration,
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

enum Type {
  string,
  number,
  integer,
  boolean,
  array,
}

extension TypeValueExtension on Type {
  String toValue() {
    switch (this) {
      case Type.string:
        return 'string';
      case Type.number:
        return 'number';
      case Type.integer:
        return 'integer';
      case Type.boolean:
        return 'boolean';
      case Type.array:
        return 'array';
    }
  }
}

extension TypeFromString on String {
  Type toType() {
    switch (this) {
      case 'string':
        return Type.string;
      case 'number':
        return Type.number;
      case 'integer':
        return Type.integer;
      case 'boolean':
        return Type.boolean;
      case 'array':
        return Type.array;
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

class UpdateAgentActionGroupResponse {
  /// Contains details about the action group that was updated.
  final AgentActionGroup agentActionGroup;

  UpdateAgentActionGroupResponse({
    required this.agentActionGroup,
  });

  factory UpdateAgentActionGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAgentActionGroupResponse(
      agentActionGroup: AgentActionGroup.fromJson(
          json['agentActionGroup'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agentActionGroup = this.agentActionGroup;
    return {
      'agentActionGroup': agentActionGroup,
    };
  }
}

class UpdateAgentAliasResponse {
  /// Contains details about the alias that was updated.
  final AgentAlias agentAlias;

  UpdateAgentAliasResponse({
    required this.agentAlias,
  });

  factory UpdateAgentAliasResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAgentAliasResponse(
      agentAlias:
          AgentAlias.fromJson(json['agentAlias'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agentAlias = this.agentAlias;
    return {
      'agentAlias': agentAlias,
    };
  }
}

class UpdateAgentKnowledgeBaseResponse {
  /// Contains details about the knowledge base that has been associated with an
  /// agent.
  final AgentKnowledgeBase agentKnowledgeBase;

  UpdateAgentKnowledgeBaseResponse({
    required this.agentKnowledgeBase,
  });

  factory UpdateAgentKnowledgeBaseResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAgentKnowledgeBaseResponse(
      agentKnowledgeBase: AgentKnowledgeBase.fromJson(
          json['agentKnowledgeBase'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agentKnowledgeBase = this.agentKnowledgeBase;
    return {
      'agentKnowledgeBase': agentKnowledgeBase,
    };
  }
}

class UpdateAgentResponse {
  /// Contains details about the agent that was updated.
  final Agent agent;

  UpdateAgentResponse({
    required this.agent,
  });

  factory UpdateAgentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAgentResponse(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final agent = this.agent;
    return {
      'agent': agent,
    };
  }
}

class UpdateDataSourceResponse {
  /// Contains details about the data source.
  final DataSource dataSource;

  UpdateDataSourceResponse({
    required this.dataSource,
  });

  factory UpdateDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataSourceResponse(
      dataSource:
          DataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    return {
      'dataSource': dataSource,
    };
  }
}

class UpdateKnowledgeBaseResponse {
  /// Contains details about the knowledge base.
  final KnowledgeBase knowledgeBase;

  UpdateKnowledgeBaseResponse({
    required this.knowledgeBase,
  });

  factory UpdateKnowledgeBaseResponse.fromJson(Map<String, dynamic> json) {
    return UpdateKnowledgeBaseResponse(
      knowledgeBase:
          KnowledgeBase.fromJson(json['knowledgeBase'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBase = this.knowledgeBase;
    return {
      'knowledgeBase': knowledgeBase,
    };
  }
}

/// Contains details about how to ingest the documents in a data source.
class VectorIngestionConfiguration {
  /// Details about how to chunk the documents in the data source. A <i>chunk</i>
  /// refers to an excerpt from a data source that is returned when the knowledge
  /// base that it belongs to is queried.
  final ChunkingConfiguration? chunkingConfiguration;

  VectorIngestionConfiguration({
    this.chunkingConfiguration,
  });

  factory VectorIngestionConfiguration.fromJson(Map<String, dynamic> json) {
    return VectorIngestionConfiguration(
      chunkingConfiguration: json['chunkingConfiguration'] != null
          ? ChunkingConfiguration.fromJson(
              json['chunkingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final chunkingConfiguration = this.chunkingConfiguration;
    return {
      if (chunkingConfiguration != null)
        'chunkingConfiguration': chunkingConfiguration,
    };
  }
}

/// Contains details about the model used to create vector embeddings for the
/// knowledge base.
class VectorKnowledgeBaseConfiguration {
  /// The Amazon Resource Name (ARN) of the model used to create vector embeddings
  /// for the knowledge base.
  final String embeddingModelArn;

  /// The embeddings model configuration details for the vector model used in
  /// Knowledge Base.
  final EmbeddingModelConfiguration? embeddingModelConfiguration;

  VectorKnowledgeBaseConfiguration({
    required this.embeddingModelArn,
    this.embeddingModelConfiguration,
  });

  factory VectorKnowledgeBaseConfiguration.fromJson(Map<String, dynamic> json) {
    return VectorKnowledgeBaseConfiguration(
      embeddingModelArn: json['embeddingModelArn'] as String,
      embeddingModelConfiguration: json['embeddingModelConfiguration'] != null
          ? EmbeddingModelConfiguration.fromJson(
              json['embeddingModelConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final embeddingModelArn = this.embeddingModelArn;
    final embeddingModelConfiguration = this.embeddingModelConfiguration;
    return {
      'embeddingModelArn': embeddingModelArn,
      if (embeddingModelConfiguration != null)
        'embeddingModelConfiguration': embeddingModelConfiguration,
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

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
