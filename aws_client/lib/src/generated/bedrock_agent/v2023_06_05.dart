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
        'knowledgeBaseState': knowledgeBaseState.value,
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
  /// To enable your agent to retain conversational context across multiple
  /// sessions, include a <code>memoryConfiguration</code> object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-configure-memory.html">Configure
  /// memory</a>.
  /// </li>
  /// <li>
  /// To override the default prompt behavior for agent orchestration and to use
  /// advanced prompts, include a <code>promptOverrideConfiguration</code>
  /// object. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
  /// prompts</a>.
  /// </li>
  /// <li>
  /// If your agent fails to be created, the response returns a list of
  /// <code>failureReasons</code> alongside a list of
  /// <code>recommendedActions</code> for you to troubleshoot.
  /// </li>
  /// <li>
  /// The agent instructions will not be honored if your agent has only one
  /// knowledge base, uses default prompts, has no action group, and user input
  /// is disabled.
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
  /// Parameter [memoryConfiguration] :
  /// Contains the details of the memory configured for the agent.
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
    MemoryConfiguration? memoryConfiguration,
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
      if (memoryConfiguration != null)
        'memoryConfiguration': memoryConfiguration,
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
  /// <code>AMAZON.UserInput</code>.
  ///
  /// To allow your agent to generate, run, and troubleshoot code when trying to
  /// complete a task, add an action group with the
  /// <code>parentActionGroupSignature</code> field set to
  /// <code>AMAZON.CodeInterpreter</code>.
  ///
  /// You must leave the <code>description</code>, <code>apiSchema</code>, and
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
  /// To allow your agent to generate, run, and troubleshoot code when trying to
  /// complete a task, set this field to <code>AMAZON.CodeInterpreter</code>.
  /// You must leave the <code>description</code>, <code>apiSchema</code>, and
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
      if (actionGroupState != null) 'actionGroupState': actionGroupState.value,
      if (apiSchema != null) 'apiSchema': apiSchema,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (functionSchema != null) 'functionSchema': functionSchema,
      if (parentActionGroupSignature != null)
        'parentActionGroupSignature': parentActionGroupSignature.value,
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

  /// Creates a data source connector for a knowledge base.
  /// <important>
  /// You can't change the <code>chunkingConfiguration</code> after you create
  /// the data source connector.
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
  /// The connection configuration for the data source.
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
  /// The data deletion policy for the data source.
  ///
  /// You can set the data deletion policy to:
  ///
  /// <ul>
  /// <li>
  /// DELETE: Deletes all data from your data source that’s converted into
  /// vector embeddings upon deletion of a knowledge base or data source
  /// resource. Note that the <b>vector store itself is not deleted</b>, only
  /// the data. This flag is ignored if an Amazon Web Services account is
  /// deleted.
  /// </li>
  /// <li>
  /// RETAIN: Retains all data from your data source that’s converted into
  /// vector embeddings upon deletion of a knowledge base or data source
  /// resource. Note that the <b>vector store itself is not deleted</b> if you
  /// delete a knowledge base or data source resource.
  /// </li>
  /// </ul>
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
        'dataDeletionPolicy': dataDeletionPolicy.value,
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

  /// Creates a prompt flow that you can use to send an input through various
  /// steps to yield an output. Configure nodes, each of which corresponds to a
  /// step of the flow, and create connections between the nodes to create paths
  /// to different outputs. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-how-it-works.html">How
  /// it works</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-create.html">Create
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the service role with permissions to
  /// create and manage a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-permissions.html">Create
  /// a service role for flows in Amazon Bedrock</a> in the Amazon Bedrock User
  /// Guide.
  ///
  /// Parameter [name] :
  /// A name for the flow.
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
  /// The Amazon Resource Name (ARN) of the KMS key to encrypt the flow.
  ///
  /// Parameter [definition] :
  /// A definition of the nodes and connections between nodes in the flow.
  ///
  /// Parameter [description] :
  /// A description for the flow.
  ///
  /// Parameter [tags] :
  /// Any tags that you want to attach to the flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// resources in Amazon Bedrock</a>.
  Future<CreateFlowResponse> createFlow({
    required String executionRoleArn,
    required String name,
    String? clientToken,
    String? customerEncryptionKeyArn,
    FlowDefinition? definition,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'executionRoleArn': executionRoleArn,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (definition != null) 'definition': definition,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/flows/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFlowResponse.fromJson(response);
  }

  /// Creates an alias of a flow for deployment. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow for which to create an alias.
  ///
  /// Parameter [name] :
  /// A name for the alias.
  ///
  /// Parameter [routingConfiguration] :
  /// Contains information about the version to which to map the alias.
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
  /// A description for the alias.
  ///
  /// Parameter [tags] :
  /// Any tags that you want to attach to the alias of the flow. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// resources in Amazon Bedrock</a>.
  Future<CreateFlowAliasResponse> createFlowAlias({
    required String flowIdentifier,
    required String name,
    required List<FlowAliasRoutingConfigurationListItem> routingConfiguration,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'routingConfiguration': routingConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFlowAliasResponse.fromJson(response);
  }

  /// Creates a version of the flow that you can deploy. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow that you want to create a version of.
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
  /// A description of the version of the flow.
  Future<CreateFlowVersionResponse> createFlowVersion({
    required String flowIdentifier,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/flows/${Uri.encodeComponent(flowIdentifier)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFlowVersionResponse.fromJson(response);
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

  /// Creates a prompt in your prompt library that you can add to a flow. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management.html">Prompt
  /// management in Amazon Bedrock</a>, <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-create.html">Create
  /// a prompt using Prompt management</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows.html">Prompt
  /// flows in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// A name for the prompt.
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
  /// The Amazon Resource Name (ARN) of the KMS key to encrypt the prompt.
  ///
  /// Parameter [defaultVariant] :
  /// The name of the default variant for the prompt. This value must match the
  /// <code>name</code> field in the relevant <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptVariant.html">PromptVariant</a>
  /// object.
  ///
  /// Parameter [description] :
  /// A description for the prompt.
  ///
  /// Parameter [tags] :
  /// Any tags that you want to attach to the prompt. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// resources in Amazon Bedrock</a>.
  ///
  /// Parameter [variants] :
  /// A list of objects, each containing details about a variant of the prompt.
  Future<CreatePromptResponse> createPrompt({
    required String name,
    String? clientToken,
    String? customerEncryptionKeyArn,
    String? defaultVariant,
    String? description,
    Map<String, String>? tags,
    List<PromptVariant>? variants,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (defaultVariant != null) 'defaultVariant': defaultVariant,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (variants != null) 'variants': variants,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prompts/',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePromptResponse.fromJson(response);
  }

  /// Creates a static snapshot of your prompt that can be deployed to
  /// production. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-deploy.html">Deploy
  /// prompts using Prompt management by creating versions</a> in the Amazon
  /// Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [promptIdentifier] :
  /// The unique identifier of the prompt that you want to create a version of.
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
  /// A description for the version of the prompt.
  ///
  /// Parameter [tags] :
  /// Any tags that you want to attach to the version of the prompt. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// resources in Amazon Bedrock</a>.
  Future<CreatePromptVersionResponse> createPromptVersion({
    required String promptIdentifier,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prompts/${Uri.encodeComponent(promptIdentifier)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePromptVersionResponse.fromJson(response);
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

  /// Deletes a flow.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
  ///
  /// Parameter [skipResourceInUseCheck] :
  /// By default, this value is <code>false</code> and deletion is stopped if
  /// the resource is in use. If you set it to <code>true</code>, the resource
  /// will be deleted even if the resource is in use.
  Future<DeleteFlowResponse> deleteFlow({
    required String flowIdentifier,
    bool? skipResourceInUseCheck,
  }) async {
    final $query = <String, List<String>>{
      if (skipResourceInUseCheck != null)
        'skipResourceInUseCheck': [skipResourceInUseCheck.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/flows/${Uri.encodeComponent(flowIdentifier)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFlowResponse.fromJson(response);
  }

  /// Deletes an alias of a flow.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [aliasIdentifier] :
  /// The unique identifier of the alias to be deleted.
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow that the alias belongs to.
  Future<DeleteFlowAliasResponse> deleteFlowAlias({
    required String aliasIdentifier,
    required String flowIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases/${Uri.encodeComponent(aliasIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFlowAliasResponse.fromJson(response);
  }

  /// Deletes a version of a flow.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow whose version that you want to delete
  ///
  /// Parameter [flowVersion] :
  /// The version of the flow that you want to delete.
  ///
  /// Parameter [skipResourceInUseCheck] :
  /// By default, this value is <code>false</code> and deletion is stopped if
  /// the resource is in use. If you set it to <code>true</code>, the resource
  /// will be deleted even if the resource is in use.
  Future<DeleteFlowVersionResponse> deleteFlowVersion({
    required String flowIdentifier,
    required String flowVersion,
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
          '/flows/${Uri.encodeComponent(flowIdentifier)}/versions/${Uri.encodeComponent(flowVersion)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFlowVersionResponse.fromJson(response);
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

  /// Deletes a prompt or a version of it, depending on whether you include the
  /// <code>promptVersion</code> field or not. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-manage.html#prompt-management-delete.html">Delete
  /// prompts from the Prompt management tool</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-deploy.html#prompt-management-versions-delete.html">Delete
  /// a version of a prompt from the Prompt management tool</a> in the Amazon
  /// Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [promptIdentifier] :
  /// The unique identifier of the prompt.
  ///
  /// Parameter [promptVersion] :
  /// The version of the prompt to delete. To delete the prompt, omit this
  /// field.
  Future<DeletePromptResponse> deletePrompt({
    required String promptIdentifier,
    String? promptVersion,
  }) async {
    final $query = <String, List<String>>{
      if (promptVersion != null) 'promptVersion': [promptVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/prompts/${Uri.encodeComponent(promptIdentifier)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePromptResponse.fromJson(response);
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

  /// Retrieves information about a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-manage.html">Manage
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
  Future<GetFlowResponse> getFlow({
    required String flowIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/flows/${Uri.encodeComponent(flowIdentifier)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetFlowResponse.fromJson(response);
  }

  /// Retrieves information about a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [aliasIdentifier] :
  /// The unique identifier of the alias for which to retrieve information.
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow that the alias belongs to.
  Future<GetFlowAliasResponse> getFlowAlias({
    required String aliasIdentifier,
    required String flowIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases/${Uri.encodeComponent(aliasIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFlowAliasResponse.fromJson(response);
  }

  /// Retrieves information about a version of a flow. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow for which to get information.
  ///
  /// Parameter [flowVersion] :
  /// The version of the flow for which to get information.
  Future<GetFlowVersionResponse> getFlowVersion({
    required String flowIdentifier,
    required String flowVersion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/flows/${Uri.encodeComponent(flowIdentifier)}/versions/${Uri.encodeComponent(flowVersion)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetFlowVersionResponse.fromJson(response);
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

  /// Retrieves information about the working draft (<code>DRAFT</code> version)
  /// of a prompt or a version of it, depending on whether you include the
  /// <code>promptVersion</code> field or not. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-manage.html#prompt-management-view.html">View
  /// information about prompts using Prompt management</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-deploy.html#prompt-management-versions-view.html">View
  /// information about a version of your prompt</a> in the Amazon Bedrock User
  /// Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [promptIdentifier] :
  /// The unique identifier of the prompt.
  ///
  /// Parameter [promptVersion] :
  /// The version of the prompt about which you want to retrieve information.
  /// Omit this field to return information about the working draft of the
  /// prompt.
  Future<GetPromptResponse> getPrompt({
    required String promptIdentifier,
    String? promptVersion,
  }) async {
    final $query = <String, List<String>>{
      if (promptVersion != null) 'promptVersion': [promptVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prompts/${Uri.encodeComponent(promptIdentifier)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPromptResponse.fromJson(response);
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

  /// Returns a list of aliases for a flow.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow for which aliases are being returned.
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
  Future<ListFlowAliasesResponse> listFlowAliases({
    required String flowIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFlowAliasesResponse.fromJson(response);
  }

  /// Returns a list of information about each flow. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
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
  Future<ListFlowVersionsResponse> listFlowVersions({
    required String flowIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/flows/${Uri.encodeComponent(flowIdentifier)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFlowVersionsResponse.fromJson(response);
  }

  /// Returns a list of flows and information about each flow. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-manage.html">Manage
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
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
  Future<ListFlowsResponse> listFlows({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/flows/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFlowsResponse.fromJson(response);
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

  /// Returns either information about the working draft (<code>DRAFT</code>
  /// version) of each prompt in an account, or information about of all
  /// versions of a prompt, depending on whether you include the
  /// <code>promptIdentifier</code> field or not. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-manage.html#prompt-management-view.html">View
  /// information about prompts using Prompt management</a> in the Amazon
  /// Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// Parameter [promptIdentifier] :
  /// The unique identifier of the prompt for whose versions you want to return
  /// information. Omit this field to list information about all prompts in an
  /// account.
  Future<ListPromptsResponse> listPrompts({
    int? maxResults,
    String? nextToken,
    String? promptIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (promptIdentifier != null) 'promptIdentifier': [promptIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prompts/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPromptsResponse.fromJson(response);
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

  /// Prepares the <code>DRAFT</code> version of a flow so that it can be
  /// invoked. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-test.html">Test
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
  Future<PrepareFlowResponse> prepareFlow({
    required String flowIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/flows/${Uri.encodeComponent(flowIdentifier)}/',
      exceptionFnMap: _exceptionFns,
    );
    return PrepareFlowResponse.fromJson(response);
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
  /// Parameter [memoryConfiguration] :
  /// Specifies the new memory configuration for the agent.
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
    MemoryConfiguration? memoryConfiguration,
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
      if (memoryConfiguration != null)
        'memoryConfiguration': memoryConfiguration,
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
      if (actionGroupState != null) 'actionGroupState': actionGroupState.value,
      if (apiSchema != null) 'apiSchema': apiSchema,
      if (description != null) 'description': description,
      if (functionSchema != null) 'functionSchema': functionSchema,
      if (parentActionGroupSignature != null)
        'parentActionGroupSignature': parentActionGroupSignature.value,
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
        'knowledgeBaseState': knowledgeBaseState.value,
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

  /// Updates the configurations for a data source connector.
  /// <important>
  /// You can't change the <code>chunkingConfiguration</code> after you create
  /// the data source connector. Specify the existing
  /// <code>chunkingConfiguration</code>.
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
  /// The connection configuration for the data source that you want to update.
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base for the data source.
  ///
  /// Parameter [name] :
  /// Specifies a new name for the data source.
  ///
  /// Parameter [dataDeletionPolicy] :
  /// The data deletion policy for the data source that you want to update.
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
        'dataDeletionPolicy': dataDeletionPolicy.value,
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

  /// Modifies a flow. Include both fields that you want to keep and fields that
  /// you want to change. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-how-it-works.html">How
  /// it works</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-create.html">Create
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the service role with permissions to
  /// create and manage a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-permissions.html">Create
  /// a service role for flows in Amazon Bedrock</a> in the Amazon Bedrock User
  /// Guide.
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
  ///
  /// Parameter [name] :
  /// A name for the flow.
  ///
  /// Parameter [customerEncryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key to encrypt the flow.
  ///
  /// Parameter [definition] :
  /// A definition of the nodes and the connections between the nodes in the
  /// flow.
  ///
  /// Parameter [description] :
  /// A description for the flow.
  Future<UpdateFlowResponse> updateFlow({
    required String executionRoleArn,
    required String flowIdentifier,
    required String name,
    String? customerEncryptionKeyArn,
    FlowDefinition? definition,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'executionRoleArn': executionRoleArn,
      'name': name,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (definition != null) 'definition': definition,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/flows/${Uri.encodeComponent(flowIdentifier)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFlowResponse.fromJson(response);
  }

  /// Modifies the alias of a flow. Include both fields that you want to keep
  /// and ones that you want to change. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [aliasIdentifier] :
  /// The unique identifier of the alias.
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
  ///
  /// Parameter [name] :
  /// The name of the alias.
  ///
  /// Parameter [routingConfiguration] :
  /// Contains information about the version to which to map the alias.
  ///
  /// Parameter [description] :
  /// A description for the alias.
  Future<UpdateFlowAliasResponse> updateFlowAlias({
    required String aliasIdentifier,
    required String flowIdentifier,
    required String name,
    required List<FlowAliasRoutingConfigurationListItem> routingConfiguration,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'routingConfiguration': routingConfiguration,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases/${Uri.encodeComponent(aliasIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFlowAliasResponse.fromJson(response);
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

  /// Modifies a prompt in your prompt library. Include both fields that you
  /// want to keep and fields that you want to replace. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management.html">Prompt
  /// management in Amazon Bedrock</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-manage.html#prompt-management-edit">Edit
  /// prompts in your prompt library</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// A name for the prompt.
  ///
  /// Parameter [promptIdentifier] :
  /// The unique identifier of the prompt.
  ///
  /// Parameter [customerEncryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key to encrypt the prompt.
  ///
  /// Parameter [defaultVariant] :
  /// The name of the default variant for the prompt. This value must match the
  /// <code>name</code> field in the relevant <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptVariant.html">PromptVariant</a>
  /// object.
  ///
  /// Parameter [description] :
  /// A description for the prompt.
  ///
  /// Parameter [variants] :
  /// A list of objects, each containing details about a variant of the prompt.
  Future<UpdatePromptResponse> updatePrompt({
    required String name,
    required String promptIdentifier,
    String? customerEncryptionKeyArn,
    String? defaultVariant,
    String? description,
    List<PromptVariant>? variants,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (defaultVariant != null) 'defaultVariant': defaultVariant,
      if (description != null) 'description': description,
      if (variants != null) 'variants': variants,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/prompts/${Uri.encodeComponent(promptIdentifier)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePromptResponse.fromJson(response);
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
      customControl: (json['customControl'] as String?)
          ?.let(CustomControlMethod.fromString),
      lambda: json['lambda'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customControl = this.customControl;
    final lambda = this.lambda;
    return {
      if (customControl != null) 'customControl': customControl.value,
      if (lambda != null) 'lambda': lambda,
    };
  }
}

enum ActionGroupSignature {
  amazonUserInput('AMAZON.UserInput'),
  amazonCodeInterpreter('AMAZON.CodeInterpreter'),
  ;

  final String value;

  const ActionGroupSignature(this.value);

  static ActionGroupSignature fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ActionGroupSignature'));
}

enum ActionGroupState {
  enabled('ENABLED'),
  disabled('DISABLED'),
  ;

  final String value;

  const ActionGroupState(this.value);

  static ActionGroupState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ActionGroupState'));
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
          ActionGroupState.fromString((json['actionGroupState'] as String)),
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
      'actionGroupState': actionGroupState.value,
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

  /// Details about the guardrail associated with the agent.
  final GuardrailConfiguration? guardrailConfiguration;

  /// Instructions that tell the agent what it should do and how it should
  /// interact with users.
  final String? instruction;

  /// Contains memory configuration for the agent.
  final MemoryConfiguration? memoryConfiguration;

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
    this.memoryConfiguration,
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
      agentStatus: AgentStatus.fromString((json['agentStatus'] as String)),
      agentVersion: json['agentVersion'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      clientToken: json['clientToken'] as String?,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      foundationModel: json['foundationModel'] as String?,
      guardrailConfiguration: json['guardrailConfiguration'] != null
          ? GuardrailConfiguration.fromJson(
              json['guardrailConfiguration'] as Map<String, dynamic>)
          : null,
      instruction: json['instruction'] as String?,
      memoryConfiguration: json['memoryConfiguration'] != null
          ? MemoryConfiguration.fromJson(
              json['memoryConfiguration'] as Map<String, dynamic>)
          : null,
      preparedAt: timeStampFromJson(json['preparedAt']),
      promptOverrideConfiguration: json['promptOverrideConfiguration'] != null
          ? PromptOverrideConfiguration.fromJson(
              json['promptOverrideConfiguration'] as Map<String, dynamic>)
          : null,
      recommendedActions: (json['recommendedActions'] as List?)
          ?.nonNulls
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
    final memoryConfiguration = this.memoryConfiguration;
    final preparedAt = this.preparedAt;
    final promptOverrideConfiguration = this.promptOverrideConfiguration;
    final recommendedActions = this.recommendedActions;
    return {
      'agentArn': agentArn,
      'agentId': agentId,
      'agentName': agentName,
      'agentResourceRoleArn': agentResourceRoleArn,
      'agentStatus': agentStatus.value,
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
      if (memoryConfiguration != null)
        'memoryConfiguration': memoryConfiguration,
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
          ActionGroupState.fromString((json['actionGroupState'] as String)),
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
      parentActionSignature: (json['parentActionSignature'] as String?)
          ?.let(ActionGroupSignature.fromString),
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
      'actionGroupState': actionGroupState.value,
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
        'parentActionSignature': parentActionSignature.value,
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
          AgentAliasStatus.fromString((json['agentAliasStatus'] as String)),
      agentId: json['agentId'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      routingConfiguration: (json['routingConfiguration'] as List)
          .nonNulls
          .map((e) => AgentAliasRoutingConfigurationListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      agentAliasHistoryEvents: (json['agentAliasHistoryEvents'] as List?)
          ?.nonNulls
          .map(
              (e) => AgentAliasHistoryEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      clientToken: json['clientToken'] as String?,
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.nonNulls
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
      'agentAliasStatus': agentAliasStatus.value,
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
          ?.nonNulls
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
  creating('CREATING'),
  prepared('PREPARED'),
  failed('FAILED'),
  updating('UPDATING'),
  deleting('DELETING'),
  ;

  final String value;

  const AgentAliasStatus(this.value);

  static AgentAliasStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AgentAliasStatus'));
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
          AgentAliasStatus.fromString((json['agentAliasStatus'] as String)),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      routingConfiguration: (json['routingConfiguration'] as List?)
          ?.nonNulls
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
      'agentAliasStatus': agentAliasStatus.value,
      'createdAt': iso8601ToJson(createdAt),
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (routingConfiguration != null)
        'routingConfiguration': routingConfiguration,
    };
  }
}

/// Defines an agent node in your flow. You specify the agent to invoke at this
/// point in the flow. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in Amazon Bedrock works</a> in the Amazon Bedrock User Guide.
class AgentFlowNodeConfiguration {
  /// The Amazon Resource Name (ARN) of the alias of the agent to invoke.
  final String agentAliasArn;

  AgentFlowNodeConfiguration({
    required this.agentAliasArn,
  });

  factory AgentFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return AgentFlowNodeConfiguration(
      agentAliasArn: json['agentAliasArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final agentAliasArn = this.agentAliasArn;
    return {
      'agentAliasArn': agentAliasArn,
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
          KnowledgeBaseState.fromString((json['knowledgeBaseState'] as String)),
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
      'knowledgeBaseState': knowledgeBaseState.value,
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
          KnowledgeBaseState.fromString((json['knowledgeBaseState'] as String)),
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
      'knowledgeBaseState': knowledgeBaseState.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

enum AgentStatus {
  creating('CREATING'),
  preparing('PREPARING'),
  prepared('PREPARED'),
  notPrepared('NOT_PREPARED'),
  deleting('DELETING'),
  failed('FAILED'),
  versioning('VERSIONING'),
  updating('UPDATING'),
  ;

  final String value;

  const AgentStatus(this.value);

  static AgentStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum AgentStatus'));
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

  /// Details about the guardrail associated with the agent.
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
      agentStatus: AgentStatus.fromString((json['agentStatus'] as String)),
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
      'agentStatus': agentStatus.value,
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

  /// Details about the guardrail associated with the agent.
  final GuardrailConfiguration? guardrailConfiguration;

  /// The instructions provided to the agent.
  final String? instruction;

  /// Contains details of the memory configuration on the version of the agent.
  final MemoryConfiguration? memoryConfiguration;

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
    this.memoryConfiguration,
    this.promptOverrideConfiguration,
    this.recommendedActions,
  });

  factory AgentVersion.fromJson(Map<String, dynamic> json) {
    return AgentVersion(
      agentArn: json['agentArn'] as String,
      agentId: json['agentId'] as String,
      agentName: json['agentName'] as String,
      agentResourceRoleArn: json['agentResourceRoleArn'] as String,
      agentStatus: AgentStatus.fromString((json['agentStatus'] as String)),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      foundationModel: json['foundationModel'] as String?,
      guardrailConfiguration: json['guardrailConfiguration'] != null
          ? GuardrailConfiguration.fromJson(
              json['guardrailConfiguration'] as Map<String, dynamic>)
          : null,
      instruction: json['instruction'] as String?,
      memoryConfiguration: json['memoryConfiguration'] != null
          ? MemoryConfiguration.fromJson(
              json['memoryConfiguration'] as Map<String, dynamic>)
          : null,
      promptOverrideConfiguration: json['promptOverrideConfiguration'] != null
          ? PromptOverrideConfiguration.fromJson(
              json['promptOverrideConfiguration'] as Map<String, dynamic>)
          : null,
      recommendedActions: (json['recommendedActions'] as List?)
          ?.nonNulls
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
    final memoryConfiguration = this.memoryConfiguration;
    final promptOverrideConfiguration = this.promptOverrideConfiguration;
    final recommendedActions = this.recommendedActions;
    return {
      'agentArn': agentArn,
      'agentId': agentId,
      'agentName': agentName,
      'agentResourceRoleArn': agentResourceRoleArn,
      'agentStatus': agentStatus.value,
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
      if (memoryConfiguration != null)
        'memoryConfiguration': memoryConfiguration,
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

  /// Details about the guardrail associated with the agent.
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
      agentStatus: AgentStatus.fromString((json['agentStatus'] as String)),
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
      'agentStatus': agentStatus.value,
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

/// Settings for a foundation model used to parse documents for a data source.
class BedrockFoundationModelConfiguration {
  /// The model's ARN.
  final String modelArn;

  /// Instructions for interpreting the contents of a document.
  final ParsingPrompt? parsingPrompt;

  BedrockFoundationModelConfiguration({
    required this.modelArn,
    this.parsingPrompt,
  });

  factory BedrockFoundationModelConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BedrockFoundationModelConfiguration(
      modelArn: json['modelArn'] as String,
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
  /// <code>HIERARCHICAL</code> – Split documents into layers of chunks where the
  /// first layer contains large chunks, and the second layer contains smaller
  /// chunks derived from the first layer.
  /// </li>
  /// <li>
  /// <code>SEMANTIC</code> – Split documents into chunks based on groups of
  /// similar content derived with natural language processing.
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

  /// Settings for hierarchical document chunking for a data source. Hierarchical
  /// chunking splits documents into layers of chunks where the first layer
  /// contains large chunks, and the second layer contains smaller chunks derived
  /// from the first layer.
  final HierarchicalChunkingConfiguration? hierarchicalChunkingConfiguration;

  /// Settings for semantic document chunking for a data source. Semantic chunking
  /// splits a document into into smaller documents based on groups of similar
  /// content derived from the text with natural language processing.
  final SemanticChunkingConfiguration? semanticChunkingConfiguration;

  ChunkingConfiguration({
    required this.chunkingStrategy,
    this.fixedSizeChunkingConfiguration,
    this.hierarchicalChunkingConfiguration,
    this.semanticChunkingConfiguration,
  });

  factory ChunkingConfiguration.fromJson(Map<String, dynamic> json) {
    return ChunkingConfiguration(
      chunkingStrategy:
          ChunkingStrategy.fromString((json['chunkingStrategy'] as String)),
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

enum ChunkingStrategy {
  fixedSize('FIXED_SIZE'),
  none('NONE'),
  hierarchical('HIERARCHICAL'),
  semantic('SEMANTIC'),
  ;

  final String value;

  const ChunkingStrategy(this.value);

  static ChunkingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ChunkingStrategy'));
}

/// Defines a collector node in your flow. This node takes an iteration of
/// inputs and consolidates them into an array in the output. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in Amazon Bedrock works</a> in the Amazon Bedrock User Guide.
class CollectorFlowNodeConfiguration {
  CollectorFlowNodeConfiguration();

  factory CollectorFlowNodeConfiguration.fromJson(Map<String, dynamic> _) {
    return CollectorFlowNodeConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines a condition node in your flow. You can specify conditions that
/// determine which node comes next in the flow. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in Amazon Bedrock works</a> in the Amazon Bedrock User Guide.
class ConditionFlowNodeConfiguration {
  /// An array of conditions. Each member contains the name of a condition and an
  /// expression that defines the condition.
  final List<FlowCondition> conditions;

  ConditionFlowNodeConfiguration({
    required this.conditions,
  });

  factory ConditionFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return ConditionFlowNodeConfiguration(
      conditions: (json['conditions'] as List)
          .nonNulls
          .map((e) => FlowCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final conditions = this.conditions;
    return {
      'conditions': conditions,
    };
  }
}

enum ConfluenceAuthType {
  basic('BASIC'),
  oauth2ClientCredentials('OAUTH2_CLIENT_CREDENTIALS'),
  ;

  final String value;

  const ConfluenceAuthType(this.value);

  static ConfluenceAuthType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ConfluenceAuthType'));
}

/// The configuration of the Confluence content. For example, configuring
/// specific types of Confluence content.
class ConfluenceCrawlerConfiguration {
  /// The configuration of filtering the Confluence content. For example,
  /// configuring regular expression patterns to include or exclude certain
  /// content.
  final CrawlFilterConfiguration? filterConfiguration;

  ConfluenceCrawlerConfiguration({
    this.filterConfiguration,
  });

  factory ConfluenceCrawlerConfiguration.fromJson(Map<String, dynamic> json) {
    return ConfluenceCrawlerConfiguration(
      filterConfiguration: json['filterConfiguration'] != null
          ? CrawlFilterConfiguration.fromJson(
              json['filterConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filterConfiguration = this.filterConfiguration;
    return {
      if (filterConfiguration != null)
        'filterConfiguration': filterConfiguration,
    };
  }
}

/// The configuration information to connect to Confluence as your data source.
class ConfluenceDataSourceConfiguration {
  /// The endpoint information to connect to your Confluence data source.
  final ConfluenceSourceConfiguration sourceConfiguration;

  /// The configuration of the Confluence content. For example, configuring
  /// specific types of Confluence content.
  final ConfluenceCrawlerConfiguration? crawlerConfiguration;

  ConfluenceDataSourceConfiguration({
    required this.sourceConfiguration,
    this.crawlerConfiguration,
  });

  factory ConfluenceDataSourceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ConfluenceDataSourceConfiguration(
      sourceConfiguration: ConfluenceSourceConfiguration.fromJson(
          json['sourceConfiguration'] as Map<String, dynamic>),
      crawlerConfiguration: json['crawlerConfiguration'] != null
          ? ConfluenceCrawlerConfiguration.fromJson(
              json['crawlerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceConfiguration = this.sourceConfiguration;
    final crawlerConfiguration = this.crawlerConfiguration;
    return {
      'sourceConfiguration': sourceConfiguration,
      if (crawlerConfiguration != null)
        'crawlerConfiguration': crawlerConfiguration,
    };
  }
}

enum ConfluenceHostType {
  saas('SAAS'),
  ;

  final String value;

  const ConfluenceHostType(this.value);

  static ConfluenceHostType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ConfluenceHostType'));
}

/// The endpoint information to connect to your Confluence data source.
class ConfluenceSourceConfiguration {
  /// The supported authentication type to authenticate and connect to your
  /// Confluence instance.
  final ConfluenceAuthType authType;

  /// The Amazon Resource Name of an Secrets Manager secret that stores your
  /// authentication credentials for your Confluence instance URL. For more
  /// information on the key-value pairs that must be included in your secret,
  /// depending on your authentication type, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/confluence-data-source-connector.html#configuration-confluence-connector">Confluence
  /// connection configuration</a>.
  final String credentialsSecretArn;

  /// The supported host type, whether online/cloud or server/on-premises.
  final ConfluenceHostType hostType;

  /// The Confluence host URL or instance URL.
  final String hostUrl;

  ConfluenceSourceConfiguration({
    required this.authType,
    required this.credentialsSecretArn,
    required this.hostType,
    required this.hostUrl,
  });

  factory ConfluenceSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return ConfluenceSourceConfiguration(
      authType: ConfluenceAuthType.fromString((json['authType'] as String)),
      credentialsSecretArn: json['credentialsSecretArn'] as String,
      hostType: ConfluenceHostType.fromString((json['hostType'] as String)),
      hostUrl: json['hostUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final authType = this.authType;
    final credentialsSecretArn = this.credentialsSecretArn;
    final hostType = this.hostType;
    final hostUrl = this.hostUrl;
    return {
      'authType': authType.value,
      'credentialsSecretArn': credentialsSecretArn,
      'hostType': hostType.value,
      'hostUrl': hostUrl,
    };
  }
}

/// The configuration of filtering the data source content. For example,
/// configuring regular expression patterns to include or exclude certain
/// content.
class CrawlFilterConfiguration {
  /// The type of filtering that you want to apply to certain objects or content
  /// of the data source. For example, the <code>PATTERN</code> type is regular
  /// expression patterns you can apply to filter your content.
  final CrawlFilterConfigurationType type;

  /// The configuration of filtering certain objects or content types of the data
  /// source.
  final PatternObjectFilterConfiguration? patternObjectFilter;

  CrawlFilterConfiguration({
    required this.type,
    this.patternObjectFilter,
  });

  factory CrawlFilterConfiguration.fromJson(Map<String, dynamic> json) {
    return CrawlFilterConfiguration(
      type: CrawlFilterConfigurationType.fromString((json['type'] as String)),
      patternObjectFilter: json['patternObjectFilter'] != null
          ? PatternObjectFilterConfiguration.fromJson(
              json['patternObjectFilter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final patternObjectFilter = this.patternObjectFilter;
    return {
      'type': type.value,
      if (patternObjectFilter != null)
        'patternObjectFilter': patternObjectFilter,
    };
  }
}

enum CrawlFilterConfigurationType {
  pattern('PATTERN'),
  ;

  final String value;

  const CrawlFilterConfigurationType(this.value);

  static CrawlFilterConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CrawlFilterConfigurationType'));
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

class CreateFlowAliasResponse {
  /// The Amazon Resource Name (ARN) of the alias.
  final String arn;

  /// The time at which the alias was created.
  final DateTime createdAt;

  /// The unique identifier of the flow that the alias belongs to.
  final String flowId;

  /// The unique identifier of the alias.
  final String id;

  /// The name of the alias.
  final String name;

  /// Contains information about the version that the alias is mapped to.
  final List<FlowAliasRoutingConfigurationListItem> routingConfiguration;

  /// The time at which the alias of the flow was last updated.
  final DateTime updatedAt;

  /// The description of the alias.
  final String? description;

  CreateFlowAliasResponse({
    required this.arn,
    required this.createdAt,
    required this.flowId,
    required this.id,
    required this.name,
    required this.routingConfiguration,
    required this.updatedAt,
    this.description,
  });

  factory CreateFlowAliasResponse.fromJson(Map<String, dynamic> json) {
    return CreateFlowAliasResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      flowId: json['flowId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      routingConfiguration: (json['routingConfiguration'] as List)
          .nonNulls
          .map((e) => FlowAliasRoutingConfigurationListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final flowId = this.flowId;
    final id = this.id;
    final name = this.name;
    final routingConfiguration = this.routingConfiguration;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'flowId': flowId,
      'id': id,
      'name': name,
      'routingConfiguration': routingConfiguration,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

class CreateFlowResponse {
  /// The Amazon Resource Name (ARN) of the flow.
  final String arn;

  /// The time at which the flow was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the service role with permissions to
  /// create a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-permissions.html">Create
  /// a service role for flows in Amazon Bedrock</a> in the Amazon Bedrock User
  /// Guide.
  final String executionRoleArn;

  /// The unique identifier of the flow.
  final String id;

  /// The name of the flow.
  final String name;

  /// The status of the flow. When you submit this request, the status will be
  /// <code>NotPrepared</code>. If creation fails, the status becomes
  /// <code>Failed</code>.
  final FlowStatus status;

  /// The time at which the flow was last updated.
  final DateTime updatedAt;

  /// The version of the flow. When you create a flow, the version created is the
  /// <code>DRAFT</code> version.
  final String version;

  /// The Amazon Resource Name (ARN) of the KMS key that you encrypted the flow
  /// with.
  final String? customerEncryptionKeyArn;

  /// A definition of the nodes and connections between nodes in the flow.
  final FlowDefinition? definition;

  /// The description of the flow.
  final String? description;

  CreateFlowResponse({
    required this.arn,
    required this.createdAt,
    required this.executionRoleArn,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    required this.version,
    this.customerEncryptionKeyArn,
    this.definition,
    this.description,
  });

  factory CreateFlowResponse.fromJson(Map<String, dynamic> json) {
    return CreateFlowResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      executionRoleArn: json['executionRoleArn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: FlowStatus.fromString((json['status'] as String)),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      definition: json['definition'] != null
          ? FlowDefinition.fromJson(json['definition'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final executionRoleArn = this.executionRoleArn;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final definition = this.definition;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'executionRoleArn': executionRoleArn,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (definition != null) 'definition': definition,
      if (description != null) 'description': description,
    };
  }
}

class CreateFlowVersionResponse {
  /// The Amazon Resource Name (ARN) of the flow.
  final String arn;

  /// The time at which the flow was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the service role with permissions to
  /// create a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-permissions.html">Create
  /// a service role for flows in Amazon Bedrock</a> in the Amazon Bedrock User
  /// Guide.
  final String executionRoleArn;

  /// The unique identifier of the flow.
  final String id;

  /// The name of the version.
  final String name;

  /// The status of the flow.
  final FlowStatus status;

  /// The version of the flow that was created. Versions are numbered
  /// incrementally, starting from 1.
  final String version;

  /// The KMS key that the flow is encrypted with.
  final String? customerEncryptionKeyArn;

  /// A definition of the nodes and connections in the flow.
  final FlowDefinition? definition;

  /// The description of the version.
  final String? description;

  CreateFlowVersionResponse({
    required this.arn,
    required this.createdAt,
    required this.executionRoleArn,
    required this.id,
    required this.name,
    required this.status,
    required this.version,
    this.customerEncryptionKeyArn,
    this.definition,
    this.description,
  });

  factory CreateFlowVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateFlowVersionResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      executionRoleArn: json['executionRoleArn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: FlowStatus.fromString((json['status'] as String)),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      definition: json['definition'] != null
          ? FlowDefinition.fromJson(json['definition'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final executionRoleArn = this.executionRoleArn;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final version = this.version;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final definition = this.definition;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'executionRoleArn': executionRoleArn,
      'id': id,
      'name': name,
      'status': status.value,
      'version': version,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (definition != null) 'definition': definition,
      if (description != null) 'description': description,
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

class CreatePromptResponse {
  /// The Amazon Resource Name (ARN) of the prompt.
  final String arn;

  /// The time at which the prompt was created.
  final DateTime createdAt;

  /// The unique identifier of the prompt.
  final String id;

  /// The name of the prompt.
  final String name;

  /// The time at which the prompt was last updated.
  final DateTime updatedAt;

  /// The version of the prompt. When you create a prompt, the version created is
  /// the <code>DRAFT</code> version.
  final String version;

  /// The Amazon Resource Name (ARN) of the KMS key that you encrypted the prompt
  /// with.
  final String? customerEncryptionKeyArn;

  /// The name of the default variant for your prompt.
  final String? defaultVariant;

  /// The description of the prompt.
  final String? description;

  /// A list of objects, each containing details about a variant of the prompt.
  final List<PromptVariant>? variants;

  CreatePromptResponse({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.version,
    this.customerEncryptionKeyArn,
    this.defaultVariant,
    this.description,
    this.variants,
  });

  factory CreatePromptResponse.fromJson(Map<String, dynamic> json) {
    return CreatePromptResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      defaultVariant: json['defaultVariant'] as String?,
      description: json['description'] as String?,
      variants: (json['variants'] as List?)
          ?.nonNulls
          .map((e) => PromptVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final defaultVariant = this.defaultVariant;
    final description = this.description;
    final variants = this.variants;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'name': name,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (defaultVariant != null) 'defaultVariant': defaultVariant,
      if (description != null) 'description': description,
      if (variants != null) 'variants': variants,
    };
  }
}

class CreatePromptVersionResponse {
  /// The Amazon Resource Name (ARN) of the version of the prompt.
  final String arn;

  /// The time at which the prompt was created.
  final DateTime createdAt;

  /// The unique identifier of the prompt.
  final String id;

  /// The name of the prompt.
  final String name;

  /// The time at which the prompt was last updated.
  final DateTime updatedAt;

  /// The version of the prompt that was created. Versions are numbered
  /// incrementally, starting from 1.
  final String version;

  /// The Amazon Resource Name (ARN) of the KMS key to encrypt the version of the
  /// prompt.
  final String? customerEncryptionKeyArn;

  /// The name of the default variant for the prompt. This value must match the
  /// <code>name</code> field in the relevant <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptVariant.html">PromptVariant</a>
  /// object.
  final String? defaultVariant;

  /// A description for the version.
  final String? description;

  /// A list of objects, each containing details about a variant of the prompt.
  final List<PromptVariant>? variants;

  CreatePromptVersionResponse({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.version,
    this.customerEncryptionKeyArn,
    this.defaultVariant,
    this.description,
    this.variants,
  });

  factory CreatePromptVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreatePromptVersionResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      defaultVariant: json['defaultVariant'] as String?,
      description: json['description'] as String?,
      variants: (json['variants'] as List?)
          ?.nonNulls
          .map((e) => PromptVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final defaultVariant = this.defaultVariant;
    final description = this.description;
    final variants = this.variants;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'name': name,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (defaultVariant != null) 'defaultVariant': defaultVariant,
      if (description != null) 'description': description,
      if (variants != null) 'variants': variants,
    };
  }
}

enum CreationMode {
  $default('DEFAULT'),
  overridden('OVERRIDDEN'),
  ;

  final String value;

  const CreationMode(this.value);

  static CreationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CreationMode'));
}

enum CustomControlMethod {
  returnControl('RETURN_CONTROL'),
  ;

  final String value;

  const CustomControlMethod(this.value);

  static CustomControlMethod fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CustomControlMethod'));
}

/// Settings for customizing steps in the data source content ingestion
/// pipeline.
///
/// You can configure the data source to process documents with a Lambda
/// function after they are parsed and converted into chunks. When you add a
/// post-chunking transformation, the service stores chunked documents in an S3
/// bucket and invokes a Lambda function to process them.
///
/// To process chunked documents with a Lambda function, define an S3 bucket
/// path for input and output objects, and a transformation that specifies the
/// Lambda function to invoke. You can use the Lambda function to customize how
/// chunks are split, and the metadata for each chunk.
class CustomTransformationConfiguration {
  /// An S3 bucket path for input and output objects.
  final IntermediateStorage intermediateStorage;

  /// A Lambda function that processes documents.
  final List<Transformation> transformations;

  CustomTransformationConfiguration({
    required this.intermediateStorage,
    required this.transformations,
  });

  factory CustomTransformationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CustomTransformationConfiguration(
      intermediateStorage: IntermediateStorage.fromJson(
          json['intermediateStorage'] as Map<String, dynamic>),
      transformations: (json['transformations'] as List)
          .nonNulls
          .map((e) => Transformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final intermediateStorage = this.intermediateStorage;
    final transformations = this.transformations;
    return {
      'intermediateStorage': intermediateStorage,
      'transformations': transformations,
    };
  }
}

enum DataDeletionPolicy {
  retain('RETAIN'),
  delete('DELETE'),
  ;

  final String value;

  const DataDeletionPolicy(this.value);

  static DataDeletionPolicy fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum DataDeletionPolicy'));
}

/// Contains details about a data source.
class DataSource {
  /// The time at which the data source was created.
  final DateTime createdAt;

  /// The connection configuration for the data source.
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

  /// The data deletion policy for the data source.
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
      status: DataSourceStatus.fromString((json['status'] as String)),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      dataDeletionPolicy: (json['dataDeletionPolicy'] as String?)
          ?.let(DataDeletionPolicy.fromString),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.nonNulls
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
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (dataDeletionPolicy != null)
        'dataDeletionPolicy': dataDeletionPolicy.value,
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (serverSideEncryptionConfiguration != null)
        'serverSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (vectorIngestionConfiguration != null)
        'vectorIngestionConfiguration': vectorIngestionConfiguration,
    };
  }
}

/// The connection configuration for the data source.
class DataSourceConfiguration {
  /// The type of data source.
  final DataSourceType type;

  /// The configuration information to connect to Confluence as your data source.
  /// <note>
  /// Confluence data source connector is in preview release and is subject to
  /// change.
  /// </note>
  final ConfluenceDataSourceConfiguration? confluenceConfiguration;

  /// The configuration information to connect to Amazon S3 as your data source.
  final S3DataSourceConfiguration? s3Configuration;

  /// The configuration information to connect to Salesforce as your data source.
  /// <note>
  /// Salesforce data source connector is in preview release and is subject to
  /// change.
  /// </note>
  final SalesforceDataSourceConfiguration? salesforceConfiguration;

  /// The configuration information to connect to SharePoint as your data source.
  /// <note>
  /// SharePoint data source connector is in preview release and is subject to
  /// change.
  /// </note>
  final SharePointDataSourceConfiguration? sharePointConfiguration;

  /// The configuration of web URLs to crawl for your data source. You should be
  /// authorized to crawl the URLs.
  /// <note>
  /// Crawling web URLs as your data source is in preview release and is subject
  /// to change.
  /// </note>
  final WebDataSourceConfiguration? webConfiguration;

  DataSourceConfiguration({
    required this.type,
    this.confluenceConfiguration,
    this.s3Configuration,
    this.salesforceConfiguration,
    this.sharePointConfiguration,
    this.webConfiguration,
  });

  factory DataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSourceConfiguration(
      type: DataSourceType.fromString((json['type'] as String)),
      confluenceConfiguration: json['confluenceConfiguration'] != null
          ? ConfluenceDataSourceConfiguration.fromJson(
              json['confluenceConfiguration'] as Map<String, dynamic>)
          : null,
      s3Configuration: json['s3Configuration'] != null
          ? S3DataSourceConfiguration.fromJson(
              json['s3Configuration'] as Map<String, dynamic>)
          : null,
      salesforceConfiguration: json['salesforceConfiguration'] != null
          ? SalesforceDataSourceConfiguration.fromJson(
              json['salesforceConfiguration'] as Map<String, dynamic>)
          : null,
      sharePointConfiguration: json['sharePointConfiguration'] != null
          ? SharePointDataSourceConfiguration.fromJson(
              json['sharePointConfiguration'] as Map<String, dynamic>)
          : null,
      webConfiguration: json['webConfiguration'] != null
          ? WebDataSourceConfiguration.fromJson(
              json['webConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final confluenceConfiguration = this.confluenceConfiguration;
    final s3Configuration = this.s3Configuration;
    final salesforceConfiguration = this.salesforceConfiguration;
    final sharePointConfiguration = this.sharePointConfiguration;
    final webConfiguration = this.webConfiguration;
    return {
      'type': type.value,
      if (confluenceConfiguration != null)
        'confluenceConfiguration': confluenceConfiguration,
      if (s3Configuration != null) 's3Configuration': s3Configuration,
      if (salesforceConfiguration != null)
        'salesforceConfiguration': salesforceConfiguration,
      if (sharePointConfiguration != null)
        'sharePointConfiguration': sharePointConfiguration,
      if (webConfiguration != null) 'webConfiguration': webConfiguration,
    };
  }
}

enum DataSourceStatus {
  available('AVAILABLE'),
  deleting('DELETING'),
  deleteUnsuccessful('DELETE_UNSUCCESSFUL'),
  ;

  final String value;

  const DataSourceStatus(this.value);

  static DataSourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DataSourceStatus'));
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
      status: DataSourceStatus.fromString((json['status'] as String)),
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
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

enum DataSourceType {
  s3('S3'),
  web('WEB'),
  confluence('CONFLUENCE'),
  salesforce('SALESFORCE'),
  sharepoint('SHAREPOINT'),
  ;

  final String value;

  const DataSourceType(this.value);

  static DataSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DataSourceType'));
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
          AgentAliasStatus.fromString((json['agentAliasStatus'] as String)),
      agentId: json['agentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final agentAliasId = this.agentAliasId;
    final agentAliasStatus = this.agentAliasStatus;
    final agentId = this.agentId;
    return {
      'agentAliasId': agentAliasId,
      'agentAliasStatus': agentAliasStatus.value,
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
      agentStatus: AgentStatus.fromString((json['agentStatus'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final agentStatus = this.agentStatus;
    return {
      'agentId': agentId,
      'agentStatus': agentStatus.value,
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
      agentStatus: AgentStatus.fromString((json['agentStatus'] as String)),
      agentVersion: json['agentVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final agentStatus = this.agentStatus;
    final agentVersion = this.agentVersion;
    return {
      'agentId': agentId,
      'agentStatus': agentStatus.value,
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
      status: DataSourceStatus.fromString((json['status'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final knowledgeBaseId = this.knowledgeBaseId;
    final status = this.status;
    return {
      'dataSourceId': dataSourceId,
      'knowledgeBaseId': knowledgeBaseId,
      'status': status.value,
    };
  }
}

class DeleteFlowAliasResponse {
  /// The unique identifier of the flow that the alias belongs to.
  final String flowId;

  /// The unique identifier of the flow.
  final String id;

  DeleteFlowAliasResponse({
    required this.flowId,
    required this.id,
  });

  factory DeleteFlowAliasResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFlowAliasResponse(
      flowId: json['flowId'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final flowId = this.flowId;
    final id = this.id;
    return {
      'flowId': flowId,
      'id': id,
    };
  }
}

class DeleteFlowResponse {
  /// The unique identifier of the flow.
  final String id;

  DeleteFlowResponse({
    required this.id,
  });

  factory DeleteFlowResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFlowResponse(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

class DeleteFlowVersionResponse {
  /// The unique identifier of the flow.
  final String id;

  /// The version of the flow being deleted.
  final String version;

  DeleteFlowVersionResponse({
    required this.id,
    required this.version,
  });

  factory DeleteFlowVersionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFlowVersionResponse(
      id: json['id'] as String,
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final version = this.version;
    return {
      'id': id,
      'version': version,
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
      status: KnowledgeBaseStatus.fromString((json['status'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final status = this.status;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      'status': status.value,
    };
  }
}

class DeletePromptResponse {
  /// The unique identifier of the prompt that was deleted.
  final String id;

  /// The version of the prompt that was deleted.
  final String? version;

  DeletePromptResponse({
    required this.id,
    this.version,
  });

  factory DeletePromptResponse.fromJson(Map<String, dynamic> json) {
    return DeletePromptResponse(
      id: json['id'] as String,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final version = this.version;
    return {
      'id': id,
      if (version != null) 'version': version,
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

/// Contains information about a version that the alias maps to.
class FlowAliasRoutingConfigurationListItem {
  /// The version that the alias maps to.
  final String? flowVersion;

  FlowAliasRoutingConfigurationListItem({
    this.flowVersion,
  });

  factory FlowAliasRoutingConfigurationListItem.fromJson(
      Map<String, dynamic> json) {
    return FlowAliasRoutingConfigurationListItem(
      flowVersion: json['flowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowVersion = this.flowVersion;
    return {
      if (flowVersion != null) 'flowVersion': flowVersion,
    };
  }
}

/// Contains information about an alias of a flow.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_ListFlowAliases.html#API_agent_ListFlowAliases_ResponseSyntax">ListFlowAliases
/// response</a>
/// </li>
/// </ul>
class FlowAliasSummary {
  /// The Amazon Resource Name (ARN) of the alias.
  final String arn;

  /// The time at which the alias was created.
  final DateTime createdAt;

  /// The unique identifier of the flow.
  final String flowId;

  /// The unique identifier of the alias of the flow.
  final String id;

  /// The name of the alias.
  final String name;

  /// A list of configurations about the versions that the alias maps to.
  /// Currently, you can only specify one.
  final List<FlowAliasRoutingConfigurationListItem> routingConfiguration;

  /// The time at which the alias was last updated.
  final DateTime updatedAt;

  /// A description of the alias.
  final String? description;

  FlowAliasSummary({
    required this.arn,
    required this.createdAt,
    required this.flowId,
    required this.id,
    required this.name,
    required this.routingConfiguration,
    required this.updatedAt,
    this.description,
  });

  factory FlowAliasSummary.fromJson(Map<String, dynamic> json) {
    return FlowAliasSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      flowId: json['flowId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      routingConfiguration: (json['routingConfiguration'] as List)
          .nonNulls
          .map((e) => FlowAliasRoutingConfigurationListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final flowId = this.flowId;
    final id = this.id;
    final name = this.name;
    final routingConfiguration = this.routingConfiguration;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'flowId': flowId,
      'id': id,
      'name': name,
      'routingConfiguration': routingConfiguration,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

/// Defines a condition in the condition node.
class FlowCondition {
  /// A name for the condition that you can reference.
  final String name;

  /// Defines the condition. You must refer to at least one of the inputs in the
  /// condition. For more information, expand the Condition node section in <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-how-it-works.html#flows-nodes">Node
  /// types in prompt flows</a>.
  final String? expression;

  FlowCondition({
    required this.name,
    this.expression,
  });

  factory FlowCondition.fromJson(Map<String, dynamic> json) {
    return FlowCondition(
      name: json['name'] as String,
      expression: json['expression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final expression = this.expression;
    return {
      'name': name,
      if (expression != null) 'expression': expression,
    };
  }
}

/// The configuration of a connection between a condition node and another node.
class FlowConditionalConnectionConfiguration {
  /// The condition that triggers this connection. For more information about how
  /// to write conditions, see the <b>Condition</b> node type in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/node-types.html">Node
  /// types</a> topic in the Amazon Bedrock User Guide.
  final String condition;

  FlowConditionalConnectionConfiguration({
    required this.condition,
  });

  factory FlowConditionalConnectionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return FlowConditionalConnectionConfiguration(
      condition: json['condition'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    return {
      'condition': condition,
    };
  }
}

/// Contains information about a connection between two nodes in the flow.
class FlowConnection {
  /// A name for the connection that you can reference.
  final String name;

  /// The node that the connection starts at.
  final String source;

  /// The node that the connection ends at.
  final String target;

  /// Whether the source node that the connection begins from is a condition node
  /// (<code>Conditional</code>) or not (<code>Data</code>).
  final FlowConnectionType type;

  /// The configuration of the connection.
  final FlowConnectionConfiguration? configuration;

  FlowConnection({
    required this.name,
    required this.source,
    required this.target,
    required this.type,
    this.configuration,
  });

  factory FlowConnection.fromJson(Map<String, dynamic> json) {
    return FlowConnection(
      name: json['name'] as String,
      source: json['source'] as String,
      target: json['target'] as String,
      type: FlowConnectionType.fromString((json['type'] as String)),
      configuration: json['configuration'] != null
          ? FlowConnectionConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final source = this.source;
    final target = this.target;
    final type = this.type;
    final configuration = this.configuration;
    return {
      'name': name,
      'source': source,
      'target': target,
      'type': type.value,
      if (configuration != null) 'configuration': configuration,
    };
  }
}

/// The configuration of the connection.
class FlowConnectionConfiguration {
  /// The configuration of a connection originating from a Condition node.
  final FlowConditionalConnectionConfiguration? conditional;

  /// The configuration of a connection originating from a node that isn't a
  /// Condition node.
  final FlowDataConnectionConfiguration? data;

  FlowConnectionConfiguration({
    this.conditional,
    this.data,
  });

  factory FlowConnectionConfiguration.fromJson(Map<String, dynamic> json) {
    return FlowConnectionConfiguration(
      conditional: json['conditional'] != null
          ? FlowConditionalConnectionConfiguration.fromJson(
              json['conditional'] as Map<String, dynamic>)
          : null,
      data: json['data'] != null
          ? FlowDataConnectionConfiguration.fromJson(
              json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final conditional = this.conditional;
    final data = this.data;
    return {
      if (conditional != null) 'conditional': conditional,
      if (data != null) 'data': data,
    };
  }
}

enum FlowConnectionType {
  data('Data'),
  conditional('Conditional'),
  ;

  final String value;

  const FlowConnectionType(this.value);

  static FlowConnectionType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum FlowConnectionType'));
}

/// The configuration of a connection originating from a node that isn't a
/// Condition node.
class FlowDataConnectionConfiguration {
  /// The name of the output in the source node that the connection begins from.
  final String sourceOutput;

  /// The name of the input in the target node that the connection ends at.
  final String targetInput;

  FlowDataConnectionConfiguration({
    required this.sourceOutput,
    required this.targetInput,
  });

  factory FlowDataConnectionConfiguration.fromJson(Map<String, dynamic> json) {
    return FlowDataConnectionConfiguration(
      sourceOutput: json['sourceOutput'] as String,
      targetInput: json['targetInput'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceOutput = this.sourceOutput;
    final targetInput = this.targetInput;
    return {
      'sourceOutput': sourceOutput,
      'targetInput': targetInput,
    };
  }
}

/// The definition of the nodes and connections between nodes in the flow.
class FlowDefinition {
  /// An array of connection definitions in the flow.
  final List<FlowConnection>? connections;

  /// An array of node definitions in the flow.
  final List<FlowNode>? nodes;

  FlowDefinition({
    this.connections,
    this.nodes,
  });

  factory FlowDefinition.fromJson(Map<String, dynamic> json) {
    return FlowDefinition(
      connections: (json['connections'] as List?)
          ?.nonNulls
          .map((e) => FlowConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodes: (json['nodes'] as List?)
          ?.nonNulls
          .map((e) => FlowNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    final nodes = this.nodes;
    return {
      if (connections != null) 'connections': connections,
      if (nodes != null) 'nodes': nodes,
    };
  }
}

/// Contains configurations about a node in the flow.
class FlowNode {
  /// A name for the node.
  final String name;

  /// The type of node. This value must match the name of the key that you provide
  /// in the configuration you provide in the <code>FlowNodeConfiguration</code>
  /// field.
  final FlowNodeType type;

  /// Contains configurations for the node.
  final FlowNodeConfiguration? configuration;

  /// An array of objects, each of which contains information about an input into
  /// the node.
  final List<FlowNodeInput>? inputs;

  /// A list of objects, each of which contains information about an output from
  /// the node.
  final List<FlowNodeOutput>? outputs;

  FlowNode({
    required this.name,
    required this.type,
    this.configuration,
    this.inputs,
    this.outputs,
  });

  factory FlowNode.fromJson(Map<String, dynamic> json) {
    return FlowNode(
      name: json['name'] as String,
      type: FlowNodeType.fromString((json['type'] as String)),
      configuration: json['configuration'] != null
          ? FlowNodeConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      inputs: (json['inputs'] as List?)
          ?.nonNulls
          .map((e) => FlowNodeInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputs: (json['outputs'] as List?)
          ?.nonNulls
          .map((e) => FlowNodeOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final configuration = this.configuration;
    final inputs = this.inputs;
    final outputs = this.outputs;
    return {
      'name': name,
      'type': type.value,
      if (configuration != null) 'configuration': configuration,
      if (inputs != null) 'inputs': inputs,
      if (outputs != null) 'outputs': outputs,
    };
  }
}

/// Contains configurations for a node in your flow. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in Amazon Bedrock works</a> in the Amazon Bedrock User Guide.
class FlowNodeConfiguration {
  /// Contains configurations for an agent node in your flow. Invokes an alias of
  /// an agent and returns the response.
  final AgentFlowNodeConfiguration? agent;

  /// Contains configurations for a collector node in your flow. Collects an
  /// iteration of inputs and consolidates them into an array of outputs.
  final CollectorFlowNodeConfiguration? collector;

  /// Contains configurations for a Condition node in your flow. Defines
  /// conditions that lead to different branches of the flow.
  final ConditionFlowNodeConfiguration? condition;

  /// Contains configurations for an input flow node in your flow. The first node
  /// in the flow. <code>inputs</code> can't be specified for this node.
  final InputFlowNodeConfiguration? input;

  /// Contains configurations for an iterator node in your flow. Takes an input
  /// that is an array and iteratively sends each item of the array as an output
  /// to the following node. The size of the array is also returned in the output.
  ///
  /// The output flow node at the end of the flow iteration will return a response
  /// for each member of the array. To return only one response, you can include a
  /// collector node downstream from the iterator node.
  final IteratorFlowNodeConfiguration? iterator;

  /// Contains configurations for a knowledge base node in your flow. Queries a
  /// knowledge base and returns the retrieved results or generated response.
  final KnowledgeBaseFlowNodeConfiguration? knowledgeBase;

  /// Contains configurations for a Lambda function node in your flow. Invokes an
  /// Lambda function.
  final LambdaFunctionFlowNodeConfiguration? lambdaFunction;

  /// Contains configurations for a Lex node in your flow. Invokes an Amazon Lex
  /// bot to identify the intent of the input and return the intent as the output.
  final LexFlowNodeConfiguration? lex;

  /// Contains configurations for an output flow node in your flow. The last node
  /// in the flow. <code>outputs</code> can't be specified for this node.
  final OutputFlowNodeConfiguration? output;

  /// Contains configurations for a prompt node in your flow. Runs a prompt and
  /// generates the model response as the output. You can use a prompt from Prompt
  /// management or you can configure one in this node.
  final PromptFlowNodeConfiguration? prompt;

  /// Contains configurations for a Retrieval node in your flow. Retrieves data
  /// from an Amazon S3 location and returns it as the output.
  final RetrievalFlowNodeConfiguration? retrieval;

  /// Contains configurations for a Storage node in your flow. Stores an input in
  /// an Amazon S3 location.
  final StorageFlowNodeConfiguration? storage;

  FlowNodeConfiguration({
    this.agent,
    this.collector,
    this.condition,
    this.input,
    this.iterator,
    this.knowledgeBase,
    this.lambdaFunction,
    this.lex,
    this.output,
    this.prompt,
    this.retrieval,
    this.storage,
  });

  factory FlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return FlowNodeConfiguration(
      agent: json['agent'] != null
          ? AgentFlowNodeConfiguration.fromJson(
              json['agent'] as Map<String, dynamic>)
          : null,
      collector: json['collector'] != null
          ? CollectorFlowNodeConfiguration.fromJson(
              json['collector'] as Map<String, dynamic>)
          : null,
      condition: json['condition'] != null
          ? ConditionFlowNodeConfiguration.fromJson(
              json['condition'] as Map<String, dynamic>)
          : null,
      input: json['input'] != null
          ? InputFlowNodeConfiguration.fromJson(
              json['input'] as Map<String, dynamic>)
          : null,
      iterator: json['iterator'] != null
          ? IteratorFlowNodeConfiguration.fromJson(
              json['iterator'] as Map<String, dynamic>)
          : null,
      knowledgeBase: json['knowledgeBase'] != null
          ? KnowledgeBaseFlowNodeConfiguration.fromJson(
              json['knowledgeBase'] as Map<String, dynamic>)
          : null,
      lambdaFunction: json['lambdaFunction'] != null
          ? LambdaFunctionFlowNodeConfiguration.fromJson(
              json['lambdaFunction'] as Map<String, dynamic>)
          : null,
      lex: json['lex'] != null
          ? LexFlowNodeConfiguration.fromJson(
              json['lex'] as Map<String, dynamic>)
          : null,
      output: json['output'] != null
          ? OutputFlowNodeConfiguration.fromJson(
              json['output'] as Map<String, dynamic>)
          : null,
      prompt: json['prompt'] != null
          ? PromptFlowNodeConfiguration.fromJson(
              json['prompt'] as Map<String, dynamic>)
          : null,
      retrieval: json['retrieval'] != null
          ? RetrievalFlowNodeConfiguration.fromJson(
              json['retrieval'] as Map<String, dynamic>)
          : null,
      storage: json['storage'] != null
          ? StorageFlowNodeConfiguration.fromJson(
              json['storage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agent = this.agent;
    final collector = this.collector;
    final condition = this.condition;
    final input = this.input;
    final iterator = this.iterator;
    final knowledgeBase = this.knowledgeBase;
    final lambdaFunction = this.lambdaFunction;
    final lex = this.lex;
    final output = this.output;
    final prompt = this.prompt;
    final retrieval = this.retrieval;
    final storage = this.storage;
    return {
      if (agent != null) 'agent': agent,
      if (collector != null) 'collector': collector,
      if (condition != null) 'condition': condition,
      if (input != null) 'input': input,
      if (iterator != null) 'iterator': iterator,
      if (knowledgeBase != null) 'knowledgeBase': knowledgeBase,
      if (lambdaFunction != null) 'lambdaFunction': lambdaFunction,
      if (lex != null) 'lex': lex,
      if (output != null) 'output': output,
      if (prompt != null) 'prompt': prompt,
      if (retrieval != null) 'retrieval': retrieval,
      if (storage != null) 'storage': storage,
    };
  }
}

enum FlowNodeIODataType {
  string('String'),
  number('Number'),
  boolean('Boolean'),
  object('Object'),
  array('Array'),
  ;

  final String value;

  const FlowNodeIODataType(this.value);

  static FlowNodeIODataType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum FlowNodeIODataType'));
}

/// Contains configurations for an input to a node.
class FlowNodeInput {
  /// An expression that formats the input for the node. For an explanation of how
  /// to create expressions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-expressions.html">Expressions
  /// in Prompt flows in Amazon Bedrock</a>.
  final String expression;

  /// A name for the input that you can reference.
  final String name;

  /// The data type of the input. If the input doesn't match this type at runtime,
  /// a validation error will be thrown.
  final FlowNodeIODataType type;

  FlowNodeInput({
    required this.expression,
    required this.name,
    required this.type,
  });

  factory FlowNodeInput.fromJson(Map<String, dynamic> json) {
    return FlowNodeInput(
      expression: json['expression'] as String,
      name: json['name'] as String,
      type: FlowNodeIODataType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final name = this.name;
    final type = this.type;
    return {
      'expression': expression,
      'name': name,
      'type': type.value,
    };
  }
}

/// Contains configurations for an output from a node.
class FlowNodeOutput {
  /// A name for the output that you can reference.
  final String name;

  /// The data type of the output. If the output doesn't match this type at
  /// runtime, a validation error will be thrown.
  final FlowNodeIODataType type;

  FlowNodeOutput({
    required this.name,
    required this.type,
  });

  factory FlowNodeOutput.fromJson(Map<String, dynamic> json) {
    return FlowNodeOutput(
      name: json['name'] as String,
      type: FlowNodeIODataType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type.value,
    };
  }
}

enum FlowNodeType {
  input('Input'),
  output('Output'),
  knowledgeBase('KnowledgeBase'),
  condition('Condition'),
  lex('Lex'),
  prompt('Prompt'),
  lambdaFunction('LambdaFunction'),
  storage('Storage'),
  agent('Agent'),
  retrieval('Retrieval'),
  iterator('Iterator'),
  collector('Collector'),
  ;

  final String value;

  const FlowNodeType(this.value);

  static FlowNodeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum FlowNodeType'));
}

enum FlowStatus {
  failed('Failed'),
  prepared('Prepared'),
  preparing('Preparing'),
  notPrepared('NotPrepared'),
  ;

  final String value;

  const FlowStatus(this.value);

  static FlowStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum FlowStatus'));
}

/// Contains the definition of a flow.
class FlowSummary {
  /// The Amazon Resource Name (ARN) of the flow.
  final String arn;

  /// The time at which the flow was created.
  final DateTime createdAt;

  /// The unique identifier of the flow.
  final String id;

  /// The name of the flow.
  final String name;

  /// The status of the flow. The following statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// NotPrepared – The flow has been created or updated, but hasn't been
  /// prepared. If you just created the flow, you can't test it. If you updated
  /// the flow, the <code>DRAFT</code> version won't contain the latest changes
  /// for testing. Send a <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PrepareFlow.html">PrepareFlow</a>
  /// request to package the latest changes into the <code>DRAFT</code> version.
  /// </li>
  /// <li>
  /// Preparing – The flow is being prepared so that the <code>DRAFT</code>
  /// version contains the latest changes for testing.
  /// </li>
  /// <li>
  /// Prepared – The flow is prepared and the <code>DRAFT</code> version contains
  /// the latest changes for testing.
  /// </li>
  /// <li>
  /// Failed – The last API operation that you invoked on the flow failed. Send a
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_GetFlow.html">GetFlow</a>
  /// request and check the error message in the <code>validations</code> field.
  /// </li>
  /// </ul>
  final FlowStatus status;

  /// The time at which the flow was last updated.
  final DateTime updatedAt;

  /// The latest version of the flow.
  final String version;

  /// A description of the flow.
  final String? description;

  FlowSummary({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    required this.version,
    this.description,
  });

  factory FlowSummary.fromJson(Map<String, dynamic> json) {
    return FlowSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      status: FlowStatus.fromString((json['status'] as String)),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (description != null) 'description': description,
    };
  }
}

/// Contains information about validation of the flow.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_GetFlow.html#API_agent_GetFlow_ResponseSyntax">GetFlow
/// response</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_GetFlowVersion.html#API_agent_GetFlowVersion_ResponseSyntax">GetFlowVersion
/// response</a>
/// </li>
/// </ul>
class FlowValidation {
  /// A message describing the validation error.
  final String message;

  /// The severity of the issue described in the message.
  final FlowValidationSeverity severity;

  FlowValidation({
    required this.message,
    required this.severity,
  });

  factory FlowValidation.fromJson(Map<String, dynamic> json) {
    return FlowValidation(
      message: json['message'] as String,
      severity: FlowValidationSeverity.fromString((json['severity'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final severity = this.severity;
    return {
      'message': message,
      'severity': severity.value,
    };
  }
}

enum FlowValidationSeverity {
  warning('Warning'),
  error('Error'),
  ;

  final String value;

  const FlowValidationSeverity(this.value);

  static FlowValidationSeverity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum FlowValidationSeverity'));
}

/// Contains information about a version of a flow.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_ListFlowVersions.html#API_agent_ListFlowVersions_ResponseSyntax">ListFlowVersions
/// response</a>
/// </li>
/// </ul>
class FlowVersionSummary {
  /// The Amazon Resource Name (ARN) of the flow that the version belongs to.
  final String arn;

  /// The time at the version was created.
  final DateTime createdAt;

  /// The unique identifier of the flow.
  final String id;

  /// The status of the flow.
  final FlowStatus status;

  /// The version of the flow.
  final String version;

  FlowVersionSummary({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.status,
    required this.version,
  });

  factory FlowVersionSummary.fromJson(Map<String, dynamic> json) {
    return FlowVersionSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      status: FlowStatus.fromString((json['status'] as String)),
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final status = this.status;
    final version = this.version;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'status': status.value,
      'version': version,
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

  /// Contains information if user confirmation is required to invoke the
  /// function.
  final RequireConfirmation? requireConfirmation;

  $Function({
    required this.name,
    this.description,
    this.parameters,
    this.requireConfirmation,
  });

  factory $Function.fromJson(Map<String, dynamic> json) {
    return $Function(
      name: json['name'] as String,
      description: json['description'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ParameterDetail.fromJson(e as Map<String, dynamic>))),
      requireConfirmation: (json['requireConfirmation'] as String?)
          ?.let(RequireConfirmation.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final description = this.description;
    final parameters = this.parameters;
    final requireConfirmation = this.requireConfirmation;
    return {
      'name': name,
      if (description != null) 'description': description,
      if (parameters != null) 'parameters': parameters,
      if (requireConfirmation != null)
        'requireConfirmation': requireConfirmation.value,
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
          ?.nonNulls
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

class GetFlowAliasResponse {
  /// The Amazon Resource Name (ARN) of the flow.
  final String arn;

  /// The time at which the flow was created.
  final DateTime createdAt;

  /// The unique identifier of the flow that the alias belongs to.
  final String flowId;

  /// The unique identifier of the alias of the flow.
  final String id;

  /// The name of the alias.
  final String name;

  /// Contains information about the version that the alias is mapped to.
  final List<FlowAliasRoutingConfigurationListItem> routingConfiguration;

  /// The time at which the alias was last updated.
  final DateTime updatedAt;

  /// The description of the flow.
  final String? description;

  GetFlowAliasResponse({
    required this.arn,
    required this.createdAt,
    required this.flowId,
    required this.id,
    required this.name,
    required this.routingConfiguration,
    required this.updatedAt,
    this.description,
  });

  factory GetFlowAliasResponse.fromJson(Map<String, dynamic> json) {
    return GetFlowAliasResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      flowId: json['flowId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      routingConfiguration: (json['routingConfiguration'] as List)
          .nonNulls
          .map((e) => FlowAliasRoutingConfigurationListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final flowId = this.flowId;
    final id = this.id;
    final name = this.name;
    final routingConfiguration = this.routingConfiguration;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'flowId': flowId,
      'id': id,
      'name': name,
      'routingConfiguration': routingConfiguration,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

class GetFlowResponse {
  /// The Amazon Resource Name (ARN) of the flow.
  final String arn;

  /// The time at which the flow was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the service role with permissions to
  /// create a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-permissions.html">Create
  /// a service row for flows</a> in the Amazon Bedrock User Guide.
  final String executionRoleArn;

  /// The unique identifier of the flow.
  final String id;

  /// The name of the flow.
  final String name;

  /// The status of the flow. The following statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// NotPrepared – The flow has been created or updated, but hasn't been
  /// prepared. If you just created the flow, you can't test it. If you updated
  /// the flow, the <code>DRAFT</code> version won't contain the latest changes
  /// for testing. Send a <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PrepareFlow.html">PrepareFlow</a>
  /// request to package the latest changes into the <code>DRAFT</code> version.
  /// </li>
  /// <li>
  /// Preparing – The flow is being prepared so that the <code>DRAFT</code>
  /// version contains the latest changes for testing.
  /// </li>
  /// <li>
  /// Prepared – The flow is prepared and the <code>DRAFT</code> version contains
  /// the latest changes for testing.
  /// </li>
  /// <li>
  /// Failed – The last API operation that you invoked on the flow failed. Send a
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_GetFlow.html">GetFlow</a>
  /// request and check the error message in the <code>validations</code> field.
  /// </li>
  /// </ul>
  final FlowStatus status;

  /// The time at which the flow was last updated.
  final DateTime updatedAt;

  /// The version of the flow for which information was retrieved.
  final String version;

  /// The Amazon Resource Name (ARN) of the KMS key that the flow is encrypted
  /// with.
  final String? customerEncryptionKeyArn;

  /// The definition of the nodes and connections between the nodes in the flow.
  final FlowDefinition? definition;

  /// The description of the flow.
  final String? description;

  /// A list of validation error messages related to the last failed operation on
  /// the flow.
  final List<FlowValidation>? validations;

  GetFlowResponse({
    required this.arn,
    required this.createdAt,
    required this.executionRoleArn,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    required this.version,
    this.customerEncryptionKeyArn,
    this.definition,
    this.description,
    this.validations,
  });

  factory GetFlowResponse.fromJson(Map<String, dynamic> json) {
    return GetFlowResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      executionRoleArn: json['executionRoleArn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: FlowStatus.fromString((json['status'] as String)),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      definition: json['definition'] != null
          ? FlowDefinition.fromJson(json['definition'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      validations: (json['validations'] as List?)
          ?.nonNulls
          .map((e) => FlowValidation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final executionRoleArn = this.executionRoleArn;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final definition = this.definition;
    final description = this.description;
    final validations = this.validations;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'executionRoleArn': executionRoleArn,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (definition != null) 'definition': definition,
      if (description != null) 'description': description,
      if (validations != null) 'validations': validations,
    };
  }
}

class GetFlowVersionResponse {
  /// The Amazon Resource Name (ARN) of the flow.
  final String arn;

  /// The time at which the flow was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the service role with permissions to
  /// create a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-permissions.html">Create
  /// a service role for flows in Amazon Bedrock</a> in the Amazon Bedrock User
  /// Guide.
  final String executionRoleArn;

  /// The unique identifier of the flow.
  final String id;

  /// The name of the version.
  final String name;

  /// The status of the flow.
  final FlowStatus status;

  /// The version of the flow for which information was retrieved.
  final String version;

  /// The Amazon Resource Name (ARN) of the KMS key that the version of the flow
  /// is encrypted with.
  final String? customerEncryptionKeyArn;

  /// The definition of the nodes and connections between nodes in the flow.
  final FlowDefinition? definition;

  /// The description of the flow.
  final String? description;

  GetFlowVersionResponse({
    required this.arn,
    required this.createdAt,
    required this.executionRoleArn,
    required this.id,
    required this.name,
    required this.status,
    required this.version,
    this.customerEncryptionKeyArn,
    this.definition,
    this.description,
  });

  factory GetFlowVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetFlowVersionResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      executionRoleArn: json['executionRoleArn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: FlowStatus.fromString((json['status'] as String)),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      definition: json['definition'] != null
          ? FlowDefinition.fromJson(json['definition'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final executionRoleArn = this.executionRoleArn;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final version = this.version;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final definition = this.definition;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'executionRoleArn': executionRoleArn,
      'id': id,
      'name': name,
      'status': status.value,
      'version': version,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (definition != null) 'definition': definition,
      if (description != null) 'description': description,
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

class GetPromptResponse {
  /// The Amazon Resource Name (ARN) of the prompt or the prompt version (if you
  /// specified a version in the request).
  final String arn;

  /// The time at which the prompt was created.
  final DateTime createdAt;

  /// The unique identifier of the prompt.
  final String id;

  /// The name of the prompt.
  final String name;

  /// The time at which the prompt was last updated.
  final DateTime updatedAt;

  /// The version of the prompt.
  final String version;

  /// The Amazon Resource Name (ARN) of the KMS key that the prompt is encrypted
  /// with.
  final String? customerEncryptionKeyArn;

  /// The name of the default variant for the prompt. This value must match the
  /// <code>name</code> field in the relevant <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptVariant.html">PromptVariant</a>
  /// object.
  final String? defaultVariant;

  /// The descriptino of the prompt.
  final String? description;

  /// A list of objects, each containing details about a variant of the prompt.
  final List<PromptVariant>? variants;

  GetPromptResponse({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.version,
    this.customerEncryptionKeyArn,
    this.defaultVariant,
    this.description,
    this.variants,
  });

  factory GetPromptResponse.fromJson(Map<String, dynamic> json) {
    return GetPromptResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      defaultVariant: json['defaultVariant'] as String?,
      description: json['description'] as String?,
      variants: (json['variants'] as List?)
          ?.nonNulls
          .map((e) => PromptVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final defaultVariant = this.defaultVariant;
    final description = this.description;
    final variants = this.variants;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'name': name,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (defaultVariant != null) 'defaultVariant': defaultVariant,
      if (description != null) 'description': description,
      if (variants != null) 'variants': variants,
    };
  }
}

/// Details about the guardrail associated with an agent.
class GuardrailConfiguration {
  /// The unique identifier of the guardrail.
  final String? guardrailIdentifier;

  /// The version of the guardrail.
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

/// Settings for hierarchical document chunking for a data source. Hierarchical
/// chunking splits documents into layers of chunks where the first layer
/// contains large chunks, and the second layer contains smaller chunks derived
/// from the first layer.
///
/// You configure the number of tokens to overlap, or repeat across adjacent
/// chunks. For example, if you set overlap tokens to 60, the last 60 tokens in
/// the first chunk are also included at the beginning of the second chunk. For
/// each layer, you must also configure the maximum number of tokens in a chunk.
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
      levelConfigurations: (json['levelConfigurations'] as List)
          .nonNulls
          .map((e) => HierarchicalChunkingLevelConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      overlapTokens: json['overlapTokens'] as int,
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

/// Token settings for a layer in a hierarchical chunking configuration.
class HierarchicalChunkingLevelConfiguration {
  /// The maximum number of tokens that a chunk can contain in this layer.
  final int maxTokens;

  HierarchicalChunkingLevelConfiguration({
    required this.maxTokens,
  });

  factory HierarchicalChunkingLevelConfiguration.fromJson(
      Map<String, dynamic> json) {
    return HierarchicalChunkingLevelConfiguration(
      maxTokens: json['maxTokens'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxTokens = this.maxTokens;
    return {
      'maxTokens': maxTokens,
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
          ?.nonNulls
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
      status: IngestionJobStatus.fromString((json['status'] as String)),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.nonNulls
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
      'status': status.value,
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
      'attribute': attribute.value,
      'operator': operator.value,
      'values': values,
    };
  }
}

enum IngestionJobFilterAttribute {
  status('STATUS'),
  ;

  final String value;

  const IngestionJobFilterAttribute(this.value);

  static IngestionJobFilterAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum IngestionJobFilterAttribute'));
}

enum IngestionJobFilterOperator {
  eq('EQ'),
  ;

  final String value;

  const IngestionJobFilterOperator(this.value);

  static IngestionJobFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum IngestionJobFilterOperator'));
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
      'attribute': attribute.value,
      'order': order.value,
    };
  }
}

enum IngestionJobSortByAttribute {
  status('STATUS'),
  startedAt('STARTED_AT'),
  ;

  final String value;

  const IngestionJobSortByAttribute(this.value);

  static IngestionJobSortByAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum IngestionJobSortByAttribute'));
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
  starting('STARTING'),
  inProgress('IN_PROGRESS'),
  complete('COMPLETE'),
  failed('FAILED'),
  ;

  final String value;

  const IngestionJobStatus(this.value);

  static IngestionJobStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum IngestionJobStatus'));
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
      status: IngestionJobStatus.fromString((json['status'] as String)),
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
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (statistics != null) 'statistics': statistics,
    };
  }
}

/// Contains configurations for the input flow node for a flow. This node takes
/// the input from flow invocation and passes it to the next node in the data
/// type that you specify.
class InputFlowNodeConfiguration {
  InputFlowNodeConfiguration();

  factory InputFlowNodeConfiguration.fromJson(Map<String, dynamic> _) {
    return InputFlowNodeConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A location for storing content from data sources temporarily as it is
/// processed by custom components in the ingestion pipeline.
class IntermediateStorage {
  /// An S3 bucket path.
  final S3Location s3Location;

  IntermediateStorage({
    required this.s3Location,
  });

  factory IntermediateStorage.fromJson(Map<String, dynamic> json) {
    return IntermediateStorage(
      s3Location:
          S3Location.fromJson(json['s3Location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      's3Location': s3Location,
    };
  }
}

/// Contains configurations for an iterator node in a flow. Takes an input that
/// is an array and iteratively sends each item of the array as an output to the
/// following node. The size of the array is also returned in the output.
///
/// The output flow node at the end of the flow iteration will return a response
/// for each member of the array. To return only one response, you can include a
/// collector node downstream from the iterator node.
class IteratorFlowNodeConfiguration {
  IteratorFlowNodeConfiguration();

  factory IteratorFlowNodeConfiguration.fromJson(Map<String, dynamic> _) {
    return IteratorFlowNodeConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
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
      status: KnowledgeBaseStatus.fromString((json['status'] as String)),
      storageConfiguration: StorageConfiguration.fromJson(
          json['storageConfiguration'] as Map<String, dynamic>),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.nonNulls
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
      'status': status.value,
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
      type: KnowledgeBaseType.fromString((json['type'] as String)),
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
      'type': type.value,
      if (vectorKnowledgeBaseConfiguration != null)
        'vectorKnowledgeBaseConfiguration': vectorKnowledgeBaseConfiguration,
    };
  }
}

/// Contains configurations for a knowledge base node in a flow. This node takes
/// a query as the input and returns, as the output, the retrieved responses
/// directly (as an array) or a response generated based on the retrieved
/// responses. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in Amazon Bedrock works</a> in the Amazon Bedrock User Guide.
class KnowledgeBaseFlowNodeConfiguration {
  /// The unique identifier of the knowledge base to query.
  final String knowledgeBaseId;

  /// The unique identifier of the model to use to generate a response from the
  /// query results. Omit this field if you want to return the retrieved results
  /// as an array.
  final String? modelId;

  KnowledgeBaseFlowNodeConfiguration({
    required this.knowledgeBaseId,
    this.modelId,
  });

  factory KnowledgeBaseFlowNodeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return KnowledgeBaseFlowNodeConfiguration(
      knowledgeBaseId: json['knowledgeBaseId'] as String,
      modelId: json['modelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final modelId = this.modelId;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      if (modelId != null) 'modelId': modelId,
    };
  }
}

enum KnowledgeBaseState {
  enabled('ENABLED'),
  disabled('DISABLED'),
  ;

  final String value;

  const KnowledgeBaseState(this.value);

  static KnowledgeBaseState fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum KnowledgeBaseState'));
}

enum KnowledgeBaseStatus {
  creating('CREATING'),
  active('ACTIVE'),
  deleting('DELETING'),
  updating('UPDATING'),
  failed('FAILED'),
  deleteUnsuccessful('DELETE_UNSUCCESSFUL'),
  ;

  final String value;

  const KnowledgeBaseStatus(this.value);

  static KnowledgeBaseStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum KnowledgeBaseStatus'));
}

enum KnowledgeBaseStorageType {
  opensearchServerless('OPENSEARCH_SERVERLESS'),
  pinecone('PINECONE'),
  redisEnterpriseCloud('REDIS_ENTERPRISE_CLOUD'),
  rds('RDS'),
  mongoDbAtlas('MONGO_DB_ATLAS'),
  ;

  final String value;

  const KnowledgeBaseStorageType(this.value);

  static KnowledgeBaseStorageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum KnowledgeBaseStorageType'));
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
      status: KnowledgeBaseStatus.fromString((json['status'] as String)),
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
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

enum KnowledgeBaseType {
  vector('VECTOR'),
  ;

  final String value;

  const KnowledgeBaseType(this.value);

  static KnowledgeBaseType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum KnowledgeBaseType'));
}

/// Contains configurations for a Lambda function node in the flow. You specify
/// the Lambda function to invoke and the inputs into the function. The output
/// is the response that is defined in the Lambda function. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in Amazon Bedrock works</a> in the Amazon Bedrock User Guide.
class LambdaFunctionFlowNodeConfiguration {
  /// The Amazon Resource Name (ARN) of the Lambda function to invoke.
  final String lambdaArn;

  LambdaFunctionFlowNodeConfiguration({
    required this.lambdaArn,
  });

  factory LambdaFunctionFlowNodeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionFlowNodeConfiguration(
      lambdaArn: json['lambdaArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    return {
      'lambdaArn': lambdaArn,
    };
  }
}

/// Contains configurations for a Lex node in the flow. You specify a Amazon Lex
/// bot to invoke. This node takes an utterance as the input and returns as the
/// output the intent identified by the Amazon Lex bot. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in Amazon Bedrock works</a> in the Amazon Bedrock User Guide.
class LexFlowNodeConfiguration {
  /// The Amazon Resource Name (ARN) of the Amazon Lex bot alias to invoke.
  final String botAliasArn;

  /// The Region to invoke the Amazon Lex bot in.
  final String localeId;

  LexFlowNodeConfiguration({
    required this.botAliasArn,
    required this.localeId,
  });

  factory LexFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return LexFlowNodeConfiguration(
      botAliasArn: json['botAliasArn'] as String,
      localeId: json['localeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasArn = this.botAliasArn;
    final localeId = this.localeId;
    return {
      'botAliasArn': botAliasArn,
      'localeId': localeId,
    };
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
          .nonNulls
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
          .nonNulls
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
          .nonNulls
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
          .nonNulls
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
          .nonNulls
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
          .nonNulls
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

class ListFlowAliasesResponse {
  /// A list, each member of which contains information about an alias.
  final List<FlowAliasSummary> flowAliasSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListFlowAliasesResponse({
    required this.flowAliasSummaries,
    this.nextToken,
  });

  factory ListFlowAliasesResponse.fromJson(Map<String, dynamic> json) {
    return ListFlowAliasesResponse(
      flowAliasSummaries: (json['flowAliasSummaries'] as List)
          .nonNulls
          .map((e) => FlowAliasSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowAliasSummaries = this.flowAliasSummaries;
    final nextToken = this.nextToken;
    return {
      'flowAliasSummaries': flowAliasSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFlowVersionsResponse {
  /// A list, each member of which contains information about a flow.
  final List<FlowVersionSummary> flowVersionSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListFlowVersionsResponse({
    required this.flowVersionSummaries,
    this.nextToken,
  });

  factory ListFlowVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListFlowVersionsResponse(
      flowVersionSummaries: (json['flowVersionSummaries'] as List)
          .nonNulls
          .map((e) => FlowVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowVersionSummaries = this.flowVersionSummaries;
    final nextToken = this.nextToken;
    return {
      'flowVersionSummaries': flowVersionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFlowsResponse {
  /// A list, each member of which contains information about a flow.
  final List<FlowSummary> flowSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListFlowsResponse({
    required this.flowSummaries,
    this.nextToken,
  });

  factory ListFlowsResponse.fromJson(Map<String, dynamic> json) {
    return ListFlowsResponse(
      flowSummaries: (json['flowSummaries'] as List)
          .nonNulls
          .map((e) => FlowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowSummaries = this.flowSummaries;
    final nextToken = this.nextToken;
    return {
      'flowSummaries': flowSummaries,
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
          .nonNulls
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

class ListPromptsResponse {
  /// A list, each member of which contains information about a prompt using
  /// Prompt management.
  final List<PromptSummary> promptSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListPromptsResponse({
    required this.promptSummaries,
    this.nextToken,
  });

  factory ListPromptsResponse.fromJson(Map<String, dynamic> json) {
    return ListPromptsResponse(
      promptSummaries: (json['promptSummaries'] as List)
          .nonNulls
          .map((e) => PromptSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final promptSummaries = this.promptSummaries;
    final nextToken = this.nextToken;
    return {
      'promptSummaries': promptSummaries,
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

/// Details of the memory configuration.
class MemoryConfiguration {
  /// The type of memory that is stored.
  final List<MemoryType> enabledMemoryTypes;

  /// The number of days the agent is configured to retain the conversational
  /// context.
  final int? storageDays;

  MemoryConfiguration({
    required this.enabledMemoryTypes,
    this.storageDays,
  });

  factory MemoryConfiguration.fromJson(Map<String, dynamic> json) {
    return MemoryConfiguration(
      enabledMemoryTypes: (json['enabledMemoryTypes'] as List)
          .nonNulls
          .map((e) => MemoryType.fromString((e as String)))
          .toList(),
      storageDays: json['storageDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledMemoryTypes = this.enabledMemoryTypes;
    final storageDays = this.storageDays;
    return {
      'enabledMemoryTypes': enabledMemoryTypes.map((e) => e.value).toList(),
      if (storageDays != null) 'storageDays': storageDays,
    };
  }
}

enum MemoryType {
  sessionSummary('SESSION_SUMMARY'),
  ;

  final String value;

  const MemoryType(this.value);

  static MemoryType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum MemoryType'));
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

/// Contains configurations for an output flow node in the flow. You specify the
/// data type expected for the input into the node in the <code>type</code>
/// field and how to return the final output in the <code>expression</code>
/// field.
class OutputFlowNodeConfiguration {
  OutputFlowNodeConfiguration();

  factory OutputFlowNodeConfiguration.fromJson(Map<String, dynamic> _) {
    return OutputFlowNodeConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
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
      type: Type.fromString((json['type'] as String)),
      description: json['description'] as String?,
      required: json['required'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final description = this.description;
    final required = this.required;
    return {
      'type': type.value,
      if (description != null) 'description': description,
      if (required != null) 'required': required,
    };
  }
}

/// Settings for parsing document contents. By default, the service converts the
/// contents of each document into text before splitting it into chunks. To
/// improve processing of PDF files with tables and images, you can configure
/// the data source to convert the pages of text into images and use a model to
/// describe the contents of each page.
///
/// To use a model to parse PDF documents, set the parsing strategy to
/// <code>BEDROCK_FOUNDATION_MODEL</code> and specify the model to use by ARN.
/// You can also override the default parsing prompt with instructions for how
/// to interpret images and tables in your documents. The following models are
/// supported.
///
/// <ul>
/// <li>
/// Anthropic Claude 3 Sonnet -
/// <code>anthropic.claude-3-sonnet-20240229-v1:0</code>
/// </li>
/// <li>
/// Anthropic Claude 3 Haiku -
/// <code>anthropic.claude-3-haiku-20240307-v1:0</code>
/// </li>
/// </ul>
/// You can get the ARN of a model with the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_ListFoundationModels.html">ListFoundationModels</a>
/// action. Standard model usage charges apply for the foundation model parsing
/// strategy.
class ParsingConfiguration {
  /// The parsing strategy for the data source.
  final ParsingStrategy parsingStrategy;

  /// Settings for a foundation model used to parse documents for a data source.
  final BedrockFoundationModelConfiguration?
      bedrockFoundationModelConfiguration;

  ParsingConfiguration({
    required this.parsingStrategy,
    this.bedrockFoundationModelConfiguration,
  });

  factory ParsingConfiguration.fromJson(Map<String, dynamic> json) {
    return ParsingConfiguration(
      parsingStrategy:
          ParsingStrategy.fromString((json['parsingStrategy'] as String)),
      bedrockFoundationModelConfiguration:
          json['bedrockFoundationModelConfiguration'] != null
              ? BedrockFoundationModelConfiguration.fromJson(
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

/// Instructions for interpreting the contents of a document.
class ParsingPrompt {
  /// Instructions for interpreting the contents of a document.
  final String parsingPromptText;

  ParsingPrompt({
    required this.parsingPromptText,
  });

  factory ParsingPrompt.fromJson(Map<String, dynamic> json) {
    return ParsingPrompt(
      parsingPromptText: json['parsingPromptText'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parsingPromptText = this.parsingPromptText;
    return {
      'parsingPromptText': parsingPromptText,
    };
  }
}

enum ParsingStrategy {
  bedrockFoundationModel('BEDROCK_FOUNDATION_MODEL'),
  ;

  final String value;

  const ParsingStrategy(this.value);

  static ParsingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ParsingStrategy'));
}

/// The specific filters applied to your data source content. You can filter out
/// or include certain content.
class PatternObjectFilter {
  /// The supported object type or content type of the data source.
  final String objectType;

  /// A list of one or more exclusion regular expression patterns to exclude
  /// certain object types that adhere to the pattern. If you specify an inclusion
  /// and exclusion filter/pattern and both match a document, the exclusion filter
  /// takes precedence and the document isn’t crawled.
  final List<String>? exclusionFilters;

  /// A list of one or more inclusion regular expression patterns to include
  /// certain object types that adhere to the pattern. If you specify an inclusion
  /// and exclusion filter/pattern and both match a document, the exclusion filter
  /// takes precedence and the document isn’t crawled.
  final List<String>? inclusionFilters;

  PatternObjectFilter({
    required this.objectType,
    this.exclusionFilters,
    this.inclusionFilters,
  });

  factory PatternObjectFilter.fromJson(Map<String, dynamic> json) {
    return PatternObjectFilter(
      objectType: json['objectType'] as String,
      exclusionFilters: (json['exclusionFilters'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      inclusionFilters: (json['inclusionFilters'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final objectType = this.objectType;
    final exclusionFilters = this.exclusionFilters;
    final inclusionFilters = this.inclusionFilters;
    return {
      'objectType': objectType,
      if (exclusionFilters != null) 'exclusionFilters': exclusionFilters,
      if (inclusionFilters != null) 'inclusionFilters': inclusionFilters,
    };
  }
}

/// The configuration of filtering certain objects or content types of the data
/// source.
class PatternObjectFilterConfiguration {
  /// The configuration of specific filters applied to your data source content.
  /// You can filter out or include certain content.
  final List<PatternObjectFilter> filters;

  PatternObjectFilterConfiguration({
    required this.filters,
  });

  factory PatternObjectFilterConfiguration.fromJson(Map<String, dynamic> json) {
    return PatternObjectFilterConfiguration(
      filters: (json['filters'] as List)
          .nonNulls
          .map((e) => PatternObjectFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    return {
      'filters': filters,
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
      agentStatus: AgentStatus.fromString((json['agentStatus'] as String)),
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
      'agentStatus': agentStatus.value,
      'agentVersion': agentVersion,
      'preparedAt': iso8601ToJson(preparedAt),
    };
  }
}

class PrepareFlowResponse {
  /// The unique identifier of the flow.
  final String id;

  /// The status of the flow. When you submit this request, the status will be
  /// <code>NotPrepared</code>. If preparation succeeds, the status becomes
  /// <code>Prepared</code>. If it fails, the status becomes <code>FAILED</code>.
  final FlowStatus status;

  PrepareFlowResponse({
    required this.id,
    required this.status,
  });

  factory PrepareFlowResponse.fromJson(Map<String, dynamic> json) {
    return PrepareFlowResponse(
      id: json['id'] as String,
      status: FlowStatus.fromString((json['status'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final status = this.status;
    return {
      'id': id,
      'status': status.value,
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
      parserMode: (json['parserMode'] as String?)?.let(CreationMode.fromString),
      promptCreationMode:
          (json['promptCreationMode'] as String?)?.let(CreationMode.fromString),
      promptState:
          (json['promptState'] as String?)?.let(PromptState.fromString),
      promptType: (json['promptType'] as String?)?.let(PromptType.fromString),
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
      if (parserMode != null) 'parserMode': parserMode.value,
      if (promptCreationMode != null)
        'promptCreationMode': promptCreationMode.value,
      if (promptState != null) 'promptState': promptState.value,
      if (promptType != null) 'promptType': promptType.value,
    };
  }
}

/// Contains configurations for a prompt node in the flow. You can use a prompt
/// from Prompt management or you can define one in this node. If the prompt
/// contains variables, the inputs into this node will fill in the variables.
/// The output from this node is the response generated by the model. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in Amazon Bedrock works</a> in the Amazon Bedrock User Guide.
class PromptFlowNodeConfiguration {
  /// Specifies whether the prompt is from Prompt management or defined inline.
  final PromptFlowNodeSourceConfiguration sourceConfiguration;

  PromptFlowNodeConfiguration({
    required this.sourceConfiguration,
  });

  factory PromptFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return PromptFlowNodeConfiguration(
      sourceConfiguration: PromptFlowNodeSourceConfiguration.fromJson(
          json['sourceConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceConfiguration = this.sourceConfiguration;
    return {
      'sourceConfiguration': sourceConfiguration,
    };
  }
}

/// Contains configurations for a prompt defined inline in the node.
class PromptFlowNodeInlineConfiguration {
  /// The unique identifier of the model to run inference with.
  final String modelId;

  /// Contains a prompt and variables in the prompt that can be replaced with
  /// values at runtime.
  final PromptTemplateConfiguration templateConfiguration;

  /// The type of prompt template.
  final PromptTemplateType templateType;

  /// Contains inference configurations for the prompt.
  final PromptInferenceConfiguration? inferenceConfiguration;

  PromptFlowNodeInlineConfiguration({
    required this.modelId,
    required this.templateConfiguration,
    required this.templateType,
    this.inferenceConfiguration,
  });

  factory PromptFlowNodeInlineConfiguration.fromJson(
      Map<String, dynamic> json) {
    return PromptFlowNodeInlineConfiguration(
      modelId: json['modelId'] as String,
      templateConfiguration: PromptTemplateConfiguration.fromJson(
          json['templateConfiguration'] as Map<String, dynamic>),
      templateType:
          PromptTemplateType.fromString((json['templateType'] as String)),
      inferenceConfiguration: json['inferenceConfiguration'] != null
          ? PromptInferenceConfiguration.fromJson(
              json['inferenceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelId = this.modelId;
    final templateConfiguration = this.templateConfiguration;
    final templateType = this.templateType;
    final inferenceConfiguration = this.inferenceConfiguration;
    return {
      'modelId': modelId,
      'templateConfiguration': templateConfiguration,
      'templateType': templateType.value,
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
    };
  }
}

/// Contains configurations for a prompt from Prompt management to use in a
/// node.
class PromptFlowNodeResourceConfiguration {
  /// The Amazon Resource Name (ARN) of the prompt from Prompt management.
  final String promptArn;

  PromptFlowNodeResourceConfiguration({
    required this.promptArn,
  });

  factory PromptFlowNodeResourceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return PromptFlowNodeResourceConfiguration(
      promptArn: json['promptArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final promptArn = this.promptArn;
    return {
      'promptArn': promptArn,
    };
  }
}

/// Contains configurations for a prompt and whether it is from Prompt
/// management or defined inline.
class PromptFlowNodeSourceConfiguration {
  /// Contains configurations for a prompt that is defined inline
  final PromptFlowNodeInlineConfiguration? inline;

  /// Contains configurations for a prompt from Prompt management.
  final PromptFlowNodeResourceConfiguration? resource;

  PromptFlowNodeSourceConfiguration({
    this.inline,
    this.resource,
  });

  factory PromptFlowNodeSourceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return PromptFlowNodeSourceConfiguration(
      inline: json['inline'] != null
          ? PromptFlowNodeInlineConfiguration.fromJson(
              json['inline'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? PromptFlowNodeResourceConfiguration.fromJson(
              json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inline = this.inline;
    final resource = this.resource;
    return {
      if (inline != null) 'inline': inline,
      if (resource != null) 'resource': resource,
    };
  }
}

/// Contains inference configurations for the prompt.
class PromptInferenceConfiguration {
  /// Contains inference configurations for a text prompt.
  final PromptModelInferenceConfiguration? text;

  PromptInferenceConfiguration({
    this.text,
  });

  factory PromptInferenceConfiguration.fromJson(Map<String, dynamic> json) {
    return PromptInferenceConfiguration(
      text: json['text'] != null
          ? PromptModelInferenceConfiguration.fromJson(
              json['text'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// Contains information about a variable in the prompt.
class PromptInputVariable {
  /// The name of the variable.
  final String? name;

  PromptInputVariable({
    this.name,
  });

  factory PromptInputVariable.fromJson(Map<String, dynamic> json) {
    return PromptInputVariable(
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }
}

/// Contains a key-value pair that defines a metadata tag and value to attach to
/// a prompt variant. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-create.html">Create
/// a prompt using Prompt management</a>.
class PromptMetadataEntry {
  /// The key of a metadata tag for a prompt variant.
  final String key;

  /// The value of a metadata tag for a prompt variant.
  final String value;

  PromptMetadataEntry({
    required this.key,
    required this.value,
  });

  factory PromptMetadataEntry.fromJson(Map<String, dynamic> json) {
    return PromptMetadataEntry(
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

/// Contains inference configurations related to model inference for a prompt.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/inference-parameters.html">Inference
/// parameters</a>.
class PromptModelInferenceConfiguration {
  /// The maximum number of tokens to return in the response.
  final int? maxTokens;

  /// A list of strings that define sequences after which the model will stop
  /// generating.
  final List<String>? stopSequences;

  /// Controls the randomness of the response. Choose a lower value for more
  /// predictable outputs and a higher value for more surprising outputs.
  final double? temperature;

  /// The number of most-likely candidates that the model considers for the next
  /// token during generation.
  final int? topK;

  /// The percentage of most-likely candidates that the model considers for the
  /// next token.
  final double? topP;

  PromptModelInferenceConfiguration({
    this.maxTokens,
    this.stopSequences,
    this.temperature,
    this.topK,
    this.topP,
  });

  factory PromptModelInferenceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return PromptModelInferenceConfiguration(
      maxTokens: json['maxTokens'] as int?,
      stopSequences: (json['stopSequences'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      temperature: json['temperature'] as double?,
      topK: json['topK'] as int?,
      topP: json['topP'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxTokens = this.maxTokens;
    final stopSequences = this.stopSequences;
    final temperature = this.temperature;
    final topK = this.topK;
    final topP = this.topP;
    return {
      if (maxTokens != null) 'maxTokens': maxTokens,
      if (stopSequences != null) 'stopSequences': stopSequences,
      if (temperature != null) 'temperature': temperature,
      if (topK != null) 'topK': topK,
      if (topP != null) 'topP': topP,
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
          .nonNulls
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
  enabled('ENABLED'),
  disabled('DISABLED'),
  ;

  final String value;

  const PromptState(this.value);

  static PromptState fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum PromptState'));
}

/// Contains information about a prompt in your Prompt management tool.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_ListPrompts.html#API_agent_ListPrompts_ResponseSyntax">ListPrompts
/// response</a>
/// </li>
/// </ul>
class PromptSummary {
  /// The Amazon Resource Name (ARN) of the prompt or the prompt version (if you
  /// specified a version in the request).
  final String arn;

  /// The time at which the prompt was created.
  final DateTime createdAt;

  /// The unique identifier of the prompt.
  final String id;

  /// The name of the prompt.
  final String name;

  /// The time at which the prompt was last updated.
  final DateTime updatedAt;

  /// The version of the prompt that this summary applies to.
  final String version;

  /// The description of the prompt.
  final String? description;

  PromptSummary({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.version,
    this.description,
  });

  factory PromptSummary.fromJson(Map<String, dynamic> json) {
    return PromptSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'name': name,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (description != null) 'description': description,
    };
  }
}

/// Contains the message for a prompt. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management.html">Prompt
/// management in Amazon Bedrock</a>.
class PromptTemplateConfiguration {
  /// Contains configurations for the text in a message for a prompt.
  final TextPromptTemplateConfiguration? text;

  PromptTemplateConfiguration({
    this.text,
  });

  factory PromptTemplateConfiguration.fromJson(Map<String, dynamic> json) {
    return PromptTemplateConfiguration(
      text: json['text'] != null
          ? TextPromptTemplateConfiguration.fromJson(
              json['text'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

enum PromptTemplateType {
  text('TEXT'),
  ;

  final String value;

  const PromptTemplateType(this.value);

  static PromptTemplateType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PromptTemplateType'));
}

enum PromptType {
  preProcessing('PRE_PROCESSING'),
  orchestration('ORCHESTRATION'),
  postProcessing('POST_PROCESSING'),
  knowledgeBaseResponseGeneration('KNOWLEDGE_BASE_RESPONSE_GENERATION'),
  ;

  final String value;

  const PromptType(this.value);

  static PromptType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum PromptType'));
}

/// Contains details about a variant of the prompt.
class PromptVariant {
  /// The name of the prompt variant.
  final String name;

  /// The type of prompt template to use.
  final PromptTemplateType templateType;

  /// Contains inference configurations for the prompt variant.
  final PromptInferenceConfiguration? inferenceConfiguration;

  /// An array of objects, each containing a key-value pair that defines a
  /// metadata tag and value to attach to a prompt variant. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-create.html">Create
  /// a prompt using Prompt management</a>.
  final List<PromptMetadataEntry>? metadata;

  /// The unique identifier of the model with which to run inference on the
  /// prompt.
  final String? modelId;

  /// Contains configurations for the prompt template.
  final PromptTemplateConfiguration? templateConfiguration;

  PromptVariant({
    required this.name,
    required this.templateType,
    this.inferenceConfiguration,
    this.metadata,
    this.modelId,
    this.templateConfiguration,
  });

  factory PromptVariant.fromJson(Map<String, dynamic> json) {
    return PromptVariant(
      name: json['name'] as String,
      templateType:
          PromptTemplateType.fromString((json['templateType'] as String)),
      inferenceConfiguration: json['inferenceConfiguration'] != null
          ? PromptInferenceConfiguration.fromJson(
              json['inferenceConfiguration'] as Map<String, dynamic>)
          : null,
      metadata: (json['metadata'] as List?)
          ?.nonNulls
          .map((e) => PromptMetadataEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelId: json['modelId'] as String?,
      templateConfiguration: json['templateConfiguration'] != null
          ? PromptTemplateConfiguration.fromJson(
              json['templateConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final templateType = this.templateType;
    final inferenceConfiguration = this.inferenceConfiguration;
    final metadata = this.metadata;
    final modelId = this.modelId;
    final templateConfiguration = this.templateConfiguration;
    return {
      'name': name,
      'templateType': templateType.value,
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
      if (metadata != null) 'metadata': metadata,
      if (modelId != null) 'modelId': modelId,
      if (templateConfiguration != null)
        'templateConfiguration': templateConfiguration,
    };
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

/// ENUM to check if action requires user confirmation
enum RequireConfirmation {
  enabled('ENABLED'),
  disabled('DISABLED'),
  ;

  final String value;

  const RequireConfirmation(this.value);

  static RequireConfirmation fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RequireConfirmation'));
}

/// Contains configurations for a Retrieval node in a flow. This node retrieves
/// data from the Amazon S3 location that you specify and returns it as the
/// output.
class RetrievalFlowNodeConfiguration {
  /// Contains configurations for the service to use for retrieving data to return
  /// as the output from the node.
  final RetrievalFlowNodeServiceConfiguration serviceConfiguration;

  RetrievalFlowNodeConfiguration({
    required this.serviceConfiguration,
  });

  factory RetrievalFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return RetrievalFlowNodeConfiguration(
      serviceConfiguration: RetrievalFlowNodeServiceConfiguration.fromJson(
          json['serviceConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceConfiguration = this.serviceConfiguration;
    return {
      'serviceConfiguration': serviceConfiguration,
    };
  }
}

/// Contains configurations for the Amazon S3 location from which to retrieve
/// data to return as the output from the node.
class RetrievalFlowNodeS3Configuration {
  /// The name of the Amazon S3 bucket from which to retrieve data.
  final String bucketName;

  RetrievalFlowNodeS3Configuration({
    required this.bucketName,
  });

  factory RetrievalFlowNodeS3Configuration.fromJson(Map<String, dynamic> json) {
    return RetrievalFlowNodeS3Configuration(
      bucketName: json['bucketName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    return {
      'bucketName': bucketName,
    };
  }
}

/// Contains configurations for the service to use for retrieving data to return
/// as the output from the node.
class RetrievalFlowNodeServiceConfiguration {
  /// Contains configurations for the Amazon S3 location from which to retrieve
  /// data to return as the output from the node.
  final RetrievalFlowNodeS3Configuration? s3;

  RetrievalFlowNodeServiceConfiguration({
    this.s3,
  });

  factory RetrievalFlowNodeServiceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RetrievalFlowNodeServiceConfiguration(
      s3: json['s3'] != null
          ? RetrievalFlowNodeS3Configuration.fromJson(
              json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 's3': s3,
    };
  }
}

/// The configuration information to connect to Amazon S3 as your data source.
class S3DataSourceConfiguration {
  /// The Amazon Resource Name (ARN) of the S3 bucket that contains your data.
  final String bucketArn;

  /// The account ID for the owner of the S3 bucket.
  final String? bucketOwnerAccountId;

  /// A list of S3 prefixes to include certain files or content. For more
  /// information, see <a
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
          ?.nonNulls
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

/// The identifier information for an Amazon S3 bucket.
class S3Identifier {
  /// The name of the S3 bucket.
  final String? s3BucketName;

  /// The S3 object key for the S3 resource.
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

/// An Amazon S3 location.
class S3Location {
  /// The location's URI. For example,
  /// <code>s3://my-bucket/chunk-processor/</code>.
  final String uri;

  S3Location({
    required this.uri,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      uri: json['uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'uri': uri,
    };
  }
}

enum SalesforceAuthType {
  oauth2ClientCredentials('OAUTH2_CLIENT_CREDENTIALS'),
  ;

  final String value;

  const SalesforceAuthType(this.value);

  static SalesforceAuthType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SalesforceAuthType'));
}

/// The configuration of the Salesforce content. For example, configuring
/// specific types of Salesforce content.
class SalesforceCrawlerConfiguration {
  /// The configuration of filtering the Salesforce content. For example,
  /// configuring regular expression patterns to include or exclude certain
  /// content.
  final CrawlFilterConfiguration? filterConfiguration;

  SalesforceCrawlerConfiguration({
    this.filterConfiguration,
  });

  factory SalesforceCrawlerConfiguration.fromJson(Map<String, dynamic> json) {
    return SalesforceCrawlerConfiguration(
      filterConfiguration: json['filterConfiguration'] != null
          ? CrawlFilterConfiguration.fromJson(
              json['filterConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filterConfiguration = this.filterConfiguration;
    return {
      if (filterConfiguration != null)
        'filterConfiguration': filterConfiguration,
    };
  }
}

/// The configuration information to connect to Salesforce as your data source.
class SalesforceDataSourceConfiguration {
  /// The endpoint information to connect to your Salesforce data source.
  final SalesforceSourceConfiguration sourceConfiguration;

  /// The configuration of the Salesforce content. For example, configuring
  /// specific types of Salesforce content.
  final SalesforceCrawlerConfiguration? crawlerConfiguration;

  SalesforceDataSourceConfiguration({
    required this.sourceConfiguration,
    this.crawlerConfiguration,
  });

  factory SalesforceDataSourceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SalesforceDataSourceConfiguration(
      sourceConfiguration: SalesforceSourceConfiguration.fromJson(
          json['sourceConfiguration'] as Map<String, dynamic>),
      crawlerConfiguration: json['crawlerConfiguration'] != null
          ? SalesforceCrawlerConfiguration.fromJson(
              json['crawlerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceConfiguration = this.sourceConfiguration;
    final crawlerConfiguration = this.crawlerConfiguration;
    return {
      'sourceConfiguration': sourceConfiguration,
      if (crawlerConfiguration != null)
        'crawlerConfiguration': crawlerConfiguration,
    };
  }
}

/// The endpoint information to connect to your Salesforce data source.
class SalesforceSourceConfiguration {
  /// The supported authentication type to authenticate and connect to your
  /// Salesforce instance.
  final SalesforceAuthType authType;

  /// The Amazon Resource Name of an Secrets Manager secret that stores your
  /// authentication credentials for your Salesforce instance URL. For more
  /// information on the key-value pairs that must be included in your secret,
  /// depending on your authentication type, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/salesforce-data-source-connector.html#configuration-salesforce-connector">Salesforce
  /// connection configuration</a>.
  final String credentialsSecretArn;

  /// The Salesforce host URL or instance URL.
  final String hostUrl;

  SalesforceSourceConfiguration({
    required this.authType,
    required this.credentialsSecretArn,
    required this.hostUrl,
  });

  factory SalesforceSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return SalesforceSourceConfiguration(
      authType: SalesforceAuthType.fromString((json['authType'] as String)),
      credentialsSecretArn: json['credentialsSecretArn'] as String,
      hostUrl: json['hostUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final authType = this.authType;
    final credentialsSecretArn = this.credentialsSecretArn;
    final hostUrl = this.hostUrl;
    return {
      'authType': authType.value,
      'credentialsSecretArn': credentialsSecretArn,
      'hostUrl': hostUrl,
    };
  }
}

/// The seed or starting point URL. You should be authorized to crawl the URL.
class SeedUrl {
  /// A seed or starting point URL.
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

/// Settings for semantic document chunking for a data source. Semantic chunking
/// splits a document into into smaller documents based on groups of similar
/// content derived from the text with natural language processing.
///
/// With semantic chunking, each sentence is compared to the next to determine
/// how similar they are. You specify a threshold in the form of a percentile,
/// where adjacent sentences that are less similar than that percentage of
/// sentence pairs are divided into separate chunks. For example, if you set the
/// threshold to 90, then the 10 percent of sentence pairs that are least
/// similar are split. So if you have 101 sentences, 100 sentence pairs are
/// compared, and the 10 with the least similarity are split, creating 11
/// chunks. These chunks are further split if they exceed the max token size.
///
/// You must also specify a buffer size, which determines whether sentences are
/// compared in isolation, or within a moving context window that includes the
/// previous and following sentence. For example, if you set the buffer size to
/// <code>1</code>, the embedding for sentence 10 is derived from sentences 9,
/// 10, and 11 combined.
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
          json['breakpointPercentileThreshold'] as int,
      bufferSize: json['bufferSize'] as int,
      maxTokens: json['maxTokens'] as int,
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

enum SharePointAuthType {
  oauth2ClientCredentials('OAUTH2_CLIENT_CREDENTIALS'),
  ;

  final String value;

  const SharePointAuthType(this.value);

  static SharePointAuthType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SharePointAuthType'));
}

/// The configuration of the SharePoint content. For example, configuring
/// specific types of SharePoint content.
class SharePointCrawlerConfiguration {
  /// The configuration of filtering the SharePoint content. For example,
  /// configuring regular expression patterns to include or exclude certain
  /// content.
  final CrawlFilterConfiguration? filterConfiguration;

  SharePointCrawlerConfiguration({
    this.filterConfiguration,
  });

  factory SharePointCrawlerConfiguration.fromJson(Map<String, dynamic> json) {
    return SharePointCrawlerConfiguration(
      filterConfiguration: json['filterConfiguration'] != null
          ? CrawlFilterConfiguration.fromJson(
              json['filterConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filterConfiguration = this.filterConfiguration;
    return {
      if (filterConfiguration != null)
        'filterConfiguration': filterConfiguration,
    };
  }
}

/// The configuration information to connect to SharePoint as your data source.
class SharePointDataSourceConfiguration {
  /// The endpoint information to connect to your SharePoint data source.
  final SharePointSourceConfiguration sourceConfiguration;

  /// The configuration of the SharePoint content. For example, configuring
  /// specific types of SharePoint content.
  final SharePointCrawlerConfiguration? crawlerConfiguration;

  SharePointDataSourceConfiguration({
    required this.sourceConfiguration,
    this.crawlerConfiguration,
  });

  factory SharePointDataSourceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SharePointDataSourceConfiguration(
      sourceConfiguration: SharePointSourceConfiguration.fromJson(
          json['sourceConfiguration'] as Map<String, dynamic>),
      crawlerConfiguration: json['crawlerConfiguration'] != null
          ? SharePointCrawlerConfiguration.fromJson(
              json['crawlerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceConfiguration = this.sourceConfiguration;
    final crawlerConfiguration = this.crawlerConfiguration;
    return {
      'sourceConfiguration': sourceConfiguration,
      if (crawlerConfiguration != null)
        'crawlerConfiguration': crawlerConfiguration,
    };
  }
}

enum SharePointHostType {
  online('ONLINE'),
  ;

  final String value;

  const SharePointHostType(this.value);

  static SharePointHostType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SharePointHostType'));
}

/// The endpoint information to connect to your SharePoint data source.
class SharePointSourceConfiguration {
  /// The supported authentication type to authenticate and connect to your
  /// SharePoint site/sites.
  final SharePointAuthType authType;

  /// The Amazon Resource Name of an Secrets Manager secret that stores your
  /// authentication credentials for your SharePoint site/sites. For more
  /// information on the key-value pairs that must be included in your secret,
  /// depending on your authentication type, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sharepoint-data-source-connector.html#configuration-sharepoint-connector">SharePoint
  /// connection configuration</a>.
  final String credentialsSecretArn;

  /// The domain of your SharePoint instance or site URL/URLs.
  final String domain;

  /// The supported host type, whether online/cloud or server/on-premises.
  final SharePointHostType hostType;

  /// A list of one or more SharePoint site URLs.
  final List<String> siteUrls;

  /// The identifier of your Microsoft 365 tenant.
  final String? tenantId;

  SharePointSourceConfiguration({
    required this.authType,
    required this.credentialsSecretArn,
    required this.domain,
    required this.hostType,
    required this.siteUrls,
    this.tenantId,
  });

  factory SharePointSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return SharePointSourceConfiguration(
      authType: SharePointAuthType.fromString((json['authType'] as String)),
      credentialsSecretArn: json['credentialsSecretArn'] as String,
      domain: json['domain'] as String,
      hostType: SharePointHostType.fromString((json['hostType'] as String)),
      siteUrls:
          (json['siteUrls'] as List).nonNulls.map((e) => e as String).toList(),
      tenantId: json['tenantId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authType = this.authType;
    final credentialsSecretArn = this.credentialsSecretArn;
    final domain = this.domain;
    final hostType = this.hostType;
    final siteUrls = this.siteUrls;
    final tenantId = this.tenantId;
    return {
      'authType': authType.value,
      'credentialsSecretArn': credentialsSecretArn,
      'domain': domain,
      'hostType': hostType.value,
      'siteUrls': siteUrls,
      if (tenantId != null) 'tenantId': tenantId,
    };
  }
}

enum SortOrder {
  ascending('ASCENDING'),
  descending('DESCENDING'),
  ;

  final String value;

  const SortOrder(this.value);

  static SortOrder fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SortOrder'));
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

enum StepType {
  postChunking('POST_CHUNKING'),
  ;

  final String value;

  const StepType(this.value);

  static StepType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum StepType'));
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
      type: KnowledgeBaseStorageType.fromString((json['type'] as String)),
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
      'type': type.value,
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

/// Contains configurations for a Storage node in a flow. This node stores the
/// input in an Amazon S3 location that you specify.
class StorageFlowNodeConfiguration {
  /// Contains configurations for the service to use for storing the input into
  /// the node.
  final StorageFlowNodeServiceConfiguration serviceConfiguration;

  StorageFlowNodeConfiguration({
    required this.serviceConfiguration,
  });

  factory StorageFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return StorageFlowNodeConfiguration(
      serviceConfiguration: StorageFlowNodeServiceConfiguration.fromJson(
          json['serviceConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceConfiguration = this.serviceConfiguration;
    return {
      'serviceConfiguration': serviceConfiguration,
    };
  }
}

/// Contains configurations for the Amazon S3 location in which to store the
/// input into the node.
class StorageFlowNodeS3Configuration {
  /// The name of the Amazon S3 bucket in which to store the input into the node.
  final String bucketName;

  StorageFlowNodeS3Configuration({
    required this.bucketName,
  });

  factory StorageFlowNodeS3Configuration.fromJson(Map<String, dynamic> json) {
    return StorageFlowNodeS3Configuration(
      bucketName: json['bucketName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    return {
      'bucketName': bucketName,
    };
  }
}

/// Contains configurations for the service to use for storing the input into
/// the node.
class StorageFlowNodeServiceConfiguration {
  /// Contains configurations for the Amazon S3 location in which to store the
  /// input into the node.
  final StorageFlowNodeS3Configuration? s3;

  StorageFlowNodeServiceConfiguration({
    this.s3,
  });

  factory StorageFlowNodeServiceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return StorageFlowNodeServiceConfiguration(
      s3: json['s3'] != null
          ? StorageFlowNodeS3Configuration.fromJson(
              json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 's3': s3,
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

/// Contains configurations for a text prompt template. To include a variable,
/// enclose a word in double curly braces as in <code>{{variable}}</code>.
class TextPromptTemplateConfiguration {
  /// The message for the prompt.
  final String text;

  /// An array of the variables in the prompt template.
  final List<PromptInputVariable>? inputVariables;

  TextPromptTemplateConfiguration({
    required this.text,
    this.inputVariables,
  });

  factory TextPromptTemplateConfiguration.fromJson(Map<String, dynamic> json) {
    return TextPromptTemplateConfiguration(
      text: json['text'] as String,
      inputVariables: (json['inputVariables'] as List?)
          ?.nonNulls
          .map((e) => PromptInputVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final inputVariables = this.inputVariables;
    return {
      'text': text,
      if (inputVariables != null) 'inputVariables': inputVariables,
    };
  }
}

/// A custom processing step for documents moving through a data source
/// ingestion pipeline. To process documents after they have been converted into
/// chunks, set the step to apply to <code>POST_CHUNKING</code>.
class Transformation {
  /// When the service applies the transformation.
  final StepType stepToApply;

  /// A Lambda function that processes documents.
  final TransformationFunction transformationFunction;

  Transformation({
    required this.stepToApply,
    required this.transformationFunction,
  });

  factory Transformation.fromJson(Map<String, dynamic> json) {
    return Transformation(
      stepToApply: StepType.fromString((json['stepToApply'] as String)),
      transformationFunction: TransformationFunction.fromJson(
          json['transformationFunction'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final stepToApply = this.stepToApply;
    final transformationFunction = this.transformationFunction;
    return {
      'stepToApply': stepToApply.value,
      'transformationFunction': transformationFunction,
    };
  }
}

/// A Lambda function that processes documents.
class TransformationFunction {
  /// The Lambda function.
  final TransformationLambdaConfiguration transformationLambdaConfiguration;

  TransformationFunction({
    required this.transformationLambdaConfiguration,
  });

  factory TransformationFunction.fromJson(Map<String, dynamic> json) {
    return TransformationFunction(
      transformationLambdaConfiguration:
          TransformationLambdaConfiguration.fromJson(
              json['transformationLambdaConfiguration']
                  as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final transformationLambdaConfiguration =
        this.transformationLambdaConfiguration;
    return {
      'transformationLambdaConfiguration': transformationLambdaConfiguration,
    };
  }
}

/// A Lambda function that processes documents.
class TransformationLambdaConfiguration {
  /// The function's ARN identifier.
  final String lambdaArn;

  TransformationLambdaConfiguration({
    required this.lambdaArn,
  });

  factory TransformationLambdaConfiguration.fromJson(
      Map<String, dynamic> json) {
    return TransformationLambdaConfiguration(
      lambdaArn: json['lambdaArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    return {
      'lambdaArn': lambdaArn,
    };
  }
}

enum Type {
  string('string'),
  number('number'),
  integer('integer'),
  boolean('boolean'),
  array('array'),
  ;

  final String value;

  const Type(this.value);

  static Type fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Type'));
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

class UpdateFlowAliasResponse {
  /// The Amazon Resource Name (ARN) of the flow.
  final String arn;

  /// The time at which the flow was created.
  final DateTime createdAt;

  /// The unique identifier of the flow.
  final String flowId;

  /// The unique identifier of the alias.
  final String id;

  /// The name of the alias.
  final String name;

  /// Contains information about the version that the alias is mapped to.
  final List<FlowAliasRoutingConfigurationListItem> routingConfiguration;

  /// The time at which the alias was last updated.
  final DateTime updatedAt;

  /// The description of the flow.
  final String? description;

  UpdateFlowAliasResponse({
    required this.arn,
    required this.createdAt,
    required this.flowId,
    required this.id,
    required this.name,
    required this.routingConfiguration,
    required this.updatedAt,
    this.description,
  });

  factory UpdateFlowAliasResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowAliasResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      flowId: json['flowId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      routingConfiguration: (json['routingConfiguration'] as List)
          .nonNulls
          .map((e) => FlowAliasRoutingConfigurationListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final flowId = this.flowId;
    final id = this.id;
    final name = this.name;
    final routingConfiguration = this.routingConfiguration;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'flowId': flowId,
      'id': id,
      'name': name,
      'routingConfiguration': routingConfiguration,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

class UpdateFlowResponse {
  /// The Amazon Resource Name (ARN) of the flow.
  final String arn;

  /// The time at which the flow was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the service role with permissions to
  /// create a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-permissions.html">Create
  /// a service role for flows in Amazon Bedrock</a> in the Amazon Bedrock User
  /// Guide.
  final String executionRoleArn;

  /// The unique identifier of the flow.
  final String id;

  /// The name of the flow.
  final String name;

  /// The status of the flow. When you submit this request, the status will be
  /// <code>NotPrepared</code>. If updating fails, the status becomes
  /// <code>Failed</code>.
  final FlowStatus status;

  /// The time at which the flow was last updated.
  final DateTime updatedAt;

  /// The version of the flow. When you update a flow, the version updated is the
  /// <code>DRAFT</code> version.
  final String version;

  /// The Amazon Resource Name (ARN) of the KMS key that the flow was encrypted
  /// with.
  final String? customerEncryptionKeyArn;

  /// A definition of the nodes and the connections between nodes in the flow.
  final FlowDefinition? definition;

  /// The description of the flow.
  final String? description;

  UpdateFlowResponse({
    required this.arn,
    required this.createdAt,
    required this.executionRoleArn,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    required this.version,
    this.customerEncryptionKeyArn,
    this.definition,
    this.description,
  });

  factory UpdateFlowResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      executionRoleArn: json['executionRoleArn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: FlowStatus.fromString((json['status'] as String)),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      definition: json['definition'] != null
          ? FlowDefinition.fromJson(json['definition'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final executionRoleArn = this.executionRoleArn;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final definition = this.definition;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'executionRoleArn': executionRoleArn,
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (definition != null) 'definition': definition,
      if (description != null) 'description': description,
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

class UpdatePromptResponse {
  /// The Amazon Resource Name (ARN) of the prompt.
  final String arn;

  /// The time at which the prompt was created.
  final DateTime createdAt;

  /// The unique identifier of the prompt.
  final String id;

  /// The name of the prompt.
  final String name;

  /// The time at which the prompt was last updated.
  final DateTime updatedAt;

  /// The version of the prompt. When you update a prompt, the version updated is
  /// the <code>DRAFT</code> version.
  final String version;

  /// The Amazon Resource Name (ARN) of the KMS key to encrypt the prompt.
  final String? customerEncryptionKeyArn;

  /// The name of the default variant for the prompt. This value must match the
  /// <code>name</code> field in the relevant <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptVariant.html">PromptVariant</a>
  /// object.
  final String? defaultVariant;

  /// The description of the prompt.
  final String? description;

  /// A list of objects, each containing details about a variant of the prompt.
  final List<PromptVariant>? variants;

  UpdatePromptResponse({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.version,
    this.customerEncryptionKeyArn,
    this.defaultVariant,
    this.description,
    this.variants,
  });

  factory UpdatePromptResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePromptResponse(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
      defaultVariant: json['defaultVariant'] as String?,
      description: json['description'] as String?,
      variants: (json['variants'] as List?)
          ?.nonNulls
          .map((e) => PromptVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final defaultVariant = this.defaultVariant;
    final description = this.description;
    final variants = this.variants;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'name': name,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (defaultVariant != null) 'defaultVariant': defaultVariant,
      if (description != null) 'description': description,
      if (variants != null) 'variants': variants,
    };
  }
}

/// The configuration of web URLs that you want to crawl. You should be
/// authorized to crawl the URLs.
class UrlConfiguration {
  /// One or more seed or starting point URLs.
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

/// Contains details about how to ingest the documents in a data source.
class VectorIngestionConfiguration {
  /// Details about how to chunk the documents in the data source. A <i>chunk</i>
  /// refers to an excerpt from a data source that is returned when the knowledge
  /// base that it belongs to is queried.
  final ChunkingConfiguration? chunkingConfiguration;

  /// A custom document transformer for parsed data source documents.
  final CustomTransformationConfiguration? customTransformationConfiguration;

  /// A custom parser for data source documents.
  final ParsingConfiguration? parsingConfiguration;

  VectorIngestionConfiguration({
    this.chunkingConfiguration,
    this.customTransformationConfiguration,
    this.parsingConfiguration,
  });

  factory VectorIngestionConfiguration.fromJson(Map<String, dynamic> json) {
    return VectorIngestionConfiguration(
      chunkingConfiguration: json['chunkingConfiguration'] != null
          ? ChunkingConfiguration.fromJson(
              json['chunkingConfiguration'] as Map<String, dynamic>)
          : null,
      customTransformationConfiguration:
          json['customTransformationConfiguration'] != null
              ? CustomTransformationConfiguration.fromJson(
                  json['customTransformationConfiguration']
                      as Map<String, dynamic>)
              : null,
      parsingConfiguration: json['parsingConfiguration'] != null
          ? ParsingConfiguration.fromJson(
              json['parsingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final chunkingConfiguration = this.chunkingConfiguration;
    final customTransformationConfiguration =
        this.customTransformationConfiguration;
    final parsingConfiguration = this.parsingConfiguration;
    return {
      if (chunkingConfiguration != null)
        'chunkingConfiguration': chunkingConfiguration,
      if (customTransformationConfiguration != null)
        'customTransformationConfiguration': customTransformationConfiguration,
      if (parsingConfiguration != null)
        'parsingConfiguration': parsingConfiguration,
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

/// The configuration of web URLs that you want to crawl. You should be
/// authorized to crawl the URLs.
class WebCrawlerConfiguration {
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

  /// The scope of what is crawled for your URLs.
  ///
  /// You can choose to crawl only web pages that belong to the same host or
  /// primary domain. For example, only web pages that contain the seed URL
  /// "https://docs.aws.amazon.com/bedrock/latest/userguide/" and no other
  /// domains. You can choose to include sub domains in addition to the host or
  /// primary domain. For example, web pages that contain "aws.amazon.com" can
  /// also include sub domain "docs.aws.amazon.com".
  final WebScopeType? scope;

  WebCrawlerConfiguration({
    this.crawlerLimits,
    this.exclusionFilters,
    this.inclusionFilters,
    this.scope,
  });

  factory WebCrawlerConfiguration.fromJson(Map<String, dynamic> json) {
    return WebCrawlerConfiguration(
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
    final crawlerLimits = this.crawlerLimits;
    final exclusionFilters = this.exclusionFilters;
    final inclusionFilters = this.inclusionFilters;
    final scope = this.scope;
    return {
      if (crawlerLimits != null) 'crawlerLimits': crawlerLimits,
      if (exclusionFilters != null) 'exclusionFilters': exclusionFilters,
      if (inclusionFilters != null) 'inclusionFilters': inclusionFilters,
      if (scope != null) 'scope': scope.value,
    };
  }
}

/// The rate limits for the URLs that you want to crawl. You should be
/// authorized to crawl the URLs.
class WebCrawlerLimits {
  /// The max rate at which pages are crawled, up to 300 per minute per host.
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

/// The configuration details for the web data source.
class WebDataSourceConfiguration {
  /// The source configuration details for the web data source.
  final WebSourceConfiguration sourceConfiguration;

  /// The Web Crawler configuration details for the web data source.
  final WebCrawlerConfiguration? crawlerConfiguration;

  WebDataSourceConfiguration({
    required this.sourceConfiguration,
    this.crawlerConfiguration,
  });

  factory WebDataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return WebDataSourceConfiguration(
      sourceConfiguration: WebSourceConfiguration.fromJson(
          json['sourceConfiguration'] as Map<String, dynamic>),
      crawlerConfiguration: json['crawlerConfiguration'] != null
          ? WebCrawlerConfiguration.fromJson(
              json['crawlerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceConfiguration = this.sourceConfiguration;
    final crawlerConfiguration = this.crawlerConfiguration;
    return {
      'sourceConfiguration': sourceConfiguration,
      if (crawlerConfiguration != null)
        'crawlerConfiguration': crawlerConfiguration,
    };
  }
}

enum WebScopeType {
  hostOnly('HOST_ONLY'),
  subdomains('SUBDOMAINS'),
  ;

  final String value;

  const WebScopeType(this.value);

  static WebScopeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum WebScopeType'));
}

/// The configuration of the URL/URLs for the web content that you want to
/// crawl. You should be authorized to crawl the URLs.
class WebSourceConfiguration {
  /// The configuration of the URL/URLs.
  final UrlConfiguration urlConfiguration;

  WebSourceConfiguration({
    required this.urlConfiguration,
  });

  factory WebSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return WebSourceConfiguration(
      urlConfiguration: UrlConfiguration.fromJson(
          json['urlConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final urlConfiguration = this.urlConfiguration;
    return {
      'urlConfiguration': urlConfiguration,
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
